;; text expander style macros

(defun text-insert-date()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun text-insert-time()
  (interactive)
  (insert (format-time-string "%R")))

(defun text-insert-datetime ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %R")))


(provide 'vis-insert-macros)
