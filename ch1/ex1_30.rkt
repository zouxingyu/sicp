#lang sicp
#|(define (sum term a next b)
 (if (> a b) 0
      (+ (term a) (sum term (next a) next b))))|#
(define (sum term a next b)
  (define (iter x result)
    (if (> x b) result
        (iter (next x) (+ result (term x)))))
  (iter a 0))
(define (even? x)
  (= (remainder x 2) 0))
(define (next-even x)
  (+ x (remainder x 2)))
(define (inc x) (+ x 1))
(define (simpson f a b n)
 (define fn (next-even n))
 (define h (/ (- b a) n))
 (define (simpson-term k)
   (define y (f (+ a (* k h))))
   (if (even? k) (* y 4) (* y 2)))
  (* (/ h 3) (sum simpson-term 0 inc fn)))
(define (cube x) (* x x x))