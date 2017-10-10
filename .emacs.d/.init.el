;; Japanese
(set-language-environment 'Japanese)    ; 日本語環境
(set-default-coding-systems 'utf-8-unix)    ; UTF-8 が基本
(set-terminal-coding-system 'utf-8-unix)    ; emacs -nw も文字化けしない
(setq default-file-name-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(prefer-coding-system 'utf-8-unix)


;; Package initialize
(package-initialize)

;; Show Line
(global-linum-mode t)

;; diable show startup-message
(setq inhibit-startup-message t)

;; Color
(global-font-lock-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

;; highlight paren
(show-paren-mode t)

;; highlight selected area
(transient-mark-mode t)

;; disable beep
(setq ring-bell-function 'ignore)
