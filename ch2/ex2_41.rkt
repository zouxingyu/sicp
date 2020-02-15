#lang sicp
(define (accumulate op init seq)
  (cond ((null? seq) init)
        (else (op (car seq)
                  (accumulate op init (cdr seq))))))
(define (enumerate-interval i j)
  (if (> i j) nil (cons i (enumerate-interval (+ i 1) j))))
(define (flatten proc seq)
  (accumulate append nil (map proc seq)))

(define (triple n)
  (flatten (lambda (x)
                  (map (lambda (y)
                         (map (lambda (z) (list x y z)) (enumerate-interval 1 (- y 1))))
                       (enumerate-interval 1 (- x 1)))) (enumerate-interval 1 n)))
(define (final-triple n)
   (accumulate append nil (triple n)))
(define (sum3 n s)
  (filter (lambda (tri) (= (sum tri) s)) (final-triple n)))
(define (filter f seq)
  (if (null? seq) nil
      (if (f (car seq))
          (cons (car seq) (filter f (cdr seq)))
          (filter f (cdr seq)))))
(define (sum l)
  (accumulate + 0 l))

;;test
(sum3 5 9)