/-

  Większość tych zadań "ukradłem" ze znakomitej książki *Theorem Proving in Lean 4*
  (https://lean-lang.org/theorem_proving_in_lean4/), dodałem tylko komentarze.
 
  Proszę zgłaszać trudności.

-/

-- O tym będzie mowa. Będziemy pisać predykaty z małej litery, bo tak jest szybciej.
variable {α : Type} {p q : α → Prop} {r : Prop}

-- Term `x : α` nie odgrywa tu ważnej roli. Może najpierw `by intro <odpowiedni_wzorzec>`?
example : (∃ x : α, r) → r := sorry

-- Tu musimy skorzystać z dostępnego w kontekście (bo pojawia się przed głównym dwukropkiem) termu
-- `a` typu `α`, za to w taki jakby "dziwny" sposób.
example (a : α) : r → (∃ x : α, r) := sorry

-- Dopasowanie wzorca (tutaj zagnieżdżone) jest Twoim przyjacielem! Ja zaczynam zwykle dowodzenie
-- równoważności od podwójnych przeprosin `⟨sorry, sorry⟩` (bo równoważność to koniunkcja dwóch
-- implikacji). Nie od razu to widać, ale to jest "tak naprawdę" rozdzielność mnożenia względem
-- dodawania! `∃ x, p x` to uogólniona alternatywa, a więc uogólniony koprodukt, czyli uogólnione
-- dodawanie, a koniunkcja to produkt, czyli pewnego uogólnione mnożenie. Analogicznie, ...
--
-- `r ∧ (p ∨ q) ↔ (r ∧ p) ∨ (r ∧ q)`
--
-- bo z perspektywy kategoryjnej widać, że to jest (z dokładnością do kanonicznych izomorfizmów) to
-- samo, co ...
--
-- `r × (p + q) ≅ (r × p) + (r × q)`.
example : (∃ x, p x ∧ r) ↔ (∃ x, p x) ∧ r := sorry

-- Przypominam, że zdanie do udowodnienia jest za głównym dwukropkiem, a `a : α` (aaa?!) jest od
-- razu w kontekście. Poprzednik implikacji do udowodnienia jest tutaj *funkcją*, pamiętasz?
example (a : α) : (∀ x : α, r) → r := sorry

-- Jeśli coś już masz (tutaj dowód `r`), to możesz to (w pewnym sensie) zrobić z czegokolwiek.
example : r → (∀ x : α, r) := sorry

-- To zadanie ilustruje w pewnym sensie sens zdania o postaci `∃ x, P x`, bo mówi jakie są dokładnie
-- *arbitralne konsekwencje* tego rodzaju zdania. W ogóle zdania równoważne mają w pewnym sensie (a
-- dokładniej, w sensie zbioru ich konsekwencji) ten sam sens (tak wiem).
example : (∀ x, p x → r) ↔ (∃ x, p x) → r := sorry

-- To jest "tak naprawdę" ten sam (z dokładnością do izomorfizmu {uogólniony}) produkt, tylko ma
-- człony poprzestawiane. A więc to jest znowu zdanie, o którym wiesz z góry (dzięki temu, że znasz
-- pojęcie produktu), że jest prawdziwe.
example : (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) := sorry

-- Co ciekawe, implikacja w drugą stronę nie jest twierdzeniem.
example : (∀ x, p x → q x) → (∀ x, p x) → (∀ x, q x) := sorry

-- Bo `∀ x, p x` to uogólniony produkt, widzisz to? Zdanie z lewej mówi, że istnieją strzałki z `r`
-- do każdego `p x`-a, a zdanie z prawej mówi, że istnieje strzałka z `r` do uogólnionej koniunkcji,
-- a więc do uogólnionego produktu `p x`-ów. Udowodniłaś już dawno ten izomorfizm, czyli tutaj
-- równoważność, tyle, że dla produktów dwóch obiektów, a tu jest tyle obiektów, ile jest `x`-ów
-- (czyli w tym kontekście nie wiadomo ile).
example : (∀ x, r → p x) ↔ (r → ∀ x, p x) := sorry

-- Korzystając z głębokiego związku między produktem, koproduktem, mnożeniem i dodawaniem, możemy
-- również i tu dostrzec rozdzielności mnożenia względem dodawania. Wobec czego nie musimy niczego
-- udowadniać. Ale możemy, dla zabawy.
example : (∀ x, p x) ∨ (∀ x, q x) → ∀ x, p x ∨ q x := sorry

-- A to są tylko inaczej zapisane, funkcjonalnie te same bo izomorficzne, uogólnione koprodukty.
example : (∃ x, p x ∨ q x) ↔ (∃ x, p x) ∨ (∃ x, q x) := sorry

----------------------------------------------------------------------------------------------------
-- Kwantyfikatory i negacja.

example : (¬ ∃ x, p x) ↔ (∀ x, ¬ p x) := sorry

-- Reszta klasycznie, wobec czego trzeba będzie użyć aksjomatu wyłączonego środka, który w Leanie
-- jest twierdzeniem `em`, zdefiniowanym w przestrzeni nazw `Classical`.
section
-- Dzięki temu do końca tej sekcji można pisać krótko `em` zamiast `Classical.em`.
open Classical

-- Zaczniemy od rozgrzewki. Trzeba tu użyć aksjomatu `em` w najprostszy możliwy sposób.
example : r ∨ ¬r := sorry

-- A tutaj trzeba go użyć w niemal najprostszy możliwy sposób.
example : p x ∨ ¬(p x) := sorry

-- Nigdzie nam się nie spieszy. To wszystko ma NIE być szczególnie frustrujące.
example : (¬ ∀ x, p x) ↔ (∃ x, ¬ p x) := sorry

example : (∃ x, p x) ↔ ¬ (∀ x, ¬ p x) := sorry

example : (∀ x, p x) ↔ ¬ (∃ x, ¬ p x) := sorry

end
