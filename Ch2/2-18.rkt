#lang sicp

(define (reverse1 items) 
   (define (iter items result) 
     (if (null? items) 
         result 
         (iter (cdr items) (cons (car items) result)))) 
  
   (iter items nil))

(define (reverse2 items)
  (if (null? (cdr items))
      items
      (append (reverse2 (cdr items))
              (cons (car items) nil))))

(reverse1 (list 1 4 9 16 25))
(reverse2 (list 1 4 9 16 25))
      