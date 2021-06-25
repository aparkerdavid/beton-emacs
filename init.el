(setq inhibit-startup-screen t)
(setq warning-minimum-level :emergency)
(setq comp-deferred-compilation-deny-list '())
(setq backup-directory-alist `(("." . "~/.saves")))
(setq split-width-threshold 0)
(setq split-height-threshold nil)

(load-file "~/chemacs/default/package-management.el")

(use-package simpleclip
  :config (simpleclip-mode 1))

(use-package apheleia
  :config
  (apheleia-global-mode +1)
  (push '(mix-format "mix format" file) apheleia-formatters)
  (push '(elixir-mode . mix-format) apheleia-mode-alist))

(use-package consult
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
  :config
  (require 'smartparens-config)
  (setq sp-highlight-pair-overlay nil)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t))

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
  (setq org-default-notes-file "~/capture.org")
  (define-key org-capture-mode-map (kbd "s-s") 'org-capture-finalize))

(use-package magit
  :config
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

(use-package undo-fu
  :config
  (global-set-key (kbd "s-z")   'undo-fu-only-undo)
  (global-set-key (kbd "s-Z") 'undo-fu-only-redo))

(use-package rainbow-mode) ;; visualize hex colors

(use-package rainbow-delimiters ;; rainbow brackets
  :hook (prog-mode . rainbow-delimiters-mode)
  :custom
  (setq rainbow-delimiters-max-face-count 4))

(use-package highlight-function-calls
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-function-calls-mode))

(use-package company
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
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\node-modules\\'"))

(use-package elixir-mode)

(use-package mix
  :config
  (add-hook 'elixir-mode-hook 'mix-minor-mode))   

(load-file "~/chemacs/default/eshell.el")
(load-file "~/chemacs/default/shell.el")
(load-file "~/chemacs/default/friendly-keys.el")
(load-file "~/chemacs/default/appearance.el")
