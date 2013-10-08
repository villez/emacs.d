;; text expander style macros

(defun vis-text-insert-date()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun vis-text-insert-time()
  (interactive)
  (insert (format-time-string "%R")))

(defun vis-text-insert-datetime ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %R")))


(provide 'vis-insert-macros)
