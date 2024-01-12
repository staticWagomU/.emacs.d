;; emacsでやりたいこと
;; - 書きもの
;;   - org-mod
;;   - ブログ執筆
;; lspはいらないが、text-lintは必要になりそう

;; leaf.elのインストールコード
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
        :init
        ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
        (leaf hydra :ensure t)
        (leaf el-get :ensure t)
        (leaf blackout :ensure t)

        :config
        ;; initialize leaf-keywords.el
        (leaf-keywords-init)))

;; ここにいっぱい設定を書く
(leaf leaf
      :config
      (leaf leaf-convert :ensure t)
      (leaf leaf-tree
            :ensure t
            :custom ((imenu-list-size . 30)
                     (imenu-list-position . 'left))))
(leaf macrostep
      :ensure t
      :bind (("C-c e" . macrostep-expand)))

(leaf magit
  :ensure t)
(leaf ddskk
  :ensure t
  :leaf-defer t
  :bind (("C-x C-o" . skk-mode)))

(provide 'init)
;; Disable toolbar
(tool-bar-mode -1)
;; Disable scrollbar
(scroll-bar-mode -1)
;; Disable file dialog
(setq use-file-dialog nil)
(setq default-frame-alist initial-frame-alist)

;; 作業フォルダを ~/ にする
(setq default-directory "C:/Users/wagomu/")
(setq command-line-default-directory "C:/Users/wagomu/")

;; フォント
(set-face-attribute 'default nil :family "HackGen Console NF" :height 110)
(set-fontset-font nil '(#x80 . #x10ffff) (font-spec :family "MS Gothic"))
(setq use-default-font-for-symbols nil)
(iswitchb-mode t)

(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
