;; mode-specific configs


;; hooks

;; Markdown mode
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

;; common hook for all code modes
(add-hook 'vis-code-modes-hook
	  (lambda() 
	    (add-hook 'before-save-hook 'delete-trailing-whitespace nil t)
	    (define-key (current-local-map) (kbd "RET") 'reindent-then-newline-and-indent)
	    (linum-mode t)
	    (setq linum-format "%d")))

;; C mode
(defun vis-c-mode-common-hook ()
  (c-set-style "Stroustrup")
  (setq indent-tabs-mode nil))

(add-hook 'c-mode-common-hook 'vis-c-mode-common-hook)
(add-hook 'c-mode-common-hook
	  (lambda() (run-hooks 'vis-code-modes-hook)))

;;;
;;; Ruby Mode
;;;
(defun vis-ruby-mode-common-hook ()
  (set (make-local-variable 'indent-tabs-mode) 'nil)
  (set (make-local-variable 'tab-width) 2)
  )

(add-hook 'ruby-mode-hook 'vis-ruby-mode-common-hook)  
(add-hook 'ruby-mode-hook
	  (lambda() (run-hooks 'vis-code-modes-hook)))


;;; RHTML mode for ERB etc
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook 'turn-off-auto-fill)

;;; 
;;; XHTML mode
(add-hook 'html-mode 'turn-off-auto-fill)

;;; CoffeeScript Mode
(require 'coffee-mode)
(defun vis-coffee-mode-common-hook ()
  (set (make-local-variable 'indent-tabs-mode) 'nil)
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook 'vis-coffee-mode-common-hook)
(add-hook 'coffee-mode-hook 
	  (lambda() (run-hooks 'vis-code-modes-hook)))

;;; Perl Mode
;;; (defalias 'perl-mode 'cperl-mode) - should move to this...
(add-hook 'perl-mode-hook
	  (lambda() (run-hooks 'vis-code-modes-hook)))

;; Python Mode
(add-hook 'python-mode-hook
	  (lambda() (run-hooks 'vis-code-modes-hook)))

;; Java Mode
(add-hook 'java-mode-hook
	  (lambda() (run-hooks 'vis-code-modes-hook)))

;; Scala Mode 2
(require 'scala-mode2)
(add-hook 'scala-mode2-hook
	  (lambda() (run-hooks 'vis-code-modes-hook)))


;;; automodes

; markdown
(autoload 'markdown-mode "markdown-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

; ruby etc
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))


(provide 'vis-modes)
