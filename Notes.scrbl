#lang scribble/base

@(require scribble/html-properties
          scribble/latex-properties
          scribble/core
          scribble/sigplan
          scribble/manual
          scriblib/autobib
          scriblib/footnote)

@title{Notes}

@section{Margin notes and comments}
Link to this section with
 @secref["Blocks" #:doc '(lib "scribblings/scribble/scribble.scrbl")]

@literal|{@margin-note}| places a note to the side @margin-note{like this}

@bold{Comments:}  Since scribble is a markup language, you can include comments in the .scrbl file that do not render when the file is exported. Just type @literal|{@;}| and put curly brackets around the text you want hidden. This allows you to leave notes to yourself without publishing them. Now you see it ... @;{Now you don't} 

@section{Footnotes}
@secref["footnotes" #:doc '(lib "scriblib/scribblings/scriblib.scrbl")]

This feature requires access to the scriblib/footnote library, so include that in the list of required libraries at the top of your page. 

@codeblock|{@define-footnote[footnote make-footnote]}|
@define-footnote[footnote make-footnote]

You must define the footnote function using @literal|{@define-footnote}|. This requires two arguments separated by a space --- the first is the tag you will use to place a footnote in-line of your text, the second is the tag you will use to generate your footnotes. You can use whatever naming convention you want. For this tutorial, I’m keeping it simple and using 'footnote' and 'make-footnote'.

@(define-cite ~cite citet-id generate-bibliography #:style author+date-style)

@(define bib-Barber1994
   (make-bib
    #:title     "Women's Work: The First 20,000 Years: Women, Cloth, and Society in Early Times."
    #:author    (authors "E.J.W Barber")
    #:is-book?  "yes"
    #:date      "1994"
    #:location  (book-location #:publisher "New York: Norton")))

@(define bib-GillisNosch2007
   (make-bib
    #:title     "Ancient Textiles. Production, Craft and Society. Proceedings of the First International Conference On Ancient Textiles. Lund, Sweden, and Copenhagen, Denmark, On March 19-23 2003"
    #:author    (authors "Carole Gillis" "Marie-Louise Nosch")
    #:is-book?  "yes"
    #:date      "2007"
    #:location  (book-location #:publisher "Oxford: Oxbow")))

@(define bib-Cottica2006
   (make-bib
    #:title     "\"The Symbolism of Spinning in Classical Art and Society\""
    #:author    (authors "Daniela Cottica")
    #:date      "2006"
    #:location  (journal-location "Cosmos" #:pages '(185 209) #:volume "20")
    #:note      "In this brief article, Cottica summarizes the association between women and spinning in the Greek and Roman cultures. She approaches the topic thematically, covering religious associations, everyday life, and funerary topics."))

@(define bib-Trinkl2007
   (make-bib
    #:title     "\"Artifacts Related to Preparation of Wool and Textile Processing Found Inside the Terrace Houses of Ephesus, Turkey\""
    #:author    (authors "Elisabeth Trinkl") 
    #:date      "2007"
    #:location  (proceedings-location "Ancient Textiles. Production, Craft and Society. Proceedings of the First International Conference On Ancient Textiles. Lund, Sweden, and Copenhagen, Denmark, On March 19-23 2003" #:pages '(80 86) #:volume "1")))

@(define bib-LarssonLoven2002
   (make-bib
    #:title     "The Imagery of Textile Making. Gender and Status in the Funerary Iconography of Textile Manufacture in Roman Italy and Gaul"
    #:is-book?  "yes"
    #:author    (authors "Lena Larsson  Lovén")
    #:date      "2002"
    #:location  (dissertation-location #:institution "University of Gothenburg" #:degree "PhD")))

@(define bib-Flatt2010
   (make-bib
    #:title    "Reference: Racket"
    #:author   (authors "Matthew Flatt" "PLT")
    #:date     "2010"
    #:location (techrpt-location #:institution "PLT Inc."
                                 #:number "PLT-TR-2010-1")
    #:url      "http://racket-lang.org/tr1/"))

@codeblock|{I am including this brief literary review as an example of 
footnotes and citations.@footnote{Footnotes can be text only, or you
can include a citation.} The @italic{Racket Reference} has been invaluable 
in creating this guide on using Racket and Scribble for academic 
papers.@footnote{@~cite[bib-Flatt2010] The @italic{Racket Reference}
is the only citation here that was used in creating this file, 
the rest of the titles here are drawn from my dissertation 
research.} Elizabeth Barber efficiently breaks down the central 
role that women played in the early development of textile 
production in her 1994 book @italic{Women's Work.}@footnote
{@~cite[bib-Barber1994]} Daniella Cottica rather deftly analyzes 
this topic thematically utilizing both Greek and Roman evidence. 
However, the breadth of the topic exceeds the bounds of an 
article spanning only 20 pages including copious images.
@footnote{@~cite[bib-Cottica2006]} Lena Larsson Lovén's 
work focuses on the symbolic relationship between women 
and textile production in the Roman Empire through literary, 
epigraphic, and iconographic sources.@footnote{@~cite
[bib-LarssonLoven2002]} Conference proceedings from the 
@italic{International Conference On Ancient Textiles} provide 
interesting case studies of textile research@footnote{@~cite
[bib-Trinkl2007]} as well as current research methods, testing, 
and synthesis between sites.@footnote{@~cite[bib-GillisNosch2007]}}|

@codeblock|{@make-footnote[]}|


I am including this brief literary review as an example of footnotes and citations.@footnote{Footnotes can be text only, or you can include a citation.} The @italic{Racket Reference} has been invaluable in creating this guide on using Racket and Scribble for academic papers.@footnote{@~cite[bib-Flatt2010] The @italic{Racket Reference} is the only citation here that was used in creating this file, the rest of the titles here are drawn from my dissertation research.} Elizabeth Barber efficiently breaks down the central role that women played in the early development of textile production in her 1994 book @italic{Women's Work.}@footnote{@~cite[bib-Barber1994]} Daniella Cottica rather deftly analyzes this topic thematically utilizing both Greek and Roman evidence. However, the breadth of the topic exceeds the bounds of an article spanning only 20 pages including copious images.@footnote{@~cite[bib-Cottica2006]} Lena Larsson Lovén's work focuses on the symbolic relationship between women and textile production in the Roman Empire through literary, epigraphic, and iconographic sources.@footnote{@~cite[bib-LarssonLoven2002]} Conference proceedings from the @italic{International Conference On Ancient Textiles} provide interesting case studies of textile research@footnote{@~cite[bib-Trinkl2007]} as well as current research methods, testing, and synthesis between sites.@footnote{@~cite[bib-GillisNosch2007]}

@make-footnote[]
@(generate-bibliography)