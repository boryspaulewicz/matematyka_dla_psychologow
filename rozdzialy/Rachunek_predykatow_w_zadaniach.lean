-- Większość tych zadań "ukradłem" ze znakomitej książki "Theorem Proving in Lean 4". Proszę
-- zgłaszać trudności, żebym wiedział, jak pomóc nie przeszkadzając za bardzo w nauce.

-- O tym będzie mowa.
variable {α : Type} {p q : α → Prop} {r : Prop}

-- Warto tu użyć dopasowania wzorca. Term `x : α` nie odgrywa tu ważnej roli.
example : (∃ x : α, r) → r := sorry

-- Tu musimy skorzystać z dostępnego termu `a` typu `α`, za to w "dziwny" sposób.
example (a : α) : r → (∃ x : α, r) := sorry

-- Dopasowanie wzorca (tutaj zagnieżdżone) jest Twoim przyjacielem!
example : (∃ x, p x ∧ r) ↔ (∃ x, p x) ∧ r := sorry

example (a : α) : (∀ x : α, r) → r := sorry

example : r → (∀ x : α, r) := sorry

-- To zadanie ilustruje "sens" zdania o postaci `∃ x, P x`.
example : (∀ x, p x → r) ↔ (∃ x, p x) → r := sorry

example : (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) := sorry

example : (∀ x, p x → q x) → (∀ x, p x) → (∀ x, q x) := sorry

example : α → ((∀ x : α, r) ↔ r) := sorry

-- Bo ∀ to uogólniony produkt.
example : (∀ x, r → p x) ↔ (r → ∀ x, p x) := sorry

example : (∀ x, p x) ∨ (∀ x, q x) → ∀ x, p x ∨ q x := sorry

example : (∃ x, p x ∨ q x) ↔ (∃ x, p x) ∨ (∃ x, q x) := sorry

----------------------------------------------------------------------------------------------------
-- Kwantyfikatory i negacja.

example : (¬ ∃ x, p x) ↔ (∀ x, ¬ p x) := sorry

-- Reszta klasycznie (trzeba użyć aksjomatu wyłączonego środka `em`, który znajdziemy w przestrzeni
-- nazw `Classical`).
section
-- Dzięki temu do końca tej sekcji można pisać `em` zamiast `Classical.em`.
open Classical

example : (¬ ∀ x, p x) ↔ (∃ x, ¬ p x) := sorry

example : (∃ x, p x) ↔ ¬ (∀ x, ¬ p x) := sorry

example : (∀ x, p x) ↔ ¬ (∃ x, ¬ p x) := sorry

end
