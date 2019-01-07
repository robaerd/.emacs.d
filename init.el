

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(setq debug-on-error t)


(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; set Super key to FN
(setq ns-function-modifier 'super)  ; make Fn key do Hyper


(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))

;;; default find file search path
;; currently reassignes in my custom.el
(setq default-directory "~/")


(require 'init-load-path)
(require 'init-packages)
(require 'init-exec-path)
;(x-focus-frame nil) ; for emacs in terminal ; breaks terminal emacs?!?!


(get-package 'use-package)
(require 'init-async)



;; few commands are bound to the counsel package
; if not installed, commands like find file or swiper will not work 
(get-package 'counsel)

;;; curstom packages
;----------------------------------------------------------------------------------------
;;other modes
(global-linum-mode t) ; linenumbers globally

;; PATHS
; path of haskell-stack
;replace with your current path
(add-to-list 'exec-path "/usr/local/Cellar/haskell-stack/1.9.3/bin/")

;;customization
(require 'init-doom-themes)
(require 'init-doom-modeline)

;;important features
(require 'init-swiper)
(require 'init-editing-visuals)
(require 'init-projectile) ; keybindings: S-(d | f | g | p)
(require 'init-zygospore) ; focuse on current buffer (delete all other) + revert with C-x 1
(require 'c-cpp-opjc-mode)
(require 'init-haskell-mode)
(require 'init-magit)
(require 'init-smartparens)
(require 'init-ibuffer)
(require 'init-windows)
(require 'init-helm)
(require 'init-avy)

;; some small features
(require 'init-google)
(require 'init-terminal)
(require 'init-sudo-edit)
(require 'init-words)
(require 'init-delete-current-buffer-file)
(require 'init-mode-line)







;----------------------------------------------------------------------------------------


;; Variables configured via the interactive 'customize' interface
(when (file-exists-p custom-file)
  (load custom-file))



; Global-indentation
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode t)

;; disable toolbar
(tool-bar-mode -1) 

;;; Inhibit-startup
(setq-default inhibit-startup-screen t)
