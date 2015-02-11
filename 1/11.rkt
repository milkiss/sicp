#lang racket

(define (f n)
  (define (f-h a b c n)
    (if (= n 0)
      a
      (f-h b c (+ c (* 2 b) (* 3 a)) (- n 1))))
  (f-h 0 1 2 n)
)

(f 4)
