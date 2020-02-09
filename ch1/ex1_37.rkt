#lang sicp
#|(define (cont-frac n d k)
  (define (rec i)
    (if (> i k) 0
        (/ (n i) (+ (d i) (rec (+ i 1))))))
  (rec 1))|#
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0) result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))


(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 5)
