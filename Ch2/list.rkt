#lang sicp

(define l1 (list 1 2 3 4))
(car l1)
(cdr l1)
l1
(cons 5 l1)

(define (list-ref l n)
  (if (= n 0)
      (car l)
      (list-ref (cdr l) (- n 1))))

(list-ref l1 3)

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(length l1)

(define (append1 list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append1 (cdr list1) list2))))

(define (append2 list1 list2)
  (if (null? list2)
      list1
      (append2 (cons list1 (car list2)) (cdr list2))))

(append1 l1 l1)
(append2 l1 l1)
      