(ql:quickload "split-sequence"); Load the split sequence

(defun count-words (sentence)
        (let ((updated-string ""))
          (loop for ch across (get-list-invalid-chars) do
                (setq updated-string (remove-char-from-string ch sentence)))
          (get-list-count updated-string)))
    
(defun get-list-count (updated-string)
 (let ((alist '()))
  (loop for word across (split-sequence:split-sequence #\Space updated-string) do
   (if (key-exists word)
      (update-list alist word)
      (add-to-list alist word)))))

(defun update-list (alist key)
 (let ((entry (assoc (intern key) alist)))
  (setf (cdr entry) (+ (cdr entry) 1))))                

(defun add-to-list (alist key)
  (push (cons (intern key) 0) alist))

(defun key-exists (key alist)
  "Check if a key exists in an alist"
 (not (null (assoc key alist))))

(defun remove-char-from-string (or_ch or_str)
  (let ((str ""))
   (loop for ch across or_str do
         (unless (char= or_ch ch)
           (setq str (concatenate 'string str (string ch)))))
   str))

(defun get-list-invalid-chars ()
  '( #\! #\, #\. #\'))

(count-words "Hello my name is Koce")
    
          
