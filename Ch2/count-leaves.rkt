#lang sicp

(define (count-leaves items)
  (cond ((null? items) 0)
        ((not (pair? items)) 1)
        (else (+ (count-leaves (car items))
                 (count-leaves (cdr items))))))

(define x (cons (list 1 2) (list 3 4)))

(count-leaves x)
(count-leaves (cons x x))