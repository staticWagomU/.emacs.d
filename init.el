;;; init.el --- My init.el  -*- lexical-binding: t; -*-
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))
  
    :config
    (leaf-keywords-init))

(leaf leaf-tree :ensure t)

(leaf leaf-convert
  :ensure t
  :config (leaf use-package :ensure t))

(leaf transient-dwim
  :ensure t
  :bind (("M-=" . transient-dwim-dispatch)))

(leaf magit :ensure t)

(leaf ddskk
  :ensure t
  :custom ((default-input-method . "japanese-skk"))
  :config
  (global-set-key (kbd "C-j") 'skk-mode)
  (leaf ddskk-postframe
    :ensure t
    :global-minor-mode t))

(leaf doom-themes
  :custom ((doom-themes-enable-italic . t)
           (doom-themes-enable-bold .t))
  :require t
  :config
  (load-theme 'doom-dracula t)
  (doom-themes-org-config))

(leaf puni
  :ensure t
  :config
  (global-set-key (kbd "C-c v i") 'puni-mark-list-around-point)
  (global-set-key (kbd "C-c v a") 'puni-mark-sexp-around-point)
  (global-set-key (kbd "C-c v v") 'puni-expand-region))

;; You can also configure builtin package via leaf!
(leaf cus-start
  :doc "define customization properties of builtins"
  :tag "builtin" "internal"
  :custom ((truncate-lines . t)
           (menu-bar-mode . t)
           (tool-bar-mode . nil)
           (scroll-bar-mode . nil)
           (indent-tabs-mode . nil)
           (line-number-mode . t)
           (column-number-mode .t)
           (global-display-line-numbers-mode . nil)
           (set-language-enviroment "Japanese")
           (set-terminal-coding-system 'utf-8-unix)
           (prefer-coding-system 'utf-8-unix)
           (set-clipboard-coding-system 'utf-8)))

;; key binds
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-t") 'other-window)
(global-set-key (kbd "C-c n") 'global-display-line-numbers-mode)


;; display fullpath on title bar
(setq-default frame-title-format "%f")

(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

(setq auto-save-timeout 15)
(setq auto-save-interval 60)

(global-auto-revert-mode t)

(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode 1)
(setq ring-bell-function 'ignore)
(set-face-attribute 'default nil
  :family "HackGen Console NF"
  :height 130)
(setenv "PATH" (shell-command-to-string "echo $PATH"))
(cl-loop for x
         in (reverse (split-string (substring (shell-command-to-string "echo $PATH") 0 -1) ":"))
         do (add-to-list 'exec-path x))
(setq default-directory "~/")

(setenv "PATH" (shell-command-to-string "echo $PATH"))

(cl-loop for x
	 in (reverse (split-string (substring (shell-command-to-string "echo $PATH") 0 -1) ":"))
	 do (add-to-list 'exec-path x))

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
    (leaf-keywords-init)))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

(leaf doom-themes
  :ensure t
  :init (load-theme 'doom-dracula t))

; (leaf doom-modeline
;   :ensure t
;   :init (doom-modeline-mode 1))

(leaf doom-modeline
  :ensure t
  :custom
  ((doom-modeline-buffer-file-name-style . 'truncate-with-project)
   (doom-modeline-icon . t)
   (doom-modeline-major-mode-icon . nil)
   (doom-modeline-minor-modes . nil))
  :init (doom-modeline-mode 1))
  :hook
  (after-init-hook . doom-modeline-mode)
  :config
  (line-number-mode 0)
  (column-number-mode 0)
  (doom-modeline-def-modeline 'main
    '(bar workspace-number window-number evil-state god-state ryo-modal xah-fly-keys matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker)))

(leaf paredit
  :ensure t
  :hook (emacs-lisp-mode-hook . enable-paredit-mode))

(leaf undo-tree
  :ensure t
  :init (global-undo-tree-mode))

(leaf amx
  :ensure t)

(leaf which-key
  :ensure t
  :init (which-key-mode))

(leaf neotree
  :ensure t
  :config (setq neo-theme 'arrow ))

(leaf lsp-ui
  :ensure t
  :hook (lsp-mode-hook . lsp-ui-mode))

(leaf lsp-mode
  :ensure t)

(leaf typescript-mode
  :ensure t
  :hook (typescript-mode-hook . lsp))

(leaf go-mode
  :ensure t
  :hook (go-mode-hook . lsp))

(leaf company
  :ensure t
  :init (global-company-mode))

