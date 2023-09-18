(defpackage :rn
  (:use :cl)
  (:export :romanise :get-num :get-string-num
           :sets))

(in-package :rn)

(defun get-num-one (num)
  (case num
    (1 'I)
    (2 'II)
    (3 'III)
    (4 'IV)
    (5 'V)
    (6 'VI)
    (7 'VII)
    (8 'VIII)
    (9 'IX)
    (10 'X)))

(defun get-num-two (num)
  (case num
    (1 'X)
    (2 'XX)
    (3 'XXX)
    (4 'XL)
    (5 'L)
    (6 'LX)
    (7 'LXX)
    (8 'LXXX)
    (9 'XC)
    (10 'C)))

(defun romanise (num)
  (rn:get-num num))

(rn:romanise 9)

(defun get-string-num (num)
    (let ((my-list '()))
      (loop for digit across (format nil "~a" num)
            do (push digit my-list))
      (format nil "~{~a~}" (reverse my-list))))

; (defun romanise (num)
;   (let (
;         (my-string "")
;         (counter 0))
;     (for n across (reverse (format nil "~a" num)))))
         

(defun sets (orig apend)
  (setq orig (concatenate orig apend)))

;get number
;have a count
;have a list

;loop through each number in reverse order
;get roman number and append to list

(sets "original" "new")
