(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("11636897679ca534f0dec6f5e3cb12f28bf217a527755f6b9e744bd240ed47e1" "9f3a4edb56d094366afed2a9ba3311bbced0f32ca44a47a765d8ef4ce5b8e4ea" default)))
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



;; Automatically load abbreviations.
(setq-default abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)



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

(require 'linum-relative)
(global-linum-mode 1)
(setq linum-format "%d ")
(linum-relative-mode)

(package-initialize)

(defvar my-packages '(ace-jump-mode
                      ack
                      ac-nrepl
                      auto-complete
                      browse-kill-ring
                      coffee-mode
                      cperl-mode
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
                      evil-surround
                      evil-rails
                      evil-nerd-commenter
                      evil-matchit
                      expand-region
                      feature-mode
                      flx-ido
                      flycheck
                      fsharp-mode
                      go-mode
                      go-projectile
                      go-autocomplete
                      haml-mode
                      inf-ruby
                      ipython
                      ir-black-theme
                      jedi
                      jinja2-mode
                      js2-mode
                      json-mode
                      jump
                      less-css-mode
                      lua-mode
                      linum-relative
                      magit
                      multi-term
                      nim-mode
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
                      ruby-tools
                      rust-mode
                      rvm
                      sbt-mode
                      scala-mode2
                      scss-mode
                      smartparens
                      smart-mode-line
                      smart-mode-line-powerline-theme
                      tuareg
                      undo-tree
                      virtualenvwrapper
                      web-mode
                      yaml-mode
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

(require 'evil)
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
(evilnc-default-hotkeys)
(require 'evil-matchit)
(global-evil-matchit-mode 1)



(load-theme 'zenburn)
(set-fringe-style '(0 . 2))

(elpy-enable)
(fset 'perl-mode 'cperl-mode)
(electric-indent-mode 1)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(setq venv-location "/home/rahul/venvs")

(require 'perspective)
(persp-mode)
(require 'persp-projectile)

(autoload 'magit-status "magit" nil t)

(defalias 'perl-mode 'cperl-mode)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
;; (setq ido-use-faces nil)


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
(define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)

(define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-S-e") 'sp-end-of-sexp)

(define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

(define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
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

;; web-mode
;; make web-mode play nice with smartparens
(setq web-mode-enable-auto-pairing nil)
(sp-with-modes '(web-mode)
  (sp-local-pair "%" "%"
                 :unless '(sp-in-string-p)
                 :post-handlers '(((lambda (&rest _ignored)
                                     (just-one-space)
                                     (save-excursion (insert " ")))
                                   "spc" "=" "#")))
  (sp-local-pair "<% "  " %>" :insert "c-c %")
  (sp-local-pair "<%= " " %>" :insert "c-c =")
  (sp-local-pair "<%# " " %>" :insert "c-c #")
  (sp-local-tag "%" "<% "  " %>")
  (sp-local-tag "=" "<%= " " %>")
  (sp-local-tag "#" "<%# " " %>"))

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
;; (sp-with-modes '(html-mode sgml-mode)
;;   (sp-local-pair "<" ">"))


(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(require 'powerline)
(powerline-default-theme)
;; (require 'smart-mode-line)
;; (sml/setup)
;; (sml/apply-theme 'powerline)


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
;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Appraisals\\'" . enh-ruby-mode))

(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'auto-complete-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)
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

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))
(ad-activate 'inf-ruby-console-auto)

(defadvice inf-ruby (before activate-rvm-for-inf-ruby)
  (rvm-activate-corresponding-ruby))
(ad-activate 'inf-ruby)

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
(add-hook 'caml-mode-hook 'merlin-mode)

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
;; (setq exec-path (append exec-path  (split-string (getenv "PATH") ":")))

(require 'fsharp-mode)
(put 'scroll-left 'disabled nil)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(require 'go-mode-autoloads)

