#lang sicp
(define (accumulate op init seq)
  (cond ((null? seq) init)
        (else (op (car seq)
                  (accumulate op init (cdr seq))))))
(define (enumerate-interval i j)
  (if (> i j) nil (cons i (enumerate-interval (+ i 1) j))))
(define (flatten proc seq)
  (accumulate append nil (map proc seq)))
(define (unique-pairs n)
  (flatten  (lambda (x) (map (lambda (y) (list x y)) (enumerate-interval 1 (- x 1))))
            (enumerate-interval 1 n)))
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
(define (filter f seq)
  (if (null? seq) nil
      (if (f (car seq))
          (cons (car seq) (filter f (cdr seq)))
          (filter f (cdr seq)))))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (prime? x)
  (define (iter a r)
    (if (> r (sqrt a)) a
        (if (= (remainder a r) 0) r (iter a (+ r 1)))))
  (if (and (= (iter x 2) x) (not (= x 1))) #t #f))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))