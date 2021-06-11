Class {
	#name : #BaselineOfBookletDSst,
	#superclass : #BaselineOf,
	#category : #BaselineOfBookletDSst
}

{ #category : #baselines }
BaselineOfBookletDSst >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec baseline: 'ContainersLinkedStoragePool' with: [ 
			spec repository:
				'github://massimo-nocentini/Containers-LinkedStoragePool/src' ].

		spec
			baseline: 'MetaSTExporter'
			with: [ 
			spec repository: 'github://massimo-nocentini/MetaSTExporter/src' ] ]
]

{ #category : #documentation }
BaselineOfBookletDSst >> scriptLinkMessagesForDoc [

	<script: 'BaselineOfBookletDSst new scriptLinkMessagesForDoc'>
	^ MetaSTExporter new
		  selectors:
			  #( do: nextLink: asLinkedList testEmptyLink testLinkReferencingItself
			     testLinkReferencingItselfRecursive
			     testTwoLinksReferencingEachOtherRecursive
			     testLinkReferencingThree testLinkReferencingAnotherLink
			     testLinkReferencingAnotherLinkRecursive );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'link-core-messages.json' ]
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
			     testIgnoreBlock testAnyAssociation );
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
			     test321ValueLinks test21ValueLinks test4321ValueLinksRecursive
			     test4321ValueLinksSimplerRepr test43214ValueLinksRecursive
			     test11ValueLinksLoopRecursive test11ValueLinksLoop
			     test43214ValueLinksFrom2Recursive
			     testAsLinkedList testAsLinkedList4321 testNilAsLinkedList
			     testAsLinkedListFromInterval testAsValueLink testAsValueLinkInjectInto
			     #topologicalSortByAssociations:acyclicDo:
			     #topologicalSortByAssociations:onCycleDo:
			     isAcyclicWithRespectToAssociations:
			     #value:onCycleDo:  anyAssociation makeValueLinksTable
			     initializeValueLinksTable: #sinksOfValueLinksTable:
			     #sortOn:sinksValueLink:valueLinksTable:
			     #handleCycleInValueLinksTable:do:
			     testTopologicalSortOnCycleDo testTopologicalSortOnCycleDo1
			     testTopologicalSortOnCycleDo2 testTopologicalSortOnCycleDo3
			     testIgnoreBlock testAnyAssociation );
		  exportWithRepositoryPath: [ :aPath | 
			  aPath / 'json-for-doc' / 'valuelink-core-messages.json' ]
		  ofPackage: self class package
]
