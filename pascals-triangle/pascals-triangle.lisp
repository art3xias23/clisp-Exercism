(defpackage :pascals-triangle
  (:use :cl)
  (:export :rows))
(in-package :pascals-triangle)

;(defun rows (n))

(defun pyramid (n)
  (let (
        (y (1- (* 2 n)))
        (x n))
    (loop for i from 1 to (1+ x) do
          (let (
                (diff (- n i)))
            (loop for j from 1 to (1+ y) do
                                      (if (and (> j diff) (< j (- y diff)))
                                          (if (not (= (mod i 2) 0))
                                              (if (not (= (mod j 2) 0))
                                                  (format t "x")
                                                  (format t " "))
                                              (if (= (mod j 2) 0)
                                                  (format t "x")
                                                  (format t " ")))
                                          (format t " "))))
          (format t "~%"))))


(pyramid 4)

                 

          
