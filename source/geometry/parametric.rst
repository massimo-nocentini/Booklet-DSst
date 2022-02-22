

Computational geometry
**********************

Parametric curves
=================

We work with points 

.. math::

  {\bf v}=\left (
        \begin{array}{c}
        v_x\\
        v_y
        \end{array}  \right)\in {\mathbb R}^2

and think them as elements of an *Euclidean space* :math:`{\mathbb E}^2` which
has a metric :math:`d({\bf v}_1,{\bf v}_2)=\vert \vert {\bf v}_1-{\bf v}_2
\vert \vert`.  A function :math:`\Phi: {\mathbb E}^3\rightarrow  {\mathbb E}^3`
is an *affine transformation* if it lefts baricentric combinations untouched;
for the sake of clarity, given :math:`{\bf v}=\sum_{i=1}^n w_i {\bf v}_i` and
:math:`\sum_{i=1}^n w_i=1` then 

.. math::

   \Phi({\bf v})=\sum_{i=1}^n w_i \Phi({\bf v}_i)

if :math:`\Phi` is affine.  A curve :math:`{\bf C}` is represented in
*parametric form* when the coordinates of each of its points are expressed
separately as a function of a third variable called parameter :math:`u`,

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

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineParametricNeil

A little variation to the second component :math:`{\bf C}(u)=(u^2,
u^3-u)`, where :math:`u \in [-2,2]`, has the graphical representation

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricNeil2.svg
  :align: center

produced by the message

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineParametricNeil2

Now consider the curve :math:`{\bf C}(u)=(cos(u), sin(u))` where :math:`u \in [0,2\pi]` has the
graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricUnitCircle.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineParametricUnitCircle

Another trigonometric curve :math:`{\bf C}(u)=(cos(3u) cos(u), sin(u) cos(3u))`
where :math:`\ u \in [0,\pi]`, aka *trochoid*,  has the graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricTrochoid.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineParametricTrochoid

Another trigonometric curve :math:`{\bf C}(u)=(cos(3u) cos(u), sin(u) cos(3u))`
where :math:`\ u \in [0,\pi]`, aka *trochoid*,  has the graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricLissajous.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineParametricLissajous

Another trigonometric curve :math:`{\bf C}(u)=(cos(3u) cos(u), sin(u) cos(3u))`
where :math:`\ u \in [0,\pi]`, aka *trochoid*,  has the graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricHypotrochoid.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineParametricHypotrochoid

Another trigonometric curve :math:`{\bf C}(u)=(cos(3u) cos(u), sin(u) cos(3u))`
where :math:`\ u \in [0,\pi]`, aka *trochoid*,  has the graphical

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineParametricButterfly.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineParametricButterfly

Bezier curves
=============

Closed control net
++++++++++++++++++

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLineDeCasteljauLineClosedControlPoints.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#lineDeCasteljauLineClosedControlPoints

Degree elevation
++++++++++++++++

.. image:: ../../../Containers-Essentials/images/RSParametricCurveTest-testLinesDeCasteljauLineDegreeElevation.svg
  :align: center

and is coded as

.. pharo:autocompiledmethod:: RSBasicShapeExamples>>#linesDeCasteljauLineDegreeElevation

Designing notes
+++++++++++++++

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
