
;(setq debug-on-error t)


(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(setq custom-file (expand-file-name "custom.el" "~/.emacs.d/"))


(require 'init-load-path)
(require 'init-packages)
(require 'init-exec-path)
(x-focus-frame nil) ; for emacs in terminal

(with-eval-after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var)))



;; few commands are bound to the counsel package
; if not installed, commands like find file or swiper will not work 
(get-package 'counsel)

;;; curstom packages
;----------------------------------------------------------------------------------------
;;other modes
(global-linum-mode t) ; linenumbers globally


;; some small features
(require 'init-google)
(require 'init-terminal)
(require 'init-sudo-edit)
(require 'init-words)
(require 'init-delete-current-buffer-file)


;;important features
(require 'init-swiper)
(require 'init-parentheses)
;(require 'init-mode-line) ; currently replaced by 'doom-modeline'

;;customization
(require 'init-doom-themes)
(require 'init-doom-modeline)

;----------------------------------------------------------------------------------------




; Global-indentation
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode t)

;;; Inhibit-startup
(setq-default inhibit-startup-screen t)