(defpackage :anagram
  (:use :cl)
  (:export :anagrams-for))

(in-package :anagram)

(defun anagrams-for (subject candidates)
  (let ((retList '()))
    (loop for item in candidates
          do(if (same-number-of-chars subject item)
                (if (not (same-words subject item))
                    (if (and (words-have-same-letters subject item) (words-have-same-letters item subject))
                       (setq retList (append retList (list item)))))))
    (if (eql (length retList) 0)
      nil
      retList)))
  
  
(defun same-number-of-chars (word1 word2)
  (eql (length word1) (length word2)))

(defun same-words (word1 word2)
  (equalp word1 word2))

; (defun words-have-same-letters2 (word1 word2)
;  (loop for i from 0 below (length word1)
;        do (unless (word-contains-char word2 (char word1 i))
;             (return nil))
;        finally (return t)))

(defun words-have-same-letters (word1 word2)
  (if (= (length word1) 0)
      t
    (if (word-contains-char word2 (char word1 0))
        (words-have-same-letters (remove-letter-from-word word1 (char word1 0)) (remove-letter-from-word word2 (char word1 0)))
        nil)))

(defun word-contains-char (word ch)
  (not (null (position (char-upcase ch) (string-upcase word)))))

(defun remove-letter-from-word (word ch)
  (loop for i from 0 below (length word)
        do (if (equalp (char-upcase ch) (char-upcase (char word i)))
               (if (= i 0)
                   (return-from remove-letter-from-word (subseq word 1))
                   (return-from remove-letter-from-word (concatenate 'string (subseq word 0 i) (subseq word (+ i 1))))))))
