;; Python
(setq python-shell-interpreter-args "")
(setq python-tab-width 2)
(setq tab-width 2)

(when-system gnu/linux
  (setq python-shell-interpreter "python3"))

(when-system windows-nt
  (setq python-shell-interpreter "python"))

;; Pandoc
;; (setq org-pandoc-options-for-markdown '((atx-headers . t)))
;; (setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")))

;; Golden Ratio
(require 'golden-ratio)

;; Ranger Mode
;; (setq ranger-override-dired t)
;; (setq ranger-show-literal t)
;; (setq ranger-width-preview 0.55)
;; (setq ranger-ignored-extensions '("mkv" "iso" "mp4"))
;; (setq ranger-max-preview-size 10)
;; (setq ranger-max-parent-width 0.12)
;; (setq ranger-width-parents 0.12)
;; (setq ranger-parent-depth 2)

;; Markdown Mode
(setq markdown-italic-underscore t)
(setq markdown-asymmetric-header t)
(setq markdown-list-indent-width 4)

(add-hook 'markdown-mode (lambda ()
                           (push '(?< . ("< " . " >")) evil-surround-pairs-alist)))

;; Deft (nv) config
(setq deft-extensions '("org" "md" "tex" "txt"))
(setq deft-directory "~/Dropbox/Notes")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)

(with-eval-after-load 'auctex
  (append-to-list
   'org-latex-classes
   '(("tufte-book"
      "\\documentclass[a4paper, sfsidenotes, justified, notitlepage]{tufte-book}
     \\input{/full/path/to/.templates/tufte-book.tex}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")))))


(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.rmd\\'" . markdown-mode))


;; Add Rmarkdown as Markdown
(with-eval-after-load 'markdown-mode


;; Fix inline codeblocks being split in markdown mode in Rmarkdown documents when filling
  (add-hook 'fill-nobreak-predicate
            #'markdown-inline-code-at-point-p)
  )

(with-eval-after-load 'projectile
  (setq projectile-switch-project #'projectile-find-dir)
  (setq projectile-find-dir-includes-top-level t))
  
;; Default to insert git commit
(add-hook 'git-commit-mode-hook 'evil-insert-state)


;; No more _ to <-

;; no more fancy comments

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
          (define-key (kbd "C-S-M") 'then_R_operator)
          (define-key (kbd "C-S-M") 'then_R_operator)

          )
              
(with-eval-after-load 'easy-hugo

;; Easy Hugo
(defun cesco/easy-hugo ()
  (interactive)
  (evil-define-key
    (list 'normal 'insert 'visual 'motion)
    easy-hugo-mode-map
    "n" 'easy-hugo-newpost
    "D" 'easy-hugo-article
    "p" 'easy-hugo-preview
    "P" 'easy-hugo-publish
    "o" 'easy-hugo-open
    "d" 'easy-hugo-delete
    "e" 'easy-hugo-open
    "c" 'easy-hugo-open-config
    "f" 'easy-hugo-open
    "N" 'easy-hugo-no-help
    "v" 'easy-hugo-view
    "r" 'easy-hugo-refresh
    "g" 'easy-hugo-refresh
    "s" 'easy-hugo-sort-time
    "S" 'easy-hugo-sort-char
    "G" 'easy-hugo-github-deploy
    "A" 'easy-hugo-amazon-s3-deploy
    "C" 'easy-hugo-google-cloud-storage-deploy
    "q" 'evil-delete-buffer
    (kbd "TAB") 'easy-hugo-open
    (kbd "RET") 'easy-hugo-preview))


(add-hook 'easy-hugo-mode-hook 'cesco/easy-hugo)
)

(setq doc-view-continuous t)


(with-eval-after-load 'deft
  (define-key deft-mode-map (kbd "C-<return>") 'deft-new-file)
  )


(setq projectile-switch-project-action #'projectile-dired)
(setq projectile-switch-project-action #'projectile-find-dir)
(setq projectile-find-dir-includes-top-level t)

(with-eval-after-load 'helm-bibtex
  (setq helm-bibtex-cite-default-command 'bibtex-completion-insert-citation)
 )
