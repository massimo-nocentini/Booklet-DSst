"
""

# Critical resources in replication

Status: 2022-09-07, 18:40

## Space requirements of files

High-performance persistent storage for documents will be available on a
limited basis per site.

## Bandwidth for uploads

Replicating a document file requires only a single upload even if the file
needs to be distributed across multiple sites, each site then fetches the file
via download. Nevertheless, the upload rate of a site is a bottleneck
especially when document files of gigabyte size need to be replicated: Without
special precautions for prioritization, even small but relevant files may only
become available at the target sites with a considerable delay, provided that
there happen to be some less relevant, large files to be replicated at the same
time.

It should also be noted that each individual database command from the
ReplicationLog must also be transferred via upload. The database commands
should have clear priority over file transfers, since the former represent
relevant state changes from the point of view of the business logic.

# Possible solutions

## Space requirements of files

In addition to the limited, high-performance storage, sufficient inexpensive
mass storage should also be available at each site. A site-specific decision as
to which proportion of documents should end up in the limited high-performance
storage and which in the inexpensive mass storage can be made, for example, on
the basis of a generally available configuration.

Each project needs to know those site numbers for which this project is only
slightly relevant (e.g. in the JSON data from `ccproject.attributes`). This
relevance criterion can be used internally in the application to override
the `driveletter assignment` (`ccfile.driveletters`) of a file on a site-specific
basis. Such an override is only needed at the moment when the transfer service
of the so-called delta server requests the drive letter for a concrete transfer,
as before via the call of a database function. This makes the override
completely transparent, especially for the functionality of the database
commands, i.e. the content of the column `ccfile.driveletters` remains
identical across all replicated data, as does the content
of `ccproject.attributes`.

A relevance criterion used in this way is thus suitable for neutralizing the
problem of the high space requirement: Even in a Raid array, 10TB can be
provided for less than 1000€.

For the case of a change of the project relevance with already existing data an
internal function is needed, which moves document files on a location of the
high-performance memory into the inexpensive mass memory and/or vice versa. It
should be noted that only after all affected data has been successfully moved,
the pending configuration change may be saved. It must also be ensured that no
affected files are changed or new files are added during the move. These
requirements are considered to be outside the responsibility of the database or
the replication.


## Bandwidth for uploads

Each database command to be replicated contains at least one JSON string that
must be replicated via upload (technically mapped as an attachment in
ApptiveGrid). If document files are also involved, these must each be
replicated via an additional upload. In the previous concept of replication,
all uploads to an entry in table `replicationlog` were considered atomic:
Specifically, the download URLs to attached document files required for the
opposite side of the replication were only available after the upload had been
completed. In this respect, it seemed sensible to first upload the document
files and then create the complete entry in the cloud database.

If, on the other hand, you want to use the available upload bandwidth as
efficiently as possible and not have short commands waiting because of
individual very large uploads, it makes sense to transfer the pure command
information to the cloud as a priority. For this purpose, it is necessary to
split a logical replication step into several physical calls if additional file
attachments are involved.

On the receiver side, the pure replication of the database command can always
be executed immediately. The reception of the file attachments must be handled
asynchronously in each case as described in the next subsection.


## Replication services

For further consideration, a distinction is made between two types of
replication services:

- The replication service for outgoing data (`RSO`) becomes active as soon as
  there is a new entry in table `replicationlog` in the local database of PDM.
  It processes the entry so that it becomes visible to the other sites in the
  ApptiveGrid clould database.

- The replication service for incoming data (`RSI`) becomes active as soon as
  it detects at least one new entry for its site in ApptiveGrid's cloud
  database. When the entry is processed, the command is replicated in its own
  database, any file attachments are passed to its own delta server, and finally
  the command is marked as processed.


## Transfer strategy

The transfers are generally handled in such a way that as few accesses as
possible have to be made to the cloud database. This is achieved, among other
things, by the fact that the actual uploads and downloads take place
exclusively in the local context of the replication service.

The starting point for the entire cycle is the notification of the `RSO` that a
new entry has been created. The cross-site replication key is the primary key
of the `replicationlog` table, the `cchistoryid` column, hereafter referred to
as `replicationkey`.


### Procedure for distributing a replicated command

First the `RSO` checks whether file attachments exist for the replicated
command. For this purpose there is a function call for the local database,
which immediately creates entries in `replicationupload` for the file
attachments and returns the number of these entries (0 or more, function
name `insert_replication_upload`).

Then the `RSO` uploads the command as JSON to the cloud. Only when this process
has been successfully completed, the  recipient records are also created in
ApptiveGrid: For each recipient, exactly one record is created that contains
the command JSON ready for download and the number of attachments for this
command. Structure name in ApptiveGrid: `Replication Command`.

