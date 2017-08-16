(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(setq
 package-list
 '(
   notmuch
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
  ;; helm
  ;; helm-ag
  ;; helm-projectile
  ;; helm-org-rifle
   projectile
   git-gutter
   undo-tree
   dash-at-point
   ;; Git
   magit
   ;; Color themes
   color-theme-sanityinc-tomorrow
   material-theme
   base16-theme
   ;; ORG
   org
   org-plus-contrib

   ;; auto complete
   company
   ;; ya-snippets
   yasnippet
   ;;   yasnippet-bundle
   ;;   clojure-snippets
   ;; markdown
   ;; haml-mode
   ;; TeX
   auctex
   ;; misc
   beacon
   expand-region
   ))


(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
