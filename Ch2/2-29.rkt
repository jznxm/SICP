#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (if (not (pair? mobile))
      mobile
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))))

(define mobile (make-mobile 
                (make-branch 4 6) 
                (make-branch 5 
                             (make-mobile 
                              (make-branch 3 7) 
                              (make-branch 9 8))))) 

(left-branch mobile)
(right-branch mobile)
(branch-length mobile)
(branch-structure mobile)
(total-weight mobile)

(define (balanced? m) 
  (cond ((null? m) #t) 
        ((not (pair? m)) #t) 
        (else 
         (and (= (* (branch-length (left-branch m)) 
                    (total-weight (branch-structure (left-branch m)))) 
                 (* (branch-length (right-branch m)) 
                    (total-weight (branch-structure (right-branch m))))) 
              (balanced? (branch-structure (left-branch   m))) 
              (balanced? (branch-structure (right-branch  m)))))))

(balanced? mobile)