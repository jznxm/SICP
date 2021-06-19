#lang sicp

(define (double x) (+ x x)) 
 (define (halve x) (floor (/ x 2))) 
  
 (define (* a b) 
   (define (iter accumulator a b) 
     (cond ((= b 0) accumulator) 
           ((even? b) (iter accumulator (double a) (halve b))) 
           (else (iter (+ accumulator a) a (- b 1))))) 
   (iter 0 a b)) 
  
 (* 2 4) 
 (* 4 0) 
 (* 5 1) 
 (* 7 10) 
