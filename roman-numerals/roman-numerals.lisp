(defpackage :roman-numerals
  (:use :cl)
  (:export :romanize))

(in-package :roman-numerals)

; (defun romanize (number)
;  "Returns the Roman numeral representation for a given number.")

(defvar my-dict '( 
                  '(#\M #\D #\C)
                  '(#\C #\L #\X)
                  '(#\X #\V #\I)))
                        
(defun repeat-letter (num letter)
  (make-string num :initial-element letter))

(defun get-number (num lst)
  (case num
    (1 (format nil (repeat-letter 1 (cdr (cdr lst)))))
    (2 (format nil (repeat-letter 2 (cdr (cdr lst)))))
    (3 (format nil (repeat-letter 3 (cdr (cdr lst)))))
    (4 (format nil "~A~A" (cdr (cdr lst)) (car (cdr lst))))
    (5 (format nil "~A" (car (cdr lst))))
    (6 (format nil "~A~A" (car (cdr lst)) (cdr (cdr lst))))
    (7 (format nil "~A~A~A" (car (cdr lst)) (cdr (cdr lst)) (cdr (cdr lst))))
    (8 (format nil "~A~A~A~A" (car (cdr lst)) (cdr (cdr lst)) (cdr (cdr lst)) (cdr (cdr lst))))
    (9 (format nil "~A~A" (cdr (cdr lst)) (car lst)))))


(defvar my-dict '( 
                  '(#\M #\D #\C)
                  '(#\C #\L #\X)
                  '(#\X #\V #\I)))

(defun get-di-item (num my-di)
  (case num
    (1 (car my-di))
    (2 (car (cdr my-di)))
    (3 (cdr (cdr my-di)))))

(get-di-item 3 my-dict)




  
