#lang sicp
(define (f_recursive n)
  (if (< n 3)
       n
       (+ (f_recursive (- n 1))
          (* (f_recursive (- n 2)) 2)
          (* (f_recursive (- n 3)) 3))))
(define (f_iterative n)
  (define (f x y z count)
    (cond ((< count 2) count)
          ((= count 2) x)
          (else (f (+ x (* y 2) (* z 3)) x y (- count 1)))))
  (f 2 1 0 n))