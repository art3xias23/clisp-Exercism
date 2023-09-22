(in-package :quant)
(ql:quickload 'cl-csv);; Change the below path to where you sae your utilities file:
(load "/mnt/c/Users/kmilchev/Exercism/common-lisp/word-count/test/utilities.lisp");; Change the below path to where you save your csv file:
(defparameter my-filename "/mnt/c/Users/kmilchev/Exercism/common-lisp/word-count/test/my-csv.csv")
(defparameter csv-file (cl-csv:read-csv (pathname my-filename)))
(defparameter my-sum (list-sum (list 1 2 3 4 5)))
