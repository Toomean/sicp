#lang sicp

(#%require rackunit)

#|
  `new-if` is a procedure, and Scheme uses applicative-order evaluation (1.1.5),
  so even before new-if is actually performed, it has to evaluate all the arguments first,
  which are guess and (sqrt-iter (improve guess x) x). You can see that the latter argument is a recursion,
  which calls a new new-if procedure, this is how the infinite loop occurs.

  The ordinary if need not evaluate its arguments first, just go along the way,
  this is the difference between if and new-if.
|#

(define (new-if predicate then-clause else-clause)
  (cond
    (predicate then-clause)
    (else else-clause)
  )
)

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (improve guess x) (average guess (/ x guess)) )
(define (good-enough? guess x)
  (<
    (abs (- (square guess) x ))
    0.001
  )
)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)
  )
)

; Testing average procedure
(check-equal? (average 1 2) 3/2)
(check-equal? (average 1 1) 1)
(check-equal? (average 3 2) 5/2)
(check-equal? (average 10 2) 12/2)

; Testing square procedure
(check-equal? (square 1) 1)
(check-equal? (square 2) 4)
(check-equal? (square 3) 9)
(check-equal? (square 4) 16)
(check-equal? (square 5) 25)

; Testing new-if procedure
(check-equal? (new-if (= 2 3) 0 5 ) 5)
(check-equal? (new-if (= 1 1) 0 5 ) 0)

; Testing good-enough? procedure
(check-equal? (good-enough? 1 1) #t)
(check-equal? (good-enough? 2 4) #t)
(check-equal? (good-enough? 3 16) #f)
(check-equal? (good-enough? 4 25) #f)
