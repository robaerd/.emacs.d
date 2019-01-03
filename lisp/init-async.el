;;; module for doing asynchronous processing in Emacs
;(get-package 'async)
;(require 'async)
;(autoload 'dired-async-mode "dired-async.el" nil t)
(use-package async
	:ensure t
	:config
	(dired-async-mode 1)
	(async-bytecomp-package-mode 1)
	)


(provide 'init-async)