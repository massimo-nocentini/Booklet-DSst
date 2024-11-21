Class {
	#name : 'BookletDSstWolframCoreTestCase',
	#superclass : 'WolframCoreTestCase',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}

{ #category : 'tests' }
BookletDSstWolframCoreTestCase >> testBinomial [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: super testBinomial pathSuffix: 'binomial'.

	self
		exportSlotsGraphOf: WolframCoreTestCase >> #testBinomial
		pathSuffix: 'test-method'.

	self
		exportSlotsGraphOf: Collection >> #binomial:asWolframExpression:
		pathSuffix: 'binomial-method'.

	self
		exportSlotsGraphOf: WolframExpression >> #binomial:
		pathSuffix: 'binomial-function'
]
