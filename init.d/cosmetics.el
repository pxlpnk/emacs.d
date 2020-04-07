(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(setq require-final-newline t)

(menu-bar-mode t)
(column-number-mode t)
(size-indication-mode t)
(setq-default show-trailing-whitespace t)

(which-function-mode)

(defun at/ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'at/ask-before-closing))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(display-time-mode 1)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 130 :family "Hack")))))

;; (load-theme 'modus-operandi)
(load-theme 'dracula)
