#lang sicp
(define (factorial x)
  (define (f x count)
    (if (= count 0) x
       (f (* x count) (- count 1))))
  (f 1 x))
(define (pascal row col)
  (/ (factorial (- row 1)) (* (factorial (- col 1)) (factorial (- row col)))))