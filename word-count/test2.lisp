(defpackage :t2
  (:use :cl))

(in-package :t2)

(defvar *a* '())
(setf *a* '())

(defun add (key alist)
  (push (cons key 0) alist))

(setf *a* (add "helloe" *a*))

(print *a*)
