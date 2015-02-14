#lang racket

(define (log10 n) (/ (log n) (log 10)))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define f (lambda (x) (/ (log10 1000) (log10 x))))
(fixed-point f 1.5)
