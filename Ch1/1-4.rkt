#lang sicp
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 2 -1)
((if (> -1 0) + -) 2 -1)
((if #f + -) 2 -1)
(- 2 -1)
3