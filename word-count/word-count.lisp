(defpackage :word-count
  (:use :cl)
  (:export :count-words))

(in-package :word-count)

(defvar *alist* '())

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

(defun update-list (key)
  (format t "Updating key~%")
  (let ((entry (assoc key *alist*)))
    (setf (cdr entry) (+ (cdr entry) 1))))

(defun add-to-list (key)
  (setf *alist* (push (cons (string-downcase key) 1) *alist*)))

(defun key-exists (key)
  "Check if a key exists in an alist"
  (not (null (assoc (intern (string-downcase key)) *alist*))))

(defun get-list-invalid-chars ()
  '(#\! #\, #\. #\' #\ ))

(defun get-list-count (str)
  (let ((words (split #\Space str)))
    (loop for word in words do
      (let ((clean-word (remove-invalid-chars word)))
        (if (string/= clean-word "")
            (if (key-exists clean-word)
                (update-list clean-word)
                (add-to-list clean-word)))))
    *alist*))

(defun remove-char-from-string (or-ch or-str)
  (let ((str ""))
    (loop for ch across or-str do
          (unless (char= or-ch ch)
            (setq str (concatenate 'string str (string ch)))))
    str))

(defun remove-invalid-chars(str)
  (loop for ch in (get-list-invalid-chars) do
        (setq str (remove-char-from-string ch str)))
  str)

(defun count-words (sentence)
  (get-list-count (string-downcase sentence)))

(defvar a '())
(defvar b '())

(defun maniac()
  (setq *alist* '())
  (setq a (split #\Space "hello my name koce name"))
  (format t "List: ~A~%" a)
  (loop for item in a do
        (format t "word: ~A~%" item)
        (if (assoc item *alist*)
            (progn
              (format t "WORKED~%")
              (update-list item))
            (progn
              (format t "FAILED~%")
              (add-to-list item)))
        (format t "*alist*: ~A~%" *alist*)))

(maniac)
