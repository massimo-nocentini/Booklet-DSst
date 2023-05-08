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
BookletDSstTest >> testMicrodownNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstMicrodownNotebook new
]

{ #category : #tests }
BookletDSstTest >> testVanDerPloeg [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstVanDerPloegNotebook new
]
