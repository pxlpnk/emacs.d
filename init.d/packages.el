(use-package exec-path-from-shell
  :ensure t
  :config
  (progn
    (exec-path-from-shell-copy-env "GOPATH")
    (when (memq window-system '(mac ns x))
      (exec-path-from-shell-initialize))))




(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (smartparens-global-strict-mode 1)))
(use-package rainbow-delimiters)

(use-package helm)
(use-package projectile)
(use-package undo-tree)
(use-package magit)
(use-package multiple-cursors
  :ensure t
  :config
  (progn
    (require 'multiple-cursors)
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)))

(use-package org)
;; (use-package org-plus-contrib)

(use-package beacon
  :ensure t
  :config
  (progn (beacon-mode 1)))


(use-package yasnippet)
(use-package yasnippet-snippets)


(use-package go-mode)
