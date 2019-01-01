;; Smartparens is a minor mode for dealing with pairs in Emacs.
; It can automatically insert pairs, wrap, unwrap and rewrap pairs,
; expand and contract pairs, navigate pairs,...

;;Autor: https://github.com/oantolin
(get-package 'smartparens)

(use-package smartparens
  :diminish smartparens-mode
  :init
  (smartparens-global-mode)
  :config
  (require 'smartparens-config)
  (add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode)
  (custom-set-variables
   '(sp-base-key-bindings 'sp)
   '(sp-override-key-bindings
     '(("C-S-<left>" . sp-backward-slurp-sexp)
       ("C-S-<right>" . sp-backward-barf-sexp)
       ("C-M-t" . sp-transpose-sexp)
       ("C-S-k" . sp-kill-hybrid-sexp)
       ("C-c C-<right>" . sp-slurp-hybrid-sexp)
       ("C-(" . sp-rewrap-sexp)
       ("C-M-<backspace>" . sp-splice-sexp-killing-around)
       ("C-S-<backspace>" . nil))))
  ;; markdown
  (defun sp--markdown-skip-asterisk (ms mb me)
    (save-excursion
      (goto-char mb)
      (save-match-data (looking-at "^\\* "))))
  (sp-with-modes 'markdown-mode
    (sp-local-pair "*" "*"
     :unless '(sp-point-after-word-p sp-point-at-bol-p)
     :skip-match 'sp--markdown-skip-asterisk)
    (sp-local-pair "**" "**")
    (sp-local-pair "_" "_" :unless '(sp-point-after-word-p)))
  ;; haskell
  (add-to-list 'sp-no-reindent-after-kill-modes 'haskell-mode)
  ;;; org-mode
  (defun sp--org-skip-asterisk (ms mb me)
    (or (and (= (line-beginning-position) mb)
             (eq 32 (char-after (1+ mb))))
        (and (= (1+ (line-beginning-position)) me)
             (eq 32 (char-after me)))))
  (defun sp--org-inside-LaTeX (id action context)
    (org-inside-LaTeX-fragment-p))
  (sp-with-modes 'org-mode
    (sp-local-pair "*" "*"
     :unless '(sp-point-after-word-p sp--org-inside-LaTeX sp-point-at-bol-p)
     :skip-match 'sp--org-skip-asterisk)
    (sp-local-pair "/" "/" :unless '(sp-point-after-word-p sp--org-inside-LaTeX))
    (sp-local-pair "~" "~" :unless '(sp-point-after-word-p sp--org-inside-LaTeX))
    (sp-local-pair "=" "=" :unless '(sp-point-after-word-p sp--org-inside-LaTeX))
    (sp-local-pair "\\[" "\\]")))

; enable in c/cpp/objc mode
; 	normal mode would be #'smartparens-mode
; 	You may want to try smartparens-strict-mode. 
; 	This enforces that pairs are always balanced, so commands like kill-line keep your code well-formed.
(add-hook 'c-mode-common-hook #'smartparens-strict-mode) 

(provide 'init-smartparens)