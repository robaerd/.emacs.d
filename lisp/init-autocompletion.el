;; company mode
;(get-package 'company-mode)
(get-package 'company-c-headers)
(require 'company)

(add-hook 'after-init-hook 'global-company-mode) ; enable in all buffers
(add-to-list 'company-backends 'company-c-headers) ; currently just using c header backend

;; completion using clang
;(setq company-backends (delete 'company-semantic company-backends))
;(define-key c-mode-map  [(tab)] 'company-complete)
;(define-key c++-mode-map  [(tab)] 'company-complete)

(provide 'init-autocompletion)