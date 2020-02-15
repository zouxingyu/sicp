#lang sicp
(define (same-parity first . rest)
  (define k (remainder first 2))
  (define (iter ll r)
    (if (null? ll) (reverse r)
        (if (= (remainder (car ll) 2) k) (iter (cdr ll) (cons (car ll) r))
            (iter (cdr ll) r))))
  (iter rest (list first)))
(same-parity  1 2 3 4 5 )