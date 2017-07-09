(require 'org-notmuch)

(setq
 user-mail-address "at@an-ti.eu"
 user-full-name  "Andreas Tiefenthaler")

(setq message-kill-buffer-on-exit t)
;; (setq  mu4e-html2text-command "w3m -T text/html"

(setq message-signature-file "~/.emacs.d/.signature")

;; Notmuch Configuration
(setq notmuch-crypto-process-mime t)
(setq notmuch-search-oldest-first nil)

;; Sending mail Configuration
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "mail.an-ti.eu")
(setq smtpmail-smtp-service 25)
