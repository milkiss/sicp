#lang racket

(define (mult-iter a b r)
  (cond ((= b 0) r)
        ((= (remainder b 2) 1) (mult-iter a (- b 1) (+ r a)))
        (else (mult-iter (+ a a) (/ b 2) r))))

(define (mult a b)
  (mult-iter a b 0))

(mult 9 12)
(mult 12 17)
