;; (global-set-key (kbd "M-x") 'helm-M-x)

(setq mac-option-key-is-meta nil)
(setq ns-function-modifier 'hyper)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 2)            ;; but maintain correct appearance


;; Maggit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-;") 'comment-line)

(global-set-key (kbd "H-e") 'mu4e)

(windmove-default-keybindings 'hyper)
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "<delete>")    'delete-char)  ; delete == delete
(global-set-key (kbd "M-g")         'goto-line)    ; M-g  'goto-line


(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; (global-unset-key (kbd "<left>"))
;; (global-unset-key (kbd "<right>"))
;; (global-unset-key (kbd "<up>"))
;; (global-unset-key (kbd "<down>"))

(defun at/move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun at/move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'at/move-line-up)
(global-set-key [(control shift down)]  'at/move-line-down)

;; Opens the dash documentation
(global-set-key "\C-cd" 'dash-at-point)

;; org global capture
(define-key global-map (kbd "C-c c") 'org-capture)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "H-a") 'org-agenda)


(defun at/duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(global-set-key (kbd "C-d") 'at/duplicate-line)
