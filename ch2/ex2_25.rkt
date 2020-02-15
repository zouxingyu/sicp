#lang sicp
(define l1 (list 1 3 (list 5 7) 9))
(define l2 (list (list 7)))
(define l3 '(1 (2 (3 (4 (5 (6 7)))))))

(car (cdr (car (cdr (cdr l1)))))
(car (car l2))
(car(cdr(car(cdr(car (cdr (car (cdr (car (cdr (car (cdr l3))))))))))))