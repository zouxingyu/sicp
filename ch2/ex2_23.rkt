#lang sicp
(define (for-each f l)
  (cond ((null? l) #t)
        (else (f (car l)) (for-each f (cdr l)))))

(define a (list 1 ))
(for-each (lambda (x) (display x)) a)