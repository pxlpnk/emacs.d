(require 'cl)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; required because of a package.el bug
(setq url-http-attempt-keepalives nil)

(defvar prelude-packages
  '(expand-region magit magithub melpa
                   volatile-highlights yasnippet flymake ruby-mode rinari ruby-end)
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

(defun load-local-file (p)
  (load-file (concat dotfiles-dir p)))

(defun add-subdirs-to-load-path (dir)
  (let ((default-directory  (concat dotfiles-dir dir)))
    (normal-top-level-add-subdirs-to-load-path)))

(add-local-path "lib")
(add-subdirs-to-load-path "lib")

(load-local-file "themes/bubbleberry/bubbleberry-theme.el")

(load-local-file "etc/keys.el")
(load-local-file "etc/org-mode.el")
(load-local-file "etc/ido.el")
(load-local-file "etc/cosmetics.el")
(load-local-file "etc/yasnippet.el")
(load-local-file "etc/flyspell.el")
(load-local-file "etc/built-in.el")

;; backups
(setq make-backup-files t ;; do make backups
  backup-by-copying t     ;; and copy them here
  backup-directory-alist '(("." . "~/.emacs.d/cache/backups")) 
  version-control t
  kept-new-versions 2
  kept-old-versions 5
  delete-old-versions t)


(server-start)

