(get-package 'aggressive-indent)

(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

;; turned on for every language except html
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; disable annoying jump lines jump around in c++-mode
(add-to-list
 'aggressive-indent-dont-indent-if
 '(and (derived-mode-p 'c-mode)
       (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                           (thing-at-point 'line)))))

(add-to-list
 'aggressive-indent-dont-indent-if
 '(and (derived-mode-p 'c++-mode)
       (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                           (thing-at-point 'line)))))

(provide 'init-aggressive-indent)