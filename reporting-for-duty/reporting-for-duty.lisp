(defpackage :reporting-for-duty
  (:use :cl)
  (:export :format-quarter-value :format-two-quarters
           :format-two-quarters-for-reading))

(in-package :reporting-for-duty)

(defun format-quarter-value (quarter value)
  (format nil "The value ~a quarter: ~d" quarter value))

(defun format-two-quarters (strm quarter1 value1 quarter2 value2)
  (format strm "~%~a~%~a~%"(format-quarter-value quarter1 value1)(format-quarter-value quarter2 value2)))

(defun format-two-quarters-for-reading (strm quarter1 value1 quarter2 value2)
  (format strm "~s"(list (format-quarter-value quarter1 value1)(format-quarter-value quarter2 value2))))
