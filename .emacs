(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(show-paren-mode t))

(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;(add-to-list 'load-path "/path/to/highlight-parentheses")
(require 'highlight-parentheses)

;; tabs
(require 'tabbar)
(tabbar-mode t)
(global-set-key [(control shift tab)] 'tabbar-forward)
(global-set-key [(control meta shift tab)] 'tabbar-backward)

(setenv "CL_SOURCE_REGISTRY"
 "(:source-registry
 (:tree \"/home/vfedotov/lisp/libs/\")
 (:tree \"/home/vfedotov/projects/\")
 :inherit-configuration)")

;(setq inferior-lisp-program "/home/vfedotov/local/bin/sbcl") ; your Lisp system
;(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
(add-to-list 'load-path "~/lisp/slime/")  ; your SLIME directory
(require 'slime)
(slime-setup '(slime-fancy slime-repl))


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gainsboro" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Droid Sans Mono")))))

;; Setting for SLIME to handle utf8.
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)
(setq slime-inhibit-pipelining nil)

(require 'color-theme)

(defun color-theme-inkpot ()
 "Color theme based on the Inkpot theme. Ported and tweaked by Per Vognsen."
 (interactive)
 (color-theme-install
  '(color-theme-inkpot
	  ((foreground-color . "#cfbfad")
	   (background-color . "#1e1e27")
	   (border-color . "#3e3e5e")
	   (cursor-color . "#404040")
	   (background-mode . dark))
	  (region ((t (:background "#404040"))))
	  (highlight ((t (:background "#404040"))))
	  (fringe ((t (:background "#16161b"))))
	  (show-paren-match-face ((t (:background "#606060"))))
	  (isearch ((t (:bold t :foreground "#303030" :background "#cd8b60"))))
	  (modeline ((t (:bold t :foreground "#b9b9b9" :background "#3e3e5e"))))
	  (modeline-inactive ((t (:foreground "#708090" :background "#3e3e5e"))))
	  (modeline-buffer-id ((t (:bold t :foreground "#b9b9b9" :background "#3e3e5e"))))
	  (minibuffer-prompt ((t (:bold t :foreground "#708090"))))
	  (font-lock-builtin-face ((t (:foreground "#c080d0"))))
	  (font-lock-comment-face ((t (:foreground "#708090")))) ; original inkpot: #cd8b00
	  (font-lock-constant-face ((t (:foreground "#506dbd"))))
	  (font-lock-doc-face ((t (:foreground "#cd8b00"))))
	  (font-lock-function-name-face ((t (:foreground "#87cefa"))))
	  (font-lock-keyword-face ((t (:bold t :foreground "#c080d0"))))
  (font-lock-preprocessor-face ((t (:foreground "309090"))))
  (font-lock-reference-face ((t (:bold t :foreground "#808bed"))))
  (font-lock-string-face ((t (:foreground "#ffcd8b" :background "#404040"))))
	(font-lock-type-face ((t (:foreground "#ff8bff"))))
(font-lock-variable-name-face ((t nil)))
	(font-lock-warning-face ((t (:foreground "#ffffff" :background "#ff0000")))))))

(eval-after-load "color-theme"
  '(progn
     (color-theme-bharadwaj)))


(put 'downcase-region 'disabled nil)
