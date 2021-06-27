#lang sicp

(define (make-interval a b)
  (if (<= a b)
      (cons a b)
      (cons b a)))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (define (opposite-pair? a b) 
    (if (positive? a) 
        (negative? b) 
        (positive? b))) 
  
  (define (positive-pair? a b) 
    (if (opposite-pair? a b) 
        #f 
        (positive? a))) 
  
  (define (negative-pair? a b) 
    (if (opposite-pair? a b) 
        #f 
        (negative? a))) 
  (let        ((x0 (lower-bound x)) 
               (x1 (upper-bound x)) 
               (y0 (lower-bound y)) 
               (y1 (upper-bound y))) 
    (cond   ((negative-pair? x0 x1) 
             (cond   ((opposite-pair? y0 y1) 
                      (make-interval (* x0 y0) (* x0 y1))) 
                     ((negative-pair? y0 y1) 
                      (make-interval (* x1 y1) (* x0 y0))) 
                     (else 
                      (make-interval (* x1 y0) (* x0 y1))))) 
            ((positive-pair? x0 x1) 
             (cond   ((opposite-pair? y0 y1) 
                      (make-interval (* x1 y0) (* x1 y1))) 
                     ((negative-pair? y0 y1) 
                      (make-interval (* x1 y0) (* x0 y1))) 
                     (else 
                      (make-interval (* x0 y0) (* x1 y1))))) 
            (else 
             (cond   ((positive-pair? y0 y1) 
                      (make-interval (* x0 y1) (* x1 y1))) 
                     ((negative-pair? y0 y1) 
                      (make-interval (* x1 y0) (* x0 y0))) 
                     (else    
                      (make-interval 
                       ((lambda (a b) (if (< a b) a b)) (* x0 y1) (* x1 y0)) 
                       ((lambda (a b) (if (> a b) a b)) (* x0 y0) (* x1 y1)))))))))  

(define (div-interval x y)
  (if (>= 0 (* (lower-bound y) (upper-bound y))) 
      (error "Division error (interval spans 0)" y) 
      (mul-interval x  
                    (make-interval (/ 1. (upper-bound y)) 
                                   (/ 1. (lower-bound y))))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (display-interval i) 
  (display "[") 
  (display (lower-bound i)) 
  (display ",") 
  (display (upper-bound i)) 
  (display "]")
  (newline))

(define intera (make-interval 5 6))
(define interb (make-interval -2 3))

(display-interval (add-interval intera interb))
(display-interval (mul-interval intera interb))
(div-interval intera interb)
(display-interval (div-interval intera interb))
(display-interval (sub-interval intera interb))