(in-package :cl-user)

(defpackage :cl-algorithms.search
  (:use #:cl)
  (:local-nicknames (:a :alexandria) (:s :serapeum))
  (:import-from :serapeum :->)
  (:export
   #:binary-search))

(defpackage :cl-algorithms.sort
  (:use #:cl)
  (:local-nicknames (:a :alexandria) (:s :serapeum))
  (:import-from :serapeum :->)
  (:export
   #:bubble-sort))

(defpackage :cl-algorithms.bloomfilter
  (:use #:cl #:cl-murmurhash)
  (:local-nicknames (:a :alexandria) (:s :serapeum))
  (:import-from :serapeum :->)
  (:export :<bloomfilter> :insert :member-p :saturated-p))
