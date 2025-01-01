Jak być może wiesz, do niedawna w pewnym sensie najważniejszym podstawowym językiem matematyki był
język teorii mnogości, a konkretnie język teorii
[Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla). Nawet, jeżeli to wiesz,
to i tak na wszelki wypadek przytoczę tutaj odpowiedni cytat z
[Wikipedii](https://pl.wikipedia.org/wiki/Teoria_mnogo%C5%9Bci) (2024-12-29):

> Po odkryciu paradoksów tzw. naiwnej teorii mnogości udało się sformułować teorię zbiorów jako
> teorię aksjomatyczną; jej standardową wersją jest aksjomatyka ZF uwieńczona w latach 30. XX
> wieku. Stała się ona podstawą innych działów matematyki, ponieważ do pojęcia zbioru zredukowano
> inne szeroko używane obiekty jak liczby, funkcje oraz inne relacje; teoria mnogości stała się tak
> źródłem modeli różnych teorii formalnych.

Nie będziemy się teraz przyglądać aksjomatom tej teorii, ponieważ my sobie akurat *zrobimy* - ze
strzałek i funkcji - pewną wersję teorii mnogości w jednym z późniejszych rozdziałów, ale zanim to
nastąpi, skorzystam tutaj z teorii *ZF* jako ważnego przykładu.

To, że teoria *ZF* ma status jednej z teorii podstawowych w matematyce oznacza między innymi, że
można skonstruować rozmaite obiekty matematyczne posługując się tylko zbiorami. Zbiory *skończone*
możemy zapisać *dosłownie*, na przykład tak:

$\set{1, 20, \*, X, -3.4}$

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, bo zapisane dosłownie nie
zmieściłyby się na żadnej stronie. Wymyślając ten przykład chciałem od razu zasugerować, że (zgodnie
z dominującym w matematyce zwyczajem) zbiory mogą zawierać dowolne elementy, na przykład takie,
które nie należą do żadnego dającego się łatwo zidentyfikować rodzaju albo typu. A więc zbiory to
takie dowolne[^1] kolekcje potencjalnie różnorodnych elementów.

Będę teraz mówił o jednym z możliwych sposobów skonstruowania liczb naturalnych z samych
zbiorów. Nie oczekuję, że to wszystko dobrze zapamiętasz i nie zdziwiłbym się wcale, gdyby Ci się to
nie sposobało. Piszę o tym tylko żeby coś w ten sposób zilustrować, dlatego zalecam przyjęcie
wspomnianej już wcześniej postawy turystki, która ogląda dłużej to, na co tylko ma ochotę i nie
stara się za wszelką cenę wszystkiego dogłębnie zrozumieć.

Jeden ze sposobów, żeby skontruować obiekty, których można używać tak, jak używamy liczb naturalnych
wygląda tak ($∅$ to symbol oznaczający zbiór pusty, czyli $\set{}$):

$0 := \set{}$

$1 := \set{0} = \set{\set{}}$

$2 := \set{0, 1} = \set{\set{}, \set{\set{}}}$ 

$3 := \set{0, 1, 2} = \set{\set{}, \set{\set{}}, \set{\set{}, \set{\set{}}}}$

I tak dalej. Autorem tego pomysłu jest wybitny matematyk polskiego pochodzenia, Jerzy von Neumann, o
którym już zresztą wspominałem. Mamy tutaj oczywisty odpowiednik liczby *0* (jako zbioru pustego) i
mamy pewną, niekoniecznie od razu łatwą do opisania *regułę konstrukcji* pozostałych liczb, którą
można zapisać w taki oto sposób (który zaraz krok po kroku zilustruję):

Mówiąc możliwie najkrócej: *$n + 1$ powstaje przez dołożenie $n$ do $n$ jako dodatkowego elementu*.

Na przykład, żeby z liczby $0$ będącej z definicji zbiorem pustym zrobić liczbę $1$ dokładamy $0$, a
więc zbiór pusty, do niego samego, uzyskując w ten sposób liczbę $1$ jako zbiór $\set{\set{}}$,
czyli według przyjętej dopiero co definicji $0$, zbiór $\set{0}$.

Mówiąc nieco staranniej: *Jeżeli* $n$ *jest liczbą naturalną (zbudowaną już w pewien sposób z samych
zbiorów), to zbiór powstający z* $n$ *jako zbioru, przez dołożenie do* $n$ *zbioru* $n$ *jako
elementu, jest następnikiem* $n$ *jako liczby naturalnej*.

A więc: 

$\set{}$ jest zbiorem, który postanawiamy traktować jako liczbę $0$.

Dokładając do liczby naturalnej $0$, będącej zbiorem $\set{}$, ten sam zbiór jako element,
uzyskujemy $\set{\set{}}$, to jest następnik liczby naturalnej $0$, który oznaczamy jako $1$.

Dokładając do liczby naturalnej $1$, będącej zbiorem $\set{\set{}}$, ten sam zbiór jako element
uzyskujemy $\set{\set{}, \set{\set{}}}$, który oznaczamy jako $2$.

I tak dalej.

Wygląda to dziwnie, bo to *jest* dziwne, ale ostatecznie liczy się tylko to, czy dana konstrukcja
*działa*, a tego rodzaju obiekty spełniają aksjomaty Peano, a więc można na nich zdefiniować
wszystkie sensowne operacje na liczbach naturalnych i te operacje będą się zachowywały zgodnie z
naszymi oczekiwaniami. Wobec tego, te dziwne konstrukcje *są* liczbami naturalnymi, tak samo jak są
nimi nasze `Nat.zero`, `Nat.succ Nat.zero`, `Nat.succ (Nat.succ Nat.zero)`, i tak dalej.

**Jak to działa?**: Dodawanie na przykład liczby $2$ do liczby $1$ to $2$-krotne zastosowanie
operacji następnika do liczby $1$, a więc:

$2 + 1 = ...$

Rozpakowujemy definicję stałej $1$ ...  
$2 + \set{0} = ...$

... i kontynuujemy rozpakowywanie definicji po prawej od symbolu +:  
$2 + \set{\set{}} = ...$

Stosujemy funkcję następnika po raz pierwszy ...  
$1 + \set{\set{}, \set{\set{}}} = ...$

... i po raz drugi i ostatni, bo dodawanie jest zdefiniowane w taki sposób, że dodanie $0$ nic 
    nie zmienia:  
$= \set{\set{}, \set{\set{}}, \set{\set{}, \set{\set{}}}}$

Wreszcie "pakując" definicję uzyskanego w ten sposób rezultatu odkrywamy, że:  
$2 + 1 = 3$

Porównajmy teraz tą teoriomnogościową definicję z definicją liczb naturalnych w Leanie:

```lean
inductive Nat where
    | zero : Nat
    | succ (n : Nat) : Nat
```

Orzeźwiające? Wydaje mi się, że się zgodzisz, że ta definicja wygląda znacznie bardziej
naturalnie[^1]. Można by nawet powiedzieć, że ta definicja *jest* aksjomatami Peano zapisanymi
niemal dosłownie, w dosyć elegancki sposób, w postaci [*definicji
indukcyjnej*](https://pl.wikipedia.org/wiki/Indukcja_matematyczna), a dokładnie w postaci definicji
tak zwanego *indukcyjnego typu danych*.

**Czytamy to**: Indukcyjnie zdefiniowany typ danych (`inductive`) liczba naturalna (`Nat`) to
*dokładnie wszystkie* takie termy, że (`where`):

1. `zero` jest termem typu `Nat` (`| zero : Nat`).

2. Jeżeli `n` jest termem typu `Nat`, to sama *nieredukowalna* aplikacja `succ n` jest również
   termem typu `Nat` (`| succ (n : Nat) : Nat`).

Gdy nie posługujemy się wygodnym zapisem cyfrowym, to zapisujemy te liczby zwykle w stylu
`Nat.zero`, `Nat.succ Nat.zero`, `Nat.succ (Nat.succ Nat.zero)`, i tak dalej, a nie `zero`, `succ
zero`, `succ (succ zero)`, i tak dalej, ponieważ stałe `zero` i `succ` są tutaj elementami
*przestrzeni nazw* `Nat`, która powstaje automatycznie w ramach każdej definicji indukcyjnego typu
danych. Jeśli jednak mamy ochotę, zawsze możemy taką przestrzeń nazw *otworzyć* i dzięki temu pisać
bez tego prefiksu:

```lean
-- Otwarcie przestrzeni nazw Nat umożliwia krótszy zapis dosłowny liczb naturalnych:
open Nat

#check zero             -- Nat.zero : Nat

#check succ zero        -- zero.succ : Nat

#check succ (succ zero) -- zero.succ.succ : Nat
```

Aplikacje takie jak `succ zero` czy `succ (succ zero)` są *nieredukowalne* po prostu dlatego, że
funkcja `succ` istnieje *aksjomatycznie*, a więc definicja stałej `succ` jest *pozbawiona ciała*
(nie ma tu nic do rozpakowania). Inaczej mówiąc, *pod stałymi `zero` i `succ` nic się nie
kryje*. Przyjmujemy tu konwencję, zgodnie z którą liczba naturalna $0$ *jest* (nieredukowalną) stałą
`zero`, liczba naturalna $1$ *jest* nieredukowalną aplikacją `succ zero`, i tak dalej.

**Jak to działa?**: Dla uproszczenia zamiast `zero` będę pisał $z$ a zamiast `succ` będę pisał $z$ i
nie będę też pisał nawiasów ani spacji, a więc: $z, sz, ssz, sssz$, i tak dalej, gdzie $sz$ to
następna liczba naturalna po liczbie $0$, a więc $1$, $ssz$ to $2$, $sssz$ to $3$, i tak
dalej. Dodawanie działa wtedy tak (rozpakowując i na końcu pakując definicje stałych w oczywisty
sposób):

$2 + 1 = 2 + sz = 1 + ssz = 0 + sssz = sssz = 3$.

Operację dodawania liczb naturalnych można w Leanie zdefiniować *rekurencyjnie* używając dopasowania
wzorca (ilustracja):

```lean
-- Nie przejmuj się, jeżeli ten kod wydaje Ci się w tym momencie zbyt skomplikowany, to tylko
-- ilustracja.
def add (m : Nat) (n : Nat) : Nat :=
    -- Wykonaj tą operację, która pasuje do postaci zmiennej m, to jest do *pierwszego* parametru:
    match m with
    --  Jeżeli m to Nat.zero, to zwróć n, bo przecież 0 + n powinno być równe n:
    | Nat.zero => n
    --  Jeżeli m to następna liczba naturalna po jakiejś liczbie k, a więc n może tu być dowolną
    --  liczbą różną od 0, bo 0 nie jest następnikiem żadnej liczby naturalnej, to zwróć następnik
    --  rezultatu zastosowania funkcji add do liczb k i n:
    | Nat.succ k => Nat.succ (add k n)

-- Widzimy na tych przykładach, że tak zdefiniowane dodawanie działa zgodnie z oczekiwaniami:
#eval add 2 1    -- 3
#eval add 100 99 -- 199

-- A tak przebiega ewaluacja tego rodzaju aplikacji (ilustracja):
add 2 1

-- Rozpakowujemy add i w ciele podstawiamy 2 za m i 1 za n ...
--
--    match 2 with
--    | Nat.zero => 1
--    | Nat.succ k => Nat.succ (add k 1)
--
-- ... a ponieważ 2 jest różne od Nat.zero, ale jest równe Nat.succ k gdy k = 1, to pasuje tylko
-- drugi wzorzec:
--
--    | Nat.succ 1 => Nat.succ (add 1 1)
--
-- a więc:
Nat.succ (add 1 1)

-- I znowu rozpakowujemy add i podstawiamy:
--
--    match 1 with
--    | Nat.zero => 1
--    | Nat.succ k => Nat.succ (add k 1)
--
-- Znowu nie pasuje pierwszy wzorzec, ale pasuje drugi, bo 1 to Nat.succ 0, a więc:
--
--    | Nat.succ 0 => Nat.succ (add 0 1)
--
-- I teraz uwaga - to była ewaulacja samej aplikacji (add 1 1) wewnątrz termu złożonego
-- Nat.succ (add 1 1), a więc:
Nat.succ (Nat.succ (add 0 1))

-- I znowu rozpakowujemy stałą add i podstawiamy:
--
--    match 0 with
--    | Nat.zero => 1
--    | Nat.succ k => Nat.succ (add k 1)
--
-- Tym razem pasuje pierwszy wzorzec, bo 0 to Nat.zero ...
--
--    | Nat.zero => 1
Nat.succ (Nat.succ 1)

-- ... czyli:
3
```

Mając definicję *dodawania* - jako iteracyjnego stosowania funkcji następnika, na przykład $2 + 2$
to $1 + 1 + 2$ - możemy w ten sam sposób (rekurencyjnie) zdefiniować *mnożenie* - jako iteracyjne
dodawanie - na przykład, $3 * 2$ to $2 + 2 + 2$, a mając definicję mnożenia możemy (również
rekurencyjnie) zdefiniować *potęgowanie* - jako iteracyjne mnożenie - na przykład, $2^3$ to $2 * 2 *
2$. Przyzwyczajenie się do rekurencji wymaga jednak trochę czasu (za to potem pisanie takich
programów może być bardzo satysfakcjonujące).

Mówiąc już całkiem po polsku i możliwie krótko, liczby naturalne w Leanie to wedłu definicji
*dokładnie* liczba zero i każda taka liczba, która jest liczbą następną po jakiejś liczbie
naturalnej. Mamy tu do czynienia z [*definicją
rekurencyjną*](https://pl.wikipedia.org/wiki/Rekurencja), ponieważ pojęcie liczby naturalnej jest
(formalnie) *zdefiniowane w kategoriach liczb naturalnych* i chociaż może się wydawać, że taka
definicja musi być błędna, bo występuje w niej pozornie jakieś [błędne
koło](https://pl.wikipedia.org/wiki/B%C5%82%C4%99dne_ko%C5%82o_w_definiowaniu), to jednak *nie ma tu
żadnego błędu*, ale o tym będę mówił kiedy indziej.

Widzimy więc, że zarówno liczb naturalnych zdefiniowane sposobem von Neumanna jak i tych
zdefiniowanych w Leanie możemy używać dokładnie tak, jak używamy ... liczb naturalnych. O definicji
zaproponowanej przez von Neumanna ktoś złośliwy (nie ja!) mógłby jednak powiedzieć, że jest
wegańska, bo przecież te rzekomo "naturalne" liczby są tam sklecone niemal z niczego (to jest *z
samych zbiorów*), a w dodatku wyglądają dosyć dziwnie, ale to jeszcze pół biedy (to znaczy, pół
biedy, że różni złośliwi i ograniczeni ludzie, z którymi nie mam nic wspólnego, tak czasami
mówią). Gorzej, że posługując się tą definicją możemy zapisać jako *poprawne* i zarazem *prawdziwe*
między innymi takie dosyć *bezsensowne* zdanie:

$1 ∈ 2$  
(Zdanie prawdziwe, a więc również poprawne, w każdej teorii, w której obowiązuje definicja liczb
naturalnych zaproponowana przez von Neumanna)

Widzimy tutaj przykładowy *skutek uboczny* tej definicji, polegający na tym, że *liczba naturalna
$1$ jest elementem zbioru liczba naturalna $2$*. Ten skutek uboczny wynika stąd, że te liczby są
*zaimplementowane* za pomocą zbiorów, a zbiory mają różne właściwości, których *nie mają* liczby
naturalne *jako takie*. W zasadzie nic nie szkodzi, jesteśmy przecież tolerancyjni, niemniej wydaje
się, że nawet ktoś tylko umiarkowanie złośliwy i ograniczony mógłby powiedzieć, że definicja von
Neumanna jest troszeczkę *zbyt* wegańska.

No to teraz uważaj, bo zaczniemy się przełączać na [*język
kosmitów*](https://en.wikipedia.org/wiki/Alien_language) (lub
[aniołów](https://biblehub.com/text/1_corinthians/13-1.htm), jak kto woli).

## Liczby naturalne z perspektywy kategoryjnej

Wprowadzimy sobie nowe aksjomaty. Wydaje mi się, że możesz sobie mniej więcej wyobrazić, jak można
by je zapisać w języku teorii typów, ale tym razem nie będziemy tego robić.

K1. Niech (aksjomatycznie) istnieją *być może* jakieś *obiekty*.

K2. Niech (aksjomatycznie) każdy obiekt $O$ będzie wyposażony w specjalną *strzałkę* z tego obiektu
do niego samego, którą będziemy czasem oznaczać jako $Id_O$, być może pisząc na przyklad tak:
$Id_O : O → O$.

K3. Niech poza tym *być może* istnieją jakieś inne strzałki i niech każda strzałka *wychodzi* z
jakiegoś unikalnego obiektu i *wchodzi* do jakiegoś unikalnego obiektu. Fakt, że jakaś konkretna
strzałka wychodzi z jakiegoś konkretnego obiektu $S$ i wchodzi do jakiegoś konkretnego, być może
tego samego obiektu $T$, będziemy oznaczać tak:
    
$f : S → T$.

gdzie $f$ to wybrana przez nas arbitralnie nazwa strzałki, a $S$ i $T$ to wybrane arbitralnie, ale
również tak, żeby się kojarzyły ze słowami *source* (po polsku *źródło*) i *target* (po polsku
*cel*) nazwy obiektu, z którego $f$ wychodzi i do którego wchodzi odpowiednio.

Spróbuj się nie przywiązywać za bardzo od myślenia o *tych* strzałkach jako o funkcjach. To *nie* są
funkcje, chociaż to *mogą* być funkcje. To *są* tylko strzałki o wymienionych właściwościach.

To są na razie *atomowe* "klocki" naszej nowej językowej gry. Potrzebujemy jeszcze dodać aksjomaty,
które będą nam mówiły, jak można się tymi klockami *bawić*, stosując jakieś wcześniej aksjomatycznie
wprowadzone operacje. No to przyjmujemy, że możemy zawsze mówić o (unikalnych) *złożeniach*
pasujących do siebie w pewien określony sposób strzałek.

K4. Jeżeli $A$, $B$ i $C$ są (niekoniecznie różnymi) obiektami, a $f$ i $g$ są (niekoniecznie
różnymi) strzałkami, w dodatku takimi, że są w następującym sensie *kompatybilne*:

$f : A → B$ i $g : B → C$

czyli druga wychodzi z obiektu, do którego wchodzi pierwsza, albo inaczej pierwsza wchodzi do
obiektu, z którego wychodzi druga, to istnieje *unikalna* strzałka będąca *złożeniem* tych dwóch
strzałek, a dokładnie:

$g ∘ f : A → C$

gdzie $∘$ oznacza binarną operację składania strzałek. Jeżeli strzałki nie są w ten sposób
kompatybilne, to nie da się ich tak złożyć.

K5. Składanie strzałek jest *łączne*, to znaczy, że jeżeli mamy taką kompatybilność:

$f : A → B$, $g : B → C$ i $h : C → D$

to zachodzi taka równość (to jest *wymienialność* takich wyrażeń):

$h ∘ (g ∘ f) = (h ∘ g) ∘ f$

K6. Strzałki typu $Id$ są elementami neutralnymi ze względu na operację składania, co znaczy, że
zachowują się jak liczba $0$ w dodawaniu. Zakładając kompatybilność $Id_A$ i $f$, a także $f$ i
$Id_B$ (co sprowadza się do $f : A → B$, bo z definicji $Id_A : A → A$ i $Id_B : B → B$):

$Id_B ∘ f = f = f ∘ Id_A$

Oto jest sześć aksjomatów [*kategorii*](https://pl.wikipedia.org/wiki/Teoria_kategorii).

## Liczby naturalne jako kategoria

## Pewna kategoria zdań

## Koniunkcja jako granica kategoryjna

### Przypisy

[^1]: Pun intended.
