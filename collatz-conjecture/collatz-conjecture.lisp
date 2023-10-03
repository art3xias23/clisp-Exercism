(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  (format t "Num is: ~D~%" n)
  (if (null n)
      (return-from collatz NIL))
  (when (= n 1)
    (return-from collatz 0))
  (if (= (mod n 2) 0)
    (1+ (collatz (/ n 2)))
    (1+ (collatz (1+ (* 3 n))))))

(format t "endresult is: ~D~%" (collatz 12))
