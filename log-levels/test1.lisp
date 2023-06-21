(defpackage :test1
  (:use cl)
  (:export :testing))
(in-package :test1)

(defun testing (str start_index end_index)
  (subseq str start_index end_index))
