(require 'yasnippet)
(require 'yasnippet-bundle)

(add-hook 'enh-ruby-mode-hook
          '(lambda ()
             (yas/minor-mode)))
