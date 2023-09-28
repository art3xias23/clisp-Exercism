(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun rebase (list-digits in-base out-base)
  (from-base-10-to-any (to-base-10 list-digits in-base) out-base))

(defun to-base-10 (list-digits in-base)
  (let ((final-number 0)
        (counter 0))
    (loop for num in (reverse list-digits) do
          (setq final-number (+ final-number (* num (expt in-base counter))))
          (setq counter (1+ counter)))
    final-number))

(defun from-base-10-to-any (decimal-number target-base)
  (let ((base-num-list '())
        (original-number decimal-number)
        (moded 0))
    (loop until (= 0 (floor original-number)) do
          (setq moded (mod original-number target-base))
          (setq original-number (floor (/ original-number target-base)))
          (setq base-num-list (cons moded base-num-list)))
    base-num-list))
