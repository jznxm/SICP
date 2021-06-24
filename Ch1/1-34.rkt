#lang sicp 

(define (f g)
  (g 2))

(define (square n) (* n n))
(f square)

(f (lambda (z) (* z (+ z 1))))

(f f)
