#lang sicp
(define (scan-delete var pairs)
  (define (helper pairs)
    (cond ((null? pairs) nil)
          ((eq? (caar pairs)) (helper (cdr pairs)))
          (else (cons (car pairs) (helepr (cdr pairs))))))
  (helper var pairs))
(define (make-unbound var env)
  (scan-delete car (frame env)))
