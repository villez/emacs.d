;; misc utility functions

(defun visit-init-file ()
  "open init.el"
  (interactive)
  (find-file (concat vis-emacs-config-dir "init.el")))

(defun copy-whole-buffer ()
  "Copy entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max)))

(defun open-line-below()
  "insert a new line below current, indent and put point at beginning"
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun open-line-above()
  "insert a new line above current, indent and put point at beginning"
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun kill-this-line()
  "kill the whole line including newline no matter where the cursor is"
  (interactive)
  (beginning-of-line)
  (kill-whole-line))

(defun dup-line()
  "duplicate the current line - no fanciness, just kill-yank-yank"
  (interactive)
  (move-beginning-of-line 1)
  (kill-whole-line)
  (yank)
  (yank)
  (backward-char))

(defun copy-this-line()
  "insert the current line with trailing newline into the kill ring"
  (interactive)
  (copy-region-as-kill (line-beginning-position) (line-beginning-position 2)))

(defun kill-this-split()
  (interactive)
  (delete-other-windows)
  (kill-buffer))

(defun vis-frame-horizontal-bigger()
  (interactive)
  (set-frame-width (selected-frame) 150))

(defun vis-frame-horizontal-smaller()
  (interactive)
  (set-frame-width (selected-frame) 110))


(provide 'vis-defun)
