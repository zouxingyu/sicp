#lang sicp
(define (adjoin-set e s)
 (cond ((or (null? s) (< e (car s))) (cons e s))
       ((= e (car s)) s)
       (else (cons (car s) (adjoin-set e (cdr s))))))
