(require 'color-theme-sanityinc-tomorrow)

(load-theme 'material t)
;(load-theme 'sanityinc-tomorrow-night t)
(setq-default show-trailing-whitespace nil)

(require 'ansi-color)

(setq ns-use-srgb-colorspace t)

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(setq require-final-newline t)
(menu-bar-mode  t)                       ;; show the menu...
(column-number-mode t)                   ;; show column numbers
(size-indication-mode t)                 ;; show file size (emacs 22+)
(tool-bar-mode -1)                       ;; turn-off toolbar

(set-face-attribute 'default nil :height 100)
(setq visible-bell 'top-bottom)
(scroll-bar-mode -1)

;; comments should have smaller font

(custom-set-faces
 '(font-lock-comment-face ((t (:height 0.8)))))

(require 'git-gutter)
(global-git-gutter-mode +1)

(setq initial-buffer-choice "~/Dropbox/org/p/gtd.org")
