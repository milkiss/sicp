#lang racket

(define (same-parity . lst)
  (let ((f (car lst)))
    (define (helper lst)
      (cond ((null? lst) null)
            ((= (remainder f 2) (remainder (car lst) 2)) (cons (car lst)
                                                             (helper (cdr lst))))
            (else (helper (cdr lst)))))
    (cons f (helper (cdr lst)))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
