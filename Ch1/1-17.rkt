#lang sicp

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (* a (halve b))))
      (else (+ a (* a (- b 1))))))

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(* 5 6)
(* 8 7)
(* 50 101)
(* 64 64)
