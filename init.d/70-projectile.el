(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "M-p") 'helm-projectile-find-file)
(global-set-key (kbd "M-b") 'helm-projectile-switch-to-buffer)
(global-set-key (kbd "M-b") 'helm-projectile-switch-to-buffer)
(global-set-key (kbd "H-G") 'at/helm-projectile-ag)

(require 'projectile)
(projectile-global-mode)
;; (setq projectile-enable-caching t)
(setq projectile-indexing-method 'alien)
(setq projectile-completon-system 'helm)
(require 'helm-projectile)
(helm-projectile-on)
