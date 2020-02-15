#lang sicp
(define (reverse l)
  (define (f a l)
    (if (null? l) a (f (cons (car l) a) (cdr l))))
  (f nil l))
(reverse (list 1 2 3))
(reverse (list))
