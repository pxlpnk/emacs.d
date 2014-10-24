; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

(require 'org-mu4e)
(require 'mu4e)

(setq
 mu4e-maildir       "~/Mail/")   ;; top-level Maildir

(setq mu4e-drafts-folder "/anti/Drafts")
(setq mu4e-sent-folder   "/anti/Sent")
(setq mu4e-trash-folder  "/anti/Trash")
(setq mu4e-refile-folder "/anti/Archives")   ;; saved messages

;; show full addresses in view message (instead of just names)
;; toggle per name with M-RET
(setq mu4e-view-show-addresses 't)
(setq mu4e-use-fancy-chars t)

(setq mu4e-compose-signature-auto-include 't)
(setq mu4e-compose-signature "Andreas Tiefenthaler -- http://an-ti.eu")


(setq mu4e-maildir-shortcuts
      '( ("/anti/INBOX"                . ?a)
         ("/anti/Followup"             . ?f)
         ("/anti/Github.*"             . ?g)
         ))

(setq mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 900) ;; update every 15 minutes


(setq
 user-mail-address "at@an-ti.eu"
 user-full-name  "Andreas Tiefenthaler")

;; (setq mu4e-sent-messages-behavior 'delete)
(setq mu4e-headers-skip-duplicates t)
(setq message-kill-buffer-on-exit t)
;; (setq  mu4e-html2text-command "w3m -T text/html"
(setq  mu4e-html2text-command "w3m -dump -cols 80 -T text/html"
       mu4e-update-interval 1800
       mu4e-headers-auto-update t)

(setq message-signature-file "~/.emacs.d/.signature")

(add-hook 'message-compose-mode-hook 'mml-secure-sign-pgpmime)

(add-hook 'mu4e-compose-pre-hook
          (defun my-set-from-address ()
            "Set the From address based on the To address of the original."
            (let ((msg mu4e-compose-parent-message)) ;; msg is shorter...
              (if msg
                  (setq user-mail-address
                        (cond
                         ((mu4e-message-contact-field-matches msg :to "emacsberlin@librelist.com")
                          "hello@an-ti.eu")
                         ((mu4e-message-contact-field-matches msg :to "@an-ti.eu")
                          "at@an-ti.eu")
                         ((mu4e-message-contact-field-matches msg :to "andreas.tiefenthaler@gmail.com")
                          "andreas.tiefenthaler@gmail.com")
                         (t "at@an-ti.eu")))))))


(add-to-list 'mu4e-bookmarks
             '( "maildir:/anti/INBOX"       "anti INBOX"     ?i))
(add-to-list 'mu4e-bookmarks
             '( "maildir:/anti/Followup"       "Followup"     ?f))
