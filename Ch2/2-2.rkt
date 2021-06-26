#lang sicp

(define (make-segment x y) (cons x y))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (point x y) (make-segment x y))
(define (x-point p) (start-segment p))
(define (y-point p) (end-segment p))

(define (midpoint-segment p)
  (point (/ (+ (x-point (x-point p)) (x-point (y-point p))) 2)
         (/ (+ (y-point (x-point p)) (y-point (y-point p))) 2)))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define PA (point 5 6))
(define PB (point 3 4))
(define AB (make-segment PA PB))
(print-point (midpoint-segment AB))

