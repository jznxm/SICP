#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square n) (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(timed-prime-test 199)
(timed-prime-test 1999)

(define (search-for-primes lower upper) 
   (define (iter n) 
     (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2))))) 
   (iter (if (odd? lower) lower (+ lower 1)))) 

(search-for-primes 10000000 10000100)
(search-for-primes 1000000000 1000000100)
(search-for-primes 100000000000 100000000100)


