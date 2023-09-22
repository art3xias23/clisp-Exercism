(defpackage :lib
  (:use :cl)
  (:export :calc))

(defpackage :main
  (:use :cl :lib))

(in-package :main)

(load "/mnt/c/Users/kmilchev/Exercism/common-lisp/word-count/test/lib.lisp")

(calc 2 3)
