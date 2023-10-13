(in-package :cl-algorithms/tests)

(define-test :cl-algorithms/tests/bloomfilter
  :parent :cl-algorithms/suite)

(define-test member-p-on-empty-bloomfilter
  :parent :cl-algorithms/tests/bloomfilter
  (let ((bf (make-instance '<bloomfilter>)))
    (false (member-p bf "foo"))))

(define-test member-p-reports-element
  :parent :cl-algorithms/tests/bloomfilter
  (let ((bf (make-instance '<bloomfilter>)))
    (insert bf "foo")
    (true (member-p bf "foo"))))

(define-test saturated-works
  :parent :cl-algorithms/tests/bloomfilter
  (let ((bf (make-instance '<bloomfilter> :size 1)))
    (false (saturated-p bf))
    (insert bf "foo")
    (true (saturated-p bf))))
