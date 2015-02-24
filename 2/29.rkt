#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define left-branch car)
(define right-branch cadr)

(define branch-length car)
(define branch-structure cadr)
(define weight? number?)

(define (total-weight mobile)
  (if (weight? mobile)
    mobile
    (+ (total-weight (branch-structure (left-branch mobile)))
       (total-weight (branch-structure (right-branch mobile))))))

(define (balanced? mobile)
  (let ((lb (left-branch mobile))
        (rb (right-branch mobile)))
    (if (= (* (branch-length lb) (total-weight (branch-structure lb)))
         (* (branch-length rb) (total-weight (branch-structure rb))))
      (and (balanced? (branch-structure lb) (branch-structure rb)))
      false)))

