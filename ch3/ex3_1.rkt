#lang sicp
(define (make-accumulator init)
  (define (accum x)
    (begin (set! init (+ init x)) init))
  accum)
(define a (make-accumulator 1))
(a 2)