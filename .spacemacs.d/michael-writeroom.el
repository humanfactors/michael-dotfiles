(with-eval-after-load 'writeroom-mode
  (setq writeroom-mode-line t)
  (setq writeroom-width 120)
  (define-key writeroom-mode-map (kbd "C-M-<") #'writeroom-decrease-width)
  (define-key writeroom-mode-map (kbd "C-M->") #'writeroom-increase-width)
  )



(defun michael-writing-concentration-mode ()
  "Sets a serif font in current buffer & writeroom mode"
  (interactive)
  (setq buffer-face-mode-face '(:family "Source Sans Pro" :height 110 :weight normal))
  (when (require 'writeroom-mode nil) (writeroom-mode))
  (spacemacs/scale-up-font)
  (spacemacs/scale-up-font)
  (buffer-face-mode))

(spacemacs/set-leader-keys "obw" 'michael-writing-concentration-mode)
