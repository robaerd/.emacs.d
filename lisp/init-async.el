;;; module for doing asynchronous processing in Emacs
(get-package 'async)

(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)

(async-bytecomp-package-mode 1)

(provide 'init-async)