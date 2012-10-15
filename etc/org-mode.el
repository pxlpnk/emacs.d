(setq org-startup-indented t)

(setq org-todo-keywords '((sequence "TODO(t)" "DONE(d)")
                          (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE" "|" "FIXED(f)")))

(defun gtd ()
   (interactive)
   (find-file "~/Documents/Notes/org/gtd.org")
 )



;;(setq org-default-notes-file (concat org-directory "~/Documents/Notes/org/notes.org")) ;
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/Notes/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a
")
        ("j" "Journal" entry (file+datetree "~/Documents/Notes/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))
