
(setenv "USING_EMACS" "t")

(set-face-attribute 'ansi-color-white nil :foreground "#232c31" :background "#232c31")
(set-face-attribute 'ansi-color-bright-white nil :foreground "#353d41" :background "#353d41")
(set-face-attribute 'ansi-color-red nil :foreground "#aa3731" :background "#aa3731")
(set-face-attribute 'ansi-color-bright-red nil :foreground "#7f2925" :background "#7f2925")
(set-face-attribute 'ansi-color-green nil :foreground "#448c27" :background "#448c27")
(set-face-attribute 'ansi-color-bright-green nil :foreground "#32681d" :background "#32681d")
(set-face-attribute 'ansi-color-blue nil :foreground "#325cc0" :background "#325cc0")
(set-face-attribute 'ansi-color-bright-blue nil :foreground "#284a9a" :background "#284a9a")
(set-face-attribute 'ansi-color-yellow nil :foreground "#cb9000" :background "#cb9000")
(set-face-attribute 'ansi-color-bright-yellow nil :foreground "#996d00" :background "#996d00")
(set-face-attribute 'ansi-color-magenta nil :foreground "#9343b1" :background "#9343b1")
(set-face-attribute 'ansi-color-bright-magenta nil :foreground "#75358d" :background "#75358d")
(set-face-attribute 'ansi-color-cyan nil :foreground "#0083b2" :background "#0083b2")
(set-face-attribute 'ansi-color-bright-cyan nil :foreground "#006285" :background "#006285")

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

