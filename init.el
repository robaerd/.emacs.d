
(setq debug-on-error t)


(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(setq custom-file (expand-file-name "custom.el" "~/.emacs.d/"))


(require 'init-load-path)
(require 'init-packages)
;(require 'init-exec-path) ;-doesnt really work right now

;;; curstom packages
(require 'init-swiper)