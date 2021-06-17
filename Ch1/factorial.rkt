#lang sicp

(define (factorial x)
  (if (= x 1)
  1
  (* x (factorial (- x 1)))))

(factorial 7)

(define (factorial2 n)
  (factorial-iter 1 1 n))

(define (factorial-iter product counter max-count)
  (if (> counter max-count)
      product
      (factorial-iter (* product counter)
                      (+ counter 1)
                      max-count)))

(factorial2 7)