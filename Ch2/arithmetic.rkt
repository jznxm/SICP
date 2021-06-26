#lang sicp

(define (make-rat x y) (cons x y))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (gcd x)
  (if (= (denom x) 0)
      (numer x)
      (gcd (make-rat (denom x) (remainder (numer x) (denom x))))))

(define (reduce x)
  (make-rat (/ (car x) (gcd x)) (/ (cdr x) (gcd x))))

(define (add-rat x y)
  (reduce
   (make-rat (+ (* (numer x) (denom y))
                (* (denom x) (numer y)))
             (* (denom x) (denom y)))))

(define (sub-rat x y)
  (reduce
   (make-rat (- (* (numer x) (denom y))
                (* (denom x) (numer y)))
             (* (denom x) (denom y)))))

(define (mul-rat x y)
  (reduce 
   (make-rat (* (numer x) (numer y))
             (* (denom x) (denom y)))))

(define (div-rat x y)
  (reduce 
   (make-rat (* (numer x) (denom y))
             (* (denom x) (numer y)))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(define A (make-rat 1 2))
(define B (make-rat 1 4))
(print-rat (add-rat A B))
(print-rat (sub-rat A B))
(print-rat (mul-rat A B))
(print-rat (div-rat A B))
(equal-rat? A B)
