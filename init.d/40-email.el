(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

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

(setq mu4e-get-mail-command "mbsync -a"
      mu4e-update-interval 900) ;; update every 15 minutes

;; try to encrypt messages automatically
;; (setq mu4e-decryption-policy t)

(setq smtpmail-queue-mail nil  ;; start in queuing mode
      smtpmail-queue-dir   "~/Mail/anti/queue/cur")

(setq
 user-mail-address "at@an-ti.eu"
 user-full-name  "Andreas Tiefenthaler")

;; (setq mu4e-sent-messages-behavior 'delete)
(setq mu4e-headers-skip-duplicates t)
(setq message-kill-buffer-on-exit t)
;; (setq  mu4e-html2text-command "w3m -T text/html"
(setq mu4e-html2text-command "w3m -dump -cols 80 -T text/html"
 ;; mu4e-html2text-command 'mu4e-shr2text
      mu4e-update-interval 1800
      mu4e-headers-auto-update t)

(add-hook 'mu4e-view-mode-hook
  (lambda()
     ;; try to emulate some of the eww key-bindings
    (local-set-key (kbd "<tab>") 'shr-next-link)
    (local-set-key (kbd "<backtab>") 'shr-previous-link)))



(setq message-signature-file "~/.emacs.d/.signature")


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

(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "mail.an-ti.eu")
(setq smtpmail-smtp-service 25)
