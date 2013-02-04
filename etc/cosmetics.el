(setq-default
 frame-title-format
 '(:eval
   (format "%s@%s:%s"
           (or (file-remote-p default-directory 'user) user-login-name)
           (or (file-remote-p default-directory 'host) system-name)
           (file-name-nondirectory (or (buffer-file-name) default-directory)))))

;; (setq inhibit-startup-message t          ;; don't show ...
;;   inhibit-startup-echo-area-message t)   ;; ... startup messages
(setq require-final-newline t)           ;; end files with a newline

(menu-bar-mode  -1)                       ;; show the menu...
(line-number-mode t)                     ;; show line numbers
(column-number-mode t)                   ;; show column numbers
(size-indication-mode t)                 ;; show file size (emacs 22+)
(tool-bar-mode -1)                       ;; turn-off toolbar

(set-face-attribute 'default nil :height 100)

(when (eq window-system 'ns)
  (global-set-key (kbd "M-RET") 'ns-toggle-fullscreen))


(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))


(when (eq window-system 'x)
  (global-set-key (kbd "M-RET") 'toggle-fullscreen))


(setq visible-bell 'top-bottom)


(if (fboundp 'fringe-mode)
    (fringe-mode 4))
