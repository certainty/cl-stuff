(defpackage :cl-bloomfilter
  (:use #:cl #:cl-murmurhash)
  (:export :<bloomfilter> :insert :member-p :saturated-p))

(in-package :cl-bloomfilter)

(defun hash-murmur (o)
  (let ((*hash-size* 128))
    (murmurhash o)))

(defvar *default-hash-functions* (list #'sxhash #'hash-murmur))

(defclass <bloomfilter> ()
  ((state :initarg :state :initform 0 :accessor state :type integer)
   (size :initarg :size :initform 64 :accessor size :type integer)
   (hash-functions :initarg :hash-functions :initform *default-hash-functions* :accessor hash-functions :type list))
  (:documentation "A bloom filter."))

;; define a printer for the bloom filter objects
(defmethod print-object ((bloomfilter <bloomfilter>) stream)
  (print-unreadable-object (bloomfilter stream :type t :identity t)
    (with-slots (size state hash-functions) bloomfilter
      (format stream "size(~A) state(~A => b#~b) hash-function-count(~A)" size state state (length hash-functions)))))

(defgeneric insert (bloomfilter element)
  (:documentation "Insert an element into a bloom filter."))

(defgeneric member-p (bloomfilter element)
  (:documentation "Check if an element exists in a bloom filter. It might be a false positive. But when it returns nil, then element definitely doesn't exist in the bloom filter."))

(defgeneric saturated-p (bloomfilter)
  (:documentation "Predicate to check if the bloomfilter is saturated which means member-p will always return t, as all bits in the internal state are set."))


(defmacro with-hash-bits ((bloomfilter element state-var bit-var) &body body)
  `(with-slots (,state-var hash-functions size) ,bloomfilter
     (dolist (hash-function hash-functions)
       (let ((,bit-var (mod (funcall hash-function ,element) size)))
         ,@body))))

(defmethod insert ((bloomfilter <bloomfilter>) element)
  (with-hash-bits (bloomfilter element state bit)
    (setf state (set-bit state bit))))

(defmethod member-p ((bloomfilter <bloomfilter>) element)
  (with-hash-bits (bloomfilter element state bit-at)
    (when (logbitp bit-at state)
      (return-from member-p t))))

(defmethod saturated-p (bloomfilter)
  (with-slots (size state) bloomfilter
    (= size (logcount state))))


(defun set-bit (state bit)
  "Set the bit in the state to 1"
  (logior state (ash 1 bit)))

(defvar bf (make-instance '<bloomfilter>))
