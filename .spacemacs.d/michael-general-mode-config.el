
(with-eval-after-load 'projectile
  (setq projectile-switch-project #'projectile-find-dir)
  (setq projectile-find-dir-includes-top-level t))

(setq projectile-switch-project-action #'projectile-dired)
(setq projectile-switch-project-action #'projectile-find-dir)
(setq projectile-find-dir-includes-top-level t)

(setq doc-view-continuous t)


