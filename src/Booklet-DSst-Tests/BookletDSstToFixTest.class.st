Class {
	#name : 'BookletDSstToFixTest',
	#superclass : 'TestCase',
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}

{ #category : 'notebook' }
BookletDSstToFixTest >> basicPharoObjectsNotebook: notebook [

	<notebook>
	| o |
	notebook title: 'hello'.

	"This notebook introduces basic objects that populate a Smalltalk image.
In particular, we write in the Pharo dialect, which adhers to the following principles:"
	ProfStef pharoZenValues.

	"For instance, let's create a very simple object,"
	o := Object new.

	"denoted by the symbol `o`. Wait for a moment and look at the <span foreground='gray'>little labels</span> above each boxes. 
They shows the _class_ of the object represented in the box, so let's inspect it"
	o class.

	"that is what's called the _Smalltalk object model_. Moreover, observe how such a
class has been obtained, through the message `class` defined as follows:"
	ProtoObject >> #class.

	"And in turn, have a look at what a _`primitive`_ is:"
	#whatIsAPrimitive implementors.

	"Also observe that `o` has been created by the message"
	o class class lookupSelector: #new
]

{ #category : 'as yet unclassified' }
BookletDSstToFixTest >> methodWithSomeComments [
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

{ #category : 'tests' }
BookletDSstToFixTest >> testBasicObjectsNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf:
		(BookletDSstTest >> #basicPharoObjectsNotebook:) asNotebook
]

{ #category : 'as yet unclassified' }
BookletDSstToFixTest >> testBookletSICPNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletSICPNotebook new.

	"self
		exportSlotsGraphOf: BookletSICPPrefacesNotebook new
		pathSuffix: 'prefaces'."

	self
		exportSlotsGraphOf: BookletSICPBuildingAbstractionsNotebook new
		pathSuffix: 'building-abstractions-with-procedures'
]

{ #category : 'as yet unclassified' }
BookletDSstToFixTest >> testLua [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstLuaNotebook new
]

{ #category : 'as yet unclassified' }
BookletDSstToFixTest >> testMicrodownNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstMicrodownNotebook new
]

{ #category : 'as yet unclassified' }
BookletDSstToFixTest >> testPdf [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstPdfNotebook new
]

{ #category : 'as yet unclassified' }
BookletDSstToFixTest >> testPdmPgsqlLua [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstPgsqlLua new
]

{ #category : 'as yet unclassified' }
BookletDSstToFixTest >> testPdmReplicationServices [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstPdmReplicationServices new
]

{ #category : 'as yet unclassified' }
BookletDSstToFixTest >> testVanDerPloeg [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf: BookletDSstVanDerPloegNotebook new
]
