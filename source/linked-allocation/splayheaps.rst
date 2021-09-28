
*Splay* heaps
*************

A *search binary tree* is defined by subclassing

.. pharo:autoclass:: CTSplayHeap

and the corresponding test class defines,

.. pharo:autocompiledmethod:: CTSplayHeapTest>>#tree:

that uses

.. pharo:autocompiledmethod:: Collection>>#asSplayHeap

to show the following inspectors. First, the empty tree looks like

.. image:: ../../../Containers-SplayHeap/images/CTSplayHeapTest-testCreation.svg
  :align: center

Second, we have the four cases:

- sorted data in arrayed collection,

  .. image:: ../../../Containers-SplayHeap/images/CTSplayHeapTest-testPushOrderedInterval.svg
    :align: center

  by means of

  .. pharo:autocompiledmethod:: CTBinaryTreeNodeSplayHeap>>#mergeBinaryTreeElement:inBinaryTree:

  that dispatches over

  .. pharo:autocompiledmethod:: CTBinaryTreeEmptySplayHeap>>#partition:inSplayHeap:do:
  .. pharo:autocompiledmethod:: CTBinaryTreeNodeSplayHeap>>#partition:inSplayHeap:do:

  where the latter uses both

  .. pharo:autocompiledmethod:: CTBinaryTreeNodeSplayHeap>>#partitionLessThan:inSplayHeap:do:

  and

  .. pharo:autocompiledmethod:: CTBinaryTreeNodeSplayHeap>>#partitionGreaterThanOrEqualTo:inSplayHeap:do:

  in turn.

- sorted data in ordered collection,

  .. image:: ../../../Containers-SplayHeap/images/CTSplayHeapTest-testPushOrderedCollection.svg
    :align: center

  by means of

  .. pharo:autocompiledmethod:: CTSplayHeap>>#push:


- shuffled data in arrayed collection,

  .. image:: ../../../Containers-SplayHeap/images/CTSplayHeapTest-testPushShuffledInterval.svg
    :align: center

- shuffled data in ordered collection,

  .. image:: ../../../Containers-SplayHeap/images/CTSplayHeapTest-testPushShuffledCollection.svg
    :align: center

