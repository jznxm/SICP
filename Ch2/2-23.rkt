#lang sicp

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

(define (for-each1 proc items) 
   (cond ((not (null? items)) 
          (proc (car items)) 
          (for-each1 proc (cdr items)))))

(for-each1 (lambda (x) (newline) (display x))
          (list 57 321 88))