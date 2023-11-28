(in-package :asdf-user)

(defsystem "cl-algorithms"
  :description "Just a playground for algorithms and datastrucuturesin lisp"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/cl-stuff.git")
  :serial t
  :pathname "src"
  :depends-on (:cl-murmurhash :serapeum :alexandria)
  :components
  ((:module "misc"
    :components
    ((:file "packages")
     (:file "bloomfilter")
     (:file "search")
     (:file "sort"))))
  :in-order-to ((test-op (test-op :cl-algorithms/tests))))

(defsystem  "cl-algorithms/tests"
  :description "Tests for cl-algorithms"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :depends-on (:lisp-unit2 :cl-algorithms)
  :serial t
  :pathname "tests"
  :components
  ((:module "misc"
    :components
    ((:file "packages")
     (:file "bloomfilter-suite")
     (:file "sort-suite")
     (:file "search-suite")
     (:file "runner"))))
  :perform (test-op (o c)
                    (declare (ignore o c))
                    (uiop:symbol-call :cl-algorithms.tests.runner :run-all-suite)))
