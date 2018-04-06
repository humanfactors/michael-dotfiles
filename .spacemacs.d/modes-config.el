;; Python
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "")
(setq python-tab-width 4)

;; Shell Config
(setq explicit-shell-file-name "/bin/bash")

;; Pandoc
;; (setq org-pandoc-options-for-markdown '((atx-headers . t)))
;; (setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")))

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

;; Add Rmarkdown as Markdown
(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.rmd\\'" . markdown-mode))

;; Fix inline codeblocks being split in markdown mode in Rmarkdown documents when filling
(add-hook 'fill-nobreak-predicate
#'markdown-inline-code-at-point-p)


;; Default to insert git commit
(add-hook 'git-commit-mode-hook 'evil-insert-state)
