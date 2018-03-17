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

@title{Citations and Footnotes}

@section{Citations}
See @secref["Bibliography" #:doc '(lib "scribblings/scribble/scribble.scrbl")] in the @hyperlink["file:///usr/share/doc/racket/scribble/Bibliography.html"]{Scribble Guide}

The formatting for the bibliography in scribble may look intimidating, but really you are filling in the same general fields you would in any citation manager. This feature requires access to the @racket{scriblib/autobib} library, so include that in the list of required libraries at the top of your page. Citations use keyword arguments @racket{(#:title #:url etc)} that allow you to construct your citation with the components you need. For ease of data entry, you can just copy and paste the from the templates below for each citation. However, if you do so remember to @bold{remove any keyword-arguments you do not use} because a blank argument will result in an error message.

@bold{Basic components of a citation:}

@codeblock|{@(define bib-Example2018
   (make-bib
    #:title     "Example Book Title"
    #:author    (authors "Author One" "Author Two")
    #:is-book?  yes
    #:date      2018
    #:location (book-location #:publisher "City:Publisher")
    #:url      "exampleurl.com"
    #:note     "This is where you would annotate your citation"))}|

this is a nuts and bolts example of a citation entry with the types of information required in each field. I will now go through and cut that entry into pieces to explain each of the components you need to create your bibliography. Following that I will provide a template and examples of the main types of bibliographic entry.

@codeblock|{(require scriblib/autobib)}| 

Your bibliography will draw on the @racket{scriblib library}, so it is necessary to include it in the libraries called at the top of your page.

@codeblock|{@(define-cite ~cite citet-id generate-bibliography #:style author+date-style)}|

@(define-cite ~cite citet generate-bibliography #:style author+date-style)

This function is what allows scribble to place citations in-line in your document and generate a bibliography from those citations. It also determines what type of citations you will have using the keyword-argument @literal|{#:style }|. Out of the box, scribble only has two citation options: author+date-style (Flatt and PLT 2010) and number-style@~cite[bib-Flatt2010]. However, you can use a BibTeX file to modify the laTeX output to any citation style you want. You only need to define this function once for the whole bibliography.

@codeblock|{define bib-NameDate
            (make-bib
                     )}|

This has two components. You are essentially defining a new function for each citation. You can use whatever naming convention you want but for your own sanity, stay consistent. For this tutorial, I'm defining each citation with the prefix bib- and the author(s) last name and the date (bib-Barber1994). The second component (make-bib) is what defines this function as a citation.

@codeblock|{#:title "Title of Book Here"}|

This section is for the title of the book or article. This argument requires a string, so place the title in quotation marks. This can lead to some formatting problems when quotation marks are used in the code @italic{and} you are creating an entry for an article and the title needs to be in parentheses. Some BibTeX styles may automatically fix this. If not, use a method called string escaping by typing forward-slash before the set of quotation marks you wish to be visible (@literal|{"This is a string." "\"The Evolution of String Theory\""}|

@codeblock|{#:author (authors "Author One" "Author Two")}|

Since there can be multiple authors, this argument requires a list of strings. Place the author(s) name(s) in quotation marks within the parentheses after authors. If there are multiple authors, leave only a space between the two strings (authors "Carole Gillis" "Marie-Louise Nosch"). The program recognizes the structure of "firstname lastname" in these strings and separates them automatically for whatever citation format you use. If the author name does not fit in this format, use @literal|{@literal}| instead of parentheses. Ex: @literal|{(authors @literal|{Cato the Elder}|), (authors @literal|{Kelsey Museum of Archaeology}|)}|

@codeblock|{#:date "2018"}|

This argument requires a string, so place the date in quotation marks. 

@codeblock|{#:is-book? "yes"}|

This argument italicizes the title component of the citation (as opposed to journal articles, sections of books, or tech reports). @bold{Only use this argument if the answer is yes}. This argument requires a string, so place yes in quotation marks.

@codeblock|{#:url "exampleurl.com"}|

This argument takes a string, place the url in quotation marks.

@codeblock|{#:note "This book was really useful..."}|

You can annotate your bibliography with this argument. While most of the strings we've used so far are short, in this context your string can be as long as a paragraph.

@codeblock|{#:location (citation keyword [])}|

The location field is where you distinguish between citation types. Below are citation types and the additional keyword-arguments that each takes in the location portion of the above template. 

@subsection{Book}

@codeblock|{#:location (book-location #:edition #:publisher )}|

Both of these arguments require strings. For publisher, enter both fields "city: publisher". When a keyword-argument takes multiple subsequent arguments, you can either place them in-line with a single space between as shown here, or return once between arguments.

Template:

@codeblock|{
@(define bib-NameDate
   (make-bib
    #:title
    #:author (authors )
    #:is-book?
    #:date
    #:location (book-location #:edition #:publisher )
    #:url
    #:note ))}|

Example (single author):

@codeblock|{
@(define bib-Barber1994
   (make-bib
    #:title "Women's Work: The First 20,000 Years: Women, Cloth, and Society
in Early Times."
    #:author (authors "E.J.W Barber")
    #:is-book? "yes"
    #:date "1994"
    #:location (book-location #:publisher "New York: Norton")
    #:note "In this seminal book, Barber looks at the association between
women and textile production spanning the time period from 20,000-
500 BCE in various cultures in the Mediterranean, Egypt, and Near East. 
While Barber does not cover Roman evidence, this book is a foundational 
resource for how to approach the topic of textile production as a gendered
task."))}|

@(define bib-Barber1994
   (make-bib
    #:title     "Women's Work: The First 20,000 Years: Women, Cloth, and Society in Early Times."
    #:author    (authors "E.J.W Barber")
    #:is-book?  "yes"
    #:date      "1994"
    #:location  (book-location #:publisher "New York: Norton")
    #:note      "In this seminal book, Barber looks at the association between women and textile production spanning the time period from 20,000-500 BCE in various cultures in the Mediterranean, Egypt, and Near East. While Barber does not cover Roman evidence, this book is a foundational resource for how to approach the topic of textile production as a gendered task."))

Example (multiple authors):

@codeblock|{
@(define bib-GillisNosch2007
   (make-bib
    #:title     "Ancient Textiles. Production, Craft and Society. Proceedings 
of the First International Conference On Ancient Textiles. Lund, Sweden, and
Copenhagen, Denmark, On March 19-23 2003"
    #:author    (authors "Carole Gillis" "Marie-Louise Nosch")
    #:is-book?  "yes"
    #:date      "2007"
    #:location  (book-location #:publisher "Oxford: Oxbow")))}|

@(define bib-GillisNosch2007
   (make-bib
    #:title     "Ancient Textiles. Production, Craft and Society. Proceedings of the First International Conference On Ancient Textiles. Lund, Sweden, and Copenhagen, Denmark, On March 19-23 2003"
    #:author    (authors "Carole Gillis" "Marie-Louise Nosch")
    #:is-book?  "yes"
    #:date      "2007"
    #:location  (book-location #:publisher "Oxford: Oxbow")))

@subsection{Journal Article}

@codeblock|{#:location (journal-location "JournalTitle" 
                        #:pages #:number #:volume)}|

The journal-location argument automatically takes an argument of the title of the journal as a string. The pages argument requires a numerical range in the form of a list. Create this by putting the two numbers in parentheses separated by a single space and place a single quote before the parentheses @literal|{'(1 10)}|

Template:

@codeblock|{
@(define bib-NameDate
   (make-bib
    #:title
    #:author (authors )
    #:date
    #:location (journal-location "JournalTitle" #:pages #:number #:volume)
    #:url
    #:note ))}|

Example:

@codeblock|{
@(define bib-Cottica2006
   (make-bib
    #:title     "\"The Symbolism of Spinning in Classical Art and Society\""
    #:author    (authors "Daniela Cottica")
    #:date      "2006"
    #:location  (journal-location "Cosmos" #:pages '(185 209) #:volume "20")
    #:note      "In this brief article, Cottica summarizes the association 
between women and spinning in the Greek and Roman cultures. She approaches the
topic thematically, covering religious associations, everyday life, and funerary
topics."))}|

@(define bib-Cottica2006
   (make-bib
    #:title      "\"The Symbolism of Spinning in Classical Art and Society\""
    #:author    (authors "Daniela Cottica")
    #:date      "2006"
    #:location  (journal-location "Cosmos" #:pages '(185 209) #:volume "20")
    #:note      "In this brief article, Cottica summarizes the association between women and spinning in the Greek and Roman cultures. She approaches the topic thematically, covering religious associations, everyday life, and funerary topics."))

@subsection{Conference Proceedings}

@codeblock|{#:location (proceedings-location "ProceedingsTitle" #:pages #:number #:volume)}|

This format can be used for conference proceedings or for chapters or sections of books. The proceedings-location argument automatically takes an argument of the title of the proceedings/book as a string. The pages argument requires a numerical range in the form of a list. Create this by putting the two numbers in parentheses separated by a single space and place a single quote before the parentheses @literal|{'(1 10)}|

Template:

@codeblock|{
@(define bib-NameDate
   (make-bib
    #:title
    #:author (authors )
    #:date
    #:location (proceedings-location "ProceedingsTitle" #:pages 
                                     #:number #:volume)
    #:url
    #:note ))}|

Example:

@codeblock|{
@(define bib-Trinkl2007
   (make-bib
    #:title     "\"Artifacts Related to Preparation of Wool and Textile
Processing Found Inside the Terrace Houses of Ephesus, Turkey\""
    #:author    (authors "Elisabeth Trinkl") 
    #:date      "2007"
    #:location  (proceedings-location "Ancient Textiles. Production, Craft and 
Society. Proceedings of the First International Conference On Ancient Textiles.
Lund, Sweden, and Copenhagen, Denmark, On March 19-23 2003" #:pages '(80 86)
#:volume "1")))}|

@(define bib-Trinkl2007
   (make-bib
    #:title     "\"Artifacts Related to Preparation of Wool and Textile
Processing Found Inside the Terrace Houses of Ephesus, Turkey\""
    #:author    (authors "Elisabeth Trinkl") 
    #:date      "2007"
    #:location  (proceedings-location "Ancient Textiles. Production, Craft and Society. Proceedings of the First International Conference On Ancient Textiles. Lund, Sweden, and Copenhagen, Denmark, On March 19-23 2003" #:pages '(80 86) #:volume "1")))

@subsection{Dissertation/Thesis}

@codeblock|{#:location (dissertation-location #:institution #:degree)}|

Both of these arguments require strings, enter the answers in quotation marks.

Template:

@codeblock|{
@(define bib-NameDate
   (make-bib
    #:title
    #:author (authors )
    #:is-book?
    #:date
    #:location (dissertation-location #:institution #:degree)
    #:url
    #:note ))}|

Example:

@codeblock|{
@(define bib-LarssonLoven2002
   (make-bib
    #:title     "The Imagery of Textile Making. Gender and Status in the
    Funerary Iconography of Textile Manufacture in Roman Italy and Gaul"
    #:is-book?  "yes"
    #:author    (authors "Lena Larsson  Lovén")
    #:date      "2002"
    #:location  (dissertation-location #:institution "University of Gothenburg"
                                       #:degree "PhD")
    #:note "Larsson Lovén analyzes funerary iconography related to textile
production from Italy and Roman Gaul. Textile imagery was found on both male
and female funerary monuments and she analyzes the gendered implications 
of how this imagery differs between the two."))}|

@(define bib-LarssonLoven2002
   (make-bib
    #:title     "The Imagery of Textile Making. Gender and Status in the Funerary Iconography of Textile Manufacture in Roman Italy and Gaul"
    #:is-book?  "yes"
    #:author    (authors "Lena Larsson  Lovén")
    #:date      "2002"
    #:location  (dissertation-location #:institution "University of Gothenburg" #:degree "PhD")
    #:note "Larsson Lovén analyzes funerary iconography related to textile production from Italy and Roman Gaul. Textile imagery was found on both male and female funerary monuments and she analyzes the gendered implications of how this imagery differs between the two."))

@subsection{Tech Report} 

@codeblock|{#:location (techrpt-location #:institution #:number)}|

Template:

@codeblock|{
@(define bib-NameDate
   (make-bib
    #:title
    #:author (authors )
    #:date
    #:location (techrpt-location #:institution #:number)
    #:url
    #:note ))}|

Example:

@codeblock|{
@(define bib-Flatt2010
   (make-bib
    #:title    "Reference: Racket"
    #:author   (authors "Matthew Flatt" "PLT")
    #:date     "2010"
    #:location (techrpt-location #:institution "PLT Inc."
                                 #:number "PLT-TR-2010-1")
    #:url      "http://racket-lang.org/tr1/"))}|

@(define bib-Flatt2010
   (make-bib
    #:title    "Reference: Racket"
    #:author   (authors "Matthew Flatt" "PLT")
    #:date     "2010"
    #:location (techrpt-location #:institution "PLT Inc."
                                 #:number "PLT-TR-2010-1")
    #:url      "http://racket-lang.org/tr1/"))

If you are following along and testing this as you go, you've now got several functions defined for specific citations. However, if you were to export these citations to either html or pdf, nothing would appear because so far we've created only the back end. Just like most citation management programs, two more steps are required before you get any output. You must cite the source in your text, then you must generate the bibliography.

Use @literal|{@~cite[bib-NameDate]}| to enter your citations in-line of your text. These will either be author+date-style or number-style depending on which option you determined above. Use @literal|{@(generate-bibliography)}| to create the full bibliography based on sources you've cited in your text. For this example, I'm just using the citation and bibliography styles that come out of the box with scribble. You can change the citation style and formatting with LaTeX.

@codeblock|{I am including this brief literary review as an example of 
citations. The @italic{Racket Reference} has been invaluable 
in creating this guide on using Racket and Scribble for academic 
papers.@~cite[bib-Flatt2010] The @italic{Racket Reference} is the 
only citation here that was used in creating this file, the rest 
of the titles here are drawn from my dissertation research. 
Elizabeth Barber efficiently breaks down the central role that 
women played in the early development of textile production in 
her 1994 book @italic{Women's Work.}@~cite[bib-Barber1994] Daniella 
Cottica rather deftly analyzes this topic thematically utilizing 
both Greek and Roman evidence. However, the breadth of the topic 
exceeds the bounds of an article spanning only 20 pages including 
copious images.@~cite[bib-Cottica2006] Lena Larsson Lovén's work 
focuses on the symbolic relationship between women and textile 
production in the Roman Empire through literary, epigraphic, and 
iconographic sources.@~cite[bib-LarssonLoven2002] Conference 
proceedings from the @italic{International Conference On Ancient 
Textiles} provide interesting case studies of textile research
@~cite[bib-Trinkl2007] as well as current research methods, testing, 
and synthesis between sites.@~cite[bib-GillisNosch2007]}|

@codeblock|{@(generate-bibliography)}| Put this function to generate the bibliography wherever you want the bibliography to appear in your paper.

I am including this brief literary review as an example of citations. The @italic{Racket Reference} has been invaluable in creating this guide on using Racket and Scribble for academic papers.@~cite[bib-Flatt2010] The @italic{Racket Reference} is the only citation here that was used in creating this file, the rest of the titles here are drawn from my dissertation research. Elizabeth Barber efficiently breaks down the central role that women played in the early development of textile production in her 1994 book @italic{Women's Work.}@~cite[bib-Barber1994] Daniella Cottica rather deftly analyzes this topic thematically utilizing both Greek and Roman evidence. However, the breadth of the topic exceeds the bounds of an article spanning only 20 pages including copious images.@~cite[bib-Cottica2006] Lena Larsson Lovén's work focuses on the symbolic relationship between women and textile production in the Roman Empire through literary, epigraphic, and iconographic sources.@~cite[bib-LarssonLoven2002] Conference proceedings from the @italic{International Conference On Ancient Textiles} provide interesting case studies of textile research@~cite[bib-Trinkl2007] as well as current research methods, testing, and synthesis between sites.@~cite[bib-GillisNosch2007]

@(generate-bibliography)

@section{Footnotes}
See @secref["footnotes" #:doc '(lib "scriblib/scribblings/scriblib.scrbl")] in the @hyperlink["file:///usr/share/doc/racket/scriblib/footnotes.html"]{Scribble Guide}

@racket{(require scriblib/footnote)}

Your bibliography will draw on the @racket{scriblib/footnote} library, so it is necessary to include it in the libraries called at the top of your page. There is a built-in note function, @literal|{@note}|.@note{You'll notice that in the html this appears on the side and is unnumbered, in the pdf it is a numbered footnote} In your html output, notes made using this function appear to the side of the text. In the pdf output, they appear as footnotes.

If you want your footnotes to appear as endnotes in the html output, you must define the footnote function using @literal|{@define-footnote}|. This requires two arguments separated by a space --- the first is the tag you will use to place a footnote in-line of your text, the second is the tag you will use to generate your footnotes. You can use whatever naming convention you want. For this tutorial, I’m keeping it simple and using 'footnote' and 'make-footnote'. 

@codeblock|{@define-footnote[footnote make-footnote]}|
@define-footnote[footnote make-footnote]

You then will call your footnotes by typing @literal|{@footnote{Whatever text you want in your footnote}| in-line of your text. Other than html output, @literal|{@note and @footnote}| are now interchangeable. If you use both --- as I have here --- The numbers will sync up in the pdf footnotes even.

You can nest footnotes and citations by typing @literal|{@footnote{@~cite[bib-NameDate]}}|. If you have multiple citations in one footnote, you simply call each citation: @literal|{@footnote{@~cite[bib-NameDate1]; @~cite[bib-NameDate2]}}|. You can also combine both text and a citation in a footnote: @literal|{@footnote{A similar representation can be found in @~cite[bib-NameDate]}}|.

@codeblock|{I am including this brief literary review as an example of 
footnotes and citations.@footnote{Footnotes can be text only, or you
can include a citation.} The @italic{Racket Reference} has been invaluable 
in creating this guide on using Racket and Scribble for academic 
papers.@footnote{@~cite[bib-Flatt2010] The @italic{Racket Reference}
is the only citation here that was used in creating this file, 
the rest of the titles here are drawn from my dissertation 
research.} Elizabeth Barber efficiently breaks down the central 
role that women played in the early development of textile 
production in her 1994 book @italic{Women's Work.}@footnote
{@~cite[bib-Barber1994]} Daniella Cottica rather deftly analyzes 
this topic thematically utilizing both Greek and Roman evidence. 
However, the breadth of the topic exceeds the bounds of an 
article spanning only 20 pages including copious images.
@footnote{@~cite[bib-Cottica2006]} Lena Larsson Lovén's 
work focuses on the symbolic relationship between women 
and textile production in the Roman Empire through literary, 
epigraphic, and iconographic sources.@footnote{@~cite
[bib-LarssonLoven2002]} Conference proceedings from the 
@italic{International Conference On Ancient Textiles} provide 
interesting case studies of textile research@footnote{@~cite
[bib-Trinkl2007]} as well as current research methods, testing, 
and synthesis between sites.@footnote{@~cite[bib-GillisNosch2007]}}|

@codeblock|{@make-footnote[]}|


I am including this brief literary review as an example of footnotes and citations.@footnote{Footnotes can be text only, or you can include a citation.} The @italic{Racket Reference} has been invaluable in creating this guide on using Racket and Scribble for academic papers.@footnote{@~cite[bib-Flatt2010] The @italic{Racket Reference} is the only citation here that was used in creating this file, the rest of the titles here are drawn from my dissertation research.} Elizabeth Barber efficiently breaks down the central role that women played in the early development of textile production in her 1994 book @italic{Women's Work.}@footnote{@~cite[bib-Barber1994]} Daniella Cottica rather deftly analyzes this topic thematically utilizing both Greek and Roman evidence. However, the breadth of the topic exceeds the bounds of an article spanning only 20 pages including copious images.@footnote{@~cite[bib-Cottica2006]} Lena Larsson Lovén's work focuses on the symbolic relationship between women and textile production in the Roman Empire through literary, epigraphic, and iconographic sources.@footnote{@~cite[bib-LarssonLoven2002]} Conference proceedings from the @italic{International Conference On Ancient Textiles} provide interesting case studies of textile research@footnote{@~cite[bib-Trinkl2007]} as well as current research methods, testing, and synthesis between sites.@footnote{@~cite[bib-GillisNosch2007]}

@make-footnote[]
