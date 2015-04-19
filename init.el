;; start the server as first
(server-mode)


;; Directories and file names
(setq at-emacs-init-file
      (or load-file-name buffer-file-name))
(setq at-emacs-config-dir
      (file-name-directory at-emacs-init-file))
(setq user-emacs-directory at-emacs-config-dir)
(setq at-elisp-dir
      (expand-file-name "elisp" at-emacs-config-dir))
(setq at-elisp-external-dir
      (expand-file-name "external" at-elisp-dir))
(setq at-themes-dir
      (expand-file-name "themes" at-elisp-dir))
(setq at-init-dir
      (expand-file-name "init.d/" at-emacs-config-dir))

;; TODO: add possibility to exclude files when loading from init.d

;; Load all elisp files in ./init.d
(if (file-exists-p at-init-dir)
    (dolist (file (directory-files at-init-dir t "\\.el$"))
      (load file)))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat at-emacs-config-dir "bak")))))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-tomorrow yasnippet-bundle undo-tree smartparens robe rbenv rainbow-delimiters markdown-mode helm erlang enh-ruby-mode dash-at-point company clojure-snippets cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
