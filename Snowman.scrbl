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
                     pict pict/flash)
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

@title{Building a snowman with Racket}
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
           (require pict racket))

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
3/5   ; rational numbers
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

We can slice and dice lists with @racket[first], which pulls the first
item off a list, and @racket[rest], which returns the rest of the list:

@interact[
  (first (list "bread" "bagel" "sub"))
  (rest (list "bread" "bagel" "sub"))
  (first (rest (list "bread" "bagel" "sub")))]

There is a function @racket[map], which can apply a function to each
item in a list.
Why not use @racket[map] on our friend @racket[toaster]?

@interact[
  (map toaster (list "bread" "bagel" "sub"))]


@section{Building a snowman}

Now we know enough things to build a snowman.
Open a new file in DrRacket named "snowman.rkt".
Make sure your definition includes the following, and then click run:

@codeblock|{
#lang racket
(require pict)
}|

The most important ingredient for a snowman is, of course, a snowball.
Previously we used a @racket[circle] and that seems close, but circles
are transparent in the middle, so we should use a @racket[disk] instead.
Let's make a disk 50 pixels high:

@interact[(disk 50)]

Oops... we probably want to specify a color for our snowman.
Snow is usually white,@note{Of course, you can make your snowman
@hyperlink["https://docs.racket-lang.org/draw/color-database___.html"]{a different color}
if you prefer!}
so we can try that by specifying the color as a keyword argument:

