## O czym teraz będzie

Kończymy z podstawami rachunku predykatów! Oczywiście żartuję, nigdy z nimi nie skończymy, bo
niczego nie da się tak całkiem zrozumieć. Patrząc na te sprawy z lotu ptaka widać moim zdaniem
doskonale, że wszyscy bez wyjątku z osobna często jesteśmy i do końca będziemy często bywać
kompletnymi debilami, a to, jak wspaniale działa współczesna cywilizacja, zawdzięczamy wyłącznie
istnieniu rozmaitych form długotrwałej, zorganizowanej współpracy.

Podobnie jak to ma miejsce w przypadku poprzedniego rozdziału, większość tych zadań "ukradłem" ze
znakomitej książki [*Theorem Proving in Lean 4*](https://lean-lang.org/theorem_proving_in_lean4/),
dodałem tylko (jak to u mnie agresywnie dezorientujące) komentarze. Na wszelki wypadek uprzedzam, że
to *nie* jest tylko seria zadań; mówię tu o pewnych sprawach, do których będę później nawiązywał.
 
Proszę zgłaszać trudności.

# Rachunek predykatów w zadaniach

Zanim przejdziemy do zadań, spróbuję (jak zwykle) nakłonić Cię do popatrzenia na nie z perspektywy
kategoryjnej. Mam nadzieję przyzwyczaić Cię tak stopniowo do moim zdaniem najbardziej ekscytującego,
twórczego sposobu używania matematyki, polegającego na "zmechaniowanym" i elastycznym przełączaniu
się między różnymi "zmechanizowanymi" punktami widzenia na to samo. Jeżeli poczujesz, że te moje
próby bardziej Ci przeszkadzają niż pomagają, to będzie znaczyło, że jest na to po prostu za
wcześnie. Trzeba z tym wtedy poczekać, aż pewne konstrukcje formalno-językowe tak bardzo utrwalą się
w Twojej pamięci, że będziesz mogła je traktować jak niemal autonomiczne byty, które możesz w każdej
chwili (o ile będziesz wyspana i trzeźwa) mentalnie
[przywołać](https://www.etymonline.com/word/summon), a raz przywołane badać i przekształcać,
oglądając je z różnych stron.

## Rachunek predykatów z kategoryjnego punktu widzenia

Niestety, nie mogę Ci na tym etapie podać pełnowartościowej kategoryjnej definicji dużego, a więc
dualnie jednocześnie również i małego kwantyfikatora, bo to wymaga wprowadzenia (skądinąd
fascynującego) pojęcia [*funktora
sprzężonego*](https://pl.wikipedia.org/wiki/Funktory_sprz%C4%99%C5%BCone), a na to jest jeszcze za
wcześnie. Mogę jednak, używając mieszanego kategoryjno-mnogościowego języka, spróbować dostarczyć Ci
na ten temat pewnych przydatnych intuicji.

Zaczniemy od takiej jakby rozluźniającej (?) rozgrzewki, której celem będzie tymczasowe zwiększenie
elastyczności w sposobie kodowania znanych Ci już dobrze struktur, a dzięki temu również zwiększenie
elastyczności myślenia o tych strukturach.

Wyrażenia takie jak `p ∧ q`, gdzie `p` i `q` to zdania, moglibyśmy równie dobrze zakodować jako
*oznaczone pary* zdań. Potrzebujemy je jakoś oznaczyć, bo `p ∨ q` i `p → q` to też wyrażenia
powstające z par zdań, a chcielibyśmy takie pary rozróżniać. W Leanie, na przykład, robimy to za
pomocą różnych stałych, takich jak `And` i `Or`. Tak więc niech `∧` oznacza na początek jakiś
*izomorf zbioru* zawierającego wszystkie uporządkowane pary zdań, to jest `∧ ≅ Z × Z`, gdzie `Z` to
zbiór wszystkich zdań. Wyrażenie takie jak `(p, q) ∈ ∧` będzie oznaczało odtąd to samo, co wcześniej
`p ∧ q`. Moglibyśmy korzystać z tego sposobu kodowania zdań złożonych konstruując dowody, ale do
*tego* celu ten sposób nie bardzo się nadaje.

Ale jak to izomorf? Przecież jeżeli `Z` to zbiór *wszystkich* zdań, to taki zbiór zawiera zdania,
które *nie* są koniunkcjami, jak również *wszystkie* koniunkcje, a zbiór `Z × Z` nie może być
mniejszy niż `Z`. No tak, masz rację, ale z drugiej strony, *każda* para zdań odpowiada
*unikalnemu*, zrobionemu z tej pary zdaniu-koniunkcji, a *każda* koniunkcja odpowiada *unikalnej*
parze zdań (z której ta koniunkcja jest zrobiona). Czyli to *musi* być izomorf, a to, że trudno się
z tym pogodzić, to tylko nasze psychologiczne organiczenie. Liczb naturalnych też jest tyle samo, co
na przykład liczb naturalnych dodatnich, inaczej nie byłoby między tymi dwoma zbiorami
izomorfizmu. Żeby to zauważyć, wystarczy zapisać pionowo na kartce jedna pod drugą liczby `0`, `1` i
`2`, a obok tych liczb zapisać `0`, `2`, `4` (zero jest liczbą dodatnią). I od razu wiemy o co
chodzi, chociaż zapisaliśmy tylko trzy pary; to znaczy, rozumiemy dokładnie na czym polega to
dopasowanie i wiemy, że to jest izomorfizm.

Przy okazji odkrywamy więc, że zbiór zdań `Z` musi być w tym kontekście albo pusty (ale to by nie
miało sensu), albo musi mieć nieskończenie wiele elementów, inaczej żaden jego podzbiór *właściwy*,
to jest nie zawierający wszystkich elementów należących do `Z`, nie mógłby być z nim
izomorficzny. Można powiedzieć, że fakt, że zdań jest nieskończenie wiele, wynika tu z
"endo-generatywności" operacji takich jak tworzenie koniunkcji zdań: Zdania atomowe są zdaniami,
więc jeśli dla każdej pary zdań, ich koniunkcja jest też ("nowym") zdaniem, to gdyby nawet "na
początku" było tylko jedno zdanie atomowe `a`, to z reguły mówiącej, że koniunkcje też są zdaniami,
wynikałoby "natychmiast", że `a ∧ a` też jest zdaniem, `(a ∧ a) ∧ a` też jest zdaniem, `((a ∧ a) ∧
a) ∧ a` też jest zdaniem, `a ∧ (a ∧ a)` jest zdaniem, i tak dalej.

Ciekawy "proces", prawda? Mówimy przecież o *definicji* (indukcyjnej), która "działa logicznie", a
więc *nie w czasie fizycznym*. Gdy na przykład decydujemy, że zdaniami, a formalnie elementami
zbioru `Z`, "będą" elementy jakiegoś zbioru `A` (którego używamy wtedy jako zbioru zdań atomowych),
to te elementy stają się zdaniami ["wszystkie na raz
jednocześnie"](https://en.wikipedia.org/wiki/Everything_Everywhere_All_at_Once). Gdy potem dodamy
warunek, że koniunkcje par elementów `Z` też są zdaniami, to z jednej strony jest tu jakieś "przed"
i jest tu jakieś "po", bo *najpierw* pojawił się pierwszy warunek definicji indukcyjnej, a *potem*
drugi, ale z drugiej strony, zanim pojawił się ten drugi warunek, definicja nie była jeszcze
skończona, a więc *jeszcze jej nie było* (jako konstruowanej definicji). Wrażenie, że jest tu jakieś
przed i jakieś po, i że to jest opis pewnego *rozgrywającego się w czasie procesu*, wynika tu tylko
z sekwencyjnego charakteru *prezentacji* definicji, sekwencyjnego charakteru *procesu tworzenia* tej
definicji, i z sekwencyjnego charakteru procesu naszego jej *przyswajania* i *używania*.

I trudno się od tego sekwencyjno-procesualnego sposobu myślenia oderwać, prawda? Ja na przykład, gdy
widzę regułę taką jak *jeżeli `p` i `q` to zdania, to `p ∧ q` też jest zdaniem*, często nie mogę
oprzeć się myśleniu, że to jest *przepis*, mówiący jak można poprawnie *powiększać* zbiór zdań o
pewnego rodzaju elementy. Mówiąc ogólnie, myślę czasem o tego rodzaju sprawach w kategoriach może i
abstrakcyjnych, ale jednak *czynności*, takich jak czynność "dosypywania". Jest mi wtedy naprawdę
trudno myśleć o regułach definicji indukcyjnych jako o *statycznych prawach*; jest to więc coś, do
czego muszę się czasem (mechanicznie) zmusić. Za to gdy tylko *pomyślę* o tych regułach *w inny
sposób*, jako o *regułach weryfikacji*, czy coś jest zdaniem, zamiast jako o *regułach tworzenia*
zdań, ten psychologiczny problem szybko znika. Wtedy muszę się pogodzić tylko z tym, że zdań jest
nieskończenie wiele, co akurat przychodzi mi łatwo. A to przecież tylko jeden przykład tego, jak
zmiana punktu widzenia może dramatycznie ułatwić kontakt z jakimś problemem.

Wracając na ziemię, zauważmy teraz, że pary uporządkowane złożone z elementów jakiegoś zbioru `X`
można *równie dobrze*, to jest ani nie tracąc, ani nie dodając żadnej informacji czy
funkcjonalności, zakodować jako *zbiór funkcji* ze zbioru `{1, 2}` do zbioru `X`, bo przecież takie
pary uporządkowane to dokładnie swobodne oznaczenia dwóch, niekoniecznie różnych elementów
należących do zbioru `X`, jako pierwszego i drugiego takiego. Widzisz już, że to tylko *wymienialne
implementacje*, a więc *funkcjonalnie* to jest wszystko to samo? Jak chcesz, możesz spróbować
udowodnić, że to jest funkcjonalnie to samo, definiując izomorfizm między tymi strukturami, albo
możesz poczekać, aż to się niemal samo stanie dla Ciebie oczywiste.

Ale *po co* mielibyśmy wprowadzać taki sposób kodowania? Ano między innymi po to, żeby wyraźniej
zobaczyć głębokie podobieństwo między koniunkcją i alternatywą z jednej strony, a dużym i małym
kwantyfikatorem z drugiej, a dzięki temu lepiej nad tym podobieństwem zapanować. Zbiór zdań takich
jak `∀ x ∈ X, P x`, gdzie `X` to jakiś zbiór, a `P` to jakiś predykat dotyczący elementów tego
zbioru, możemy teraz rozpoznać na nowo jako *funkcję* ze zbioru `X` do zbioru zdań o postaci `P
x`. Pomijając zwykle kosmetyczne różnice między zbiorami i typami, to nic innego jak znana Ci już
implementacja *wiązania* przez duży kwantyfikator jako *bycia parametrem funkcji* zwracającej takie
zdania. Z tej perspektywy zdania takie jak `p ∧ q` to niemal takie same funkcje do zdań, tyle, że z
ustalonego zbioru `{1, 2}`, i mające tą własność, że prawdziwość zdań wskazywanych jako pierwsze i
drugie nie zależy od wartości argumentu, czyli od tego, czy są pierwszym czy drugim członem
koniunkcji.

Kiedy kolekcja punktów/obiektów kategorii jest *zbiorem*, to wtedy tak samo, używając ekstremalnie
elastycznego języka teorii mnogości, możemy na potrzeby mechanicznego rozumowania zakodować
kategoryjne produkty. Te są *binarne*, ale *nie muszą* być binarne. Z naszej nowej perspektywy
widać, że `p ∧ q` to coś takiego jak `Π i ∈ {1, 2}, p₁` (gdzie `p₁ = p`, a `p₂ = q`), a `∀ x ∈ X, P
x` to coś takiego jak `Π x ∈ X, P x`, przy czym w obydwu przypadkach `Π i ∈ I, f(i)` oznacza
(uogólniony) produkt wartości pewnej funkcji `f` dla indeksów `i ∈ I`. Jeżeli tego jeszcze nie
widzisz, to wyjaśniam, że wyrażenie takie jak `p₁` to też funkcja, a raczej wartość pewnej funkcji,
a dokładniej mówiąc wartość funkcji `p` dla argumentu `1`, tylko zapisana tak, żeby ten fakt do
pewnego stopnia ukryć stosując indeks dolny.

Możemy podać taką "skundloną", bo kategoryjno-mnogościową definicję tego - na razie tylko
"nieformalnie przeczuwanego" - uogólnionego produktu: Produktem indeksowanym będziemy nazywali taką
*funkcję* (tu między innymi widać teoriomnogościowość tej definicji) `π` z jakiegoś zbioru `I`
(który możemy zechcieć nazywać zbiorem indeksów) do zbioru strzałek `{P → Y | Y ∈ Ob(ℂ)}` (`P` jest
tutaj wspólnym punktem zaczepienia wszystkich projekcji), że dla każdego obiektu `X` i dla każdej
funkcji `f : I → Ar(ℂ)` takiej, że `f(i) : X → cod(π(i))`, istnieje unikalna strzałka `h` taka, że
`∀ i ∈ I, π(i) ∘ h = f(i)`. Funkcja `π` posyła każdy indeks `i ∈ I` w unikalną projekcję `π(i) : P →
Y` dla pewnego `Y ∈ Ob(ℂ)`, a każda funkcja `f` o wspomnianej postaci w taki sam sposób koduje
jakieś strzałki z jakiegoś `X` do obiektów `cod(π(i))`, będących celami projekcji produktu, po
jednej dla kadego `i`. W szczególności, gdy `I = {1, 2}`, funkcja `π` oznacza jako pierwszą i drugą
dwie projekcje, do dwóch, niekoniecznie różnych obiektów. Ponieważ `h` jest unikalną taką strzałką,
naturalnym wyborem będzie oznaczanie jej jako `Π i ∈ I, f(i)`, albo - zakładając domyślność
odbiorców - jako `Π i, f(i)`, albo nawet jako `Π f(i)`.

Zarówno notacja jak i terminologia zrobiły się nam co prawda bardziej skomplikowane, ale chyba
nietrudno dostrzec, że produkt binarny jest szczególnym przypadkiem produktu indeksowanego, który
uzyskujemy gdy `I = {1, 2}`. Możemy teraz "formalnie rozpoznać" zdania o postaci `∀ x, P x` jako
szczególne przypadki produktu indeksowanego. I dualnie, zdania o postaci `∃ x, P x` rozpoznajemy
jako szczególne przypadki koproduktu indeksowanego, który wypadałoby wtedy zapisywać (skrótowo) w
stylu `Σ x, P x`. Szczegółami tej ostatniej konstrukcji nie musimy się teraz przejmować, bo jest
dualna, a więc w zasadzie taka sama, tyle, że "działa" (my już tam wiemy, że powinno być raczej
*funkcjonuje*, ...) w pewnym sensie "odwrotnie" (... i wtedy powiedzielibyśmy, że *dosłownie*
odwrotnie).

Musimy jednak pamiętać, że nie powiedzieliśmy dotąd *nic* na temat tego, *gdzie dokładnie*, to
znaczy *w jakiej kategorii*, takie uogólnione produkty i koprodukty się znajdują. A w jakiejś muszą,
jeżeli istnieją, bo to mają być ... (ko)produkty, które są z definicji zawsze strukturami w jakiejś
kategorii. I nie powiemy gdzie, bo pojęcie funktora sprzężonego jest na razie poza naszym
zasięgiem. Już na tym etapie możemy jednak zgadywać, że obiektami tej kategorii mogłyby być być może
(między innymi, skoro mają się tam też zmieścić produkty i koprodukty indeksowane, które nie mają
takiej postaci) zdania o postaci `P x`, gdzie `P` jest predykatem, a `x` jest termem typu albo
elementem zbioru, którego dotyczy `P`.

Nie wiemy jeszcze, czy może istnieć taka kategoria i czy wobec tego można ją wskazać za pomocą
poprawnej definicji, ale to nam nie przeszkodzi myśleć w *kategoryjnym stylu
[życzeniowym](https://pl.wikipedia.org/wiki/My%C5%9Blenie_%C5%BCyczeniowe)* o dużym i małym
kwantyfikatorze, nie popełniając przy tym błędów, bo zdania o postaci `∀ x, P x` i `∃ x, P x`
zachowują się ewidentnie jak produkty i koprodukty odpowiednio, od binarnych produktów i koproduktów
różniąc się tylko tym, że mają arbitralne liczby członów.

## Zadania służą głównie do tego, żeby wracać do nich tak długo - przyglądając im się uważnie i czasem bawiąc się nimi - aż albo niemal same się rozwiążą, albo przestaną nas obchodzić

Zgodnie ze stylem stosowanym we wspomnianej na początku książce, będziemy odtąd oznaczać predykaty
małymi literami, bo tak jest szybciej. Zwracam uwagę, że `p` i `q` to tutaj *predykaty*, a nie jak
zwykle wcześniej zdania; tylko `r` będzie tu (jakimś) zdaniem.

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

-- Bo `∀ x, p x` to uogólniony produkt, *widzisz* to już trochę? Zdanie z lewej mówi (patrząc na nie
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

-- Pozostałe zadania można udowodnić (przynajmniej w jedną stronę) tylko *klasycznie*, wobec czego
-- trzeba będzie użyć aksjomatu wyłączonego środka, który w Leanie jest twierdzeniem `em`,
-- zdefiniowanym w przestrzeni nazw `Classical`.
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
