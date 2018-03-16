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

@title{Basics of the Scribble/Racket language}

The first line of your document should indicate the language you are using @racket{#lang scribble/doc}. There should be nothing else on that line. The next element on your document should be any libraries you will require. Many of the functions covered here, including bibliography and footnotes, require individual libraries. If you copy these first few lines from this document, you should be able to run any of the functions I demonstrate here.

Scribble allows us to use Dr. Racket as a text editor, so when your language is set to @racket{#lang scrible/doc}, it is in "text mode." In programming terms, everything you type is by a string by default. A string, or string of characters, is how text appears in a computer program. @literal|{The @ symbol indicates that you are calling a function rather than typing text.}| Sometimes, you will need to use strings when in this programming mode, in which case you wrap the words in quotation marks. You can use these functions to format your text. Some of these functions can be modified by arguments (such as changing your list from bullet points to numbers, or increasing the space between columns in a table). If you need to use the symbols used for functions in your text, @literal|{such as @ # {} []}| use the function: @codeblock|{@literal|{ }|}| 

@section{Spell Check}

You can turn on the spell check by going to "Edit" -> "Spell Check Text (between {} in Scribble)" or by typing Shift+Ctrl+T. In this setting, the majority of your text will appear green in the text editor and words that are not in the standard dictionary appear black (all will appear black once the file is exported). To get spelling suggestions on a word, put your mouse cursor within the word and hit Shift+CTRL+k. 

@section{Margin notes and comments}
See  @secref["Blocks" #:doc '(lib "scribblings/scribble/scribble.scrbl")] 'margin-note' in the @hyperlink["file:///usr/share/doc/racket/scribble/base.html#%28part._.Blocks%29"]{Racket Documentation} 

@literal|{@margin-note{}}| places a note to the side 

@codeblock|{@margin-note{like this}}|
@margin-note{like this}

@bold{Comments:}  Since scribble is a markup language, you can include comments in the .scrbl file that do not render when the file is exported. Just type @literal|{@;}| and put curly brackets around the text you want hidden. This allows you to leave notes to yourself without publishing them. 

@codeblock|{Now you see it ... @;{Now you don't} }|
Now you see it ... @;{Now you don't} 