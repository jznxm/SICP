#lang sicp

(define (func1 n)
  (cond ((< n 3) n)
        (else (+ (func1 (- n 1))
                 (* 2 (func1 (- n 2)))
                 (* 3 (func1 (- n 3)))))))

(func1 10)

(define (func2 n)
  (func2-iter 1 2 4 n))

(define (func2-iter a b c n)
  (cond ((< n 3) n)
        ((= n 3) c)
        (else (func2-iter b c (+ c (* 2 b) (* 3 a)) (- n 1)))))


(func2 -1)
(func2 0)
(func2 10)
(func2 1000)