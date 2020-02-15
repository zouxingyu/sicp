#lang sicp
(define (square-tree t)
  (cond ((null? t) nil)
        ((not (pair? t)) (* t t))
        (else (cons (square-tree (car t))
                    (square-tree (cdr t))))))
(define (square-tree-2 t)
  (map (lambda (sub-tree) (if (pair? sub-tree) (square-tree-2 sub-tree) (* sub-tree sub-tree))) t))
;;test
(define t '(1 2 (3 4) (6 (7 8))))
(square-tree t)
(square-tree-2 t)