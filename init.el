;; init.el
;;
;; (c) 2013 Ville Siltanen


;; set up directories
(defvar vis-emacs-config-dir (file-name-directory load-file-name))
(defvar vis-private-dir (concat vis-emacs-config-dir "private"))
(defvar vis-vendor-dir (concat vis-emacs-config-dir "vendor"))

;; setting up load path
(add-to-list 'load-path vis-emacs-config-dir)
(add-to-list 'load-path vis-private-dir)
(add-to-list 'load-path vis-vendor-dir)
(dolist
    (vendor-pkg (directory-files vis-vendor-dir t "\\w+"))
  (when (file-directory-p vendor-pkg)
    (add-to-list 'load-path vendor-pkg)))

(setq custom-file (concat vis-emacs-config-dir "custom.el"))

; helper function to check if online
(require 'cl)
(defun esk-online? ()
  (if (and (functionp 'network-interface-list)
           (network-interface-list))
      (some (lambda (iface) (unless (equal "lo" (car iface))
			      (member 'up (first (last (network-interface-info
							(car iface)))))))
            (network-interface-list))
    t))

; set up and update package repositories
(setq package-user-dir (concat vis-emacs-config-dir "elpa"))
(require 'package)
(setq package-archives
      '(("melpa" . "http://melpa/milkbox.net/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("elpa" . "http://tromey.com/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(when (esk-online?)
  (unless package-archive-contents (package-refresh-contents)))

(dolist (required-pkg
	 '(coffee-mode
	   haml-mode
	   markdown-mode
	   php-mode
	   scss-mode
	   yaml-mode))
	 (when (not (package-installed-p required-pkg))
	   (package-install required-pkg)))

; set up and load all config modules
(dolist (module
	 '(vis-basic-settings
	   vis-os-settings
	   vis-keybindings
	   vis-appearance
	   vis-color-theme
	   vis-defun
	   vis-insert-macros
	   vis-modes))
  (require module))


; load private stuff
(when (file-exists-p vis-private-dir)
  (mapc 'load (directory-files vis-private-dir 't "^[^#].*el$")))

;; load standard fileset and start server
(desktop-change-dir "~/doc")
(server-start)
