(defpackage :t
  (:use :cl))

(in-package :t)

(ql:quickload "split-sequence")

(defun lp(str)
    (let ((words (split-sequence:split-sequence #\Space str)))
      (loop for word in words do
            (format t "Word is ~A~%" word))))
(lp "Hello boi bas bad")
