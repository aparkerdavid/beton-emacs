(defun beton-eshell-clear () (interactive)
       (eshell/clear-scrollback)
       (eshell-send-input))

(use-package eshell
  :bind (("s-u"      . beton-eshell-clear)
         ("s-<left>" . eshell-bol)
         ("<escape>" . eshell-interrupt-process)))
