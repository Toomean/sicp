#lang sicp

(#%require rackunit)

(define (solution x y z)
  (define biggest1 x)
  (define biggest2 y)
  (cond
    (
      (and (> z biggest1) (> z biggest2)) (begin
        (set! biggest1 z)
        (set! biggest2
          (if (> x y)
            x
            y
          )
        )
      )
    )
    (
      (> z biggest1) (set! biggest1 z)
    )
    (
      (> z biggest2) (set! biggest2 z)
    )
  )

  (+
    (* biggest1 biggest1)
    (* biggest2 biggest2)
  )
)

(check-equal? (solution 3 2 1) 13)
(check-equal? (solution 5 1 3) 34)
(check-equal? (solution 0 5 -1) 25)
(check-equal? (solution 100 1 1) 10001)
(check-equal? (solution 0 5 2) 29)
(check-equal? (solution -5 -2 -1) 5)
