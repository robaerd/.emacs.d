(get-package 'exec-path-from-shell)

(with-eval-after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var)))


(setq exec-path-from-shell-check-startup-files t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))



(provide 'init-exec-path)