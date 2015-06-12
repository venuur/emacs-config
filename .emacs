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

;; Solarized
(add-to-list 'custom-theme-load-path
	     "~/.emacs.d/emacs-color-theme-solarized/")
(load-theme 'solarized t)

;; Auto-Complete
(require 'auto-complete-config)
(ac-config-default)



