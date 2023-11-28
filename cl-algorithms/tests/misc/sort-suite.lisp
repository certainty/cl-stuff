(in-package :cl-algorithms.tests.sort)

(define-test bubble-sort-empty ()
  (let ((v (vector)))
    (bubble-sort v)
    (assert-equal v v)))

(define-test bubble-sort-one-element ()
  (let ((v (vector 1)))
    (bubble-sort v)
    (assert-equal v v)))

(define-test bubble-unsorted ()
  (let ((v (vector 3 2 5 1 10)))
    (bubble-sort v)
    (assert-equalp v (vector 1 2 3 5 10))))

(define-test bubble-mostly-sorted ()
  (let ((v (vector 1 2 3 5 4)))
    (bubble-sort v)
    (assert-equalp v (vector 1 2 3 4 5))))
