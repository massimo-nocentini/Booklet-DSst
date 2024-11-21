Class {
	#name : 'BookletDSstWolframHanseiTestCase',
	#superclass : 'WolframHanseiTestCase',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}

{ #category : 'tests' }
BookletDSstWolframHanseiTestCase >> testCatalanParens [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: super testCatalanParens pathSuffix: 'avg'.

	self
		exportSlotsGraphOf: WolframHanseiTestCase >> #testCatalanParens
		pathSuffix: 'test-method'.

	self
		exportSlotsGraphOf: THanseiTestCase >> #catalanParens:pickProb:
		pathSuffix: 'model-method'
]

{ #category : 'tests' }
BookletDSstWolframHanseiTestCase >> testGrassModelCloud [

	self exportSlotsGraphOf: super testGrassModelCloud pathSuffix: 'mean'.

	self
		exportSlotsGraphOf: WolframHanseiTestCase >> #testGrassModelCloud
		pathSuffix: 'test-method'.

	self
		exportSlotsGraphOf:
		THanseiTestCase >> #grassModelWithCloud:rain:sprinkler:otherwise:
		pathSuffix: 'model-method'
]
