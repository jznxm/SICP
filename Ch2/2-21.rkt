#lang sicp

(define (square n) (* n n))

(define (square-list1 items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list1 (cdr items)))))

(square-list1 (list 1 2 3 4 5))

(define (square-list2 items)
  (map (lambda (x) (square x))
       items))

(square-list2 (list 1 2 3 4 5))