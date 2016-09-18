(setq inhibit-startup-screen t)

;; Package Installation
(require 'package)
(package-initialize)

(setq my-is-connected-to-melpa nil)
(defun my-connect-to-melpa ()
  "Connects to the MELPA package repository."
  (add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     t)
  (package-initialize))

(defun my-package-install (target-package)
  "Checks to see whether target-package is installed, and if not, it installs the package."
  (unless (package-installed-p target-package)
    (unless my-is-connected-to-melpa
      (my-connect-to-melpa)
      (setq my-is-connected-to-melpa t))
    (package-refresh-contents)
    (package-install target-package)))

;; Install Packages
;; (my-package-install 'scala-mode2)
(my-package-install 'sbt-mode)
(my-package-install 'auto-complete)
(my-package-install 'fuzzy)
(my-package-install 'autopair)
(my-package-install 'ess)

;; Solarized
(add-to-list 'custom-theme-load-path
	     "~/.emacs.d/emacs-color-theme-solarized/")
(load-theme 'solarized t)
(setq frame-background-mode 'dark)
(enable-theme 'solarized)

;; Auto-Complete: Add new auto-complete words to a file ~/.dict, one
;; word per line.  After adding new words it is best to run `M-x
;; ac-clear-dictionary-cache` to reload dictionaries.
(require 'auto-complete-config)
(ac-config-default)

(global-set-key (kbd "C-c \t") 'ac-fuzzy-complete)

;; Require R for
(require 'ess-site)

;; Adjust indent to match Google R coding standard.
(defun my-ess-hook ()
  (setq ess-indent-level 2)
  (setq autopair-mode t))
(add-hook 'ess-mode-hook
	  'my-ess-hook)

;; AUCTeX
(setq-default TeX-master nil)
(setq TeX-parse-self t)		   	;Enable parse on load.
(setq TeX-auto-save t)			;Enable parse on save.

(defun my-auctex-hook ()
  "My customizations for AUCTeX."
  (LaTeX-add-environments
   '("IEEEeqnarray" LaTeX-env-label)
   '("equation" LaTeX-env-label)
   '("multline" LaTeX-env-label)
   '("dcases" LaTeX-env-label))
  (setq visual-line-mode t)
  (setq flyspell-mode t)
  (setq LaTeX-math-mode t)
  (setq autopair-mode t))

(add-hook 'LaTeX-mode-hook 'my-auctex-hook)

;; (setq font-latex-math-environments
;; 	(quote ("IEEEeqnarray"
;; 		"equation",
;; 		"multline")))

(require 'autopair)

