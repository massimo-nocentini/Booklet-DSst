Class {
	#name : #BookletDSstTest,
	#superclass : #TestCase,
	#category : #'Booklet-DSst-Tests'
}

{ #category : #notebook }
BookletDSstTest >> simpleNotebook [
	"This is **bold** and have a look at the following."

	"Intro

The publication subject of this page has the following reference
  

which is the starting point to enhance our own Smalltalk class"

	<notebook>
	RSVanDerPloegTreeLayout ignoreOutputBecause:
		RSVanDerPloegTreeLayout class comment.

	" [`RSVanDerPloegTreeLayout`](https://github.com/massimo-nocentini/Roassal3/blob/master/src/Roassal3-Layouts/RSVanDerPloegTreeLayout.class.st) to be faster by coding the core algorithm direclty in C and using Lua as intermediate for both describing the tree nodes and interfacing with C.

We represent the tree used in the paper as case study to spot the core points of the algorithms looks like either"

	NonLayeredTidyTreesTest >> #testTreeLayout3_small
]
