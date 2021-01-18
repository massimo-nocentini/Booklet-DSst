
Links
*****

``Link`` objects
================

Our discussion starts with ``Link``, a tiny class that is included by default in a fresh image and has been defined as

.. pharo:autoclass:: Link
  :include-comment: yes

The simplest ``Link`` object is

.. pharo:autocompiledmethod:: CTLinkedStorageLinkTest>>#testEmptyLink

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageLinkTest-testEmptyLink.svg
    :align: center

Although we can use a ``Link`` to point to an arbitrary object, implicity ``nil`` in
the previous test case and explicity ``3`` in the following one,

.. pharo:autocompiledmethod:: CTLinkedStorageLinkTest>>#testLinkReferencingThree

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageLinkTest-testLinkReferencingThree.svg
    :align: center

a ``Link`` is designed for referencing a ``Link`` object, either a new one

.. pharo:autocompiledmethod:: CTLinkedStorageLinkTest>>#testLinkReferencingAnotherLink

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageLinkTest-testLinkReferencingAnotherLink.svg
    :align: center

or possibly itself

.. pharo:autocompiledmethod:: CTLinkedStorageLinkTest>>#testLinkReferencingItself

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageLinkTest-testLinkReferencingItself.svg
    :align: center

The previous two representations look the same but in memory are completely
different structures. To see this, we unroll the representation for the ``Link``
objects that are *recursively* referenced via the ``nextLink`` slot so that
both the usual structure

.. pharo:autocompiledmethod:: CTLinkedStorageLinkTest>>#testLinkReferencingAnotherLinkRecursive

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageLinkTest-testLinkReferencingAnotherLinkRecursive.svg
    :align: center

and the loop structure

.. pharo:autocompiledmethod:: CTLinkedStorageLinkTest>>#testLinkReferencingItselfRecursive

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageLinkTest-testLinkReferencingItselfRecursive.svg
    :align: center

are correcly drawn and the difference is now clear.  From now on we will use
the recursive representation in order to have the big picture of the structures
allocated in memory, so a combination of what we have seen so far looks as
follows

.. pharo:autocompiledmethod:: CTLinkedStorageLinkTest>>#testTwoLinksReferencingEachOtherRecursive

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageLinkTest-testTwoLinksReferencingEachOtherRecursive.svg
    :align: center

``ValueLink`` objects
=====================

With the addition of the ``value`` slot to the ``Link`` class we obtain the
``ValueLink`` class, precisely

.. pharo:autoclass:: ValueLink
  :include-comment: yes

and the binary message

.. pharo:autocompiledmethod:: Object>>#~~>

allows us to build a simple ``ValueLink`` as

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testSimpleValueLink

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testSimpleValueLink.svg
    :align: center

Of course, we can compose the application of ``#~~>`` to build an arbitrary long chain as

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#test21ValueLinks

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-test21ValueLinks.svg
    :align: center

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#test321ValueLinks

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-test321ValueLinks.svg
    :align: center

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#test4321ValueLinks

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-test4321ValueLinks.svg
    :align: center

Moreover, using the recursive representation we can have a look at all of them in one shot

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#test4321ValueLinksRecursive

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-test4321ValueLinksRecursive.svg
    :align: center

and in a simpler form

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#test4321ValueLinksSimplerRepr

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-test4321ValueLinksSimplerRepr.svg
    :align: center

As we have seen for ``Link`` objects, we can build a loop with ``ValueLink``
objects too, both implicitly

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#test11ValueLinksLoop

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-test11ValueLinksLoop.svg
    :align: center

and explicitly

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#test11ValueLinksLoopRecursive

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-test11ValueLinksLoopRecursive.svg
    :align: center

Finally, a combination of the constructions given before looks as follows

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#test43214ValueLinksRecursive

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-test43214ValueLinksRecursive.svg
    :align: center

and since we are in a loop, we can just skip a few times to get a different but
equivalent representation

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#test43214ValueLinksFrom2Recursive

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-test43214ValueLinksFrom2Recursive.svg
    :align: center

.. index::
  single: Sorting algorithms; Topological by associations of naturals
  single: TAOCP by Donald Knuth; Volume 1, Algorithm T at page 264



  
Test case: Topological sorting
------------------------------

Implementation of the *Algorithm T* in TAOCP by Donald Knuth, Volume 1 page 264.

The complexity is :math:`O(m + n)` where :math:`m` is the number of input
relations and :math:`n` is the number of (unique) objects represented by
naturals.  The message send ``c topologicalSortOnCycleDo: b``, where ``c`` is a
collection of associations :math:`(j, k) \in [1, n]^{2}` no holes allowed,
namely every natural *has* to be used in at least one input relation. And,
``b`` is a block consuming a collection of associations forming a cycle.



.. pharo:autocompiledmethod:: SequenceableCollection>>#topologicalSortByAssociations:onCycleDo:

  where

  .. pharo:autocompiledmethod:: TopologicalSortAlgorithm>>#value:onCycleDo:

  where

    .. pharo:autocompiledmethod:: Object>>#ignoreBlock:

    and

    .. pharo:autocompiledmethod:: Dictionary>>#anyAssociation

Testing for acyclic property can be done with the following message:

.. pharo:autocompiledmethod:: SequenceableCollection>>#isAcyclicWithRespectToAssociations:

Some tests are in order:

.. pharo:autocompiledmethod:: CollectionTest>>#testTopologicalSortOnCycleDo
.. pharo:autocompiledmethod:: CollectionTest>>#testTopologicalSortOnCycleDo1
.. pharo:autocompiledmethod:: CollectionTest>>#testTopologicalSortOnCycleDo2
.. pharo:autocompiledmethod:: CollectionTest>>#testTopologicalSortOnCycleDo3
  
  where
  
  .. pharo:autocompiledmethod:: SequenceableCollection>>#topologicalSortByAssociations:acyclicDo: 
