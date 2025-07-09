variable {α : Type} {p q : α → Prop} {r : Prop}

-- Term `x : α` nie odgrywa tu ważnej roli. Może najpierw `by intro <odpowiedni_wzorzec>`?
example : (∃ x : α, r) → r := sorry

-- Tu musimy skorzystać z dostępnego w kontekście (bo pojawia się przed głównym dwukropkiem) termu
-- `a` typu `α`, za to w "osobliwy" sposób.
example (a : α) : r → (∃ x : α, r) := sorry

-- Dopasowanie wzorca (tutaj zagnieżdżone) jest Twoim przyjacielem! Ja zaczynam zwykle dowodzenie
-- równoważności od podwójnych przeprosin `⟨sorry, sorry⟩` (bo równoważność to koniunkcja dwóch
-- implikacji). Może nie od razu to widać, ale to jest "tak naprawdę" rozdzielność uogólnionego (do
-- produktu binarnego) mnożenia względem uogólnionego (do uogólnionego koproduktu) dodawania. `∃ x,
-- p x` to uogólniona alternatywa, a więc uogólniony koprodukt, czyli ("podwójnie") uogólnione
-- dodawanie, a koniunkcja to produkt, czyli uogólnione mnożenie. Analogicznie, z perspektywy
-- kategoryjnej widać (po udowodnieniu, czego jeszcze nie zrobiliśmy), że to (akurat tutaj p i q to
-- zdania)...
--
-- `(p ∨ q) ∧ r ↔ (p ∧ r) ∨ (q ∧ r)`
--
-- ... jest tym samym, co to:
--
-- `(p + q) × r ≅ (p × r) + (q × r)`.
example : (∃ x, p x ∧ r) ↔ (∃ x, p x) ∧ r := sorry

-- Przypominam, że zdanie do udowodnienia jest za głównym dwukropkiem, a `a : α` (aaa?) jest od razu
-- w kontekście. Poprzednik implikacji do udowodnienia jest tutaj (nie tylko zdaniem ale również)
-- *funkcją* (a mówiąc dokładniej, poprzednik implikacji, który jest pewnym zdaniem, jest tu typem
-- pewnych funkcji), pamiętasz? Jest również uogólnioną koniunkcją, a więc uogólnionym produktem.
example (a : α) : (∀ x : α, r) → r := sorry

-- Jeżeli coś już masz (tutaj dowód `r`), to możesz to (w pewnym sensie, bo tutaj "osobliwie")
-- zrobić z czegokolwiek.
example : r → (∀ x : α, r) := sorry

-- Mam wrażenie, że zbyt rzadko używam słowa "sens". To zadanie ilustruje w pewnym sensie sens
-- zdania o postaci `∃ x, P x`, bo mówi, jakie są dokładnie *wszystkie konsekwencje* (`r` to tutaj
-- niejawny parametr) tego rodzaju zdania. W ogóle zdania równoważne mają w pewnym sensie (a
-- dokładniej, w sensie zbioru ich konsekwencji) ten sam sens. Zdania równoważne również *wynikają*
-- dokładnie z tych samych zdań. Pomyślałaś może, że wiadomo, że zdania równoważne mają te same
-- logiczne konsekwencje i wynikają z tych samych przesłanek, bo to są przecież izomorfy? To jeszcze
-- nie ten etap? A *mogłabyś* tak pomyśleć.
example : (∀ x, p x → r) ↔ (∃ x, p x) → r := sorry

-- To jest "tak naprawdę" ten sam (z dokładnością do izomorfizmu) produkt (raz jako uogólniony
-- produkt pewnych produktów binarnych, a raz jako produkt binarny pewnych produktów uogólnionych),
-- tylko ma człony poprzestawiane. A więc to jest znowu zdanie, o którym (prawie, bo o tym myślimy w
-- ten sposób na razie życzeniowo) wiesz z góry (dzięki temu, że znasz pojęcie produktu), że jest
-- prawdziwe. (Nawiasem mówiąc, moglibyśmy to zdanie równie dobrze zapisać po kategoriańsku tak ...
--
-- Π x, (p x × q x) ≅ (Π x, p x) × (Π x, q x)
--
-- ..., a na przykład zdanie `∃ x, p x ∨ q x ↔ ∃ x, p x ∨ ∃ x, q x` moglibyśmy zapisać tak:
--
-- Σ x, (p x + q x) ≅ (Σ x, p x) + (Σ x, q x)
-- 
-- A tu musiałem coś napisać, żeby było po czym wstawić prawy nawias).
example : (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) := sorry

