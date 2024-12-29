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

Nie będziemy się teraz przyglądać tym aksjomatom, ponieważ my akurat *zrobimy* sobie - ze strzałek i
funkcji - pewną wersję teorii mnogości w jednym z późniejszych rozdziałów, ale zanim to nastąpi,
skorzystam tutaj z teorii *ZF* jako ważnego przykładu.

To, że teoria *ZF* ma status jednej z teorii podstawowych w matematyce oznacza między innymi, że
można skonstruować rozmaite obiekty matematyczne posługując się tylko zbiorami. Zbiory *skończone*
możemy zapisać *dosłownie*, na przykład tak:

$\set{1, 20, \*, ~, -3.4}$

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, bo zapisane dosłownie nie
zmieściłyby się na żadnej stronie. Wymyślając ten przykład chciałem od razu zasugerować, że w
typowych teoriach mnogości zbiory mogą zawierać dowolne elementy, na przykład takie, które nie
należą do jednego rodzaju albo typu. Na przykład, 

Wybitny matematyk polskiego pochodzenia, Jerzy von Neumann, o którym już zresztą wspominałem, wpadł
na następujący pomysł jak można za pomocą *samych zbiorów* "zakodować" liczby naturalne ($∅$ to
symbol oznaczający zbiór pusty, czyli $\set{}$):

$0 := \set{} = ∅$

$1 := \set{0} = \set{∅}$

$2 := \set{0, 1} = \set{∅, \set{∅}}$ 

$3 := \set{0, 1, 2} = \set{∅, \set{∅}, \set{∅, \set{∅}}}$

I tak dalej. Mamy tutaj oczywisty odpowiednik albo implementację liczby *0* (jako zbiór pusty) i
mamy regułę konstrukcji pozostałych liczb naturalnych, którą można zapisać w ten sposób:

*Jeżeli $n$ jest liczbą naturalną (zbudowaną już w pewien sposób z samych zbiorów), to zbiór
powstający z $n$ jako zbioru przez dołożenie do $n$ zbioru $\set{n}$ jako elementu jest następnikiem
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
*działa*, a tego rodzaju obiekty spełniają aksjomaty Peano, a więc *są* liczbami naturalnymi, tak
samo jak nasze `Nat.zero`, `Nat.succ Nat.zero`, `Nat.succ (Nat.succ Nat.zero)`, i tak dalej. 

Porównajmy tą teoriomnogościową definicję z definicją liczb naturalnych w Leanie:

```lean
inductive Nat where
    | zero : Nat
    | succ (n : Nat) : Nat
```

