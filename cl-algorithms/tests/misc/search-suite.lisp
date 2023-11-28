(in-package :cl-algorithms.tests.search)

(define-test binary-search-empty ()
  (let ((v (vector)))
    (assert-false (binary-search v 0))
    (assert-false (binary-search v 1))))

(define-test binary-search-one-element ()
  (let ((v (vector 1)))
    (assert-equal (binary-search v 1) 1)
    (assert-false (binary-search v 0))
    (assert-false (binary-search v 2))))

(define-test binary-search-more-elements ()
  (let ((v (vector '(1 . foo) '(5 . bar) '(10 . baz) '(12 . barbaz))))
    (assert-equal (binary-search v 10 :key #'car) '(10 . baz))))
