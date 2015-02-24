#lang racket

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< (* n d) 0)
      (if (< d 0)
        (cons (/ (* -1 n) g) (/ (* -1 d) g))
        (cons (/ n g) (/ d g)))
      (cons (/ (abs n) g) (/ (abs d) g)))))

(define (better-make-rat n d)
  (let ((g ((if (< d 0) - +) (gcd n d))))
    (cons (/ n g) (/ d g))))

(make-rat 1 2)
(make-rat 2 4)
(make-rat -6 -9)
(make-rat -6 9)
(make-rat 6 -9)
(better-make-rat -6 -9)
(better-make-rat -6 9)
(better-make-rat 6 -9)
