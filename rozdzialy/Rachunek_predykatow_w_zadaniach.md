## O czym teraz będzie

Kończymy z podstawami rachunku predykatów! Oczywiście żartuję, nigdy z nimi nie skończymy, bo
niczego nie da się tak naprawdę do końca zrozumieć. Większość tych zadań "ukradłem" ze znakomitej
książki [*Theorem Proving in Lean 4*](https://lean-lang.org/theorem_proving_in_lean4/), dodałem
tylko (jak to mam w zwyczaju agresywnie dezorientujące) komentarze. Na wszelki wypadek uprzedzam, że
to *nie* jest tylko seria zadań; w komentarzach mówię tu o pewnych sprawach, do których będę później
nawiązywał.
 
Proszę zgłaszać trudności.

# Rachunek predykatów w zadaniach

Zanim przejdziemy do zadań, spróbuję nakłonić Cię do popatrzenia na nie z perspektywy
kategoryjnej. Mam nadzieję w ten sposób przyzwyczaić Cię stopniowo do moim zdaniem najbardziej
ekscytującego sposobu używania matematyki, polegającego na "zmechaniowanym" i elastycznym
przełączaniu się między różnymi "zmechanizowanymi" punktami widzenia na to samo. Jeżeli poczujesz,
że te moje próby bardziej Ci przeszkadzają niż pomagają, to będzie znaczyło, że jest na to po prostu
zbyt wcześnie. Trzeba z tym wtedy poczekać, aż pewne konstrukcje formalno-językowe tak bardzo
utrwalą się w Twojej pamięci, że będziesz mogła je traktować jak niemal autonomiczne byty, które
możesz w kadej chwili (o ile będziesz wyspana i trzeźwa) mentalnie przywołać, a raz przywołane
przekształcać i oglądać z różnych stron.

## Rachunek predykatów z kategoryjnego punktu widzenia

Niestety, nie mogę Ci na tym etapie podać pełnowartościowej kategoryjnych definicji dużego i małego
kwantyfikatora, bo to wymaga wprowadzenia (skądinąd fascynującego w użyciu) pojęcia [*funktora
sprzężonego*](https://pl.wikipedia.org/wiki/Funktory_sprz%C4%99%C5%BCone), a na to jest jeszcze za
wcześnie. Mogę jednak, używając mieszanego kategoryjno-mnogościowego języka, spróbować dostarczyć Ci
na ten temat pewnych przydatnych intuicji.

Zaczniemy od takiej jakby rozluźniającej rozgrzewki, której celem będzie tymczasowe zwiększenie
elastyczności w sposobie kodowania znanych Ci już dobrze struktur, a dzięki temu również zwiększenie
elastyczności w sposobie myślenia o tych strukturach.

Wyrażenia takie jak `p ∧ q`, gdzie `p` i `q` to zdania, moglibyśmy równie dobrze zakodować jako
*oznaczone pary* zdań. Potrzebujemy je jakoś oznaczyć, bo `p ∨ q` i `p → q` to też wyrażenia
powstające z par zdań, a będziemy chcieli takie pary rozróżniać. Tak więc niech `∧` oznacza na
początek jakiś izomorf *zbioru* zawierającego wszystkie uporządkowane pary zdań, to jest `∧ ≅ Z ×
Z`, gdzie `Z` to zbiór zdań. Wyrażenie takie jak `(p, q) ∈ ∧` oznacza odtąd to samo, co wcześniej `p
∧ q`. Moglibyśmy korzystać z tego sposobu kodowania konstruując dowody, ale do *tego* celu ten
sposób nie bardzo się nadaje.

Zauważmy teraz, że pary uporządkowane złożone z elementów jakiegoś zbioru `X` można równie dobrze,
to jest ani nie tracąc, ani nie dodając żadnej informacji, zakodować jako pewien izomorf *zbioru
funkcji* ze zbioru `{1, 2}` do zbioru `X`, bo przecież takie pary uporządkowane to dokładnie
swobodne oznaczenia dwóch, niekoniecznie różnych elementów należących do zbioru `X` jako pierwszego
i drugiego takiego. Widzisz już, że to tylko *wymienialne implementacje*, a więc *funkcjonalnie* to
jest wszystko to samo? Jak chcesz, możesz spróbować udowodnić, że to jest funkcjonalnie to samo,
definiując izomorfizmy między tymi strukturami.

Po co mielibyśmy wprowadzać taki sposób kodowania (albo taką implementację)? Ano po to, żeby
zobaczyć i lepiej zapanować nad głębokim podobieństwem między koniunkcją i alternatywą z jednej
strony, a dużym i małym kwantyfikatorem z drugiej. Zbiór zdań takich jak `∀ x ∈ X, P x`, gdzie `X`
to jakiś zbiór, a `P` to jakiś predykat dotyczący elementów tego zbioru, możemy teraz rozpoznać na
nowo jako *funkcję* ze zbioru `X` do zbioru zdań o postaci `P x`. Pomijając zwykle kosmetyczne
różnice między zbiorami i typami, to nic innego jak znana Ci już implementacja *wiązania* przez duży
kwantyfikator jako *bycia parametrem funkcji* zwracającej takie zdania. Z tej perspektywy zdania
takie jak `p ∧ q` to niemal takie same funkcje do zdań, tyle, że z ustalonego zbioru `{1, 2}`, i
mające tą własność, że prawdziwość zdań wskazywanych jako pierwsze i drugie nie zależy od wartości
argumentu, czyli od tego, czy są pierwszym czy drugim członem koniunkcji.

Kiedy kolekcja punktów/obiektów kategorii jest *zbiorem*, to wtedy tak samo, używając ekstremalnie
elastycznego języka teorii mnogości, możemy na potrzeby mechanicznego rozumowania zakodować
kategoryjne produkty. Te są *binarne*, ale *nie muszą* być binarne. Z naszej nowej perspektywy
widać, że `p ∧ q` to coś takiego jak `Π i ∈ {1, 2}, p₁` (gdzie `p₁ = p`, a `p₂ = q`), a `∀ x ∈ X, P
x` to coś takiego jak `Π x ∈ X, P x`, przy czym w obydwu przypadkach `Π i ∈ I, f(i)` oznacza
(uogólniony) produkt wartości pewnej funkcji `f` dla indeksów `i ∈ I`.

Możemy też podać taką "skundloną", bo kategoryjno-mnogościową definicję tego uogólnionego produktu:
Niech `P` będzie jakimś ustalonym obiektem. Produktem indeksowanym będziemy nazywali taką *funkcję*
(tu między innymi widać teoriomnogościowość tej definicji) `π` z jakiegoś zbioru `I` (który możemy
zechcieć nazywać zbiorem indeksów) do zbioru strzałek `{P → Y | Y ∈ Ob(ℂ)}`, że dla każdego obiektu
`X` i dla każdej funkcji `f : I → Ar(ℂ)` takiej, że `f(i) : X → π(i)` (ta funkcja koduje nam tu po
prostu jakieś strzałki z `X` do obiektów `π(i)` "na końcach" produktu), istnieje unikalna strzałka
`h` taka, że `∀ i ∈ I, π(i) ∘ h = f(i)`. Ponieważ `h` jest taką unikalną strzałką, naturalnym
wyborem będzie oznaczanie jej jako `Π i ∈ I, f(i)`, albo - zakładając domyślność odbiorców - jako `Π
i, f(i)`, a czasem nawet jako `Π f(i)`.

Zarówno notacja jak i terminologia zrobiły się nam co prawda bardziej skomplikowane, ale chyba
nietrudno dostrzec, że produkt binarny jest szczególnym przypadkiem produktu indeksowanego, który
uzyskujemy gdy `I = {1, 2}`. Możemy teraz "formalnie rozpoznać" zdania o postaci `∀ x, P x` jako
szczególne przypadki produktu indeksowanego. I dualnie, zdania o postaci `∃ x, P x` rozpoznajemy
jako szczególne przypadki koproduktu indeksowanego, który wypadałoby wtedy zapisywać (skrótowo) w
stylu `Σ x, P x`.

Musimy jednak pamiętać, że nie powiedzieliśmy dotąd *nic* na temat tego, *gdzie dokładnie*, to
znaczy w jakiej kategorii, takie uogólnione produkty i koprodukty się znajdują. I nie powiemy, bo
pojęcie funktora sprzężonego jest na razie poza naszym zasięgiem. Już na tym etapie możemy jednak
zgadywać, że obiektami tej kategorii mogłyby być być może (między innymi, skoro mają się tam też
zmieścić produkty i koprodukty indeksowane, które nie mają takiej postaci) zdania o postaci `P x`,
gdzie `P` jest predykatem, a `x` jest termem typu albo elementem zbioru, którego dotyczy `P`.

Nie wiemy jeszcze, czy może istnieć taka kategoria, to znaczy czy można ją "wskazać" za pomocą
poprawnej definicji, ale to nam nie przeszkodzi myśleć w ten sposób, to jest w
[życzeniowym](https://pl.wikipedia.org/wiki/My%C5%9Blenie_%C5%BCyczeniowe) kategoryjnym stylu, o
dużym i małym kwantyfikatorze, nie popełniając przy tym błędów, bo zdania o postaci `∀ x, P x` i `∃
x, P x` zachowują się ewidentnie jak produkty i koprodukty odpowiednio, a od binarnych produktów i
koproduktów różnią się tylko tym, że mają arbitralne liczby członów.

## Zadania służą głównie do tego, żeby wracać do nich tak długo - przyglądając im się uważnie i czasem bawiąc się nimi - aż albo niemal same się rozwiążą, albo przestaną nas obchodzić

Będziemy odtąd oznaczać predykaty małymi literami, bo tak jest szybciej. Zwracam uwagę, że `p` i `q`
to tutaj *predykaty*, a nie jak zwykle wcześniej zdania; tylko `r` będzie tu (atomowym) zdaniem.

```lean
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

-- Jeżeli coś już masz (tutaj dowód `r`), to możesz to (tutaj w pewnym sensie, bo "osobliwie")
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
```
