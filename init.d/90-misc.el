;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (global-company-mode)

(smartparens-global-mode t)
(show-smartparens-global-mode t)
(smartparens-global-strict-mode)
(require 'smartparens-config)
(require 'smartparens-ruby)
(require 'smartparens-latex)


;; (sp-use-smartparens-bindings)
;; (define-key smartparens-mode-map (kbd "M-<right>") 'sp-forward-slurp-sexp)
;; (define-key smartparens-mode-map (kbd "M-<left>") 'sp-backward-barf-sexp)
;; (define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
;; (define-key smartparens-mode-map (kbd "C-M-<up>") 'sp-backward-slurp-sexp)

(add-hook 'after-init-hook 'smartparens-strict-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


(require 'undo-tree)
(global-undo-tree-mode)
