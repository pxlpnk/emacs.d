(require 'yasnippet)
;; (yas-global-mode 1)
;; (add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)

(smartparens-global-mode t)
(add-hook 'prog-mode-hook 'smartparens-strict-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
