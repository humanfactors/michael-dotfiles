;; Org Directory
(global-set-key (kbd "C-x M-1") (lambda() (interactive)(find-file "~/Dropbox/org/")))

;; Org Configuration
(with-eval-after-load 'org

  (org-defkey org-mode-map [(meta return)] 'org-meta-return)

  ;; Org Mode
  (setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
  (setq org-bullets-mode nil)
  (setq org-blank-before-new-entry nil)
  (setq org-support-shift-select t)

  (defun org-insert-subheading-end ()
    (interactive)
    (when (org-at-heading-p)
    (end-of-line)
    (call-interactively 'org-insert-subheading )))

  (add-hook 'org-mode-hook (lambda ()
                             (spacemacs/set-leader-keys "oe" 'org-tree-open-in-right-frame)
                             (spacemacs/set-leader-keys "oo" 'org-tree-to-indirect-buffer)))

  (defun org-tree-open-in-right-frame ()
    (interactive)
    (org-tree-to-indirect-buffer)
    (windmove-right))
  (define-key org-mode-map (kbd "C-M-<return>") 'org-insert-subheading-end)

  ;; Capture templates
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Dropbox/org/TODOs.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/Dropbox/org/diary.org")
           "* %?\nEntered on %U\n  %i\n")))
  (setq org-todo-keywords
        '((sequence "TODO" "WAITING" "|" "DONE" "HOLD" "CANCELLED")))

  )
