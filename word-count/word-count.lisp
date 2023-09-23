(defpackage :word-count
  (:use :cl)
  (:export :count-words))

(in-package :word-count)

(defun split (delimiter str)
  (let ((my-list '())
        (start 0)
        (end (- (length str) 1))
        (pos 0)
        (q ""))
    (loop while (< pos end) do
          (setq pos (position delimiter str :start start :end end))
          (setq pos (if (null pos)
                       (+ end 1)
                       pos))
          (setq q (subseq str start pos))
          (push q my-list)
          (setq start (+ pos 1)))
    my-list))

(defun update-list (key alist)
  (format t "Updating key~%")
  (let ((entry (assoc key alist :test #'equal)))
    (setf (cdr entry) (+ (cdr entry) 1)))
  alist)

(defun add-to-list (key alist)
  (setf alist (push (cons (string-downcase key) 1) alist))
  alist)

(defun key-exists (key alist)
  "Check if a key exists in an alist"
  (not (null (assoc (string-downcase key) alist :test #'equal))))

(defun get-list-invalid-chars ()
  '(#\! #\, #\. #\' #\ #\NewLine))

(defun get-list-count (str)
  (let ((words (split #\Space str))
        (alist '()))
    (loop for word in words do
            (setq alist (if (key-exists word alist)
                           (update-list word alist)
                           (add-to-list word alist))))
    alist))

(defun remove-char-from-string (or_ch or_str)
  (let ((str "")
        (char-position 0))
   (loop for ch across or_str do
         (when (char= or_ch ch)
               (setq char-position (position ch or_str))
           (if (not (char= #\Space (char or_str (1+ char-position))))
             (setq ch #\Space)
             (setq ch "")))
        (setq str (concatenate 'string str (string ch))))
   str))

(defun remove-invalid-chars(str)
  (loop for ch in (get-list-invalid-chars) do
        (setq str (remove-char-from-string ch str)))
  str)

(defun count-words (sentence)
  (get-list-count (remove-invalid-chars (string-downcase sentence))))
