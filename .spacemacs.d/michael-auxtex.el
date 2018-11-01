
(with-eval-after-load 'tex
  (setq TeX-parse-self t)
  (setq TeX-PDF-mode t)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  (when-system windows-nt
    (add-to-list 'TeX-view-program-list '("TeXWorks" "texworks.exe %o"))
    (setq TeX-view-program-selection '((output-pdf "TeXWorks"))))
  )

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



(with-eval-after-load 'helm-bibtex
  (setq helm-bibtex-cite-default-command 'bibtex-completion-insert-citation)
 )

 