Class {
	#name : #BaselineOfBookletDSst,
	#superclass : #BaselineOf,
	#category : #BaselineOfBookletDSst
}

{ #category : #baselines }
BaselineOfBookletDSst >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'MetaSTExporter'
			with: [ 
			spec repository: 'github://massimo-nocentini/MetaSTExporter' ].

		spec
			baseline: 'ContainersEssentials'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Essentials' ].

		spec
			baseline: 'MethodTrackerMN'
			with: [ spec repository: 'github://bauing-schmidt/MethodTracker' ].

		spec
			baseline: 'ContainersLinks'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Links' ].

		spec baseline: 'ContainersLinkedStoragePool' with: [ 
			spec repository:
				'github://massimo-nocentini/Containers-LinkedStoragePool' ].

		spec baseline: 'ContainersBinaryTreeAbstract' with: [ 
			spec repository:
				'github://massimo-nocentini/Containers-BinaryTreeAbstract' ].

		spec baseline: 'ContainersBinomialHeap' with: [ 
			spec repository:
				'github://massimo-nocentini/Containers-BinomialHeap' ].

		spec
			baseline: 'ContainersSBRAL'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-SBRAL' ].

		spec
			baseline: 'ContainersHeapQ'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-HeapQ' ].

		spec baseline: 'ContainersRedBlackSet' with: [ 
			spec repository:
				'github://massimo-nocentini/Containers-RedBlackSet' ].

		spec
			baseline: 'ContainersSplayHeap'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-SplayHeap' ].

		spec baseline: 'ContainersLeftistHeap' with: [ 
			spec repository:
				'github://massimo-nocentini/Containers-LeftistHeap' ].

		spec
			baseline: 'ContainersSkipList'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-SkipList' ] ]
]

