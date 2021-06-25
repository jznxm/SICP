#lang sicp

(define (square n) (* n n))

(define (repeated f n)
  (lambda (x)
    (if (= n 1)
        (f x)
        (f ((repeated f (- n 1)) x)))))

((repeated square 2) 5)
