(setq inhibit-startup-screen t)
(setq warning-minimum-level :emergency)
(setq comp-deferred-compilation-deny-list '())
(setq backup-directory-alist `(("." . "~/.saves")))
(setq split-width-threshold 0)
(setq split-height-threshold nil)

(load-file "~/chemacs/default/package-management.el")

(use-package simpleclip
  :config (simpleclip-mode 1))

;; Use minimalist Ivy for most things.
(use-package ivy
  :diminish
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)      ;; show bookmarks and recent files in buffer list
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)

  (setq ivy-re-builders-alist
      '((swiper . ivy--regex-plus)
        (t      . ivy--regex-fuzzy)))

  (global-set-key (kbd "s-b") 'ivy-switch-buffer)
  (global-set-key (kbd "M-s-b") 'ivy-resume))      ;; Alt+Cmd+b resume whatever Ivy was doing

(use-package multiple-cursors
  :config
  (global-unset-key (kbd "M-<down-mouse-1>"))
  (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click))


;; Swiper is a better local finder.
(use-package swiper
  :config
  (global-set-key "\C-s" 'swiper)       ;; Default Emacs Isearch forward...
  (global-set-key "\C-r" 'swiper)       ;; ... and Isearch backward replaced with Swiper
  (global-set-key (kbd "s-f") 'swiper)) ;; Cmd+f find text


;; Better menus with Counsel (a layer on top of Ivy)
(use-package counsel
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)            ;; Alt+x run command
  (global-set-key (kbd "s-P") 'counsel-M-x)            ;; Cmd+Shift+p run command
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)  ;; Replace built-in Emacs 'find file' (open file) with Counsel
  (global-set-key (kbd "s-o") 'counsel-find-file))     ;; Cmd+o open file

(use-package smex)  ;; show recent commands when invoking M-x
(use-package flx)   ;; enable fuzzy matching

;; Make Ivy a bit more friendly by adding information to ivy buffers, e.g. description of commands in Alt-x, meta info when switching buffers, etc.
(use-package ivy-rich
  :config
  (ivy-rich-mode 1)
  (setq ivy-rich-path-style 'abbrev)) ;; Abbreviate paths using abbreviate-file-name (e.g. replace “/home/username” with “~”)

;; Integrate Projectile with Counsel
(use-package counsel-projectile
  :config
  (counsel-projectile-mode 1)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "s-p") 'counsel-find-file)
            ;; Cmd+p open file in current project
  (global-set-key (kbd "s-F") 'counsel-projectile-rg))     ;; Cmd+Shift+F search in current git repository

(setq projectile-completion-system 'ivy)             ;; Use Ivy in Projectile

(use-package parinfer-rust-mode
  :hook 'emacs-lisp-mode 'lisp-mode
  :config
  (setq-default parinfer-rust-dim-parens nil))

(use-package god-mode)

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
  :hook
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

(use-package magit
  :config
  (global-set-key (kbd "s-g") 'magit-status)
  (defun magit-standalone ()
    (interactive)
    (progn
     (magit-status)
     (delete-other-windows))))

(use-package forge
  :after magit)

(use-package orgit
  :after magit)

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

(use-package elfeed
  :config
  (setq elfeed-feeds
	'(("https://freddiedeboer.substack.com/feed/" freddie)
	  ("http://graymirror.substack.com/feed" curtis)
	  ("https://lukesmith.xyz/rss.xml" luke))))
  
   

(load-file "~/chemacs/default/eshell.el")
(load-file "~/chemacs/default/friendly-keys.el")
(load-file "~/chemacs/default/appearance.el")
