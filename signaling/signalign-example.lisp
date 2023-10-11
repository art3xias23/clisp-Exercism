(defpackage :signaling-example
  (:use :cl))

(in-package :signaling-example)

; Define the condition class
(defclass zero-division-error (error)
  ((message :initarg :message :reader message)))

(defun signal-zero-division-error()
    (signal (make-instance 'zero-division-error :message "This is a zero division error")))

(defun handle-zero-division-error(condition)
    (format t "An error occured: ~a~%" (message condition)))

(defun signal-and-handle-zero-divison-error ()
  (handler-bind ((zero-division-error #'handle-zero-division-error))
    (signal-zero-division-error)))

(defun try-again()
    (format t "Trying again...~%"))

(defun signal-error-and-establish-restart()
    (restart-bind ((try-again #'try-again))
      (signal (make-instance 'zero-division-error :message "This is an error"))))

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
