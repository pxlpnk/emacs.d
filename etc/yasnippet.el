(require 'yasnippet)
(yas/initialize)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (yas/minor-mode)))

(setq yas/root-directory (concat dotfiles-dir "lib/snippets"))
;; Load the snippets
(yas/load-directory yas/root-directory)

