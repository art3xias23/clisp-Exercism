(defpackage :acronym
  (:use :cl)
  (:export :acronym))

(in-package :acronym)

(defun acronym (str)
  (make-capital-letters 
    (extract-first-letters 
      (split-string-into-list-on-delimiter " "  
           (replace-char-in-string 
             (replace-char-in-string str #\- " ") #\! "")))))

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
        (start 0)
        (end (length str))
        (pos 0)
        (q ""))
    (loop while (< start end) do
          (setq pos (position delimiter str :start start))
          (setq pos (if (null pos)
                       end
                       pos))
          (setq q (subseq str start pos))
          (push q my-list)
          (setq start (+ pos 1)))
    (reverse my-list)))

(defun extract-first-letters (list)
  (let ((acronym ""))
    (format t "List is: ~A~%" list)
    (format t "Length of list is: ~A~%" (length list))
    (loop for word in list do
          (format t "Adding char ~c~%" (char word 0))
          (setq acronym (concatenate 'string acronym (string (char word 0)))))
    (format t "ACRONYM IS ~A~%" acronym)
    acronym))

(defun make-capital-letters (str)
  (string-upcase str))

; (format t "~A" (acronym "hello my friend"))
(format t "Count: ~D" (length (split-string-into-list-on-delimiter " " "Hello koce is my name")))


  
