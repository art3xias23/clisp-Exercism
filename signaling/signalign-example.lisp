(defpackage :signaling-example
  (:use :cl))

(in-package :signaling-example)

;=================SIGNAL CONDITION=======================

; Define the CONDITION class, which should inherit from the error class
(defclass zero-division-error (error)
  ((message :initarg :message :reader message)))

(CLOS:VATE-SUPERCLASS zero-division-error error)
; Function which should signal an instance of the zero-division-error class
(defun signal-zero-division-error ()
    (signal (make-instance 'zero-division-error :message "This is a zero division error")))

;==================================

;===============HANDLING A CONDITION===================

; Takes a zero-division-error condition object and prints a message to the
; console
(defun handle-zero-division-error (condition)
    (format t "An error occured: ~a~%" (message condition)))

;Establishes handle-zero-division-error function as a handler for
;zero-division-error condition and then signals zero-division-error condition
(defun signal-and-handle-zero-divison-error ()
  (handler-bind ((zero-division-error #'handle-zero-division-error))
    (signal-zero-division-error)))

;==================================

;=============== ESTABLISHING A RESTART===============
(defun try-again()
    (format t "Trying again...~%"))

; Establishes the try-again function as a restart and then signals a
; zero-division-error condition
(defun signal-error-and-establish-restart()
    (restart-bind ((try-again #'try-again))
      (signal (make-instance 'zero-division-error :message "This is an error"))))
;==================================
(defun divide-and-handle-errors (numerator denominator)
  (handler-case 
   (/ numerator denominator)
   (zero-division-error (e)
     (format t "Caught divison by zero error ~a~%" (message e))
     nil)))

;; Example usage
(defun example-usage ()
  (let ((result (divide-and-handle-errors 10 0)))
    (if result
        (format t "Result: ~a~%" result)
        (format t "Error occurred. Unable to calculate result.~%"))))

;; Call the example-usage function
(example-usage)
