;; Deft (nv) config
(setq deft-extensions '("org" "md" "tex" "txt"))
(setq deft-directory "~/Dropbox/Notes")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)


(with-eval-after-load 'deft
  (define-key deft-mode-map (kbd "C-<return>") 'deft-new-file))

