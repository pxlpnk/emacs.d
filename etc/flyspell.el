(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'ruby-mode-hook 'flyspell-prog-mode)
(defun turn-on-flyspell ()
   "Force flyspell-mode on using a positive arg.  For use in hooks."
   (interactive)
   (flyspell-mode 1))
