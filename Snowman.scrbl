#lang scribble/manual

@;;; Setup
@;;; =====

@(require racket/sandbox
          scriblib/footnote
          scribble/example
          (prefix-in scribble-eval: scribble/eval)
          scribble/manual
          teachpack/2htdp/scribblings/img-eval
          (for-label racket
                     racket/gui/base
                     racket/class
                     slideshow pict
                     slideshow/code
                     pict/flash)
          (for-syntax racket/base))

@(define my-evaluator
   (make-img-eval))

@(define-syntax-rule (interact e ...)
  (examples #:eval my-evaluator
            #:label #f
            e ...))

@(define-syntax-rule (interact-errors e ...)
  (scribble-eval:interaction #:eval my-evaluator
                             e ...))

@;;; Main document
@;;; =============

@title{Fun in the snow with Racket}
@author{Christopher Lemmer Webber}

This tutorial introduces some basics of programming in Racket and then
guides the user through making a snowman.
It assumes no previous computer science background or knowledge of math
beyond basic awareness of addition, subtraction and division (which aren't
used very much in this tutorial anyway!)

Racket is a fun programming environment and is suitable for
programmers of all experience levels (though this tutorial is aimed at
beginners).  Let's dive in!

@section{Welcome to Racket!}

First you'll need to
@hyperlink["https://download.racket-lang.org/"]{install Racket}.
Then open the DrRacket program.

You'll see two main areas: one that starts out with @racketidfont{#lang racket}
(Racket includes many languages, but the default is called... "racket").
This is the "definitions" section, but we can think of it as the
"stuff to keep" section.
There's also the "interactions" section, which has a ">" prompt, but
we can think of it as the "playground" section.

Before we continue, make the "definitions" ("stuff to keep") section
look like this:

@; Maybe we should click
@codeblock|{
#lang racket
(require pict)
}|

@(examples #:eval my-evaluator
           #:hidden #t
           (require pict))

Now click "run", switch to the "interactions" section (the "playground")
and try running the following:

@interact[(circle 10)]

Do you see a circle ten pixels high?  Cool, right?
Now let's try turning our circle red:

@interact[(colorize (circle 10) "red")]

We'll worry more about what this means later.  For now, feel excited that
you've written your first Racket code!


@section{Racket basics}

Comments start with ";" and aren't evaluated:

@codeblock|{
;; I won't run, but hopefully I tell you something useful!
}|

Text is called a "string", because it's a "string of characters":

@codeblock|{
"I feel very stringy!"}|

Racket has all sorts of numbers, like integers and floating point:

@codeblock|{
42    ; integers
98.6  ; floating point
3/5   ; "rational" numbers
}|

We can add and multiply them and divide them:

@interact[
  (+ 1 2)
  (* 3 6)
  (/ 10 2)]          

This is interesting... this is called a "function call".
The first item in the parentheses is the function, so
@racket[+], @racket[*], and @racket[/] are functions to add, multiply
and divide numbers respectively.
The numbers we supply the functions are called "arguments".

We've seen this before:

@interact[(circle 10)]

@racket[circle] is also a function.
In this case we called @racket[circle] with the argument @racket[10]
because we wanted our circle to be ten pixels high.

Functions are like legos.
We can combine them together:

@interact[(+ 1 (* 2 3))] 

Whoa... what's going on!  Well, if we think about "substituting" each step,
this makes a lot of sense:

@codeblock|{
;; Hm... we need to simplify this!
(+ 1 (* 2 3))
;; Substitute (* 2 3) => 6
(+ 1 6)
;; Substitute (+ 1 6) => 7
7}|

With that in mind, we can understand our colorized circle from earlier:

@interact[
  (circle 10)
  (colorize (circle 10) "red")]

So @racket[colorize] is "transforming" the 10 pixel high circle and
turning it red... cool!

Functions are like that... they take an input, and return an output.
Here's another function:

@interact[
  (string-append "book" "shelf")]

This function takes multiple strings as arguments as inputs and
squashes them down into one string as an output.

Functions are a lot like toasters: you put something in (bread), and
you get something out (toasted bread).
In fact, why don't we write our own toaster function?@note{
  By now you may be finding it annoying to have to type and re-type
  things in the interations area over and over again.
  Consider using the keybindings "Alt + p" and "Alt + n"... they'll
  allow you to go to "previous" and "next" definitions you've typed
  before, and will save you a lot of typing.}

@interact[
  (define (toaster str)
    (string-append "toasted " str))
  (toaster "bread")
  (toaster "bagel")
  (toaster (toaster "bread"))]

We can figure out how this works via substitution also.
When we pass in @racket["bread"], @racket[toaster] binds that to
@racket[str], so:

@codeblock|{
(toaster "bread")
;; becomes
(string-append "toasted " "bread")
;; becomes
"toasted bread"}|

What happens if we try to toast something that isn't a string?

@interact-errors[(toaster 123)]

That's an error!  @racket[string-append] can only append strings!

We can raise our own errors:

@interact-errors[(error "Yuck!")]

Maybe it would be useful if we gave a more descriptive error when
we tried to feed our toaster something that isn't a string.
But first, we need to know... when is something a string?
Racket has functions that answer questions like this.
They usually end in a "?" character, and we call them "predicates".
Here's one called @racket[string?]:

@interact[
  (string? "bread")
  (string? 42)]

Oh that's interesting... we haven't seen @racket[#t] or @racket[#f] before.
Can guess what they mean?
If you guessed "true" and "false", you're right!
These are called "booleans".@note{
In Racket, everything that isn't @racket[#f] is technically true!}

Now that we have a way to check whether something is a string, we need
a way to conditionally do one thing if something is true and another if
something is false.
As it turns out, this kind of expression is called a "conditional",
and one such conditional is called @racket[if]!@note{Two other useful
conditionals are @racket[when] and @racket[cond], but we won't cover them
in this tutorial.}

@codeblock|{
(if (string? "bread")           ; this is the "test"
    "That looks like a string"  ; run if true
    "That's not a string!")     ; run if false}|

Now that we have @racket[if] and @racket[string?] we can make a
better toaster:

@interact-errors[
  (define (toaster str)
    (if (string? str)
        (string-append "toasted " str)
        (error "Toasters can only toast strings!")))
  (toaster "submarine sandwich")
  (toaster 42)]

This is a good toaster!
It would be a shame if we lost it, so we should hold on to it.
To do so, copy the @racketidfont{toaster} function definition from the
interactive area and paste it into the definitions area.@note{
  It's possible that the indentation won't look right when copying and pasting.
  No problem... just highlight the code and press the "tab" key.}
(You may also want to save this to a file.)
Now your definitions area should look like:

@codeblock|{
#lang racket

(define (toaster str)
  (if (string? str)
      (string-append "toasted " str)
      (error "Toasters can only toast strings!")))}|

Now press "run".
The interactive area will reset, but since we've defined toaster in
the definition area we can still run it:@note{
  Another name for the interactions section / playground
  is "REPL", which stands for "Read Eval Print Loop".
  Racket users tend to find that it's convenient to experiment with
  things at the REPL and then move them to the definitions area
  once they mature.}

@interact[(toaster "bread")]

We've learned a lot about how Racket basics, and we've promised you that
we'll make a snowman.
We're almost there!
But first we should cover one more datastructure in Racket... lists!

@interact[(list "bread" "bagel" "sub")]

There is a function @racket[map], which can apply a function to each
item in a list.
Why not use @racket[map] on our friend @racket[toaster]?

@interact[
  (map toaster (list "bread" "bagel" "sub"))]
