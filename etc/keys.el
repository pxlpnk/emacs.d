(setq mac-option-key-is-meta nil)
(setq ns-function-modifier 'hyper)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 2)            ;; but maintain correct appearance



(defun prelude-google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string "Google: "))))))



(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c g") 'gtd)
(global-set-key (kbd "C-c e") 'mu4e)
(global-set-key (kbd "H-e") 'mu4e)

(windmove-default-keybindings 'hyper)
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "RET")         'newline-and-indent)
(global-set-key (kbd "<delete>")    'delete-char)  ; delete == delete
(global-set-key (kbd "M-g")         'goto-line)    ; M-g  'goto-line


(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)


(global-set-key [(f10)] (lambda () (interactive)(compile "make")))


;; Opens the dash documentation
(global-set-key "\C-cd" 'dash-at-point)
