;; Directories and file names
(setq mk-emacs-init-file
      (or load-file-name buffer-file-name))
(setq mk-emacs-config-dir
      (file-name-directory mk-emacs-init-file))
(setq user-emacs-directory mk-emacs-config-dir)
(setq mk-elisp-dir
      (expand-file-name "elisp" mk-emacs-config-dir))
(setq mk-elisp-external-dir
      (expand-file-name "external" mk-elisp-dir))
(setq mk-themes-dir
      (expand-file-name "themes" mk-elisp-dir))
(setq mk-init-dir
      (expand-file-name "init.d" mk-emacs-config-dir))

;; Load all elisp files in ./init.d
(if (file-exists-p mk-init-dir)
    (dolist (file (directory-files mk-init-dir t "\\.el$"))
      (load file)))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat mk-emacs-config-dir "bak")))))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(server-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:height 0.8)))))
