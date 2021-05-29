(global-set-key [escape] 'keyboard-escape-quit)
(define-key transient-map (kbd "<escape>") 'transient-quit-one)

(global-set-key (kbd "s-<return>") 'smart-open-line)            ;; Cmd+Return new line below
(global-set-key (kbd "s-S-<return>") 'smart-open-line-above)    ;; Cmd+Shift+Return new line above

(global-set-key (kbd "s-<up>") 'beginning-of-buffer)  ;; First line
(global-set-key (kbd "s-<down>") 'end-of-buffer)      ;; Last line

(global-set-key (kbd "s-,") (lambda () (interactive) (find-file "~/chemacs/default/init.el")))
(global-unset-key (kbd "s-p"))     ; Don't print
