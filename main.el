(require 'org-tempo)
(add-hook 'org-mode-hook #'visual-line-mode)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))
(setq org-confirm-babel-evaluate nil)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq python-shell-interpreter
      "~/AppData/Local/Continuum/anaconda2/python.exe")
(setq org-babel-python-command python-shell-interpreter)
(setq python-shell-unbuffered nil)
(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list 'python-shell-completion-native-disabled-interpreters "python.exe")))
(load "abbrev.el")
