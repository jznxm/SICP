#lang sicp

(define (make-segment x y) (cons x y))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (point x y) (make-segment x y))
(define (x-point p) (start-segment p))
(define (y-point p) (end-segment p))

(define (min a b) 
  (if (> a b)
      b
      a))
(define (max a b)
  (if (> a b)
      a 
      b))

(define (make-rec pointa pointb)
  (let ((left-bottom (point
                       (min (x-point pointa) (x-point pointb))
                       (min (y-point pointa) (y-point pointb))))
        (right-top (point
                     (max (x-point pointa) (x-point pointb))
                     (max (y-point pointa) (y-point pointb)))))
    (cons left-bottom right-top)))

(define (left-bottom rec)
  (point (x-point (x-point rec))
         (y-point (x-point rec))))

(define (right-bottom rec)
  (point (x-point (y-point rec))
         (y-point (x-point rec))))

(define (left-top rec)
  (point (x-point (x-point rec))
         (y-point (y-point rec))))

(define (right-top rec)
  (point (x-point (y-point rec))
         (y-point (y-point rec))))

(define (length rec)
  (- (x-point (right-bottom rec))
     (x-point (left-bottom rec))))

(define (width rec)
  (- (y-point (left-top rec))
     (y-point (left-bottom rec))))

(define (perimeter-rec rec)
  (* (+ (length rec) 
        (width rec))
     2))

(define (area-rec rec)
  (* (length rec)
     (width rec)))

(define PA (point 2 9))
(define PB (point 4 6))
(define REC (make-rec PA PB))
(perimeter-rec REC)
(area-rec REC)
