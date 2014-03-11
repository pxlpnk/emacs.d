(require 'org-notmuch)
(require 'offlineimap)

(setq message-kill-buffer-on-exit t) ; kill buffer after sending mail)
(setq notmuch-fcc-dirs nil) ; Gmail saves sent mails by itself

(setq mail-specify-envelope-from t) ; Settings to work with msmtp

(setq notmuch-saved-searches
      '(("inbox" . "tag:inbox")
        ("today" . "date:1day..now")
        ("week" . "date:1week..now")
        ("month" . "date:1month..now")))
