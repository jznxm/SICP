#lang sicp

(define (product-recursive term a next b)
  (if (> a b)
      1.0
      (* (term a)
         (product-recursive term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1.0))
         
(define (identity n) n)
(define (inc n) (+ n 1))

(product-recursive identity 4 inc 10)
(product-iter identity 4 inc 10)

(define (factorial n)
  (product-iter identity 1 inc n))

(define (pi-term n) 
   (if (even? n) 
       (/ (+ n 2) (+ n 1)) 
       (/ (+ n 1) (+ n 2)))) 

(define pi 
    (* (product-recursive pi-term 1 inc 1000000)
       4))
pi
