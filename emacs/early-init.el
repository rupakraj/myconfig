;;; -*- lexical-binding: t; -*-

;; package system — must run before init.el's package calls
(setq package-enable-at-startup nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; avoid repeated frame resize/redraw while it's being set up
(setq frame-inhibit-implied-resize t)

;; hide UI chrome before the frame ever draws (no flash)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; cursor, set at the frame level so it's correct from first paint
(push '(cursor-type . box) default-frame-alist)

;; fallback colors — in case the theme package needs installing and the
;; very first frame paints before load-theme below finishes
(push '(background-color . "#303446") default-frame-alist)  ; Frappé base
(push '(foreground-color . "#c6d0f5") default-frame-alist)  ; Frappé text

;; theme — loaded here so it's active before the frame is ever drawn
(unless (package-installed-p 'catppuccin-theme)
  (package-refresh-contents)
  (package-install 'catppuccin-theme))

(setq catppuccin-flavor 'frappe)
(load-theme 'catppuccin t)

;;; early-init.el ends here
