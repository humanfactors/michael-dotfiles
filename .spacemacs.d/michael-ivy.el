;; http://pragmaticemacs.com/emacs/counsel-yank-pop-with-a-tweak/
;;  I use the following code to configure counsel-yank-pop to replace the standard yank-pop on M-y. The only thing I missed about the vanilla yank-pop was that repeatedly pressing M-y cycled through the entries. The counsel version doesn’t do this by default but this is easy to add by binding M-y to ivy-next-line in the ivy-minibuffer-map. 
(with-eval-after-load 'counsel
  (global-set-key  "\M-y" 'yank-pop)
  (define-key ivy-minibuffer-map (kbd "<left>") 'counsel-up-directory)
  (define-key ivy-minibuffer-map (kbd "M-y") 'ivy-next-line))

;; No more 
(setq ivy-initial-inputs-alist nil)

