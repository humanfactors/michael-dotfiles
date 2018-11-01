;; Python
(when-system gnu/linux
  (setq python-shell-interpreter "python3"))

(when-system windows-nt
  (setq python-shell-interpreter "python"))

(setq python-shell-interpreter-args "")
(setq python-tab-width 2)
(setq tab-width 2)
