;; appearance settings
;;
(setq initial-frame-alist (quote ((menu-bar-lines . 1) (width . 110) (height . 52))))
(setq visible-bell t)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(display-time)
(blink-cursor-mode -1)
(tool-bar-mode -1)
(set-fringe-mode '(4 . 0))
(set-variable 'font-lock-maximum-decoration t)

;; custom line number formatter:
;;   calculate the width of the largest line number & create
;;   a format string based on that which right-justifies the line #
(defun vis-linum-format-func (line)
  (let ((w (length
            (number-to-string (count-lines (point-min) (point-max))))))
    (propertize
     (format (concat (string ?%) (number-to-string w) "d ") line)
     'face 'linum)))

(setq linum-format 'vis-linum-format-func)

(provide 'vis-appearance)
