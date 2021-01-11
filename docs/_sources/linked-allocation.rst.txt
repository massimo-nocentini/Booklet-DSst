
Linked memory allocation
========================

``Link`` objects
----------------

Our discussion starts with ``Link``, a tiny class that is included by default in a fresh image and has been defined as

.. pharo:autoclass:: Link
  :include-comment: yes

The simplest ``Link`` object is

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testEmptyLink

  .. image:: ../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testEmptyLink.svg
    :align: center

Although we can use a ``Link`` to point to an arbitrary object, implicity ``nil`` in
the previous test case and explicity ``3`` in the following one,

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testLinkReferencingThree

  .. image:: ../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testLinkReferencingThree.svg
    :align: center

a ``Link`` is designed for referencing a ``Link`` object, either a new one

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testLinkReferencingAnotherLink

  .. image:: ../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testLinkReferencingAnotherLink.svg
    :align: center

or possibly itself

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testLinkReferencingItself

  .. image:: ../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testLinkReferencingItself.svg
    :align: center

The previous two representations look the same but in memory are completely
different structures. To see this, we unroll the representation for the ``Link``
objects that are *recursively* referenced via the ``nextLink`` slot so that
both the usual structure

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testLinkReferencingAnotherLinkRecursive

  .. image:: ../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testLinkReferencingAnotherLinkRecursive.svg
    :align: center

and the loop structure

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testLinkReferencingItselfRecursive

  .. image:: ../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testLinkReferencingItselfRecursive.svg
    :align: center

are correcly drawn and the difference is now clear. For the sake of clarity the
unrolling rests on

.. pharo:autocompiledmethod:: Link>>#recursiveReferences

  where

  .. pharo:autocompiledmethod:: Link>>#do:

From now on we will use the recursive representation in order to have the big picture of the structures allocated in memory, 
so a combination of what we have seen so far looks as follows

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testTwoLinksReferencingEachOtherRecursive

  .. image:: ../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testTwoLinksReferencingEachOtherRecursive.svg
    :align: center

``LinkedList`` objects
----------------------

.. pharo:autoclass:: LinkedList
  :include-comment: md

