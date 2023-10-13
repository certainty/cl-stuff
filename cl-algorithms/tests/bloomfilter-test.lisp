(in-package :cl-algorithms/tests)

(define-test :cl-algorithms/tests/bloomfilter
  :parent :cl-algorithms/suite)

(define-test member-p-on-empty-bloomfilter
  :parent :cl-algorithms/tests/bloomfilter
  (let ((bf (make-instance '<bloomfilter>)))
    (is null (member-p bf "foo"))))

(define-test member-p-reports-element
  :parent :cl-algorithms/tests/bloomfilter
  (let ((bf (make-instance '<bloomfilter>)))
    (insert bf "foo")
    (true (member-p bf "foo"))))
