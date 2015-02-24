#lang racket

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (mid-point p1 p2)
  (make-point (/ (+ (x-point p1)
                    (x-point p2))
                 2)
              (/ (+ (y-point p1)
                    (y-point p2))
                 2)))

(define (midpoint-segment s)
  (mid-point (start-segment s)
             (end-segment s)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define sp (make-point 1 2))
(define ep (make-point 3 5))
(define s (make-segment sp ep))
(midpoint-segment s)
