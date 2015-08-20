(package-initialize)

(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq
 package-list
 '(
   ;; Clojure
   smartparens
   rainbow-delimiters
   cider
   clj-refactor
   ;; Ruby
   rbenv
   enh-ruby-mode
   robe
   ;; Erlang
   erlang
   ;; Navigation
   helm
   helm-ag
   helm-projectile
   projectile
   git-gutter
   undo-tree
   dash-at-point
   ;; Git
   magit
   ;; Color themes
   color-theme-sanityinc-tomorrow
   material-theme
   ;; ORG
   org
   org-plus-contrib
   org-magit
   ;; auto complete
   company
   ;; ya-snippets
   yasnippet
;;   yasnippet-bundle
;;   clojure-snippets
   ;; markdown
   markdown-mode
   haml-mode
   ;; TeX
   auctex
   expand-region
   ))


(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
