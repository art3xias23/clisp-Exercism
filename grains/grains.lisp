(defpackage :grains
  (:use :cl)
  (:export :square :total))
(in-package :grains)

(defun square (n)
  (expt 2 (1- n)))

(defun total ()
  (reduce #'+ (mapcar #'(lambda(x) (square x)) (loop for i from 1 to 64 collect i))))

(format t "Answer: ~D~%" (square 3))
