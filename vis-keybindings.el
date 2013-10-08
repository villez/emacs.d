;; custom global key bindings

(global-set-key (kbd "C-x C-b") 'switch-to-buffer) ; I typo C-x b like this *all* the time
(global-set-key (kbd "C-c a") 'copy-whole-buffer)
(global-set-key (kbd "C-c c") 'copy-this-line)
(global-set-key (kbd "C-c f") 'auto-fill-mode)
(global-set-key (kbd "C-c d") 'text-insert-date)
(global-set-key (kbd "C-c 2") 'dup-line)
(global-set-key (kbd "C-c k") 'kill-this-line)
(global-set-key (kbd "M-RET") 'open-line-below)
(global-set-key (kbd "M-C-RET") 'open-line-above)

(provide 'vis-keybindings)
