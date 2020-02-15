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
  
 ;; Usage 
 (define i (make-interval -1 2)) 
 (define j (make-interval -3 -1)) 
  
 (display-interval i) 
 (display-interval (sub-interval i j)) 
 (display-interval (sub-interval j i)) 