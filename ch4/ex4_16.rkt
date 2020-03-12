#lang sicp
(define (split-body-out-defines body) 
  (if (null? body) 
      (let ((defines '()) 
            (others  '())) 
        (cons defines others)) 
      (let ((exp (car body)) 
            (rest (split-body-out-defines (cdr body)))) 
        (if (definition? exp) ;split into two parts,car contains all defines,cdr contains other things
            (cons (cons exp (car rest)) (cdr rest)) 
            (cons (car rest) (cons exp (cdr rest)))))))
(define (defines->let-defines-body defines) 
  (if (null? defines) 
      (let ((let-defines '()) 
            (let-body    '())) 
        (cons let-defines let-body)) 
      (let* ((rest-let-defines-body (defines->let-defines-body (cdr defines))) 
             (rest-defines (car rest-let-defines-body)) 
             (rest-body    (cdr rest-let-defines-body)) 
             (name  (definition-variable (car defines))) 
             (value (definition-value    (car defines))) 
             (current-define (list name ''*unassigned*)) 
             (current-body   (list 'set! name value))) 
        (cons (cons current-define rest-defines) 
              (cons current-body   rest-body)))))
(define (scan-out-defines procedure-body)
  (let* ((splited-body (split-body-out-defines procedure-body))
         (defines (car splited-body))
         (others (cdr splited-body))
         (let-defines-body (defines->let-defines-body defines)))
    (append (list 'let
                        (car let-defines-body))
                  (append (cdr let-defines-body)
                          others))))

