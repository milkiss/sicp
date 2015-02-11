#lang racket

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square a)
  (* a a))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (cond ((prime? n) (report-prime n (- (current-milliseconds) start-time)) true)
        (else false)))

(define (report-prime n elapsed-time)
  (display " *** ")
  (newline)
  (display n)
  (newline)
  (display elapsed-time))

(define (search-for-primes lower-bound n)
  (cond ((= n 0) (newline) (display "END") (newline))
        ((timed-prime-test lower-bound) (search-for-primes (+ 1 lower-bound) (- n 1)))
        (else (search-for-primes (+ 1 lower-bound) n))))

(search-for-primes 10000000000000 3)
(search-for-primes 100000000000000 3)
