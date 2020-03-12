(require 'org-crypt)
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
     ("TODO" . (:foreground "red" :background :none))))

(defun at/gtd ()
  (interactive)
  (find-file "~/Dropbox/org/p/gtd.org"))


(global-set-key (kbd "C-$") 'org-archive-subtree)
(global-set-key (kbd "C-c g") 'at/gtd)
(global-set-key (kbd "C-c b") 'at/org-iswitchb)



(setq org-capture-templates
  '( ("t" "Todo" entry (file+headline "~/Dropbox/org/inbox.org" "Tasks")
       "* TODO %? :TODO:\n  %i\n")
     ("l" "Link" entry (file ,"~/Dropbox/org/inbox.org")
         "* TODO %(org-cliplink-capture)" :immediate-finish t)
     ("n" "Note" entry (file+headline "~/Dropbox/org/inbox.org" "Notes")
       "* %? :NOTE:\n%U\n"))
  )

(setq org-directory "~/Dropbox/org/")

(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/org/inbox.org"
                         "~/Dropbox/org/tickler.org"
                         "~/Dropbox/org/p/gtd.org"
                         "~/Dropbox/org/p/projects"
                         ))

(setq org-refile-targets (quote ((nil :maxlevel . 3)
                                  (org-agenda-files :maxlevel . 3))))
(setq org-agenda-custom-commands
  '(
     ("" tags "refile")))
(setq org-agenda-custom-commands
  '((
      "r" tags "refile")
     ("n" "Agenda and all TODOs" ((agenda "") (todo "TODO")))
     ("w" "Agenda and all WAITINGSs" ((agenda "") (todo "WAITING")))


     ("g" "Agenda for TODO" ((agenda "" ((org-agenda-files '("~/Dropbox/org/p/gtd.org" "~/Dropbox/org/tickler.org"))))
                              (todo "WIP" ((org-agenda-files '("~/Dropbox/org/p/gtd.org"))))
                              (todo "TODO" ((org-agenda-files '("~/Dropbox/org/p/gtd.org"))))
                              (todo "ONHOLD" ((org-agenda-files '("~/Dropbox/org/p/gtd.org"))))
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
(global-set-key (kbd "H-c") 'org-mac-chrome-insert-frontmost-url)

(add-hook 'org-mode-hook 'turn-on-flyspell)


(defun at/org-agenda-process-inbox-item ()
  "Process a single item in the org-agenda."
  (interactive)
  (org-with-wide-buffer
   (org-agenda-set-tags)
   (org-agenda-priority)
   (org-agenda-refile nil nil t)))
