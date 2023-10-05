(defpackage :isogram
  (:use :cl)
  (:export :isogram-p))

(in-package :isogram)

(defun isogram-p (strng)
  "Is string an Isogram?"
        (let ((my-hash-table (make-hash-table))
              (str (remove #\-
                     (remove #\Space 
                       (string-downcase strng)))))
          (loop for ch across str do
                (let ((letter (gethash ch my-hash-table)))
                  (if letter
                      (progn
                        (return-from isogram-p NIL))
                      (setf (gethash ch my-hash-table) 1)))))
  T)

