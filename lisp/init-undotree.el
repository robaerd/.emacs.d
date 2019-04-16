(use-package undo-tree
  :ensure t
  :init
  (setq undo-tree-visualizer-diff 1)
  (setq undo-tree-visualizer-timestamps 1)
  :config
  (global-undo-tree-mode 1))


;; make ctrl-z undo
(global-set-key (kbd "C-z") 'undo)
;; make ctrl-Z redo
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-S-z") 'redo)

(provide 'init-undotree)