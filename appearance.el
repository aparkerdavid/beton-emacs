(set-face-attribute 'default nil :font "Fira Code" :height 130)
(setq rainbow-delimiters-max-face-count 4)
(setq-default cursor-type '(bar . 3))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(delete-selection-mode 1)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(setq-default line-spacing 0.25)
(fringe-mode 24)


;; non-jittery line number display, for when you want line numbers
(setq display-line-numbers-width-start 't)

(load-file "~/chemacs/default/beton-theme.el")
(load-theme 'beton 'y)

(use-package mini-frame
  :config
  (mini-frame-mode +1)
  (custom-set-variables
   '(mini-frame-show-parameters
     '((top . 10)
       (width . 0.7)
       (left . 0.5)))))

(use-package tree-sitter)

(use-package tree-sitter-langs)

(use-package ligature
  :straight (ligature :type git :host github :repo "mickeynp/ligature.el"))

;; inequality ligatures in programming modes
(ligature-set-ligatures 'prog-mode '(">=" "<="))
(global-ligature-mode 't)
