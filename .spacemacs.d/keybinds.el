;;; FUNCTIONS USED FOR BINDINGS

;; Critical Spacemacs Related Functions
(global-set-key (kbd "C-SPC C-SPC") 'set-mark-command)
(global-set-key (kbd "C-SPC SPC") 'helm-M-x)
(global-set-key (kbd "C-x k") 'spacemacs/kill-this-buffer)
(global-set-key [f12] 'magit)
;; Insert Data time into Spacemacs Keyboard shortcut
(defun insert-current-datetime () (interactive)
       (insert (shell-command-to-string "echo -n $(date '+%A (%B %d) @ %H:%m')")))

;; Insert newline after current line
(defun end-of-line-and-indented-new-line ()
  (interactive)
  (end-of-line)
  (newline-and-indent))
(global-set-key (kbd "<S-return>") 'end-of-line-and-indented-new-line)

  ;; vi-like line insertion
(define-key evil-emacs-state-map (kbd "C-o") (lambda () (interactive)(beginning-of-line)(open-line 1)))
(define-key evil-emacs-state-map (kbd "M-o") (lambda () (interactive)(end-of-line)(newline)))


;; Neotree Quicklook Binds
(with-eval-after-load 'neotree
  (evil-define-key 'evilified neotree-mode-map (kbd "RET") 'neotree-quick-look)
  (evil-define-key 'evilified neotree-mode-map (kbd "S-<return>") 'neotree-enter))

;;; BINDINGS
(define-key global-map (kbd "s-=") 'text-scale-increase)
(define-key global-map (kbd "s--") 'text-scale-decrease)

(global-set-key (kbd "s-n") 'new-frame)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-<backspace>") 'backward-kill-word)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
(global-set-key (kbd "M-<prior>") `previous-buffer)
(global-set-key (kbd "M-<next>") `next-buffer)
(global-set-key (kbd "s-<prior>") `previous-buffer)
(global-set-key (kbd "s-<next>") `next-buffer)
(global-set-key "\C-x\M-d" `insert-current-datetime)
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f5] 'deft)


(global-set-key [f9]  'ispell-word)

;;; Evil Mode Visual Line Interaction Mode
;; Make horizontal movement cross lines
(setq evil-cross-lines t)
;; Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
;; Also in visual mode
(define-key evil-visual-state-map "j" 'evil-next-visual-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)

;; Windows Key Shortcuts
(define-key global-map [?\s-f] 'projectile-find-file)

;; Quick Open Files
;; (spacemacs/set-leader-keys "ocp" (lambda () (interactive) (find-file "~/Dropbox/org/phd-notes.org")))
;; (spacemacs/set-leader-keys "ocf" (lambda () (interactive) (find-file "~/Dropbox/org/freelance.org")))
;; (spacemacs/set-leader-keys "oct" (lambda () (interactive) (find-file "~/Dropbox/org/TODOs.org")))
;; (define-key global-map [?\s-d] (lambda() (interactive)(find-file "~/.spacemacs-user-config.el")))

(global-set-key (kbd "C-x M-1") (lambda() (interactive)(find-file "~/Dropbox/org/")))
(global-set-key (kbd "C-x M-2") (lambda() (interactive)(find-file "~/humanfactors/michael-blog/")))
(global-set-key (kbd "C-x M-3") (lambda() (interactive)(find-file "~/Code/")))
(global-set-key (kbd "C-x M-4") (lambda() (interactive)(dired "~/.spacemacs.d/")))
(global-set-key (kbd "C-x M-5") (lambda() (interactive)(dired "~/PhD/atc-interruptions-derde-main")))
