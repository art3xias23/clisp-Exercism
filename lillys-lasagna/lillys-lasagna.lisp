(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

(defun expected-time-in-oven () "return the expected time of a lasagna in oven" 337)

(defun remaining-minutes-in-oven (minutesInOven) "returns the remaining minutes in oven" (- (expected-time-in-oven)  minutesInOven))
 

(defun preparation-time-in-minutes (layers) "returns the expected preparation time based on the number of layers" (* layers 19))

(defun elapsed-time-in-minutes (layers time_spent_in_oven) "Calculates the full time lily has spent on the lasagna" (+ (preparation-time-in-minutes layers) time_spent_in_oven))
