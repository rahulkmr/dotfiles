(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "11d069fbfb0510e2b32a5787e26b762898c7e480364cbc0779fe841662e4cf5d" "410c47e5b36f3beb70b165b52badc13a77dea96ecea4811ec0f53b9d300be9bf" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "73fe242ddbaf2b985689e6ec12e29fab2ecd59f765453ad0e93bc502e6e478d6" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "ce79400f46bd76bebeba655465f9eadf60c477bd671cbcd091fe871d58002a88" "1989847d22966b1403bab8c674354b4a2adf6e03e0ffebe097a6bd8a32be1e19" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "4a60f0178f5cfd5eafe73e0fc2699a03da90ddb79ac6dbc73042a591ae216f03" "0f0e3af1ec61d04ff92f238b165dbc6d2a7b4ade7ed9812b4ce6b075e08f49fe" "d7f1c86b425e148be505c689fc157d96323682c947b29ef00cf57b4e4e46e6c7" "9ea054db5cdbd5baa4cda9d373a547435ba88d4e345f4b06f732edbc4f017dc3" "1f3304214265481c56341bcee387ef1abb684e4efbccebca0e120be7b1a13589" "5339210234ec915d7d3fd87bfeb506bfc436ff7277a55516ab1781ec85c57224" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9f42bccce1e13fa5017eb8718574db099e85358b9f424db78e7318f86d1be08f" "62b86b142b243071b5adb4d48a0ab89aefd3cf79ee3adc0bb297ea873b36d23f" default)))
 '(global-hl-line-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

(prefer-coding-system 'utf-8-unix)
(setq coding-system-for-read 'utf-8-unix)
(setq coding-system-for-write 'utf-8-unix)

;; Configuration and vendor files loading.
(setq root "~/.emacs.d/")
(setq utils (concat root "utils/"))
(setq modules (concat root "modules/"))
(setq themes (concat root "themes/"))
(setq vendor-dir (concat root "vendor/"))
(add-to-list 'load-path root)
(add-to-list 'load-path utils)
(add-to-list 'load-path modules)
(add-to-list 'load-path themes)
(add-to-list 'load-path vendor-dir)


;; General settings.

(setq inhibit-splash-screen t)
(setq transient-mark-mode t)
(setq auto-compression-mode t)
(setq mouse-wheel-mode nil)
(setq make-backup-files t)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

(setq-default  indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)
(setq-default global-font-lock-mode t)
(setq-default fill-column 120)
(setq-default transient-mark-mode t)
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(fset 'yes-or-no-p 'y-or-n-p)
(fset 'perl-mode 'cperl-mode)


;; Automatically load abbreviations.
(setq-default abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)


;(show-paren-mode 1)
(electric-indent-mode 1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-xg" 'what-line)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-c\C-w" 'kill-region)
(global-set-key "\C-xw" 'delete-trailing-whitespace)
(global-set-key "\C-\\" (lambda ()
                          (interactive)
                          (insert-char "3bb")))

(global-set-key "\C-cn" 'windmove-down)
(global-set-key "\C-cp" 'windmove-up)
(global-set-key "\C-cf" 'windmove-right)
(global-set-key "\C-cb" 'windmove-left)

(global-linum-mode 1)
(setq linum-format "%d ")

(package-initialize)

(defvar my-packages '(ace-jump-mode
                      ack
                      ac-nrepl
                      auto-complete
                      browse-kill-ring
                      clojure-mode
                      clojure-test-mode
                      cider
                      coffee-mode
                      dirtree
                      elpy
                      emmet-mode
                      enh-ruby-mode
                      ensime
                      evil
                      expand-region
                      flx-ido
                      flycheck
                      golden-ratio
                      haml-mode
                      inf-ruby
                      ipython
                      ir-black-theme
                      jedi
                      jinja2-mode
                      js2-mode
                      jump
                      less-css-mode
                      magit
                      multi-term
                      nose
                      paredit
                      powerline
                      pylint
                      python-django
                      pyvenv
                      racket-mode
                      rainbow-mode
                      rinari
                      robe
                      rvm
                      scala-mode2
                      scss-mode
                      smartparens
                      sr-speedbar
                      undo-tree
                      web-mode
                      yasnippet
                      zenburn-theme))

(defun install-packages ()
  (when (not package-archive-contents)
    (package-refresh-contents))
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(install-packages)

(load-theme 'zenburn)
(set-fringe-style '(0 . 2))


(autoload 'magit-status "magit" nil t)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(require 'undo-tree)
(global-undo-tree-mode 1)
(global-set-key (kbd "C-x u") 'undo)

(require 'ace-jump-mode)
(require 'browse-kill-ring)
(global-set-key (kbd "C-c w") 'ace-jump-word-mode)
(global-set-key (kbd "C-c l") 'ace-jump-line-mode)
(global-set-key (kbd "C-c c") 'ace-jump-char-mode)
(global-set-key  (kbd "C-;") (lambda ()
                                (interactive)
                                (insert "\n\n")
                                (indent-for-tab-command)
                                (forward-line -1)
                                (indent-for-tab-command)))


(autoload 'web-mode "web-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'smartparens-config)
(smartparens-global-mode 1)
(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
(define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

(define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
(define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

(define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key sp-keymap (kbd "C-)") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-}") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-(") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-{") 'sp-backward-barf-sexp)

(define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
(define-key sp-keymap (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
(define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
(define-key sp-keymap (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

(define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
;(define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
(define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

(define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
(define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

(define-key sp-keymap (kbd "H-t") 'sp-prefix-tag-object)
(define-key sp-keymap (kbd "H-p") 'sp-prefix-pair-object)
(define-key sp-keymap (kbd "H-s c") 'sp-convolute-sexp)
(define-key sp-keymap (kbd "H-s a") 'sp-absorb-sexp)
(define-key sp-keymap (kbd "H-s e") 'sp-emit-sexp)
(define-key sp-keymap (kbd "H-s p") 'sp-add-to-previous-sexp)
(define-key sp-keymap (kbd "H-s n") 'sp-add-to-next-sexp)
(define-key sp-keymap (kbd "H-s j") 'sp-join-sexp)
(define-key sp-keymap (kbd "H-s s") 'sp-split-sexp)

;;;;;;;;;;;;;;;;;;
;; pair management

(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

;;; markdown-mode
(sp-with-modes '(markdown-mode gfm-mode rst-mode)
  (sp-local-pair "*" "*" :bind "C-*")
  (sp-local-tag "2" "**" "**")
  (sp-local-tag "s" "```scheme" "```")
  (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

;;; tex-mode latex-mode
(sp-with-modes '(tex-mode plain-tex-mode latex-mode)
  (sp-local-tag "i" "\"<" "\">"))

;;; html-mode
(sp-with-modes '(html-mode sgml-mode)
  (sp-local-pair "<" ">"))

;;; lisp modes
;(sp-with-modes sp--lisp-modes
;  (sp-local-pair "(" nil :bind "C-("))

(require 'rinari)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'auto-complete-config)
(ac-config-default)

(require 'powerline)
(powerline-default-theme)

(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(require 'yasnippet)
(yas-global-mode 1)

(require 'rainbow-mode)
(rainbow-mode t)

(autoload 'org-mode "org" nil t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))


(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-hook 'enh-ruby-mode-hook 'robe-mode)

(require 'scala-mode2)
(autoload 'ensime-scala-mode-hook "ensime" nil t)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(add-hook 'term-mode-hook (lambda ()
                            (yas-minor-mode -1)
                            (setq show-trailing-whitespace nil)))

(add-hook 'dired-mode-hook (lambda ()
                             (local-set-key (kbd "j") (lambda ()
                                                        (interactive)
                                                        (dired-next-line 1)
                                                        (image-dired-dired-display-image)))
                             (local-set-key (kbd "k") (lambda ()
                                                        (interactive)
                                                        (dired-previous-line 1)
                                                        (image-dired-dired-display-image)))))

(autoload 'coffee-mode "coffee-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(autoload 'less-css-mode "less-css-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . scheme-mode))
; (eval-after-load "geiser" '(require quack))


(defun save-macro (name)
    "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
     (interactive "SName of the macro :")  ; ask for the name of the macro
     (kmacro-name-last-macro name)         ; use this name for the macro
     (find-file user-init-file)            ; open ~/.emacs or other user init file
     (goto-char (point-max))               ; go to the end of the .emacs
     (newline)                             ; insert a newline
     (insert-kbd-macro name)               ; copy the macro
     (newline)                             ; insert a newline
     (switch-to-buffer nil))               ; return to the initial buffer
(put 'narrow-to-region 'disabled nil)

; Setting up ipython
(when (executable-find "ipython")
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(require 'golden-ratio)
(golden-ratio-mode 1)

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session
;; dependency: rvm rinari
(defadvice rinari-web-server (before rvm-switch-rinari-web-server)
  (rvm-activate-corresponding-ruby))
(ad-activate 'rinari-web-server)

(defadvice rinari-console (before rvm-switch-rinari-console)
  (rvm-activate-corresponding-ruby))
(ad-activate 'rinari-console)

(defadvice run-ruby (before rvm-switch-run-ruby)
  (rvm-activate-corresponding-ruby))
(ad-activate 'run-ruby)

(require 'icomplete)
(require 'cider)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-history-size 5000) ; the default is 500
(setq cider-repl-wrap-history t)
(setq cider-repl-history-file "/home/rahul/.cider_history")

(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
