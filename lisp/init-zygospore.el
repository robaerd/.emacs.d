;; Package zygospore
; lets you revert C-x 1 (delete-other-window) by pressing C-x 1 again
(get-package 'zygospore)

(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

(provide 'init-zygospore)