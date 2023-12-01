(in-package :aoc.2023)

(defun part-one ()
  (loop for line in (file-lines #p"input/day1.input")
        summing (line->number line)))

(defun part-two ()
  (loop for line in (file-lines #p"input/day1.input")
        summing (line->number (convert-digit-names line))))

(defun line->number (line)
  (let ((all-digits (loop for c across line when (digit-char-p c) collect it)))
    (parse-integer (format nil "~A~A" (first all-digits) (car (last all-digits))))))

(defun convert-digit-names (line)
  "Takes a string as input and returns a string where very occurance of digit
   names have been replaced by the digit itself. It matches the longest names
   first.

   twonethree => 23
  "
  (loop with result = nil
        for idx from 0 below (length line)
        for s = (substitute-with line idx)
        if s
          do (push s result)
        else
          do (push (aref line idx) result)
        finally (return (format nil "~{~a~}" (reverse result)))))

(defun substitute-with (input start-pos)
  (loop for digit from 0 to 9
        when (matches-at-p input (format nil "~r" digit) start-pos)
          do (return-from substitute-with (format nil "~a" digit))))

(defun matches-at-p (input prefix start-pos)
  (let ((end-pos (min (length input) (+ (length prefix) start-pos))))
    (equal (subseq input start-pos end-pos) prefix)))

(define-test substitution-works ()
  (assert-equal 29 (line->number (convert-digit-names "two1nine")))
  (assert-equal 83 (line->number (convert-digit-names "eightwothree")))
  (assert-equal 13 (line->number (convert-digit-names "abcone2threexyz")))
  (assert-equal 24 (line->number (convert-digit-names "xtwone3four")))
  (assert-equal 42 (line->number (convert-digit-names "4nineeightseven2")))
  (assert-equal 14 (line->number (convert-digit-names "zoneight234")))
  (assert-equal 76 (line->number (convert-digit-names "7pqrstsixteen"))))
