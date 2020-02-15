#lang sicp
 ;; The max and min can be supplied to the constructor in any order. 
 (define (make-interval a b) (cons a b)) 
 (define (upper-bound interval) (max (car interval) (cdr interval))) 
 (define (lower-bound interval) (min (car interval) (cdr interval))) 
  
 ;; The minimum value would be the smallest possible value 
 ;; of the first minus the largest of the second.  The maximum would be 
 ;; the largest of the first minus the smallest of the second. 
 (define (sub-interval x y) 
   (make-interval (- (lower-bound x) (upper-bound y)) 
                  (- (upper-bound x) (lower-bound y)))) 
  
 (define (display-interval i) 
   (newline) 
   (display "[") 
   (display (lower-bound i)) 
   (display ",") 
   (display (upper-bound i)) 
   (display "]"))

(define (pos z) (and (> (car z) 0) (> (cdr z) 0)))
(define (neg z) (and (< (car z) 0) (< (cdr z) 0)))
(define (span z) (<= (* (car z) (cdr z)) 0))

(define (mul-interval x y)
  (define ux (upper-bound x))
  (define uy (upper-bound y))
  (define lx (lower-bound x))
  (define ly (lower-bound y))
  (cond ((pos x) (cond ((pos y) (make-interval (* lx  ly) (*  ux uy)))
                       ((neg y) (make-interval (* ux  ly) (*  lx uy)))
                       ((span y) (make-interval (* ux  ly) (*  ux uy)))))
        ((neg x) (cond ((pos y) (make-interval (* lx  uy) (*  ux ly)))
                       ((neg y) (make-interval (* ux  uy) (*  lx ly)))
                       ((span y) (make-interval (* lx  uy) (*  lx ly)))))
        ((span x) (cond ((pos y) (make-interval (* lx  uy) (*  ux uy)))
                       ((neg y) (make-interval (* ly  ux) (*  lx ly)))
                       ((span y) (make-interval (min (* lx uy) (* ly ux)) (max (* lx ly) (* ux uy)) ))))))
;;test
(define i (make-interval -1 2))
(define j (make-interval -3 0))
(define k (make-interval 1 3))
(define l (make-interval -3 -1))
(display-interval (mul-interval i j))
(display-interval (mul-interval i k))
(display-interval (mul-interval i l))
(display-interval (mul-interval k l))
(display-interval (mul-interval l l))