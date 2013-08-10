(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(line-number-mode t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

;; General settings.
(setq inhibit-splash-screen t)
(setq transient-mark-mode t)
(setq auto-compression-mode t)
(setq mouse-wheel-mode nil)
(setq indent-tabs-mode nil)
(setq auto-fill-mode t)
(setq make-backup-files t)
;(global-hl-line-mode t)
(setq-default global-font-lock-mode t)
(setq-default fill-column 120)
(global-linum-mode 1)
(setq linum-format "%d  ")

;; Automatically load abbreviations.
(setq abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)

(define-key global-map "\C-xw" 'what-line)
(define-key global-map "\C-z" 'undo)
(define-key global-map "\M-g" 'goto-line)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Configuration and vendor files loading.
;(setq root "~/.emacs.d/")
;(setq vendor-dir (concat root "vendor/"))
;(setq themes (concat root "themes/"))
;(setq configs (concat root "configs/"))
;(add-to-list 'load-path root)
;(add-to-list 'load-path vendor-dir)
;(add-to-list 'load-path themes)

;(defun load-cfg-files (filelist)
  ;(dolist (file filelist)
    ;(load (expand-file-name
           ;(concat configs file)))))

(package-initialize)
(evil-mode t)
(load-theme 'wombat t)
