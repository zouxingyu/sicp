#lang sicp
(define (scan var pairs)
  (cond ((null? pairs) (cons false nil))
        ((eq? var (caar pairs))
         (cons true (cdr (car pairs))))
        (else (scan (cdr pairs)))))
(define (scan-set var val pairs)
  (cond ((null? pairs) false)
        ((eq? var (caar pairs))
         (set-cdr! (car pairs) val)
         true)
        (else (scan (cdr pairs)))))
(define (lookup-variable-value var env)
  (define (env-loop env)
    (if (eq? env the-empty-enviroment)
        (error "unbound variable" var)
        (let ((result (scan (frame env))))
          (if (car result)
              (cdr result)
              (env-loop (enclosing-environment env))))))
  (env-loop env))
(define (set-variable-value! var val env)
  (define (env-loop env)
    (if (eq? env the-empty-enviroment)
        (error "unbound variable" var)
        (if (not (scan-set (frame env)))
            (env-loop (enclosing-environment env)))))
  (env-loop env))
(define (define-variable! var val env)
 (if (not (scan-set (frame env)))
     (add-binding-to-frame! var val (frame env))))