;; Icons & doom
(setq neo-theme 'icons)

;; (setq cua-mode nil)
(setq evil-normal-state-cursor 'square)
;; Text Editing and Selection Configuration
(delete-selection-mode 1)
(setq-default fill-column 100)
(setq mouse-yank-at-point nil) ;; Fixes bug associated with middle click paste for spell check
(setq auto-fill-mode 1)
(setq tab-width 4) ; or any other preferred value
(setq-default
 isearch-allow-scroll t                 ; Allow scrolling in an isearch session
 lazy-highlight-cleanup t             ; Leave highlights after an isearch session
 lazy-highlight-initial-delay 0)        ; Start highlighting immediately

;; ‘M-y’ (‘yank-pop’) cycles backwards through the ‘kill-ring’.
;; Here’s a way to cycle in the reverse direction with ‘M-Y’ (Meta-Shift-Y):
(defun yank-pop-forwards (arg)
  (interactive "p")
  (yank-pop (- arg)))
(global-set-key "\M-Y" 'yank-pop-forwards) ; M-Y (Meta-Shift-Y)

;;; Buffer Display Configuration
(setq powerline-default-separator 'utf-8)
(setq word-wrap 1)
(global-visual-line-mode t)

;;; GUI Configuration
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(menu-bar-mode 1)

;; Scrolling
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Link Behaviour
(setq vc-follow-symlinks t)

;; Evil fine undo
(setq evil-want-fine-undo t)

;; Disable autosaving and backups and lockfiles
(setq
 auto-save-default t
 backup-inhibited t
 create-lockfiles nil)

;; Allow 20MB of memory (instead of 0.76MB default) before calling
;; garbage collection. This means GC runs less often, which speeds
;; up some operations
(setq gc-cons-threshold 20000000)

;; By default, BACKSPACE ON EMACS turns a tab character into a set of spaces
;; & deletes one. This sets backspace to delete 1 character instead of 1 column.
(global-set-key (kbd "DEL") 'backward-delete-char)

;; Search settings
;; (define-key global-map [remap isearch-forward] 'isearch-forward-regexp)
;; (define-key global-map [remap isearch-backward] 'isearch-backward-regexp)

;; M-up and M-down move lines
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;; intuitive window resizing
(defun xor (b1 b2)
  (or (and b1 b2)
      (and (not b1) (not b2))))

(defun move-border-left-or-right (arg dir)
  "General function covering move-border-left and move-border-right. If DIR is
     t, then move left, otherwise move right."
  (interactive)
  (if (null arg) (setq arg 3))
  (let ((left-edge (nth 0 (window-edges))))
    (if (xor (= left-edge 0) dir)
        (shrink-window arg t)
        (enlarge-window arg t))))

(defun move-border-up-or-down (arg dir)
  "General function covering move-border-up and move-border-down. If DIR is
     t, then move up, otherwise move down."
  (interactive)
  (if (null arg) (setq arg 3))
  (let ((top-edge (nth 1 (window-edges))))
    (if (xor (= top-edge 0) dir)
        (shrink-window arg nil)
        (enlarge-window arg nil))))

(defun move-border-left (arg)
  (interactive "P")
  (move-border-left-or-right arg t))

(defun move-border-right (arg)
  (interactive "P")
  (move-border-left-or-right arg nil))

(defun move-border-up (arg)
  (interactive "P")
  (move-border-up-or-down arg t))

(defun move-border-down (arg)
  (interactive "P")
  (move-border-up-or-down arg nil))

(global-set-key (kbd "M-C-[") 'move-border-left)
(global-set-key (kbd "M-C-]") 'move-border-right)
(global-set-key (kbd "M-C-}") 'move-border-up)
(global-set-key (kbd "M-C-{") 'move-border-down)

(defmacro when-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))


(defun open-directory-in-system-viewer ()
  (interactive)
  (when-system gnu/linux
    (if default-directory
        (browse-url-of-file (expand-file-name default-directory))
      (error "No `default-directory' to open")))
  (when-system windows-nt
    (if default-directory
        (w32explore (expand-file-name default-directory))
      (error "No `default-directory' to open"))))

;; (with-eval-after-load 'company
;; ;; Add yasnippet support for all company backends
;; ;; https://github.com/syl20bnr/spacemacs/pull/179
;; (defvar company-mode/enable-yas t
;;   "Enable yasnippet for all backends.")

;; (defun company-mode/backend-with-yas (backend)
;;   (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;;       backend
;;     (append (if (consp backend) backend (list backend))
;;             '(:with company-yasnippet))))

;; (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
