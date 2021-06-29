#lang sicp

(define l1 (list 1 3 (list 5 7) 9))
(define l2 (list (list 7)))
(define l3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(define l4 (list 6 7))
(define l5 (list 7))
l1
l2
l3
l4
l5

(car (cdr (car (cdr (cdr l1)))))
(car (car l2))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr l3))))))))))))
(cadr (cadr (cadr (cadr (cadr (cadr l3))))))
(car (cdr l4))
(car l5)
(cdr l5)