(defpackage :binary-search
  (:use :cl)
  (:export :binary-find :value-error))

(in-package :binary-search)

(defun binary-find (arr el)
  (let 
      ((middle-pos (floor (/ (length arr) 2))) 
       (middle-num 0))
    (format t "Middle Pos: ~D~%" middle-pos)
    (setq middle-num (aref arr middle-pos))
    (format t "Mid Num: ~D~%" middle-num)
    (format t "Arr: ~A~%" arr)
    (if (= (length arr) 0)
        NIL
        (cond
            ((= middle-num el) 
             (progn 
               (format t "got to middle pos")
               middle-pos))
            ((> middle-num el) 
             (let ((result (binary-find (subseq arr 0  middle-pos) el)))
               (if result
                   (+ (1+ result) middle-pos))))
            ((< middle-num el)
             (let ((result (binary-find (subseq arr (1+ middle-pos)) el)))
               (if result
                   (+ (1+ result) middle-pos))))))))

; (format t "pos: ~D~%" (binary-find #(6) 6))
; (format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 6))
 (format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 1))
;(format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 11))
; (format t "pos: ~D~%" (binary-find #(1 3 5 8 13 21 34 55 89 144 233 377 634) 144))
; (format t "pos: ~D~%" (binary-find #(1 3 5 8 13 21 34 55 89 144 233 377)))
; (format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 7))
; (format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 0))
; (format t "pos: ~D~%" (binary-find #(1 3 4 6 8 9 11) 13))
  
