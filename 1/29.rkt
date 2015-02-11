#lang racket

(define (sum term a next b k)
  (if (> a b)
    0
    (+ (term a k)
       (sum term (next a) next b (+ k 1)))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-h x) (+ x h))
  (define (term x k) 
    (* (f x)
       (cond ((= k 0) 1)
             ((= k n) 1)
             ((= (remainder k 2) 1) 4)
             (else 2))))
  (* (/ h 3)
     (sum term a add-h b 0)))

(define (cube x) (* x x x))

(simpson cube 0 1 1)
(simpson cube 0 1 10)
(simpson cube 0 1 100)
(simpson cube 0 1 1000)
