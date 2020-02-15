#lang sicp
(define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil  sequence))
(define (append sq1 sq2)
  (accumulate cons sq2 sq1))
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

