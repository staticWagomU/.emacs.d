;;; init.el --- My init.el  -*- lexical-binding: t; -*-
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode 1)
(setq ring-bell-function 'ignore)
(set-face-attribute 'default nil
  :family "HackGen Console NF"
  :height 130)


(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("org"   . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu"   . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

(leaf doom-themes
  :ensure t
  :init (load-theme 'doom-dracula t))

(leaf doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(leaf paredit
  :ensure t
  :hook (emacs-lisp-mode-hook . enable-paredit-mode))

