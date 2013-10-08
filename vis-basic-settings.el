(defalias 'yes-or-no-p 'y-or-n-p)  ; never ask for full yes/no
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq electric-pair-mode t)

(setq default-major-mode 'text-mode)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; this allows closing an emacsclient-opened buffer with 
;; the C-x k instead of having to do C-x #
(add-hook 'server-switch-hook 
	  (lambda ()
	    (local-set-key (kbd "C-x k") '(lambda ()
					    (interactive)
					    (if server-buffer-clients
						(server-edit)
					      (ido-kill-buffer))))))

;; automatically make new directory when opening a file w/C-x C-f
(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create directories as necessary if they don't exist when visiting a new file"
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir t)))))


(provide 'vis-basic-settings)
