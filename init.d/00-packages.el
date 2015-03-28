(require 'package)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq
 package-list
 '(
   ;; Clojure
   smartparens
   cider
   ;; Ruby
   rbenv enh-ruby-mode
   ;; Navigation
   helm helm-ag helm-projectile projectile git-gutter
   ;; Git
   magit
   ;; Color themes
   color-theme-sanityinc-tomorrow
   ;; ORG
   org org-plus-contrib org-magit))

(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
