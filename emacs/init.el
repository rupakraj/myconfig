;;; -*- lexical-binding: t; -*-

;;; code:

;; custom generated config redirected to custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

;; use-package: auto-install missing packages
(setq use-package-always-ensure t)

;; ui customization (whatever's left — chrome is already handled in early-init)
(setq inhibit-startup-message t)
(tooltip-mode -1)
(blink-cursor-mode 1)
(setq blink-cursor-blinks 0)  ; 0 = blink forever
(setq-default cursor-type 'box)
(cua-mode 1)

;; files backup/autosave
(setq backup-directory-alist '((".*" . "~/.cache/emacs_backup/")))
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; completion
(use-package vertico
  :init (vertico-mode))

(use-package orderless
  :custom (completion-styles '(orderless basic)))

(use-package marginalia
  :init (marginalia-mode))

;; UTF-8 everywhere
(prefer-coding-system 'utf-8)
(set-language-environment "English")

;; warn before opening something huge
(setq large-file-warning-threshold (* 1 1024 1024))

;; editor
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(column-number-mode 1)
(electric-pair-mode 1)

(setq show-paren-style 'expression)  ; fixed typo
(show-paren-mode 1)

;; other handy tools
(use-package which-key
  :init (which-key-mode 1))

(use-package corfu
  :init (global-corfu-mode 1))

(use-package flycheck
  :init (global-flycheck-mode 1))

;; org mode
(setq org-adapt-indentation t)
(setq org-support-shift-select t)
(setq sentence-end-double-space nil)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'display-line-numbers-mode)

;;; init.el ends here
