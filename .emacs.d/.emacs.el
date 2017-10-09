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
