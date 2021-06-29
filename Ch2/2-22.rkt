#lang sicp

(define (square n) (* n n))

(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(square-list1 (list 1 2 3 4))

(define (square-list2 items) 
  (define (iter things answer) 
    (if (null? things) 
        answer 
        (iter (cdr things) 
              (cons answer (square (car things)))))) 
  (iter items nil))
  
(square-list2 (list 1 2 3 4))

(define (square-list3 items) 
  (define (iter l pick) 
    (define r (square (car l))) 
    (if (null? (cdr l)) 
        (pick (list r)) 
        (iter (cdr l) (lambda (x) (pick (cons r x)))))) 
  (iter items (lambda (x) x)))
  
(square-list3 (list 1 2 3 4))

