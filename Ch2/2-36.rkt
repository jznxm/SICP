#lang sicp

(define (accumulate op init seqs)
  (if (null? seqs)
      init
      (op (car seqs)
	  (accumulate op init (cdr seqs)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define t (list (list 10 20 30) (list 40 50 60) (list 70 80 90)))

(map car t)
(map cdr t)

(accumulate-n + 0 t )