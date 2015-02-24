#lang racket

(define (reverse lst)
  (define (helper lst result)
    (if (null? lst)
      result
      (helper (cdr lst) (cons (reverse (car lst)) result))))
  (if (list? lst)
    (helper lst null)
    lst))

(reverse (list 1 2 3 4 5))
(reverse (list (list 1 2) (list 3 4)))
