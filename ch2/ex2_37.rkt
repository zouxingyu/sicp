#lang sicp
(define (accumulate op init seq)
  (cond ((null? seq) init)
        (else (op (car seq)
                  (accumulate op init (cdr seq))))))
(define (accumulate-n op init seq)
  (if (null? (car seq))
      nil
      (cons (accumulate op init (map (lambda (x) (car x)) seq))
            (accumulate-n op init (map (lambda (x) (cdr x)) seq)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
  (map (lambda (x) (accumulate + 0 (map * v x))) m))
(define (transpose mat)
  (accumulate-n cons nil mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (map (lambda (y) (dot-product y x)) cols)) m)))
;;test
(define v '(1 2 3))
(define w '(4 5 6))
(define a '((1 2) (3 4) (5 6)))
(define b '((1 2 3) (4 5 6)))
(dot-product v w)
(transpose a)
(matrix-*-matrix a b)