@interact[(disk 50 #:color "white")]

Now we need to stack them.
Luckily the pict module comes with @racket[vc-append], which stands for
"vertical center append".
Well, we do want to stack things vertically, so let's try it!

@interact[
  (vc-append
    (disk 50 #:color "white")
    (disk 65 #:color "white")
    (disk 80 #:color "white"))]

That's a good start!
Except maybe we could make it a bit cleaner if we had a @racketidfont{snowball}
function.
Let's write one:

@interact[
  (define (snowball size)
    (disk size #:color "white"))
  (vc-append
    (snowball 50)
    (snowball 65)
    (snowball 80))]

That @racket[snowball] function seems useful.
Copy and paste it to your definitions area so you can keep it around.

In fact, it would be even cleaner if we gave each of our snowballs
names.
The top snowball seems to be the head, the middle snowball seems to
be the body, and the bottom snow ball seems to be the... butt?

Update your definitions area so that it looks like this:

@codeblock|{
#lang racket
(require pict)

;; Makes a snowball
(define (snowball size)
  (disk size #:color "white"))

;; Snowman components
(define head
  (snowball 50))

(define body
  (snowball 65))
  
(define butt
  (snowball 80))

;; Putting it all together
(define snowman
  (vc-append head body butt))}|

@(examples #:eval my-evaluator
           #:hidden #t
  (define head
    (snowball 50))
  (define body
    (snowball 65))
  (define butt
    (snowball 80))
  (define snowman
    (vc-append head body butt)))

This is interesting... we've seen @racket[define] used before to define
the functions @racket[toaster] and @racket[snowball].
But now we are defining variables (names that map to values) that
aren't functions.
If you look carefully you'll notice that the function uses of define
put parentheses around the first argument to @racket[define], whereas
the simple variable uses of @racket[define] do not.

We can now refer to these variables individually at the interaction area:

@interact[head snowman]

Unfortunately a snowman isn't a snowman without a face.
How do we make a face?
Well one oldschool way would be to make a text-based emoticon, like
so:

@interact[(text ":^)")]

Plus, now it has a caret for a carrot nose!

We can use @racket[cc-superimpose] (for "center center superimpose") to
see what it would look like on our head:

@interact[
(cc-superimpose
  (snowball 50)
  (text ":^)"))]

Oops, that doesn't look right.
It's too small, and it's turned the wrong way!
The first argument to text is @racketidfont{content}, but
@racket[text] can take up to three @emph{optional arguments}:
@racketidfont{style}, @racketidfont{size}, and @racketidfont{angle}.

Borrowing ideas from @racket[text]'s documentation, let's make it bold
and change the size:

@interact[(text ":^)" '(bold) 20)]

Better.  But we still need to turn it.
The @racket[text] documentation says that we need to specify
@racketidfont{angle} in radians.
I hear @racket[pi] has something to do with circles and radians.
I wonder what happens if we use pi?

@interact[(text ":^)" '(bold) 20 pi)]

Oops, that turned fit all the way around.
What if we just wanted to turn it halfway around?
I guess that would be half of pi?

@interact[(text ":^)" '(bold) 20 (* pi 1/2))]

Gah!  That's halfway, but in the opposite direction, so let's
try turning it... negative halfway?

@interact[(text ":^)" '(bold) 20 (* pi -1/2))]

Whew!  That looks good.  Let's try putting it on the head:

@interact[
  (cc-superimpose 
    (snowball 50)
    (text ":^)" '(bold) 20 (* pi -.5)))]

Well this is a much better head than we had before.
Let's switch back to the definitions window and replace our definition
for @racket[head] to use it:

@(examples
  #:eval my-evaluator
  #:label #f
  #:no-prompt
  (define head
    (cc-superimpose 
      (snowball 50)
      (text ":^)" '(bold) 20 (* pi -.5)))))

@;; Well, we aren't hitting "run" here, so we manually need to update
@;; the snowman
@(examples #:eval my-evaluator
           #:hidden #t
  (define snowman
    (vc-append head body butt)))

Now hit "run".
Check in the interaction area.. did our head and our snowman update?

@interact[
  head
  snowman]

Now that we've figured out how to put rotated text on the head, we can
apply that same idea to add some "buttons" on the snowman's body:

@interact[
  (text "* * *" '(bold) 20 (* pi -.5))
  (cc-superimpose
    (snowball 65)
    (text "* * *" '(bold) 20 (* pi -.5)))]

That looks pretty good.
Let's update the definitions area to use this new body:

@(examples
  #:eval my-evaluator
  #:label #f
  #:no-prompt
  (define body
    (cc-superimpose
      (snowball 65)
      (text "* * *" '(bold) 20 (* pi -.5)))))

@;; Update the snowman again
@(examples #:eval my-evaluator
           #:hidden #t
  (define snowman
    (vc-append head body butt)))

@interact[snowman]

@emph{@bold{Exercise for the reader:}
Can you figure out how to make the buttons out of disks instead?
Hint: spacing them apart is the tricky part, but read the documentation
for @racket[vc-append] which can take an extra argument that can space
them apart for you.}

Our snowman is starting to look pretty good, but a snowman isn't a snowman
without twig arms.
The "Y" character looks kind of like a twig:

@interact[(text "Y")]

But that's way too small.  Let's make it bigger and bold:

@interact[(text "Y" '(bold) 30)]

We also need to turn it to the left:

@interact[(text "Y" '(bold) 30 (* pi .5))]

We're so close, but this isn't the right color!
Brown would be better:

@interact[
  (colorize (text "Y" '(bold) 30 (* pi .5))
            "brown")]

But we also need a right arm.
When we rotated the face we learned that if we wanted to turn the face
to the right instead of the left, we needed to multiply @racket[pi] by
a negative number instead.  So let's try that:

@interact[
  (colorize (text "Y" '(bold) 30 (* pi -.5))
            "brown")]

The code for making the left arm versus the right arm are exactly the
same except for the amount we're multiplying by pi.
Maybe we should try making a function that can make an arm for us, the
same way we did for @racket{snowball}.
Let's call it @racket{make-arm}, and it'll take one argument, the
amount to rotate:

@interact[
  (define (make-arm rotate-amount)
    (colorize (text "Y" '(bold) 30 (* pi rotate-amount))
              "brown"))
  (make-arm 0)
  (make-arm 1)
  (make-arm .5)
  (make-arm -.5)]

Great... so this function is useful and those last two look like our
left and right arms.
Let's move @racket{make-arm} to the definitions area and define our
@racket{left-arm} and @racket{right-arm}, right above where we defined
the @racket[body]:

@codeblock|{
  (define (make-arm rotate-amount)
    (colorize (text "Y" '(bold) 30 (* pi rotate-amount))
              "brown"))

  (define left-arm
    (make-arm .5))

  (define right-arm
    (make-arm -.5))}|

@(examples
  #:eval my-evaluator
  #:hidden #t
  (define (make-arm rotate-amount)
    (colorize (text "Y" '(bold) 30 (* pi rotate-amount))
              "brown"))
  (define left-arm
    (make-arm .5))
  (define right-arm
    (make-arm -.5)))

Now we need to stick these stick-arms into the sides of our snowman.
If @racket[vc-append] means "vertical center append", then it makes sense
that @racket[hc-append] would mean "horizontal center append".
That sounds like what we want, so let's test if we can modify our body
definition to use it:

@interact[
(hc-append
  left-arm
  (cc-superimpose
    (snowball 65)
    (text "* * *" '(bold) 20 (* pi -.5)))
  right-arm)]

That looks right, though it's getting a bit hard to read.  Let's copy
this to the definitions area but add some comments so we remember
what each part means.

@(examples
  #:eval my-evaluator
  #:label #f
  #:no-prompt
  (define body
    ;; append the left arm, torso, and right arm horizontally
    (hc-append
      left-arm
      ;; make a snowball for the torso and put buttons on it
      (cc-superimpose
        (snowball 65)
        ;; asterisks are acceptable buttons, right?
        (text "* * *" '(bold) 20 (* pi -.5)))
      right-arm))

@;; Re-build the snowman
@(examples #:eval my-evaluator
           #:hidden #t
  (define snowman
    (vc-append head body butt)))

Hit "run".
Now let's see what our snowman looks like in the interaction area:

@interact[snowman]

Horray!  It works!
Not the world's greatest snowman, but quite nice!

@emph{@bold{Exercise for the reader:}
  You can keep improving your snowman!
  For example, you could supply your snowman with a top hat made out of
  @racket[filled-rectangle]s.
  Or you could make a postcard by putting your snowman on a snowy
  field with a sky and some "Happy Holidays" text.
  You could even build a function that lets you customize the postcard's
  message!}

