Żeby wprowadzić symbol dużego kwantyfikatora należy napisać `\forall`. Dla nasz duży kwantyfikator
to nic innego jak zapisanie parametru po drugiej stronie dwukropka. Zwracam uwagę, że po zmiennej
zmiennej związanej kwantyfikatorem musi się pojawić przecinek, a po ostatnim takim przecinku nie ma
już dwukropka. Zrób proszę tyle dowodów i w taki sposób, w jaki tylko masz ochotę.

```lean
theorem t1a : ∀ p : Prop, p → p :=

theorem t1b (p : Prop) : ∀ h : p, p :=

-- Ten skrót działa tak samo jak (p q : Prop)
theorem t2 : ∀ p q : Prop, p → q → p :=

theorem t3a : ∀ p : Prop, p → p → p :=

-- Panika jest zrozumiała. I jednocześnie nie ma powodu do paniki.
theorem t3b : ∀ p : Prop, ∀ h1 : p, p → p :=

theorem t3c : ∀ p : Prop, ∀ h1 : p, ∀ h2 : p, p :=

def t4 : ∀ p q : Prop, q → p → p :=

axiom r : Prop
theorem t5 : ∀ p : Prop, p → r :=
```

Trzymam kciuki.
