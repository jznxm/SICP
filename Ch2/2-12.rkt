#lang sicp

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (center i) (/ (+ (upper-bound i) (lower-bound i)) 2))

(define (make-interval-center-percent c pct)
   (let ((width (* c (/ pct 100.0))))
     (make-interval (- c width) (+ c width))))

(define (percent-tolerance i)
  (let ((center (/ (+ (upper-bound i) (lower-bound i)) 2.0))
        (width (/ (- (upper-bound i) (lower-bound i)) 2.0)))
    (* (/ width center) 100)))



(define i (make-interval-center-percent 10 50))
(lower-bound i)
(upper-bound i)
(center i)
(percent-tolerance i) 
