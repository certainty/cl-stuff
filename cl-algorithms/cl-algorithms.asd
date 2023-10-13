(in-package :asdf-user)

(defsystem "cl-algorithms"
  :description "Just a playground for algorithms and datastrucuturesin lisp"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/cl-stuff.git")
  :serial t
  :pathname "src"
  :components ((:file "bloomfilter"))
  :depends-on (:cl-murmurhash)
  :in-order-to ((test-op (test-op :cl-algorithms/tests))))

(defsystem  "cl-algorithms/tests"
  :description "Tests for cl-algorithms"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :depends-on (:parachute)
  :serial t
  :pathname "tests"
  :components ((:file "package")
               (:file "bloomfilter-test"))
  :perform (test-op (o c)
                    (uiop:symbol-call :parachute :test :cl-algorithms/tests)))
