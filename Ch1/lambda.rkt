#lang sicp

((lambda (x) (+ x 4)) 5)
(define plus4 (lambda (x) (+ x 4)))

(define (square n) (* n n))
((lambda (x y z) (+ x y (square z))) 1 2 3)
