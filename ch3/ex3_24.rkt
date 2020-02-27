#lang sicp
(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (lookup k1 k2)
      (let ((subtable (same-key? k1 (cdr local-table))))
        (if subtable
            (let ((record (same-key? k2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! k1 k2 item)
      (let ((subtable ( same-key? k1 (cdr local-table))))
        (if subtable
            (let ((record ( same-key? k2 (cdr subtable))))
              (if record
                  (set-cdr! record item)
                  (set-cdr! subtable
                            (cons (cons k2 item)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list k1
                                  (cons k2 item))
                            (cdr local-table))))))
    (define (dispatch m)
      (cond ((eqv? m 'lookup) lookup)
            ((eqv? m 'insert!) insert!)))
    dispatch))

(define (same-key? error)
  (define (helper n1 n2)
    (if (< (abs (- n1 n2)) error)
        true
        false))
  (define (iter k l)
    (if (null? l)
        false
        (if (helper k (car (car l)))
            (car l)
            (iter k (cdr l)))))
  iter)
;test
(define table (make-table (same-key? 1)))
((table 'insert!) 1 10 5)
((table 'lookup) 1.5 10)