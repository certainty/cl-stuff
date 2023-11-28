(in-package :cl-algorithms.tests.bloomfilter)

(define-test check-member ()
  (let ((bf (make-instance '<bloomfilter>)))
    (assert-false (member-p bf "foo"))))

(define-test member-p-reports-element ()
  (let ((bf (make-instance '<bloomfilter>)))
    (insert bf "foo")
    (assert-true (member-p bf "foo"))))

(define-test saturated-works ()
  (let ((bf (make-instance '<bloomfilter> :size 1)))
    (assert-false (saturated-p bf))
    (insert bf "foo")
    (assert-true (saturated-p bf))))
