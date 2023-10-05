(defpackage :isogram
  (:use :cl)
  (:export :isogram-p))

(in-package :isogram)

(defun isogram-p (string)
  "Is string an Isogram?"
        (let ((my-hash-table (make-hash-table))
              (str (replace (replace string "-") " ")))
          (loop for ch across str do
                (let ((letter (gethash ch my-hash-table)))
                  (if letter
                      (return-from isogram-p NIL)
                      (setf (gethash ch my-hash-table) 1)))))
  T)
                    
                  
