
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

.. pharo:autoclass:: LinkedList

for example,

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
  
Additionally, ``LinkedList`` objects can be built using other objects than
``ValueLink`` ones, for example sending ``#as:`` to an ``Interval``, 

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testAsLinkedListFromInterval

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testAsLinkedListFromInterval.svg
    :align: center

  where

  .. pharo:autocompiledmethod:: Number>>#to:by:

  and

  .. pharo:autoclass:: Interval
    :include-comment: yes

Moreover, from a ``SequenceableCollection`` we can revert back to a ``ValueLink`` with,

.. pharo:autocompiledmethod:: SequenceableCollection>>#asValueLink

  where ``#foldr:init:`` folds by associating to the right,

  .. pharo:autocompiledmethod:: SequenceableCollection>>#foldr:init:

as we can see in the following example

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testAsValueLink

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testAsValueLink.svg
    :align: center

Using another folding message ``#inject:into:`` that associates to the left,

.. pharo:autocompiledmethod:: Collection>>#inject:into:

we obtain a ``ValueLink`` that keeps the same elements in *reversed* order,

.. pharo:autocompiledmethod:: CTLinkedStorageValueLinkTest>>#testAsValueLinkInjectInto

  .. image:: ../../../Containers-LinkedStoragePool/images/CTLinkedStorageValueLinkTest-testAsValueLinkInjectInto.svg
    :align: center





