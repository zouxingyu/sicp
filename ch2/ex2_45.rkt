#lang sicp
(#%require sicp-pict)
(define (split t1 t2)
  (lambda ( painter k)
    (if (= k 0)
        painter
        (let ((smaller ((split t1 t2) painter (- k 1))))
          (t1 painter (t2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))
(paint (up-split einstein 4))