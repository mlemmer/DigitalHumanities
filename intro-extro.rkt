#lang slideshow

(require images/compile-time
         (for-syntax images/logos))

;; You can comment this out
(define plt-logo
  (bitmap (compiled-bitmap (plt-logo #:height 384))))

(slide
 #:title "Digital Humanities Publishing Workshop"
 (t "With Racket and Scribble!")
 ;; you can comment this out
 (para #:align 'center plt-logo))

(slide
 #:title "Who's who"
 (item "Chris introduces Morgan")
 (item "Morgan introduces Chris"))

(slide
 #:title "Why programming?  Why Racket?"
 'next
 (item "Everyone needs digital literacy.  Make your computer work for you!")
 'next
 (item "Racket is foreveryone:")
 (subitem "Beginners!")
 (subitem "Experts!")
 'next
 (item "Make your own website?")
 'next
 (item "Make games?")
 'next
 (item "Publishing???"))

(slide
 #:title "Publishing?  Really?"
 'next
 (item "Scribble is a friendly publishing language in Racket")
 'next
 ;; Morgan, continue here!
 )
