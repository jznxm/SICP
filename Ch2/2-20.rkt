#lang sicp

(define (same-parity first . rest) 
  (define (same-parity-iter source dist remainder-val) 
    (if (null? source) 
        dist 
        (same-parity-iter (cdr source) 
                          (if (= (remainder (car source) 2) remainder-val) 
                              (append dist (list (car source))) 
                              dist) 
                          remainder-val))) 
    
  (same-parity-iter rest (list first) (remainder first 2))) 
           
(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)

;(define (scale-list items factor)
;  (if (null? items)
;      nil
;      (cons (* (car items) factor)
;            (scale-list (cdr items) factor))))

;(scale-list (list 1 2 3 4 5) 10)

(map + (list 1 2 3) (list 40 50 60) (list 700 800 900))

(map (lambda (x y) (+ x (* 2 y)))
     (list 1 2 3)
     (list 4 5 6))

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

(scale-list (list 1 2 3 4 5) 10)