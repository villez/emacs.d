(when (eq system-type 'darwin)
  (setq default-input-method "MacOSX")
  (setq mac-option-modifier nil)
  (setq mac-command-modifier 'meta)
  (setq x-select-enable-clipboard t)
  (set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal))

(provide 'vis-os-settings)
