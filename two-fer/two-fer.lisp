(defpackage :two-fer
  (:use :cl)
  (:export :twofer))
(in-package :two-fer)

(defun twofer (&optional (name nil))
  (if (null name)
   (format nil "One for you, one for me.")
      (format nil "One for ~a, one for me." name))) 
