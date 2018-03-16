#lang scribble/doc

@(require scribble/html-properties
          scribble/latex-properties
          scribble/core
          scribble/sigplan
          scribble/base
          scribble/manual
          scriblib/autobib
          scriblib/footnote
          scriblib/figure)

@title{Images}
See @secref["images" #:doc '(lib "scribblings/scribble/scribble.scrbl")] in the @hyperlink["file:///usr/share/doc/racket/scribble/base.html#%28part._images%29"]{Scribble Guide}

Entering images in-line is simple. Use @literal|{@image["filename.jpg"]}| to insert an image file into your document. The image file must be stored in the same directory/folder as your scribble file. If you want the image centered with your text, you can use @literal|{@centered{@image[filename.jpg]}}|

The image will appear at the size of the image file. The size and format of your image will effect its placement in your document. If the image is too large to fit on the remaining space of the page below the text above it, it will shift to the next page. If you have nice, high-res images, that is great for research, but bad for your pdf or html output:

@codeblock|{@image["KaranisKM3338_1.JPG"]}|
@image["KaranisKM3338_1.JPG"]

There are a few ways to modify size. The most stable method is to scale the image using your preferred image manipulation program. If you do this, remember to export the scaled image with a new file name --- You don't want to save over your original high-res image, and you want to be able to distinguish between the two files.

@codeblock|{@centered{@image["KaranisKM3338_1scaled.JPG"]}}|
@centered{@image["KaranisKM3338_1scaled.JPG"]}

Another method is to use CSS or LaTeX to scale the images. This requires more effort in coding, but it can be universally applied to all of the images you use so you don't have to manually re-size all 50+ images in your dissertation and you don't need to either scale the original image files or have double copies of all of your images. Setting up a CSS or LaTeX style sheet is outside the bounds of this tutorial, but I will cover how to incorporate it into your scribble file. First you need to first make a CSS/LaTeX stylesheet and store it in the same directory. Then you can define a function to apply the added style. 

@codeblock|{@(define (scaled-centered-image path . content)
   (centered
     (apply image 
            #:style (make-style "width-constrained-image"
                                (list (make-css-addition "extra-style.css")))
            path content)))}|

@(define (scaled-centered-image path . content)
   (centered
     (apply image 
            #:style (make-style "width-constrained-image"
                                (list (make-css-addition "extra-style.css")))
            path content)))



This function constrains the image to the width of the text in HTML and centers it. In order to apply it, call on the function you've defined above @literal|{@scaled-centered-image["filename.jpg"]}|

@codeblock|{@scaled-centered-image["KaranisKM3338_1.JPG"]}|

@;*This is not pictured in the pdf because the example is for CSS and therefore does not work with pdf export.

@scaled-centered-image["KaranisKM3338_1.JPG"]

Note that this is the same file as at the top of this section, the image file itself has not been altered.

@section{Figures}
See @secref["figure" #:doc '(lib "scriblib/scribblings/scriblib.scrbl")] in the @hyperlink["https://docs.racket-lang.org/scriblib/figure.html"]{Racket Documentation}

In an academic paper, you will likely have more than one image, and perhaps other types of figures such as tables and graphs. Additionally, your images and figures will need to be numbered and tagged in such a way that you can refer to them in your text. For this we use the @literal|{@figure}| function.

@codeblock|{@figure["tag" @elem{Image identification} @image["filename.jpg"]]}|

This function has three primary arguments:

The "tag" is the what you will use to reference the figure when you reference it in-line. This argument requires a string, so enter it in quotation marks. You can use any tag convention you prefer, but each tag must be unique. I am using the Site + Museum number convention here because the artifacts I'm discussing already have unique ID numbers and that's the convention that I've used for naming the image files.

The @literal|{@elem{}}| argument is for any text you want visible after the figure number. This will likely include a description of the image, date, culture, materials, photo credits, etc.

The @literal|{@image["filename.jpg"]}| argument is to place the image.

@codeblock|{@figure["KaranisKM3338" @elem{Loom weight from a house in Karanis, 
unfired clay, 1st through 5th centuries CE, Kelsey Museum of Art, KM3338. 
Image by Morgan Lemmer-Webber with permission of the Kelsey Museum of 
Art.}]{@image["KaranisKM3338_1.JPG"]}}|

@codeblock|{@figure["KaranisKM3352" @elem{Weavers comb from a house in Karanis, 
wood, 1st through 5th centuries CE, Kelsey Museum of Art, KM3352. Image 
by Morgan Lemmer-Webber with permission of the Kelsey Museum of 
Art.}]{@image["KaranisKM3352_1.JPG"]}}|

To reference a figure in-line, use @literal|{@Figure-ref[""]}| if you want the 'F' capitalized or @literal|{@figure-ref[""]}| if you want the 'f' lower-case. Since each figure has a unique tag, you can reference a figure multiple times. The figure number that appears in-line will have a link to take you to the figure itself. Unfortunately, since a figure can be referenced multiple times, it's impossible to have a link to reference back to your exact location within the text. Unlike the bibliography, the figure list will render whether or not the figures have been referenced in your text. 

The figures themselves will appear wherever in the order you define the figure functions. Depending on your preferences, you can intersperse the images within the text or group them together. The Racket/Scribble code for figures generates the figure numbers based on the order the functions are defined, not the order in which they are referenced in the text. If you edit your paper and end up referencing figures in a different order, you can update the figure numbers by re-organizing the order in which they are listed. 

@bold{Example:}

@codeblock|{Given the arid conditions of Karanis, many textile implements
of perishable or delicate materials survive that are rare elsewhere. These 
include loom weights of unfired clay (@Figure-ref["KaranisKM3338"]), or 
wooden weavers combs (@figure-ref["KaranisKM3352"])}|

Given the arid conditions of Karanis, many textile implements of perishable or delicate materials survive that are rare elsewhere. These include loom weights of unfired clay (@Figure-ref["KaranisKM3338"]), or wooden weavers combs (@figure-ref["KaranisKM3352"]).


@figure["KaranisKM3338" @elem{Loom weight from a house in Karanis, unfired clay, 1st through 5th centuries CE, Kelsey Museum of Art, KM3338. Image by Morgan Lemmer-Webber with permission of the Kelsey Museum of Art.}]{@image["KaranisKM3338_1scaled.JPG"]}

@figure["KaranisKM3352" @elem{Weavers comb from a house in Karanis, wood, 1st through 5th centuries CE, Kelsey Museum of Art, KM3352. Image by Morgan Lemmer-Webber with permission of the Kelsey Museum of Art.}]{@image["KaranisKM3352_1scaled.JPG"]}

