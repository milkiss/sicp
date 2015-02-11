#lang racket
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause))
  )

(define (square x)
  (* x x)
  )

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2)
  )

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.1)
  )

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x) x))
  )

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x))
  )

(sqrt-iter 1.0 10000000000000)

;(new-sqrt-iter 1.0 2) out-of-memory
