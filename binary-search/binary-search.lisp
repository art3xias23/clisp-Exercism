(defpackage :binary-search
  (:use :cl)
  (:export :binary-find :value-error))

(in-package :binary-search)

(defun binary-find (arr el)
  (let 
      ((middle-pos (floor (/ (length arr) 2))) 
       (middle-num 0))
    (when (= (length arr) 0)
      (return-from binary-find NIL))
    (format t "Arr: ~A~%" arr)
    (format t "Middle Pos: ~D~%" middle-pos)
    (setq middle-num (aref arr middle-pos))
    (format t "Mid Num: ~D~%" middle-num)
    (cond
          ((= middle-num el) 
           (progn 
             (format t "Cond =, middle-pos = ~D~%" middle-pos)
             middle-pos))
          ((> middle-num el) 
           (let ((result (binary-find (subseq arr 0  middle-pos) el)))
             (if result
                 (progn
                   (format t "Cond >, result = ~D, middle-pos ~D~%" result middle-pos)
                   result)
                 NIL)))
          ((< middle-num el)
           (let ((result (binary-find (subseq arr (1+ middle-pos)) el)))
             (if result
                 (progn
                   (format t "Cond <, result = ~D middle-pos =~D~%" result middle-pos)
                   (+ (1+ result) middle-pos))))))))
