#lang sicp

;Simpson rule

(define (sum term a next b)
  (define (iter a result)
      (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (y index)  (f (+ a (* index h))))
  (define (term index)
    (* (cond ((or (= index 0) (= index n)) 1)
             ((= (remainder index 2) 0) 2)
             (else 4))
       (y index)))

  (* (sum term 0 inc n)
       (/ h 3)))

(define (cube n) (* n n n))
(define (inc n) (+ n 1))

(integral-simpson cube 0 1 100)
(integral-simpson cube 0 1 1000)
