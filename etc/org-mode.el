;; ;; to ecncrypt org-files
;; ;; # -*- mode:org; epa-file-encrypt-to: ("me@mydomain.com") -*-
;; ;; http://orgmode.org/worg/org-tutorials/encrypting-files.html
;; (require 'epa-file)
;; (epa-file-enable)

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))

(setq org-crypt-key "49C0DBF3")
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.

(setq auto-save-default nil)
;; Auto-saving does not cooperate with org-crypt.el: so you need
;; to turn it off if you plan to use org-crypt.el quite often.
;; Otherwise, you'll get an (annoying) message each time you
;; start Org.

;; To turn it off only locally, you can insert this:
;;
;; # -*- buffer-auto-save-file-name: nil; -*-


(setq org-startup-indented t)

(setq org-todo-keywords '((sequence "TODO(t)" "WIP(w)" "DELEGATED(X)" "DONE(d)" )
                          (sequence "REPORT(r)" "BUG(b)" "WONTFIX(n)" "FIXED(f)")))

;; FIXME: how to deal with different workstations and different todos?
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

;;(setq org-default-notes-file (concat org-directory "~/Documents/Notes/org/notes.org")) ;
(define-key global-map (kbd "C-c c") 'org-capture)

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

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "H-a") 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/org/contentful/"
                             "~/Dropbox/org/p/"))
(setq org-startup-truncated t)

(setq org-return-follows-link  t)

;; Fullscreen orgmode
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

;; Mobile org
;; http://orgmode.org/manual/Setting-up-the-staging-area.html#Setting-up-the-staging-area

(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))



;; refiling tasks: http://doc.norang.ca/org-mode.html#Refiling

                                        ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

                                        ; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

                                        ; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

                                        ; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

                                        ; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
                                        ; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
                                        ; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;;;; Refile settings
                                        ; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)


(setq org-cycle-separator-lines 0)
