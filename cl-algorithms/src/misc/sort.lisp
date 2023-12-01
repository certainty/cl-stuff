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
                     when (cmp (aref ary i) (aref ary (1- i)))
                       do (progn
                            (rotatef (aref ary (1- i)) (aref ary i))
                            (setf swapped t)))
            while swapped))))

(defun insertion-sort (ary &key (test #'<) (key #'identity))
  "Insertion sort works in place and has quadratic worst-case performance.
   It essentially looks at every element and moves that to the left while it's bigger than then the element to it's left.
   This way inserting one element at a time to the sorted part of the array (which is the left).
  "
  (prog1 ary
    (flet ((cmp (a b) (funcall test (funcall key a) b)))
      (dotimes (i (1- (length ary)))
        (do ((j i (1- j)))
            ((minusp j))
          (if (cmp (aref ary (1+ j)) (aref ary j))
              (rotatef (aref ary (1+ j)) (aref ary j))
              (return)))))))
