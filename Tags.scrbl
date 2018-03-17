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

@title{Common Formatting Tags}
See @secref["Text_Styles_and_Content"
         #:doc '(lib "scribblings/scribble/scribble.scrbl")] in the @hyperlink["file:///usr/share/doc/racket/scribble/base.html#%28part._.Text_.Styles_and_.Content%29"]{Scribble Guide}

@itemlist[@item{@literal|{@smaller}| @smaller{renders the font in a smaller size. @smaller{These can be nested @smaller{ to decrease incrimentally}}}}
          @item{@literal|{@larger}| @larger{renders the font in a larger size. @larger{These can be nested @larger{ to increase incrimentally}}}}
          @item{@literal|{@italic}| @italic{can be used for book titles or words in foreign languages.}}
          @item{@literal|{@emph}| @emph{can be used instead of italic.}}
          @item{@literal|{@bold}| @bold{can be used for emphasis.}}
          @item{@literal|{---}| turns into an em dash (---)}
          @item{@centered{@literal|{@centered}| centers the text}}
          @item{@literal|{@subscript}| can be used to create @subscript{subscripts}}
          @item{@literal|{@superscript}| can be used to create @superscript{superscripts}}]

@centered{@bold{All of @italic{these} formatting @smaller{functions} can be @larger{nested}.}}

@literal|{@nested[#:style 'inset]}| can be used to place text in blockquotes

See @secref["Blocks" #:doc '(lib "scribblings/scribble/scribble.scrbl")] in the @hyperlink["file:///usr/share/doc/racket/scribble/base.html#%28part._.Blocks%29"]{Scribble Guide}

@nested[#:style 'inset]{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in egestas nulla, eu sodales purus. Quisque quis mi eleifend, malesuada libero a, tempor diam. Phasellus accumsan neque faucibus ornare rutrum. Phasellus ac nulla finibus, blandit mi sit amet, condimentum ante. Mauris dapibus ornare hendrerit. Cras eget neque ut nibh semper rhoncus. Pellentesque in orci quam. Nunc est ligula, tempor eget cursus quis, tempus vel dui. Vivamus vestibulum enim a elit commodo sagittis. Mauris scelerisque dui eu aliquet pretium. In ut augue eget enim tristique accumsan sit amet a enim. Sed sed ullamcorper risus. }
