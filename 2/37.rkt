#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    null
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (accumulate (lambda (y z) (cons (dot-product x y) z)) null cols)) m)))

(matrix-*-vector (list 
                   (list 1 2)
                   (list 3 4))
                 (list 1 2))

(transpose (list
             (list 1 2)
             (list 3 4)))

(matrix-*-matrix (list
                   (list 1 2)
                   (list 3 4))
                 (list
                   (list 5 6)
                   (list 7 8)))
