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
)


(setq easy-hugo-basedir "~/blog/"
      easy-hugo-postdir "content/blog"
      easy-hugo-url "http://michael.humanfactors.io"
      easy-hugo-preview-url "http://localhost:1313"
      easy-hugo-default-picture-directory "~/Pictures"
      easy-hugo-default-ext ".md"
      easy-hugo-previewtime "20")