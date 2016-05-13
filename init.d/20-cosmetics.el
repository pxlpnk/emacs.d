(require 'color-theme-sanityinc-tomorrow)

(load-theme 'material t)
;(load-theme 'sanityinc-tomorrow-night t)
(setq-default show-trailing-whitespace nil)

(require 'ansi-color)

(setq ns-use-srgb-colorspace t)

(beacon-mode 1)

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(setq require-final-newline t)
(menu-bar-mode t)                       ;; show the menu...
(column-number-mode t)                   ;; show column numbers
(size-indication-mode t)                 ;; show file size (emacs 22+)
(tool-bar-mode -1)                       ;; turn-off toolbar

(set-face-attribute 'default nil :height 120)
(setq visible-bell t)
(setq ns-visual-bell-size 2)

(scroll-bar-mode -1)

;; comments should have smaller font

(custom-set-faces
 '(font-lock-comment-face ((t (:height 0.8)))))

(when (eq system-type 'darwin)
      (set-default-font "-*-Hack-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))

(global-hl-line-mode t)

(require 'git-gutter)
(global-git-gutter-mode +1)

;; (setq initial-buffer-choice "~/Dropbox/org/p/gtd.org")
;; (setq initial-buffer-choice nil)
(setq inhibit-startup-screen t)
