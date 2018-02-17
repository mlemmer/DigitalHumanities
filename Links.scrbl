#lang scribble/base

@(require scribble/html-properties
          scribble/latex-properties
          scribble/core
          scribble/sigplan
          scribble/manual
          scriblib/autobib)

@title{Links}

Embedding a hyperlink requires three components. You need to call the @literal|{@hyperlink}| function, you need to place the link in quotes between brackets [""], and you need to place the text you want visible in curly brackets {}.

So if you type: @codeblock|{@hyperlink["https://youtu.be/LNCC6ZYI3SI"]{What sound does a rhinoceros make?}}| 

It will export as: @hyperlink["https://youtu.be/LNCC6ZYI3SI"]{What sound does a rhinoceros make?}