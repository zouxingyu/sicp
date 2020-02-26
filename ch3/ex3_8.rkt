#lang sicp
(define f
  (let ((init 1))
    (lambda (n)
      (if (or (= init 0) (= n 0))
        (begin (set! init 0) 0)
        1))))
;;test 
(+ (f 1)(f 0))
