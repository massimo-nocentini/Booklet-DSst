
Containers
**********

``LinkedList`` objects
======================

``ValueLink`` objects are small and allow us to compose them in an applicative
way so that we can share part of a composite structure among different client
objects so that those clients don't observe any side effect on the
``ValueLink`` objects they are currently referencing.

By the way, some applications prefer to have a manager object that handles
those links as a whole, hiding the inner machinery that keeps their structure
sound. Those managers are called *containers*. 

A ``ValueLink`` understands the ``#asLinkedList`` message to enclose itself in
a ``LinkedList`` container

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testAsLinkedList

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testAsLinkedList.svg
    :align: center

  where

  .. pharo:autocompiledmethod:: ValueLink>>#asLinkedList

    where

    .. pharo:autocompiledmethod:: Link>>#do:

Two observations are in order: 

* On one hand, since the slot ``nextLink`` hosts either a ``Link`` or ``nil``
  then the latter has to understand

  .. pharo:autocompiledmethod:: UndefinedObject>>#asLinkedList

  too and it behaves as follows

  .. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testNilAsLinkedList

    .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testNilAsLinkedList.svg
      :align: center

* On the other hand, since a ``ValueLink`` could keep a recursive structure
  then all the values are kept as well

  .. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testAsLinkedList4321

    .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testAsLinkedList4321.svg
      :align: center
  
Finally, the definition and class comment of ``LinkedList`` follows

.. pharo:autoclass:: LinkedList
  :include-comment: md

respectively.


