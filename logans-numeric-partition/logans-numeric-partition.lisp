(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)


(defun categorize-number (lst num)
  (if (oddp num)
      (cons (cons num (car lst)) (cdr lst))
      (cons (car lst) (cons num (cdr lst)))))


(defun partition-numbers (lst)
  (reduce #'categorize-number lst :initial-value '(() .()))) 

(partition-numbers '(1 2 3 4))
