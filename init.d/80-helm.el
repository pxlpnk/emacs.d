(require 'helm-config)
(helm-mode 1)
(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           nil ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-ff-file-name-history-use-recentf t)

(require 'helm-ag)
(defun at/helm-projectile-ag ()
  (interactive)
  (helm-do-ag (projectile-project-root)))
