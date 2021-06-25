#lang sicp

(define (tan-cf x k) 
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i)
               (- (* i 2) 1))
             k))

(define (cont-frac n d k)
  (define (frac-rec i)
     (/ (n i)
        (+ (d i)
           (if (= i k)
               0.0
               (frac-rec (+ i 1.0))))))
   (frac-rec 1.0))

(tan-cf 25 1000)
(tan-cf 45 1000)

