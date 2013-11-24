;; custom global key bindings

;; shortcuts to built-in functions
(global-set-key (kbd "C-x C-b") 'switch-to-buffer) ; I typo C-x b like this *all* the time
(global-set-key (kbd "C-c f") 'auto-fill-mode)
(global-set-key (kbd "C-c n") 'comment-region)
(global-set-key (kbd "C-c m") 'uncomment-region)

;; shortcuts to own defuns - see vis-defun.el
(global-set-key (kbd "C-c a") 'vis-copy-whole-buffer)
(global-set-key (kbd "C-c c") 'vis-copy-this-line)
(global-set-key (kbd "C-c C-c") 'vis-copy-this-line)
(global-set-key (kbd "C-c d") 'vis-text-insert-date)
(global-set-key (kbd "C-c 2") 'vis-dup-line)
(global-set-key (kbd "C-c k") 'vis-kill-this-line)
(global-set-key (kbd "C-c y") 'vis-yank-n-times)
(global-set-key (kbd "M-RET") 'vis-open-line-below)
(global-set-key (kbd "M-C-RET") 'vis-open-line-above)

(provide 'vis-keybindings)
