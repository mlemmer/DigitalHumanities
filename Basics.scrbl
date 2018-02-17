#lang scribble/base

@(require scribble/html-properties
          scribble/latex-properties
          scribble/core
          scribble/sigplan
          scribble/manual
          scriblib/autobib)

@title{Basics of the Scribble/Racket language}

The first line of your document should indicate the language you are using (#lang scribble/base). There should be nothing else on that line. The next element on your document should be any libraries you will require. Many of the functions covered here, including bibliography and footnotes, require individual libraries. If you copy these first few lines from this document, you should be able to run any of the functions I demonstrate here.

Scribble allows us to use Dr. Racket as a text editor, so when your language is set to #lang scrible/base, it is in "text mode." In programming terms, everything you type is by a string by default. A string, or string of characters, is how text appears in a computer program. @literal|{The @ symbol indicates that you are calling a function rather than typing text.}| Sometimes, you will need to use strings when in this programming mode, in which case you wrap the words in quotation marks. You can use these functions to format your text. Some of these functions can be modified by arguments (such as changing your list from bullet points to numbers, or increasing the space between columns in a table). To apply an argument use @literal|{[#: }| directly after the function.  If you need to use the symbols used for functions in your text, @literal|{such as @ # {} [], use the function @literal|}| 

You can turn on the spell check by going to "Edit" -> "Spell Check Text (between {} in Scribble)" or by typing Shift+Ctrl+T. In this setting, the majority of your text will appear green in the text editor and words that are not in the standard dictionary appear black (all will appear black once the file is exported). 