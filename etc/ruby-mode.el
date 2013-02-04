(require 'ruby-mode)

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode)

(eval-after-load "ruby-mode"
  '(progn
     ;; style
     (setq ruby-deep-indent-paren nil)

     ;; binding
     (define-key ruby-mode-map (kbd "C-M-a") 'my/ruby-beginning-of-defun)
     (define-key ruby-mode-map (kbd "C-M-e") 'my/ruby-end-of-defun)

     ;; indentation
     (setq ruby-deep-indent-paren nil)
     (defadvice ruby-indent-line (after unindent-closing-paren activate)
       (let ((column (current-column))
             (indent nil)
             (offset 0))
         (save-excursion
           (back-to-indentation)
           (let ((state (syntax-ppss)))
             (setq offset (- column (current-column)))
             (when (and (eq (char-after) ?\))
                        (not (zerop (car state))))
               (goto-char (cadr state))
               (setq indent (current-indentation)))))
         (when indent
           (indent-line-to indent)
           (and (> offset 0) (forward-char offset)))))

     ;; auto insert `end'
     (ruby-end-mode)

     ;; auto insert pair
     (require 'ruby-electric)
     (setq ruby-electric-expand-delimiters-list nil)
     (define-key ruby-mode-map (kbd "M-|") 'my/insert-vertical-bar)))
