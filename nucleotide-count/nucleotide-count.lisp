(defpackage :nucleotide-count
  (:use :cl)
  (:export :dna-count :nucleotide-counts :invalid-nucleotide))

(in-package :nucleotide-count)

(defun dna-count (nucleotide strand)
  "Returns a count of the given nucleotide appearing in a DNA strand."
  (reduce (lambda (cc ch)
              (if (char= ch nucleotide)
                  (setq cc (1+ cc))
                  cc)) strand :initial-value 0)
  

 (defun nucleotide-counts (strand)
   "Returns a hash of nucleotides and their counts in a given DNA strand."))
  
