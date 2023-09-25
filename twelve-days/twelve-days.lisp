(defpackage :twelve-days
  (:use :cl)
  (:export :recite))

(in-package :twelve-days)

(defun recite (&optional begin end)
 "Returns a string of the requested verses for the 12 Days of Christmas."
  (let ((final-sentence "")
        (final-begin 0)
        (final-end 0))
    (if (and (null begin) (null end))
        (progn
          (setq final-begin 1)
          (setq final-end 12))
        (progn
          (setq final-begin (if (null begin) 1 begin))
          (setq final-end (if (null end) final-begin end))))
          
    (loop for i from final-begin to final-end do
          (if (= i final-end)
              (setq final-sentence (concatenate 'string final-sentence (format NIL "~A~A" (get-first-sentence i) (get-second-sentences i 1))))
              (setq final-sentence (concatenate 'string final-sentence (format NIL "~A~A~%" (get-first-sentence i) (get-second-sentences i 1))))))
    final-sentence))
    

(defun get-word-string (num)
  (case num
    (1 "first")
    (2 "second")
    (3 "third")
    (4 "fourth")
    (5 "fifth")
    (6 "sixth")
    (7 "seventh")
    (8 "eighth")
    (9 "ninth")
    (10 "tenth")
    (11 "eleventh")
    (12 "twelfth")))

  
(defun get-sentence-string(num)
  (case num
    (1 "a Partridge in a Pear Tree.")
    (2 "two Turtle Doves")
    (3 "three French Hens")
    (4 "four Calling Birds")
    (5 "five Gold Rings")
    (6 "six Geese-a-Laying")
    (7 "seven Swans-a-Swimming")
    (8 "eight Maids-a-Milking")
    (9 "nine Ladies Dancing")
    (10 "ten Lords-a-Leaping")
    (11 "eleven Pipers Piping")
    (12 "twelve Drummers Drumming")))

(defun get-second-sentences (start end)
  (let ((sentence ""))
    (loop for i from start downto end do
           (if (and (= i start))
               (setq sentence (concatenate 'string sentence (get-sentence-string i)))
               (progn
                 (if (= i 1)
                     (setq sentence (concatenate 'string sentence (format NIL ", and ~A" (get-sentence-string i))))
                    (setq sentence (concatenate 'string sentence (format NIL ", ~A" (get-sentence-string i))))))))
          
    sentence))

(defun get-first-sentence (num)
    (format NIL "On the ~A day of Christmas my true love gave to me: " (get-word-string num)))

(format t "~A" (recite 1 12))
