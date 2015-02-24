#lang racket

(define (reverse lst)
  (define (helper lst result)
    (if (null? lst)
      result
      (helper (cdr lst) (cons (car lst) result))))
  (helper lst null))

(reverse (list 1 2 3 4 5))
