;; start the server as first

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#d6d6d6"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-day)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" default)))
 '(fci-rule-color "#d6d6d6")
 '(hl-sexp-background-color "#1c1f26")
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (org-plus-contrib copy-as-format elfeed solidity-mode org-habit yaml-mode telephone-line org-mac-link helm-notmuch tao-theme go-mode go-projectile flycheck-ledger ledger-mode wttrin fixme-mode vcl-mode terraform-mode notmuch ess org-mac-iCal restclient restclient-helm epresent flymake-ruby flymake-yaml helm-lobsters pinboard clj-refactor apropospriate-theme spotify helm-spotify gnuplot gnuplot-mode btc-ticker helm-dash helm-dictionary pinboard-api which-key helm-swoop request js2-mode php-mode osx-dictionary beacon general-close csv-mode clojure-cheatsheet writeroom-mode vagrant-tramp undo-tree rbenv rainbow-delimiters org-magit haml-mode exercism enh-ruby-mode dash-at-point company command-log-mode color-theme-sanityinc-tomorrow)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:height 0.8)))))
(put 'upcase-region 'disabled nil)
