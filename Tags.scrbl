#lang scribble/base

@(require scribble/html-properties
          scribble/latex-properties
          scribble/core
          scribble/sigplan
          scribble/manual
          scriblib/autobib)

@title{Common Formatting Tags}

@itemlist[@item{@literal|{@smaller}| @smaller{renders the font in a smaller size. @smaller{These can be nested @smaller{ to decrease incrimentally}}}}
          @item{@literal|{@larger}| @larger{renders the font in a larger size. @larger{These can be nested @larger{ to increase incrimentally}}}}
          @item{@literal|{@italic}| @italic{can be used for book titles or words in foreign languages.}}
          @item{@literal|{@emph}| @emph{can be used instead of italic.}}
          @item{@literal|{@bold}| @bold{can be used for emphasis.}}
          @item{@literal|{---}| turns into an em dash (---)}
          @item{@centered{@literal|{@centered}| centers the text}}
          @item{@centered{@bold{All of @italic{these} formatting @smaller{functions} can be @larger{nested}.}}}]