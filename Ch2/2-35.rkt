#lang sicp

(define (count-leaves items)
  (accumulate + 0  (map (lambda (node)
                          (if (pair? node)
                              (count-leaves node)
                              1))
                              items)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define x (cons (list 1 2) (list 3 4)))

(count-leaves x)
(count-leaves (cons x x))