## O czym teraz będzie

Znowu zadania. No cóż.

<hr>

Żeby wprowadzić symbol dużego kwantyfikatora należy napisać `\forall`. Dla nas duży kwantyfikator to
nic innego jak zapisanie parametru po prawej od dwukropka. Zwracam uwagę, że po zmiennej związanej
takim kwantyfikatorem musi się pojawić przecinek, a po ostatnim takim przecinku dwukropka już nie
piszemy. 

Zrób proszę tyle dowodów i w taki sposób, w jaki tylko masz ochotę, ale nie więcej. Albo, jeśli masz
ochotę zrobić więcej, niż masz ochotę zrobić, to zrób właśnie tyle. Wybór, jak zawsze, należy do
Ciebie.

Jeżeli czujesz się niepewnie, może najlepiej będzie zacząć od trybu interaktywnego i stosować się do
następujących reguł:

1. Gdy celem jest coś ze strzałka, to być może trzeba użyć taktyki `intro`

```lean
-- Gdy po prawej od głównego dwukropka, czyli w typie twierdzenia, jest na przykład ∀ (p : Prop), to wpisując w trybie
-- interaktywnym intro p sprawisz, że stan dowodu będzie wyglądał tak, jakby (p : Prop) było parametrem twierdzenia.
-- To znaczy, przyjmiesz założenie, że masz jakieś p typu Prop. W ten sposób zaczniesz konstruować dowód
-- *dla każdego p typu Prop*. Od razu też uprości się Twój aktualny cel.
--
-- Poza tym, to jest to samo, tylko jedna wersja jest zapisana z użyciem symbolu dużego kwantyfikatora:
-- ...  t1a :  (p : Prop) → p → p :=
theorem t1a : ∀ (p : Prop), p → p :=

theorem t1b (p : Prop) : ∀ (h : p), p :=

-- Ten skrót działa tak samo jak (p q : Prop)
theorem t2 : ∀ (p q : Prop), p → q → p :=

-- Nawiasy po dużym kwantyfikatorze nie są konieczne
theorem t3a : ∀ p : Prop, p → p → p :=

-- Panika jest zrozumiała. I jednocześnie nie ma powodu do paniki.
theorem t3b : ∀ (p : Prop), ∀ (h1 : p), p → p :=

theorem t3c : ∀ (p : Prop), ∀ (h1 : p), ∀ (h2 : p), p :=

def t4 : ∀ (p q : Prop), q → p → p :=

axiom r : Prop
theorem t5 : ∀ (p : Prop), p → r :=
```

Trzymam kciuki.
