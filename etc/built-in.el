(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

(which-function-mode)


(global-auto-revert-mode t)

(set-default 'indent-tabs-mode nil)
(auto-compression-mode t)
(show-paren-mode t)

;; (global-hl-line-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq confirm-nonexistent-file-or-buffer nil)

;; http://nileshk.com/2009/06/13/prompt-before-closing-emacs.html

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))


(windmove-default-keybindings 'hyper)


(add-hook 'before-save-hook 'delete-trailing-whitespace)

(display-time-mode 1)

(add-hook 'before-save-hook 'time-stamp)

;;auto scroll compilation window
(setq compilation-scroll-output 'first-error)
