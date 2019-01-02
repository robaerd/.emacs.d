(use-package avy
  :ensure t
  :bind ()
  :config(progn
	;; Makes it easier to see the candidates
	(setq avy-background t)
	;; Shows both the candidates over the text
	(setq avy-styles-alist '((avy-goto-char-2 . at-full))))
	:bind (;; Search by 2 chars
	("C-'" . avy-goto-char-2)
	;; Search by first char of a word
	("C-\"" . avy-goto-word-1)
	("M-s" . avy-goto-word-1)))

  (provide 'init-avy)