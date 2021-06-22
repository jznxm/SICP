#lang sicp

(define (square x) (* x x)) 
  
(define (miller-rabin-expmod base exp m) 
   (define (squaremod-with-check x) 
     (define (check-nontrivial-sqrt1 x square) 
       (if (and (= square 1) 
                (not (= x 1)) 
                (not (= x (- m 1)))) 
           0 
           square)) 
     (check-nontrivial-sqrt1 x (remainder (square x) m))) 
   (cond ((= exp 0) 1) 
         ((even? exp) (squaremod-with-check 
                       (miller-rabin-expmod base (/ exp 2) m))) 
         (else 
          (remainder (* base (miller-rabin-expmod base (- exp 1) m)) 
                     m)))) 
  
(define (miller-rabin-test n) 
   (define (try-it a) 
     (define (check-it x) 
       (and (not (= x 0)) (= x 1))) 
     (check-it (miller-rabin-expmod a (- n 1) n))) 
   (try-it (+ 1 (random (- n 1))))) 
  
(define (fast-prime? n times) 
   (cond ((= times 0) true) 
         ((miller-rabin-test n) (fast-prime? n (- times 1))) 
         (else false))) 
  
(define (prime? n)  
    ; Perform the test how many times?  
    ; Use 100 as an arbitrary value.  
    (fast-prime? n 100))  
  
(define (report-prime n expected)  
   (define (report-result n result expected)  
     (newline)  
     (display n)  
     (display ": ")  
     (display result)  
     (display ": ")  
     (display (if (eq? result expected) "OK" "FOOLED")))  
   (report-result n (prime? n) expected))  
    
(report-prime 2 true)  
(report-prime 7 true)  
(report-prime 13 true)  
(report-prime 15 false) 
(report-prime 37 true)  
(report-prime 39 false) 
   
(report-prime 561 false)  ; Carmichael number  
(report-prime 1105 false) ; Carmichael number  
(report-prime 1729 false) ; Carmichael number   (report-prime 2465 false) ; Carmichael number  
(report-prime 2821 false) ; Carmichael number  
(report-prime 6601 false) ; Carmichael number 