## O czym teraz będzie

Znowu zadania. No cóż.

<hr>

Żeby wprowadzić symbol dużego kwantyfikatora należy napisać `\forall`. Dla nas duży kwantyfikator to
nic innego jak zapisanie parametru po prawej od głównego dwukropka w definicji twierdzenia (albo
dowolnej funkcji). Zwracam uwagę, że po zmiennej związanej takim kwantyfikatorem musi się pojawić
przecinek i po ostatnim takim przecinku dwukropka już nie piszemy.

Zrób proszę tyle dowodów i w taki sposób, w jaki tylko masz ochotę, ale nie więcej. Albo, jeśli masz
ochotę zrobić więcej, niż masz ochotę zrobić, to zrób właśnie tyle. Wybór, jak zawsze, należy do
Ciebie.

```lean
-- Gdy po prawej od głównego dwukropka, czyli w typie twierdzenia, jest na przykład ∀ (p : Prop), to wpisując w trybie
-- interaktywnym intro p sprawisz, że stan dowodu będzie wyglądał tak, jakby (p : Prop) było parametrem twierdzenia.
-- To znaczy, przyjmiesz założenie, że masz jakieś zdanie p. W ten sposób zaczniesz konstruować dowód
-- *dla każdego p typu Prop*. Twój aktualny cel ulegnie wtedy uproszczeniu, bo poprzednik wskoczy do kontekstu. Zmienna
-- związana przez duży kwantyfikator może mieć dowolny inny typ i konstruowanie dowodu będzie wtedy przebiegało tak samo.
--
-- To jest to samo, tylko jedna wersja jest zapisana z użyciem symbolu dużego kwantyfikatora:
-- ...  t1a :  (p : Prop) → p → p :=
theorem t1a : ∀ (p : Prop), p → p :=

theorem t1b (p : Prop) : ∀ (h : p), p :=

-- ∀ (p q : Prop) znaczy to samo co (p q : Prop).
theorem t2 : ∀ (p q : Prop), p → q → p :=

-- Nawiasy po dużym kwantyfikatorze nie są konieczne
theorem t3a : ∀ p : Prop, p → p → p :=

-- Panika jest zrozumiała. I jednocześnie nie ma powodu do paniki.
theorem t3b : ∀ (p : Prop), ∀ (h1 : p), p → p :=

theorem t3c : ∀ (p : Prop), ∀ (h1 : p), ∀ (h2 : p), p :=

def t4 : ∀ (p q : Prop), q → p → p :=

axiom r : Prop
-- O tym wcześniej zapomniałem, a nie dysponując żadnym dowodem zdania r nie da się przecież udowodnić twierdzenia t5.
axiom hr : r 
theorem t5 : ∀ (p : Prop), p → r :=

-- Lukier syntaktyczny (jeżeli wkleiłaś już tą definicję, to nie wklejaj jej ponownie).
def Predykat (typ : Type) : Type := typ → Prop

-- Dowodząc pozostałych twierdzeń w trybie interaktywnym będziesz nadal potrzebować tylko taktyk intro i exact,
-- tyle, że czasem będziesz wprowadzać do kontekstu jakaś liczbę naturalną n, a czasem jakąś hipotezę
-- będącą aplikacją jakiegoś predykatu do tej liczby.

-- Możemy to odczytać tak: Jeżeli P jest predykatem dotyczącym liczb naturalnych (dla każdego predykatu P dotyczącego
-- liczb naturalnych), dla każdej liczby naturalnej n, jeżeli P n to P n.
theorem t6 (P : Predykat Nat) : ∀ n : Nat, P n → P n :=

theorem t6' (P : Predykat Nat) (n : Nat) : P n → P n :=

theorem t6'' : ∀ P : Predykat Nat, ∀ n : Nat, P n → P n :=

theorem t7 (P Q : Predykat Nat) : ∀ n : Nat, (P n → Q n) → P n → Q n :=

theorem t7' (P : Predykat Nat) : ∀ Q : (Predykat Nat), ∀ n : Nat, (P n → Q n) → P n → Q n :=

theorem t7'' (P Q : Predykat Nat) (n : Nat) : (P n → Q n) → P n → Q n :=
```

Trzymam kciuki.