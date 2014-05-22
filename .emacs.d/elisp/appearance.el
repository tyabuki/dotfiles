;;; 表示関連

; Solarizedテーマの適用
;(add-to-list 'custom-theme-load-path "~/.emacs.d/solarized-emacs")
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized-dark t) ; または(load-theme 'solarized-light t)

;;; 
(if (display-graphic-p)
    (progn
      ;; use a window system such as X
      ; フォントの指定（Solarizedテーマ適用時にcocoa版でコメントが豆腐化するのを防止）
      (when (x-list-fonts "Ricty")
	(let* ((size 14)
	       (asciifont "Ricty")
	       (jpfont "Ricty")
	       (h (* size 10))
	       (fontspec)
	       (jp-fontspec))
	  (set-face-attribute 'default nil :family asciifont :height h)
	  (setq fontspec (font-spec :family asciifont))
	  (setq jp-fontspec (font-spec :family jpfont))
	  (set-fontset-font nil 'japanese-jisx0208 jp-fontspec)
	  (set-fontset-font nil 'japanese-jisx0212 jp-fontspec)
	  (set-fontset-font nil 'japanese-jisx0213-1 jp-fontspec)
	  (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
	  (set-fontset-font nil '(#x0080 . #x024F) fontspec)
	  (set-fontset-font nil '(#x0370 . #x03FF) fontspec))
	)
      )
      ;; text-olny terminal
      
)


(provide 'appearance)
