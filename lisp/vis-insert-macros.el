;; text inserting macros


;; inserting current date, time, or both

(defun vis-text-insert-date()
  "insert the current date in yyyy-mm-dd format"
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun vis-text-insert-time()
  "insert the current time in 24H format"
  (interactive)
  (insert (format-time-string "%R")))

(defun vis-text-insert-datetime ()
  "insert the current date and time"
  (interactive)
  (insert (format-time-string "%Y-%m-%d %R")))


;; inserting a C/C++ include guard of the form:
;; [beginning-of-buffer]
;; #ifndef FILE_BASENAME_H"
;; #define FILE_BASENAME_H
;; ...
;; #endif
;; [end of buffer]
 
(defun vis-c-insert-include-guard()
  "insert a C/C++ include guard
    #ifndef FOO_H
    #define FOO_H
    #endif"
  (interactive)
  (let ((guard-str
         (concat
          (replace-regexp-in-string "[.-]" "_"
                                    (upcase (file-name-sans-extension (buffer-name))))
          "_H")))
    (save-excursion
      (beginning-of-buffer)
      (insert (concat "#ifndef " guard-str "\n"))
      (insert (concat "#define " guard-str "\n"))
      (end-of-buffer)
      (insert "\n#endif\n"))))

(provide 'vis-insert-macros)
