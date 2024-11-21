Class {
	#name : 'BookletDSstWolframHanseiTestCase',
	#superclass : 'WolframHanseiTestCase',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}

{ #category : 'tests' }
BookletDSstWolframHanseiTestCase >> testCatalanParens [

	self exportSlotsGraphOf: super testCatalanParens
]
