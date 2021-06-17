#lang sicp

(define (+ a b)
  (if (= a 0)
     b
     (inc (+ (dec a) b))))

;(define (+ a b)
;  (if (= b 0)
;      a
;      (+ (inc a) (dec b))))

(+ 5 6)