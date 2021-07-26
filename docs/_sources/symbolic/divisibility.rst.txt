
Divisibility
************

Quotients and remainders
========================

Lets divide :math:`20` by :math:`9`,

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testStandardQuoRem21Over9

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testStandardQuoRem21Over9.svg
    :align: center

by means of the binary message

.. pharo:autocompiledmethod:: Integer>>#/%

that dispatches

.. pharo:autocompiledmethod:: Integer>>#quoRemInteger:

which instantiate a symbolic ``Magnitude`` object via the class-side message

.. pharo:autocompiledmethod:: QuoRemComplementary_class>>#a:b:

where both the *quotient* and the *remainder* are computed in the overridden

.. pharo:autocompiledmethod:: QuoRemStandard>>#initialize

as the usual computation does and the assertion checks in the initial test case.

The same division can be carried out by

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testComplementaryQuoRem21Over9

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testComplementaryQuoRem21Over9.svg
    :align: center

that yields a negative remainder, shown by full dots. To do that, we have the following messages chain

.. pharo:autocompiledmethod:: Integer>>#/%~

that dispatches

.. pharo:autocompiledmethod:: Integer>>#quoRemComplementaryInteger:

which instantiate a symbolic ``Magnitude`` object of class

.. pharo:autoclass:: QuoRemComplementary

Both the *quotient* and the *remainder* are computed in the initialization message

.. pharo:autocompiledmethod:: QuoRemComplementary>>#initialize

The latter representation is uniform in the sense that it yields a rectangle of dots
that are stacked horizontally, where the number of rows equals the quotient of the division
while the number of columns equals the divisor denoted by the instance variable ``b``.

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testComplementaryQuoRem9Over21

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testComplementaryQuoRem9Over21.svg
    :align: center

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testQuoRem9Over21

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testQuoRem9Over21.svg
    :align: center

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testQuoRemMinimal9Over21

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testQuoRemMinimal9Over21.svg
    :align: center
   
Greatest Common Divisor
=======================

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testGCDof9and21

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testGCDof9and21.svg
    :align: center

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testGCDof12and21

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testGCDof12and21.svg
    :align: center

Diophantine equations
=====================

Coprimes
++++++++

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testGCDof83and71

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testGCDof83and71.svg
    :align: center

:math:`\mathbb{Z}_{17}` field
+++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testGCDofZ17

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testGCDofZ17.svg
    :align: center

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testGCDofMultiplicativeInversesInZ17

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testGCDofMultiplicativeInversesInZ17.svg
    :align: center

:math:`GCD(F_{n}, F_{n+1})`, where :math:`F_{n}` is the :math:`n`\-th Fibonacci number
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: SymbolicIntegerTest>>#testGCDofAdjacentFibonacciNumbers

  .. image:: ../../../Containers-Essentials/images/SymbolicIntegerTest-testGCDofAdjacentFibonacciNumbers.svg
    :align: center

.. _kissing-fractions-diophantine:

Kissing ``Fraction``\s
++++++++++++++++++++++

Consider the ``Fraction``

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectFractionForKisses

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectFractionForKisses.svg
    :align: center

which kisses other fractions, by tangents of Ford's circles

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectFractionKissing

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectFractionKissing.svg
    :align: center

where

.. pharo:autocompiledmethod:: Fraction>>#kissingFractions

and the polymorphism on ``#kissingFractionLink:`` reads as follows

.. pharo:autocompiledmethod:: Fraction>>#kissingFractionLink:
.. pharo:autocompiledmethod:: Integer>>#kissingFractionLink:

Moreover, consider the reciprocal

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectFractionReciprocalKissing

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectFractionReciprocalKissing.svg
    :align: center

which yields a simpler visualization.
