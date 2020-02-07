#lang sicp
(define (square x) (* x x))
(define (divides? n divisor)
  (= (remainder n divisor) 0))
(define (find-divisor n divisor)
  (cond ((> (square divisor) n) n)
        ((divides? n divisor) divisor)
        (else (find-divisor n (+ divisor 1)))))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (prime? n)
  (= (smallest-divisor n) n))

(find-divisor 199 2)
(find-divisor 1999 2)
(find-divisor 19999 2)