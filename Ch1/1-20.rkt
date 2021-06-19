#lang sicp

(define (count-remainders n)
     (define (loop n sum)
         (if (= 0 n) (- sum 1)
             (loop (- n 1) (+ sum (fib n) (fib (- n 1))))))
     (loop n 0))

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(count-remainders 5)
