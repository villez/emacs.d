;; mode-specific configs

(setq default-major-mode 'text-mode)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; Markdown
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)
(add-hook 'markdown-mode-hook
          (lambda ()
            (local-unset-key (kbd "M-<left>"))     ; don't want these promotion/
            (local-unset-key (kbd "M-<right>"))))  ; demotion bindings

(defun vis-add-hooks (modes func)
  (dolist (mode modes)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook")) func)))

;; common config for all code modes
(defun vis-code-modes-common-hook ()
  (set (make-local-variable 'indent-tabs-mode) 'nil)
  (define-key (current-local-map) (kbd "RET") 'reindent-then-newline-and-indent)
  (linum-mode t)
  (turn-off-auto-fill))

(defun vis-remove-ws-on-save ()
  (add-hook 'before-save-hook 'delete-trailing-whitespace nil 'local))

(setq vis-code-modes
 '(c ruby rhtml html js2 perl python java sh emacs-lisp css scss haskell clojure))

(vis-add-hooks vis-code-modes 'vis-code-modes-common-hook)
(vis-add-hooks vis-code-modes 'vis-remove-ws-on-save)


;; C, C++
(defun vis-c-mode-hook ()
  (c-set-style "Stroustrup"))
(add-hook 'c-mode-common-hook 'vis-c-mode-hook)

;; Ruby
(setq ruby-indent-level 2)

;; RHTML - for ERB etc
(require 'rhtml-mode)

;; JavaScript
(setq js-indent-level 2)

;; CPerl
(defalias 'perl-mode 'cperl-mode)

;; CSS & SCSS
(setq css-indent-offset 4)
(setq scss-compile-at-save nil)

;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Clojure
(require 'clojure-mode-extra-font-locking)

;; currently no mode-specific configurations but here as placeholder,
;; these are the other programming modes in use:
;; HTML, Python, Java, shell, Emacs Lisp


;;; automodes

; markdown
(autoload 'markdown-mode "markdown-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

; programming languages
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))


(provide 'vis-modes)
