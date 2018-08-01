(fset 'backup-thesis
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item
         (quote ([escape 32 111 111 116 134217848 109 97 114 107
   M-backspace 100 105 114 101 100 45 109 97 114 107 tab tab 45
   114 101 tab return 109 105 99 104 97 101 108 45 117 119 97
   return 134217848 100 105 114 101 100 45 99 backspace 100 111
   tab 45 99 111 tab 112 121 return left left left left down
   right down down right 134217848 100 backspace 100 114
   backspace 105 backspace backspace 102 105 105 108 101 tab tab
   backspace backspace backspace backspace backspace 109 105 99
   104 97 101 108 tab 102 105 tab return 46 100 111 99 120
   return] 0 "%d")) arg)))

(fset 'rmarkdown-uncomment-and-fill
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 67108923 24 24 134217841] 0 "%d")) arg)))


(defun rmarkdown-insert-code-block ()
  (interactive)
  (markdown-insert-gfm-code-block "{r}"))

(defun rmarkdown-clean-comment ()
  (interactive
  (spacemacs/comment-or-uncomment-lines)
  (fill-region))
  )
(global-set-key (kbd "C-c f") 'rmarkdown-insert-code-block)
