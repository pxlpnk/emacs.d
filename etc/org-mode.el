(setq org-startup-indented t)

(setq org-todo-keywords '((sequence "IDEA" "TODO" "WIP" "DELEGATED" "|" "DONE")))

;; FIXME: how to deal with different workstations and different todos?
(defun gtd ()
   (interactive)
   (find-file "~/Documents/Notes/gtd.org")
 )


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
