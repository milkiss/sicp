#lang racket

(define (cont-frac-iter n d k)
  (define (proc i res)
    (if (< i 1)
      res
      (proc (- i 1)
            (/ (n i)
               (+ (d i)
                  res)))))
  (proc k 0))

(define (f x) (cont-frac-iter (lambda (i) (if (= i 1)
                                            x
                                            (- 0 (* x x))))
                (lambda (i) (- (* 2 i)
                               1))
                1000))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(f (/ 3.14 4))

(fixed-point f 1.0)
