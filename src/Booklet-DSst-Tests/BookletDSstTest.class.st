Class {
	#name : 'BookletDSstTest',
	#superclass : 'TestCase',
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}

{ #category : 'notebook' }
BookletDSstTest >> basicPharoObjectsNotebook: notebook [

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

{ #category : 'notebook' }
BookletDSstTest >> esug2024MassimoNocentiniTalkNotebook: thisNotebook [

	<notebook>
	| l |
	thisNotebook title: 'Notebooks'.

	"
# Background

## From Literate Programming

From [Literate programming simplified](https://doi.org/10.1109/52.311070):

> LP let you arrange the parts of a program in any order and extract 
> documentation and code from the same source file.

Literate programming tools are used to obtain two representations from a source file: 
- one understandable by a compiler or interpreter, the _tangled_ code, and
- another for viewing as formatted documentation, which is said to be _woven_ from the literate source.
Moreover, the [texlive](https://tug.org/texlive/acquire-netinstall.html) distribution ships both programs.

For the curious reader, Knuth shows [many interesting programs](https://cs.stanford.edu/~knuth/programs.html) in (t)his style.
"

	"
## To notebooks


[Stephan Wolfram](https://writings.stephenwolfram.com/2016/09/how-to-teach-computational-thinking/) says:

> The idea of a notebook is to have an interactive document that 
> freely mixes code, results, graphics, text and everything else.
"

	"
# `tree-sitter` library

We integrate the [tree-sitter](https://tree-sitter.github.io/tree-sitter/) library, which is:

> Tree-sitter is a parser generator tool and an incremental parsing library. 
> It can build a concrete syntax tree for a source file and efficiently update 
> the syntax tree as the source file is edited. Tree-sitter aims to be:
> - General enough to parse any programming language
> - Fast enough to parse on every keystroke in a text editor
> - Robust enough to provide useful results even in the presence of syntax errors
> - Dependency-free so that the runtime library (which is written in pure C) can be embedded in any application

"

	"## Syntax highlight

We support parsing and syntax highlights for the following languages:
- _c_

```language=c
int main (int argc, char **argv) { printf(""Hello world!""); }
```

- _json_

```language=json
{ ""adf"": [ 3 ]}
```

- _javascript_

```language=javascript
var canvas = new fabric.Canvas('c');

// create a rectangle with angle=45
var rect = new fabric.Rect({
  left: 100,
  top: 100,
  fill: 'red',
  width: 20,
  height: 20,
  angle: 45
});

canvas.add(rect);
```

- _python_

```language=python
def fib(n):
	# comment
	a, b = 0, 1
	while a < n:
		print(a, end=' ')
		a, b = b, a+b
	
fib (1000)
```
"

	"## AST parsing"

	thisNotebook outside: [
		(TSLanguage c parser treeOfString:
			 'int main (int argc, char **argv) { printf("Hello world!"); }')
			ast ].

	"Let us define a simple link"

	thisNotebook outside: [ l := 3 ~~> nil ].

	"Now just link something else over it"

	thisNotebook outside: [ 4 ~~> l ].


	"Self referencing"

	thisNotebook outside: [ thisNotebook ~~> nil ].

	BookletDSstTest >> #esug2024MassimoNocentiniTalkNotebook:
]

{ #category : 'tests' }
BookletDSstTest >> testBasicObjectsNotebook [

	self timeLimit: 1 minute.

	self exportSlotsGraphOf:
		(self class >> #basicPharoObjectsNotebook:) asNotebook
]
