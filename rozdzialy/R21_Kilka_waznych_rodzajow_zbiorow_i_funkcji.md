<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie

W tym rozdziale poznasz pewne rodzaje zbiorów i funkcji, których jest dosłownie wszędzie pełno i
dlatego niemal nie da się myśleć nie używając tych pojęciowych narzędzi. Nawet jeśli myśląc o tym
lub owym używamy ich zwykle nieświadomie i nie zawsze konsekwentnie albo z sensem.

<hr>

# Kilka ważnych rodzajów zbiorów i funkcji

Odtąd ograniczymy rozważania do dowolnych zbiorów *skończonych*, to jest takich, które mają
skończenie wiele elementów. Mówiąc dokładniej, będziemy opisywać świat (a lepiej: *przestrzeń*) w
którym istnieją tylko zbiory skończone i w którym występują wszystkie możliwe funkcje między takimi
zbiorami. Na początek omówimy kilka ważnych przykładów.

**Rysunek 1. Funkcje do zbioru jednoelementowego**: `Narysuj` proszę dwa zbiory jako okręgi, obok
siebie, i w lewym narysuj kilka kropek, które będą oznaczały (jakieś) elementy, a w prawym *tylko
jedną* kropkę. Zbiory jednoelementowe nazywamy również *zbiorami jednostkowymi* albo
*singletonami*. Czy widzisz, że istnieje *dokładnie jedna* funkcja ze zbioru lewego do prawego?
Narysuj proszę tą funkcję.

