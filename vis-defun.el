;; misc utility functions


(defun visit-init-file ()
  "open init.el"
  (interactive)
  (find-file (concat vis-emacs-config-dir "init.el")))

(defun copy-whole-buffer ()
  "Copy entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max)))

(defun open-line-below ()
  "insert a new line below current and indent"
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun open-line-above ()
  "insert a new line above current and indent"
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

;; shortcut for C-a C-k C-k
(defun vis-kill-this-line ()
  "kill the whole line including newline no matter where the cursor is"
  (interactive)
  (beginning-of-line)
  (kill-whole-line))

(defun vis-dup-line ()
  "duplicate the current line - no fanciness, just kill-yank-yank"
  (interactive)
  (move-beginning-of-line 1)
  (kill-whole-line)
  (yank)
  (yank)
  (backward-char))

;; shortcut for C-a C-spc C-n C-w
(defun vis-copy-this-line ()
  "insert the current line with trailing newline into the kill ring"
  (interactive)
  (copy-region-as-kill (line-beginning-position) (line-beginning-position 2)))

;; help I'm lost in this maze of split buffers
(defun vis-kill-this-split ()
  "kill the active buffer and remove split"
  (interactive)
  (delete-other-windows)
  (kill-buffer))

;; a wide frame
(defun vis-frame-horizontal-big ()
  "make the current frame 150 characters wide"
  (interactive)
  (set-frame-width (selected-frame) 150))

;; a narrower frame
(defun vis-frame-horizontal-small ()
  "make the current frame 110 characters wide"
  (interactive)
  (set-frame-width (selected-frame) 110))

;; a simple workaround because normally yank doesn't work
;; with C-u prefix arguments
(defun vis-yank-n-times (arg)
  "yank given number of times"
  (interactive "*p")
  (unless arg (setq arg 1))
  (dotimes (n arg)
    (yank)))

(provide 'vis-defun)
