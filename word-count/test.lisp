(defpackage :torm
  (:use :cl))

(in-package :torm)

(ql:quickload "split-sequence"); Load the split sequence


(defvar *alist* '())
(setf *alist* '())

(defun update-list (key)
 (let ((entry (assoc (intern key) *alist*)))
  (setf (cdr entry) (+ (cdr entry) 1))))                

(defun add-to-list (key)
  (setf *alist* (push (cons (intern key) 1) *alist*)))

(defun key-exists (key)
  "Check if a key exists in an alist"
 (not (null (assoc (intern key) *alist*))))

(defun get-list-invalid-chars ()
  '( #\! #\, #\. #\' #\'))

(defun get-list-count (str)
 (let ((words (split-sequence:split-sequence #\Space str)))
  (loop for word in words do
        (format t "Word is: ~A~%" word)
   (if (key-exists word)
      (update-list word)
      (add-to-list word)))
  *alist*))

(defun remove-char-from-string (or_ch or_str)
  (let ((str ""))
   (loop for ch across or_str do
         (unless (char= or_ch ch)
           (setq str (concatenate 'string str (string ch)))))
   str))

(defun remove-invalid-chars(str)
          (loop for ch in (get-list-invalid-chars) do
                (print ch)
                (setq str (remove-char-from-string ch str)))
          str)
    
(defun count-words (sentence)
          (get-list-count (remove-invalid-chars (string-downcase sentence))))
