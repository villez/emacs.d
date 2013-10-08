;; basic appearance settings
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

(set-variable 'font-lock-maximum-decoration t)

(provide 'vis-appearance)
