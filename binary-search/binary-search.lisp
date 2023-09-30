(defpackage :binary-search
  (:use :cl)
  (:export :binary-find :value-error))

(in-package :binary-search)

(defun binary-find (arr el)
  (let 
      ((middle-pos (round (/ (length arr) 2)))
       (middle-num 0))
    (setq middle-num (aref arr middle-pos))
    (if (= middle-num el)
        el
        (binary-find (subseq arr middle-pos)))))
  
