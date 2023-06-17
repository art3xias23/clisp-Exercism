(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

(defun preparation-time (&rest rest)
  (* 19 (length rest)))
 


(defun remaining-minutes-in-oven (&optional (opt 337 opt-provided))
  (if opt-provided (cond
                     ((eql opt :normal) 337)
                     ((eql opt :shorter) 237)
                     ((eql opt :very-short) 137)
                     ((eql opt :longer) 437)
                     ((eql opt :very-long) 537)
                     (t 0))
      opt))
  

(defun split-leftovers (&key (weight nil weight-provided) (human 10) (alien 10))
  (if weight-provided 
      (if (null weight)
          :looks-like-someone-was-hungry
       (- weight (+ alien human)))
      :just-split-it))
          
      
                       

