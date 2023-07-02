(defpackage :larrys-winning-checker
  (:use :cl)
  (:export
   :make-empty-board
   :make-board-from-list
   :all-the-same-p
   :row
   :column))

(in-package :larrys-winning-checker)

(defun make-empty-board ()
  (make-array '(3 3) :initial-element nil))

(defun make-board-from-list (l)
  (make-array (list (length l) (length (car l))) :initial-contents l))

(defun all-the-same-p (row-or-col)
  (let ((first-element (aref row-or-col 0)))
    (loop for i from 1 below (length row-or-col)
        do (format t "~a ~a~%" first-element (aref row-or-col i))
          unless (eql first-element (aref row-or-col i))
                 do (return nil)
                 do( return t))))

(defun row (board row-num)
 (coerce 
  (loop for col-num below (array-dimension board 1)
         collect (aref board  row-num col-num))
  'vector))
  
        

(defun column (board col-num)
  (coerce (loop for row-num from 0 below (array-dimension board 0)
                                       collect (aref board row-num col-num))
          'vector))
     


(column (make-array '(3 3) :initial-contents '((x o x) (o x o) (x x o))) 2)
;(column (make-array '(3 3) :initial-contents '((1 2 3) (4 5 6) (7 8 9))) 1)

;(loop for i from 1 below 3
;      collect i))

;(make-array '(3 3) :initial-contents '((1 2 3) (4 5 6) (7 8 9))) 


