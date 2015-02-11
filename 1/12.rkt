#lang racket

(define (pascal n m) ;;n층 m번째
  (if (or (= m 0) (= m n))
    1
    (+ (pascal (- n 1) (- m 1)) (pascal (- n 1) m))
    )
  )
