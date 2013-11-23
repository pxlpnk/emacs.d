(global-rbenv-mode)
(rbenv-use-global)

(autoload 'enh-ruby-mode "enh-ruby-mode" "" t)
(autoload 'rspec-mode "rspec-mode" "" t)

(setq ruby-file-types ["\\.rb$"
                       "\\.rake$"
                       "\\.gemspec$"
                       "\\(Cap\\|Gem\\|Rake\\|Guard\\|Thor\\|Berks\\)file"])
(mapcar (lambda (str)
   (add-to-list 'auto-mode-alist `(,str . enh-ruby-mode)))
 ruby-file-types)



;;;;
;; enh-ruby-mode & rspec-mode configuration and hooks
;;

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(setq enh-ruby-program rbenv-ruby-shim)


(add-hook 'rspec-mode-hook
          '(lambda ()
             (setq yas-extra-modes 'rspec-mode)))

(require 'highlight-indentation)
 (add-hook 'enh-ruby-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))


(provide 'ruby-env)
