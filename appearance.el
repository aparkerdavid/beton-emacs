(set-face-attribute 'default nil :font "Fira Code" :height 130)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(delete-selection-mode 1)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(setq-default line-spacing 0.25)

;; non-jittery line number display, for when you want line numbers
(setq display-line-numbers-width-start 't)

(load-file "~/chemacs/default/beton-theme.el")
(load-theme 'beton 'y)


(use-package ligature
  :straight (ligature :type git :host github :repo "mickeynp/ligature.el"))

;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; Enable ligatures in programming modes
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(global-ligature-mode 't)
