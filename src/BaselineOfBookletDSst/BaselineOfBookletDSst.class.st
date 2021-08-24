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
			spec repository: 'github://massimo-nocentini/MetaSTExporter/src' ].

		spec
			baseline: 'ContainersEssentials'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Essentials' ].

		spec
			baseline: 'ContainersLinks'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Links' ].

		spec baseline: 'ContainersLinkedStoragePool' with: [ 
			spec repository:
				'github://massimo-nocentini/Containers-LinkedStoragePool/src' ] ]
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptCoreMessagesForDoc [

	<script: 'BaselineOfBookletDSst new scriptCoreMessagesForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( next privateNextValue privateNextSeed fibonacciNumbers
			     goldenRatios lucasNumbers #gibonacciNumbersFirst:second:do:
			     \/ mediantInteger: mediantFraction: kissingFractions
			     overlappingPairsDo: kissingFractionLink: bitBRGC asShapeBinaryDots:
			     asShapeBRGCDots instVarsNamesOrderedCollection
			     testInspectObjectModel testMagnitudeSubclasses
			     testMagnitudeSubclassesSlotsGraph
			     testCollectionSubclasses testRBNodeSubclasses
			     testInspectCharacterPi testInspectFloatPi testInspectDatetimeNow
			     testInspectAssociation testInspectInteger13
			     testInspectInteger13Detailed testInspectGoldenRatio
			     testInspectHeap testInspectSet testInspectString
			     testInspect20FibonacciNumbers testInspect20LucasNumbers
			     testInspect20CatalanNumbers testInspectPoint testInspectBRGCodes
			     #testInspectColorGray testInspectObject testInspectNil
			     testInspectTrueAndFalse testInspectRSPolygon
			     testInspectPoint testInspectRBNodesQuine
			     testInspectFraction #testInspectFractionForKisses
			     testInspectFractionKissing testInspectFractionReciprocalKissing
			     testInspectFractionKissingEnumeration
			     testRandomSubclasses testGaussian testUniform testExponential
			     testGaussianBoxMuller testByteArrayLoremIpsum
			     testByteArrayLiteral testByteArrayInteger testInspectDictionary
			     testInspectContext testInspectBag testInspect10GoldenRatios
			     testInspect10GoldenRectangles testInspect10GoldenRectanglesNested
			     testInspectIceRepository testInspectIceRepositoryCommitsGraph
			     testInspectOneToMany testInspectPascalArray
			     testInspectCatalanArray );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'core-messages.json' ]
		  ofPackage: self class package
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptLinkMessagesForDoc [

	<script: 'BaselineOfBookletDSst new scriptLinkMessagesForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( do: next: nextOfLink: nextLink: nextInteger: asLinkedList
			     testEmptyLink testLinkReferencingItself
			     #testThreeLinksReferencingEachOther
			     yourself: #testLinkNext3 testLinkReferencingAnotherLink
			     testThreeLinksTooMuchSkipping );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'link-core-messages.json' ]
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
			  #( initialize /% /%~ /%< >|< quoRemInteger: quoRemComplementaryInteger:
			     quoRemMinimalInteger: #a:b: #testStandardQuoRem21Over9
			     testComplementaryQuoRem21Over9 testComplementaryQuoRem9Over21
			     testQuoRem9Over21 testQuoRemMinimal9Over21
			     testGCDof9and21 testGCDof12and21 testGCDof83and71
			     testGCDofZ17 testGCDofMultiplicativeInversesInZ17
			     testGCDofAdjacentFibonacciNumbers );
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
