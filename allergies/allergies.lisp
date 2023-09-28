(defpackage :allergies
  (:use :cl)
  (:shadow :list)
  (:export :allergic-to-p :list))

(in-package :allergies)

(defun allergic-to-p (score allergen)
 (let ((allergen-list (list score)))
   (member allergen allergen-list :test #'string=)))
  

(defun list (score)
  (let ((my-allergen-list '())
        (num 0)
        (log2num 0))
    (setq num score)
    (loop 
     (if (<= num 0)
        (return  my-allergen-list)
        (progn
              (setq log2num (floor (get-log2-value num)))
              (format t "log2: ~D~%" log2num)
              (setq my-allergen-list (add-item-to-list (cdr (assoc log2num (get-allergy-list))) my-allergen-list))
              (setq num (- num (expt 2 log2num))))))))

(defun add-item-to-list (item lst)
  (when (not (null item))
    (let ((var "")
          (original-list lst))
      (setq var (member item original-list :test #'string=))
      (if (null var)
          (setq original-list (cons item original-list))
          (progn 
            (setq original-list (remove item original-list :test #'string=))
            (setq original-list (cons item original-list))))
      (format t "Final list: ~A~%" original-list)
      original-list)))

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

;(format t "A: ~A~%" (allergic-to-p 255 "cats"))
(list 509)
