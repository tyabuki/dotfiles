;;; Markdown mode
(add-to-load-path "markdown-mode")
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;;; Markdownの見出し検索
(defun markdown-header-list ()
  "Show Markdown Formed Header list through temporary buffer."
  (interactive)
  (occur "^\\(#+\\|.*\n===+\\|.*\n\---+\\)")
  (other-window 1))
(require 'markdown-mode)
(define-key markdown-mode-map "\C-c\C-s" 'markdown-header-list)
