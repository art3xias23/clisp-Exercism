(defpackage :armstrong-numbers
  (:use :cl)
  (:export :armstrong-number-p))
(in-package :armstrong-numbers)

(defun armstrong-number-p (num)
  (let 
      ((string-number (write-to-string num))
       (lng (length (write-to-string num))))
    (= num  (calculation string-number lng))))

(defun calculation (string-number len)
  (let 
      ((final-number 0)
       (squared 0))
    (loop for num across (reverse string-number) do
          (setq squared (expt (parse-integer (string num)) len))
          (setq final-number (+ final-number squared))
          (format t "num: ~D, squared: ~D, fn: ~D, lng ~D~%" num squared final-number len))
    final-number))

(format t "Is armstrong: ~A~%" (armstrong-number-p 154))
  
                      
