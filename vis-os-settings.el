(when (eq system-type 'darwin)
  (setq default-input-method "MacOSX")
  (setq mac-option-modifier nil)
  (setq mac-command-modifier 'meta)
  (setq x-select-enable-clipboard t)
  )

(provide 'vis-os-settings)
