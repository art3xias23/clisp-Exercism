(defpackage :beer-song
  (:use :cl)
  (:export :verse :sing))

(in-package :beer-song)

(defun verse (n)
  "Returns a string verse for a given number."
  (format nil "~a~a" (get-first-verse n) (get-second-verse n)))

(defun get-first-verse (num)
  (format nil "~a of beer on the wall, ~a of beer.~&" (get-bottles-string num) (string-downcase (get-bottles-string num))))

(defun get-second-verse (num)
  (case num
    ((0) (format nil "Go to the store and buy some more, 99 bottles of beer on the wall.~&"))
    ((1) (format nil "Take it down and pass it around, no more bottles of beer on the wall.~&"))
    (t (format nil "Take one down and pass it around, ~a of beer on the wall.~&" (get-bottles-string (- num 1))))))

(defun get-bottles-string(num) "Returns the correct singular or plural for beers"
  (case num
    ((0) "No more bottles")
    ((1) "1 bottle")
    (t (format nil "~a bottles" num))))

 

(defun sing (start &optional (end 0))
  "Returns a string of verses for a given range of numbers."
  (let (( str ""))
    (loop for i downfrom start to end
        do (case i
             ((0) (setq str (concatenate 'string str (format nil  "~a~%" (verse i)))))
             (t (setq str (concatenate 'string str (format nil "~a~%" (verse i))))))
        finally
        (return str))))
