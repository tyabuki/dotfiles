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


;;; 表示関連
; Solarizedテーマの適用
;(add-to-list 'custom-theme-load-path "~/.emacs.d/solarized-emacs")
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized-dark t) ; または(load-theme 'solarized-light t)

;; フォントの指定（Solarizedテーマ適用時にcocoa版でコメントが豆腐化するのを防止）
; ！！フォント指定は改めて調整中！！（これがあるとTerminal版で動かない）
;(when (x-list-fonts "Ricty")
;  (let* ((size 14)
;         (asciifont "Ricty")
;         (jpfont "Ricty")
;         (h (* size 10))
;         (fontspec)
;         (jp-fontspec))
;    (set-face-attribute 'default nil :family asciifont :height h)
;    (setq fontspec (font-spec :family asciifont))
;    (setq jp-fontspec (font-spec :family jpfont))
;    (set-fontset-font nil 'japanese-jisx0208 jp-fontspec)
;    (set-fontset-font nil 'japanese-jisx0212 jp-fontspec)
;    (set-fontset-font nil 'japanese-jisx0213-1 jp-fontspec)
;    (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
;    (set-fontset-font nil '(#x0080 . #x024F) fontspec)
;    (set-fontset-font nil '(#x0370 . #x03FF) fontspec))
;)

(setq-default line-spacing 0) ; 行間

(global-hl-line-mode) ; 現在の行を目立たせる
(setq hl-line-face 'underline) ; 目立たせるスタイル

(global-highlight-changes-mode t) ; 変更箇所を目立たせる

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
;(set-face-background 'trailing-whitespace "#b14770") ; 強調表示の色


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
(add-to-list 'load-path ".emacs.d/helm")
(require 'helm-config)

;;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)

;;; load markdown-mode
(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/elisp/md.el")))


