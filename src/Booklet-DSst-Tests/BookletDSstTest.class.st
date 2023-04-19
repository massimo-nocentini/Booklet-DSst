Class {
	#name : #BookletDSstTest,
	#superclass : #TestCase,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'Booklet-DSst-Tests'
}

{ #category : #tests }
BookletDSstTest >> testVanDerPloeg [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstVanDerPloegNotebook new
]
