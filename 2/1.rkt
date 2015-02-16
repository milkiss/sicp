#lang racket

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (if (< (* n d) 0)
      (if (< d 0)
        (cons (/ (* -1 n) g) (/ (* -1 d) g))
        (cons (/ n g) (/ d g)))
      (cons (/ (abs n) g) (/ (abs d) g)))))

(make-rat 1 2)
(make-rat 2 4)
(make-rat -6 -9)
(make-rat -6 9)
(make-rat 6 -9)
