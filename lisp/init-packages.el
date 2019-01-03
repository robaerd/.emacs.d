(require 'package)

;; prevent bytecode incompatibility of packages after emacs update. Packages are installed into seperate dir for each version
;(let ((versioned-package-dir
 ;      (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
  ;                       ".")))
  ;(setq package-user-dir versioned-package-dir))
(setq package-user-dir "~/.emacs.d/elpa")
;(add-to-list 'load-path package-user-dir)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
         

(when (version< emacs-version "27.0") (package-initialize))
(unless package--initialized (package-initialize t))

(require 'cl-lib)

;;Author: purcell
; taken and modified from his emacs.d/lisp/init-elpa.el
(defun get-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (or (package-installed-p package min-version)
      (let* ((known (cdr (assoc package package-archive-contents)))
             (versions (mapcar #'package-desc-version known)))
        (if (cl-find-if (lambda (v) (version-list-<= min-version v)) versions)
            (package-install package)
          (if no-refresh
              (error "No version of %s >= %S is available" package min-version)
            (package-refresh-contents)
            (get-package package min-version t))))))


(provide 'init-packages)