#lang sicp
(define (let? exp) (tagged-list? exp 'let))
(define (let-vars exp)  (map car (cadr exp)))
(define (let-exps exp)  (map cadr (cadr exp)))
(define (let-body exp) (cddr exp))
(define (let->combination exp)
  (cons (make-lambda (let-vars exp) (let-body exp))
        (let-exps exp)))
((let? exp) (analyze (let-combination exp)))
