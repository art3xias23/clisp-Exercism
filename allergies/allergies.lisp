(defpackage :allergies
  (:use :cl)
  (:shadow :list)
  (:export :allergic-to-p :list))

(in-package :allergies)

(defun allergic-to-p (score allergen)
  (not (null (member allergen (list score)))))
  

(defun list (score)
  (let ((my-allergen-list '())
        (num 0)
        (log2num 0))
    (setq num score)
    (loop 
     (if (<= num 0)
        (return my-allergen-list)
        (progn
              (setq log2num (floor (get-log2-value num)))
              (setq my-allergen-list (add-item-to-list (cdr (assoc log2num (get-allergy-list))) my-allergen-list))
              (setq num (- num (expt 2 log2num))))))))

(defun add-item-to-list (item list)
  (format t "Adding item: ~A~%" item)
  (when (and (not (null item)) (null (member item list)))
    (format t "Added item: ~A~%" item)
    (setq list (cons item list)))
  list)

(defun get-log2-value (initial-number)
  (/ (log initial-number) (log 2)))

(defun get-allergy-list() 
      '((0 . "eggs")
        (1 . "peanuts")
        (2 . "shellfish")
        (3 . "strawberries")
        (4 . "tomatoes")
        (5 . "chocolate")
        (6 . "pollen")
        (7 . "cats")
        (8 . "eggs")
        (9 . "eggs")
        (10 . "eggs")))

(format t "Answer: ~A~%" (list 257))

