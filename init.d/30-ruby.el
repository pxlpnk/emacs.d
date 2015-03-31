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

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(setq enh-ruby-program rbenv-ruby-shim)

(add-hook 'enh-ruby-mode-hook 'robe-mode)

;; https://github.com/dgutov/robe/issues/36#issuecomment-74448398
(setq robe-turn-on-eldoc nil)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-hook 'rspec-mode-hook
          '(lambda ()
             (setq yas-extra-modes 'rspec-mode)))
