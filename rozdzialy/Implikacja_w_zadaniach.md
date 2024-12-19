# Kilka zadań, które mają pomóc

Dokończ dowody raz definiując funkcje ręcznie, a raz za pomocą trybu interaktywnego:

```lean
theorem t1 (p : Prop) : p → p :=

theorem t2 (p q : Prop) : p → q → p :=

theorem t3 (p : Prop) : p → p → p :=

-- Jedyna różnica między theorem i def jest taka, że funkcje zdefiniowane za pomocą słowa kluczowego theorem
-- nie są rozpakowywane. W przypadku konstruowania dowodu to nie ma znaczenia
def t4 (p q : Prop) : q → p → p :=

axiom r : Prop -- Jeżeli potrzebujesz wskazówek, znajdziesz je pod koniec poprzedniego rozdziału
theorem t5 (p : Prop) : p → r :=
```
