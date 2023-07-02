(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

(defun make-magnificent-maybe (predicate lst)
  (mapcar predicate lst))

(defun only-the-best (predicate lst)
  (remove 1 (remove-if predicate lst)))
 
