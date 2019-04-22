
;;; Org Mode
(require 'org-tempo)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq python-shell-interpreter
      ;; Handle tilde expansion.
      (expand-file-name "~/AppData/Local/Continuum/anaconda2/python.exe"))

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


(load "abbrev.el")
