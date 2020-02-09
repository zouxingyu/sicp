#lang sicp
(define (close a b)
  (let ((e 0.00001))
    (< (abs (- a b)) e)))
(define (fixed-point f first-guess)
  (define (iter guess)
    (let ((next (f guess)))
          (if (close guess next) guess
              (iter next))))
  (iter first-guess))
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

