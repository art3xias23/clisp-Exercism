(defpackage :binary-search
  (:use :cl)
  (:export :binary-find :value-error))

(in-package :binary-search)

(defun binary-find (arr el)
  (let 
      ((middle-pos (1- (ceiling (/ (length arr) 2))))
       (middle-num 0))
    (format t "MP: ~D~%" middle-pos)
    (format t "Mn: ~D~%" middle-num)
    (format t "Arr: ~A~%" arr)
    (setq middle-num (aref arr middle-pos))
    (if (>= middle-pos 0)
        (cond
            ((= middle-num el) middle-pos)
            ((> middle-num el) (binary-find (subseq arr 0 (1- middle-pos) el)))
            ((< middle-num el) (binary-find (subseq arr (1+ middle-pos) el))))
        NIL)))

(format t "pos: ~D~%" (binary-find #(6) 6))
(format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 6))
(format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 1))
(format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 11))
(format t "pos: ~D~%" (binary-find #(1 3 5 8 13 21 34 55 89 144 233 377 634) 144))
(format t "pos: ~D~%" (binary-find #(1 3 5 8 13 21 34 55 89 144 233 377)))
(format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 7))
(format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 0))
(format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 13))
  
