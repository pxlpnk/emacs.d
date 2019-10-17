


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

(use-package org)
;; (use-package org-plus-contrib)

(use-package beacon
  :ensure t
  :config
  (progn (beacon-mode 1)))


(use-package yasnippet)
(use-package yasnippet-snippets)


(use-package go-mode)