Wydaje mi się, że się zgodzisz, że ta definicja wygląda znacznie mniej sztucznie i jest bardziej
czytelna. Można nawet powiedzieć, że ta definicja *jest* aksjomatami Peano zapisanymi niemal
dosłownie, w dosyć elegancki sposób, w postaci [*definicji
indukcyjnej*](https://pl.wikipedia.org/wiki/Indukcja_matematyczna), a dokładnie w postaci definicji
*indukcyjnego typu danych*.

**Czytamy to**: Liczby naturalne (termy o typie `Nat`) to *dokładnie* termy, które powstają według
następujących reguł:

1. `zero` jest termem typu `Nat`

2. Jeżeli `n` jest dowolnym termem typu `Nat`, to *sama nieredukowalna* aplikacja `succ n` jest
również termem typu `Nat`.

Gdy nie posługujemy się wygodnym zapisem cyfrowym, to zapisujemy te liczby zwykle w stylu
`Nat.zero`, `Nat.succ Nat.zero`, `Nat.succ (Nat.succ Nat.zero)`, i tak dalej, a nie `zero`, `succ
zero`, `succ (succ zero)`, i tak dalej, ponieważ stałe `zero` i `succ` są tutaj elementami
*przestrzeni nazw* `Nat`, która powstaje automatycznie w ramach każdej definicji indukcyjnej. Możemy
tą przestrzeń jednak zawsze *otworzyć* gdy mamy ochotę i pisać bez prefiksu `Nat.`:

```lean
open Nat

#check zero             -- Nat.zero : Nat

#check succ zero        -- zero.succ : Nat

#check succ (succ zero) -- zero.succ.succ : Nat
```

Mówiąc już całkiem po polsku, liczby naturalne w Leanie to wedłu definicji *dokładnie* liczba zero i
każda taka liczba, która jest liczbą następną po jakiejś liczbie naturalnej. Mamy tu do czynienia z
[*definicją rekurencyjną*](https://pl.wikipedia.org/wiki/Rekurencja), ponieważ ogólne *pojęcie*
liczby naturalnej jest *zdefiniowane w kategoriach liczb naturalnych* i chociaż może się wydawać, że
taka definicja musi być błędna, bo występuje w niej pozornie jakieś [błędne
koło](https://pl.wikipedia.org/wiki/B%C5%82%C4%99dne_ko%C5%82o_w_definiowaniu), to jednak *nie ma w
tym nic złego*, ale o tym będę mówił kiedy indziej.

O definicji liczb naturalnych zaproponowanej przez von Neumanna można by powiedzieć, że jest
wegańska, bo te liczby są sklecone niemal z niczego (to jest *z samych zbiorów*) i w dodatku
wyglądają dziwnie, ale to jeszcze pół biedy. Gorzej, że posługując się nią możemy zapisać jako
poprawne i prawdziwe między innymi takie oto dosyć bezsensowne zdanie:

$1 ∈ 2$  
(Zdanie prawdziwe, a więc również poprawne, w każdej teorii, w której obowiązuje definicja liczb
naturalnych zaproponowana przez von Neumanna)

Widzimy tutaj przykładowy *skutek uboczny* tej definicji, polegający na tym, że *liczba naturalna
$1$ jest elementem zbioru liczba naturalna $2$*. Ten skutek uboczny wynika stąd, że te liczby są
*zaimplementowane* za pomocą zbiorów, a zbiory mają różne właściwości, których *nie mają* liczby
naturalne *jako takie*. W zasadzie nic nie szkodzi, jesteśmy przecież tolerancyjni, ale jednak
definicja von Neumanna jest troszeczkę *zbyt wegańska*, prawda?

To teraz uważaj, bo zaraz zaczniemy się przełączać na język kosmitów, albo aniołów, jak kto woli.

## Liczby naturalne z perspektywy kategoryjnej

K1. Niech (aksjomatycznie) istnieją jakieś *obiekty*.

K2. Niech każdy obiekt $O$ będzie wyposażony w *strzałkę* z tego obiektu do niego samego, którą
będziemy czasem zapisywać jako $Id_O$.

K3. Niech poza tym *być może* istnieją jakieś inne strzałki i niech każda strzałka *wychodzi* z
jakiegoś konkretnego obiektu i *wchodzi* do jakiegoś konkretnego obiektu. Fakt, że jakaś konkretna
strzałka wychodzi z jakiegoś konkretnego obiektu i wchodzi do jakiegoś konkretnego, być może tego
samego obiektu, będziemy oznaczać tak:
    
$f : S → T$.

gdzie $f$ to wybrana przez nas arbitralnie nazwa strzałki, a $S$ i $T$ to wybrane arbitralnie, ale
również tak, żeby się kojarzyły ze słowami *source* (po polsku *źródło*) i *target* (po polsku
*cel*) nazwy obiektu, z którego $f$ wychodzi i do którego wchodzi odpowiednio.

Spróbuj się powstrzymać od myślenia o *tych* strzałkach jako o funkcjach. To *nie* są żadne funkcje
(chociaż to *mogą* być funkcje).

To są na razie *atomowe* "klocki" naszej językowej gry. Potrzebujemy jeszcze dodać aksjomaty, które
będą nam mówiły, jak się nimi można *bawić*.

K4. Jeżeli $A$, $B$ i $C$ są (niekoniecznie różnymi) obiektami, a $f$ i $g$ są (niekoniecznie
różnymi) strzałkami takimi, że są w następującym sensie *kompatybilne*: 

$f : A → B$ i $g : B → C$

to istnieje unikalna strzałka będąca *złożeniem* tych dwóch strzałek, to jest:

$g ∘ f : A → C$

Jeżeli strzałki nie są w ten sposób kompatybilne, to nie da się ich tak złożyć.

K5. Składanie strzałek jest *łączne*, to znaczy, że jeżeli:

$f : A → B$, $g : B → C$ i $h : C → D$

to:

$h ∘ (g ∘ f) = (h ∘ g) * f$

K6. Strzałki typu $Id_A$ są elementami neutralnymi ze względu na operację składania, to znaczy
zachowują się jak zero w dodawaniu. Zakładając kompatybilność $f$ i $Id_A$:

$Id_A ∘ f = f$

a zakładając kompatybilność $Id_A$ i $g$:

$g ∘ Id_A = g$