The `RSO` then performs all additional uploads for the attachments required for
the `replicationkey`. Only when all uploads for this key have been completed, a
record is created in ApptiveGrid per recipient and per upload with the
information for the attachments to be downloaded. Structure name in
ApptiveGrid: `Replication Attachment`.

This fulfills all the requirements for replication on the receiving side. The
receiving `RSI` proceeds as described in the next section and at the end only
acknowledges the record in `Replication Command` (not the processing of the
individual attachments). The `RSO` checks cyclically whether this
acknowledgement is present. If so, it takes the respective boolean value 
in `replicationupload.transferok`.

Immediately afterwards, it deletes all records for the affected recipient and
the current `replicationkey` in ApptiveGrid. From this moment on, the
associated `transferurl` values are also no longer needed.

If a site does not see or cannot process the commands intended for it, you can
tell because they were created in ApptiveGrid but were not acknowledged even
after a significant amount of time has passed.


### Procedure when receiving a replicated command

The starting point for the `RSI` is the ongoing query whether a not yet
acknowledged entry exists in `Replication Command` for its location number.

The `RSI` takes the found entry into the local `replicationlog` table and
immediately triggers the execution of the command to be replicated. 
If `attachmentcount` is 0, the whole operation can be marked as completed after
execution both in the ApptiveGrid database and locally. The value 
in `replicationlog.applytime` is set in any case immediately after execution of
the command, even in case of an error. Thus, the operation is considered
complete even in case of an error, which is also noted in the corresponding
record in ApptiveGrid.

In parallel with the scanning of `Replication Command`, `RSI` also continuously
checks whether unprocessed entries exist for it in `Replication Attachment`.
However, a prerequisite for their internal processing is an already existing
entry with the same `replicationkey` in the local `replicationlog` table. If
this is still missing, it can be assumed that `RSI` accidentally encountered
the attachments first during its cyclic check, although the command was already
available. In this case, `RSI` waits with the processing of the attachments
until the command has been entered in `replicationlog`, since otherwise the
corresponding `foreign key constraint` would be violated when inserting in
table `replicationdownload`.

Only when all pending entries in the `replicationdownload` table have been
created for a `replicationkey` does the `RSI` also start the associated
downloads by forwarding the URLs to the delta server. If there is a status for
each download (successful or failed), the replication of the associated command
is considered complete. The `RSI` records this status in `Replication Command`.


### Local database tables for file transfers

If file attachments are also to be transferred for a command to be replicated 
(beyond the command JSON), these attachments must be provided by the `RSO` in 
advance via upload in ApptiveGrid. The information for this is collected in the
initiator's local database in table `replicationupload` and only passed to 
ApptiveGrid after all uploads are complete. Structure of the table:
""
""
```language=psql
CREATE TABLE replicationupload (
	sfname varchar(40) PRIMARY KEY,
	createdts timestamp NOT NULL DEFAULT current_timestamp,
	replicationlog bigint NOT NULL,
	closedts timestamp,
	ccroot bigint NOT NULL,
	filesize bigint NOT NULL,
	locationoutgoing bigint NOT NULL,
	transferurl text NOT NULL,
	CONSTRAINT replicationupload_to_ccfile FOREIGN KEY (sfname)
 		REFERENCES ccfile (sfname) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT replicationupload_to_replicationlog FOREIGN KEY (replicationlog)
 		REFERENCES replicationlog (cchistoryid) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT replicationupload_to_ccroot FOREIGN KEY (ccroot)
 		REFERENCES ccroot (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT replicationupload_to_ccserverlocation1 FOREIGN KEY (locationoutgoing)
 		REFERENCES ccserverlocation (locationnumber) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);
```

As soon as information for upcoming downloads is available at `RSI`, 
it is transferred from the ApptiveGrid structure to the 
local `replicationdownload` table. Structure of the table:
""
""
```language=psql
CREATE TABLE replicationdownload (
	sfname varchar(40) PRIMARY KEY,
	createdts timestamp NOT NULL DEFAULT current_timestamp,
	replicationlog bigint NOT NULL,
	closedts timestamp,
	ccroot bigint NOT NULL,
	filesize bigint NOT NULL,
	locationoutgoing bigint NOT NULL, -- also known for each transfer
	locationincoming bigint NOT NULL,
	transferurl text NOT NULL,
	downloadpercent int NOT NULL DEFAULT 0,
	transferok boolean,
	transfererror text, -- more information if transferok = false
	CONSTRAINT replicationdownload_to_ccfile FOREIGN KEY (sfname)
 		REFERENCES ccfile (sfname) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT replicationdownload_to_replicationlog FOREIGN KEY (replicationlog)
 		REFERENCES replicationlog (cchistoryid) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT replicationdownload_to_ccroot FOREIGN KEY (ccroot)
 		REFERENCES ccroot (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT replicationdownload_to_ccserverlocation1 FOREIGN KEY (locationoutgoing)
 		REFERENCES ccserverlocation (locationnumber) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT replicationdownload_to_ccserverlocation2 FOREIGN KEY (locationincoming)
 		REFERENCES ccserverlocation (locationnumber) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT check_downloadpercent CHECK (downloadpercent between 0 and 100)
);
```

