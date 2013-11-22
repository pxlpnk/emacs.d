(require 'git-gutter)

(add-hook 'enh-ruby-mode-hook 'git-gutter-mode)

;; bind git-gutter toggle command
(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)

(setq git-gutter:window-width 2)
(setq git-gutter:update-hooks '(after-save-hook after-revert-hook))

(setq git-gutter:modified-sign "  ") ;; two space
(setq git-gutter:added-sign "++")    ;; multiple character is OK
(setq git-gutter:deleted-sign "--")



(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")
