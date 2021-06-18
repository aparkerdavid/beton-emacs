(defun beton-eshell-clear () (interactive)
       (eshell/clear-scrollback)
       (eshell-send-input))

(defun beton-set-eshell-keys ()
    (->> '(("s-u"      . beton-eshell-clear)
           ("s-<left>" . eshell-bol)
           ("<escape>" . eshell-interrupt-process))
      (mapc (lambda (binding) (define-key eshell-mode-map  (-> binding car kbd) (cdr binding))))))
 

(use-package eshell
  :hook (eshell-mode . beton-set-eshell-keys))
