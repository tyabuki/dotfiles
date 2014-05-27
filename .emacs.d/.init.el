; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ------------------------------------------------------------------------
;; @ load-path

;;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
;;; load-pathに追加するフォルダ
; 2つ以上フォルダを指定する場合の引数 => (add-to-load-path "elisp" "xxx" "xxx")
(add-to-load-path "elisp")


;;; 外観
(require 'appearance) ; color themeやfont関連は，elisp/appearance.elで指定）

(setq-default line-spacing 0) ; 行間

(global-hl-line-mode) ; 現在の行を目立たせる
(setq hl-line-face 'underline) ; 目立たせるスタイル

;(global-highlight-changes-mode t) ; 変更箇所を目立たせる

(show-paren-mode t) ; 対応する括弧をハイライト
(setq show-paren-delay 0) ; 強調表示のディレイ
(setq show-paren-style 'expression) ; 括弧内全体を強調
;(set-face-background 'show-paren-match-face "#500") ; 括弧内の色

; コメントの色
;(set-face-foreground 'font-lock-comment-face "pink")
(set-face-foreground 'font-lock-comment-delimiter-face "pink")

(column-number-mode t) ; 何文字目か表示
(line-number-mode t) ; 何行目か表示
(global-linum-mode t) ; 左側に評判号を表示

; タイトルバーにファイルのフルパスを表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name))
)

(setq-default show-trailing-whitespace t) ; 行末の空白を強調表示
(set-face-background 'trailing-whitespace "#b14770") ; 強調表示の色  


;;; コード関連
(setq require-final-newline t) ; 末尾に必ず空行を挿入

(setq tab-width 4) ; tabの幅
(setq-default indent-tab-mod t) ; tabを挿入


;;; emacsの挙動関連
(setq initial-scratch-message "") ; scratchの初期メッセージ消去
(which-function-mode 1) ; 関数名を表示
(setq visible-bell t) ; beepの代わりにwindowをブリンクさせる
(setq vc-follow-symlinks t) ; 自動でsymlinkを辿る
(setq mouse-drag-copy-region t) ; マウス選択で直ちにコピー．23まではdefault，24からnil．
(fset 'yes-or-no-p 'y-or-n-p) ; yes or noをy or n

;;; helm
;(add-to-list 'load-path "~/dotfiles/.emacs.d/helm")
(add-to-load-path "helm")
(require 'helm-config)

;;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)

;;; rainbow-mode
(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'php-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)

;;; web-mode
(add-to-load-path "web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 1)
  (setq web-mode-script-padding 1)
  (setq web-mode-block-padding 0)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-block-face t)
  (setq web-mode-enable-part-face t)
)
(add-hook 'web-mode-hook 'web-mode-hook)

;;; load php-mode
;(add-to-list 'load-path "~/dotfiles/.emacs.d/php-mode")
(add-to-load-path "php-mode")
(require 'php-mode)
(setq php-mode-force-pear t)

;;; load markdown-mode
(require 'md)
;(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/elisp/md.el")))

;;; fly male
(require 'flymake-conf)

;;; auto-complete
(add-to-load-path "auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/dotfiles/.emacs.d/auto-complete-1.3.1/dict")
(ac-config-default)

