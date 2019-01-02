(use-package avy
  :ensure t
  :bind (("M-s" . avy-goto-word-1))
  :config
  (avy-setup-default))

  (provide 'init-avy)