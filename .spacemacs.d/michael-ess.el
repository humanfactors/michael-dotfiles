(with-eval-after-load 'ess

  ;; Essential Settings
  (setq ess-indent-with-fancy-comments nil)
  (setq ess-disable-underscore-assign t)
  (setq ess-smart-S-assign-key nil)
  (setq ess-eval-visibly 'nowait)

  (defun then_R_operator ()
    "R - %>% operator or 'then' pipe operator"
    (interactive)
    (just-one-space 1)
    (insert "%>%")
    (reindent-then-newline-and-indent))
  (define-key ess-mode-map (kbd "C-S-M") 'then_R_operator)


  (defun tide-insert-assign ()
    "Insert an assignment <-"
    (interactive)
    (insert "<- "))
  (define-key ess-mode-map (kbd "C-'") 'tide-insert-assign)

  ;; Mark a word at a point ==============================================
  ;; http://www.emacswiki.org/emacs/ess-edit.el
  (defun ess-edit-word-at-point ()
    (save-excursion
      (buffer-substring
       (+ (point) (skip-chars-backward "a-zA-Z0-9._"))
       (+ (point) (skip-chars-forward "a-zA-Z0-9._")))))
  ;; eval any word where the cursor is (objects, functions, etc)
  (defun ess-eval-word ()
    (interactive)
    (let ((x (ess-edit-word-at-point)))
      (ess-eval-linewise (concat x)))
    )
  ;; key binding
  (define-key ess-mode-map (kbd "C-c r") 'ess-eval-word)


  ;; Every Buffer Hooks
  (add-hook 'ess-mode-hook
            (setq ess-indent-level 2)
            (setq tab-width 2)
            (setq ess-fancy-comments nil))
  )

    ;; (defun df-at-point-to-buffer (&optional numrows)
    ;; "output a sample of another data.frame to and jump to buffer."
    ;; (let ((object (symbol-at-point))
    ;;       (r-process (ess-get-process))
    ;;       (r-output-buffer (get-buffer-create "*R-output*"))
    ;;       (numrows (or numrows 300)))
    ;;   (ess-command
    ;;    (format "mmmisc::df_preview(%s, %s)\n" object numrows)
    ;;    r-output-buffer nil nil nil r-process)
    ;;   (switch-to-buffer-other-window r-output-buffer)))
