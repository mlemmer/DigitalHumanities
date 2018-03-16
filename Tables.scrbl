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

@title{Tables}
See @secref["Blocks" #:doc '(lib "scribblings/scribble/scribble.scrbl")] 'tabular' in the @hyperlink["file:///usr/share/doc/racket/scribble/base.html#%28part._.Blocks%29"]{Scribble Guide}

@literal|{@tabular}| allows you to create tables from a list of lists. 

@codeblock|{@tabular[#:sep @hspace[1]
         (list (list @bold{Animal} @bold{Sound})
               (list "cat"         "meow")
               (list "dog"         "bark")
               (list "duck"        "quack")
               (list "rhinoceros"  "squee"))]}|

@tabular[#:sep @hspace[1]
         (list (list @bold{Animal} @bold{Sound})
               (list "cat"         "meow")
               (list "dog"         "bark")
               (list "duck"        "quack")
               (list "rhinoceros"  "squee"))]

In Scribble, @literal|{#:}| indicates that there is a keyword-value argument. These are variables that will modify how your final product renders. The argument @literal|{#:sep @hspace[]}| in this table is a variable that controls the amount of space between columns, so increasing that number increases the space between columns. You can also include other features/formatting into your table

@codeblock|{@tabular[#:sep @hspace[5]
         (list (list @bold{Animal} @bold{Sound})
               (list "cat"         "meow")
               (list @italic{dog} "bark")
               (list "duck"        "quack")
               (list "rhinoceros"  @hyperlink["https://youtu.be/LNCC6ZYI3SI"]{squee}))]}|

@tabular[#:sep @hspace[5]
         (list (list @bold{Animal} @bold{Sound})
               (list "cat"         "meow")
               (list @italic{dog} "bark")
               (list "duck"        "quack")
               (list "rhinoceros"  @hyperlink["https://youtu.be/LNCC6ZYI3SI"]{squee}))]
