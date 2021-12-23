
Bits
****

Wizardry
========

The following manipulation have been adapted from :cite:`10.5555/1941953`.

Average without overflow
++++++++++++++++++++++++

.. pharo:autocompiledmethod:: Integer>>#bitAverage:
.. pharo:autocompiledmethod:: IntegerTest>>#testBitAverage

Toggling between values
+++++++++++++++++++++++

.. pharo:autocompiledmethod:: Integer>>#bitToggle:do:
.. pharo:autocompiledmethod:: IntegerTest>>#testBitToggleDo
.. pharo:autocompiledmethod:: IntegerTest>>#testBitToggleDo1

Next or previous even or odd value
++++++++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: Integer>>#previousEven
.. pharo:autocompiledmethod:: IntegerTest>>#testPreviousEven
.. pharo:autocompiledmethod:: Integer>>#nextEven
.. pharo:autocompiledmethod:: IntegerTest>>#testNextEven
.. pharo:autocompiledmethod:: Integer>>#previousOdd
.. pharo:autocompiledmethod:: IntegerTest>>#testPreviousOdd
.. pharo:autocompiledmethod:: Integer>>#nextOdd
.. pharo:autocompiledmethod:: IntegerTest>>#testNextOdd

The following messages return the unmodified argument if it has the required
property, else the nearest such value:

.. pharo:autocompiledmethod:: Integer>>#previousEvenOrSelf
.. pharo:autocompiledmethod:: IntegerTest>>#testPreviousEvenOrSelf
.. pharo:autocompiledmethod:: Integer>>#nextEvenOrSelf
.. pharo:autocompiledmethod:: IntegerTest>>#testNextEvenOrSelf
.. pharo:autocompiledmethod:: Integer>>#previousOddOrSelf
.. pharo:autocompiledmethod:: IntegerTest>>#testPreviousOddOrSelf
.. pharo:autocompiledmethod:: Integer>>#nextOddOrSelf
.. pharo:autocompiledmethod:: IntegerTest>>#testNextOddOrSelf
