(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(show-paren-mode t))

(setq inhibit-splash-screen t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; tabs
(require 'tabbar)
(tabbar-mode t)
(global-set-key [(control shift tab)] 'tabbar-forward)
(global-set-key [(control meta shift tab)] 'tabbar-backward)

(put 'downcase-region 'disabled nil)

(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-snowish)))

(setenv "CL_SOURCE_REGISTRY"
 "(:source-registry
 (:tree \"/home/vfedotov/lisp/libs/\")
 (:tree \"/home/vfedotov/projects/\")
 :inherit-configuration)")

;;; SLIME setup
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;(setq inferior-lisp-program "/opt/mysbcl/bin/sbcl")
(setq inferior-lisp-program "/usr/bin/sbcl")
;(add-to-list 'load-path "/home/vfedotov/lisp/slime/")
(require 'slime)
(slime-setup '(slime-fancy slime-repl))
;; Setting for SLIME to handle utf8. 
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)
;; set variable for slime to show function tips while
;; evaluating time-consuming function.
(setq slime-inhibit-pipelining nil)

;;; closure-template-html-mode
(add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/cl-closure-template-20120305-git")
(require 'closure-template-html-mode)

;;; org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/newgtd.org"))
(setq org-agenda-start-on-weekday 1)
(setq calendar-week-start-day 1)
(setq org-refile-targets '(("~/org/newgtd.org" :maxlevel . 2)
			   ("~/org/someday.org" :maxlevel . 2)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "snow2" :foreground "darkslategray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Droid Sans Mono")))))



; Non-empty sub-sets of S
(defun nepowerset (S)
  (let ((x (car S)))
    (if (cdr S)
	(let ((y (nepowerset (remove x S))))
	  (append (list (list x)) 
		  (mapcar (lambda (e) (cons x e)) y)
		  y))
      (list (list x)))))
; Map Modifier-CyrillicLetter to the underlying Modifier-LatinLetter, so that
; control sequences can be used when keyboard mapping is changed outside of
; Emacs.
;
; For this to work correctly, .emacs must be encoded in the default coding
; system.
;
(mapcar* 
 (lambda (r e) ; R and E are matching Russian and English keysyms
   ; iterate over modifier subsets
   (mapc (lambda (mod)
	   (define-key input-decode-map 
	     (vector (append mod (list r))) (vector (append mod (list e)))))
	 (nepowerset '(control meta super hyper)))
   ; finally, if Russian key maps nowhere, remap it to the English key without
   ; any modifiers
   (define-key local-function-key-map (vector r) (vector e)))
   "йцукенгшщзхъфывапролджэячсмитьбю"
   "qwertyuiop[]asdfghjkl;'zxcvbnm,.")

;; to setup tabs
(setq c-basic-indent 2)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)




;; Magit
(autoload 'magit-status "magit" nil t)

;(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
;(setq-default tab-width 4) ; set tab width to 4 for all buffers
(setq-default c-basic-offset 4)