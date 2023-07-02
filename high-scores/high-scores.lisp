(defpackage :high-scores
  (:use :cl)
  (:export :make-high-scores-table :add-player
           :set-score :get-score :remove-player))

(in-package :high-scores)

(defun make-high-scores-table()
    (make-hash-table))

(defun add-player (table name)
  (setf (gethash name table) 0))

(defun set-score (table name score)
  (setf (gethash name table) score))

(defun get-score (table name)
  (if (null (gethash name table)) 0
      (gethash name table)))

(defun remove-player (table name)
  (if (null (gethash name table)) nil
      (remhash name table)))

(let ((table (make-high-scores-table)))
  (gethash :lewis table))

(get-score (make-hash-table) :lewsi)
       
