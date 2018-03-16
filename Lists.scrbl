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

@title{Lists}
See @secref["Blocks" #:doc '(lib "scribblings/scribble/scribble.scrbl")] 'itemlist' in the @hyperlink["file:///usr/share/doc/racket/scribble/base.html#%28part._.Blocks%29"]{Scribble guide}

@literal|{@itemlist}| creates indented bullet points for lists
@itemlist[@item{First bullet point}
          @item{Second bullet point}]

@literal|{@itemlist[#:style'ordered}| creates numbered lists
@itemlist[#:style'ordered
          @item{First bullet point}
          @item{Second bullet point}]