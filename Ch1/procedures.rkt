#lang sicp

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))
(sum-integers 100 100000)

(define (cube n) (* n n n))
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))
(sum-cubes 100 500)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (inc n) (+ n 1))
(define (sum-cubesp a b)
  (sum cube a inc b))
(sum-cubesp 100 500)

(define (identity x) x)
(define (sum-integersp a b)
  (sum identity a inc b))
(sum-integersp 100 100000)

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))
(pi-sum 1 100000)

(define (pi-sump a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))
(pi-sump 1 100000)
(* 8 (pi-sump 1 100000))
