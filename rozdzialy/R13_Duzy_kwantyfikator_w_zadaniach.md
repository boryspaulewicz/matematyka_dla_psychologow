## O czym teraz będzie

Skoro znowu proponuję Ci zadania, to może przypomnę, że moim zdaniem zadania "robi się" tylko wtedy,
gdy ma się na to *ochotę*.

<hr>

Symbol dużego kwantyfikatora uzyskasz w Leanie pisząc `\forall`. Dla nas to alternatywny sposób
zapisania parametru po prawej od głównego dwukropka w typie funkcji, a więc w szczególności również
twierdzenia. Zwracam uwagę, że po zmiennej związanej tak zapisanym kwantyfikatorem musi się pojawić
przecinek, a po ostatnim takim przecinku dwukropka już nie piszemy.

Jeżeli jest jeszcze w tym momencie dezorientujący, to cały ten fragment stanie się być może bardziej
zrozumiały, a nawet oczywisty, gdy już wykonasz jedno czy dwa zadania w trybie interaktywnym: Jeżeli
po prawej od głównego dwukropka, czyli w (zwykle parametrycznym) zdaniu będącym treścią twierdzenia,
czyli w typie rezultatu twierdzenia jako funkcji, jest na przykład `∀ (p : Prop)`, to wpisując w
trybie interaktywnym `intro p` sprawisz, że stan dowodu będzie wyglądał tak, jakby `(p : Prop)` było
parametrem twierdzenia. Można to rozumieć jako początek konstruowania λ-abstrakcji, albo jako
przyjęcie założenia, że masz jakieś zdanie `p`. W ten sposób zaczniesz konstruować dowód *dla
każdego `p` typu `Prop`*. Twój aktualny cel ulegnie wtedy uproszczeniu, bo (uogólniony, dlatego w
cudzysłowie) "poprzednik" zostanie "oderwany" i "wskoczy" do kontekstu. Nawiasem mówiąc, zmienna
związana przez duży kwantyfikator może mieć w Leanie jakikolwiek inny typ, i konstruowanie termu
będzie wtedy przebiegało zasadniczo w ten sam sposób.

```lean
-- To jest to samo, tylko jedna wersja jest zapisana z użyciem dużego kwantyfikatora:
-- ...  t1a :  (p : Prop) → p → p :=
theorem t1a : ∀ (p : Prop), p → p :=

theorem t1b (p : Prop) : ∀ (h : p), p :=

-- `∀ (p q : Prop)` znaczy to samo, co `(p q : Prop)`.
theorem t2 : ∀ (p q : Prop), p → q → p :=

-- Nawiasy po dużym kwantyfikatorze nie są konieczne.
theorem t3a : ∀ p : Prop, p → p → p :=

-- Panika jest zrozumiała. I jednocześnie nie ma powodu do paniki.
theorem t3b : ∀ (p : Prop), ∀ (h1 : p), p → p :=

theorem t3c : ∀ (p : Prop), ∀ (h1 : p), ∀ (h2 : p), p :=

def t4 : ∀ (p q : Prop), q → p → p :=

axiom r : Prop
axiom hr : r 
theorem t5 : ∀ (p : Prop), p → r :=
```

Dowodząc pozostałych twierdzeń w trybie interaktywnym będziesz nadal potrzebować tylko taktyk
`intro` i `exact`, tyle, że czasem będziesz wprowadzać do kontekstu jakaś liczbę naturalną (a więc
coś, co nie jest dowodem żadnego zdania, tylko pewnym "obiektem niepropozycjonalnym"), a czasem
jakąś hipotezę (czyli *hipotetyczny* albo "opakowany" dowód pewnego zdania, a więc pewne założenie,
albo pewien "obiekt propozycjonalny"), będącą aplikacją jakiegoś predykatu do tej liczby.

```lean
-- To jest znany Ci przykład lukru syntaktycznego (jeżeli wkleiłaś już tą definicję, to nie wklejaj
-- jej ponownie).
def Predykat (typ : Type) : Type := typ → Prop

-- Możemy to odczytać tak: Jeżeli `P` jest predykatem dotyczącym liczb naturalnych (dla każdego
-- predykatu `P` dotyczącego liczb naturalnych ...), to jeżeli `n` jest liczbą naturalną (... i dla
-- każdej liczby naturalnej `n`), jeżeli `P n`, to `P n`.
theorem t6 (P : Predykat Nat) : ∀ n : Nat, P n → P n :=

theorem t6' (P : Predykat Nat) (n : Nat) : P n → P n :=

theorem t6'' : ∀ P : Predykat Nat, ∀ n : Nat, P n → P n :=

theorem t7 (P Q : Predykat Nat) : ∀ n : Nat, (P n → Q n) → P n → Q n :=

theorem t7' (P : Predykat Nat) : ∀ Q : (Predykat Nat), ∀ n : Nat, (P n → Q n) → P n → Q n :=

theorem t7'' (P Q : Predykat Nat) (n : Nat) : (P n → Q n) → P n → Q n :=
```
