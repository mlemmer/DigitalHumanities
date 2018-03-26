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

@title{How To Use Scribble to Write your Academic Papers: A Reference Tutorial}
@author{Morgan Lemmer-Webber}


@abstract{This tutorial gives examples of the common functions and formatting tags you will need to write an academic paper using Dr. Racket and scribble. This document should be used as a reference guide when you are ready to set up your own academic paper.}

This document itself is written in Scribble, and will be most useful to you if you look at both the scribble files (HowTo.scrbl, Basics.scrbl, DocumentStructure.scrbl, Lists.scrbl, Tags.scrbl, Links.scrbl, Tables.scrbl, Citations.scrbl, Images.scrbl, Export.scrbl) and the pdf (HowTo.pdf) or html output (HowTo.html) at the same time. You can find these documents on our git repository @url{https://github.com/mlemmer/DigitalHumanities}.

Both Racket and Scribble have wonderful documentation and tutorials available, see below for useful references. Often times if you are stuck and can't figure out how to write a function or debug your code on your own you can find an answer by simply googling it (be sure to include some combination of Racket/Scribble in your search because there are a lot of programming languages out there). Racket also has a thriving community of programmers, so you can post a question on the @hyperlink["https://groups.google.com/forum/#!forum/racket-users"]{Racket Users forum}. 

Introduction to Racket with Pictures: @url{https://docs.racket-lang.org/quick/index.html}

Web Applications in Racket: @url{https://docs.racket-lang.org/continue/index.html}

Racket Guide: @url{https://docs.racket-lang.org/guide/index.html}

Racket Reference: @url{https://docs.racket-lang.org/reference/index.html}

Racket Documentation: @url{https://docs.racket-lang.org/continue/index.html}

Scribble tutorial: @url{"https://docs.racket-lang.org/scribble/getting-started.html"}

Scribble Manual: @url{https://docs.racket-lang.org/scribble/}

@section{License}

The documentation and content of this tutorial are licensed under the Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0)

All code for this project is licensed under the GNU Lesser General Public License version 3.0 (LGPL) or (at your option) any later version of the GNU LGPL as published by the Free Software Foundation.

@include-section["Basics.scrbl"]
@include-section["DocumentStructure.scrbl"]
@include-section["Export.scrbl"]
@include-section["Lists.scrbl"]
@include-section["Tags.scrbl"]
@include-section["Links.scrbl"]
@include-section["Tables.scrbl"]
@include-section["Citations.scrbl"]
@include-section["QuickReference.scrbl"]
@include-section["Images.scrbl"]



