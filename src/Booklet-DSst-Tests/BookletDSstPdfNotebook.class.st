"
""

# PDF files in Pharo

In order to render PDF files in a Pharo image we defined a new class `RSPdf`;
in what follow we describe how that class can be used and some important properties.

First, create a new Roassal's shape to reference a PDF file:

""

(pdf := RSPdf new 
	fileReference: '/home/mn/Downloads/organizing-programs.pdf' asFileReference; 
	pageNumber: 10; yourself )
	ignoreOutputBecause: 'Now the `pdf` name refers to a Roassal shape denoting the 10th page of the desired PDF; ignore how it is defined internally.'.

""

second, let us show that 10th page

""

RSGroup new
	add: pdf;
	yourself.
	
""
as required.
""

""	
## Encompassing rectangles

The encompassing rectangle of `pdf` can be found by
""

pdf encompassingRectangle extent.

""
easily. That message rely on the low-level message
""
RSPdf>>#computeEncompassingRectangle.
""
in turn. We can double check the return value of the latter message
""
extent := pdf computeEncompassingRectangle extent.
""
which divided by $72$ (_perhaps the DPI used by the underlying library_) yields the size in centimeters,
""
extent / 72 * 2.54.
""to be compare with the usual A4's size of $21$ times $29.7$ centimeters.""

""
## Under the hood

According to the [official documentation](https://poppler.freedesktop.org/api/glib/poppler-Poppler-Page.html#poppler-page-render) we show our calling message,""
RSPdf>>#poppler_page_render:cairo:
""where the argument `p` is a _poppler document_ and the argument `cr` is a _cairo canvas_ (of C type `cairo_t`).""
"
Class {
	#name : #BookletDSstPdfNotebook,
	#superclass : #CTClassCommentAutoNotebook,
	#category : #'Booklet-DSst-Tests'
}
