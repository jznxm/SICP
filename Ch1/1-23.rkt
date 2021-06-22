#lang sicp

(define (square x) (* x x)) 
  
(define (smallest-divisor n) 
   (find-divisor n 2)) 
  
(define (find-divisor n test-divisor)
	(define (next n)
	 (if (= n 2) 3 (+ n 2))) 
    (cond ((> (square test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (next test-divisor))))) 
  
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
  
 (timed-prime-test 1009) 
 (timed-prime-test 1013) 
 (timed-prime-test 1019) 
 (timed-prime-test 10007) 
 (timed-prime-test 10009) 
 (timed-prime-test 10037) 
 (timed-prime-test 100003) 
 (timed-prime-test 100019) 
 (timed-prime-test 100043) 
 (timed-prime-test 1000003) 
 (timed-prime-test 1000033) 
 (timed-prime-test 1000037)