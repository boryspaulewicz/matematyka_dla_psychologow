Jak być może wiesz, do niedawna w pewnym sensie najważniejszym podstawowym językiem matematyki był
język teorii mnogości, a konkretnie język teorii
[Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla). Na wszelki wypadek
jednek przytoczę tutaj odpowiedni cytat z
[Wikipedii](https://pl.wikipedia.org/wiki/Teoria_mnogo%C5%9Bci) (2024-12-29):

> Po odkryciu paradoksów tzw. naiwnej teorii mnogości udało się sformułować teorię zbiorów jako
> teorię aksjomatyczną; jej standardową wersją jest aksjomatyka ZF uwieńczona w latach 30. XX
> wieku. Stała się ona podstawą innych działów matematyki, ponieważ do pojęcia zbioru zredukowano
> inne szeroko używane obiekty jak liczby, funkcje oraz inne relacje; teoria mnogości stała się tak
> źródłem modeli różnych teorii formalnych.

My akurat *zrobimy* sobie (ze strzałek i funkcji) pewną wersję teorii mnogości w jednym z
późniejszych rozdziałów, ale zanim to nastąpi, skorzystam tutaj z teorii *ZF* jako ważnego
przykładu. 

To, że teoria *ZF* ma status jednej z teorii podstawowych w matematyce oznacza więc między innymi,
że można skonstruować rozmaite obiekty matematyczne posługując się tylko zbiorami. Na przykład,
Jerzy von Neumann wpadł na następujący pomysł jak w ten sposób "zakodować" liczby naturalne ($∅$ to
symbol oznaczający zbiór pusty, czyli $\set{}$):

$0 := \set{} = ∅$

$1 := \set{0} = \set{∅}$

$2 := \set{0, 1} = \set{∅, \set{∅}}$ 

$3 := \set{0, 1, 2} = \set{∅, \set{∅}, \set{∅, \set{∅}}}$

I tak dalej. Wygląda to dziwnie, bo to *jest* dziwne, ale w matematyce ostatecznie liczy się tylko
to, czy coś *działa*, a tego rodzaju obiekty spełniają aksjomaty Peano, a więc *są* liczbami
naturalnymi, tak samo jak nasze `Nat.zero`, `Nat.succ Nat.zero`, `Nat.succ (Nat.succ Nat.zero)` i
tak dalej. A tak przy okazji, definicja liczb naturalnych w Leanie, w całej swej okazałości, wygląda
tak ...

```lean
inductive Nat where
    | zero : Nat
    | succ (n : Nat) : Nat
```

... a więc jest zapisaną niemal dosłownie, w dosyć elegancki sposób, wersją aksjomatów Peano w
postaci [*definicji indukcyjnej*](https://pl.wikipedia.org/wiki/Indukcja_matematyczna) (a dokładnie
definicji indukcyjnego typu danych), i to jest moim zdaniem bardzo piękne.

**Czytamy to**: Liczby naturalne (termy o typie `Nat`) to dokładnie: term `zero`, jak również, dla
każdego `n : Nat`, aplikacja (sama ta w tym wypadku *nieredukowalna* aplikacja) o postaci `succ
n`. Gdy nie posługujemy się wygodnym zapisem cyfrowym, to zapisujemy te liczby zwykle w stylu
`Nat.zero`, `Nat.succ Nat.zero`, i tak dalej, ponieważ stałe `zero` i `succ` są tutaj elementami
*przestrzeni nazw* `Nat`, która powstaje automatycznie w ramach każdej definicji indukcyjnej. 

Mówiąc już całkiem po polsku, liczby naturalne w Leanie to *wedłu definicji* dokładnie liczba zero i
każda taka liczba, która jest liczbą następną po jakiejś liczbie naturalnej. Mamy tu do czynienia z
[*definicją rekurencyjną*](https://pl.wikipedia.org/wiki/Rekurencja), ponieważ ogólne *pojęcie*
liczby naturalnej jest *zdefiniowane w kategoriach liczb naturalnych* i chociaż może się wydawać, że
taka definicja musi być błędna, bo występuje w niej pozornie jakieś [błędne
koło](https://pl.wikipedia.org/wiki/B%C5%82%C4%99dne_ko%C5%82o_w_definiowaniu), to jednak *nie ma w
tym nic złego*, ale o tym będę mówił kiedy indziej.

O definicji liczb naturalnych autorstwa von Neumanna można by powiedzieć, że jest taka jakby
wegańska, bo te liczby są sklecone niemal z niczego (to jest *z samych zbiorów*) i w dodatku
wyglądają dziwnie, ale to jeszcze pół biedy. Gorzej, że posługując się nią możemy zapisać jako
poprawne i prawdziwe takie oto zdanie:

$1 ∈ 2$  
(Zdanie prawdziwe, a więc również poprawne, w teorii, w której obowiązuje definicja liczb
naturalnych von Neumanna)

Widzimy tutaj przykładowy *skutek uboczny* tej definicji, polegający na tym, że *liczba naturalna 1
jest elementem zbioru liczba naturalna 2*. Ten skutek uboczny wynika stąd, że te liczby są
*zaimplementowane* za pomocą zbiorów, a zbiory mają różne właściwości, których *nie mają* liczby
naturalne *jako takie*. W zasadzie nic nie szkodzi, ale jednak ta definicja wydaje się troszeczkę
*zbyt wegańska*, prawda?

