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

(load-local-file "etc/cosmetics.el")
(load-local-file "etc/mu4e.el")
(load-local-file "etc/magit.el")
(load-local-file "etc/enh-ruby-mode.el")
(load-local-file "etc/projectile.el")
(load-local-file "etc/org-mode.el")
(load-local-file "etc/ido.el")
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
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(fci-rule-color "#424242")
 '(initial-buffer-choice "~/Dropbox/org/p/gtd.org")
 '(linum-format " %5i ")
 '(org-agenda-files
   (quote
    ("/Users/at/Dropbox/org/contentful/cheatsheet.org" "/Users/at/Dropbox/org/contentful/codequest.org" "/Users/at/Dropbox/org/p/bookmark.org" "/Users/at/Dropbox/org/p/books.org" "/Users/at/Dropbox/org/p/emacs.org" "/Users/at/Dropbox/org/p/erlang.org" "/Users/at/Dropbox/org/p/gtd.org" "/Users/at/Dropbox/org/p/index.org" "/Users/at/Dropbox/org/p/journal.org" "/Users/at/Dropbox/org/p/movies.org" "/Users/at/Dropbox/org/p/music.org" "/Users/at/Dropbox/org/p/refile.org" "/Users/at/Dropbox/org/p/safe.org" "/Users/at/Dropbox/org/p/shopping.org")))
 '(package-selected-packages
   (quote
    (undo-tree magit-gh-pulls cider yasnippet-bundle yasnippet yaml-mode writeroom-mode volatile-highlights twittering-mode sublime-themes sonic-pi smartparens slim-mode sass-mode rspec-mode robe rinari rbenv puppet-mode projectile-rails powerline popwin pivotal-tracker php-mode paredit-everywhere org-plus-contrib org-mobile-sync org-magit org-mac-link oldlace-theme offlineimap obsidian-theme notmuch mu4e-maildirs-extension minimap markdown-mode linum-off less-css-mode js2-mode highlight-symbol highlight-indentation grizzl git-timemachine git-gutter full-ack flatui-theme expand-region epresent enh-ruby-mode emoji-display elscreen-separate-buffer-list edts ebib dash-at-point cyberpunk-theme company-inf-ruby color-theme-sanityinc-tomorrow color-theme color-identifiers-mode coffee-mode chef-mode busybee-theme auctex ag ack)))
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
