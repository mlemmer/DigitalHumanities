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

@title{Exporting From Scribble}
See @secref["first-example" #:doc '(lib "scribblings/scribble/scribble.scrbl")] in the @hyperlink["file:///usr/share/doc/racket/scribble/getting-started.html#%28part._first-example%29"]{Scribble Guide}

Exporting simple html from Scribble is easy. Dr. Racket has a built in exporter, so you simply hit the "Scribble HTML" button at the top of the page. This generates an html file of the same filename saved in the same directory as the original scribble file and opens the html file in your browser. I recommend that you use that simple export option often when you're writing to make sure that everything works (if you export and get an error message but you've only added five tags or functions since the last time you exported successfully, that's only five things you need to debug to find the problem).

In order to export to pdf, tex, or to export a multi-page document, you will need to use the command line. The commands below apply out of the box to OSX and GNU/Linux. If you are using Windows, you can install @hyperlink["https://www.cygwin.com/"]{Cygwin}, which will allow you to use a terminal with GNU/Linux commands.

@section{Exporting to HTML via the Command Line}

All required files including images need to be stored in the same directory or folder. Scribble has base CSS and LaTeX templates that they generate from, but if you wish to export with custom CSS or LaTeX files, those should be stored in the same directory as well. In a terminal, use the cd command to change to the directory where your files are stored.

@codeblock|{cd Desktop/Documents/Racket/InstructionMaterials/}|

To export the same simple html file as the "Scribble HTML" button generates, type the command 'scribble' (i.e. the program that you're using) + the filename

@codeblock|{mlemmer@rooibos:~/Desktop/Documents/Racket/InstructionMaterials$ 
scribble HowTo.scrbl}|
If it successfully exported, it will return the message
@codeblock|{[Output to HowTo.html]}|

If you are using multiple files to create one document and wish to have separate html files (if you want to be able to click from one page to the next etc), type the command 'scribble' then '--htmls' (to indicate you want multiple html subsections) + the filename

@codeblock|{mlemmer@rooibos:~/Desktop/Documents/Racket/InstructionMaterials$ 
scribble --htmls HowTo.scrbl}|
If it successfully exported, it will return the message
@codeblock|{[Output to HowTo/index.html]}|

This will create a new file or directory with multiple html files. If you open the index file in your browser, you'll be able to navigate through all of the files in the directory.

@section{Exporting to pdf via the Command Line}

Scribble uses LaTeX to export to pdf, so you will need to first install @hyperlink["https://www.latex-project.org/get/"]{LaTeX} and any applicable packages.

To export to pdf from the command line, type the command 'scribble' then '--pdf' (to indicate that you want the output to be pdf) + the filename

@codeblock|{mlemmer@rooibos:~/Desktop/Documents/Racket/InstructionMaterials$ 
scribble  --pdf HowTo.scrbl}|
LaTeX is notoriously fussy and it is likely that you will get some long and confusing error messages whether or not your document successfully exported. If it successfully exported, somewhere in the message it will say
@codeblock|{[Output to HowTo.pdf]}|

If you want to modify the pdf output via a LaTeX template, first create a basic template. Keep in mind that Scribble has a default template and you don't need to re-create everything, and if your template is too involved it will cause an error message. It is fairly straightforward to add a template that indicates font size, margins, and line spacing (such as LatexHeader.tex, which we've included here). In the command line, type the command 'scribble' then '--prefix LatexFilename.tex' (to indicate which LaTeX file you want to modify your outpt) then '--pdf' (to indicate that you want the output to be pdf) + the filename 

@codeblock|{mlemmer@rooibos:~/Desktop/Documents/Racket/InstructionMaterials$ 
scribble --prefix LatexHeader.tex --pdf HowTo.scrbl}|
If it successfully exported, somewhere in the message it will say
@codeblock|{[Output to HowTo.pdf]}|

@section{Exporting to LaTeX via the Command Line}

If you want to export to a LaTex file, type the command 'scribble' then '--latex' (to indicate that you want the output to be a LaTeX file) + the filename.

@codeblock|{mlemmer@rooibos:~/Desktop/Documents/Racket/InstructionMaterials$ 
scribble --latex HowTo.scrbl}|
If it successfully exported, it will return the message
@codeblock|{[Output to HowTo.tex]}|


@section{Editing the Exported Files}

This tutorial focuses on ways to format your documents using Scribble that you can then export to both html and pdf. For this, scribble acts as the middle man, bridging the syntax of the two markup languages so that you don't have to do double the work. However, even so there are bound to be some glitches in the output that you would like to tweak. Since your output via the command line an be .html or .tex files, you can do most of the leg work using scribble, then manually clean up the last parts that are not formatting properly based off of those files if necessary.