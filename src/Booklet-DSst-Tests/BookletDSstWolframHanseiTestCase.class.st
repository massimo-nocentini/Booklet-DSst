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
