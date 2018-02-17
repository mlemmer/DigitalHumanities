#lang scribble/base

@(require scribble/html-properties
          scribble/latex-properties
          scribble/core
          scribble/sigplan
          scribble/manual
          scriblib/autobib
          scriblib/footnote)

@title{How To Use Scribble to Write your Academic Papers}

@abstract{This cheat-sheet gives examples of the common functions and formatting tags you will need to write an academic paper using Dr. Racket and scribble. This document should be used as a reference guide when you are ready to set up your own academic paper, you probably want to check out the Scribble tutorial @hyperlink["https://docs.racket-lang.org/scribble/getting-started.html"]{Getting Started} to get the basics down first.}

@include-section["Basics.scrbl"]
@include-section["Lists.scrbl"]
@include-section["Tags.scrbl"]
@include-section["Links.scrbl"]
@include-section["Tables.scrbl"]
@include-section["Citations.scrbl"]
@include-section["Notes.scrbl"]
@include-section["Images.scrbl"]
@;include-section["HTMLImages.scrbl"]