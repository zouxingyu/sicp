#lang sicp

(define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))
(define (add2 e) (accumulate make-sum 0 (cddr e)))
(define (multi2 e)(accumulate make-product 1 (cddr e)))