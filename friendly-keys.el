(global-set-key (kbd "<escape>") 'keyboard-quit)
(define-key company-active-map (kbd "<escape>") 'company-abort)
(define-key minibuffer-mode-map (kbd "<escape>") 'minibuffer-keyboard-quit)
(define-key transient-map (kbd "<escape>") 'transient-quit-one)

(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-W") 'delete-other-windows)
(global-set-key (kbd "s-\\") 'split-window-right)

(global-set-key (kbd "s-<left>") 'back-to-indentation)
(global-set-key (kbd "s-/") 'comment-line)

(global-set-key (kbd "s-!") 'eshell)
(global-set-key (kbd "s-o") 'find-file)

(global-set-key (kbd "s-K") 'kill-whole-line-dwim)

(global-set-key (kbd "s-<return>") 'smart-open-line)            ;; Cmd+Return new line below
(global-set-key (kbd "s-S-<return>") 'smart-open-line-above)    ;; Cmd+Shift+Return new line above

(global-set-key (kbd "s-<up>") 'beginning-of-buffer)  ;; First line
(global-set-key (kbd "s-<down>") 'end-of-buffer)      ;; Last line

(global-set-key (kbd "s-,") (lambda () (interactive) (find-file "~/chemacs/default/init.el")))
(global-unset-key (kbd "s-p"))     ; Don't print

(global-set-key (kbd "s-P") 'execute-extended-command)
(global-set-key (kbd "s-b") 'switch-to-buffer)

(define-key git-commit-mode-map (kbd "s-s") 'with-editor-finish)      ;; confirm commit

;; cancel commit

(defun kill-whole-lines (from-line to-line)
  (goto-line from-line)
  (let ((number-of-lines-to-kill (+ 1 (abs (- from-line to-line)))))
    (dotimes (_ number-of-lines-to-kill) (call-interactively 'kill-whole-line))))

(defun kill-whole-line-dwim ()
  (interactive)
  (if (use-region-p)
      (let ((point-line (line-number-at-pos)))
	(save-excursion
	  (call-interactively 'exchange-point-and-mark)
	  (let* ((mark-line (line-number-at-pos))
		 (from-line (min mark-line point-line))
		 (to-line (max mark-line point-line)))
	    (kill-whole-lines from-line to-line))))
    (call-interactively 'kill-whole-line)))

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
(define-key lisp-interaction-mode-map (kbd "s-e") 'elisp-smart-eval)
