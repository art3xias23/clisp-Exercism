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
  (let ((entry (assoc key alist :test #'equal)))
    (setf (cdr entry) (+ (cdr entry) 1)))
  alist)

(defun add-to-list (key alist)
  (if (and (not (string= "" key)) (not (string= " " key)))
   (setf alist (push (cons (string-trim " " (string-downcase key)) 1) alist)))
  alist)

(defun key-exists (key alist)
  "Check if a key exists in an alist"
  (not (null (assoc (string-downcase key) alist :test #'equal))))

(defun get-list-invalid-chars ()
  '(#\! #\, #\. #\' #\Newline #\& #\@ #\$ #\% #\^ #\& #\:))

(defun get-list-count (str)
  (let ((words (split #\Space str))
        (alist '()))
    (loop for word in words do
            (setq alist (if (key-exists word alist)
                           (update-list word alist)
                           (add-to-list word alist))))
    alist))

(defun remove-char-from-string (invalid-char orig-str)
    (format t "String now is: ~A~%" orig-str)
  (format t "Prev invalid char: ~A~%" invalid-char)
  (let ((str "")
        (char-position -1)
        (char-to-add ""))
   (loop for ch across orig-str do
         (setq char-to-add ch)
         (setq char-position (+ char-position 1))
        (if (not (char= invalid-char char-to-add))
            (setq str (concatenate 'string str (string char-to-add)))
            (progn
             (if (and (char= #\' (coerce char-to-add 'character)))
                 (progn
                   (format t "Addin: ~A~%" char-to-add)
                   (format t "Char pos: ~A" char-position)
                   (when (and 
                           (not (= char-position 0)) 
                           (not (= char-position (- (length orig-str) 1)))
                           (not (char= #\Space (char orig-str (- char-position 1))))
                           (not (char= #\Space (char orig-str (+ char-position 1)))))
                     (setq str (concatenate 'string str (string char-to-add)))))
                 (progn
                   (if (and (< char-position (- (length orig-str) 1)) (not (char= #\Space (char orig-str (1+ char-position)))))
                       (progn
                                       (setq char-to-add #\Space)
                                       (setq str (concatenate 'string str (string char-to-add))))))))))
   str))

(defun remove-invalid-chars(str)
  (loop for ch in (get-list-invalid-chars) do
        (setq str (remove-char-from-string ch str)))
  str)

(defun count-words (sentence)
  (get-list-count (remove-invalid-chars (string-downcase sentence))))

;(print (count-words "Joe can't tell between 'large' and large."))