Since each entry in the two tables carries the locations involved in the
replication (`locationoutgoing`, `locationincoming`), the contents of the
tables can, if necessary, be transferred unchanged via backup to another
location without inconsistencies arising during replication.


### Structures in ApptiveGrid

#### Replication Command

This structure in ApptiveGrid describes a database command to be replicated.
The combination of `replicationkey` and `locationincoming` is unique. The
structure has the following structure:

- `created`: Timestamp, time of creation by the `RSO`.
- `replicationkey`: Integer, corresponds to the value in `replicationlog.cchistoryid`.
- `locationoutgoing`: Integer, location number of the `RSO` that created the record
- `locationincoming`: integer, location number of the `RSI` intended as recipient
- `commandurl`: URL for the JSON of the command
- `attachmentcount`: integer, number of file attachments belonging to the command
- `status`: enumeration of `new`, `finished`, `aborted
- `errortext`: text in case of abort with error

#### Replication Attachment

This structure in ApptiveGrid describes the file attachments for a database
command to be replicated. The combination of `replicationkey`, `locationincoming` 
and `attachmentposition` is unique. The structure has the following structure:

- `created`: Timestamp, time of creation by the `RSO`.
- `replicationkey`: Integer, corresponds to the value in `replicationlog.cchistoryid`.
- `locationoutgoing`: Integer, location number of the `RSO` that created the record
- `locationincoming`: Integer, location number of the `RSI` intended as recipient
- `attachmentposition`: Integer, sequence number of the attachment starting from 1
- `sfname`: String, corresponds to the server file name from `ccfile.sfname`.
- `transferurl`: URL for the file to be transferred
- `errortext`: text in case of abort with error


### Handling of file transfers that have not yet been completed

If the files associated with a document have not yet fully arrived on the
server of the recipient of a replication, an error will not occur until the
delta service receives the request for a download to the client. In this case,
one of the following two errors is returned to the client:

- """"The file does not exist on the server"""", if the name can not even be opened
- """"Error reading the file"""", if the file is incomplete

PDM on the client will never try to check the completeness of a file on the
delta server immediately before downloading it, because that would result in
additional network traffic that brings no real advantage. Instead, only in case
of one of the two mentioned error messages in table `replicationdownload` it
will check if there is currently an incomplete transfer registered for the
searched name. In order not to evaluate temporally narrow overlaps of the
negatively acknowledged request with the effective completion of the transfer
as an error, the failed call is repeated at least one more time, 
if `replicationdownload` should not contain the searched entry any more. Only
after the repeated failure, the request for this file is considered as failed.

If, on the other hand, an incomplete transfer has been detected, its progress
is determined at short intervals and evaluated by the application in such a way
that the caller of the download can estimate how long he will have to wait for
the transfer to be completed.


### Life cycle of the persistent transfer data

The records in ApptiveGrid are deleted by the service that created them
(`RSO`). Deletion is done per receiving site (`RSI`) whenever the operation for
that site is completed (whether successfully or with error message). Even after
this point in time, the information about replicated commands and their file
attachments can be traced in the local tables of the respective site.

Since server file names for document files are unique per `ccfile.filerelease`,
this data also does not need to be deleted immediately to avoid violating the
uniqueness of the primary key `sfname` in `replicationdownload`. However, they
should be as ephemeral as possible and should be deleted per `sfname` on all
sites no later than when a file has been successfully migrated to all sites.

A specific scenario is currently not yet regulated: Document files with the
history status `private draft` retain their release number 0 until they are
saved as public status for the first time. In this respect, it could happen
that replicated documents in this status end up on sites with an 
unchanged `sfname` in `replicationdownload` during fast successive saves, which would
lead to an error when trying to recreate them. However, there are various
possible solutions for this scenario, which are only briefly outlined here:

- Assignment of a different release number (e.g. -1) for draft documents, which
  is then handled specially
- The replication service waits until an existing entry for a 
  replicated `sfname` is at `downloadpercent = 100` before deleting and recreating it
  (knowing that regular documents can never have the same `sfname`)
- Replication of design documents is treated separately in another form

""

""
## Commands

The grid about _commands_ has the following content: 

<!inputFile|path=/home/mn/Developer/working-copies/documapses/replication-server/scripts/upload-download/jsons/commands-gridentities.json&language=json!>

""

DateAndTime now.
"
Class {
	#name : 'BookletDSstPdmReplicationServices',
	#superclass : 'CTClassCommentAutoNotebook',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}
