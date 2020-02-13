#lang sicp
(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (compose f g) (lambda (x) (f (g x))))
(define (repeat f n)
  (if (= n 1) f (compose f (repeat f (- n 1)))))