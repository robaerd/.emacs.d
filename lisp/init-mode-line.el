(column-number-mode t) ; Show column number in mode-line.

;;; Battery
(display-battery-mode t)
;; Do not raise error if battery is removed.
(ignore-errors (display-battery-mode t))

;;; Buffer-size
;; Show buffer size in mode-line.
(size-indication-mode t)

;;; Percentage-buffer
(defun goto-percent (pct)
"Go to place in a buffer expressed in percentage."
(interactive "nPercent: ")
(goto-char (/ (* (point-max) pct) 100)))
(global-set-key (kbd "C-x p") 'goto-percent)


(provide 'init-mode-line)