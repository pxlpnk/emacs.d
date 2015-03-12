(require 'sonic-pi)
(add-hook 'sonic-pi-mode-hook
          (lambda ()
            (setq sonic-pi-path "~/src/private/sonic-pi/")
                 (define-key ruby-mode-map "\C-c\C-b" 'sonic-pi-stop-all)))
