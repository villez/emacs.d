;; Customized Tomorrow Theme ("vis-tomorrow-theme")
;;
;; Originally by Chris Kempson https://github.com/ChrisKempson/Tomorrow-Theme
;; Ported to GNU Emacs by Chris Charles
;; Ported to GNU Emacs 24's built-in theme system by Jim Myhrberg (@jimeh)
;; customized by Ville Siltanen

(deftheme vis-tomorrow
  "Customized Tomorrow Theme")

(let (
      (background "#fdf8e9")
      (current-line "#e9efff")
      (modeline-bg "#d0d0d0")
      (modeline-fg "#2a2a2a")
      (linum-bg "#e7e7f0")
      (selection "#c5cce9")
      (foreground "#4d4d4c")
      (comment "#6c5050")
      (cursor "#2f2f2f")
      (red "#c82829")
      (orange "#f5871f")
      (yellow "#daa700")
      (green "#718c00")
      (aqua "#3e999f")
      (blue "#4271ae")
      (purple "#8959a8"))

  (custom-theme-set-faces
   'vis-tomorrow

   ;; Built-in stuff (Emacs 23)
   `(default ((t (:background ,background :foreground ,foreground))))
   `(fringe ((t (:background ,background))))
   `(minibuffer-prompt ((t (:foreground ,blue))))
   `(mode-line ((t (:background ,modeline-bg :foreground ,modeline-fg))))
   `(region ((t (:background ,selection))))
   `(cursor ((t (:background ,cursor :foreground ,background))))

   ;; Font-lock stuff
   `(font-lock-comment-face ((t (:foreground ,comment))))
   `(font-lock-constant-face ((t (:foreground ,green))))
   `(font-lock-doc-string-face ((t (:foreground ,comment))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,purple))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,red))))
   `(font-lock-warning-face ((t (:foreground ,red))))

   ;; hl-line-mode
   `(hl-line ((t (:background ,current-line))))

   ;; linum-mode
   `(linum ((t (:background ,linum-bg :foreground ,foreground))))

   ;; org-mode
   `(org-date ((t (:foreground ,purple))))
   `(org-done ((t (:foreground ,green))))
   `(org-hide ((t (:foreground ,current-line))))
   `(org-link ((t (:foreground ,blue))))
   `(org-todo ((t (:foreground ,red))))

   ;; show-paren-mode
   `(show-paren-match ((t (:background ,blue :foreground ,current-line))))
   `(show-paren-mismatch ((t (:background ,orange :foreground ,current-line)))))

  (custom-theme-set-variables
   'vis-tomorrow

   `(ansi-color-names-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [unspecified ,background ,red ,green ,yellow ,blue ,purple ,blue ,foreground])))

(provide-theme 'vis-tomorrow)
