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

@title{Document Structure}

See @secref["Document_Structure"
         #:doc '(lib "scribblings/scribble/scribble.scrbl")] in the @hyperlink["file:///usr/share/doc/racket/scribble/base.html#%28part._.Document_.Structure%29"]{Scribble Guide}

Scribble makes it easy to structure your document consistently. There are pre-formatted tags for standard aspects of a document. Like the other tags demonstrated in this tutorial, Scribble has coded these tags to map to the equivalent html and LaTeX tags so that the document can then be exported with its formatting intact. Further customization can then be applied with CSS or LaTeX at the export stage 

@itemlist[@item{@literal|{@title}| designates the title. The text appears in large, bold font (the equivalent of <title> in html).}
           @item{@literal|{@author}| designates the author(s) of the document and is typically placed after the title.}
           @item{@literal|{@abstract}| formats your abstract in blockquote format, typically placed after the author.}
           @item{@literal|{@section}| can be used to separate the document into sections or chapters. This automatically numbers the section (and re-numbers it if you edit or re-arrange your document), and uses a bold font that is smaller than the title, but larger than the text (the equivalent of <h3> in html). Sections can be further broken down into @literal|{@subsection}| (the equivalent of <h4> in html) and @literal|{@subsubsection}| (the equivalent of <h5> in html) which will continue to be numbered and formatted.}
          @item{@literal|{@subsubsub*section}| is formatted the same as subsubsection but is unnumbered.}]

@section{Section Heading} 
@subsection{First Subsection}
@subsubsection{Second Subsection}
@subsubsub*section{Unnumbered Subsection}

@section{Combining Multiple Documents}

See @secref["Splitting_the_Document_Source"
         #:doc '(lib "scribblings/scribble/scribble.scrbl")] in the @hyperlink["file:///usr/share/doc/racket/scribble/getting-started.html#%28part._.Splitting_the_.Document_.Source%29"]{Scribble Guide}

With large documents, such as this tutorial or a dissertation, containing everything within a single document can become cumbersome. Scribble allows you to create multiple documents that will export into a single pdf or a set of linked html files.

For this you set one document as the master for the project (See HowTo.scrbl for an example). This will include your main title page, abstract, and perhaps introduction. After the content you wish to include on the master document, you will then use the command @literal|{@include-section["filename.scrbl"]}| to make a list of the subsequent files you wish to include. These will appear in the document in the order that you list the files.

It will look something like this:

@codeblock|{@include-section["Basics.scrbl"]
@include-section["DocumentStructure.scrbl"]
@include-section["Lists.scrbl"]
@include-section["Tags.scrbl"]
@include-section["Links.scrbl"]
@include-section["Tables.scrbl"]
@include-section["Citations.scrbl"]
@include-section["Notes.scrbl"]
@include-section["Images.scrbl"]}|

When you combine documents like this, the nested structure of title, section, subsection etc. will all move down one for the subordinate files. At the top of this document (DocumentStructure.scrbl), I used @literal|{@title{Document Structure}}|. If you were to export this file on its own, that would be formatted as a title and all of the sections would nest down accordingly. However if I export HowTo.scrbl, that title will appear as a section heading and all of the subsequent sections would be nested another layer in.