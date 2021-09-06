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
  :bind
  (:map shell-mode-map
	("ESC" . comint-interrupt-subjob)
	("M-<backspace>". backward-kill-word)
	("s-u" . beton-clear-shell)
        ("<up>" . my/shell-previous-input)
        ("<down>" . my/shell-next-input)
        ("s-<backspace>" . my/shell-clear-input)))
