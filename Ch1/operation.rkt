#lang sicp
133

(+ 21 35 42 51 60 72 89 99)

(* 24 5 3)

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
      (+ (- 10 7)
         6))

(define size 2)
size
(* size 5)

(define pi 3.1415926)
(define radius 10)
(* pi (* radius radius))
(define circumference (* 2 pi radius))
circumference

(define (square x) (* x x))
(square 5)

(define (sum-of-square x y) (+ (square x) (square y)))
(sum-of-square 3 4)

(define (f a) (sum-of-square (+ a 1) (* a 2)))
(f 5)

(define (abs x)
  (cond ((> x 0) x)
        ((< x 0) (- x))
        ((= x 0) 0)))

(define (abs1 x)
  (cond ((< x 0) (- x))
         (else x)))

(define (abs2 x)
  (if (< x 0)
      (- x)
      x))

(abs2 5)
(abs2 -3)
(abs2 0)

#f
false
#t
true