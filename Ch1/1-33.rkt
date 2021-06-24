#lang sicp

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter a null-value))

(define (smallest-div n)
  (define (divides? a b)
    (= 0 (remainder b a)))
  (define (sq n) (* n n))
  (define (find-div n test)
    (cond ((> (sq test) n) n) 
          ((divides? test n) test)
          (else (find-div n (+ test 1)))))
  (find-div n 2))

(define (prime? n)
  (if (= n 1) false (= n (smallest-div n))))

(define (identity n) n)
(define (inc n) (+ n 2))

(define (sum-of-primes a b)
  (filtered-accumulate + 0 identity a inc b prime?))
(sum-of-primes 1 1000)

(define (gcd? m n)
  (define (gcd m n)
    (if (= n 0)
        m
        (gcd n (remainder m n))))
  (= (gcd m n) 1))

(define (product-of-relative-primes n)
  (define (filter x)
    (gcd? n x))
  (filtered-accumulate * 1 identity 1 inc n filter))
(product-of-relative-primes 100)
