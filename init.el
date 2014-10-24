(require 'cl)
(require 'package)
(package-initialize)

(setq package-enable-at-startup nil)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))


;; required because of a package.el bug
;; (setq url-http-attempt-keepalives nil)

(defvar prelude-packages
  '(expand-region color-theme flymake full-ack git-gutter
                  highlight-symbol magit markdown-mode powerline
                  projectile rinari rbenv rspec-mode enh-ruby-mode
                  volatile-highlights yasnippet yasnippet-bundle
                  highlight-indentation grizzl auto-complete
                  haml-mode less-css-mode notmuch org org-plus-contrib
                  org-magit)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun prelude-install-packages ()
  (unless (prelude-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Prelude is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p prelude-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(prelude-install-packages)


;; When started from Emacs.app or similar, ensure $PATH
;; is the same the user would see in Terminal.app
;; https://github.com/purcell/emacs.d/blob/master/init-exec-path.el
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when (or (eq window-system 'ns) (eq window-system 'x))
  (set-exec-path-from-shell-PATH))

(when (eq window-system 'x)
  (setq browse-url-generic-program (executable-find "google-chrome")
        browse-url-browser-function 'browse-url-generic))

(setq dotfiles-dir (expand-file-name "~/.emacs.d/"))

(defun add-local-path (p)
  (add-to-list 'load-path (concat dotfiles-dir p)))

;; (add-to-list 'load-path "/Users/at/src/private/emacs/tramp/lisp") ;; install adb

(defun load-local-file (p)
  (load-file (concat dotfiles-dir p)))

(defun add-subdirs-to-load-path (dir)
  (let ((default-directory  (concat dotfiles-dir dir)))
    (normal-top-level-add-subdirs-to-load-path)))

(add-local-path "lib")
(add-subdirs-to-load-path "lib")

(load-local-file "etc/mu4e.el")
(load-local-file "etc/magit.el")
(load-local-file "etc/enh-ruby-mode.el")
(load-local-file "etc/projectile.el")
(load-local-file "etc/org-mode.el")
(load-local-file "etc/ido.el")
(load-local-file "etc/cosmetics.el")
(load-local-file "etc/flyspell.el")
(load-local-file "etc/built-in.el")
(load-local-file "etc/full-ack.el")
(load-local-file "etc/auto-complete.el")
(load-local-file "etc/yasnippet.el")

(load-local-file "etc/keys.el")

;; backups
(setq make-backup-files t ;; do make backups
  backup-by-copying t     ;; and copy them here
  backup-directory-alist '(("." . "~/.emacs.d/cache/backups"))
  version-control t
  kept-new-versions 2
  kept-old-versions 5
  delete-old-versions t)

;; (load-theme 'tsdh-dark)
;; (find-file "~/Dropbox/Documents/Notes/gtd.org")
(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#1d1f21"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("9fa173ced2e7a4d0a8e5aa702701629fa17b52c800391c37ea6678b8e790f7cd" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1f70ca6096c886ca2a587bc10e2e8299ab835a1b95394a5f4e4d41bb76359633" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#282a2e")
 '(initial-buffer-choice "~/Dropbox/org/p/gtd.org")
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "mail.an-ti.eu")
 '(smtpmail-smtp-service 25)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:height 0.8)))))
