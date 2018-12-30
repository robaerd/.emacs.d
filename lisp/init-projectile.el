;; Package: projejctile
(get-package 'projectile)
  
  (projectile-global-mode)
  (setq projectile-enable-caching t)

  (define-key global-map [?\s-d] 'projectile-find-dir)
  (define-key global-map [?\s-f] 'projectile-find-file)
  (define-key global-map [?\s-g] 'projectile-grep)
  (define-key global-map [?\s-p] 'projectile-switch-project)

(provide 'init-projectile)