(setenv "USING_EMACS" "t")

(setq ansi-color-map 
        [default bold default italic underline success warning error nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil
          (foreground-color . #1="#232c31") ;; fg1
          (foreground-color . #2="#aa3731") ;; red
          (foreground-color . #3="#448c27") ;; green
          (foreground-color . #4="#996d00") ;; dark-yellow
          (foreground-color . #5="#284a9a") ;; dark-blue
          (foreground-color . #6="#75358d") ;; dark-magenta
          (foreground-color . #7="#006285") ;; dark-teal
          (foreground-color . #8="#353d41") ;; fg2
          nil nil
          (background-color . #1#)
          (background-color . #2#)
          (background-color . #3#)
          (background-color . #4#)
          (background-color . #5#)
          (background-color . #6#)
          (background-color . #7#)
          (background-color . #8#)
          nil nil])

(defun beton-clear-shell () (interactive)
       (mark-whole-buffer)
       (call-interactively 'delete-region)
       (call-interactively 'comint-send-input))

(defun my/shell-previous-input () (interactive)
       (call-interactively 'end-of-buffer)
       (call-interactively 'comint-previous-input))

(defun my/shell-next-input () (interactive)
       (call-interactively 'end-of-buffer)
       (call-interactively 'comint-next-input))

(defun my/shell-clear-input () (interactive)
       (call-interactively 'set-mark-command)
       (call-interactively 'beginning-of-line)
       (call-interactively 'delete-region))

(use-package shell
  :config
  (setq comint-process-echoes t)
  (setq shell-font-lock-keywords '())
  
  :bind
  (:map shell-mode-map
	("M-<backspace>". backward-kill-word)
	("s-u" . beton-clear-shell)
        ("<up>" . my/shell-previous-input)
        ("<down>" . my/shell-next-input)
        ("s-<backspace>" . my/shell-clear-input)))

