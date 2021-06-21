#lang sicp

(define (smallest-division n)
  (find-divisor n 2))

(define (square n) (* n n))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-division n)))

(prime? 17)
(prime? 42)
(prime? 1024)
