(unless (file-directory-p "~/.emacs.d/spotify")
	(make-directory "~/.emacs.d/spotify")
    (magit-clone "https://github.com/danielfm/spotify.el" "~/.emacs.d/spotify"))



(add-to-list 'load-path "~/.emacs.d/spotify")
(require 'spotify)

;;------------------------------------------------------------
(require 'config-spotify)
;; create file which provides config-spotify containing followin lines:
; (setq spotify-oauth2-client-secret "<secret>")
; (setq spotify-oauth2-client-id "<id>")

;;; instructions on https://github.com/danielfm/spotify.el
;;------------------------------------------------------------


(setq spotify-mode-line-refresh-interval 1) ;updates mode every second

;; Do not use values larger than 50 for better compatibility across endpoints
(setq spotify-api-search-limit 50)

(setq spotify-mode-line-paused-text "PS")
(setq spotify-mode-line-playing-text "PL")
(setq spotify-mode-line-truncate-length 12) ; default: 15

(global-spotify-remote-mode t)

(provide 'init-spotify)