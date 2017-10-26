;; (menu-bar-mode -1)
(tool-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

;; (setq c-default-style "cc-mode")

(defalias 'yes-or-no-p 'y-or-n-p)

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

(use-package smooth-scrolling
  :init
  (smooth-scrolling-mode 1)
;;  (setq smooth-scroll-margin 5)
)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

(provide 'setup-general)
