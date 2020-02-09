#lang sicp
#|(define (filtered-accumulate  combiner null-value filter term a next b)
  (if (> a b) null-value
     (if (filter a)
         (combiner (term a) (filtered-accumulate combiner null-value filter term (next a)  next b))
         (filtered-accumulate combiner null-value filter term (next a) next b))))|#
(define (filtered-accumulate  combiner null-value filter term a next b)
  (define (iter x result)
    (if (> x b) result
        (if (filter x)
            (iter (next x) (combiner result (term x)))
            (iter (next x) result))))
  (iter a null-value))
(define (inc x) (+ x 1))
(define (prime? x)
  (if (= x 1) #f
      (= (s-divisor x) x)))
(define (s-divisor x)
  (define (iter x k)
    (if (> (* k k) x) x
        (if (= (remainder x k) 0) k
            (iter x (+ k 1)))))
  (iter x 2))
(define (identity x) x)