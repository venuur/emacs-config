(setq inhibit-startup-screen t)

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

(my-package-install 'scala-mode2)
(my-package-install 'sbt-mode)
