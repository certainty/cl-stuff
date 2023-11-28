(in-package :cl-algorithms.search)

(defun binary-search (ary val &key (lessp #'<) (key #'identity) (test #'eql))
  "Perform a binary search on the sorted vector provided.
   The function returns nil if no such element can be found in the vector.

   Examples:
   CL-USER> (defvar o (vector '(1 . foo) '(2 . bar) '(3 . baz) '(4 . barbaz) '(5 . froomle)))
   CL-USER> (binary-search o 3 :key #'car)
   (3 . BAZ)
  "
  (labels ((smaller (a b) (funcall lessp (funcall key a) b))
           (same (a b) (funcall test (funcall key a) b)))
    (when (plusp (length ary))
      (let ((beg 0)
            (end (1- (length ary))))
        (do ()
            ((= beg end))
          (let ((mid (+ beg (floor (- end beg) 2))))
            (if (smaller (aref ary mid) val)
                ;; search to the right
                (setf beg (1+ mid))
                ;; search to the left
                (setf end mid))))
        (when (same (aref ary beg) val)
          (aref ary beg))))))
