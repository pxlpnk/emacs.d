(require 'org-notmuch)

(setq
 user-mail-address "at@an-ti.eu"
 user-full-name  "Andreas Tiefenthaler")

(setq message-kill-buffer-on-exit t)


(setq message-signature-file "~/.emacs.d/.signature")
(add-hook 'message-setup-hook 'mml-secure-sign-pgpmime)

;; Notmuch Configuration
(setq notmuch-crypto-process-mime t)
(setq notmuch-search-oldest-first nil)

;; Sending mail Configuration
;; (setq send-mail-function 'smtpmail-send-it)
;; (setq smtpmail-smtp-server "mail.an-ti.eu"
;;       smtpmail-smtp-service 25
;;       smtpmail-stream-type  'starttls
;;       smtpmail-debug-info t
;;       smtpmail-debug-verb t)
