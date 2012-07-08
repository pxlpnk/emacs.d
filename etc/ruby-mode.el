(require 'ruby-mode)
(add-hook 'ruby-mode-hook
          '(lambda ()
	     (ruby-end-mode)))

(add-hook 'ruby-mode-hook
          '(lambda ()
	     (ruby-block-mode)))
