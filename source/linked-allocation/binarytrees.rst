
*Binary* trees
**************

A *free binary tree* container is defined according to

.. pharo:autoclass:: CTBinaryTreeAbstract

and its responsibility is to direct and manage objects of types

.. pharo:autoclass:: CTBinaryTreeElement
.. pharo:autoclass:: CTBinaryTreeEmpty
.. pharo:autoclass:: CTBinaryTreeNode

as actual representation for the underlying structure. The simpler container is
the empty tree,

.. pharo:autocompiledmethod:: CTBinaryTreeAbstractTest>>#testCreation

  .. image:: ../../../Containers-BinaryTreeAbstract/images/CTBinaryTreeAbstractTest-testCreation.svg
    :align: center

where

.. pharo:autocompiledmethod:: CTBinaryTreeAbstract_class>>#empty

In general, we use collections and then build trees out of them. On one hand,
using ``ArrayedCollection`` objects

.. pharo:autocompiledmethod:: CTBinaryTreeAbstractTest>>#testPushOrderedInterval

  .. image:: ../../../Containers-BinaryTreeAbstract/images/CTBinaryTreeAbstractTest-testPushOrderedInterval.svg
    :align: center

where

.. pharo:autocompiledmethod:: CTBinaryTreeAbstractTest>>#tree:
.. pharo:autocompiledmethod:: Collection>>#asBinaryTree
.. pharo:autocompiledmethod:: ArrayedCollection>>#asBinaryTree:

and

.. pharo:autocompiledmethod:: CTBinaryTreeAbstract_class>>#withArrayedCollection:

dispatches over 

.. pharo:autocompiledmethod:: CTBinaryTreeEmpty>>#mergeBinaryTreeElement:inBinaryTree:
.. pharo:autocompiledmethod:: CTBinaryTreeNode>>#mergeBinaryTreeElement:inBinaryTree:

by means of *bisection*

.. pharo:autocompiledmethod:: ArrayedCollection>>#bisect:baseBlock:
.. pharo:autocompiledmethod:: ArrayedCollection>>#bisect:from:to:baseBlock:

to finally build the tree. On the other hand, using ``Collection`` objects

.. pharo:autocompiledmethod:: CTBinaryTreeAbstractTest>>#testPushOrderedCollection

  .. image:: ../../../Containers-BinaryTreeAbstract/images/CTBinaryTreeAbstractTest-testPushOrderedCollection.svg
    :align: center

where

.. pharo:autocompiledmethod:: Collection>>#asBinaryTree:

and

.. pharo:autocompiledmethod:: CTBinaryTreeAbstract_class>>#withCollection:

uses

.. pharo:autocompiledmethod:: CTBinaryTreeAbstract>>#push:

repeatedly. The two cases above can be redone with shuffled collections, both

.. pharo:autocompiledmethod:: CTBinaryTreeAbstractTest>>#testPushShuffledInterval

  .. image:: ../../../Containers-BinaryTreeAbstract/images/CTBinaryTreeAbstractTest-testPushShuffledInterval.svg
    :align: center

and

.. pharo:autocompiledmethod:: CTBinaryTreeAbstractTest>>#testPushShuffledCollection

  .. image:: ../../../Containers-BinaryTreeAbstract/images/CTBinaryTreeAbstractTest-testPushShuffledCollection.svg
    :align: center

respectively.
