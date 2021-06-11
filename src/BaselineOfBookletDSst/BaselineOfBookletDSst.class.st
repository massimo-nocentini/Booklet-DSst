Class {
	#name : #BaselineOfBookletDSst,
	#superclass : #BaselineOf,
	#category : #BaselineOfBookletDSst
}

{ #category : #baselines }
BaselineOfBookletDSst >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec baseline: 'ContainersLinkedStoragePool' with: [ 
			spec repository:
				'github://massimo-nocentini/Containers-LinkedStoragePool/src' ].

		spec
			baseline: 'MetaSTExporter'
			with: [ 
			spec repository: 'github://massimo-nocentini/MetaSTExporter/src' ] ]
]
