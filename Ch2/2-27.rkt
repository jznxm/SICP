#lang sicp

(define (reverse items) 
  (define (iter items result) 
    (if (null? items) 
        result 
        (iter (cdr items) (cons (car items) result)))) 
  (iter items nil))

(define (deep-reverse items) 
  (define (iter items result) 
    (if (null? items) 
        result 
        (if (pair? (car items)) 
            (let ((x (iter (car items) nil))) 
              (iter (cdr items) (cons x result))) 
            (iter (cdr items) (cons (car items) result)))))
  (iter items nil))

(define (deep-reverse1 L) 
   (define (rev L R) 
     (cond ((null? L) R) 
           ((not (pair? (car L))) (rev (cdr L) 
                                       (cons (car L) R))) 
           (else (rev (cdr L)  
                      (cons (rev (car L) '()) 
                                    R))))) 
   (rev L nil))

(define x (list  (list 1 2) (list 3 4)))

x

(reverse x)

(deep-reverse x)
(deep-reverse1 x)
