Class {
	#name : #BookletDSstTest,
	#superclass : #TestCase,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'Booklet-DSst-Tests'
}

{ #category : #'as yet unclassified' }
BookletDSstTest >> methodWithSomeComments [
	"This should be [a link](https://www.alt-codes.net/check-mark-symbols.php) and a math equation $a = 3$."

	"

# Hex chars

- &#x2610; not yet done
- &#x2611; this is completed
- &#x2655; a queen?
"

	| a |
	a := 3.

	"this comment should be rendered as usual."

	^ a
]

{ #category : #tests }
BookletDSstTest >> testBasicObjectsNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstBasicObjectsNotebook new
]

{ #category : #tests }
BookletDSstTest >> testBookletSICPNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletSICPNotebook new.

	"self
		exportSlotsGraphOf: BookletSICPPrefacesNotebook new
		pathSuffix: 'prefaces'."

	self
		exportSlotsGraphOf: BookletSICPBuildingAbstractionsNotebook new
		pathSuffix: 'building-abstractions-with-procedures'
]

{ #category : #tests }
BookletDSstTest >> testLua [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstLuaNotebook new
]

{ #category : #tests }
BookletDSstTest >> testMicrodownNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstMicrodownNotebook new
]

{ #category : #tests }
BookletDSstTest >> testPdf [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstPdfNotebook new
]

{ #category : #tests }
BookletDSstTest >> testPdmPgsqlLua [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstPgsqlLua new
]

{ #category : #tests }
BookletDSstTest >> testPdmReplicationServices [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstPdmReplicationServices new
]

{ #category : #tests }
BookletDSstTest >> testVanDerPloeg [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstVanDerPloegNotebook new
]
