#lang sicp
(define (union-set s1 s2)
  (accumulate cons s1 (filter (lambda (x) (not (element-of-set? x s1))) s2)))
(define (accumulate op init seq)
  (cond ((null? seq) init)
        (else (op (car seq)
                  (accumulate op init (cdr seq))))))
(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq)) (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (element-of-set? e s)
  (member e s))