(defpackage :rna-transcription
  (:use :cl)
  (:export :to-rna))
(in-package :rna-transcription)

(defun to-rna (str)
  (let ((str-new ""))
    (loop for i from 0 below (length str)
         do (ecase (char str i)
              (#\G (setq str-new (concatenate 'string str-new "C")))
              (#\C (setq str-new (concatenate 'string str-new "G")))
              (#\T (setq str-new (concatenate 'string str-new "A")))
              (#\A (setq str-new (concatenate 'string str-new "U")))))
         str-new))

  
