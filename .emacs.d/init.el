(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("42ac06835f95bc0a734c21c61aeca4286ddd881793364b4e9bc2e7bb8b6cf848" "cdc7555f0b34ed32eb510be295b6b967526dd8060e5d04ff0dce719af789f8e5" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" "9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "11d069fbfb0510e2b32a5787e26b762898c7e480364cbc0779fe841662e4cf5d" "410c47e5b36f3beb70b165b52badc13a77dea96ecea4811ec0f53b9d300be9bf" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "73fe242ddbaf2b985689e6ec12e29fab2ecd59f765453ad0e93bc502e6e478d6" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "ce79400f46bd76bebeba655465f9eadf60c477bd671cbcd091fe871d58002a88" "1989847d22966b1403bab8c674354b4a2adf6e03e0ffebe097a6bd8a32be1e19" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "4a60f0178f5cfd5eafe73e0fc2699a03da90ddb79ac6dbc73042a591ae216f03" "0f0e3af1ec61d04ff92f238b165dbc6d2a7b4ade7ed9812b4ce6b075e08f49fe" "d7f1c86b425e148be505c689fc157d96323682c947b29ef00cf57b4e4e46e6c7" "9ea054db5cdbd5baa4cda9d373a547435ba88d4e345f4b06f732edbc4f017dc3" "1f3304214265481c56341bcee387ef1abb684e4efbccebca0e120be7b1a13589" "5339210234ec915d7d3fd87bfeb506bfc436ff7277a55516ab1781ec85c57224" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "9f42bccce1e13fa5017eb8718574db099e85358b9f424db78e7318f86d1be08f" "62b86b142b243071b5adb4d48a0ab89aefd3cf79ee3adc0bb297ea873b36d23f" default)))
 '(global-hl-line-mode nil)
 '(inhibit-x-resources t t)
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/outlines.org")))
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

(package-initialize nil)
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

(setq-default indent-tabs-mode nil)
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


(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-/" 'hippie-expand)
(defun kill-region-or-word ()
  (interactive)
  (if (and transient-mark-mode mark-active)
      (kill-region (point) (mark))
    (backward-kill-word 1)))
(global-set-key "\C-w" 'kill-region-or-word)
(global-set-key "\C-xw" 'delete-trailing-whitespace)
(global-set-key "\C-\\" (lambda ()
                          (interactive)
                          (insert-char "3bb")))

(global-set-key "\C-cn" 'windmove-down)
(global-set-key "\C-cu" 'windmove-up)
(global-set-key "\C-cf" 'windmove-right)
(global-set-key "\C-cb" 'windmove-left)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd  "C--") 'text-scale-decrease)

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
                      feature-mode
                      flx-ido
                      flycheck
                      fsharp-mode
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
                      perspective
                      php-mode
                      powerline
                      projectile
                      projectile-rails
                      helm-projectile
                      pylint
                      python-django
                      pyvenv
                      racket-mode
                      rainbow-mode
                      robe
                      rspec-mode
                      rvm
                      scala-mode2
                      scss-mode
                      smartparens
                      smart-mode-line
                      smart-mode-line-powerline-theme
                      tuareg
                      undo-tree
                      web-mode
                      yasnippet
                      zenburn-theme))

(defun install-packages ()
  (interactive)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(install-packages)

(load-theme 'zenburn)
;; (set-background-color "black")
;; (add-to-list 'default-frame-alist '(background-color . "black"))
;; (set-face-attribute 'linum nil :background "black")
;; (set-face-attribute 'fringe nil :background "black")
(set-fringe-style '(0 . 2))

(require 'perspective)
(persp-mode)
(require 'persp-projectile)

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
(show-smartparens-global-mode 1)


(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
(define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

(define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
(define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

(define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key sp-keymap (kbd "C-)") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-}") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-(") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-{") 'sp-backward-barf-sexp)

(define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)

(define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
(define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

(define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
(define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

;; (define-key sp-keymap (kbd "H-t") 'sp-prefix-tag-object)
;; (define-key sp-keymap (kbd "H-p") 'sp-prefix-pair-object)
;; (define-key sp-keymap (kbd "H-s c") 'sp-convolute-sexp)
;; (define-key sp-keymap (kbd "H-s a") 'sp-absorb-sexp)
;; (define-key sp-keymap (kbd "H-s e") 'sp-emit-sexp)
;; (define-key sp-keymap (kbd "H-s p") 'sp-add-to-previous-sexp)
;; (define-key sp-keymap (kbd "H-s n") 'sp-add-to-next-sexp)
;; (define-key sp-keymap (kbd "H-s j") 'sp-join-sexp)
;; (define-key sp-keymap (kbd "H-s s") 'sp-split-sexp)

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


(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'auto-complete-config)
(ac-config-default)

;; (require 'powerline)
;; (powerline-default-theme)
(require 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'powerline)


(require 'yasnippet)
(yas-global-mode 1)

(require 'rainbow-mode)
(rainbow-mode t)

(autoload 'org-mode "org" nil t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))



(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'auto-complete-mode)
;; (add-hook 'robe-mode-hook 'ac-robe-setup)
(autoload 'feature-mode "feature-mode" "Major mode for running cukes")
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(require 'rspec-mode)

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(defadvice run-ruby (before rvm-switch-run-ruby)
  (rvm-activate-corresponding-ruby))
(ad-activate 'run-ruby)
(defadvice projectile-rails-server (before rvm-switch-projectile-rails-server)
  (rvm-activate-corresponding-ruby))
(ad-activate 'projectile-rails-server)

(defadvice projectile-rails-console (before rvm-switch-projectile-rails-console)
  (rvm-activate-corresponding-ruby))
(ad-activate 'projectile-rails-console)



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



(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

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


 ; Set OPAM environment variables
(dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (concat (cadr var) (getenv (car var)))))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;(autoload 'tuareg-imenu-set-imenu "tuareg-imenu"
;  "Configuration of imenu for tuareg" t)

;(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)

(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(setq merlin-command
      (concat
       (substring (shell-command-to-string "opam config var bin") 0 -1)
       "/ocamlmerlin"))

(autoload 'merlin-mode "merlin" "Merlin mode" t)


(add-hook 'tuareg-mode-hook
        '(lambda ()
            (merlin-mode)
            (setq merlin-use-auto-complete-mode t)))

(require 'helm-config)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(when (executable-find "curl")
(setq helm-google-suggest-use-curl-p t))

(helm-mode 1)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(require 'helm-projectile)
(helm-projectile-on)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(setenv "ORACLE_HOME" "/usr/lib/oracle/xe/app/oracle/product/10.2.0/server")
(setenv "ORACLE_SID" "XE")
(setq exec-path (append exec-path  (split-string (getenv "PATH") ":")))

(require 'fsharp-mode)
(put 'scroll-left 'disabled nil)
