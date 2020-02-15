#lang sicp
(define (deep-reverse l)
  (define (f a l)
    (if (null? l) a
        (if (not (list? l)) l
            (f (cons (deep-reverse (car l)) a) (cdr l)))))
  (f nil l))
(deep-reverse '(1 2 (3 4)))