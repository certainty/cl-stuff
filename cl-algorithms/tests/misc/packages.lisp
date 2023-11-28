(in-package :cl-user)

(defpackage :cl-algorithms.tests.runner
  (:use #:cl #:lisp-unit2)
  (:export
   #:run-all-suites
   #:run-search-suite
   #:run-sort-suite
   #:run-bloomfilter-suite))

(defpackage :cl-algorithms.tests.bloomfilter
  (:use :cl :lisp-unit2 :cl-algorithms.bloomfilter))

(defpackage :cl-algorithms.tests.search
  (:use #:cl
        #:lisp-unit2
        #:cl-algorithms.search))

(defpackage :cl-algorithms.tests.sort
  (:use #:cl
        #:lisp-unit2
        #:cl-algorithms.sort))
