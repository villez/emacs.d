;; mode-specific configs

;; hooks

(setq default-major-mode 'text-mode)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; Markdown
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

;; common config for all code modes
(defun vis-code-modes-common-hook ()
  (set (make-local-variable 'indent-tabs-mode) 'nil)
  (add-hook 'before-save-hook 'delete-trailing-whitespace nil t)
  (define-key (current-local-map) (kbd "RET") 'reindent-then-newline-and-indent)
  (linum-mode t)
  (turn-off-auto-fill)
  (setq linum-format "%d"))


;; C, C++
(defun vis-c-mode-hook ()
  (c-set-style "Stroustrup"))
(add-hook 'c-mode-common-hook 'vis-code-modes-common-hook)
(add-hook 'c-mode-common-hook 'vis-c-mode-hook)


;; Ruby
(setq ruby-indent-level 2)
(add-hook 'ruby-mode-hook 'vis-code-modes-common-hook)


;; RHTML - for ERB etc
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook 'vis-code-modes-common-hook)

;; HTML
(add-hook 'html-mode 'vis-code-modes-common-hook)

;; JavaScript
(setq js-indent-level 4)
(add-hook 'js-mode-hook 'vis-code-modes-common-hook)

;; CoffeeScript
(require 'coffee-mode)
(setq coffee-tab-width 2)
(add-hook 'coffee-mode-hook 'vis-code-modes-common-hook)

;; CPerl
(defalias 'perl-mode 'cperl-mode)
(add-hook 'perl-mode-hook 'vis-code-modes-common-hook)

;; Python
(add-hook 'python-mode-hook 'vis-code-modes-common-hook)

;; Java
(add-hook 'java-mode-hook 'vis-code-modes-common-hook)

;; Scala
(require 'scala-mode2)
(add-hook 'scala-mode2-hook 'vis-code-modes-common-hook)

;; shell scripts
(add-hook 'sh-mode-hook 'vis-code-modes-common-hook)

;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook 'vis-code-modes-common-hook)

;; CSS & SCSS
(setq css-indent-offset 4)
(add-hook 'css-mode-hook 'vis-code-modes-common-hook)
(add-hook 'scss-mode-hook 'vis-code-modes-common-hook)


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

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))


(provide 'vis-modes)
