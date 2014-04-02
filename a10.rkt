#lang racket
(require gigls/unsafe)

(define canvas (image-new 4 3))
(define picture (image-load "/home/gentleph17/Pictures/me.jpg"))
(image-set-pixel! canvas 2 1 "blue")
(image-set-pixel! canvas 1 1 "red")
(image-set-pixel! canvas 0 2 "red")
(image-set-pixel! canvas 0 0 "green")

;Exercise 3
; a. We expect each pixel to become redder.
; b.
(image-transform! canvas irgb-redder)
; c. We would need to write a code that equally decreases the amount of red
; as the function irgb-redder increases it.
; d. If you made everything completely black or white, the picture will be
; altered beyond repair.

;Excersise 7
; a. To create a function that undoes the redder function, we
;    first added blue and green to the image (offsets all of 
;    the collors by the same amount, makes image brighter),
;    then we darkened it twice (returns image to original brightness.
(compose irgb-bluer irgb-greener irgb-darker irgb-darker)




(define sample (color-name->irgb "blueviolet"))


; Normal color: "138/43/226"

(define sample-redder (irgb-redder sample))
(image-set-pixel! canvas 1 2 sample-redder)
; Redder color:  "170/43/226"

(image-transform-pixel! canvas 1 2 (compose irgb-bluer irgb-greener irgb-darker irgb-darker))

(define much-darker (compose irgb-darker irgb-darker))
(define red (irgb 255 0 0))
