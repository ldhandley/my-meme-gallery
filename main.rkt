#lang at-exp codespells

(require my-meme-gallery/mod-info
         website-js)

(require-mod web-browser)
(require-mod hierarchy)
(require-mod dev-runes)

(define family-guy-christmas-url "https://img-9gag-fun.9cache.com/photo/adV38YV_460svvp9.webm")
(define bob-ross-url "https://img-9gag-fun.9cache.com/photo/aEPrBxG_460svvp9.webm")

(define nyan-cat-url "https://newscrewdriver.files.wordpress.com/2018/10/poptartcat320240.gif")
(define surprised-pikachu-url "https://www.letseatcake.com/wp-content/uploads/2019/11/surprised-pikachu-management.jpg")
(define aragorn-url "https://i.redd.it/0w62ahxfspwz.jpg")
(define dyslexic-fry-url "https://i.imgur.com/MWt5gfc.gif")
(define distracted-boyfriend-url "https://i.kym-cdn.com/photos/images/newsfeed/001/287/547/e06.jpg")
(define over-9000-url "https://i.kym-cdn.com/entries/icons/original/000/000/056/itsover1000.jpg")
(define picard-url "https://i.chzbgr.com/full/2478085/h28EDC773/collection-of-annoyed-picard-memes-star-trek-captain-jean-luc-picard")

(define dbutt-url "https://i.kym-cdn.com/entries/icons/original/000/001/030/DButt.jpg")
(define potato-url "https://img-9gag-fun.9cache.com/photo/aepGYbv_460s.jpg")
(define racket-url "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Racket-logo.svg/768px-Racket-logo.svg.png")

(define (meme-video url)
  (web-browser (serve-html-url (video src: url
                                      controls: "true"
                                      autoplay: "true"
                                      style: (properties position: "fixed"
                                                         left: 0
                                                         right: 0
                                                         min-height: "100%"
                                                         margin: "auto")))))

(define (meme-image url)
  (web-browser (serve-html-url (img src: url
                                    style: (properties position: "fixed"
                                                         left: 0
                                                         right: 0
                                                         width: "100%"
                                                         margin: "auto"
                                                         top: "50%"
                                                         'transform: "translateY(-50%)")))))

(define family-guy-christmas
  (meme-video family-guy-christmas-url))
(define bob-ross
  (meme-video bob-ross-url))
(define nyan-cat
  (meme-image nyan-cat-url))
(define surprised-pikachu
  (meme-image surprised-pikachu-url))
(define aragorn
  (meme-image aragorn-url))
(define dyslexic-fry
  (meme-image dyslexic-fry-url))
(define distracted-boyfriend
  (meme-image distracted-boyfriend-url))
(define over-9000
  (meme-image over-9000-url))
(define picard
  (meme-image picard-url))
(define dbutt
  (meme-image dbutt-url))
(define potato
  (meme-image potato-url))

(define meme-number 0)
(define memes
  (list nyan-cat
        bob-ross
        surprised-pikachu
        aragorn
        dyslexic-fry
        distracted-boyfriend
        over-9000
        picard
        dbutt
        potato))

(define (place-meme)
  (define ret (list-ref memes meme-number))
  (set! meme-number (modulo (add1 meme-number) (length memes)))
  ret
  )

(module+ main
  (codespells-workspace ;TODO: Change this to your local workspace if different
   (build-path (current-directory) ".." ".."))
  
  (once-upon-a-time
   #:world (arena-world)
   #:aether (demo-aether
             #:lang (append-rune-langs #:name main.rkt
                     ;(my-mod-lang #:with-paren-runes? #t)
                     (web-browser:my-mod-lang #:with-paren-runes? #t)
                     (hierarchy:my-mod-lang)
                     (dev-runes:my-mod-lang)
                     ))))


