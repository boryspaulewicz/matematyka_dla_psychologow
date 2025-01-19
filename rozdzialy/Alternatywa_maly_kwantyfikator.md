# ∨ i ∃
W Leanie `∨` to tylko lukier składniowy pod którym kryje się stała `Or`, oznaczająca indukcyjny typ
danych zdefiniowany w taki oto sposób:

```lean
inductive Or (a b : Prop) : Prop where
  -- `Or.inl` to "lewa injekcja" w (koprodukt i jednocześnie typ) `Or`.
  -- Jeżeli `h : a`, to `Or.inl h : a ∨ b`.
  | inl (h : a) : Or a b
  -- `Or.inr` to "prawa injekcja" w `Or`.
  -- Jeżeli `h : b`, to `Or.inr h : a ∨ b`.
  | inr (h : b) : Or a b
```

Komentarze są tutaj moimi tłumaczeniami tego, co można znaleźć w pliku
[Prelude.lean](https://github.com/leanprover/lean4/blob/master/src/Init/Prelude.lean).

TODO Objaśnienie tej definicji. Napisać też coś o tym, że tu są parametry w konstruktorach i co z
tego wynika.

TODO O tym dlaczego mówimy czasem indukcyjny typ danych.
