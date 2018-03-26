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

@title{Scribble Quick Reference}

This section gives a list of the common functions, tags, and keyboard shortcuts listed above. All functions work with scribble/base unless otherwise noted with an @italic{*requires} note

@subsubsub*section{Document Structure}
@codeblock|{
@title{Title of Document}
@author{Author(s) of Document}
@abstract{Abstract in block quotes} *requires scribble/sigplan
@section{Section Title}
@subsection{Subsection Title}
@subsubsection{Sub-subsection Title}
@subsubsub*section{Unnumbered Subsection Title}
@include-section{"filename.scrbl"}
            }|

@subsubsub*section{Notes}
@codeblock|{
@margin-note{Write notes that will appear in the margins}  *requires scriblib/footnote
@;{Write comments that will not be visible in exported formats}
@define-footnote[footnote make-footnote]  *requires scriblib/footnote
---@footnote{footnote text}  *only works if you define-footnote first
---@make-footnote[]  *Only works if you define-footnote and make footnote(s) first
            }|

@subsubsub*section{Lists}
@codeblock|{
@itemlist[@item{First bullet point}
          @item{Second bullet point}]}|

@codeblock|{
@itemlist[#:style'ordered
          @item{First numbered bullet point}
          @item{Second numbered bullet point}]}|

@subsubsub*section{Common Formatting Tags}
@codeblock|{
@smaller{smaller text}
@larger{larger text}
@italic{italicized text}
@emph{alternate italicized text}
--- turns into an em dash
@centered{centered text}
@subscript{subscript text}
@superscript{superscript text}
@nested[#:style 'inset]{Inset or blockquoted text}
            }|

@subsubsub*section{links}
@codeblock|{@url{exampleurl.com}
            @hyperlink["exampleurl.com"]{Hyperlinked text}
            @secref["Section Title" #:doc '("directory/filename.scrbl")]
            }|

@subsubsub*section{Tables}
@codeblock|{@tabular[#:sep @hspace[1]
           (list (list @bold{C1 Title} @bold{C2 Title})
                 (list "textC1R1"      "textC2R1")
                 (list "textC1R2"      "textC2R2")
                 (list "textC1R3"      "textC2R3"))]}|

@subsubsub*section{Citations}
@codeblock|{
*requires scriblib/autobib
@(define-cite ~cite citet-id generate-bibliography #:style author+date-style)
---@~cite[bib-NameDate] *NameDate is in place of the unique tag for the specific citation.
                        *Only works if you define-cite first
---@(generate-bibliography)  *Only works if you define-cite and ~cite first
  }|

Book
@codeblock|{
@(define bib-BookExample
   (make-bib
    #:title     "Example Book Title"
    #:author    (authors "Author One" "Author Two")
    #:is-book?  "yes"
    #:date      "2018"
    #:location (book-location #:publisher "City:Publisher")
    #:url      "exampleurl.com"
    #:note     "This is where you would annotate your citation"))
    }|

Article
@codeblock|{
@(define bib-ArticleExample
   (make-bib
    #:title     "\"Totally Important Article\""
    #:author    (authors "Author Three")
    #:date      "1985"
    #:location (journal-location "AJA" #:pages '(1 20) #:number "2" #:volume "20")))
    }|

Conference
@codeblock|{
@(define bib-ConferenceExample
   (make-bib
    #:title     "\"Super-Specific Case Study That Fits Your Research\""
    #:author    (authors "Author Four")
    #:date      "2015"
    #:location  (proceedings-location "Super Specialized Conference"
                                      #:pages '(110 165) #:volume "45")
    #:note      "Who knew they'd already had 45 annual meetings of this super
                specific thing I study?"))
                }|

Dissertation
@codeblock|{
@(define bib-DissertationExample
   (make-bib
    #:title     "Five Years of Tears and Caffiene and Impostor Syndrome"
    #:author    (authors "Author Five")
    #:is-book?  "yes"
    #:date      "2017"
    #:location  (dissertation-location #:institution "UW Madison"
                                       #:degree "PhD")))
                                       }|

Tech Report
@codeblock|{
@(define bib-TechReportExample
   (make-bib
    #:title     "\"How To Use Scribble to Write Your Academic Papers\""
    #:author    (authors "Morgan Lemmer-Webber")
    #:date      "2018"
    #:location  (techrpt-location #:institution "UW Madison" #:number "1")
    #:url       "http://dustycloud.org/misc/digital-humanities/HowTo.html"))
    }|

@subsubsub*section{Images & Figures}
@codeblock|{
@image["filename.jpg"]
@figure["tag" @elem{Image identification} @image["filename.jpg"]]}|

@subsubsub*section{Export Commands for Command Line}
@codeblock|{scribble filename.scrbl (exports simple html)
            scribble --htmls filename.scrbl (exports separate html files)
            scribble --pdf filename.scrbl (exports pdf)
            scribble --prefix filename.tex --pdf filename.scrbl 
            (exports pdf with custom LaTeX formatting)
            scribble --latex filename.scrbl (exports LaTeX)
            }|

