

Computational geometry
**********************

Parametric curves
=================

We work with points 

.. math::

  {\bf v}=\left [
        \begin{array}{c}
        v_x\\
        v_y
        \end{array}  \right]\in {\mathbb R}^2

and think them as elements of an *Euclidean space* :math:`{\mathbb E}^2` which
has a metric :math:`d({\bf v}_1,{\bf v}_2)=\vert \vert {\bf v}_1-{\bf v}_2
\vert \vert`.  

A curve :math:`{\bf C}` is represented in *parametric form* when the
coordinates of each of its points are expressed separately as a function of a
third variable :math:`u` called *parameter*,

.. math::

  {\bf C}(u)=(x(u), y(u))

where :math:`u \in [a,b]`.  Finally, many of such curves don't admit a
functional representation.

Neile parabola
--------------

Described in :cite:`pein1875semicubische`, the *Neil parabola* :math:`{\bf C}(u)=(u^2,
u^3)`, where :math:`u \in [-2,2]`, has the graphical representation

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricNeil.svg
  :align: center

produced by the message

.. pharo:autocompiledmethod:: RSTParametricXYLines>>#lineParametricNeil

A little variation to the second component :math:`{\bf C}(u)=(u^2,
u^3-u)`, where :math:`u \in [-2,2]`, has the graphical representation

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricNeil2.svg
  :align: center

produced by the message

.. pharo:autocompiledmethod:: RSTParametricXYLines>>#lineParametricNeil2

Now consider the curve :math:`{\bf C}(u)=(cos(u), sin(u))` where :math:`u \in [0,2\pi]` has the
graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricUnitCircle.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSTParametricXYLines>>#lineParametricUnitCircle

Another trigonometric curve :math:`{\bf C}(u)=(cos(3u) cos(u), sin(u) cos(3u))`
where :math:`\ u \in [0,\pi]`, aka *trochoid*,  has the graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricTrochoid.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSTParametricXYLines>>#lineParametricTrochoid

Another trigonometric curve :math:`{\bf C}(u)=(cos(3u) cos(u), sin(u) cos(3u))`
where :math:`\ u \in [0,\pi]`, aka *trochoid*,  has the graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricLissajous.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSTParametricXYLines>>#lineParametricLissajous

Another trigonometric curve :math:`{\bf C}(u)=(cos(3u) cos(u), sin(u) cos(3u))`
where :math:`\ u \in [0,\pi]`, aka *trochoid*,  has the graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricHypotrochoid.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSTParametricXYLines>>#lineParametricHypotrochoid

Butterfly curve
---------------

Introduced in :cite:`10.2307/2325155`, the butterfly curve :math:`{\bf C}(u)`
where :math:`\ u \in [0, 12\pi]`, has the graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testParametricXYLineButterfly.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSTParametricXYLines>>#parametricXYlineButterfly

according to :cite:`wikipedia/butterfly-curve`.

Bezier curves
=============

Baricentric coordinates and affine transforms
---------------------------------------------

Given two points :math:`{\bf v}_1` and :math:`{\bf v}_2`, let

.. math::

        {\bf v}=w_1 {\bf v}_1+ (1-w_1) {\bf v}_2

where :math:`w_1\in[0,1]` and :math:`w_2=1-w_1` are the *baricentric coordinates* of
:math:`{\bf v}` with respect to :math:`{\bf v}_1` and :math:`{\bf v}_2`,
respectively. The message

.. pharo:autocompiledmethod:: Point>>#unitAffine:at:

implements such combination. For the sake of clarity, the shapes


.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testBaricentricCoordinates.svg
  :align: center

shows the baricentric coordinates :math:`{{1}\over{4}}` and
:math:`{{3}\over{4}}` of the point :math:`(250, 325)` with respect to
:math:`(100, 100)` and :math:`(300, 400)`, as the test

.. pharo:autocompiledmethod:: RSParametricCurveTest>>#sutBaricentricCoordinates:

ensures. We can do one more step, given three points :math:`{\bf v}_1`,
:math:`{\bf v}_2` and :math:`{\bf v}_3`, let

.. math::

        {\bf v}=w_1 {\bf v}_1+ w_2 {\bf v}_2+(1-w_1-w_2) {\bf v}_3

where :math:`w_1, w_2\in[0,1]` and :math:`w_3=1-w_1-w_2` are the *baricentric
coordinates* of :math:`{\bf v}` with respect to :math:`{\bf v}_1`, :math:`{\bf
v}_2` and :math:`{\bf v}_3`, respectively. The message

.. pharo:autocompiledmethod:: Point>>#unitAffine:at:and:at:

implements such combination. For the sake of clarity, the shapes

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testBaricentricCoordinatesTriangle.svg
  :align: center

shows the baricentric coordinates :math:`{{1}\over{6}}`, :math:`{{1}\over{2}}`
and :math:`{{1}\over{3}}` of the point :math:`\left({{400}\over{3}},
300\right)` with respect to :math:`(100, 100)`, :math:`(300, 400)` and
:math:`(-100, 250)`, as the test

.. pharo:autocompiledmethod:: RSParametricCurveTest>>#sutBaricentricCoordinatesTriangle:

ensures. Finally, a function :math:`\Phi: {\mathbb E}^2\rightarrow  {\mathbb E}^2`
is an *affine transformation* if it lefts baricentric combinations untouched;
for the sake of clarity, given :math:`{\bf v}=\sum_{i=1}^n w_i {\bf v}_i` and
:math:`\sum_{i=1}^n w_i=1` then :math:`\Phi` is affine if and only if

.. math::

   \Phi({\bf v})=\sum_{i=1}^n w_i \Phi({\bf v}_i).

Closed control net
------------------

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineDeCasteljauLineClosedControlPoints.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineDeCasteljauLineClosedControlPoints

Degree elevation
----------------

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLinesDeCasteljauLineDegreeElevation.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#linesDeCasteljauLineDegreeElevation

Designing notes
---------------

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineDeCasteljauLineNoteBox.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineDeCasteljauLineNoteBox

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testNoteLoremIpsum.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#noteLoremIpsum

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testNoteInteger.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#noteInteger
