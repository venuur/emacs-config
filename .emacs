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
(my-package-install 'scala-mode2)
(my-package-install 'sbt-mode)
(my-package-install 'auto-complete)
(my-package-install 'fuzzy)

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
(load-file "/usr/share/emacs/site-lisp/ess-site.el")

;; Adjust indent to match Google R coding standard.
(defun my-ess-hook ()
  (setq ess-indent-level 2))
(add-hook 'ess-mode-hook
	  'my-ess-hook)
