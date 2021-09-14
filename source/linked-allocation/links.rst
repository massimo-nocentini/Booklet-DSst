
Links
*****

``Link`` objects
================

Our discussion starts with a tiny class ``Link`` that is provided by default in
a fresh image; its definition follows,

.. pharo:autoclass:: Link
  :include-comment: yes

The simplest ``Link`` object is

.. pharo:autocompiledmethod:: CTLinksLinkTest>>#testEmptyLink

  .. image:: ../../../Containers-Links/images/CTLinksLinkTest-testEmptyLink.svg
    :align: center

where the object ``nil`` is used to interrupt a chain of references; in particular, here we
have a chain of just *one* link object. To augment such a chain, we can 

- either create a new ``Link`` object and then link the previous one to it,

  .. pharo:autocompiledmethod:: CTLinksLinkTest>>#testLinkReferencingAnotherLink

    .. image:: ../../../Containers-Links/images/CTLinksLinkTest-testLinkReferencingAnotherLink.svg
      :align: center

- or link the ``Link`` to itself to have an implicitly infinite chain,

  .. pharo:autocompiledmethod:: CTLinksLinkTest>>#testLinkReferencingItself

    .. image:: ../../../Containers-Links/images/CTLinksLinkTest-testLinkReferencingItself.svg
      :align: center

by the message ``next:`` understood by ``Link`` objects,

.. pharo:autocompiledmethod:: Link>>#next:

that dispatches the message

.. pharo:autocompiledmethod:: Link>>#nextFromLink:

that dispatches back the message

.. pharo:autocompiledmethod:: Link>>#nextLink:

which sets the connection, actually. Of course, we can create arbitrary long
(possibly endless) chains,

.. pharo:autocompiledmethod:: CTLinksLinkTest>>#testThreeLinksReferencingEachOther

  .. image:: ../../../Containers-Links/images/CTLinksLinkTest-testThreeLinksReferencingEachOther.svg
    :align: center

and we can skip and move forward with

.. pharo:autocompiledmethod:: CTLinksLinkTest>>#testLinkNext3

  .. image:: ../../../Containers-Links/images/CTLinksLinkTest-testLinkNext3.svg
    :align: center

by means of polymorphism over the ``nextFromLink:`` message also undertood by
``Integer`` objects,

.. pharo:autocompiledmethod:: Integer>>#nextFromLink:

that dispatches back again to ``Link`` objects

.. pharo:autocompiledmethod:: Link>>#nextInteger:

to actually skim over the chain of links, raising an exception if a ``Link`` is
requested to skip too much,

.. pharo:autocompiledmethod:: CTLinksLinkTest>>#testThreeLinksTooMuchSkipping

``ValueLink`` objects
=====================

A ``Link`` by itself encodes just a node of a chain. We can augment those
objects such that each node in the chain carries a *value* also, to have a
*chain of values* actually. Such new objects belong to the class

.. pharo:autoclass:: ValueLink
  :include-comment: yes

and the binary message

.. pharo:autocompiledmethod:: Object>>#~~>

allows us to build a simple ``ValueLink`` as

.. pharo:autocompiledmethod:: CTLinksValueLinkTest>>#testSimpleValueLink

  .. image:: ../../../Containers-Links/images/CTLinksValueLinkTest-testSimpleValueLink.svg
    :align: center

and by means of composition, to build an arbitrary long chain as

.. pharo:autocompiledmethod:: CTLinksValueLinkTest>>#test21ValueLinks

  .. image:: ../../../Containers-Links/images/CTLinksValueLinkTest-test21ValueLinks.svg
    :align: center

,

.. pharo:autocompiledmethod:: CTLinksValueLinkTest>>#test321ValueLinks

  .. image:: ../../../Containers-Links/images/CTLinksValueLinkTest-test321ValueLinks.svg
    :align: center

and

.. pharo:autocompiledmethod:: CTLinksValueLinkTest>>#test4321ValueLinks

  .. image:: ../../../Containers-Links/images/CTLinksValueLinkTest-test4321ValueLinks.svg
    :align: center

respectively. 

.. attention::

  The examples concerning recursion shows why a nested representation like

  .. pharo:autocompiledmethod:: CTLinksValueLinkTest>>#test4321ValueLinksNested

    .. image:: ../../../Containers-Links/images/CTLinksValueLinkTest-test4321ValueLinksNested.svg
      :align: center

  should be considered less expressive than the linked one.

As we have seen for ``Link`` objects, we can build a loop with ``ValueLink``
objects too, either a cycle of length 1

.. pharo:autocompiledmethod:: CTLinksValueLinkTest>>#test11ValueLinksLoop

  .. image:: ../../../Containers-Links/images/CTLinksValueLinkTest-test11ValueLinksLoop.svg
    :align: center

or greater than 1 

.. pharo:autocompiledmethod:: CTLinksValueLinkTest>>#test43214ValueLinks

  .. image:: ../../../Containers-Links/images/CTLinksValueLinkTest-test43214ValueLinks.svg
    :align: center

The examples seen so far show a tight connection among the way we connect
``ValueLink``\s with the strategy used by *stacks* to keep a collection of
objects; more about that will be explored in subsequent sections.


.. index::
  single: Sorting algorithms; Topological by associations of naturals
  single: TAOCP by Donald Knuth; Volume 1, Algorithm T at page 264
  single: Test cases; Topological sort
  
Topological sorting
+++++++++++++++++++

Implementation of the *Algorithm T* in TAOCP by Donald Knuth, Volume 1 page 264.

The complexity is :math:`O(m + n)` where :math:`m` is the number of input
relations and :math:`n` is the number of (unique) objects represented by
naturals.  The message send ``c topologicalSortOnCycleDo: b`` computes provided that:

- ``c`` is a collection of associations :math:`(j, k) \in [1, n]^{2}` no holes allowed,
  namely every natural *has* to be used in at least one input relation. 
- ``b`` is a block consuming a collection of associations forming a cycle.

.. index::
  single: GitHub Pull Requests; 7457 - Topological sort

The following implementation had been proposed in the PR
https://github.com/pharo-project/pharo/pull/7457.

.. pharo:autocompiledmethod:: SequenceableCollection>>#topologicalSortByAssociations:onCycleDo:

  where

  .. pharo:autocompiledmethod:: TopologicalSortAlgorithm>>#value:onCycleDo:

  where

    .. pharo:autocompiledmethod:: TopologicalSortAlgorithm>>#makeValueLinksTable

    and

    .. pharo:autocompiledmethod:: TopologicalSortAlgorithm>>#initializeValueLinksTable:

    and

    .. pharo:autocompiledmethod:: TopologicalSortAlgorithm>>#sinksOfValueLinksTable:

      where

        .. pharo:autocompiledmethod:: Association>>#ifSink:otherwise:forTopologicalSortAlgorithm:

    and

    .. pharo:autocompiledmethod:: TopologicalSortAlgorithm>>#sortOn:sinksValueLink:valueLinksTable:

      where

      .. pharo:autocompiledmethod:: Object>>#yourself:
      
      and

      .. pharo:autocompiledmethod:: Association>>#decrementCountIfZero:forTopologicalSortAlgorithm:

    and

    .. pharo:autocompiledmethod:: TopologicalSortAlgorithm>>#handleCycleInValueLinksTable:do:

      where

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
