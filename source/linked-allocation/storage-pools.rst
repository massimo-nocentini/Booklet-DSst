

Storage pools
*************

The Knuth's description of linked allocation begins at page 254 of :cite:`10.5555/260999`, 
in particular the citation

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

shows the importance of this subject. We start with the mechanism that supplies space
for a new node, by the class

.. pharo:autoclass:: CTLinkedStoragePool

which implements both operation (4),

.. pharo:autocompiledmethod:: CTLinkedStoragePool>>#allocateOrReuseLink

where

.. pharo:autocompiledmethod:: CTLinkedStoragePool>>#newLink

and operation (5)

.. pharo:autocompiledmethod:: CTLinkedStoragePool>>#releaseLink:

allow us to call *storage pool* the set of all nodes that can be allocated
according to these messages.

``Stack`` pool
==============

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testEmptyStack

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testEmptyStack.svg
    :align: center

.. pharo:autocompiledmethod:: CTLinkedStoragePoolTest>>#testSomePushesThenPopsOnStack

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStoragePoolTest-testSomePushesThenPopsOnStack.svg
    :align: center
