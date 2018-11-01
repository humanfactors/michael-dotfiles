(mapc (lambda (tuple)
        (define-key key-translation-map
          (kbd (concat "<f2> " (nth 0 tuple))) ; Keybinding
          (kbd (nth 1 tuple))))                ; Character to insert
      '(("<up>" "↑")
        ("<down>" "↓")
        ("<left>" "←")
        ("<right>" "→")
        ("S-<up>" "⇑")
        ("S-<down>" "⇓")
        ("S-<left>" "⇐")
        ("S-<right>" "⇒")

        ("p" "▯")   ;; Representation of a cursor
        ("'" "’")
        ("\"" "‘")

        ("8" "•")
        ("*" "°")
        ("d" "†")
        ("D" "‡")
        ("-" "—")
        ("." "…")
        (";" "😉")
        (")" "☺")

        ("a" "α")   ;; Lowercase Greek is uppercase
        ("b" "β")
        ("e" "ε")
        ("l" "λ")
        ("p" "π")
        ("m" "μ")
        ("t" "θ")

        ("!" "¹")   ; For footnotes and things
        ("@" "²")
        ("#" "³")
        ("$" "⁴")

        ("2" "½")   ; Fractions
        ("3" "⅓")
        ("4" "¼")))




X