{ #category : #documentation }
BaselineOfBookletDSst >> runAllTests [

	<script: 'BaselineOfBookletDSst new runAllTests'>
	{ 'Containers-Essentials-Tests'. 'Containers-Links-Tests'.
	'Containers-LinkedStoragePool-Tests'.
	'Containers-RedBlackSet-Tests'. 'Containers-BinomialHeap-Tests'.
	'Containers-BinaryTreeAbstract-Tests'.
	'Containers-LeftistHeap-Tests'. 'Containers-SplayHeap-Tests'.
	'MethodTracker-Visualizations'. 'Containers-SkipList-Tests'.
	'Containers-HeapQ-Tests' }
		do: [ :each | each asPackage testSuiteFromAllSelectors run ]
		displayingProgress: [ :each | 'Running tests in package: ' , each ].

	self inform: thisContext method name , ' has finished.'
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptCoreMessagesForDoc [

	<script: 'BaselineOfBookletDSst new scriptCoreMessagesForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( forDocumentationInBookletDSst valueWithArgumentedExit
			     #karatsuba:base: #halves:base: asInteger #halves:at:digits:base:
			     next privateNextValue privateNextSeed fibonacciNumbers
			     goldenRatiosLower goldenRatiosGreater lucasNumbers
			     #gibonacciNumbersFirst:second:do:
			     \/ mediantInteger: mediantFraction: kissingFractions
			     overlappingPairsDo: kissingFractionLink: bitBRGC asShapeBinaryDots:walker:
			     asShapeBRGCDots: fairCoin #bisect:baseBlock: #bisect:from:to:baseBlock:
			     asSkewBinaryCanonicalSparse #kth:ranking:atRandom:
			     atRandom: testInspectObjectModel testInspectTraitModel
			     testMagnitudeSubclasses testMagnitudeSubclassesSlotsGraph
			     testCollectionSubclasses testRBNodeSubclasses
			     testInspectCharacterPi testInspectFloatPi testInspectDatetimeNow
			     testInspectAssociation testInspectInteger13
			     testInspectInteger13Detailed testInspectGoldenRatio
			     testInspectHeap testInspectSet testInspectString
			     testInspect20FibonacciNumbers testInspect20LucasNumbers
			     testInspect20CatalanNumbers testInspectPoint testInspectBRGCodes
			     #testInspectColorGray testInspectObject testInspectNil
			     testInspectTrue testInspectFalse testInspectRSPolygon
			     testInspectPoint testInspectRBNodesQuine
			     testInspectFraction #testInspectFractionForKisses
			     testInspectFractionKissing testInspectFractionReciprocalKissing
			     testInspectFractionKissingEnumeration
			     testRandomSubclasses testGaussian testUniform testExponential
			     testGaussianBoxMuller testBernoulli testBinomial testGeometric
			     testByteArrayLoremIpsum testByteArrayLiteral
			     testByteArrayInteger testInspectDictionary
			     testInspectContext testInspectBag testInspect10GoldenRatios
			     testInspect10GoldenRectangles testInspect10GoldenRectanglesNested
			     testInspectIceRepository testInspectIceRepositoryCommitsGraph
			     testInspectOneToMany testInspectPascalArray
			     testInspectCatalanArray testInspectLargeInteger
			     testLinkSubclasses testInspectSkewBinaryCanonicalSparse
			     testInspectProbabilisticMedianRatioWithSorting );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'core-messages.json' ]
		  ofPackage: self class package
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptCurvesMessagesForDoc [

	<script: 'BaselineOfBookletDSst new scriptCurvesMessagesForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( #unitAffine:at: #unitAffine:at:and:at: sutBaricentricCoordinates:
			     sutBaricentricCoordinatesTriangle:
			     lineParametricNeil lineParametricNeil2 lineParametricUnitCircle
			     lineParametricTrochoid lineParametricLissajous
			     lineParametricHypotrochoid lineParametricButterfly
			     lineDeCasteljauLineClosedControlPoints
			     linesDeCasteljauLineDegreeElevation
			     lineDeCasteljauLineNoteBox noteLoremIpsum noteInteger );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'curves-messages.json' ]
		  ofPackage: self class package
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptLinkMessagesForDoc [

	<script: 'BaselineOfBookletDSst new scriptLinkMessagesForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( do: next: nextFromLink: nextLink: nextInteger: asLinkedList
			     #onSortedCollection:lowerBound:upperBound:
			     #onSortedCollection:lowerBound:upperBound:atRandom:
			     #includes:equalityBlock: predecessors: add: #add:atHeight:
			     #add:atHeight:predecessors: sutCrescenzi testEmptyLink
			     testLinkReferencingItself #testThreeLinksReferencingEachOther
			     yourself: #testLinkNext3 testLinkReferencingAnotherLink
			     testThreeLinksTooMuchSkipping );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'link-core-messages.json' ]
		  ofPackage: self class package
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptNumbersForDoc [

	<script: 'BaselineOfBookletDSst new scriptNumbersForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( #horner:init: estrin: #estrin:init: bitAverage: #bitToggle:do:
			     previousEven previousEvenOrSelf previousOdd previousOddOrSelf
			     nextEven nextEvenOrSelf nextOdd nextOddOrSelf testBitAverage
			     testBitToggleDo testBitToggleDo1 testPreviousEven
			     testPreviousEvenOrSelf testNextEven testNextEvenOrSelf
			     testPreviousOdd testPreviousOddOrSelf testNextOdd testNextOddOrSelf );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'numbers.json' ]
		  ofPackage: self class package
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptRedBlackSetMessagesForDoc [

	<script: 'BaselineOfBookletDSst new scriptRedBlackSetMessagesForDoc'>
	^ MetaSTExporter new
		  selectors: #( empty binaryTreeElementEmpty binaryTreeElementNode
			     tree: asBinaryTree asRedBlackSet asUnbalancedSet
			     asSplayHeap withArrayedCollection: withCollection:
			     asBinaryTree: #leftBinaryTreeElement:value:rightBinaryTreeElement:
			     #insert:left:right:inBinaryTree:
			     asBinomialHeap #partitionLessThan:inSplayHeap:do:
			     #partitionGreaterThanOrEqualTo:inSplayHeap:do:
			     linkBinomialTree: #partition:inSplayHeap:do:
			     #push:witness:continuation:inSet:
			     #pushTree:onTrees: #merge:with: asLeftistHeap push: pop root
			     binaryTreeElementEmpty #mergeBinaryTreeElement:inBinaryTree:
			     #pushingAlreadyIncluded:continuation:
			     testPushOrderedInterval testCreation testPushOrderedInterval
			     testPushShuffledInterval testPushShuffledCollection
			     testPushOrderedCollection testPushDoubledObject );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'redblackset-messages.json' ]
		  ofPackage: self class package
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptStoragePoolsForDoc [

	<script: 'BaselineOfBookletDSst new scriptStoragePoolsForDoc'>
	^ MetaSTExporter new
		  selectors: #( initialize push: pop removeAll allocateOrReuseLink
			     newLink releaseLink: testEmptyStack testSomePushesThenPopsOnStack
			     testPopFromEmptyStack testEmptyQueue testSomePushesThenPopsOnQueue
			     testPopFromEmptyQueue testRemoveAllFromQueue
			     testRemoveAllFromStack testEmptyCircularList
			     testSomePushesThenPopsOnCircular
			     testPopFromEmptyCircular testPolynomialAdditionFromKnuthTextbook );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'storage-pools.json' ]
		  ofPackage: self class package
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptSymbolicDivisibilityForDoc [

	<script: 'BaselineOfBookletDSst new scriptSymbolicDivisibilityForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( slowFibonacci #slowFibonacci:tail: #slowFibonacciMemo:
			     factorialRecursive productTo: initialize /% /%~ /%< >|< quoRemInteger:
			     quoRemComplementaryInteger: quoRemMinimalInteger:
			     #a:b: #testStandardQuoRem21Over9 testComplementaryQuoRem21Over9
			     testComplementaryQuoRem9Over21 testQuoRem9Over21
			     testQuoRemMinimal9Over21 testGCDof9and21 testGCDof12and21
			     testGCDof83and71 testGCDofZ17 testGCDofMultiplicativeInversesInZ17
			     testGCDofAdjacentFibonacciNumbers
			     testInspectLargeIntegerProfiled
			     testSequenceableCollectionHornerInit
			     testSequenceableCollectionEstrinInit
			     testProfileSlowFibonacciWithAdd
			     testProfileSlowFibonacciWithAddOnly
			     testProfileSlowFibonacciMemoingWithAdd
			     testProfileSlowFibonacciTailWithAdd
			     testInspectFactorialRecursive testInspectProductTo );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'symbolic-divisibility.json' ]
		  ofPackage: self class package
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptTopologicalSortMessagesForDoc [

	<script:
	'BaselineOfBookletDSst new scriptTopologicalSortMessagesForDoc'>
	^ MetaSTExporter new
		  selectors: #( #topologicalSortByAssociations:acyclicDo:
			     #topologicalSortByAssociations:onCycleDo:
			     isAcyclicWithRespectToAssociations:
			     #value:onCycleDo: anyAssociation makeValueLinksTable
			     initializeValueLinksTable: #sinksOfValueLinksTable:
			     #ifSink:otherwise:forTopologicalSortAlgorithm:
			     #sortOn:sinksValueLink:valueLinksTable:
			     #decrementCountIfZero:forTopologicalSortAlgorithm:
			     #handleCycleInValueLinksTable:do:
			     testTopologicalSortOnCycleDo testTopologicalSortOnCycleDo1
			     testTopologicalSortOnCycleDo2 testTopologicalSortOnCycleDo3
			     #testYourselfBlock testAnyAssociation );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'topologicalSort-core-messages.json' ]
		  ofPackage: self class package
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptValueLinkMessagesForDoc [

	<script: 'BaselineOfBookletDSst new scriptValueLinkMessagesForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( ~~> asLinkedList asValueLink #foldr:init: #inject:into:
			     #to:by: testSimpleValueLink test4321ValueLinks
			     test321ValueLinks test21ValueLinks #test43214ValueLinks
			     test11ValueLinksLoop testAsLinkedList testAsLinkedList4321
			     testNilAsLinkedList testAsLinkedListFromInterval
			     testAsValueLink testAsValueLinkInjectInto
			     #topologicalSortByAssociations:acyclicDo:
			     #topologicalSortByAssociations:onCycleDo:
			     isAcyclicWithRespectToAssociations:
			     #value:onCycleDo: anyAssociation makeValueLinksTable
			     initializeValueLinksTable: #sinksOfValueLinksTable:
			     #sortOn:sinksValueLink:valueLinksTable:
			     #handleCycleInValueLinksTable:do:
			     testTopologicalSortOnCycleDo testTopologicalSortOnCycleDo1
			     testTopologicalSortOnCycleDo2 testTopologicalSortOnCycleDo3
			     #testYourselfBlock testAnyAssociation test4321ValueLinksNested);
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'valuelink-core-messages.json' ]
		  ofPackage: self class package
]
