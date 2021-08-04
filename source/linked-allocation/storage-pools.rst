

Storage pools
*************

The Knuth's description of linked allocation begins at page 254 of :cite:`10.5555/260999`.

.. note::

  .. epigraph::

     "But even more importantly, there is often an implicit *gain* in storage by the linked
     memory approach, since tables can overlap, sharing common parts; [...]
     The usefulness of linked memory is predicated on the fact that in the large majority
     of applications we want to walk through lists sequentially, not randomly. [...]
     The linked scheme lends itself immediately to more intricate structures that simple
     linear lists. We can have a variable number of variable-size lists; any node
     of the list may be a starting point for another list; the nodes may simultaneously
     be linked together in several orders corresponding to different lists; and so on."

     -- Donald E. Knuth

We start with the mechanism that supplies space for a new node, by the class

.. pharo:autoclass:: CTLinkedStoragePool

which implements both *operation (4)*,

.. pharo:autocompiledmethod:: CTLinkedStoragePool>>#allocateOrReuseLink

where

.. pharo:autocompiledmethod:: CTLinkedStoragePool>>#newLink

and *operation (5)*

.. pharo:autocompiledmethod:: CTLinkedStoragePool>>#releaseLink:

allow us to call *storage pool* the set of all nodes that can be allocated
according to these messages.

``Stack`` pool
==============

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testEmptyStack

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testEmptyStack.svg
    :align: center

Have a look at the following manipulations, starting with an empty stack pool,

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testSomePushesThenPopsOnStack

by pushing 3,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnStack-1.svg
  :align: center

then push 4,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnStack-2.svg
  :align: center

then push 5,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnStack-3.svg
  :align: center

then pop,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnStack-4.svg
  :align: center

then pop,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnStack-5.svg
  :align: center

then pop,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnStack-6.svg
  :align: center

then push 6,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnStack-7.svg
  :align: center

respectively. We cannot pop from an empty stack,

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testPopFromEmptyStack

as required. Finally, lets see how to swipe the entire pool in one shot, 

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testRemoveAllFromStack
   
first push 5 elements and then pop 2 of them in order to have some room available,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testRemoveAllFromStack-full.svg
  :align: center

then swipe out by means of the message

.. pharo:autocompiledmethod:: CTLinkedStoragePoolStack>>#removeAll

to have

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testRemoveAllFromStack-empty.svg
  :align: center

as required.


``Queue`` pool
==============

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testEmptyQueue

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testEmptyQueue.svg
    :align: center

Have a look at the following manipulations, starting with an empty queue pool,

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testSomePushesThenPopsOnQueue

by pushing 3,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnQueue-1.svg
  :align: center

then push 4,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnQueue-2.svg
  :align: center

then push 5,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnQueue-3.svg
  :align: center

then pop,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnQueue-4.svg
  :align: center

then pop,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnQueue-5.svg
  :align: center

then pop,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnQueue-6.svg
  :align: center

then push 6,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnQueue-7.svg
  :align: center

respectively. We cannot pop from an empty queue,

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testPopFromEmptyQueue

as required. Finally, lets see how to swipe the entire pool in one shot, 

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testRemoveAllFromQueue
   
first push 5 elements and then pop 2 of them in order to have some room available,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testRemoveAllFromQueue-full.svg
  :align: center

then swipe out by means of the message

.. pharo:autocompiledmethod:: CTLinkedStoragePoolQueue>>#removeAll

to have

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testRemoveAllFromQueue-empty.svg
  :align: center

as required.

``CircularList`` pool
=====================

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testEmptyCircularList

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testEmptyCircularList.svg
    :align: center

Have a look at the following manipulations, starting with an empty queue pool,

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testSomePushesThenPopsOnCircular

by pushing 3,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnCircular-1.svg
  :align: center

then push 4,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnCircular-2.svg
  :align: center

then push 5,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnCircular-3.svg
  :align: center

then pop,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnCircular-4.svg
  :align: center

then pop,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnCircular-5.svg
  :align: center

then pop,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnCircular-6.svg
  :align: center

then push 6,

.. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnCircular-7.svg
  :align: center

respectively. We cannot pop from an empty queue,

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testPopFromEmptyCircular

Addition of *polynomials*
+++++++++++++++++++++++++

Consider the addition of two polynomials,

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testPolynomialAdditionFromKnuthTextbook

let :math:`p` be

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testPolynomialAdditionFromKnuthTextbook-p.svg
    :align: center

and let :math:`q` be

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testPolynomialAdditionFromKnuthTextbook-q.svg
    :align: center

yield polynomial :math:`r` 

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testPolynomialAdditionFromKnuthTextbook-r.svg
    :align: center
