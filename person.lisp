(defclass person()
  ((name 
     :initarg :name
     :accessor name)
   (lisper 
     :initform nil
     :accessor lisper)))

;; => #<STANDARD-CLASS PERSON>

(defvar p1 (make-instance 'person :name "Kocka"))
;;                                 ^^^^ initarg
;; => #<PERSON {1006234593}>

(name p1)
(lisper p1)
