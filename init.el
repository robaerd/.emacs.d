
;;; Google
(defun google ()
 "Google the selected region if any, display a query prompt otherwise."
 (interactive)
 (browse-url
  (concat
   "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
   (url-hexify-string (if mark-active
			  (buffer-substring (region-beginning) (region-end))
			  (read-string "Search Google: "))))))
(global-set-key (kbd "C-x g") 'google)

;;; Org-syntax-highlighting
;; Org-mode source syntax highlighting
;; http://praveen.kumar.in/2012/03/10/org-mode-latex-and-minted-syntax-highlighting/
;; Requires 'minted.sty' in PATH.
;; Download minted: http://www.ctan.org/tex-archive/macros/latex/contrib/minted
;; and run 'make' to generate 'minted.sty'.

;; Note: This code depends on org-latex

;(require 'org-latex)
;(setq org-export-latex-listings 'minted)
;(add-to-list 'org-export-latex-packages-alist '("" "minted"))
;(setq org-src-fontify-natively t)

;; extending support for other languages so that we can execute them
;; in org mode.
;; http://www.johndcook.com/blog/2012/02/09/python-org-mode/
;; Add more extensions below.
;(org-babel-do-load-languages
;    'org-babel-load-languages '((python . t) 
;				(R . t)
;				(sh . t)
;				(emacs-lisp . t)
;				(clojure . t)
;				(C . t)))

;;; Terminal
;; Terminal at your fingerprint
(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))
(global-set-key (kbd "C-c t") 'visit-term-buffer)

;;; Show-paren
(show-paren-mode t)

;;; Package
;; Note: This configuration may not work with old versions of Emacs.
;; Marmalade repo
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Melpa repo
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;; Column-number
;; Show column number in mode-line.
(column-number-mode t)

;;; Org-workflow
(setq org-todo-keywords
    '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;;; Sudo-edit
(defun sudo-edit (&optional arg)
"Edit currently visited file as root.
With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(global-set-key (kbd "C-x C-r") 'sudo-edit)

;;; Inhibit-startup
(setq-default inhibit-startup-screen t)

;;; Word-wrap
;; turn on word wrap
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

;;; Highlight-annotations
(defun font-lock-comment-annotations ()
"Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for
programming."
  (font-lock-add-keywords
   nil '(("\<\(FIX\(ME\)?\|TODO\|OPTIMIZE\|HACK\|REFACTOR\):"
          1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

;;; Battery
(display-battery-mode t)
;; Do not raise error if battery is removed.
(ignore-errors (display-battery-mode t))

;;; Buffer-size
;; Show buffer size in mode-line.
(size-indication-mode t)

;;; Elisp-doc
;; show elisp function docs in result bar
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;; Percentage-buffer
(defun goto-percent (pct)
"Go to place in a buffer expressed in percentage."
(interactive "nPercent: ")
(goto-char (/ (* (point-max) pct) 100)))
(global-set-key (kbd "C-x p") 'goto-percent)

;;; Hide/Show-dot-files
;; Hide DOT files with M-o
(require 'dired-x)
;; Buffer-local variable
(setq-default dired-omit-files-p t)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))
(global-set-key (kbd "M-o") 'dired-omit-mode)

;;; Global-indentation
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode t)

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

;;; org-to-odt
(if (file-exists-p "/usr/bin/soffice")
    (setq org-export-odt-convert-processes
          "/usr/bin/soffice --headless --convert-to %f%x --outdir %d %i"
          org-export-odt-preferred-output-format "odt"
          org-export-odt-convert-process "/usr/bin/soffice")
  (message "SOFFICE path not found"))


;;; Manage-window-size
(global-set-key (kbd "<C-up>") 'enlarge-window)
(global-set-key (kbd "<C-down>") 'shrink-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

