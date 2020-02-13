#lang sicp
(define (smooth f)
  (define dx 0.01)
  (lambda (x) (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3)))
(define (compose f g) (lambda (x) (f (g x))))
(define (repeat f n)
  (if (= n 1) f (compose f (repeat f (- n 1)))))
(define (smooth-n f n)
  ((repeat smooth n) f))
(define (square x) (* x x))