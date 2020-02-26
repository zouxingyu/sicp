#lang sicp
(define (count-pairs x) 
   (let ((encountered '())) 
     (define (helper x) 
       (if (or (not (pair? x)) (memq x encountered)) 
         0 
         (begin 
           (set! encountered (cons x encountered)) 
           (+ (helper (car x)) 
              (helper (cdr x)) 
              1)))) 
   (helper x)
   (display encountered)))
(define a (cons 'a 'b))
(define b (cons 'a 'b))
(define c (cons a b))
;(set-car! a b)
(count-pairs c)
