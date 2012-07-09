(setq org-startup-indented t)

(setq org-todo-keywords '((sequence "IDEA" "TODO" "WIP" "DELEGATED" "|" "DONE")))

(defun gtd ()
   (interactive)
   (find-file "~/Documents/Notes/org/gtd.org")
 )
