#lang sicp

(define (cont-frac n d k)
  (define (frac-rec i)
     (/ (n i)
        (+ (d i)
           (if (= i k)
               0
               (frac-rec (+ i 1))))))
   (frac-rec 1))

;(cont-frac-iter k (/ (n k) (d k)))
;(define (cont-frac n d k)
;   (define (cont-frac-iter i result)
;     (if (= i 0)
;         (/ (n i) (+ (d i) result))
;         (cont-frac-iter (- i 1)
;                         (/ (n i) (+ (d i) result)))))
;   (cont-frac-iter k 0.0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           1000)
