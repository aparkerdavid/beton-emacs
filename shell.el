(defun beton-clear-shell () (interactive)
       (mark-whole-buffer)
       (call-interactively 'delete-backward-char)
       (call-interactively 'comint-send-input))

(use-package shell
  :config
  (setq comint-process-echoes t)
  :bind
  (:map shell-mode-map
	("ESC" . comint-interrupt-subjob)
	("M-<del>". backward-kill-word)
	("s-u" . beton-clear-shell)))
