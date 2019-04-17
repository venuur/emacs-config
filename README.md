# emacs-config
The goal of this repository is to create a Spacemacs configuration file that I can clone any time.

# Usage

* Add the following lines to `dotspacemacs-configuration-layers`:

```
javascript
csv
python
html
markdown
helm
auto-completion
emacs-lisp
git
```

* Add the following line to `dotspacemacs/user-config`:

```
(load "~/emacs-config/main.el")
```
