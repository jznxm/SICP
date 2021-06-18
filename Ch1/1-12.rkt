#lang sicp

(define (pascal r c) 
   (if (or (= c 1) (= c r)) 
       1 
       (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c)))) 
 
  
(pascal 6 1) 
(pascal 6 2) 
(pascal 6 3)
(pascal 6 4)
(pascal 6 5)
(pascal 6 6)

