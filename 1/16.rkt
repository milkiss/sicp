#lang racket

(define (fast-exp b n r)
  (cond ((= n 0) r)
        ((= (remainder n 2) 1) (fast-exp b (- n 1) (* r b)))
        (else (fast-exp (* b b) (/ n 2) r))))

(define (fast-expt b n)
  (fast-exp b n 1))

(fast-expt 2 5)
(fast-expt 3 10)
