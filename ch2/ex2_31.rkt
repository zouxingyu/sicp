#lang sicp
(define (square-tree tree) (tree-map square tree))
(define (tree-map f sub-tree)
  (map (lambda (sub-tree) (if (pair? sub-tree) (tree-map f sub-tree) (f sub-tree))) sub-tree))
(define (square x) (* x x))

;;test
(define t '(1 2 (3 4) (6 (7 8))))
(square-tree t)