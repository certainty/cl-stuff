(in-package :cl-algorithms.tests.runner)

(defun run-all-suite ()
  (run-tests
   :name "all"
   :package '(:cl-algorithm.tests.search
              :cl-algorithm.tests.sort
              :cl-algorithm.tests.bloomfilter)))

(defun run-search-suite ()
  (run-tests
   :name "search"
   :package '(:cl-algorithm.tests.search)))

(defun run-sort-suite ()
  (run-tests
   :name "sort"
   :package '(:cl-algorithm.tests.sort)))

(defun run-bloomfilter-suite ()
  (run-tests
   :name "bloomfilter"
   :package '(:cl-algorithm.tests.sort)))
