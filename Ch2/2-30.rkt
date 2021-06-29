#lang sicp

(define (square n) (* n n))

(define (square-tree items)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
  items))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))