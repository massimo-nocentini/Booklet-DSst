"
I have a collection of tests that export compiled methods as SVG files, usually one test case for each ""major topic"" of the booklet.
"
Class {
	#name : #ExportMessagesAsSVGsTest,
	#superclass : #TestCase,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #BaselineOfBookletDSst
}

{ #category : #tests }
ExportMessagesAsSVGsTest >> testFloats [

	self
		exportCompiledMethod: SmallFloat64 class >> #basicNew;
		exportCompiledMethod:
			EssentialsObjectTest >> #testCannotInstantiateSmallFloat64
]

{ #category : #tests }
ExportMessagesAsSVGsTest >> testNonLayeredTidyTrees [

	self
		exportCompiledMethod:
			NonLayeredTidyTreesTest >> #testTreeLayoutPaperTreeFlatMemoryChunk;
		exportCompiledMethod:
			NonLayeredTidyTreesTest >> #vanDerPloegPaperTreeVertical
]
