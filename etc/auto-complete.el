(require 'auto-complete-config)
 (add-to-list 'ac-dictionary-directories
              "~/.emacs.d/elpa/auto-complete-20131121.1705/dict/ruby-mode")

(ac-config-default)
 (setq ac-ignore-case nil)
 (add-to-list 'ac-modes 'enh-ruby-mode)
