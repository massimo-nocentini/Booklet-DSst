
Numbers
*******

Fibonacci numbers
=================

.. index::
  single: Sequence diagrams; Fibonacci numbers, exponential

Exponential implementation
++++++++++++++++++++++++++

Let

.. pharo:autocompiledmethod:: Integer>>#slowFibonacci

in

.. pharo:autocompiledmethod:: MWVisualizationsTest>>#testProfileSlowFibonacciWithAdd

  .. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testProfileSlowFibonacciWithAdd-sequence-diagram.svg
    :align: center

.. index::
  single: Sequence diagrams; Fibonacci numbers, additions

Moreover, we can inspect the sequence of *additions* that are performed,

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testProfileSlowFibonacciWithAddOnly-sequence-diagram.svg
    :align: center

.. index::
  single: Sequence diagrams; Fibonacci numbers, memoized

Memoized implementation
+++++++++++++++++++++++

To take the exponential complexity of the previous implementation we can use either memoization,

.. pharo:autocompiledmethod:: MWVisualizationsTest>>#testProfileSlowFibonacciMemoingWithAdd

  .. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testProfileSlowFibonacciMemoingWithAdd-sequence-diagram.svg
    :align: center

where

.. pharo:autocompiledmethod:: Integer>>#slowFibonacciMemo:

.. index::
  single: Sequence diagrams; Fibonacci numbers, tail-calls

Tail-call implementation
++++++++++++++++++++++++

Or tail-call messages,

.. pharo:autocompiledmethod:: MWVisualizationsTest>>#testProfileSlowFibonacciTailWithAdd

  .. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testProfileSlowFibonacciTailWithAdd-sequence-diagram.svg
    :align: center

where

.. pharo:autocompiledmethod:: Integer>>#slowFibonacci:tail:

Multiplication
==============

*Horner*\'s method
++++++++++++++++++

Let

.. pharo:autocompiledmethod:: SequenceableCollection>>#horner:init:

in

.. pharo:autocompiledmethod:: MWVisualizationsTest>>#testSequenceableCollectionHornerInit

  .. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testSequenceableCollectionHornerInit.svg
    :align: center

.. index::
  single: Sequence diagrams; Horner's method

that admits the profiling,

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testSequenceableCollectionHornerInit-sequence-diagram.svg
  :align: center

.. index::
  single: Divide and Conquer; Estrin's method

*Estrin*\'s method
++++++++++++++++++

According to :cite:`10.1145/1460361.1460365`, let

.. pharo:autocompiledmethod:: SequenceableCollection>>#estrin:init:

in

.. pharo:autocompiledmethod:: MWVisualizationsTest>>#testSequenceableCollectionEstrinInit

  .. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testSequenceableCollectionEstrinInit.svg
    :align: center

.. index::
  single: Sequence diagrams; Estrin's method

where 

.. pharo:autocompiledmethod:: SequenceableCollection>>#estrin:

admits the profiling,

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testSequenceableCollectionEstrinInit-sequence-diagram.svg
  :align: center

.. index::
  single: Divide and Conquer; Karatsuba's method

*Karatsuba*\'s method
+++++++++++++++++++++

Here we explore a large integer 

..
  .. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectLargeInteger

.. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectLargeInteger.svg
  :align: center

that equals :math:`(42!)^{2}` where squaring is performed by multiplication of
:math:`42!` with itself by means of the message

.. pharo:autocompiledmethod:: Integer>>#dcMultiplyInteger:base:

according to the algorithm described in :cite:`10.5555/1051910`, page 232.
Such algorithm runs in :math:`O(n^{\log_{2}{3}})` because the input numbers
:math:`x` and :math:`y`, 

.. math::

  x = x_{a}\cdot 10^{a} + x_{a-1}\cdot 10^{a-1} + \cdots + x_{1}\cdot 10^{1} + x_{0}\cdot 10^{0} \\
  y = y_{b}\cdot 10^{b} + y_{b-1}\cdot 10^{b-1} + \cdots + y_{1}\cdot 10^{1} + y_{0}\cdot 10^{0} 

and let :math:`n = \max(a, b)`, are broken in *two* parts

.. math::

  x = x_{1}\cdot 10^{{{n}\over{2}}} + x_{0} \\
  y = y_{1}\cdot 10^{{{n}\over{2}}} + y_{0}

respectively, and there are *three* recursive ``#dcMultiplyInteger:base:`` message sends.
The implementation follows from both the fact

.. math::

  x\,y = x_{1}\,y_{1}\cdot 10^{n} + (x_{1}\,y_{0} + x_{0}\,y_{1})\cdot 10^{{{n}\over{2}}} + x_{0}\,y_{0}

and 

.. math::

  (x_{1} + x_{0})\,(y_{1} + y_{0}) = x_{1}\,y_{1} + \left(x_{1}\,y_{0} + x_{0}\,y_{1}\right) + x_{0}\,y_{0}

respectively, more references can also be found in
:cite:`wikipedia/Karatsuba-algorithm`. Two auxiliary messages

.. pharo:autocompiledmethod:: Integer>>#halves:base:

and

.. pharo:autocompiledmethod:: Integer>>#halves:at:digits:base:

helps the recursive message. 

.. index::
  single: Sequence diagrams; Karatsuba's method

A complete profiling of :math:`835 \cdot 714` using this technique looks like

..
  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectLargeIntegerProfiled-contexts-tree.svg
    :align: center

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testInspectLargeIntegerProfiled-sequence-diagram.svg
  :align: center


Factorials
++++++++++

According the post :cite:`sven/speeding-up-factorial`, we implement the factorial
function twice in order to compute 

.. math::

  16! = 20922789888000

On one hand, the slow version follows straightforward from the mathematical definition,  

.. pharo:autocompiledmethod:: Integer>>#factorialRecursive

and the interactions are

.. index::
  single: Sequence diagrams; Factorial, slow

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testInspectFactorialRecursive-sequence-diagram.svg
  :align: center

On the other hand, the fast version uses a divide and conquer approach,

.. index::
  single: Divide and Conquer; Factorial, fast

.. pharo:autocompiledmethod:: Integer>>#productTo:

and the interactions are

.. index::
  single: Sequence diagrams; Factorial, fast

.. image:: ../../../../bauing-schmidt/MethodWrappers/images/MWVisualizationsTest-testInspectProductTo-sequence-diagram.svg
  :align: center

Quotients and remainders
========================

Lets divide :math:`21` by :math:`9`,

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

:math:`GCD(f_{n}, f_{n+1})`, where :math:`f_{n}` is the :math:`n`\-th Fibonacci number
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


*Skew Binary Canonical* sparse representation
=============================================

Using the conversion message

.. pharo:autocompiledmethod:: Integer>>#asSkewBinaryCanonicalSparse

we can inspect by means of the test case

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectSkewBinaryCanonicalSparse

that does its asserts using the backward conversion message,

.. pharo:autocompiledmethod:: SkewBinaryCanonicalNumber>>#asInteger

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectSkewBinaryCanonicalSparse-increasing.svg
    :align: center
  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectSkewBinaryCanonicalSparse-decreasing.svg
    :align: center
