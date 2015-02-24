#lang racket

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (+ a b)
  (lambda (f) (lambda (x) (f ((a f) ((b f) x))))))
