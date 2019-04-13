

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(setq debug-on-error t)


(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;; in case of german keyboard layout
(if (eq system-type 'darwin)
  (progn
    ;; "fix" the broken keyboard
    (global-set-key "\M-l" '(lambda () (interactive) (insert "@")))
    (global-set-key "\M-5" '(lambda () (interactive) (insert "[")))
    (global-set-key "\M-6" '(lambda () (interactive) (insert "]")))
    (global-set-key "\M-7" '(lambda () (interactive) (insert "|")))
    (global-set-key "\M-/" '(lambda () (interactive) (insert "\\")))
    (global-set-key "\M-8" '(lambda () (interactive) (insert "{")))
    (global-set-key "\M-9" '(lambda () (interactive) (insert "}")))
    (global-set-key "\C-^" '(lambda () (interactive) (insert "~")))
    (global-set-key "\M-n" '(lambda () (interactive) (insert "~")))))

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
;(require 'benchmark) ;; for benchmarking package initialization time
(require 'init-async)


;; few commands are bound to the counsel package - e.g. find-file..
(get-package 'counsel)

;;; curstom packages
;----------------------------------------------------------------------------------------
;;other modes
(global-linum-mode t) ; linenumbers globally


(defvar pandoc-path "pandoc")

(setq auto-window-vscroll nil) ;; a try to improve cursor performance

;;customization

(require 'init-doom-themes)
(require 'init-doom-modeline)

;; language modes
(require 'init-markdown-mode)

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
;(require 'init-helm)
(require 'init-avy)
(require 'init-aggressive-indent)

;; some small features
;(require 'init-dashboard)
(require 'init-dashboard)
(require 'init-google)
(require 'init-terminal)
(require 'init-sudo-edit)
(require 'init-words)
(require 'init-delete-current-buffer-file)
(require 'init-mode-line)
(require 'init-undotree)
(require 'init-move-text)







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
