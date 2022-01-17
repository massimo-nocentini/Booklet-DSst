
Randomization
*************

:math:`k`\-th element selection
===============================

Let

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testInspectProbabilisticMedian-original.svg
  :align: center

be a collection that has

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testInspectProbabilisticMedian.svg
  :align: center

as median value. We can either compute it by sorting in :math:`O(n\,\log{n})` time,

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testInspectProbabilisticMedian-sorted.svg
  :align: center

then looking for the element at the middle; or, by using a randomized approach,

.. pharo:autocompiledmethod:: SequenceableCollection>>#kth:ranking:atRandom:

from :cite:`10.5555/1177299` page 53, that produces the interactions

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testInspectProbabilisticMedian-sequence-diagram.svg
  :align: center

where the message

.. pharo:autocompiledmethod:: SequenceableCollection>>#atRandom:

also appears to show the *pivot* element choosen at each splitting.
Sorting is doing far more work than looking for the middle element and don’t
care about the relative ordering of the rest of elements. The recurrence of the
implementation looks like

.. math::

   T(n) ≤ T\left({{3}\over{4}}\,n\right) + O(n)

so on any input, the algorithm returns the correct answer after a *linear* number
of steps, on the average.  The two approaches can also be compared,

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectProbabilisticMedianRatioWithSorting

differing by a factor of 2 in speed, at least.

