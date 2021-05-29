(global-set-key (kbd "<escape>") 'keyboard-quit)
(define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(define-key minibuffer-mode-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(define-key transient-map (kbd "<escape>") 'transient-quit-one)

(global-set-key (kbd "s-<return>") 'smart-open-line)            ;; Cmd+Return new line below
(global-set-key (kbd "s-S-<return>") 'smart-open-line-above)    ;; Cmd+Shift+Return new line above

(global-set-key (kbd "s-<up>") 'beginning-of-buffer)  ;; First line
(global-set-key (kbd "s-<down>") 'end-of-buffer)      ;; Last line

(global-set-key (kbd "s-,") (lambda () (interactive) (find-file "~/chemacs/default/init.el")))
(define-key projectile-mode-map (kbd "s-p") 'projectile-find-file)
(global-unset-key (kbd "s-p"))     ; Don't print

(define-key git-commit-mode-map (kbd "s-s") 'with-editor-finish)      ;; command-s to save commit
(define-key git-commit-mode-map (kbd "<escape>") 'with-editor-cancel) ;; escape to cancel commit

;; Quickly insert new lines above or below the current line, with correct indentation.
(defun smart-open-line ()
  "Insert an empty line after the current line. Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun smart-open-line-above ()
  "Insert an empty line above the current line. Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun elisp-smart-eval ()
  (interactive)
  (if (region-active-p)
      (call-interactively 'eval-region)
    (call-interactively 'eval-last-sexp)))
     
(define-key emacs-lisp-mode-map (kbd "s-e") 'elisp-smart-eval)
