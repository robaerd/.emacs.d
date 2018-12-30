;;; Delete-current-buffer-file
(defun delete-current-buffer-file ()
"Removes file connected to current buffer and kills buffer."
(interactive)
(let ((filename (buffer-file-name))
      (buffer (current-buffer))
      (name (buffer-name)))
  (if (not (and filename (file-exists-p filename)))
      (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
	(delete-file filename)
	(kill-buffer buffer)
	(message "File '%s' successfully removed" filename)))))
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

(provide 'init-delete-current-buffer-file)