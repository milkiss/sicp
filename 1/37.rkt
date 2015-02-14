#lang racket

(define (cont-frac n d k)
  (define (proc i)
    (if (> i k)
      0
      (/ (n i)
         (+ (d i)
            (proc (+ i 1))))))
  (proc 1))

(define (cont-frac-iter n d k)
  (define (proc i res)
    (if (< i 1)
      res
      (proc (- i 1)
            (/ (n i)
               (+ (d i)
                  res)))))
  (proc k 0))

(/ 1 (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
   )
(/ 1 (cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
   )
