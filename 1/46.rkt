#lang racket

(define (iterative-improve good-enough? improve)
  (define (improving guess)
    (if (good-enough? guess)
      guess
      (improving (improve guess))))
  improving)

(define (average x y)
  (/ (+ x y)
     2))

(define (square x) (* x x))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  ((iterative-improve good-enough? improve) x))

(sqrt 2.0)
