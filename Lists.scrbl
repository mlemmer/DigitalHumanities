#lang scribble/base

@(require scribble/html-properties
          scribble/latex-properties
          scribble/core
          scribble/sigplan
          scribble/manual
          scriblib/autobib)

@title{Lists}

@literal|{@itemlist}| creates indented bullet points for lists
@itemlist[@item{First bullet point}
          @item{Second bullet point}]

@literal|{@itemlist[#:style'ordered}| creates numbered lists
@itemlist[#:style'ordered
          @item{First bullet point}
          @item{Second bullet point}]