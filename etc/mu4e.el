(require 'mu4e)

(setq
 mu4e-maildir       "~/.mail/an-ti.eu"   ;; top-level Maildir
 mu4e-sent-folder   "/sent"       ;; folder for sent messages
 mu4e-drafts-folder "/drafts"     ;; unfinished messages
 mu4e-trash-folder  "/trash"      ;; trashed messages
 mu4e-refile-folder "/archive"   ;; saved messages
 mu4e-sent-messages-behavior 'delete
 user-mail-address "at@an-ti.eu"
 user-full-name  "Andreas Tiefenthaler"
 mu4e-maildir-shortcuts
 '( ("/Gmail/INBOX"               . ?i)
    ("/Gmail/[Gmail].Sent Mail"   . ?s)
    ("/Gmail/[Gmail].Trash"       . ?t)
    ("/Gmail/[Gmail].All Mail"    . ?a))

 )


(setq
 mu4e-get-mail-command "offlineimap"   ;; or fetchmail, or ...
 mu4e-update-interval 300)             ;; update every 5 minutes

(setq mu4e-html2text-command "html2text -utf8 -width 72")
(setq mu4e-view-show-images t)
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))
(setq mu4e-view-prefer-html t)
