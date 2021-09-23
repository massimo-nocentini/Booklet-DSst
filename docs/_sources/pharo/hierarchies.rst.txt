
Hierarchies
***********

``Object`` and ``Trait`` and their superclasses 
===============================================

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectObjectModel

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectObjectModel.svg
    :align: center

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

:math:`{42!}^{2}` by Karatsuba multiplication
+++++++++++++++++++++++++++++++++++++++++++++

After the post :cite:`sven/speeding-up-factorial`, here we explore another large integer

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectLargeInteger

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectLargeInteger.svg
    :align: center

where the message

.. pharo:autocompiledmethod:: Integer>>#dcMultiplyInteger:

implements the algorithm described in :cite:`10.5555/1051910`, at page 232.
Such algorithm runs in :math:`O(n^{\log_{2}{3}})` because the input numbers
:math:`x` and :math:`y`, 

.. math::

  x = x_{a}\cdot 10^{a} + x_{a-1}\cdot 10^{a-1} + \cdots + x_{1}\cdot 10^{1} + x_{0}\cdot 10^{0} \\
  y = y_{b}\cdot 10^{b} + y_{b-1}\cdot 10^{b-1} + \cdots + y_{1}\cdot 10^{1} + y_{0}\cdot 10^{0} 

and let :math:`n = \max(a, b)`, are broken in *two* parts

.. math::

  x = x_{1}\cdot 10^{{{n}\over{2}}} + x_{0} \\
  y = y_{1}\cdot 10^{{{n}\over{2}}} + y_{0}

respectively, and there are *three* recursive ``#dcMultiplyInteger:`` message sends.
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

The irrational ``π``
++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectFloatPi

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectFloatPi.svg
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

``Magnitude`` hierarchy, again
++++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testMagnitudeSubclassesSlotsGraph

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testMagnitudeSubclassesSlotsGraph.svg
    :align: center

``Link`` hierarchy
==================

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testLinkSubclasses

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testLinkSubclasses.svg
    :align: center

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

Another famous sequence :cite:`oeis/catalan-numbers` reads as

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspect20CatalanNumbers

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspect20CatalanNumbers.svg
    :align: center

2-Dimensional arrays
++++++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectPascalArray

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectPascalArray.svg
    :align: center

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectCatalanArray

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectCatalanArray.svg
    :align: center

Golden ratios
+++++++++++++

The well known Golden ratio looks like

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectGoldenRatio

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectGoldenRatio.svg
    :align: center

and also the following golden ratios

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspect10GoldenRatios

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspect10GoldenRatios.svg
    :align: center

are generated by the message

.. pharo:autocompiledmethod:: Integer>>#goldenRatios

that uses the same message and can be used to generate the following golden rectangles

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspect10GoldenRectangles

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspect10GoldenRectangles.svg
    :align: center

consequently. The previous rectangles can be nested

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspect10GoldenRectanglesNested

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspect10GoldenRectanglesNested.svg
    :align: center

to have a comprehensive representation.

One-to-Many descriptors
-----------------------

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectOneToMany

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectOneToMany.svg
    :align: center
   
Some ``ByteArray``\s
++++++++++++++++++++

On one hand, the combination of the previous two types of objects allows us to inspect a ``ByteArray`` object,

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testByteArrayLoremIpsum

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testByteArrayLoremIpsum.svg
    :align: center

On the other hand, a bare bone array of bytes can be built as in

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testByteArrayLiteral

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testByteArrayLiteral.svg
    :align: center

and, in more simpler terms, even an ``Integer`` can be seen as an array of this type

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testByteArrayInteger

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testByteArrayInteger.svg
    :align: center

Binary Reflected Gray Codes
+++++++++++++++++++++++++++

In :cite:`gray-pulse-code-communication-1953`, Frank Gray introduces *"an
ordering of the binary numeral system such that two successive values differ in
only one bit"* -- from `Wikipedia <https://en.wikipedia.org/wiki/Gray_code>`_,

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectBRGCodes

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectBRGCodes.svg
    :align: center

also known as :cite:`oeis/gray-codes`. The message

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

A ``Dictionary``
++++++++++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectDictionary

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectDictionary.svg
    :align: center

A ``Bag``
+++++++++

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectBag

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testInspectBag.svg
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

which finally provides the implementation according to
:cite:`10.1145/63039.63042` as the message's comment states.

The *Bernoulli* distribution
++++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: RandomTestDistributions>>#testBernoulli

  .. image:: ../../../Containers-Essentials/images/RandomTestDistributions-testBernoulli.svg
    :align: center

where

.. pharo:autocompiledmethod:: RandomBernoulli>>#next

The *binomial* distribution
+++++++++++++++++++++++++++

.. pharo:autocompiledmethod:: RandomTestDistributions>>#testBinomial

  .. image:: ../../../Containers-Essentials/images/RandomTestDistributions-testBinomial.svg
    :align: center

where

.. pharo:autocompiledmethod:: RandomBinomial>>#next

The *geometric* distribution
++++++++++++++++++++++++++++

.. pharo:autoclass:: RandomGeometric

.. pharo:autocompiledmethod:: RandomTestDistributions>>#testGeometric

  .. image:: ../../../Containers-Essentials/images/RandomTestDistributions-testGeometric.svg
    :align: center

where

.. pharo:autocompiledmethod:: RandomGeometric>>#next

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

A sample from a *bivariate* Gaussian distribution can be inspected by

.. pharo:autocompiledmethod:: RandomTestDistributions>>#testGaussianBoxMuller

  .. image:: ../../../Containers-Essentials/images/RandomTestDistributions-testGaussianBoxMuller.svg
    :align: center

where the message

.. pharo:autocompiledmethod:: RandomBoxMullerBivariateGaussian>>#next

implements the algorithm described in :cite:`10.1214/aoms/1177706645`.

``RBNode`` hierarchy
====================

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testRBNodeSubclasses

  .. image:: ../../../Containers-Essentials/images/EssentialsObjectTest-testRBNodeSubclasses.svg
    :align: center

A quine ``RBProgramNode``
+++++++++++++++++++++++++

The Scheme expression

.. code-block:: scheme

   (define quine ((lambda (x) (list x (list (quote quote) x))) 
                  (quote (lambda (x) (list x (list (quote quote) x))))))

defines a binding such that

.. code-block:: scheme

   (equal? (eval quine) quine)

evaluates to ``#t``; in parallel, our Smalltalk implementation

.. pharo:autocompiledmethod:: EssentialsObjectTest>>#testInspectRBNodesQuine

behaves the same, as required.

