(defpackage :character-study
  (:use :cl)
  (:export
   :compare-chars
   :size-of-char
   :change-size-of-char
   :type-of-char))
(in-package :character-study)

(defun compare-chars (char1 char2)
  (cond
    ((char-equal char1 char2) :equal-to)
    ((char-greaterp char1 char2) :greater-than)
    ((char-lessp char1 char2) :less-than)
    (t nil)))

(defun size-of-char (chara)
  (cond
    ((upper-case-p chara) :big)
    ((lower-case-p chara) :small)
    (t :no-size)))

(defun change-size-of-char (chara wanted-size)
  (cond
    ((eq wanted-size :big) (char-upcase chara))
    ((eq wanted-size :small) (char-downcase chara))
    (t nil)))

(defun type-of-char (chara)
  (cond
    ((alpha-char-p chara) :alpha)
    ((digit-char-p chara) :numeric)
    ((char-equal #\SPACE chara) :space)
    ((char-equal #\NEWLINE chara) :newline)
    (t :unknown)))

(type-of-char #\NEWLINE)


