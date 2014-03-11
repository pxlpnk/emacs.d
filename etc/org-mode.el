(setq org-startup-indented t)

(setq org-todo-keywords '((sequence "TODO(t)" "WIP(w)" "DELEGATED(X)" "DONE(d)" )
                          (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE" "FIXED(f)")))

;; FIXME: how to deal with different workstations and different todos?
(defun gtd ()
   (interactive)
   (find-file "~/Documents/Notes/gtd.org")
 )



;;(setq org-default-notes-file (concat org-directory "~/Documents/Notes/org/notes.org")) ;
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/Notes/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Documents/Notes/org/journal.org")
         "* %U: %? %i\n")))

(setq org-directory "~/Documents/Notes")

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/Documents/Notes"))
(setq org-startup-truncated t)

(setq org-return-follows-link  t)


;; Thanks to @plexus for helping me with this piece of code
(defun insert-pivotal ()
  (interactive)
  (insert
   (let* (
          (url (x-get-clipboard))
          (id (replace-regexp-in-string ".*/" "" url)))
     (concat "[[" url "][\#"id"]]")) ))
