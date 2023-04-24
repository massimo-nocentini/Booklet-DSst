"
""This notebook introduces basic objects that populate a Smalltalk image.
In particular, we write in the Pharo dialect, which adhers to the following principles:""

ProfStef   pharoZenValues.

""For instance, let's create a very simple object,""

o := Object new.

""where `o` is a reference to it. Wait for a moment and look at the <span foreground='gray'>little labels</span> above each boxes. 
They shows the _class_ of the object represented in the box, so let's inspect it""

o class.

""that is what's called the _Smalltalk object model_. Moreover, observe how such a
class has been obtained, through the message `class` defined as follows:""

ProtoObject  >> #class.

""And in turn, have a look at what a _`primitive`_ is:""

#whatIsAPrimitive implementors .


"
Class {
	#name : #BookletDSstBasicObjectsNotebook,
	#superclass : #CTClassCommentAutoNotebook,
	#category : #'Booklet-DSst-Tests'
}
