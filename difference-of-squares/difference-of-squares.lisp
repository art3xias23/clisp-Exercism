(defpackage :difference-of-squares
  (:use :cl)
  (:export :sum-of-squares
           :square-of-sum
           :difference))

(in-package :difference-of-squares)

(defun square-of-sum (n)
  "Calculates the square of the sum for a given number."
  (expt (reduce #'+ (loop for i from 0 to n collect i)) 2))
  

(defun sum-of-squares (n)
  "Calculates the sum of squares for a given number."
  (reduce #'+ (mapcar #'(lambda(i) (expt i 2)) (loop for i from 0 to n collect i))))

(defun difference (n)
  "Finds the diff. between the square of the sum and the sum of the squares."
  (- (square-of-sum n) (sum-of-squares n)))


;(format t "output: ~D~%" (square-of-sum 10))
  
