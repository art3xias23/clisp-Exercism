(defun split-string-into-list-on-delimiter (delimiter str)
  (let ((my-list '())
        (word "")
        (cc 0))
    (loop for char across str do
          (when (= cc (- (length str) 1))
            (progn
              (setq word (concatenate 'string word (string char)))
              (setq my-list (cons word my-list))))
          (if (char= char delimiter)
              (progn
                (setq my-list (cons word my-list))
                (setq word ""))
            (setq word (concatenate 'string word (string char))))
          (setq cc (+ cc 1)))
    my-list))
