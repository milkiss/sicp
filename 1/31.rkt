#lang racket

(define (product term a next b)
  (if (> a b)
    1
    (* (term a) 
       (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial x)
  (define (inc n) (+ 1 n))
  (product-iter (lambda (x) x) 1 inc x))

(factorial 5)

(define (my-pi) 
  (define (inc n) (+ 1 n))
  (define (f n) 
    (* (/ (* 2 n)
          (- (* 2 n) 1))
       (/ (* 2 n)
          (+ (* 2 n) 1))))
  (* 2.0 (product f 1 inc 1000)))

(my-pi)
