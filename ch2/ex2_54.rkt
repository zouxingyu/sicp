#lang sicp
(define (equal? l1 l2)
  (if (or (and (pair? l1) (not (pair? l2))) (and (pair? l2) (not (pair? l1)))) #f
      (if (and (not (pair? l1)) (not (pair? l2))) (eq? l1 l2)
          (and (equal? (car l1) (car l2)) (equal? (cdr l1) (cdr l2))))))

(equal? '(1 2 3) '(1 2))
(equal? '(1 4) '(1 (4)))