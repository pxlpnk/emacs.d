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

;; https://tickething.com/entity/8656 -> [:ticket: #8656](https://tickething.com/entity/8656)
;; Will take the last part of the url as the ticket id and make a nice markdown link
;; The link will be pasted at the current cursor point and will copy it to the clipboard
(defun at/md-ticket-link ()
  (interactive)
  (insert
   (let* (
          (url (x-get-clipboard))
          (id (replace-regexp-in-string ".*/" "" url))
          (ticket-string (concat "[:ticket: #" id "](" url ")")))
     (kill-new ticket-string))))
