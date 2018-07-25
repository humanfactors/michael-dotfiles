;; Org Directory


;; Org Configuration
(with-eval-after-load 'org
  ;; (setq org-agenda-files '("~/Dropbox/org/"))
  ;; (setq org-agenda-custom-commands
  ;; '(("c" "Simple agenda view"
  ;; ((agenda "")
  ;; (alltodo "")))))

  (add-to-list 'org-latex-classes
               '("meetingmins"
                 "\\documentclass{meetingmins}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  ;; Inline code evaluation
  (setq org-confirm-babel-evaluate nil)
  ;; (org-babel-do-load-languages
  ;; 'org-babel-load-languages
  ;; '((R . t)))

  (setq org-directory "~/Dropbox/org/")

  (setq org-agenda-files (list "~/Dropbox/org/"
                               "~/Dropbox/Thesis"
                               ))

  (setq org-publish-project-alist
        '(("org"
           :base-directory "~/Dropbox/org/"
           :publishing-directory "~/Dropbox/org/html"
           :publishing-function org-html-publish-to-html
           :section-numbers nil
           :with-toc nil
           :html-head "<link rel=\"stylesheet\"
                    href=\"solarized-light.css\"
                    type=\"text/css\"/>"
           :auto-sitemap t                ; Generate sitemap.org automagically...
           :sitemap-filename "index.org"
           :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
           )))

  (org-defkey org-mode-map [(meta return)] 'org-meta-return)

  ;; Org Mode
  (setf org-blank-before-new-entry '((heading . auto) (plain-list-item . nil)))
  (setq org-hierarchical-todo-statistics t)
  (setq org-bullets-mode nil)
  (setq org-support-shift-select t)

  (defun org-insert-subheading-end ()
    (interactive)
    (when (org-at-heading-p)
      (end-of-line)
      (call-interactively 'org-insert-subheading )))

  (add-hook 'org-mode-hook (lambda ()
                             (spacemacs/set-leader-keys "obr" 'org-tree-open-in-right-frame)
                             (spacemacs/set-leader-keys "obb" 'org-tree-to-indirect-buffer)))

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
           "* %?\nEntered on %U\n  %i\n")

          ("c" "Code Snippet" entry (file "~/Dropbox/org/code.org")
           ;; Prompt for tag and language
           "** %^{Snippet description}\t%^g\n#+BEGIN_SRC %^{language}\n%?\n#+END_SRC\n")

          ("d" "Thesis Discussion Idea" entry (file+headline "~/Dropbox/Thesis/thesis.org" "Discussion Ideas")
           "** %^{Idea Title}\n %?%i \n")

          ("i" "Thesis Introduction Idea" entry (file+headline "~/Dropbox/Thesis/thesis.org" "Introduction Ideas")
           "** %^{Idea Title}\n %?%i \n")

          ))
  (setq org-todo-keywords
        '((sequence "TODO" "REMEMBER" "WAITING" "|" "DONE" "CANCELLED")))
  )
