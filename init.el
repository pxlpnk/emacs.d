;; start the server as first

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq debug-on-error nil)

(package-initialize)

(server-mode)


;; Directories and file names
(setq at/emacs-init-file
      (or load-file-name buffer-file-name))
(setq at/emacs-config-dir
      (file-name-directory at/emacs-init-file))
(setq user-emacs-directory at/emacs-config-dir)
(setq at/elisp-dir
      (expand-file-name "elisp" at/emacs-config-dir))
(setq at/elisp-external-dir
      (expand-file-name "external" at/elisp-dir))
(setq at/themes-dir
      (expand-file-name "themes" at/elisp-dir))
(setq at/init-dir
      (expand-file-name "init.d/" at/emacs-config-dir))

;; TODO: add possibility to exclude files when loading from init.d

;; Load all elisp files in ./init.d
(if (file-exists-p at/init-dir)
    (dolist (file (directory-files at/init-dir t "\\.el$"))
      (load file)))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat at/emacs-config-dir "bak")))))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" default)))
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (dockerfile-mode terraform-mode elfeed yaml-mode flymake-haml haml-mode helm-org-rifle helm-projectile helm-ag ag twilight-bright-theme base16-theme expand-region beacon auctex company org-plus-contrib material-theme color-theme-sanityinc-tomorrow magit dash-at-point undo-tree git-gutter projectile erlang robe enh-ruby-mode rbenv clj-refactor cider rainbow-delimiters smartparens notmuch))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:height 0.8)))))
