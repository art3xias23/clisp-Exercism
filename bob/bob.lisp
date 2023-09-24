(defpackage :bob
  (:use :cl)
  (:export :response))
(in-package :bob)

(defun response (hey-bob)
  (cond
    ((is-string-empty-null-whitespace hey-bob) "Fine. Be that way!")
    ((is-exclamation-and-is-question hey-bob) "Calm down, I know what I'm doing!")
    ((is-exclamation hey-bob) "Whoa, chill out!")
    ((is-question hey-bob) "Sure.")
    (t "Whatever.")))
   
(defun is-exclamation-and-is-question (str)
  (and (is-question str) (is-exclamation str)))
  
  
(defun is-exclamation (str)
  (let 
      ((sentence (remove-if-not #'alpha-char-p  (subseq str 0 (- (length str) 1)))))
    (format t "Sentence is: ~A" sentence)
   (and (not (is-string-empty-null-whitespace sentence)) (every #'upper-case-p  sentence))))
    
    

(defun is-question (str)
  (let ((cleaned-sentence ""))
    (setq cleaned-sentence (string-trim " " str))
    (char= #\? (char cleaned-sentence (- (length cleaned-sentence) 1)))))

(defun is-string-empty-null-whitespace (str)
  (or (null str)
      (string= "" str)
      (string= (clean-string str) "")))

(defun clean-string (str)
  (let ((unwanted-char-list '(#\Linefeed #\Newline #\Space #\Tab))
        (new-string ""))
      (loop for ch across str do
                (unless (member  ch unwanted-char-list)
                  (setq new-string (concatenate 'string new-string (string ch)))))
    new-string))
; (is-question "WATCH OUT!")
; (is-exclamation "WATCH OUT!")
; (is-exclamation-and-is-question "WATCH OUT!")
;(clean-string  "										") 



