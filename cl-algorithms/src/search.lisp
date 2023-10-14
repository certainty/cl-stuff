(defpackage :cl-algorithms/search
  (:use #:cl))

(defun binary-search (vec get-key n)
  "Perform a binary search on the sorted vector provided.
<vec> denotes the vector of elements to search in.
<get-key> denotes the key selector function which is used to get the key from the elemtns in the vector
<n> is the key you're looking for.

The function returns nil if no such element can be found in the vector.

Examples:

   CL-USER> (defvar o (vector '(1 . foo) '(2 . bar) '(3 . baz) '(4 . barbaz) '(5 . froomle)))
   CL-USER> (binary-search o #'car 3)
   (3 . BAZ)

"
  (let ((len (length vec)))
    (if (zerop len)
        nil
        (let* ((pivot (floor (/ (- len 1) 2)))
               (elem (aref vec pivot))
               (key (funcall get-key elem)))
          (cond
            ((< n key) (binary-search (subseq vec 0 pivot) get-key n))
            ((> n key) (binary-search (subseq vec (incf pivot)) get-key n))
            (t elem))))))
