(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setenv "PATH" (concat ".:/usr/local/bin:/opt/local/bin" (getenv "PATH")))
(add-to-list 'exec-path "/usr/local/bin/")

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm))
;;  (require 'setup-helm-gtags))
(require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

(require 'setup-c)


;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

;; backup the oldest two versions and the most-recent five versions
(setq version-control t) ; Use version numbers for backups
(setq kept-old-versions 2) ; Number of oldest versions to keep
(setq kept-new-versions 5) ; Number of newest versions to keep
(setq delete-old-versions t) ; Delete too old versions
(setq dired-kept-versions 1)
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs-backup")))
(setq backup-by-copying t)
(setq backup-by-copying-when-linked t) ; Copy linked files, don't rename.
(setq backup-by-copying-when-mismatch t)

(setq default-line-spacing 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "DAMA" :slant normal :weight normal :height 181 :width normal)))))
