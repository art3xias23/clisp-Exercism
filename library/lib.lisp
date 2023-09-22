; my common-list library

(defpackage :clib
  (:use :cl)
  (:export :logm :loga))

(in-package :clib)

(defun loga (message arg)
  (format NIL "~&[LOG] ~A ~A" message arg))

(defun logm (message)
  (format NIL "~&[LOG] ~A" message))
