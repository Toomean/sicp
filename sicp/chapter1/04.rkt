#lang sicp

(#%require rackunit)

#| a-plus-abs-b |#
#| It adds an absolute value of b to a |#


(define (a-plus-abs-b a b)
  ((if (> b 0) + - ) a b))

(check-equal? (a-plus-abs-b 1 1) 2)
(check-equal? (a-plus-abs-b 1 0) 1)
(check-equal? (a-plus-abs-b 1 -1) 2)
