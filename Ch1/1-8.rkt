#lang sicp

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (cube-root-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ (+ (/ x (square guess)) (* 2 guess)) 3)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? old-guess new-guess)
  (> 0.01
     (/ (abs (- new-guess old-guess))
        old-guess)))

(define (square x) (* x x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 8.0)
(cube-root 900000000000)