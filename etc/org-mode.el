(setq org-startup-indented t)

(setq org-todo-keywords '((sequence "IDEA" "TODO" "WIP" "DELEGATED" "|" "DONE")))

;; FIXME: how to deal with different workstations and different todos?
(defun gtd ()
   (interactive)
   (find-file "~/Documents/Notes/org/gtd.org")
 )
