;;; Global configurations.
(let ((faces '((font-lock-comment-face :foreground "#4d7a70" :slant italic)
               (font-lock-constant-face :foreground "#6b7875")
               (font-lock-string-face :foreground "#7a633d")
               (font-lock-type-face :foreground "grey50")
               (font-lock-warning-face :foreground "#cd5c5c")
               (font-lock-preprocessor-face :foreground "#596766" :weight bold)
               (font-lock-doc-face :foreground "#707f75" :slant italic)
               (font-lock-keyword-face :foreground "#665d9c" :weight bold)
               (font-lock-builtin-face :foreground "gray50" :weight bold)
               (font-lock-function-name-face :foreground "#2e5fa2" :weight bold)
               (font-lock-variable-name-face :foreground "#6f5057" :weight bold)
               (mode-line  :background "#bedefe" :box (:line-width 2 :color "gray85")))))
  (dolist (face faces)
    (apply 'set-face-attribute (car face) nil (cdr face)))
  (add-to-list 'default-frame-alist '(font . "Triplicate T4c"))
  (set-face-attribute 'default t :font "Triplicate T4c"))

;; Julia
(add-to-list 'load-path
	     "C:/Users/carlmorris/personal/julia-emacs")
(require 'julia-mode)


;; recent files list
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode 1)))
(setq fci-rule-column 92)
(add-hook 'after-change-major-mode-hook 'fci-mode)
(global-company-mode)

;;; Org Mode 
(setq python-shell-unbuffered nil)
(defun cm-org-hook ()
  ;; Add support for elegantnote LaTeX class.
  (with-eval-after-load 'ox-latex
    (add-to-list 'org-latex-classes
                 '("elegantnote"
                   "\\documentclass[en]{elegantnote}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
  (setq org-babel-python-command python-shell-interpreter)
  (setq org-confirm-babel-evaluate nil)
  )

(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'org-mode-hook #'cm-org-hook)


;;; Python Mode
(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list 'python-shell-completion-native-disabled-interpreters "python.exe")))

;;; Company Mode
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)
(setq company-idle-delay 0.1)
(setq company-show-numbers t)

;;; Markdown Mode
(add-hook 'markdown-mode-hook
          (lambda ()
            (custom-set-faces '(markdown-code-face ((t (:family "Triplicate T4c")))))))

;;; Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(load "abbrev.el")
