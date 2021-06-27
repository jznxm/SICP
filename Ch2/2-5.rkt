#lang sicp

(define (expt b n) 
  (define (even? n) (= (remainder n 2) 0))
  (define (square x) (* x x)) 
  (cond ((= n 0) 1) 
        ((even? n) (square (expt b (/ n 2)))) 
        (else (* b (expt b (- n 1)))))) 

(define (largest-power-of a z) 
  (if (= (remainder z a) 0) 
      (+ 1 (largest-power-of a (/ z a))) 
      0)) 
 
(define (cons x y) 
  (* (expt 2 x) (expt 3 y))) 
   
(define (car z) 
  (largest-power-of 2 z)) 
  
(define (cdr z) 
  (largest-power-of 3 z))

(car (cons 5 6))
(cdr (cons 5 6))
(cons 5 6)