Class {
	#name : 'BookletDSstHanseiTest',
	#superclass : 'TestCase',
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}

{ #category : 'tests' }
BookletDSstHanseiTest >> testExportCompiledMethods [

	self
		exportSlotsGraphOf: THanseiTestCase
			>> #grassModelPriorRain:rain:priorSprinkler:sprinkler:otherwise:
		pathSuffix: 'wetgrassmodel'.

	self
		exportSlotsGraphOf: WolframHanseiTestCase >> #testGrassModelWolfram
		pathSuffix: 'testGrassModelWolfram'
]
