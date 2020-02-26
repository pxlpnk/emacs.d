(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(use-package exec-path-from-shell
  :ensure t
  :config
  (progn
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")))


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
(use-package ag)
(use-package helm-ag
  :ensure t)

(use-package helm-projectile)

(use-package projectile)
;;  (use-package undo-tree)
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

(use-package company
  :ensure t
  :config
  (progn (add-hook 'after-init-hook 'global-company-mode)))
(use-package company-go)
(use-package company-terraform)
(use-package terraform-mode)

(use-package beacon
  :ensure t
  :config
  (progn (beacon-mode 1)))

(use-package modus-operandi-theme
  :ensure t)


(use-package yasnippet)
(use-package yasnippet-snippets)

(use-package go-mode)
(use-package go-eldoc
  :ensure t
  :config
  (progn (add-hook 'go-mode-hook 'go-eldoc-setup)))

(use-package yaml-mode)

(use-package flycheck
  :ensure t
  :config
  :init (global-flycheck-mode))

(use-package flycheck-golangci-lint)
(use-package flycheck-gometalinter)

(use-package flycheck-rust)
(use-package flycheck-yamllint)



(use-package yasnippet
  :ensure t
  :config

  (yas-global-mode t)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "C-'") #'yas-expand)

  (yas-reload-all)
  (setq yas-prompt-functions '(yas-ido-prompt))
  (defun help/yas-after-exit-snippet-hook-fn ()
    (prettify-symbols-mode)
    (prettify-symbols-mode))
  (add-hook 'yas-after-exit-snippet-hook #'help/yas-after-exit-snippet-hook-fn)
  :diminish yas-minor-mode)


(use-package yasnippet-snippets         ; Collection of snippets
  :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))


(use-package rust-mode)
(use-package rubocopfmt)
(use-package use-package)
(use-package hcl-mode)


(use-package org-roam
      :after org
      :hook
      (after-init . org-roam-mode)
      :straight (:host github :repo "jethrokuan/org-roam" :branch "develop")
      :custom
      (org-roam-directory "~/org/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-show-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))
