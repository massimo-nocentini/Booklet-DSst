Class {
	#name : 'BookletDSstWolframCoreTestCase',
	#superclass : 'WolframCoreTestCase',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}

{ #category : 'tests' }
BookletDSstWolframCoreTestCase >> testBinomial [

	self exportSlotsGraphOf: super testBinomial pathSuffix: 'binomial'.

	self
		exportSlotsGraphOf: WolframCoreTestCase >> #testBinomial
		pathSuffix: 'test-method'.

	self
		exportSlotsGraphOf: Collection >> #binomial:asWolframExpression:
		pathSuffix: 'binomial-method'
]
