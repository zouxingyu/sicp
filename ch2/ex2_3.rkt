#lang sicp
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline) (display (x-point p)) (display ",") (display (y-point p)))

(define (rectangle p1 p2) (cons p1 p2))
(define (p1 r) (car r))
(define (p2 r) (cdr r))
(define (perimeter r)
  (* (+ (abs (- (x-point (p1 r)) (x-point (p2 r)))) (abs (- (y-point (p1 r)) (y-point (p2 r))))) 2))
(define (area r)
   (* (abs (- (x-point (p1 r)) (x-point (p2 r)))) (abs (- (y-point (p1 r)) (y-point (p2 r))))))
(define r (rectangle (cons 1 1) (cons 3 4)))
(perimeter r);10
(area r);6