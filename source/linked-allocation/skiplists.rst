
Skip lists
**********

The first edition :cite:`crescenzi/algoritmi/1st` has a nice description of *skip lists*, also for the
proof of the complexity. Let us reproduce their working example,

.. pharo:autocompiledmethod:: CTSkipListTest>>#sutCrescenzi

  .. image:: ../../../Containers-SkipList/images/CTSkipListTest-testCrescenzi.svg
    :align: center

built by the message

.. pharo:autocompiledmethod:: CTSkipList_class>>#onSortedCollection:lowerBound:upperBound:atRandom:

used with a *geometric* random object,

.. pharo:autocompiledmethod:: CTSkipList_class>>#onSortedCollection:lowerBound:upperBound:

The lookup message,

.. pharo:autocompiledmethod:: CTSkipList>>#includes:equalityBlock:

allows us to assert that

.. image:: ../../../Containers-SkipList/images/CTSkipListTest-testProfileInclusion-key.svg
  :align: center

is included in the list by means of the interactions,

.. image:: ../../../Containers-SkipList/images/CTSkipListTest-testProfileInclusion-sequence-diagram.svg
  :align: center

The search performed during lookup is actually implemented in

.. pharo:autocompiledmethod:: CTSkipList>>#predecessors:

and is used also by insertion; by the way, in the second edition :cite:`crescenzi/algoritmi/2nd` is explained the insertion of 

.. image:: ../../../Containers-SkipList/images/CTSkipListTest-testProfileAdditionOf35-key.svg
  :align: center

at height 4 that produces

.. image:: ../../../Containers-SkipList/images/CTSkipListTest-testProfileAdditionOf35.svg
  :align: center

by means of the messages

.. pharo:autocompiledmethod:: CTSkipList>>#add:atHeight:

and

.. pharo:autocompiledmethod:: CTSkipList>>#add:atHeight:predecessors:

respectively. In order to see randomization, we add elements

.. image:: ../../../Containers-SkipList/images/CTSkipListTest-testProfileAddingFromScratch-elements.svg
  :align: center

one after the other to obtain the list

.. image:: ../../../Containers-SkipList/images/CTSkipListTest-testProfileAddingFromScratch.svg
  :align: center

which is initially built from an empty sorted collection. Here is what happened,

.. image:: ../../../Containers-SkipList/images/CTSkipListTest-testProfileAddingFromScratch-sequence-diagram.svg
  :align: center

Last, an arbitrary list with

.. image:: ../../../Containers-SkipList/images/CTSkipListTest-testInspectBigList-n.svg
  :align: center

elements looks like,

.. image:: ../../../Containers-SkipList/images/CTSkipListTest-testInspectBigList.svg
  :align: center
