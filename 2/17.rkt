#lang racket

(define (last-pair lst)
  (if (null? (cdr lst))
    (car lst)
    (last-pair (cdr lst))))

(last-pair (list 1 2 3 4))
