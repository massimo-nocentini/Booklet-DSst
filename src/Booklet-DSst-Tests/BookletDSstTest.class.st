Class {
	#name : #BookletDSstTest,
	#superclass : #TestCase,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'Booklet-DSst-Tests'
}

{ #category : #tests }
BookletDSstTest >> testBasicObjectsNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstBasicObjectsNotebook new
]

{ #category : #tests }
BookletDSstTest >> testMicrodownNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstMicrodownNotebook new
]

{ #category : #tests }
BookletDSstTest >> testVanDerPloeg [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstVanDerPloegNotebook new
]
