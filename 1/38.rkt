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

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) (if (= (remainder i 3) 2)
                              (* 2.0
                                 (/ (+ i 1)
                                    3))
                              1.0))
                100)
