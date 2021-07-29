
Hierarchies
***********

``Magnitude`` hierarchy
=======================

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testMagnitudeSubclasses

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testMagnitudeSubclasses.svg
    :align: center

The character ``π``
+++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectCharacterPi

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectCharacterPi.svg
    :align: center

``DateAndTime``, now
++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectDatetimeNow

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectDatetimeNow.svg
    :align: center

The integer ``13`` in various representations
+++++++++++++++++++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectInteger13

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectInteger13.svg
    :align: center

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectInteger13Detailed

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectInteger13Detailed.svg
    :align: center

The irrational ``π``
++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectFloatPi

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectFloatPi.svg
    :align: center

The Golden ratio
++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectGoldenRatio

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectGoldenRatio.svg
    :align: center

A (reflective) ``Association``
++++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectAssociation

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectAssociation.svg
    :align: center

Some ``Fraction``\s, with kisses by *mediants*
++++++++++++++++++++++++++++++++++++++++++++++

Have a look at the fraction :math:`- {{1} \over {2}}` by the following inspector,

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectFraction

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectFraction.svg
    :align: center

Some fractions kiss each other,  here we see kisses by *mediants* via the
polymorphism of the message ``#\/``,

.. pharo:autocompiledmethod:: Fraction>>#\/
.. pharo:autocompiledmethod:: Integer>>#\/

that both implementations dispatch back to their arguments according to

.. pharo:autocompiledmethod:: Integer>>#mediantFraction:
.. pharo:autocompiledmethod:: Fraction>>#mediantFraction:

for the former and to

.. pharo:autocompiledmethod:: Integer>>#mediantInteger:
.. pharo:autocompiledmethod:: Fraction>>#mediantInteger:

for the latter. Now we can see some kisses,

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectFractionKissingEnumeration

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectFractionKissingEnumeration.svg
    :align: center

where 

.. pharo:autocompiledmethod:: BlockClosure>>#kissingFractions

lies on the utility message

.. pharo:autocompiledmethod:: SequenceableCollection>>#overlappingPairsDo:

understood by objects that play the role of a container, the subject of the
next section.  

.. seealso::

  On one hand, more kissing fractions by *Diophantine equations* are the
  subject of the section :ref:`kissing-fractions-diophantine`; on the other
  hand, both :cite:`20120731/fractions-and-semiotics` and
  :cite:`10.4169/amer.math.monthly.121.05.391` are inspired by the seminal work
  :cite:`10.2307/2302799`.

``Collection`` hierarchy
========================

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testCollectionSubclasses

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testCollectionSubclasses.svg
    :align: center

Lorem ipsum
+++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectString

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectString.svg
    :align: center

An ``Array`` of (generalized) Fibonacci numbers
+++++++++++++++++++++++++++++++++++++++++++++++

Two famous sequences of numbers :cite:`oeis/fibonacci-numbers` and :cite:`oeis/lucas-numbers`, of *Fibonacci* numbers

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspect20FibonacciNumbers

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspect20FibonacciNumbers.svg
    :align: center

and of *Lucas* numbers

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspect20LucasNumbers

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspect20lucasNumbers.svg
    :align: center

respectively, where both of them

.. pharo:autocompiledmethod:: Integer>>#fibonacciNumbers
.. pharo:autocompiledmethod:: Integer>>#lucasNumbers

lie on

.. pharo:autocompiledmethod:: Integer>>#gibonacciNumbersFirst:second:do:

Binary Reflected Gray Codes
+++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectBRGCodes

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectBRGCodes.svg
    :align: center

where the message

.. pharo:autocompiledmethod:: Integer>>#asShapeBRGCDots

relies on both

.. pharo:autocompiledmethod:: Integer>>#bitBRGC

that computes the Gray representation corresponding to the receiver ``Integer``, and

.. pharo:autocompiledmethod:: Integer>>#asShapeBinaryDots:

that computes the dots-oriented representation, empty dots stand for 0s while
full dots stand for 1s.

A ``Heap``, step by step construction
+++++++++++++++++++++++++++++++++++++

Here we construct a heap according to the given sequence (*order matters*),

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectHeap

step by step as shown below

.. list-table:: 

  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-1.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-2.svg
        :align: center
  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-3.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-4.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-5.svg
        :align: center
  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-6.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-7.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-8.svg
        :align: center
  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-9.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-10.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-11.svg
        :align: center
  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-12.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-13.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-14.svg
        :align: center
  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-15.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-16.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-17.svg
        :align: center
  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-18.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-19.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-20.svg
        :align: center
  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-21.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-22.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-23.svg
        :align: center
  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-24.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-25.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-26.svg
        :align: center
  * - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-27.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-28.svg
        :align: center
    - .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-29.svg
        :align: center

to get

.. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectHeap-30.svg
  :align: center

which is the final object.

A ``Set``
+++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectSet

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectSet.svg
    :align: center

``Random`` hierarchy
====================

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testRandomSubclasses

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testRandomSubclasses.svg
    :align: center

The *uniform* distribution
++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: RandomTestDistributions>>#testUniform

  .. image:: ../../../Containers-Essentials/images/RandomTestDistributions-testUniform.svg
    :align: center

where both messages

.. pharo:autocompiledmethod:: Random>>#next
.. pharo:autocompiledmethod:: Random>>#privateNextValue

lie on the message

.. pharo:autocompiledmethod:: Random>>#privateNextSeed

which provides the implementation, finally.

The *exponential* distribution
++++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: RandomTestDistributions>>#testExponential

  .. image:: ../../../Containers-Essentials/images/RandomTestDistributions-testExponential.svg
    :align: center

where

.. pharo:autocompiledmethod:: RandomExponential>>#next

The *gaussian* distribution
+++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: RandomTestDistributions>>#testGaussian

  .. image:: ../../../Containers-Essentials/images/RandomTestDistributions-testGaussian.svg
    :align: center

where

.. pharo:autocompiledmethod:: RandomGaussian>>#next

The *bivariate gaussian* distribution
+++++++++++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: RandomTestDistributions>>#testGaussianBoxMuller

  .. image:: ../../../Containers-Essentials/images/RandomTestDistributions-testGaussianBoxMuller.svg
    :align: center

where

.. pharo:autocompiledmethod:: RandomBoxMullerBivariateGaussian>>#next

``RBNode`` hierarchy
====================

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testRBNodeSubclasses

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testRBNodeSubclasses.svg
    :align: center

A quine ``RBProgramNode``
+++++++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectRBNodesQuine

For a few objects more
======================

An ``Object``, simply
+++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectObject

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectObject.svg
    :align: center
    
``nil``, even more simpler
++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectNil

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectNil.svg
    :align: center

``true`` and ``false``
++++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectTrueAndFalse

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectTrueAndFalse.svg
    :align: center

A ``Point``
+++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectPoint

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectPoint.svg
    :align: center

The ``Color`` gray, translucent
+++++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectColorGray

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectColorGray.svg
    :align: center

A ``RSShape`` of a polygon, quoting itself
++++++++++++++++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectRSPolygon

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectRSPolygon.svg
    :align: center

