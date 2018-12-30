;; turn on word wrap
; auto inserts newline in comments
(auto-fill-mode t)  

;;; Word-count
;; Pluralize
(defun pluralize (word count &optional plural)
  "Pluralize the word."
  (if (= count 1)
      word
      (if (null plural)
	  (concat word "s")
	  plural)))

;; Count total number of words in current buffer
(defun count-words-buffer ()
  "Count total number of words in current buffer."
  (interactive)
  (let ((count 0))
    (save-excursion
      (goto-char (point-min))
      (while (< (point) (point-max))
	(forward-word 1)
	(setq count (1+ count)))
      (if (zerop count)
	  (message "buffer has no words.")
	(message "buffer approximately has %d %s." count 
		 (pluralize "word" count))))))
(global-set-key (kbd "C-x c") 'count-words-buffer)

(provide 'init-words)