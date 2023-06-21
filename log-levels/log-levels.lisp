(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defun log-message (log-string)
  (subseq log-string 8 (length log-string)))

(defun log-severity (log-string)
  (cond
    ((string-equal (subseq log-string 1 5) "info") :everything-ok)
    ((string-equal (subseq log-string 1 5) "warn") :getting-worried)
    ((string-equal (subseq log-string 1 5) "ohno") :run-for-cover)
    (t nil)))
    
    

(defun log-format (log-string)
  (cond
    ((string= (symbol-name (log-severity log-string)) (symbol-name :everything-ok)) (string-downcase (log-message log-string)))
    ((string= (symbol-name (log-severity log-string)) (symbol-name :getting-worried)) (string-capitalize (log-message log-string)))
    ((string= (symbol-name (log-severity log-string)) (symbol-name :run-for-cover)) (string-upcase (log-message log-string)))))
