#lang sicp
(define (accumulate op init seq)
  (cond ((null? seq) init)
        (else (op (car seq)
                  (accumulate op init (cdr seq))))))
(define (fold-left op init seq)
  (define (iter result rest)
    (cond ((null? rest) result)
          (else (iter (op result (car rest)) (cdr rest)))))
  (iter init seq))

(define (reverse sequence)
  (accumulate (lambda (x y) (append y (list x))) nil sequence))
(define (reverse-2 sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

;;test
(reverse '(1 2 3 4))