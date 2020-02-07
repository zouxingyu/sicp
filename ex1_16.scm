#lang sicp
 (define (fast-expt-iter b n) 
     (define (expo-iterator b n a) 
     (cond ((= n 0) a) 
           ((even? n) (expo-iterator (* b b) (/ n 2) a)) 
           (else (expo-iterator b (- n 1) (* b a))))) 
   (expo-iterator b n 1))