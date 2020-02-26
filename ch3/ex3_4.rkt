#lang sicp
(define (make-account balance password)
  (define incorrect-pwd 0)
  (define (withdraw amount)
    (if (> amount balance)
        "insufficient funds"
        (begin (set! balance (- balance amount)) balance)))
  (define (deposit amount)
     (begin (set! balance (+ balance amount)) balance))
  (define (call-the-cops)
    (error "calling cops"))
  (define (dispatch pwd msg)
    (if (not (eqv? pwd password))
         (begin (set! incorrect-pwd (+ incorrect-pwd 1))
                (if (< incorrect-pwd 3) (error "incorrect password") (call-the-cops)))
         (begin (set! incorrect-pwd 0)
                (cond ((eqv? msg 'withdraw) withdraw)
                      ((eqv? msg 'deposit) deposit)
                      (else (error "unknow request"))))))
  dispatch)
;;test
;;if a incorrect password was entered three times,will run "call-the-cops"
(define acc (make-account 100 'zxy))
