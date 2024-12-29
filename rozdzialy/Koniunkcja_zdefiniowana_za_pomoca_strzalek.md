A gdyby tak przyjąć, że zdania są gwiazdami? Czy taki punkt widzenia musiałby być *tylko*
aksjomatem?

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

Nie będziemy się teraz przyglądać aksjomatom tej teorii, ponieważ my akurat *zrobimy* sobie - ze
strzałek i funkcji - pewną wersję teorii mnogości w jednym z późniejszych rozdziałów, ale zanim to
nastąpi, skorzystam tutaj z teorii *ZF* jako ważnego przykładu.

To, że teoria *ZF* ma status jednej z teorii podstawowych w matematyce oznacza między innymi, że
można skonstruować rozmaite obiekty matematyczne posługując się tylko zbiorami. Zbiory *skończone*
możemy zapisać *dosłownie*, na przykład tak:

$\set{1, 20, \*, X, -3.4}$

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, bo zapisane dosłownie nie
zmieściłyby się na żadnej stronie. Wymyślając ten przykład chciałem od razu zasugerować, że w
typowych teoriach mnogości zbiory mogą zawierać dowolne elementy, na przykład takie, które nie
należą do jednego rodzaju albo typu. Na przykład, 

Wybitny matematyk polskiego pochodzenia, Jerzy von Neumann, o którym już zresztą wspominałem, wpadł
na następujący pomysł jak można za pomocą *samych zbiorów* "zakodować" liczby naturalne ($∅$ to
symbol oznaczający zbiór pusty, czyli $\set{}$):

$0 := \set{}$

$1 := \set{0} = \set{\set{}}$

$2 := \set{0, 1} = \set{\set{}, \set{\set{}}}$ 

$3 := \set{0, 1, 2} = \set{\set{}, \set{\set{}}, \set{\set{}, \set{\set{}}}}$

I tak dalej. Mamy tutaj oczywisty odpowiednik albo implementację liczby *0* (jako zbiór pusty) i
mamy *regułę konstrukcji* pozostałych liczb naturalnych, którą można zapisać w ten sposób:

*Jeżeli $n$ jest liczbą naturalną (zbudowaną już w pewien sposób z samych zbiorów), to zbiór
powstający z $n$ jako zbioru przez dołożenie do $n$ zbioru $n$ jako elementu jest następnikiem
$n$ jako liczby naturalnej*.

A więc: 

$\set{}$ jest zbiorem, który postanawiamy oznaczyć jako $0$.

Dokładając do liczby naturalnej $0$, będącej zbiorem $\set{}$, ten sam zbiór jako jego element
uzyskujemy $\set{\set{}}$, to jest następnik liczby naturalnej $0$, który postanawiamy oznaczyć jako
$1$.

Dokładając do liczby naturalnej $1$, będącej zbiorem $\set{\set{}}$, ten sam zbiór jako jego element
uzyskujemy $\set{\set{}, \set{\set{}}}$, który postanawiamy oznaczyć jako $2$.

I tak dalej.

Wygląda to dziwnie, bo to *jest* dziwne, ale w matematyce ostatecznie liczy się tylko to, czy coś
*działa*, a tego rodzaju obiekty spełniają aksjomaty Peano, a więc można na nich zdefiniować
wszystkie sensowne operacje na liczbach naturalnych i te operacje będą się zachowywały zgodnie z
naszymi oczekiwaniami, a więc te dziwne konstrukcje *są* liczbami naturalnymi, tak samo jak nasze
`Nat.zero`, `Nat.succ Nat.zero`, `Nat.succ (Nat.succ Nat.zero)`, i tak dalej.

**Jak to działa?**: Dodawanie, na przykład liczby $2$ do liczby $1$, to $2$ krotne zastosowanie
operacji następnika do liczby $1$, a więc:

$2 + 1 = ...$

Rozpakowujemy definicję stałej $1$ ...  
$2 + \set{0} = ...$

... i kontynuujemy rozpakowywanie definicji po prawej od symbolu +:  
$2 + \set{\set{}} = ...$

Stosujemy funkcję następnika po raz pierwszy ...  
$1 + \set{\set{}, \set{\set{}}} = ...$

... i po raz drugi i ostatni, bo dodawanie jest tak zdefiniowane, że dodanie $0$ nic nie zmienia ...  
$= \set{\set{}, \set{\set{}}, \set{\set{}, \set{\set{}}}}$

... wreszcie "pakując" definicję odkrywamy, że:  
$2 + 1 = 3$

Porównajmy tą teoriomnogościową definicję z definicją liczb naturalnych w Leanie:

```lean
inductive Nat where
    | zero : Nat
    | succ (n : Nat) : Nat
```