**Rysunek 2. Funkcje ze zbioru pustego**: A teraz `Narysuj` proszę obok siebie dwa zbiory, `X` i
`Y`, ale takie, że w lewym *nic* nie będzie, a w prawym będą na przykład dwa elementy. Jak już
wiesz, żeby "coś" było funkcją, musi przyporządkowywać każdemu elementowi dziedziny dokładnie jeden
element przeciwdziedziny. Jak myślisz, czy może istnieć funkcja z `X` do `Y`? Wydawałoby się, że
nie, a jednak istnieje. To jest taka funkcja, nazwijmy ją tym razem `p` (od pierwszej litery w
słowie [*pustka*](https://en.wikipedia.org/wiki/Nagarjuna)), że *gdybyś* wybrała dowolny element
zbioru `X`, to dostarczyła*by* dokładnie jeden element ze zbioru `Y`. Każda funkcja ze zbioru
pustego jest jak pusto bo pusto, ale jednak w pewnym sensie spełniona obietnica: Ponieważ `X` nie
zawiera żadnych elementów, ta funkcja co prawda *nie może* nic zwrócić, ale również *nie może nie
spełnić tego warunku*. Dlatego mówimy w takich sytuacjach, że jakiś warunek (tutaj warunek
"dostarczenia" jednego elementu przeciwdziedziny dla każdego elementu dziedziny) jest *spełniony
pusto* (przez to, że *nie ma czego wymagać*).

A zatem funkcja `p` "nic nie robi jeszcze bardziej" niż znana Ci już (teoriotypowa, nie
teoriomnogościowa, czyli *funkcja jako program*) funkcja `nic_nie_robie`, i jest niemal tak
abstrakcyjna, bo w pewien sposób wirtualna, jak (czysto hipotetyczny) term typu `Absurd` albo
`False`. Tyle, że mówimy, że ta funkcja *istnieje*. Co więcej, dla każdego zbioru `Y`, istnieje
*dokładnie jedna* funkcja do `Y`, bo wszystkie takie funkcje *zwracają to samo dla każdego
argumentu*, a właśnie ten warunek, razem z dziedziną i przeciwdziedziną, decyduje o tożsamości
funkcji. Gdy mówimy, że istnieje dokładnie jedno jakieś coś, to wrażenie, że to coś "naprawdę"
istnieje jest jakby mocniejsze, prawda? No ale tutaj chodzi w istocie o to, że *nie mogą istnieć
dwie różne takie "rzeczy"*. W szczególności, istnieje dokładnie jedna funkcja ze zbioru pustego do
niego samego. Wiem, że to brzmi początkowo dziwnie, ale, jak już wspominałem, to tylko pewna wygodna
*konwencja*, a konwencje nie są ani prawdziwe ani fałszywe, a więc trzeba się do tego po prostu
*przyzwyczaić*.

Możemy zdefiniować teoriotypowy odpowiednik teoriomnogościowej funkcji ze zbioru pustego korzystając
z typu `False`, o którym wiemy, że jest niezamieszkały, jest więc teoriotypowym odpowiednikiem
zbioru pustego:

```lean
-- Tak można skonstruować, dla dowolnego typu `Y`, term typu `False → Y`, czyli funkcję z `False` do
-- `Y`. Widzimy tutaj, że reguła eliminacji fałszu pozwala konstruować (czysto hipotetyczne) termy
-- dowolnego typu, nie tylko typów zdaniowych.
example (Y : Type) : False → Y := fun hF => hF.elim
```

Zbiory puste zapisujemy albo jako `{}`, co wygląda trochę jak wywrócony na drugą stronę [*wazon
Rubina*](https://en.wikipedia.org/wiki/Rubin_vase), albo używając symbolu `∅`, który z kolei może
się kojarzyć (w każdym razie mi się kojarzy) z czymś, co można by nazwać *Obszarem* (bo to jest
okrąg) *bez zawartości* (bo jest przekreślony). Na cześć tej funkcji narysuj proszę `Strzalka X Y` i
oznacz ją literą `p`, a pod spodem zapisz komentarz: *Dla każdego zbioru* `Y`, *istnieje dokładnie
jedna funkcja ze zbioru pustego do* `Y`. *Może i trudno się z tym pogodzić, ale to tylko konwencja,
którą przyjmujemy dlatego, że okazuje się wygodna w praktyce.*[^1]

**Rysunek 3. Funkcja identycznościowa na dwa sposoby**: `Narysuj` teraz proszę trójelementowy zbiór
`X`. Chciałbym, żebyś narysowała funkcję identycznościową o nazwie `Id` spełniającą warunek `Id(x) =
x`. Użyłem tutaj symbolu równości zamiast symbolu definiowania, bo, jak powiedziałem, to jest
*warunek*, który ta funkcja ma spełniać, ale to *Ty* ją zdefiniujesz (rysując). Zastanów się proszę
przez chwilę, jak mogłabyś to zrobić, a gdy już wpadniesz na jakiś pomysł, albo gdy się poddasz,
przeczytaj moje objaśnienia [tutaj](21__Rysunek_identycznosc.md). Jeżeli przyszedł Ci do głowy tylko
jeden sposób, to również kliknij ten link. Jak już narysujesz definicję funkcji `Id`, podpisz ją
proszę komentarzem: *Przykład funkcji identycznościowej*.

<hr>

**Jeszcze bardziej za dużo filozofowania**: Czy widzisz, że jeśli zbiory rozumiemy jako swobodne
oznaczenia, a każde oznaczenie, traktowane jako symbol, będąc samo sobą w pewnym sensie samo siebie
oznacza, to można też powiedzieć, że nie ma zasadniczej różnicy między zbiorem a określoną na nim
funkcją identycznościową?

<hr>

**Rysunek 4. Przykład injekcji[^2]**: `Narysuj` proszę obok siebie dwuelementowy zbiór `X` i
czteroelementowy zbiór `Y` i narysuj funkcję, która nie "skleja" żadnej pary elementów `X`, to jest
nie posyła żadnych dwóch `x`-ów do tego samego `y`-a, i oznacz ją literą `i`. Takie funkcje nazywamy
*injekcjami* albo funkcjami *różnowartościowymi*. Czy widzisz, że aby istniała jakakolwiek injekcja,
dziedzina nie może mieć więcej elementów niż przeciwdziedzina? A czy widzisz, że *każda* injekcja to
*między innymi* pewien *wybór* albo *wskazanie podzbioru* przeciwdziedziny (i niejako *przy okazji*
oznaczenie \{jednokrotne\} każdego z wybranych elementów tego podzbioru wszystkimi `x`-ami)? Żeby to
podkreślić, otocz proszę ten podzbiór `Y` [linią](https://pl.wikipedia.org/wiki/Rysunek)
przerywaną. `Napisz` też pod rysunkiem komentarz wyrażający krótko to, co w tym momencie rozumiesz
na temat injekcji.

**Rysunek 5. Przykład surjekcji**: `Narysuj` proszę funkcję `s` z trójelementowego zbioru `X` do
dwuelementowego zbioru `Y`, tak, żeby każdy `y` "dostał strzałkę". Takie funkcje nazywamy
*surjekcjami* albo funkcjami [*na*](https://en.wiktionary.org/wiki/sur#French). Czy widzisz, że
*każda* surjekcja jest *podziałem całej dziedziny* na rozłączne kategorie albo podzbiory, których
`f-`nazwami są `y`-i? Żeby to podkreślić, otocz proszę wyznaczone w ten sposób części `X` liniami
przerywanymi. `Podpisz` też rysunek komentarzem podsumowującym Twoimi słowami to, co tu
przeczytałaś.

**Rysunek 6. Przykład bijekcji**: *Bijekcjami* nazywamy takie funkcje, które są jednocześnie
injekcjami i surjekcjami, czyli takie, które są różnowartościowe i na, czyli takie, które nie
sklejają żadnych elementów swojej dziedziny i trafiają we wszystkie elementy swojej
przeciwdziedziny. `Narysuj` proszę bijekcję z czteroelementowego zbioru `X` do czteroelementowego
zbioru `Y` i oznacz ją literą `b`. Czy rozumiesz, dlaczego nie może istnieć bijekcja, w dowolnym
kierunku, między zbiorami *różniącymi się wielkością*?

Bijekcje są *przykładami* [izomorfizmów](https://pl.wikipedia.org/wiki/Izomorfizm), ale pojęcie
izomorfizmu można, jak się niedługo przekonasz, rozumieć ogólniej. Czy widzisz, że izomorfizm jest
jak powiedzenie dokładnie tego samego, tylko innymi słowami albo symbolami, czyli to taki jakby
wierny tłumacz w obie strony? Dlatego nazywamy takie funkcje również funkcjami *wzajemnie
jednoznacznymi*. W tym wypadku to taka jakby *wymiana oznaczeń* za pomocą `x`-ów na oznaczenia za
pomocą `y`-ków, ale poza tym nic się nie zmienia.

Ważną własnością funkcji izomorficznych i w ogóle wszelkiego rodzaju izomorfizmów jest ich
*odwracalność*. Dlatego proszę, żebyś narysowała jeszcze *odwrotność funkcji* `b`. To ma być taka
funkcja `b⁻¹`, że `b⁻¹` *odwraca działanie funkcji* `b`, to znaczy: Jeżeli do dowolnego `x`
zastosujesz `b`, to gdy do rezultatu zastosujesz `b⁻¹` (czyli pójdziesz w drugą stronę po
`x`-`b⁻¹`-strzałce), uzyskasz ten sam `x`, czyli `b⁻¹(b(x)) = x`, *i jednocześnie* dla każdego `y`,
`b(b⁻¹(y)) = y`. Jak tylko to zrobisz, zobaczysz czemu w wyrażeniu `b(b⁻¹(y))` pojawia się `y` a nie
`x`. Można więc powidzieć, że funkcje odwrotne są *lustrzanymi odbiciami wiernych odwzorowań dwóch*
(z konieczności równolicznych, prawda?) *zbiorów*.

Czy widzisz, że gdy już masz *jakąś* funkcję `f`, to może istnieć *co najwyżej jedna* funkcja `f⁻¹`?
Można powiedzieć, że jeżeli funkcja ma być odwrotnością jakiejś odwracalnej funkcji `f`, czyli
jakiejś bijekcji, to "nie ma żadnego wyboru", bo każdemu elementowi swojej dziedziny *musi*
przyporządkować dokładnie ten element, który w niego "`f`-trafia" z jej przeciwdziedziny, a w
przypadku bijekcji taki element zawsze jest dokładnie jeden. Właśnie dlatego, że taka funkcja,
jeżeli istnieje (a istnieje dokładnie wtedy, gdy `f` jest bijekcją), jest *unikalna*, oznaczamy ją
jako `f⁻¹`, to jest `f` z `-1` jako indeksem górnym, czyli jako *unikalne coś, co powstaje w pewien
sposób z funkcji* `f`. Odwrotność jest więc *wybredną jednoargumentową operacją na funkcjach*, bo
dla każdej *odwracalnej* (to jest ta wybredność ...)  funkcji `f` istnieje unikalna (... a to jest
funkcyjność tej operacji) odwrotność `f`, będąca *funkcją* `()⁻¹` *funkcji* `f`
([sic!](https://pl.wikipedia.org/wiki/Sic!)). Byłoby moim zdaniem dobrze, gdybyś pod tym rysunkiem
również zapisała jakiś zrozumiały dla Ciebie komentarz.

Może jeszcze `Narysuj` dowolną funkcję *nie*bijektywną i przekonaj się, że taka funkcja nie może być
odwracalna, to znaczy, gdyby `f` nie było bijekcją, bo albo sklejałoby jakieś elementy, albo nie
trafiało w jakiś element przeciwdziedziny, to nie mogłaby istnieć żadna *funkcja* `g` z
przeciwdziedziny `Y` funkcji `f` do dziedziny `X` tej funkcji taka, że `∀ x ∈ X, g(f(x)) = x` *i
jednocześnie* `∀ y ∈ Y, f(g(y)) = y`.

**Ostrzeżenie na temat notacji**: Muszę odtąd czasem zrezygnować ze stosowania indeksów dolnych, bo
standard kodowania [Unikod](https://pl.wikipedia.org/wiki/Unicode) jest pod tym względem dość
ograniczony. Jeżeli więc napiszę na przykład `h_1`, to będzie to tylko
[namiastka](https://sjp.pwn.pl/slowniki/namiastka.html) `h₁` (akurat cyfry da się w ten sposób w
Unikodzie zapisywać, ale już na przykład większości liter nie).

Byłoby wspaniale, gdybyś jeszcze spróbowała zdefiniować za pomocą rysunków dwie funkcje, nazwijmy je
znowu `f` i `g`, takie, że:

1. `f : X → Y` ma tylko *lewą odwrotność*, ale *nie ma prawej*, to znaczy, istnieje funkcja `l_f`
taka, że `l_f(f(x)) = x`, ale *nie* istnieje funkcja `p_f` taka, że `f(p_f(y)) = y` (tak, tu ma być
`y`).

2. `g : X → Y` ma tylko *prawą odwrotność*, ale *nie ma lewej*, to znaczy, istnieje funkcja `p_g`
taka, że `g(p_g(y)) = y`, ale *nie* istnieje funkcja `l_g` taka, że `l_g(g(x)) = x`. 

Te warunki mają oczywiście obowiązywać dla każdego `x` i dla każdego `y` odpowiednio, ale tym razem
nie chciałem dodawać dużych kwantyfiktorów z obawy, że ten akapit może być już i tak zbyt gęsty (i
żeby przyzwyczaić Cię trochę do tego, że takie skróty myślowe często się pojawiają). Podpowiem Ci,
że w tym zadaniu ważną rolę odgrywają własności bycia injekcją, ale nie surjekcją i bycia surjekcją,
ale nie injekcją.

**Rysunek 7. Składanie funkcji teoriomnogościowych**: Na koniec `Narysuj` jeszcze proszę trzy
zbiory, `X`, `Y` i `Z` takie, żeby pierwszy miał trzy elementy, drugi powiedzmy cztery i trzeci może
też cztery. Zdefiniuj rysując strzałki jakieś funkcje `f : X → Y` i `g : Y → Z`. Pod spodem zapisz
komentarz: *Teoriomnogościowe złożenie funkcji* `f` *i* `g` *to taka funkcja* `g ∘ f` *(zapisujemy
to w ten sposób w tej kolejności), że* `(g ∘ f)(x) := g(f(x))` *(właśnie dlatego w tej kolejności).*

Czyli gdyby o funkcjach myśleć jako o programach albo operacjach, złożeniem funkcji byłaby funkcja,
która stosuje *najpierw* funkcję wymienioną jako *druga*, a *potem* funkcję wymienioną jako
*pierwsza*. I tak na przykład, narysowanie sowy jest złożeniem dwóch operacji, czy może raczej
czynności - *najpierw* należy narysować w odpowiednich miejscach dwa nieco spłaszczone i pochylone
koła, a *następnie* narysować resztę [sowy](https://glebbahmutov.com/blog/how-to-draw-an-owl/),
czyli wystarczy[^1] ...

`narysować_resztę_sowy p∘ narysowaniu_dwóch_kół`

Pod komentarzem `Narysuj` proszę funkcję `g ∘ f`, to znaczy, najpierw skopiuj *tylko* zbiory skrajne
`X` i `Z`, a następnie narysuj strzałki od każdego elementu zbioru `X` do takich elementów `Z`, że z
tych `x`-ów można na Twoim rysunku dojść, idąc po (dwóch) strzałkach, do tych `z`-ów, idąc w ten
sposób funkcjami `f` i `g`. Czy widzisz, że niezależnie od tego, jakimi funkcjami są takie składalne
funkcje `f` i `g`, gdy zaczniesz od dowolnego `x`-a i będziesz podążać za `f` i za `g`, to nie
będziesz mieć nigdy żadnego wyboru i jednocześnie zawsze dojdziesz do jakiegoś `y`-a? To nam
pokazuje, że w ten sposób zdefiniowane złożenie dwóch funkcji jest ... funkcją.

Oznacz tą funkcję literą `h` i podpisz proszę ten rysunek komentarzem: `h(x) = (g ∘ f)(x)`. Czy
widzisz, że ponieważ z każdego `x`-a można w ten sposób dojść do jednego i tylko jednego `z`-a, to w
ten sposób *zawsze* z dwóch składalnych funkcji uzyskamy dokładnie jedną funkcję?  Teoriomnogościowe
składanie jest więc *szczególnym przypadkiem "działania wybrednego"*, które *zachowuje się tak samo,
jak kategoryjne składanie strzałek*. O tym, w jakim znaczeniu tak samo, powiem kiedy indziej.

Przy okazji, pokażę Ci jeszcze jak być może mogłabyś czasem korzystać z nabytej już znajomości
podstaw teorii typów, żeby bardziej "się wczuć" w nowe pojęcia matematyczne. Żeby (mam nadzieję)
poczuć trochę bardziej konkretność definicji składania funkcji, mogłabyś na przykład, ignorując
różnicę między zbiorami i typami, wyobrazić sobie albo spróbować zapisać teoriotypowy odpowiednik
tej operacji tak ...

```lean
def Zlozenie (X Y Z : Type) (f : X → Y) (g : Y → Z) (x : X) := g (f x)
```

... albo (równoważnie) tak ...

```lean
def Zlozenie (X Y Z : Type) (f : X → Y) (g : Y → Z) : X → Z := fun (x : X) => g (f x)
```

... i z drugiej definicji mogłabyś skorzystać na przykład tak:

```lean
def h : Nat → Nat := Zlozenie Nat Nat Nat (fun (n : Nat) => n + 1) (fun (n : Nat) => n + 2)
#eval h 1 -- 4
```

A korzystając z argumentów niejawnych i w ogóle domyślności Leana mogłabyś ułatwić sobie życie tak:

```lean
def Zlozenie` {X Y Z : Type} (f : X → Y) (g : Y → Z) : X → Z := fun (x : X) => g (f x)
def h` := Zlozenie` (fun (n : Nat) => n + 1) (fun (n : Nat) => n + 2)
#eval h` 1 -- 4
```

Czy rozumiesz, dlaczego dla każdych zbiorów `X` i `Y` i każdej funkcji `f : X → Y` zachodzi `Id_Y ∘
f = f = f ∘ Id_X`? Musiałem tutaj znowu inaczej oznaczyć identyczności, bo Unikod nie pozwala na
zapisanie na przykład litery `Y` jako indeksu dolnego. Spróbuję Ci teraz pomóc w ręcznym
skontruowaniu dowodu tych *dwóch* albo nawet *trzech zdań*, mamy tu przecież dwie równości i
niejawną konsekwencję `Id_Y ∘ f = f ∘ Id_X` przechodniości relacji równości. Pomogę Ci jednocześnie
w sprawdzeniu dowodu w podobny sposób do tego, w jaki mógłby to zrobić Lean.

O tożsamości funkcji teoriomnogościowych decyduje to, jaką mają dziedzinę i przeciwdziedzinę, a
także to, co zwracają dla każdego elementu swojej dziedziny. Wystarczy rzut oka na podany wyżej
skrótowy opis trzech funkcji, żeby upewnić się, że `Id_Y ∘ f` oznacza funkcję, która ma taką samą
dziedzinę i przeciwdziedzinę jak funkcja `f` i jak funkcja `f ∘ Id_X`, a więc te trzy funkcje (`Id_Y
∘ f`, `f` i `f ∘ Id_X `) *mogą* być tą samą funkcją (gdyby miały różne dziedziny lub
przeciwdziedziny byłyby automatycznie różnymi funkcjami). Ale czy są?

Skonstruujemy teraz w języku naturalnym dowód zdania `Id_Y ∘ f = f`, które z definicji (tego czym
jest funkcja) znaczy to samo, co `∀ x ∈ X, (Id_Y ∘ f)(x) = f(x)`:

1. Niech `x` będzie elementem zbioru `X`.  
   (tak zaczynamy konstrukcję dowodu zdania, które ma być prawdziwe dla każdego `x` należącego do `X`)  

2. Wtedy `(Id_Y ∘ f)(x) = Id_Y(f(x))`, ...  
   (rozwijamy definicję symbolu `∘`, który oznacza tutaj teoriomnogościowe składanie funkcji)  

3. ... a ponieważ `Id_Y(f(x)) = f(x)` ...  
   (stosujemy definicję funkcji identycznościowej)  

4. ... to `(Id_Y ∘ f)(x) = f(x)`.  
   (stosujemy przechodniość relacji równości do udowodnionych już zdań 2 i 3)

Czyli *dla każdego* `x ∈ X` *jest prawdą, że* `(Id_Y ∘ f)(x) = f(x)`, albo krócej:

`∀ x ∈ X, (Id_Y ∘ f)(x) = f(x)` [QED](https://pl.wikipedia.org/wiki/Q.e.d.).

A ponieważ to ostatnie zdanie oznacza, że kryterium równości funkcji jest dla funkcji `Id_Y ∘ f` i
`f` spełnione, to `Id_Y ∘ f` jest tą samą funkcją, co `f`, czyli `Id_Y ∘ f = f`.

**Sugestia**: Dokończ ten dowód w podobnym stylu dla drugiej równości, to jest dla `f = f ∘ Id_y`,
tylko może nie pisz aż tyle co ja. Przeprowadzając taki dowód po raz pierwszy warto chyba jednak
powstrzymać się przed daleko idącymi skrótami myślowymi.

## Iloczyn kartezjański zbiorów

Pamiętasz, że dowód koniunkcji, czyli *pojedynczego* zdania o pewnej strukturze, można
zaimplementować jako *uporządkowaną parę* dowodów? A pamiętasz, jak pisałem, że typy co prawda nie
są zbiorami, ale że mają coś ze zbiorów? Zresztą funkcje teoriotypowe też nie są "zwykłymi"
funkcjami matematycznymi, ale coś z tych funkcji mają, właściwie nawet mają z nimi bardzo wiele
wspólnego, bo pobierają tak naprawdę tylko jeden argument (określonego *typu*, odpowiadającego
teoriomnogościowej *dziedzinie*) i dla każdego argumentu zwracają dokładnie jeden rezultat (też
określonego *typu*, odpowiadającego teoriomnogościowej *przeciwdziedzinie*). Pisałem też, że funkcje
teoriotypowe to takie funkcje matematyczne, tylko że obliczalne, to znaczy dające się "zrealizować"
za pomocą algorytmu (i zarazem w ten sposób *zrealizowane*). No więc *typ par uporządkowanych* to
taki teoriotypowy odpowiednik, albo "syntaktyczny cień", *iloczynu kartezjańskiego zbiorów*. Wydaje
mi się teraz, że zaczynając w ten sposób mówić o iloczynie kartezjańskim niekoniecznie pomagam ...

To może tak: Iloczyn kartezjański pojawił się również w rozdziale wprowadzającym do izomorfizmu
Curry'ego-Howarda, ponieważ mówiłem tam o *uporządkowanych parach liczb rzeczywistych*. Zbiór
wszystkich takich par to dokładnie zbiór wszystkich punktów na płaszczyźnie, *o ile* z tą
płaszczyzną jest związany układ współrzędnych kartezjańskich.

Teraz jeżeli na przykład ...

`X = {1, 2, 3}` i `Y = {a, b}`

... to ...

`X × Y = {(1, a), (1, b), (2, a), (2, b), (3, a), (3, b)}`

Zapisywanie uporządkowanych par za pomocą zwyczajnych nawiasów to oczywiście tylko konwencja i
równie dobrze moglibyśmy posługiwać się w tym celu notacją stosowaną w Leanie. Wtedy zamiast na
przykład `(1, a)` pisalibyśmy `⟨1, a⟩`. Nie muszę już chyba wyjaśniać, czemu to (akurat niewybredne,
bo "radzi sobie" z każdą \{uporządkowaną!\} parą zbiorów) *działanie na zbiorach* (zauważyłaś, że to
działanie na zbiorach?)  jest w matematyce bardzo ważne, ale powiem Ci o pewnym przydatnym czasem
sposobie myślenia o iloczynach kartezjańskich, jak również o dwóch nietypowych i ważnych przykładach
iloczynów zbiorów.

Dla dowolnych zbiorów `X` i `Y`, iloczyn kartezjański tych zbiorów, czyli `X × Y`, możemy rozumieć
jako przestrzeń wszystkich *niezależnych wyborów* elementów należących do zbioru `X` i do zbioru
`Y`, w tej kolejności. A niezależne wybory elementów należących do pewnych zbiorów, typów, albo
kategorii (w potocznym znaczeniu słowa kategoria) pojawiają się niezwykle często. Na przykład,
typowy obiad zamówiony w restauracji to *logicznie* (ale nie *przyczynowo* albo *statystycznie*)
*niezależny potrójny wybór* zupy, dania głównego i deseru, gdzie każda z tych kategorii dopuszcza
dodatkowo wybór "pusty". Zgodnie z tym punktem widzenia albo definicją można zamówić stosunkowo
niedrogi obiad składający się z *niczego*[^2].

<hr>

**Znowu ta amatorska filozofia**: Czy widzisz, że zbiór zdefiniowany jako `{(x, y) | (x ∈ X) ∧ (y ∈
Y)}`, gdzie `(x, y) = (x', y')` wtedy i tylko wtedy, gdy `x = x'` i `y = y'`, można rozumieć jako
*mechaniczne narzędzie językowe* służące do *jednoczesnego* swobodnego oznaczania elementów
oznacza(l)nych za pomocą `x`-ów i `y`-ów? A czy widzisz, że dodając warunek `(x, y) = (x', y')`
wtedy i tylko wtedy, gdy `x = x'` i `y = y'`, rozstrzygamy, że zarówno tożsamość jak i kolejność
(oznaczanych!) elementów w parze ma znaczenie, bo wykluczamy jako fałszywe m.in. zdania takie jak
`(1, 2) = (2, 2)` czy `(1, 2) = (2, 1)`? Te wszystkie warunki określają więc po prostu, co i *w jaki
sposób* mogą oznaczać wyrażenia o postaci `X × Y` i `(x, y)`. Pojawia nam się tutaj kwestia *sposobu
oznaczania* (za pomocą elementów tego zbioru), ponieważ `X × Y` to nie jest *jakiś tam* zbiór, tylko
zbiór posiadający *dodatkową strukturę* (produktu).

<hr>

**Rysunek 8**: Żeby utrwalić sobie to pojęcie i zacząć się przyzwyczajać do bardziej elastycznego
myślenia o *wymiarach*, `Narysuj` proszę dwie prostopadłe osie, poziomą oznacz literą `X` a pionową
literą `Y`, i nanieś na nie elementy tych zbiorów tak, żeby tworzyły skale osi, to znaczy,
zaczynając od punktu przecięcia się osi, zaznacz "wysokości" za pomocą elementów `1`, `2` i `3`, a
"szerokości" za pomocą elementów `a` i `b`. Następnie w odpowiednich miejscach uzyskanego w ten
sposób wykresu nanieś wszystkie uporządkowane pary zapisując je albo za pomocą zwykłych nawiasów,
albo [nawiasów ostrokątnych](https://pl.wikipedia.org/wiki/Nawias), jak wolisz. Gdy już to zrobisz,
podpisz ten rysunek komentarzem: *Przykład iloczynu kartezjańskiego zbiorów* `X = {1, 2, 3}` *i* `Y
= {a, b}`. *Wartości oznaczone na osiach to tak zwane projekcje par uporządkowanych.*

A teraz będą dwa zapowiedziane przykłady. Zastanów się proszę przez chwilę, jak zgodnie z definicją
(która mówi, że iloczyn kartezjański dwóch zbiorów to taki zbiór, którego elementami są dokładnie
wszystkie uporządkowane pary elementów należących do pierwszego i drugiego zbioru) powinien wyglądać
zbiór `∅ × X`, gdzie `∅` to zbiór pusty, czyli zbiór `{}` (oznaczamy go tak i tak, zależnie od tego,
jak jest nam w danej sytuacji wygodniej). Jak postanowisz, że już czas, kliknij
[ten](R21__Iloczyn_zbioru_pustego_i_X.md) link żeby przeczytać moje wyjaśnienia.

Drugim ważnym dla nas przykładem jest `{1} × Y`, czyli iloczyn kartezjański pewnego singletona i
scharakteryzowanego wcześniej zbioru `Y`. Wykombinowanie, jak powinien wyglądać ten konkretny zbiór,
nie powinno Ci moim zdaniem sprawić szczególnych trudności.

Po wykonaniu bądź podjęciu prób wykonania tych zadań-sugestii, gdy już uznasz, że jesteś na to
gotowa, zapoznaj się jeszcze proszę z [tym](R21__Iloczyn_kartezjanski_jako_mnozenie.md)
"obowiązkowym" fragmentem.

## Suma rozłączna zbiorów

Dla dowolnych zbiorów `X` i `Y`, *suma rozłączna* tych zbiorów to taki zbiór, który zawiera
dokładnie wszystkie *kopie*, zapisane w jakikolwiek sposób jako *różne* elementy, elementów tych
zbiorów. To znaczy, że wewnątrz sumy rozłącznej *zachowujemy informację* o tym, z którego z dwóch
zbiorów *pochodzi* każdy element.

Na przykład, jeżeli tak jak wcześniej `X = {1, 2, 3}` i `Y = {a, b}`, to nie musimy w żaden sposób
*oznaczać* elementów, bo żaden element nie należy jednocześnie do zbiorów `X` i `Y` (zakładając, że
ani element \{zapisany jako\} `a` ani `b` nie jest żadną z liczb należących do `X), i możemy po
prostu stwierdzić, że `X ⨿ Y = {1, 2, 3, a, b}`. Suma rozłączna to również pewne (niewybredne)
*działanie na zbiorach*, które zapisujemy między innymi za pomocą symbolu `⨿`.

**Rysunek 9**: Narysuj proszę te dwa zbiory a między nimi ich sumę rozłączną w taki sposób, żeby
zarówno z każdego elementu zbioru `X` jak i z każdego elementu zbioru `Y` wychodziły strzałki do ich
kopii w sumie rozłącznej. Otocz te dwie *części* zbioru `X ⨿ Y` liniami przerywanymi. Czy widzisz,
że to zawsze (bo tego wymaga definicja) muszą być rozłączne części i że zawsze w takiej sytuacji
istnieją dwie funkcje *injektywne* (bo to są dwie *wierne kopie*), w tym wypadku `i_X : X → X ⨿ Y` i
`i_Y : Y → X ⨿ Y`, które jakby *wyrażają* te *inkluzje* (bo tak między innymi nazywamy te funkcje)?
Podpisz proszę ten rysunek komentarzem, który Twoim zdaniem tu pasuje i który pozwoli Ci się
upewnić, że przynajmniej w tym momencie pamiętasz lub potrafisz odnaleźć i zapisać po swojemu
objaśnienia na temat wszystkich wymienionych właściwości tej konstrukcji.

**Rysunek 10**: Gdy dwa zbiory zawierają choćby tylko jeden wspólny element, nie możemy należących
do nich elementów po prostu "włożyć" do sumy rozłącznej bez żadnej modyfikacji, bo w ten sposób nie
uzyskamy dwóch *rozłącznych* kopii zbiorów wyjściowych. W takich sytuacjach musimy jakoś *oznaczyć*
wszystkie kopie tak, żeby *elementy wspólne dla obydwu zbiorów* były *reprezentowane* przez *różne*
kopie. Ponieważ suma rozłączna zbiorów jest działaniem binarnym w zasadzie jak każde inne, a dla
takich działań ważna jest kolejność obiektów czy argumentów na których wykonujemy działanie, to
pisząc `X ⨿ Y` zdecydowaliśmy automatycznie, że `X` jest *pierwszym*, a `Y` *drugim* członem tej
sumy rozłącznej.

*Spełniającą dokładnie tą samą rolę* sumę rozłączną `X ⨿ Y` możemy zatem skonstruować tak: `X ⨿ Y :=
{(1, 1), (2, 1), (3, 1), (a, 2), (b, 2)}`. W ten sposób możemy skorzystać z par uporządkowanych i
liczb naturalnych `1` i `2`, żeby *zaimplementować* operację tworzenia sum rozłącznych z *dowolnych*
par zbiorów. Ponieważ ten sposób jest *uniwersalny*, można zapomnieć o poprzednim i stosować tylko
ten. Myślę, że wiesz, jak należy przedstawić tą konstrukcję za pomocą rysunku i jak, za pomocą
strzałek od elementów zbioru `X` i od elementów zbioru `Y` do odpowiednich kopii w zbiorze `X ⨿ Y`,
należy oznaczyć obydwie funkcje-inkluzje (albo injekcje-inkluzje), czyli po prostu obydwie
inkluzje. Na koniec oznacz proszę te inkluzje jako `i_X` i `i_Y`, tylko może zamiast symbolu `_`
zapisz wtedy litery `X` i `Y` jako indeksy dolne. Otocz kopie przerywanymi liniami i podpisz rysunek
(ewentualnie wspomagając się tym tekstem) komentarzem sprawdzającym Twoją wiedzę na temat tej
konstrukcji.

Jeżeli masz już za sobą poprzedni, dostępny poprzez link fragment "obowiązkowy", to zastanów się
proszę, jak ta operacja na zbiorach, zakładając, że wszystkie zbiory są *skończone*, musi "działać"
na parach zbiorów takich, że co najmniej jeden z nich jest zbiorem pustym, a jak na parach takich,
że co najmniej jeden zbiór jest singletonem. Następnie zastanów się proszę, jak ta operacja na
zbiorach skończonych ma się do (funkcji) mocy zbiorów i operacji *dodawania* liczb naturalnych. Gdy
już uznasz, że wystarczy tych samodzielnych rozmyślań (być może wspomaganych rysunkami i notatkami),
zapoznaj się proszę z [drugim](R21__Operacje_na_zbiorach_i_na_liczbach.md) i ostatnim w tym
rozdziale fragmentem "obowiązkowym".

Na koniec poznasz jeszcze dwie operacje na zbiorach, które są blisko związane z *koniunkcją* i
*alternatywą zdań*.

## Część wspólna zbiorów

Jeżeli `X` i `Y` to zbiory, to *częścią wspólną*, *przekrojem*, *przecięciem*, albo *iloczynem
mnogościowym* (to tylko różne nazwy na to samo) `X` i `Y` nazywamy zbiór złożony dokładnie z takich
elementów, które należą *zarówno do* `X` *jak i do* `Y`. Tą operację zapisujemy za pomocą symbolu
`∩`. Możemy to zapisać półformalnie tak: Jeżeli `X` i `Y` to zbiory, to ...

`X ∩ Y := {z | (z ∈ X) ∧ (z ∈ Y)}`.

**Czytamy to**: Jeżeli `X` i `Y` to zbiory, to zbiór, który oznaczamy jako `X ∩ Y` i który nazywamy
(między innymi) ich częścią wspólną, jest z definicji takim zbiorem, który zawiera dokładnie te
elementy, które należą zarówno do `X` jak i do `Y`.

Czy widzisz podobieństwo między symbolami `∩` i `∧`, i czy widzisz, że jest nieprzypadkowe?

## Suma zbiorów

Jeżeli `X` i `Y` to zbiory, to *sumą* albo *unią* `X` i `Y` nazywamy zbiór złożony dokładnie z
takich elementów, które należą do `X` *lub* do `Y`. Tą operację zapisujemy za pomocą symbolu
`∪`. Możemy to zapisać półformalnie tak: Jeżeli `X` i `Y` to zbiory, to ...

`X ∪ Y := {z | (z ∈ X) ∨ (z ∈ Y)}`.

**Czytamy to**: Jeżeli `X` i `Y` to zbiory, to zbiór, który oznaczamy jako `X ∪ Y`, jest z definicji
takim zbiorem, który zawiera dokładnie te elementy, które należą do `X` *lub* do `Y`. Spójnik
logiczny `∨`, którego jeszcze nie omawiałem, nazywamy między innymi *alternatywą* i czytamy właśnie
jako *lub*.

Czy widzisz teraz podobieństwo między symbolami `∪` i `∨`, i czy widzisz, że jest nieprzypadkowe?

**Rysunek 11**: Zrób proszę notatkę z odpowiednimi rysunkami, która będzie dla Ciebie ilustracją
pojęć iloczynu (tym razem nie kartezjańskiego!) i sumy zbiorów. Być może będzie Ci łatwiej, jeżeli
wcześniej zapoznasz się ze stronami Wikipedii dotyczącymi
[jednego](https://pl.wikipedia.org/wiki/Cz%C4%99%C5%9B%C4%87_wsp%C3%B3lna) i
[drugiego](https://pl.wikipedia.org/wiki/Suma_zbior%C3%B3w) pojęcia.

### Przypisy

[^1]: Jeżeli zastanawiasz się, co znaczy to "sprawdza się w praktyce", to wyjaśniam, że chodzi o
    związki między pojęciem funkcji i innymi pojęciami. Gdy patrzymy na funkcje z ogólniejszej
    perspektywy i z różnych punktów widzenia, staje się szybko jasne, że "trzeba" przyjąć, że
    funkcje ze zbioru pustego "istnieją".

[^2]: Ten przykład "ukradłem" i przerobiłem na bardziej "własny" wybitnemu, niestety nieżyjącemu już
    matematykowi [F. Williamowi Lawverowi](https://en.wikipedia.org/wiki/William_Lawvere) i
    [Stephenowi H. Schnauelowi](https://en.wikipedia.org/wiki/Stephen_Schanuel), którzy skorzystali
    z podobnego przykładu w dosyć niezwykłej, nawet jeżeli cokolwiek chaotycznej (i kto to mówi)
    książce [Conceptual
    Mathematics](https://www.cambridge.org/highereducation/books/conceptual-mathematics/00772F4CC3D4268200C5EC86B39D415A#contents),
    którą czytałem, wielokrotnie, dawno, dawno, dawno temu i która była dla mnie jedną z inspiracji
    podczas pisania tej (m.in. dlatego, że powstawała w interakcji z licealistami). I owszem, z
    pierwszym z wymienionych [kosiarzy
    umysłów](https://en.wikipedia.org/wiki/The_Lawnmower_Man_(film)) też kiedyś przez chwilę
    korespondowałem.
