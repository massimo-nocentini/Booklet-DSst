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
		exportSlotsGraphOf: WolframHanseiTestCase >> #testGrassModel
		pathSuffix: 'testGrassModelWolfram'
]

{ #category : 'tests' }
BookletDSstHanseiTest >> testExportCoreCompiledMethods [

	self exportSlotsGraphOf: BlockClosure >> #hansei pathSuffix: 'hansei'.

	self
		exportSlotsGraphOf: Collection >> #asUniformWeightsDictionary
		pathSuffix: 'asUniformWeightsDictionary'.

	self
		exportSlotsGraphOf: Collection >> #asSearchTree
		pathSuffix: 'collection-asSearchTree'.

	self
		exportSlotsGraphOf: Dictionary >> #asSearchTree
		pathSuffix: 'dictionary-asSearchTree'
]