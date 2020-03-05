#lang sicp
(#%provide (all-defined))
(define (assoc key record)
  (cond ((null? record) false)
        ((equal? key (caar record)) (car record))
        (else (assoc key (cdr record)))))
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup k1 k2)
      (let ((subtable (assoc k1 (cdr local-table))))
        (if subtable
            (let ((record (assoc k2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! k1 k2 value)
      (let ((subtable (assoc k1 (cdr local-table))))
        (if subtable
            (let ((record (assoc k2 local-table)))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons k2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list k1 (cons k2 value))
                            (cdr local-table))))))
    (define (dispatch m)
      (cond ((eq? m 'get) lookup)
            ((eq? m 'put) insert!)
            (else "unknown error"m)))
    dispatch))
