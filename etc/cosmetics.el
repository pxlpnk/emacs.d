(require 'ansi-color)
(require 'linum)

(setq ns-use-srgb-colorspace t)

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; (setq-default
;;  frame-title-format
;;  '(:eval
;;    (format "%s@%s:%s"
;;            (or (file-remote-p default-directory 'user) user-login-name)
;;            (or (file-remote-p default-directory 'host) system-name)
;;            (file-name-nondirectory (or (buffer-file-name) default-directory)))))

;; (setq inhibit-startup-message t          ;; don't show ...
;;   inhibit-startup-echo-area-message t)   ;; ... startup messages
(setq require-final-newline t)           ;; end files with a newline

;; (global-linum-mode t)
(menu-bar-mode  t)                       ;; show the menu...
(column-number-mode t)                   ;; show column numbers
(size-indication-mode t)                 ;; show file size (emacs 22+)
(tool-bar-mode -1)                       ;; turn-off toolbar

(set-face-attribute 'default nil :height 100)

(setq visible-bell 'top-bottom)

(scroll-bar-mode -1)

(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; (load-local-file "themes/molokai.el")
;; (load-local-file "themes/almost-monokai.el")
;;(color-theme-molokai)

;;(load-local-file "themes/color-theme-heroku.el")
;;(load-local-file "themes/mesa-theme.el")
;;(color-theme-heroku)
;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-light t)


(load-theme 'brin t)

;; powerline
;;(require 'powerline)
;; (setq powerline-color1 "#222")      ;; dark grey;
;; (setq powerline-color2 "#444")      ;; slightly lighter grey
;; (powerline-default-theme)

;; comments should have smaller font

(custom-set-faces
 '(font-lock-comment-face ((t (:height 0.8)))))
