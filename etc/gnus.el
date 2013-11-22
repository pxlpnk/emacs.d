(require 'gnus-html)

(setq user-mail-address "at@an-ti.eu")
(setq user-full-name "Andreas Tiefenthaler")


(setq gnus-select-method
      '(nnmaildir "GMail"
                  (directory "~/.mail/an-ti.eu")
                  (directory-files nnheader-directory-files-safe)
                  (get-new-mail nil)))

(define-key gnus-group-mode-map (kbd "vo")
  '(lambda ()
     (interactive)
     (shell-command "offlineimap&" "*offlineimap*" nil)))


 '(gnus-buttonized-mime-types '("multipart/alternative"
                                "multipart/encrypted"
                                "multipart/signed"))

(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)
