(in-package :cl-user)

(defpackage :cl-algorithms.sort
  (:use :cl)
  (:local-nicknames (:a :alexandria) (:s :serapeum))
  (:import-from :serapeum :->))
(in-package :cl-algorithms.sort)

(deftype predicate () '(function (t t) (or null t)))

(defun bubble-sort (ary &key (test #'<) (key #'identity))
  "Bubble sort goes through the array `ary' repeatedly, comparing adjacent elements.
   If they are out of order, they're swapped. This is done repeatedly for each adjacent pair,
   until no swaps happened.
  "

  (when (<= (length ary) 1)
    (return-from bubble-sort ary))

  (prog1 ary
    (flet ((cmp (a b) (funcall test (funcall key a) (funcall key b))))
      (loop for swapped = nil
            do (loop for i from 1 below (length ary)
                     when (cmp (aref ary (1- i)) (aref ary i))
                       do (progn
                            (rotatef (aref ary (1- i)) (aref ary i))
                            (setf swapped t)))
            while swapped))))
