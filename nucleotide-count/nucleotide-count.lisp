(defpackage :nucleotide-count
  (:use :cl)
  (:export :dna-count :nucleotide-counts :invalid-nucleotide))

(in-package :nucleotide-count)

(defun dna-count (nucleotide strand)
  "Returns a count of the given nucleotide appearing in a DNA strand."
  (when (notany (lambda (c) (char= c nucleotide)) '(#\A #\C #\G #\T))
    (signal 'nucleotide-count:invalid-nucleotide))
  (reduce (lambda (cc ch)
              (if (char= ch nucleotide)
                  (setq cc (1+ cc))
                  cc)) strand :initial-value 0))
  
(define-condition nucleotide-count:invalid-nucleotide (error)
  ((message :initarg :message :reader message)))

(defun nucleotide-counts (strand)
  (when (string= strand "")
    (return-from nucleotide-counts (get-default-hash-table)))
  (let ((my-hash-table (get-default-hash-table)))
    (map nil (lambda (ch)
               (if (gethash ch my-hash-table)
                   (incf (gethash ch my-hash-table))
                   (setf (gethash ch my-hash-table) 1))) strand)
    my-hash-table))

(defun print-hash-table (my-hash-table)
  "Returns a hash of nucleotides and their counts in a given DNA strand."
  (format t "Printing my hash table~%")
  (loop for key being each hash-key in my-hash-table do
        (format t "Key: ~A, Value: ~A~%" key (gethash key my-hash-table))))

(defun get-default-hash-table ()
  (let
      ((my-hash-table (make-hash-table)))
    (loop for ch in '(#\A #\T #\C #\G) do
         (setf (gethash ch my-hash-table) 0))
    my-hash-table))

(print-hash-table (nucleotide-counts "GGGGGG"))

  
