(with-eval-after-load 'tex
  (setq TeX-parse-self t)
  (setq TeX-PDF-mode t)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  (when-system windows-nt
    (add-to-list 'TeX-view-program-list '("TeXWorks" "texworks.exe %o"))
    (setq TeX-view-program-selection '((output-pdf "TeXWorks"))))
  )
