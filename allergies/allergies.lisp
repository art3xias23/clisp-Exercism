(defpackage :allergies
  (:use :cl)
  (:shadow :list)
  (:export :allergic-to-p :list))

(in-package :allergies)

(defun allergic-to-p (score allergen)
  "Returns true if given allergy score includes given allergen.")
  

(defun list (score)
  (let ((my-allergen-list '())
        (num score)
        (item ""))
    (if (or (<= num 1) (>= num 255))
        (progn
          (setq my-allergen-list (cons "eggs" my-allergen-list)))
        (progn
          ())))
  "Returns a list of allergens for a given allergy score.")

(defun log2-value (initial-number)
  ((/ (log initial-number) (log 2))))

(setq allergy-list 
      '((1 . "eggs")
        (2 . "peanuts")
        (4 . "shellfish")
        (8 . "strawberries")
        (16 . "tomatoes")
        (32 . "chocolate")
        (64 . "pollen")
        (128 . "cats")))


