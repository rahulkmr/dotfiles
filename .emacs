;; General settings.
(server-start)
(setq inhibit-splash-screen t)
(setq transient-mark-mode t)
(line-number-mode t)
(column-number-mode t)
(global-hl-line-mode t)
(setq-default indent-tabs-mode nil)
(mouse-wheel-mode nil)
(setq make-backup-files t)
(global-font-lock-mode t)
(setq-default fill-column 120)
(setq auto-fill-mode t)

(define-key global-map "\C-xw" 'what-line)
(define-key global-map "\C-z" 'undo)
(define-key global-map "\M-g" 'goto-line)

;; Automatically load abbreviations.
(setq-default abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)


(menu-bar-mode nil)
(tool-bar-mode nil)

(auto-compression-mode t)

(partial-completion-mode)

;; Configuration and vendor files loading.
(setq root "~/.emacs.d/")
(setq vendor-dir (concat root "vendor/"))
(setq themes (concat root "themes/"))
(setq configs (concat root "configs/"))
(add-to-list 'load-path root)
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path themes)

(defun load-cfg-files (filelist)
  (dolist (file filelist)
    (load (expand-file-name
           (concat configs file)))))

;; Set color theme.
;(require 'color-theme)
;(color-theme-initialize)
;(load "color-theme-irblack.el")
;(color-theme-irblack)
