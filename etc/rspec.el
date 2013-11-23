(require 'rspec-mode)

;; (setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
;; (setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

;; (require 'rvm)
;; (rvm-use-default)


(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)
