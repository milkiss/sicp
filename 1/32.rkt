#lang racket

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate (lambda (x y) (+ x y)) 0 term a next b))

(define (mul term a next b)
  (accumulate (lambda (x y) (* x y)) 1 term a next b))

(sum (lambda (x) x) 0 (lambda (x) (+ x 1)) 10)
(mul (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
