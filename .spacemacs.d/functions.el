(defmacro when-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))


(defun michael/new-note-by-date ()
  (interactive)
  "Create an Org file with current time as name."
  (find-file (format-time-string "~/Dropbox/QuickNotes/%Y-%m-%d--%H-%M-%S.md"))
  (insert "---\n")
  (insert "title: \n")
  (insert (concat "date: " (format-time-string "%Y-%m-%d--%H-%M-%S\n")))
  (insert "---\n")
  (goto-line 2)
  (move-end-of-line nil)
  )
