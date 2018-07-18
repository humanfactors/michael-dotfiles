;; Python
(setq python-shell-interpreter "python")
(setq python-shell-interpreter-args "")
(setq python-tab-width 2)
(setq tab-width 2)

;; Go mode

;; Shell Config
;; (setq explicit-shell-file-name "/bin/bash")
;; (setq explicit-shell-file-name "c:/Windows/System32/bash.exe")
;; Pandoc
;; (setq org-pandoc-options-for-markdown '((atx-headers . t)))
;; (setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")))

;; Golden Ratio
(require 'golden-ratio)

;; Ranger Mode
(setq ranger-override-dired t)
(setq ranger-show-literal t)
(setq ranger-width-preview 0.55)
(setq ranger-ignored-extensions '("mkv" "iso" "mp4"))
(setq ranger-max-preview-size 10)
(setq ranger-max-parent-width 0.12)
(setq ranger-width-parents 0.12)
(setq ranger-parent-depth 2)

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
;; (add-hook 'fill-nobreak-predicate
;; #'markdown-inline-code-at-point-p)


;; Default to insert git commit
(add-hook 'git-commit-mode-hook 'evil-insert-state)


;; No more _ to <-
(setq ess-disable-underscore-assign t)

;; no more fancy comments

(add-hook 'ess-mode-hook
          (lambda()
            (setq ess-indent-level 2
                  tab-width 2)
            (setq ess-fancy-comments nil)
            (setq ess-indent-with-fancy-comments nil)))
