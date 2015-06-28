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

(defun at-turn-on-robe ()
  (interactive)
  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  (robe-mode 1))

(at-turn-on-robe)

(defun at-turn-off-robe ()
  (interactive)
  (remove-hook 'enh-ruby-mode-hook 'robe-mode)
  (robe-mode 0))

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-hook 'rspec-mode-hook
          '(lambda ()
             (setq yas-extra-modes 'rspec-mode)))

;; Taken from @plexus: https://github.com/plexus/.emacs.d/blob/master/init.d/ruby.el
(defun at/make-temp-ruby-buffer-name ()
  (let* (
         (dir (concat (getenv "HOME") "/tmp/ruby-tmp"))
         ;; (dir (concat "" "/tmp/ruby-tmp/"))
         (last-buffer (car (last (directory-files dir nil "^[0-9]+\.rb")))))
    (or (file-directory-p dir) (mkdir dir))
    (format "%s/%05d.rb"
            dir
            (+ 1 (string-to-number
                  (first (split-string
                          (if last-buffer last-buffer "00000.rb")
                          "\\.")))))))

(defun at/temp-ruby-buffer ()
  (interactive)
  (let ((buffer (make-temp-ruby-buffer-name)))
    (write-region "" nil buffer)
    (find-file buffer)))
