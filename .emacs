
;; 表示関連
(setq hl-line-face 'underline)
(global-hl-line-mode) ; 行を目立たせる
(global-highlight-changes-mode t) ; 変更箇所を目立たせる

(show-paren-mode 1) ; 対応する括弧をハイライト

(set-face-foreground 'font-lock-comment-face "pink")
(set-face-foreground 'font-lock-comment-delimiter-face "pink")

(column-number-mode t) ; 何文字目か表示
(line-number-mode t) ; 何行目か表示


;; コード関連
(setq require-final-newline t) ; 末尾に必ず空行を挿入

(setq tab-width 4) ; tabの幅
(setq-default indent-tab-mod t) ; tabを挿入


;; emacsの挙動関連
(which-function-mode 1) ; 関数名を表示
(setq visible-bell t) ; beepの代わりにwindowをブリンクさせる
(setq vc-follow-symlinks t) ; 自動でsymlinkを辿る
