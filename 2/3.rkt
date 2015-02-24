#lang racket

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (square x) (* x x))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (distance p1 p2)
  (sqrt (sum-of-squares (abs (- (x-point p1)
                                (x-point p2)))
                        (abs (- (y-point p1)
                                (y-point p2))))))

(define (make-rec p1 p2)
  (cons p1 p2))

(define (lb-rec r) ;left-bottom
  (car r))

(define (ru-rec r) ;right-top
  (cdr r))

(define (perimeter r)
  (distance (lb-rec r)
            (ru-rec r)))

(define (area r)
  (let ((rb (make-point (x-point (ru-rec r))
                        (y-point (lb-rec r)))))
    (* (distance (ru-rec r) rb)
       (distance (lb-rec r) rb))))

(define p1 (make-point 1 1))
(define p2 (make-point 4 5))

(define rec (make-rec p1 p2))

(perimeter rec)
(area rec)
