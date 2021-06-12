#lang sicp
(define (max2 a b c)
  (cond ((and (> a c)
              (> b c))
              (+ a b))
        ((and (> b a)
              (> c a))
              (+ b c))
        (else (+ a c))))
(max2 8 5 6)
             