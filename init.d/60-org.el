(require 'org-crypt)
(require 'org-habit)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (gnuplot . t)
   (ruby . t)
   (shell . t)
   ))

(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "49C0DBF3")

(setq org-log-done 'time)


(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
(setq org-clock-into-drawer t)
(setq org-log-into-drawer t)

(setq auto-save-default nil)
(setq org-startup-indented t)
(setq org-todo-keywords '((sequence "TODO(t!)" "WIP(w!)" "|" "DONE(d!)" "DELEGATED(x!)" "WAITING(a@)" "WONT(n!)" "ONHOLD(h!)")))

(setq org-todo-keyword-faces
      '(
        ("DONE" . (:foreground "green" :background :none))
        ("WIP" . (:foreground "orange" :background :none))
        ("ONHOLD" . (:foreground "blue" :background :none))
        ("TODO" . (:foreground "red" :background :none)))
      )

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
      '(("p" "Private Todo" entry (file+headline "~/Dropbox/org/inbox.org" "Tasks")
         "* TODO %? :TODO:@PRIVATE:\n  %i\n")
        ("c" "Contentful Todo" entry (file+headline "~/Dropbox/org/inbox.org" "Tasks")
         "* TODO %? :TODO:@CONTENTFUL:\n  %i\n")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/p/journal.org.gpg")
         "* %U: %? %i :journal:\n")
        ("n" "Note" entry (file+headline "~/Dropbox/org/inbox.org" "Notes")
         "* %? :NOTE:\n%U\n")
        ("b" "Bookmark" entry (file "~/Dropbox/org/p/bookmark.org" "Bookmarks")
         "* %? :bookmark:\n%U\n")
        ("x" "Tickler" entry (file+headline "~/Dropbox/org/tickler.org" "Tickler")
         "* TODO %? :todo:scheduled:\n%U\n")
        ))

(setq org-directory "~/Dropbox/org/")

(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/org/inbox.org"
                             "~/Dropbox/org/tickler.org"
                             "~/Dropbox/org/contentful/"
                             "~/Dropbox/org/p/"))

(setq org-refile-targets (quote (("~/Dropbox/org/inbox.org" :maxlevel . 3)
                                 ("~/Dropbox/org/contentful/contentful_gtd.org" :maxlevel . 3)
                                 ("~/Dropbox/org/contentful/backlog.org" :maxlevel . 3)
                                 ("~/Dropbox/org/contentful/notes.org" :maxlevel . 3)
                                 ("~/Dropbox/org/tickler.org" :maxlevel . 1)
                                 ("~/Dropbox/org/p/gtd.org" :maxlevel . 3 )
                                 ("~/Dropbox/org/p/someday.org" :maxlevel . 3 )
                                 )))


(setq org-agenda-custom-commands
      '(("r" tags "+refile")
        ("n" "Agenda and all TODOs" ((agenda "") (todo "TODO")))
        ("w" "Agenda and all WAITINGSs" ((agenda "") (todo "WAITING")))
        ("p" "Private Agenda" ((agenda "" ((org-agenda-files '("~/Dropbox/org/p/gtd.org" "~/Dropbox/org/tickler.org"))))
                                      (todo "WIP" ((org-agenda-files '("~/Dropbox/org/p/gtd.org"))))
                                      (todo "TODO" ((org-agenda-files '("~/Dropbox/org/p/gtd.org"))))
                                      (todo "ONHOLD" ((org-agenda-files '("~/Dropbox/org/p/gtd.org"))))
                                      ))
        ("c" "Agenda for contentful" ((agenda "" ((org-agenda-files '("~/Dropbox/org/contentful/contentful_gtd.org" "~/Dropbox/org/tickler.org"))))
                                      (tags-todo "sprint" ((org-agenda-files '("~/Dropbox/org/contentful/contentful_gtd.org"))))
                                      (todo "WIP" ((org-agenda-files '("~/Dropbox/org/contentful/contentful_gtd.org"))))
                                      (todo "TODO" ((org-agenda-files '("~/Dropbox/org/contentful/contentful_gtd.org"))))
                                      (todo "ONHOLD" ((org-agenda-files '("~/Dropbox/org/contentful/contentful_gtd.org"))))
                                      ))))

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

(add-hook 'org-mode-hook 'turn-on-flyspell)
