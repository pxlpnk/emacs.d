(require 'org-crypt)
(require 'org-mu4e)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))

(setq org-crypt-key "49C0DBF3")

(setq auto-save-default nil)
(setq org-startup-indented t)
(setq org-todo-keywords '((sequence "TODO(t)" "WIP(w)" "DONE(d)" "DELEGATED(X)" )
                          (sequence "REPORT(r)" "BUG(b)" "WONTFIX(n)" "FIXED(f)")))

(setq org-todo-keyword-faces
      '(
        ("DONE" . (:foreground "green" :background :none))
        ("TODO" . (:foreground "red" :background :none))))

(defun at/gtd-contentful ()
  (interactive)
  (find-file "~/Dropbox/org/contentful/contentful_gtd.org"))

(defun at/gtd ()
  (interactive)
  (find-file "~/Dropbox/org/p/gtd.org"))

(global-set-key (kbd "C-$") 'org-archive-subtree)
(global-set-key (kbd "C-c g") 'at/gtd-contentful)
(global-set-key (kbd "H-g") 'at/gtd)
(global-set-key (kbd "C-c b") 'at/org-iswitchb)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/org/inbox.org" "Tasks")
         "* TODO %? :TODO:\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/p/journal.org")
         "* %U: %? %i\n")
        ("n" "Note" entry (file+headline "~/Dropbox/org/inbox.org" "Notes")
         "* %? :NOTE:\n%U\n%a\n")
        ("b" "Bookmark" entry (file "~/Dropbox/org/p/bookmark.org" "Bookmarks")
         "* %? :bookmark:\n%U\n")
        ))

(setq org-directory "~/Dropbox/org/p/")

(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/org/contentful/"
                             "~/Dropbox/org/p/"
                             "~/Dropbox/org/inbox.org"))
(setq org-startup-truncated t)

(setq org-return-follows-link  t)

(setq org-agenda-window-setup 'current-window)

;; Thanks to @plexus for helping me with this piece of code
(defun at/insert-org-link ()
  (interactive)
  (insert
   (let* (
          (url (x-get-clipboard))
          (id (replace-regexp-in-string ".*/" "" url)))
     (concat "[[" url "][\#"id"]]")) ))


(global-set-key (kbd "H-i") 'at/insert-org-link)

(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
