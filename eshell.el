(defun beton-eshell-clear () (interactive) (eshell/clear-scrollback) (eshell-send-input))
(define-key eshell-mode-map (kbd "s-u") 'beton-eshell-clear)
(define-key eshell-mode-map (kbd "s-<left>") 'eshell-bol)

