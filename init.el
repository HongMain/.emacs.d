
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; auto-complate
(use-package auto-complete
  :init
  (progn
    (require 'auto-complete)
    (require 'auto-complete-config)
    (ac-config-default)))

;; yasnippet
(use-package yasnippet
  :init
  (progn
    (require 'yasnippet)
    (yas-global-mode 1)))

;; define a function which initailizes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-source 'ac-source-c-headers))
;; now call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; ;; org's LP features
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;; '((emacs-lisp . t)
;;  (clojure . t)))
;; ;; Show syntax highlighting per language native mode in *.org
;; (setq org-src-fontify-natively t)
;; ;; For languages with significant whitespace like Python:
;; (setq org-src-preserve-indentation t)

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
    (org auto-complete-c-headers yasnippet auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "DAMA" :slant normal :weight normal :height 181 :width normal)))))



