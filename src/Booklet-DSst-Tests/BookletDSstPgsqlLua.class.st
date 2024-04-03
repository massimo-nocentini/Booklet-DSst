"
""

# Lua interface over PostgreSQL

## Use cases

### Connection

First of all, let us show how to connect to a database,

""

LibLua uniqueInstance in: [:ll | 

 ll withOpenedLibsStateDo: [ :L | 
	
	ll luaL_dostring: L chunk: '
	 
	 local pgsql = require ''pgsql''
	
	 local pgconn = pgsql.setdbLogin (''localhost'', ''5436'', ''pdmCC'', ''pdm'', ''devAdmin1'')
    assert (pgconn:status () == pgsql.CONNECTION.OK)
    assert (pgconn:serverVersion () == 150002)
    
	'
		 
	]].


""

observe that the returned $0$ is equal to the enum value `LUA_OK` which indicates that the Lua computation has been executed without errors.

### Textual representation of a `select`
""

LibLua uniqueInstance in: [:ll | 

 ll withOpenedLibsStateDo: [ :L | 
	
	ll luaL_dostring: L chunk: '
	 
	 local pgsql = require ''pgsql''
	
	 local pgconn = pgsql.setdbLogin (''localhost'', ''5436'', ''pdmCC'', ''pdm'', ''devAdmin1'')

    local res = pgconn [[

        select * from pdm.ccnode limit 10;

    ]]

    assert (pgconn:errorMessage () == '''')
    assert (res:status () == pgsql.PGRES.TUPLES_OK)
    assert (res:errorMessage () == '''')
    assert (res:cmdStatus () == ''SELECT 10'')
    assert (res:cmdTuples () == 10)
 
	 s = tostring (res)
	'.
	
	(ll on: L push: #s;
		on: L at: -1) trim
		 
	]].

""

### Fetching tuples

""

LibLua uniqueInstance in: [:ll | 

 ll withOpenedLibsStateDo: [ :L | 
	
	ll luaL_dostring: L chunk: '
	 
	 local pgsql = require ''pgsql''
	
	 local pgconn = pgsql.setdbLogin (''localhost'', ''5436'', ''pdmCC'', ''pdm'', ''devAdmin1'')

    local res = pgconn [[

        select * from pdm.ccnode limit 10;

    ]]

    assert (res:status () == pgsql.PGRES.TUPLES_OK)
    
    tuples = res ()
	'.
	
	ll on: L push: #tuples;
		on: L at: -1
		 
	]].

""

#### Limit to just one row

""

LibLua uniqueInstance in: [:ll | 

 ll withOpenedLibsStateDo: [ :L | 
	
	ll luaL_dostring: L chunk: '
	 
	 local pgsql = require ''pgsql''
	
	 local pgconn = pgsql.setdbLogin (''localhost'', ''5436'', ''pdmCC'', ''pdm'', ''devAdmin1'')

    local res = pgconn [[

        select * from pdm.ccnode limit 10;

    ]]

    assert (res:status () == pgsql.PGRES.TUPLES_OK)
    
    tuples = res { row = 1, }
	'.
	
	ll on: L push: #tuples;
		on: L at: -1
		 
	]].

""

### **Tracing** and anonymous columns

""

LibLua uniqueInstance in: [:ll | 

 ll withOpenedLibsStateDo: [ :L | 
	
	ll luaL_dostring: L chunk: '
	 
	 local pgsql = require ''pgsql''
	
	  local pgconn = pgsql.setdbLogin (''localhost'', ''5436'', ''pdmCC'', ''pdm'', ''devAdmin1'')

    flag, trace = pgconn:tracing (
        function ()
            local res = pgconn [[

                select 3 + 4, 8;

            ]]

            assert (res:status () == pgsql.PGRES.TUPLES_OK)
    
            local tuples = res { usenames = false } 

            assert (tuples [1][1] == ''7'')
            assert (tuples [1][2] == ''8'')
        end
    )
    
    assert (flag)
    
	'.
	
	(ll on: L push: #trace;
		on: L at: -1)
		 
	]].

""

## Implementation

The whole module is split in two parts, as usual in Lua: the former is the surface layer written in Lua itself, the latter is the C layer that allows us to call PostgreSQL functions.

The following two sections report the actual code for both parts.

### Lua frontend

On one hand, the surface Lua module reads as follows,

<!inputFile|path=/usr/local/share/lua/5.4/pgsql.lua&language=lua!>

### C backend

on the other hand, it lies over the C middle layer,

<!inputFile|path=/home/mn/Developer/working-copies/luas/pgsql.lua/src/libpgsqllua.c&language=c!>

which interfaces directly over the PostgreSQL's C api.

""
"
Class {
	#name : 'BookletDSstPgsqlLua',
	#superclass : 'CTClassCommentAutoNotebook',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}
