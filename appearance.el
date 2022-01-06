(set-face-attribute 'default nil :font "Fira Code" :height 130)
(setq frame-resize-pixelwise +1)
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)
(setq rainbow-delimiters-max-face-count 4)
(setq-default cursor-type '(bar . 3))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(delete-selection-mode 1)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq-default line-spacing 0.4)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(fringe-mode 24)


(setq mode-line-format
      '("%e"
        mode-line-front-space
        ;; mode-line-mule-info
        ;; mode-line-client
        ;; mode-line-modified
        ;; mode-line-remote
        ;; mode-line-frame-identification
        mode-line-buffer-identification
        ;; "   "
        ;; mode-line-position
        ;; (vc-mode vc-mode)
        "  "
        ;; mode-line-modes
        mode-name
        ;; mode-line-misc-info
        mode-line-end-spaces
        ))

(use-package mlscroll
  :config
  (setq mlscroll-shortfun-min-width 11) ;truncate which-func, for default mode-line-format's
  (mlscroll-mode 1))

;; non-jittery line number display, for when you want line numbers
(setq display-line-numbers-width-start 't)

(load-file "~/.emacs.d/beton-theme.el")
(load-theme 'beton 'y)

(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-character #x007C)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package mini-frame
  :config
  (mini-frame-mode +1)
  (custom-set-variables
   '(mini-frame-show-parameters
     '((top . 10)
       (width . 0.7)
       (left . 0.5)))))

;; (use-package tree-sitter)

;; (use-package tree-sitter-langs)

(use-package ligature
  :straight (ligature :type git :host github :repo "mickeynp/ligature.el"))
(ligature-set-ligatures 'prog-mode '(">=" "<=" "|>" "->" "<-" "=>"))
(global-ligature-mode 't)
