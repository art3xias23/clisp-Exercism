(defpackage :hamming
  (:use :cl)
  (:export :distance))

(in-package :hamming)

(defun distance (dna1 dna2)
  (if (not (= (length dna1) (length dna2)))
      (return-from distance nil)
      (let (( cnt  0))
        (loop for i from 0 below (length dna1)
              do (if (not (equalp (char dna1 i) (char dna2 i)))
                     (setq cnt (+ 1 cnt))))
        cnt)))

(distance "ABC" "YTR")
  
