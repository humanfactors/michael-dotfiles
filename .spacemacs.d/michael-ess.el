;; No more _ to <-
(with-eval-after-load 'ess
(add-hook 'ess-mode-hook
    (lambda()
      (setq ess-disable-underscore-assign t)
      (setq ess-indent-level 2
            tab-width 2)
      (setq ess-fancy-comments nil)
      (setq ess-indent-with-fancy-comments nil))
    (defun then_R_operator ()
      "R - %>% operator or 'then' pipe operator"
      (interactive)
      (just-one-space 1)
      (insert "%>%")
      (reindent-then-newline-and-indent))
    (define-key ess-mode-map (kbd "C-S-M") 'then_R_operator)))