Orzeźwiające? Wydaje mi się, że się zgodzisz, że ta definicja wygląda znacznie bardziej
naturalnie[^1]. Można by wręcz powiedzieć, że ta definicja *jest* aksjomatami Peano zapisanymi
niemal dosłownie, w dosyć elegancki sposób, w postaci [*definicji
indukcyjnej*](https://pl.wikipedia.org/wiki/Indukcja_matematyczna), a dokładnie w postaci definicji
*indukcyjnego typu danych*.

**Czytamy to**: Indukcyjnie zdefiniowany typ danych (`inductive`) liczba naturalna (`Nat`) to
*dokładnie wszystkie* takie termy, że (`where`):

1. `zero` jest termem typu `Nat` (`| zero : Nat`).

2. Jeżeli `n` jest termem typu `Nat`, to sama *nieredukowalna* aplikacja `succ n` jest również
   termem typu `Nat` (`| succ (n : Nat) : Nat`).

Gdy nie posługujemy się wygodnym zapisem cyfrowym, to zapisujemy te liczby zwykle w stylu
`Nat.zero`, `Nat.succ Nat.zero`, `Nat.succ (Nat.succ Nat.zero)`, i tak dalej, a nie `zero`, `succ
zero`, `succ (succ zero)`, i tak dalej, ponieważ stałe `zero` i `succ` są tutaj elementami
*przestrzeni nazw* `Nat`, która powstaje automatycznie w ramach każdej definicji indukcyjnego typu
danych. Jeśli jednak mamy ochotę, zawsze możemy tą przestrzeń nazw *otworzyć* i pisać bez prefiksu
`Nat.`:

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
kryje*. Przyjmujemy po prostu, że liczba naturalna $0$ *jest* (nieredukowalną) stałą `zero`, liczba
naturalna $1$ *jest* nieredukowalną aplikacją `succ zero`, i tak dalej.

**Jak to działa?**: Dla uproszczenia zamiast `zero` będę pisał $0$ a zamiast `succ` będę pisał $+$ i
nie będę pisał nawiasów, w ten sposób: $0, +0, ++0, +++1$, i tak dalej, gdzie $+0$ to następna
liczba naturalna po liczbie $0$, a więc $1$, $++0$ to $2$, $+++0$ to $3$, i tak dalej. Dodawanie
działa wtedy tak (rozpakowując i na końcu pakując definicje stałych w oczywisty sposób): 

$2 + 1 = 2 + +0 = 1 + ++0 = 0 + +++0 = +++0 = 3$.

W Leanie operację dodawania liczb naturalnych można zdefiniować rekurencyjnie używając dopasowania
wzorca w następujący sposób (ilustracja):

```lean
-- Nie przejmuj się, jeżeli ten kod wydaje Ci się w tym momencie zbyt skomplikowany, to tylko
-- ilustracja.
def add (m : Nat) (n : Nat) : Nat :=
    match m with
    -- Jeżeli m to Nat.zero, to zwróć m, bo 0 + m to m:
    | Nat.zero => n
    -- Jeżeli m to następna liczba naturalna po liczbie l (a więc n nie może być równe 0), to 
    -- zwróć następnik rezultatu zastosowania funkcji add do liczb l i n:
    | Nat.succ l => Nat.succ (add l n)

#eval add 2 1 -- 3

-- Ponieważ (ilustracja):
add 2 1
--> Drugi warunek dopasowania wzorca, bo 2 jest różne od 0:
Nat.succ (add 1 1)
--> Drugi warunek dopasowania wzorca, bo 1 jest różne od 0:
Nat.succ (Nat.succ (add 0 1))
--> Pierwszy warunek dopasowania wzorca, bo pierwszy argument aplikacji add to 0:
Nat.succ (Nat.succ 1)
--> Rozpakowując definicję 1 ...
Nat.succ (Nat.succ (Nat.succ Nat.zero))
--> ... i pakując to wyrażenie "w definicję" widzimy, że rezultatem aplikacji add 2 1 jest:
3
```

Mając definicję dodawania - jako iteracyjnego stosowania funkcji następnika - możemy w takim sam
sposób rekurencyjnie zdefiniować mnożenie - jako iteracyjne dodawanie - na przykład, $3 * 2$ to $2 +
2 + 2$, a mając definicję mnożenia możemy rekurencyjnie zdefiniować potęgowanie - jako iteracyjne
mnożenie - na przykład, $2^3$ to $2 * 2 * 2$. Przyzwyczajenie się do rekurencji wymaga czasu (za to
potem pisanie takich programów może być bardzo satysfakcjonujące).

Mówiąc już całkiem po polsku i możliwie krótko, liczby naturalne w Leanie to wedłu definicji
*dokładnie* liczba zero i każda taka liczba, która jest liczbą następną po jakiejś liczbie
naturalnej. Mamy tu do czynienia z [*definicją
rekurencyjną*](https://pl.wikipedia.org/wiki/Rekurencja), ponieważ ogólne pojęcie liczby naturalnej
jest (formalnie) *zdefiniowane w kategoriach liczb naturalnych* i chociaż może się wydawać, że taka
definicja musi być błędna, bo występuje w niej pozornie jakieś [błędne
koło](https://pl.wikipedia.org/wiki/B%C5%82%C4%99dne_ko%C5%82o_w_definiowaniu), to jednak *nie ma w
tym nic złego*, ale o tym będę mówił kiedy indziej.

O definicji liczb naturalnych zaproponowanej przez von Neumanna ktoś złośliwy (nie ja!) mógłby na
przykład powiedzieć, że jest wegańska, bo te liczby rzekomo "naturalne" von Neumanna są sklecone
niemal z niczego (to jest *z samych zbiorów*) i w dodatku wyglądają dziwnie, jak jakieś wegańskie
ciasteczka (jeszcze raz podkreślam, to nie moje słowa!), ale to jeszcze pół biedy (to znaczy, pół
biedy, że różni złośliwi i ograniczeni ludzie tak czasami mówią). Gorzej, że posługując się tą
definicją możemy zapisać jako poprawne i prawdziwe między innymi takie oto dosyć bezsensowne zdanie:

$1 ∈ 2$  
(Zdanie prawdziwe, a więc również poprawne, w każdej teorii, w której obowiązuje definicja liczb
naturalnych zaproponowana przez von Neumanna)

Widzimy tutaj przykładowy *skutek uboczny* tej definicji, polegający na tym, że *liczba naturalna
$1$ jest elementem zbioru liczba naturalna $2$*. Ten skutek uboczny wynika stąd, że te liczby są
*zaimplementowane* za pomocą zbiorów, a zbiory mają różne właściwości, których *nie mają* liczby
naturalne *jako takie*. W zasadzie nic nie szkodzi, jesteśmy przecież tolerancyjni, ale jednak
definicja von Neumanna jest troszeczkę *zbyt wegańska*, prawda?

To teraz uważaj, bo teraz zaczniemy się przełączać na [*język
kosmitów*](https://en.wikipedia.org/wiki/Alien_language) (albo
[aniołów](https://biblehub.com/text/1_corinthians/13-1.htm), jak kto woli).

## Liczby naturalne z perspektywy kategoryjnej

K1. Niech (aksjomatycznie) istnieją *być może* jakieś *obiekty*.

K2. Niech (aksjomatycznie) każdy obiekt $O$ będzie wyposażony w *strzałkę* z tego obiektu do niego
samego, którą będziemy czasem zapisywać jako $Id_O$.

K3. Niech poza tym *być może* istnieją jakieś inne strzałki i niech każda strzałka *wychodzi* z
jakiegoś konkretnego obiektu i *wchodzi* do jakiegoś konkretnego obiektu. Fakt, że jakaś konkretna
strzałka wychodzi z jakiegoś konkretnego obiektu i wchodzi do jakiegoś konkretnego, być może tego
samego obiektu, będziemy oznaczać tak:
    
$f : S → T$.

gdzie $f$ to wybrana przez nas arbitralnie nazwa strzałki, a $S$ i $T$ to wybrane arbitralnie, ale
również tak, żeby się kojarzyły ze słowami *source* (po polsku *źródło*) i *target* (po polsku
*cel*) nazwy obiektu, z którego $f$ wychodzi i do którego wchodzi odpowiednio.

Spróbuj się nie przywiązywać za bardzo od myślenia o *tych* strzałkach jako o funkcjach. To *nie* są
funkcje, chociaż to *mogą* być funkcje. To *są* tylko strzałki o wymienionych właściwościach.

To są na razie *atomowe* "klocki" naszej nowej językowej gry. Potrzebujemy jeszcze dodać aksjomaty,
które będą nam mówiły, jak można się tymi klockami *bawić* (stosując jakieś aksjomatycznie
wprowadzone operacje).

K4. Jeżeli $A$, $B$ i $C$ są (niekoniecznie różnymi) obiektami, a $f$ i $g$ są (niekoniecznie
różnymi) strzałkami, w dodatku takimi, że są w następującym sensie *kompatybilne*:

$f : A → B$ i $g : B → C$

czyli druga wychodzi z obiektu, do którego wchodzi pierwsza, to istnieje *unikalna* strzałka będąca
*złożeniem* tych dwóch strzałek, a dokładnie:

$g ∘ f : A → C$

gdzie $∘$ oznacza binarną operację składania strzałek. Jeżeli strzałki nie są w ten sposób
kompatybilne, to nie da się ich tak złożyć.

K5. Składanie strzałek jest *łączne*, to znaczy, że jeżeli mamy taką kompatybilność:

$f : A → B$, $g : B → C$ i $h : C → D$

to zachodzi taka równość (a więc wymienialność takich wyrażeń):

$h ∘ (g ∘ f) = (h ∘ g) ∘ f$

K6. Strzałki typu $Id$ są elementami neutralnymi ze względu na operację składania, co znaczy, że
zachowują się jak zero w dodawaniu. Zakładając kompatybilność $Id_A$ i $f$, a także $f$ i $Id_B$ (co
sprowadza się do $f : A → B$, bo z definicji $Id_A : A → A$ i $Id_B : B → B$):

$Id_B ∘ f = f = f ∘ Id_A$

Oto jest sześć aksjomatów [*kategorii*](https://pl.wikipedia.org/wiki/Teoria_kategorii).

### Przypisy

[^1]: Pun intended.
