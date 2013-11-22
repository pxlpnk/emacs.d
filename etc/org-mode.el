(setq org-startup-indented t)

(setq org-todo-keywords '((sequence "TODO(t)" "DONE(d)")
                          (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE" "|" "FIXED(f)")))

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
         "* %?\nEntered on %U\n  %i\n  %a")
        ("d" "Logbook" entry (file+datetree "~/Documents/Notes/org/logbook.org")
         "* %?\nEntered on %U\n  %i\n")))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . nil)
   (latex . t)
   (ledger . t)         ;this is the important one for this tutorial
   (ruby . t)
   (screen . nil)
   (sh . t)
   (sql . nil)
   (sqlite . t)))

;; Mobile Org

(setq org-directory "~/Documents/Notes")
(setq org-mobile-inbox-for-pull "~/Documents/Notes/flagged.org")

(setq org-mobile-directory "~/Dropbox/MobileOrg")


(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/Documents/Notes"))
(setq org-startup-truncated nil)
