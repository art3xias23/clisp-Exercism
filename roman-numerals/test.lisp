(defpackage :rn
  (:use :cl)
  (:export :romanise 
           :get-num-one
           :get-num-two
           :get-num-three
           :get-num-four
           :sets))

(in-package :rn)

(defun get-num-one (num)
  (case num
    (1 "I")
    (2 "II")
    (3 "III")
    (4 "IV")
    (5 "V")
    (6 "VI")
    (7 "VII")
    (8 "VIII")
    (9 "IX")
    (10 "X")))

(defun get-num-two (num)
  (case num
    (1 "X")
    (2 "XX")
    (3 "XXX")
    (4 "XL")
    (5 "L")
    (6 "LX")
    (7 "LXX")
    (8 "LXXX")
    (9 "XC")
    (10 "C")))

(defun get-num-three (num)
  (case num
    (1 "C")
    (2 "CC")
    (3 "CCC")
    (4 "CD")
    (5 "D")
    (6 "DC")
    (7 "DCC")
    (8 "DCCC")
    (9 "CM")
    (10 "M")))

(defun get-num-four (num)
  (case num
    (1 "M")
    (2 "MM")
    (3 "MMM")
    (4 "MMMM")))

(defun sets (orig apend)
  (setq orig (concatenate 'string apend orig)))

(defun romanise (num)
  (let ((str "")
        (counter 1))
    (loop for digit-char across  (format nil "~a" num) do
          (let ((digit (parse-integer (string digit-char))))
            (if (> digit 0)
                (case counter 
                  (1 (setq str (sets str (get-num-one digit))))
                  (2 (setq str (sets str (get-num-two digit))))
                  (3 (setq str (sets str (get-num-three digit))))
                  (4 (setq str (sets str (get-num-four digit)))))))
          (setq counter (+ counter 1)))
    str))
