(require 'org-crypt)
(require 'org-mu4e)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))

(setq org-crypt-key "49C0DBF3")

(setq auto-save-default nil)
(setq org-startup-indented t)
(setq org-todo-keywords '((sequence "TODO(t)" "WIP(w)" "DONE(d)" "DELEGATED(X)" )
                          (sequence "REPORT(r)" "BUG(b)" "WONTFIX(n)" "FIXED(f)")))

(defun gtd-contentful ()
  (interactive)
  (find-file "~/Dropbox/org/contentful/contentful_gtd.org"))


(defun gtd ()
  (interactive)
  (find-file "~/Dropbox/org/p/gtd.org"))

(global-set-key (kbd "C-$") 'org-archive-subtree)
(global-set-key (kbd "C-c g") 'gtd-contentful)
(global-set-key (kbd "H-g") 'gtd)
(global-set-key (kbd "C-c b") 'org-iswitchb)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/org/p/refile.org" "Tasks")
         "* TODO %? :refile:TODO:\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/p/journal.org")
         "* %U: %? %i\n")
        ("n" "Note" entry (file+headline "~/Dropbox/org/p/refile.org" "Notes")
         "* %? :refile:NOTE:\n%U\n%a\n")
        ("b" "Bookmark" entry (file "~/Dropbox/org/p/bookmark.org" "Bookmarks")
         "* %? :bookmark:\n%U\n")
        ))

(setq org-directory "~/Dropbox/org/p/")

(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/org/contentful/"
                             "~/Dropbox/org/p/"))
(setq org-startup-truncated t)

(setq org-return-follows-link  t)

(setq org-agenda-window-setup 'current-window)

;; Thanks to @plexus for helping me with this piece of code
(defun insert-org-link ()
  (interactive)
  (insert
   (let* (
          (url (x-get-clipboard))
          (id (replace-regexp-in-string ".*/" "" url)))
     (concat "[[" url "][\#"id"]]")) ))


(global-set-key (kbd "H-i") 'insert-org-link)

(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))
