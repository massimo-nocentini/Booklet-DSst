
*Binomial* heaps
****************

A *free binary tree* container is defined according to

.. pharo:autoclass:: CTBinomialHeap

and its responsibility is to direct and manage objects of types

.. pharo:autoclass:: CTBinomialTree

as actual representation for the underlying structure. The simpler container is
the empty tree,


.. image:: ../../../Containers-BinomialHeap/images/CTBinomialHeapTest-testCreation.svg
  :align: center

where

.. pharo:autocompiledmethod:: CTBinomialHeap_class>>#empty

In general, we use collections and then build trees out of them. On one hand,
using ``ArrayedCollection`` objects


.. image:: ../../../Containers-BinomialHeap/images/CTBinomialHeapTest-testPushOrderedInterval.svg
  :align: center

where

.. pharo:autocompiledmethod:: CTBinomialHeapTest>>#tree:
.. pharo:autocompiledmethod:: Collection>>#asBinomialHeap

and

.. pharo:autocompiledmethod:: CTBinomialHeap_class>>#withArrayedCollection:

uses

.. pharo:autocompiledmethod:: CTBinomialHeap>>#merge:with:

that delegates on both

.. pharo:autocompiledmethod:: CTBinomialHeap>>#pushTree:onTrees:

and

.. pharo:autocompiledmethod:: CTBinomialTree>>#linkBinomialTree:

to finally build the tree. On the other hand, using ``Collection`` objects

.. image:: ../../../Containers-BinomialHeap/images/CTBinomialHeapTest-testPushOrderedCollection.svg
  :align: center

where

.. pharo:autocompiledmethod:: CTBinomialHeap_class>>#withCollection:

uses

.. pharo:autocompiledmethod:: CTBinomialHeap>>#push:

repeatedly. The two cases above can be redone with shuffled collections, both

.. image:: ../../../Containers-BinomialHeap/images/CTBinomialHeapTest-testPushShuffledInterval.svg
  :align: center

and

.. image:: ../../../Containers-BinomialHeap/images/CTBinomialHeapTest-testPushShuffledCollection.svg
  :align: center

respectively.
