
*Leftist* heaps
***************

A *search binary tree* is defined by subclassing

.. pharo:autoclass:: CTLeftistHeap

and the corresponding test class defines,

.. pharo:autocompiledmethod:: CTLeftistHeapTest>>#tree:

that uses

.. pharo:autocompiledmethod:: Collection>>#asLeftistHeap

to show the following inspectors. First, the empty tree looks like

.. image:: ../../../Containers-LeftistHeap/images/CTLeftistHeapTest-testCreation.svg
  :align: center

Second, we have the four cases:

- sorted data in arrayed collection,

  .. image:: ../../../Containers-LeftistHeap/images/CTLeftistHeapTest-testPushOrderedInterval.svg
    :align: center

  by means of

  .. pharo:autocompiledmethod:: CTBinaryTreeNodeLeftistHeap>>#mergeBinaryTreeElement:inBinaryTree:

  and

  .. pharo:autocompiledmethod:: CTBinaryTreeNodeLeftistHeap>>#insert:left:right:inBinaryTree:

- sorted data in ordered collection,

  .. image:: ../../../Containers-LeftistHeap/images/CTLeftistHeapTest-testPushOrderedCollection.svg
    :align: center

- shuffled data in arrayed collection,

  .. image:: ../../../Containers-LeftistHeap/images/CTLeftistHeapTest-testPushShuffledInterval.svg
    :align: center

- shuffled data in ordered collection,

  .. image:: ../../../Containers-LeftistHeap/images/CTLeftistHeapTest-testPushShuffledCollection.svg
    :align: center

