(defpackage :etl
  (:use :cl)
  (:export :transform))

(in-package :etl)

(defun transform (data)
  "Transforms hash values into keys with their keys as their values."
  (let
      ((my-hash-table (make-hash-table)))
    (loop for key being the hash-keys in data do
          (format t "key: ~A~%" key)
          (let ((hash-item (gethash key data)))
            (format t "hash-item: ~A~%" hash-item)
            (loop for value in hash-item do
                       (format t "Looping for key: ~A, value: ~A~%" (car hash-item) value)
                       (setf (gethash (char (string-downcase value) 0) my-hash-table) key))))
    my-hash-table))
