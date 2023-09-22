(defpackage :word-count
  (:use :cl)
  (:export :count-words))

(in-package :word-count)


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
 (let ((words (split #\Space str)))
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

(defun split (delimiter str)
  (let ((my-list '())
        (start 0)
        (end (- (length str) 1))
        (pos 0)
        (q ""))
    (loop while (<= start end) do
          (setq pos (position  delimiter str :start start :end end))
          (setq pos (if (null pos)
                       end 
                     pos))
          (setq q (subseq str start end))
          (format t "pushing ~A~%" q)
          (push q my-list)
          (setq start (+ pos 1))
          (format t "List: ~A~%" my-list)
          (format t "start ~A~%" start)
          (format t "end ~A~%" end))
   my-list)

 (print (split #\Space "hello my name koce")))
