(defpackage :gigasecond-anniversary
  (:use :cl)
  (:export :from))
(in-package :gigasecond-anniversary)

(defun from (y m d h mn sc) (multiple-value-bind (seconds minute hour date month year day DTS timezone)
                                (decode-universal-time (+  (encode-universal-time sc mn h d m y) 1000000000))
                              (list year month date hour minute seconds)))