-- Co ciekawe, implikacja w drugą stronę *nie* jest twierdzeniem. Da się nawet zobaczyć (na
-- wyobrażonym diagramie), że nie jest, rozpoznając tu strzałkę z produktu do produktu (druga
-- implikacja) i *strzałkę produktową* (pierwszy poprzednik), o której jeszcze nie mówiłem (strzałka
-- produktowa to co innego niż znany Ci już *produkt strzałek*). Trzeba tylko dostrzec, że mamy tu
-- tyle obiektów `p x` i `q x`, ile jest `x`-ów (czyli nie wiadomo ile, ha ha ha {ale poważnie,
-- faktycznie nie wiadomo}).
example : (∀ x, p x → q x) → (∀ x, p x) → (∀ x, q x) := sorry

-- Bo `∀ x, p x` to uogólniony produkt, *widzisz* to już trochę? Zdanie z lewej mówi (patrzą na nie
-- tym razem *nie* jako na produkt), że istnieją strzałki z `r` do każdego `p x`-a, a zdanie z
-- prawej mówi, że istnieje strzałka z `r` do uogólnionej koniunkcji, a więc do uogólnionego
-- produktu `p x`-ów. Udowodniłaś już dawno ten izomorfizm, czyli tutaj równoważność (bo to jest
-- akurat logika), tyle, że dla produktów dwóch obiektów, a tu jest tyle obiektów, ile jest `x`-ów
-- (czyli w tym kontekście nie wiadomo ile).
example : (∀ x, r → p x) ↔ (r → ∀ x, p x) := sorry

-- Czy korzystając z głębokiego związku między produktem, koproduktem, mnożeniem i dodawaniem,
-- możemy również i tu dostrzec rozdzielności mnożenia względem dodawania? Nie możemy, implikacja
-- "działa" tu tylko w jedną stronę! Mogłoby na przykład być tak, że dla każdego `x`, albo `p x`,
-- albo `q x`, ale nieprawda, że `p x` i `q x`, a więc dla pewnych `x`-ów zdanie `p x` byłoby
-- fałszywe, i tak samo dla pewnych `x`-ów zdanie `q x` byłoby fałszywe. Wtedy następnik tej
-- implikacji byłby prawdziwy, a poprzednik fałszywy, bo byłby alternatywą dwóch fałszywych zdań.
example : (∀ x, p x) ∨ (∀ x, q x) → ∀ x, p x ∨ q x := sorry

-- A to są tylko inaczej zapisane, "funkcjonalnie" te same - czyli z perspektywy kategoryjnej
-- izomorficzne (bo równoważne jako zdania) - koprodukty, ten z lewej to uogólniony koprodukt
-- pewnych koproduktów binarnych, a ten z prawej to koprodukt binarny pewnych koproduktów
-- uogólnionych.
example : (∃ x, p x ∨ q x) ↔ (∃ x, p x) ∨ (∃ x, q x) := sorry

----------------------------------------------------------------------------------------------------
-- Kwantyfikatory i negacja

example : (¬ ∃ x, p x) ↔ (∀ x, ¬ p x) := sorry

-- Pozostałe zadania można udowodnić tylko *klasycznie*, wobec czego trzeba będzie użyć aksjomatu
-- wyłączonego środka, który w Leanie jest twierdzeniem `em`, zdefiniowanym w przestrzeni nazw
-- `Classical`.
section
-- Dzięki temu do końca tej sekcji można pisać krótko `em` zamiast `Classical.em`.
open Classical

-- Zaczniemy od rozgrzewki. Trzeba tu użyć aksjomatu `em` w najprostszy możliwy sposób ...
example : r ∨ ¬r := sorry

-- ... a tutaj trzeba go użyć w niemal najprostszy możliwy sposób.
example : p x ∨ ¬(p x) := sorry

-- Nigdzie nam się nie spieszy. To wszystko ma *nie* być frustrujące.
example : (¬ ∀ x, p x) ↔ (∃ x, ¬ p x) := sorry

example : (∃ x, p x) ↔ ¬ (∀ x, ¬ p x) := sorry

example : (∀ x, p x) ↔ ¬ (∃ x, ¬ p x) := sorry

end
