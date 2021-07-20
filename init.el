(setq initial-buffer-choice "~/notes.org")
(setq warning-minimum-level :emergency)
(setq comp-deferred-compilation-deny-list '())
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms
      `((".*" "~/.saves/auto/" t)))
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq split-width-threshold 0)
(setq split-height-threshold nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook #'electric-pair-mode)

(load-file "~/chemacs/default/package-management.el")

(use-package diminish
  :config
  (diminish 'auto-revert-mode)
  (diminish 'eldoc-mode)
  (diminish 'company-mode))

(use-package simpleclip
  :config (simpleclip-mode 1))

(use-package dired+
  :config
  (diredp-toggle-find-file-reuse-dir 1))

(use-package apheleia
  :diminish apheleia-mode
  :config
  (apheleia-global-mode +1)
  (push '(mix-format "mix" "format" "-") apheleia-formatters)
  (push '(elixir-mode . mix-format) apheleia-mode-alist))

(use-package consult
  :bind ("s-F" . 'consult-ripgrep)
  :config
  (setq consult-project-root-function #'projectile-project-root))

(use-package embark)

(use-package embark-consult
  :bind ("s-;" . 'embark-act))

(use-package ctrlf
  :config (ctrlf-mode))

(use-package marginalia
  :config (marginalia-mode +1))

(use-package selectrum
  :config (selectrum-mode +1))

(use-package selectrum-prescient
  :config
  (selectrum-prescient-mode +1)
  (setq prescient-filter-method '(literal regexp initialism fuzzy)))

;; Show keybindings cheatsheet
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5))

(use-package move-text
  :config
  (global-set-key (kbd "M-<up>") 'move-text-up)
  (global-set-key (kbd "M-<down>") 'move-text-down))

;; Show parens and other pairs.
(use-package smartparens
  :diminish
  :bind
  (:map emacs-lisp-mode-map
	("C-S-<left>" . sp-forward-barf-sexp)
	("C-S-<right>" . sp-forward-slurp-sexp)
	("C-S-<up>" . sp-mark-sexp))
  :config
  (require 'smartparens-config)
  (setq sp-highlight-pair-overlay nil))

;; Emmet
(use-package emmet-mode
  :commands emmet-mode
  :init
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes t)
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode)) ;; enable Emmet's css abbreviation.
;; Ctrl+j or Ctrl+Enter to expand

(use-package nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  (defun my-nov-font-setup ()
    (face-remap-add-relative 'variable-pitch :family "Linux Biolinum"
                             :height 1.0)))

(use-package org
  :config
  (setq org-support-shift-select 't)
  :bind
  (:map org-mode-map
        ("M-S-<left>" . org-shiftcontrolleft)
        ("M-S-<right>" . org-shiftcontrolright)
        ("C-<left>" . org-metaleft)
	("C-<right>" . org-metaright)
	("M-<left>" . left-word)
	("M-<right>" . right-word)
	("M-<down>" . move-text-down)
	("M-<up>" . move-text-up)))

(use-package magit
  :config
  (add-hook 'after-save-hook 'magit-after-save-refresh-status)
  (global-set-key (kbd "s-g") 'magit-status)
  (defun magit-standalone ()
    (interactive)
    (progn
      (magit-status)
      (delete-other-windows))))

(use-package ripgrep)

(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map))

(use-package forge
  :after magit)

(use-package orgit
  :after magit)

(use-package ediff)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package iedit)

(use-package undo-fu
  :config
  (global-set-key (kbd "s-z")   'undo-fu-only-undo)
  (global-set-key (kbd "s-Z") 'undo-fu-only-redo))

(use-package rainbow-mode) ;; visualize hex colors

(use-package rainbow-delimiters ;; rainbow brackets
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package highlight-function-calls
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-function-calls-mode))

(use-package company
  :bind (:map company-active-map ("<escape>" . company-abort))
  :hook (prog-mode . company-mode))

(use-package lsp-mode
  :commands lsp
  :bind
  (:map prog-mode-map ("s-i" . lsp-find-definition))
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "~/elixir-ls")
  :config
  (setq lsp-enable-file-watchers nil))

(use-package consult-lsp)

(use-package emmet-mode)

(use-package web-mode
  :hook
  (web-mode . emmet-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.html.eex\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html.leex\\'" . web-mode))
  (add-to-list 'web-mode-engines-alist
	       '("elixir" . "\\.html.eex\\'"))
  (add-to-list 'web-mode-engines-alist
	       '("elixir" . "\\.html.leex\\'"))
  (setq-default web-mode-markup-indent-offset 2))

(defun mix-test-choose-file (&optional prefix use-umbrella-subprojects)
  (interactive "P")
  (let*
      ((current-file-path (when buffer-file-name (expand-file-name buffer-file-name)))
       (project-root (if use-umbrella-subprojects
			 (mix--find-closest-mix-file-dir current-file-path)
		       (mix--project-root)))
       (test-dir (concat project-root "test/"))
       (test-file-paths (directory-files-recursively test-dir "**test.exs"))
       (default-file-path (if (member current-file-path test-file-paths) current-file-path ""))
       (chosen-file (completing-read "Run test file: " test-file-paths nil nil default-file-path))
       (test-command (concat mix-command-test " " chosen-file)))
    (mix--start "test" test-command project-root prefix)))

(use-package elixir-mode
  :bind
  (:map elixir-mode-map
	("s-r" . mix-test-choose-file))
  :config
  (defun shou/fix-apheleia-project-dir (orig-fn &rest args)
    (let ((project (project-current)))
      (if (not (null project))
          (let ((default-directory (project-root project))) (apply orig-fn args))
        (apply orig-fn args))))

  (advice-add 'apheleia-format-buffer :around #'shou/fix-apheleia-project-dir))

(use-package mix
  :config
  (add-hook 'elixir-mode-hook 'mix-minor-mode))

(load-file "~/chemacs/default/eshell.el")
(load-file "~/chemacs/default/shell.el")
(load-file "~/chemacs/default/friendly-keys.el")
(load-file "~/chemacs/default/appearance.el")
