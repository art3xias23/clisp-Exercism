(defpackage :acronym
  (:use :cl)
  (:export :acronym))
           

(in-package :acronym)

(defun acronym (str)
  (reverse (make-capital-letters 
             (extract-first-letters 
               (split-string-into-list-on-delimiter #\Space  
                    (replace-char-in-string 
                      (replace-char-in-string str #\- " ") #\! ""))))))

(defun replace-char-in-string (str replaced replacer)
  (let ((final-string ""))
    (loop for char across str do
          (setq final-string (concatenate 'string final-string (if (char= char replaced) (string replacer) (string char)))))
    final-string))

(defun get-acronym (str)
  (let ((acronym ""))
    (loop for char across str do
          (setq acronym (concatenate 'string acronym (when (= 1 (position char str)) char))))))


(defun split-string-into-list-on-delimiter (delimiter str)
  (let ((my-list '())
        (word "")
        (cc 0))
    (loop for char across str do
          (when (= cc (- (length str) 1))
            (progn
              (setq word (concatenate 'string word (string char)))
              (setq my-list (cons word my-list))))
          (if (char= char delimiter)
              (progn
                (setq my-list (cons word my-list))
                (setq word ""))
            (setq word (concatenate 'string word (string char))))
          (setq cc (+ cc 1)))
    my-list))

(defun extract-first-letters (list)
  (let ((acronym ""))
    (loop for word in list do
          (setq acronym (concatenate 'string acronym (string (char word 0)))))
    acronym))

(defun make-capital-letters (str)
  (string-upcase str))
