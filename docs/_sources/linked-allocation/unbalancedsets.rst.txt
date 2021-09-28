
``CTUnbalancedSet`` containers
******************************

A *search binary tree* is defined by subclassing

.. pharo:autoclass:: CTUnbalancedSet

and the corresponding test class defines,

.. pharo:autocompiledmethod:: CTUnbalancedSetTest>>#tree:

that uses

.. pharo:autocompiledmethod:: Collection>>#asUnbalancedSet

to show the following inspectors. First, the empty tree looks like

.. image:: ../../../Containers-RedBlackSet/images/CTUnbalancedSetTest-testCreation.svg
  :align: center

Second, we have the four cases:

- sorted data in arrayed collection,

  .. image:: ../../../Containers-RedBlackSet/images/CTUnbalancedSetTest-testPushOrderedInterval.svg
    :align: center

  by means of

  .. pharo:autocompiledmethod:: CTBinaryTreeNodeUnbalanced>>#mergeBinaryTreeElement:inBinaryTree:

- sorted data in ordered collection,

  .. image:: ../../../Containers-RedBlackSet/images/CTUnbalancedSetTest-testPushOrderedCollection.svg
    :align: center

  by means of

  .. pharo:autocompiledmethod:: CTUnbalancedSet>>#push:

  that, first uses

  .. pharo:autocompiledmethod:: BlockClosure>>#valueWithArgumentedExit

  and, second, dispatches over

  .. pharo:autocompiledmethod:: CTBinaryTreeNodeUnbalanced>>#push:witness:continuation:inSet:
  .. pharo:autocompiledmethod:: CTBinaryTreeEmptyUnbalanced>>#push:witness:continuation:inSet:

  where the latter delegates to 

  .. pharo:autocompiledmethod:: CTUnbalancedSet>>#pushingAlreadyIncluded:continuation:

  .. note::

    The ``push:`` message with its dispatched messages implements the technique
    described in :cite:`https://doi.org/10.1002/spe.4380211009`, originally
    pointed out by :cite:`okasaki_1998` at page 14, that does :math:`d+1`
    comparisons, where :math:`d` is the depth of the tree, respect to :math:`2d`
    in the worst case.
  
- shuffled data in arrayed collection,

  .. image:: ../../../Containers-RedBlackSet/images/CTUnbalancedSetTest-testPushShuffledInterval.svg
    :align: center

- shuffled data in ordered collection,

  .. image:: ../../../Containers-RedBlackSet/images/CTUnbalancedSetTest-testPushShuffledCollection.svg
    :align: center

Observe that the constraint of uniqueness of objects is respected,

.. pharo:autocompiledmethod:: CTUnbalancedSetTest>>#testPushDoubledObject

  .. image:: ../../../Containers-RedBlackSet/images/CTUnbalancedSetTest-testPushDoubledObject-original.svg
    :align: center

  .. image:: ../../../Containers-RedBlackSet/images/CTUnbalancedSetTest-testPushDoubledObject-augmented.svg
    :align: center
 
.. note::

  According to the exercises 2.3 and 2.4 of :cite:`okasaki_1998`, the
  underlying linked structure isn't doubled as the second assert checks, by
  means of the *context-return block* passed at the start of a ``push:`` and
  invoked in the leaves in case of doubles.
