#lang racket

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car p)
  (if (= (remainder p 2) 0)
    (+ 1 (car (/ p 2)))
    0))

(define (cdr p)
  (if (= (remainder p 3) 0)
    (+ 1 (car (/ p 3)))
    0))


(car (cons 2 3))
(cdr (cons 4 5))
