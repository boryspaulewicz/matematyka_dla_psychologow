## Teoria mnogości w za-rysie

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

Wolałbym chyba "w ten sposób" zamiast "tak" w tym ostatnim zdaniu, ale trudno, jest jak jest. Nie
będziemy się teraz przyglądać aksjomatom tej teorii, ponieważ my sobie sami *zrobimy* - ze strzałek
i funkcji - pewną wersję teorii mnogości w jednym z późniejszych rozdziałów, ale zanim to nastąpi,
zacznę odtąd intensywnie *korzystać* z półformalnej teorii mnogości jako ze źródła ważnych
przykładów.

Pojęcie zbioru jako takiego jest interesujące przede wszystkim dla specjalistów zajmujących się
... zbiorami, natomiast dla reszty świata to raczej nie jest nic szczególnie ciekawego, bo zbiór to
nic innego jak pewna *kolekcja* (jakiś) elementów czy obiektów. Zbiory *skończone* możemy zapisać
*dosłownie*, na przykład tak:

`{1, 20, *, X, -3.4}`

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, na przykład tak ...

`{0, 1, 2, 3, 4, ...}`

lub tak ...

`{n ∈ ℕ | Dodatnie n}`

... bo zapisane dosłownie nie zmieściłyby się na żadnej stronie. Wymyślając pierwszy przykład
chciałem od razu zasugerować, że - zgodnie z dominującym w matematyce zwyczajem - zbiory mogą
zawierać dowolne elementy, na przykład takie, które nie należą do żadnego dającego się łatwo (albo
nawet w ogóle) zidentyfikować rodzaju albo typu. A więc zbiory to takie dowolne kolekcje
potencjalnie różnorodnych elementów.

**Rysunek 1. Prototypowy przykład funkcji**: Jak już wiesz, można powiedzieć, że funkcja to pewien
"obiekt", który przyporządkowuje każdemu elementowi swojej dziedziny dokładnie jeden element swojej
przeciwdziedziny. Żeby mieć jasny obraz sytuacji, przygotuj proszę czystą kartkę i z pewej strony
`Narysus okrag` o średnicy kroku. O krok w prawo od prawego brzegu tego okręgu również `Narysuj
okrag`. W lewym okręgu `Narysuj Punkt x₁`, `Narysuj Punkt x₂` i `Narysuj Punkt x₃`, jeden nad
drugim, oznaczając je z *lewej* strony indeksowanymi literami `x`, czyli oznaczając je jako `x₁`,
`x₂` i `x₃`. W prawym okręgu tak samo `Narysuj` punkty `y₁`, `y₂` i `y₃`, ale te oznacz z *prawej*.

Mamy już (kandydata na) dziedzinę `X` i (kandydata na) przeciwdziedzinę `Y`, a więc możemy (za
pomocą rysunku) *zdefiniować* jakąś *funkcję*. Stosujemy tutaj dosyć powszechną konwencję, zgodnie z
którą duże litery oznaczają zbiory, a małe litery oznaczają elementy. Czasami nie sposób trzymać się
tej konwencji konsekwentnie, ponieważ elementami niektórych zbiorów są również zbiory, ale tym razem
takie komplikacje nie wystąpią.

**Tożsamość zbiorów**: Te liczbowe indeksy dolne mogą być mylące. Trzeba wiedzieć, że to, w jakiej *kolejności* zapisane są
elementy zbioru *nie ma znaczenia*, tak samo jak nie ma znaczenia, czy ten sam element zapiszemy
*więcej niż raz*. Na przykład, `{1, 2}` to *ten sam zbiór* co `{2, 1}` i *ten sam zbiór* co `{1, 1,
2}`, bo do wszystkich tych zbiorów *należą dokładnie te same elementy*, to jest `1` i `2`, a to,
które elementy do danego zbioru należą, a które nie, *decyduje o tożsamości zbioru*. 

Celowo napisałem *ten sam zbiór*, a nie na przykład *ten sam obiekt*, bo takie *zapisy* jak `{1, 1,
2}` można przecież *interpretować dowolnie* (interpretacja jest zawsze pewnym *wyborem*,
pamiętasz?), a z pewnych punktów widzenia te trzy wyrażenia na pewno mogłyby oznaczać różne
"rzeczy". A mówiąc to samo, ale inaczej: To, które elementy należą, a które nie należą do danego
zbioru decyduje o tym, które zbiory są *równe*, czyli *nierozróżnialne jako zbiory* (relacja
równości jest zawsze typowana), czyli *wzajemnie zastępowalne jako zbiory*. Zastąpienie w dowolnym
miejsu, *w którym ma być jakiś zbiór* na przykład zbioru `{1, 2}` przez zbiór `{2, 1, 1}` *nic nie
zmieni*, to jest zdanie pozostanie prawdziwe albo fałszywe, jeżeli to było miejsce w jakimś zdaniu,
i dany obiekt pozostanie tym samym obiektem, jeżeli to była część wyrażenia charakteryzującego jakiś
obiekt.

Można więc powiedzieć, że *każdy* zbiór jest *tym samym*, co pewna *kolekcja zdań* mówiących o tym,
że *taki a taki element należy do danego zbioru*. Być może wyjaśnienie tego w ten właśnie sposób
pozwoli Ci łatwiej zrozumieć, że powtórzenie i kolejność zapisanych elementów zbioru nie ma
znaczenia, bo przecież *treść* zawarta w kolekcji zdań mówiących o relacji należenia elementów do
zbioru *nie ulegnie zmianie*, gdy te zdania zapiszemy w innej kolejności, albo gdy niektóre zdania
zapiszemy więcej niż raz.

`Narysuj Strzalka x₁ y₁`, i tak samo dla par `⟨x₂, y₁⟩` (czyli `Narysuj Strzalka x₂ y₁`) i `⟨x₃,
y₂⟩`. W tym przykładzie chodzi między innymi o to, żeby element `y₃` ["został na
lodzie"](https://sjp.pwn.pl/ciekawostki/haslo/zostawic-kogos-na-lodzie;5391760.html). Oznacz ten
rysunek od góry literą `f`, jak *funkcja*, bo to jest pewna funkcja: *Każdemu* elementowi zbioru `X`
przyporządkowałaś właśnie *dokładnie jeden* element zbioru `Y`. To jest też użyteczny *przykład
reprezentatywny* funkcji, bo prawie wszystkie zbiory są niepuste, wiele funkcji nie "trafia" w każdy
element przeciwdziedziny i często zdarza się, że niektóre elementy "trafiają" w ten sam element.

**Przykłady negatywne**: Byłoby dobrze, gdybyś jeszcze narysowała poniżej bardziej samodzielnie dwa
przykłady sposobów przyporządkowania elementom (czyli to będą *źródła* strzałek) jakiegoś zbioru `X`
(bo po co wymyślać dla kolejnych przykładów ciągle nowe nazwy) elementy (czyli to będą *cele*)
jakiegoś zbioru `Y`, tak, żeby to *nie* były funkcje. A "zepsuć funkcyjność" można na dokładnie
*dwa* sposoby - albo jakiś element z lewej będzie *wysyłał więcej niż jedną strzałkę*, albo jakiś
element z lewej *nie będzie wysyłał żadnej strzałki*. Takie rysunki będą poprawnymi definicjami
*relacji*, ale nie funkcji, bo funkcje to *relacje specjalne*, to jest takie, jak już wyjaśniłem.

**Kilka sposobów myślenia o funkcjach teoriomnogościowych**: Jak zawsze, warto czasami pomyśleć o
tym samym na kilka różnych sposobów: O tak rozumianych funkcjach można myśleć jako o abstrakcyjnych
*własnościach* pewnego rodzaju. Na przykład, można powiedzieć, że na Twoim pierwszym rysunku każdy
element zbioru `X` ma określoną `f-`*własność* `Y`. Podobnie, każdy ma dokładnie jedno pierwsze imię
i dokładnie jedną datę urodzenia, a więc te własności to są takie *funkcje osób*. Albo można o
funkcjach myśleć jako o *doskonałych pomiarach* czy może raczej *wartościach obserwowanych* pewnych
właściwości albo wymiarów. I jakby odwrotnie, można o funkcjach myśleć jako o pewnego rodzaju
*kompletnych oznaczeniach* albo *rozdaniach kart* w tym sensie, że *każdy* element dziedziny jest
wykorzystany do *oznaczenia*, albo że jest *przydzielony* do jakiegoś elementu należącego do
przeciwdziedziny. Z tego punktu widzenia każdy `x` `f`-oznacza jakiś `y`. Dobrze jest czasem
spróbować pomyśleć o takiej funkcji choć raz na każdy z tych sposobów, bo czasem trudno przewidzieć,
który z tych punktów widzenia pozwoli zrozumieć jakiś problem w którym ważną rolę odgrywają funkcje
lepiej.

Odtąd ograniczymy nasze rozważania do dowolnych zbiorów *skończonych*, to jest takich, które mają
skończenie wiele elementów. Mówiąc dokładniej, będziemy teraz opisywać świat (a lepiej:
*przestrzeń*) w którym istnieją tylko zbiory skończone, w którym występują dowolne takie zbiory i w
którym występują wszystkie możliwe funkcje między takimi zbiorami. Na początek omówimy kilka ważnych
przykładów.

**Rysunek 2. Funkcje do zbioru jednoelementowego**: `Narysuj` proszę dwa zbiory jako okręgi, obok
siebie, i w lewym narysuj kilka kropek, które będą oznaczały (jakieś) elementy, a w prawym tylko
sjedną kropkę. Zbiory jednoelementowe nazywamy również *zbiorami jednostkowymi* albo
[*singletonami*](https://pl.wikipedia.org/wiki/Zbi%C3%B3r_jednoelementowy). Czy widzisz, że istnieje
tylko jedna funkcja ze zbioru lewego do prawego? Narysuj proszę tą funkcję.

**Rysunek 3. Funkcje ze zbioru pustego**: A teraz `Narysuj` proszę obok siebie dwa zbiory, `X` i
`Y`, ale takie, że w lewym *nic* nie będzie, a w prawym będą na przykład dwa elementy. Jak już
wiesz, żeby "coś" było funkcją, musi przyporządkowywać każdemu elementowi dziedziny dokładnie jeden
element przeciwdziedziny. Jak myślisz, czy może istnieć funkcja z `X` do `Y`? Wydawałoby się, że
nie, prawda? A jednak istnieje! To jest taka funkcja, nazwijmy ją tym razem `p` (od pierwszej litery
w słowie *pusty*), że *gdybyś* wybrała dowolny element zbioru `X`, to dostarczyła*by* dokładnie
jeden element ze zbioru `Y`. Ponieważ jednak w zbiorze `X` nie ma żadnych elementów, ta funkcja *nie
może* nic zwrócić. A zatem funkcja `p` "nic nie robi jeszcze bardziej" niż znana Ci już
(teoriotypowa, nie teoriomnogościowa, czyli *funkcja jako program*) funkcja `nic_nie_robie` i jest
niemal tak abstrakcyjna, bo w pewien sposób wirtualna, jak term typu `Absurd`. Tyle, że ta funkcja
*istnieje* na mocy konwencji. Co więcej, istnieje tylko jedna taka funkcja, bo wszystkie takie
funkcje *zwracają to samo dla każdego argumentu*, a właśnie ten warunek, razem z dziedziną i
przeciwdziedziną, decyduje o tożsamości funkcji. Tak samo istnieje dokładnie jedna funkcja ze zbioru
pustego do niego samego. 

Zbiory puste zapisujemy albo jako `{}` albo jako symbol `∅`. Na cześć tej funkcji narysuj proszę
`Strzalka X Y` i oznacz ją literą `p`, a pod spodem zapisz komentarz: Dla każdego zbioru `Y`,
istnieje dokładnie jedna funkcja ze zbioru pustego do `Y`. Może i trudno się z tym pogodzić, ale to
tylko konwencja (dotycząca *funkcji*), którą przyjmujemy po prostu dlatego, że sprawdza się w
praktyce.

**Rysunek 4. [Identyczność](https://pl.wikipedia.org/wiki/Identyczno%C5%9B%C4%87) na dwa sposoby**:
`Narysuj` teraz proszę trzyelementowy zbiór `X`. Chciałbym, żebyś narysowała funkcję
identycznościową o nazwie `Id`, taką, że `Id(x) = x`.  Użyłem tutaj symbolu równości zamiast symbolu
definiowania, bo to jest *warunek*, który ta funkcja ma spełniać i to *Ty* ją zdefiniujesz. Zastanów
się proszę przez chwilę jak mogłabyś to zrobić, a gdy już wpadniesz na jakiś pomysł, albo gdy się
poddasz, przeczytaj moje objaśnienia [tutaj](Rysunek_identycznosc.md). Jeżeli przyszedł Ci do głowy
tylko jeden sposób, to również kliknij w ten link. Jak już narysujesz tą funkcję, podpisz ją proszę
komentarzem *Przykład funkcji identycznościowej*.

**Rysunek 5. Przykład injekcji[^1]**: `Narysuj` proszę obok siebie dwuelementowy zbiór `X` i
trzyelementowy zbiór `Y` i narysuj funkcję, która nie "skleja" żadnej pary elementów `X`, to jest
nie posyła żadnych dwóch `x`-ów do tego samego `y`-a. Takie funkcje nazywamy *injekcjami* albo
funkcjami
[*różnowartościowymi*](https://pl.wikipedia.org/wiki/Funkcja_r%C3%B3%C5%BCnowarto%C5%9Bciowa). Czy
widzisz, że aby istniała jakakolwiek injekcja, dziedzina nie może mieć więcej elementów niż
przeciwdziedzina? A czy widzisz, że każda injekcja to *między innymi* pewien *wybór* albo *wskazanie
podzbioru* przeciwdziedziny (i niejako przy okazji oznaczenie elementów tego podzbioru `x`-ami)?
Żeby to podkreślić, otocz proszę ten podzbiór `Y`
[linią](https://zpe.gov.pl/a/linia-i-kreska-jako-srodki-wyrazu-plastycznego/DkHkQQkj0) przerywaną.

**Rysunek 6. Przykład surjekcji**: `Narysuj` proszę funkcję `f` z trójelementowego zbioru `X` do
dwuelementowego zbioru `Y`, ale taką, żeby każdy `y` "został trafiony". Takie funkcje nazywamy
*surjekcjami* albo funkcjami *na*. Czy widzisz, że każda taka funkcja jest *podziałem całej
dziedziny* na rozłączne kategorie albo podzbiory, których `f-`nazwami są `y`-i? Żeby to podkreślić,
otocz proszę wyznaczone w ten sposób części `X` liniami przerywanymi.

**Rysunek 7. Przykład bijekcji**:
[*Bijekcjami*](https://pl.wikipedia.org/wiki/Funkcja_wzajemnie_jednoznaczna) nazywamy takie funkcje,
które są jednocześnie injekcjami i surjekcjami, czyli takie, które są różnowartościowe i na, czyli
takie, które nie sklejają żadnych elementów swojej dziedziny i trafiają we wszystkie elementy swojej
przeciwdziedziny. `Narysuj` proszę bijekcję z czteroelementowego zbioru `X` do czteroelementowego
zbioru `Y` i oznacz ją literą `f`. Czy rozumiesz, dlaczego nie może istnieć bijekcja, w dowolnym
kierunku, między zbiorami *różniącymi się wielkością*?

Bijekcje są *przykładami* [izomorfizmów](https://pl.wikipedia.org/wiki/Izomorfizm), ale pojęcie
izomorfizmu jest, jak się przekonasz, znacznie ogólniejsze. Czy widzisz, że izomorfizm jest jak
powiedzenie dokładnie tego samego, tylko innymi słowami albo symbolami, czyli to taki jakby wierny
tłumacz w obie strony? Dlatego nazywamy takie funkcje również funkcjami *wzajemnie
jednoznacznymi*. W tym wypadku to jest taka *wymiana* `x`-ów na `y`-ki, ale poza tym nic się nie
zmienia.

Ważną własnością funkcji izomorficznych i w ogóle wszelkiego rodzaju izomorfizmów jest ich
*odwracalność*. Dlatego proszę, żebyś narysowała jeszcze odwrotność funkcji `f`. To ma być taka
funkcja `f⁻¹`, że `f⁻¹` *odwraca działanie funkcji* `f`, to znaczy: Jeżeli do dowolnego `x`
zastosujesz `f`, to gdy do rezultatu zastosujesz `f⁻¹`, uzyskasz znowu ten `x`, czyli `f⁻¹(f(x)) =
x` *i jednocześnie* dla każdego `y`, `f(f⁻¹(y)) = y`. Jak tylko to zrobisz, zobaczysz czemu w
wyrażeniu `f(f⁻¹(y))` pojawia się `y` a nie `x`. Można więc powidzieć, że funkcje odwrotne są
*lustrzanymi odbiciami wiernych obrazów* (lepiej: *odwzrowań*) *dwóch* (z konieczności
równolicznych) *zbiorów*.

Czy widzisz, że gdy już masz jakąś funkcję `f`, to może istnieć co najwyżej jedna funkcja `f⁻¹`?
Można powiedzieć, że jeżeli funkcja ma być odwrotnością jakiejś funkcji odwracalnej, czyli jakiejś
bijekcji, to "nie ma żadnego wyboru", bo każdemu elementowi swojej dziedziny *musi* przyporządkować
dokładnie ten element, który w niego "`f`-trafia".  Właśnie dlatego, że taka funkcja, jeżeli
istnieje (a istnieje dokładnie wtedy, gdy `f` jest bijekcją), jest *unikalna*, oznaczamy ją jako
`f⁻¹`, to jest `f` z `-1` jako indeksem górnym, czyli jako *unikalne coś, co powstaje w pewien
sposób z funkcji* `f`.

Może jeszcze `Narysuj` dowolną funkcję *nie*bijektywną i przekonaj się, że taka funkcja nie może być
odwracalna, to znaczy, gdyby `f` nie było bijekcją, bo albo sklejałoby jakieś elementy, albo nie
trafiało w jakiś element przeciwdziedziny, to nie mogłaby istnieć żadna *funkcja* `g` z
przeciwdziedziny `Y` funkcji `f` do dziedziny `X` tej funkcji taka, że `g(f(x)) = x` *i
jednocześnie* `f(f(y)) = y`.

Muszę odtąd czasem zrezygnować ze stosowania indeksów dolnych, bo standard kodowania
[Unikod](https://pl.wikipedia.org/wiki/Unicode) jest pod tym względem mocno ograniczony. Jeżeli więc
napiszę na przykład `h_1`, to będzie to tylko
[namiastka](https://sjp.pwn.pl/slowniki/namiastka.html) `h₁` (akurat cyfry da się w ten sposób w
Unikodzie zapisywać, ale już na przykład większości liter nie).

Byłoby wspaniale, gdybyś jeszcze spróbowała zdefiniować za pomocą rysunków dwie funkcje, nazwijmy je
znowu `f` i `g`, takie, że `f, g : X → Y` ma *tylko* lewą odwrotność, ale nie ma prawej, to znaczy,
istnieje funkcja `l_f` taka, że `l_f(f(x)) = x`, ale *nie* istnieje funkcja `p_f` taka, że
`f(p_f(y)) = y` (tak, tu ma być `y`, a nie `x`), a `g : X → Y` ma *tylko* prawą odwrotność, ale nie
ma lewej, to znaczy, istnieje funkcja `p_g` taka, że `g(p_g(y)) = y`, ale *nie* istnieje funkcja
`l_g` taka, że `l_g(g(x)) = x`. Podpowiem Ci, że w tym zadaniu ważną rolę odgrywają własności bycia
injekcją, ale nie surjekcją i bycia surjekcją, ale nie injekcją.

**Rysunek 8. Składanie funkcji teoriomnogościowych**: Na koniec `Narysuj` jeszcze proszę trzy
zbiory, `X`, `Y` i `Z` takie, że pierwszy ma trzy elementy, drugi powiedzmy cztery i trzeci może też
cztery. Zdefiniuj rysując strzałki jakąś funkcję `f : X → Y`, czyli funkcję ze zbioru `X` do zbioru
`Y` i jakąś funkcję `g : Y → Z`. Pod spodem zapisz komentarz: *Teoriomnogościowe złożenie funkcji*
`f` *i* `g` *to taka funkcja* `g ∘ f` *(zapisujemy to w ten sposób w tej kolejności), że* `(g ∘
f)(x) := g(f(x))` *(właśnie dlatego w tej kolejności).* 

Czyli gdyby o funkcjach myśleć jako o programach albo operacjach, złożeniem funkcji byłoby wykonanie
najpierw jednej (wymienionej jako *druga*) operacji, a potem drugiej (wymienionej jako *pierwsza*).
I tak na przykład, narysowanie sowy jest złożeniem dwóch operacji, czy może raczej czynności -
najpierw należy narysować dwa nieco wygięte koła, a następnie narysować resztę
[sowy](https://glebbahmutov.com/blog/how-to-draw-an-owl/), czyli narysować sowę p∘ tym, jak
narysowało się najpierw dwa koła.

Pod komentarzem `Narysuj` funkcję `g ∘ f`, to znaczy, najpierw skopiuj *tylko* zbiory `X` i `Y`, a
następnie narysuj strzałki od każdego elementu zbioru `X` do takich elementów `Y`, że z tych `x`-ów
można na Twoim rysunku dojść idąc po (dwóch) strzałkach do tych `y`-ów "idąc funkcjami" `f` i
`g`. Oznacz tą funkcję literą `h` i podpisz proszę ten rysunek komentarzem: `h(x) = (g ∘ f)(x)`. Czy
widzisz, że ponieważ z każdego `x`-a można w ten sposób dojść do jednego i tylko jednego `y`-a, to w
ten sposób *zawsze* z dwóch składalnych funkcji uzyskamy dokładnie jedną funkcję?  Teoriomnogościowe
składanie jest więc *szczególnym przypadkiem "działania wybrednego"*, które *zachowuje się tak samo,
jak kategoryjne składanie strzałek*. O tym, w jakim znaczeniu tak samo, powiem później.

Czy rozumiesz, dlaczego jeżeli `f : X → Y`, to `Id_y ∘ f = f = f ∘ Id_y`? Musiałem tutaj inaczej
oznaczyć identyczności, bo Unicode nie pozwala na zapisanie na przykład litery `Y` jako indeksu
dolnego. Spróbuję Ci teraz pomóc w ręcznym skontruowaniu dowodu i jednocześnie sprawdzeniu go w
podobny sposób do tego, w jaki mógłby to zrobić Lean.

O tożsamości funkcji teoriomnogościowych decyduje to, jaką mają dziedzinę i przeciwdziedzinę i to,
co zwracają dla każdego elementu dziedziny. Wystarczy rzut oka na podany wyżej skrótowy opis trzech
funkcji, żeby upewnić się, że `Id_y ∘ f` oznacza funkcję, która ma taką samą dziedzinę i
przeciwdziedzinę jak funkcja `f` i jak funkcja `f ∘ Id_y`, a więc te trzy funkcje *mogą* być tą samą
funkcją. A czy są? Niech `x` będzie dowolnym elementem zbioru `X`. Wtedy (rozwijamy definicję
składania teoriomnogościowego) `(Id_y ∘ f)(x) = Id_y(f(x))`, a ponieważ (stosujemy definicję funkcji
identycznościowej) `Id_y(f(x)) = f(x)`, to (przechodniość relacji równości) `(Id_y ∘ f)(x) =
f(x)`. Czyli dla każdego `x ∈ X` jest prawdą, że `(Id_y ∘ f)(x) = f(x)`, a więc `Id_y ∘ f` to ta
sama funkcja, co `f`, czyli `Id_y ∘ f = f`. 

**Sugestia**: Dokończ ten dowód w tym stylu dla drugiej równości, to jest dla `f = f ∘
Id_y`. Przeprowadzając taki dowód warto chociaż raz powstrzymać się przed robieniem daleko idących
skrótów myślowych.

## An arrow is an arrow is an arrow ...

Może zapnij pasy, a jak nie masz, to nie wiem, zrób cokolwiek, żebyś mogła czuć się w miarę
bezpiecznie. Będziemy teraz [mówić jednocześnie w kilku
językach](https://www.youtube.com/watch?v=33Raqx9sFbo), to jest w języku zbiorów skończonych, języku
teorii kategorii, (tak jakby) w języku teorii typów i w języku naturalnym.

`∀ X : Zbior`, istnieje funkcja identycznościowa `Id_x`, to jest taka, że `Id_x(x) = x`. Poniżej
najniższego rysunku `Narysuj Punkt X` i strzałkę o nazwie `Idₓ`, która zawija się w taki sposób, że
`Zrodlo Idₓ` i `Cel Idₓ` to `Punkt X`. Zwróć uwagę, że ten rysunek to *wyrażenie w języku teorii
kategorii*, a *nie* w języku teorii zbiorów. To znaczy, że właśnie *zmieniłaś język*, a więc również
*punkt widzenia*.

Na to, co wcześniej nazywałem punktami, zwykle używa się nazwy *obiekt* , jednak zależało mi, żebyś
pamiętała, że *w teorii kategorii* obiekty to *tylko punkty zaczepienia strzałek*. Strzałki w tej
teorii nazywamy często *morfizmami* albo *odwzorowaniami*, ale te nazwy, podobnie jak słowo
*obiekt*, oddają dobrze *genezę* teorii kategorii, za to *nie* oddają dobrze *uniwersalności jej
zastosowań* i sposobu, w jaki jej *używamy*. Wiedząc już o mylącym charakterze tych słów, pod
rysunkiem napisz *komentarz*: W teorii kategorii każdy obiekt jest wyposażony w morfizm
identycznościowy. Każdy taki morfizm jest endomorfizmem.

Skoro już to zapisałaś i już wiesz, że używam słowa *punkt* w sposób niestandardowy, będę tak nadal
mówił, bo mam wrażenie, że tak Ci będzie łatwiej o tym konsekwentnie *myśleć*; sam zresztą całkiem
niedawno odkryłem, że mi to pomaga.

Morfizmy w teorii kategorii (czyli strzałki w tej teorii) nazywamy *endomorfizmami* (od
starogreckiego [ἔνδον](https://en.wiktionary.org/wiki/%E1%BC%94%CE%BD%CE%B4%CE%BF%CE%BD)
oznaczającego *w* albo *wewnątrz* \{i wtedy raczej nie nazywamy ich "endostrzałkami", bo to nie
brzmi dobrze\}) *wtedy i tylko wtedy*, gdy są właśnie takimi "zawijasami" jak identyczności (ale
istnieją też inne endomorfizmy, które nie są identycznościami), to znaczy, gdy mają *to samo źródło
i cel*.

Żeby coś, co nie jest opisane czy scharakteryzowane jawnie jako kategoria zasługiwało (z pewnego
punktu widzenia!) na nazwę kategoria, musi istnieć sposób opisu części struktury tego czegoś w
języku punktów i strzałek, spełniający następujące wymagania (nie trzeba panikować, znowu będę się
powtarzał i omówię też dość szczegółowo kilka prostych przykładów):

1. Wszystkie części określonego rodzaju postrzegamy jako punkty.

2. Wszystkie części określonego rodzaju postrzegamy jako strzałki.

W ten sposób, że:

3. Każdy punkt `X` ma swoją (endo)strzałkę identycznościową `Idₓ`.

4. Istnieje operacja na obiektach źrodłowych (to jest będących częściami struktury tego czegoś, co
   opisujemy jako kategorię), która odpowiada *składaniu strzałek* i którą oznaczamy czasem *w
   języku kategorii* za pomocą symbolu `∘`, taka, że dla dowolnych (a więc też potencjalnie równych,
   to jest zastępowalnych parami) strzałek `f`, `g` i `h` (uwaga, będą "skróty myślowe"):

    4-1. `Id ∘ f = f = f ∘ Id`
    
    4-2. `h ∘ (g ∘ f) = (h ∘ g) ∘ f`

Zacząłem tutaj stosować "skróty myślowe" polegające na tym, że nie zaznaczyłem, że strzałki, o
złożeniach któryś coś mówimy, muszą być składalne. Dlatego pominąłem tutaj *konieczny* warunek
*Jeżeli `f`, `g` i `h` to takie strzałki, że* `Skladalne h g` *i* `Skladalne g f` *to ...*. Nie
oznaczyłem też nazw punktów, do których są "przymocowane" strzałki identycznościowe, a więc `Id`
oznacza tu dwa potencjalnie różne obiekty źródłowe. A zastosowałem te skróty myślowe, bo już wiesz,
że w teorii kategorii operacja składania jest wybredna i często będzie nam obojgu wygodniej tylko o
tym *pamiętać*.

Ponieważ składanie jest w teorii kategorii operacją podstawową, wygodnie jest jeszcze bardziej
skrócić zapis i zamiast na przykład `f ∘ g` pisać po prostu `f g` albo nawet `fg`.

Jeżeli teraz ...

1. Każdy zbiór oznaczymy jako kategoryjny punkt.

2. Każdą funkcję oznaczymy jako kategoryjną strzałkę, w taki sposób, że źródło tej strzałki to
dziedzina tej funkcji, a cel tej strzałki to przeciwdzidzina tej funkcji.

3. Różne zbiory odpowiadają różnym punktom.

4. Różne funkcje odpowiadają różnym strzałkom.

5. *Funkcje* identycznościowe, czyli funkcje $i$ takie, że $i$ jest funkcją z pewnego zbioru $X$ do
tego samego zbioru i $i(x) = x$, odpowiadają strzałkom identycznościowym.

6. Składanie *funkcji* odpowiada składaniu *strzałek*

... to uzyskamy w ten sposób kategorię, a dokładnie *kategorię zbiorów skończonych*.


Zwróć uwagę, że to jest *izomorfizm*, ponieważ każdemu zbiorowi odpowiada pewien punkt, różnym
zbiorom odpowiadają różne punkty, każdej funkcji odpowiada pewna strzałka, różnym funkcjom
odpowiadają różne strzałki, i te nasze punkty i strzałki to *tylko* takie punkty i strzałki, których
używamy do mówienia w pewien sposób o zbiorach i funkcjach. Ponieważ to jest (patrz punkt 6)
izomorfizm *respektujący strukturę*, a dokładniej respektujący własności operacji składania (zarówno
funkcji jak i strzałek, bo izomorfizm *działa w obie strony*, pamiętasz?), to *może się wydawać*, że
poza terminologią nic się nie zmieniło.

To jest, nawiasem mówiąc, cecha wszystkich izomorfizmów, tylko nie zawsze tak bardzo rzuca się w
oczy. Można powiedzieć, że zmieniając opis na opis izomorficzny (czyli "równokształtny", pamiętasz?)
mówimy ("strukturalnie") dokładnie to samo, tylko w inny sposób. Coś się jednak zmieniło, ale trochę
mi zajmie, zanim będę Ci mógł pokazać co.

Patrząc w ten sposób na przestrzeń zbiorów skończonych i funkcji jako na kategorię *ignorujemy
strukturę zbiorów i funkcji* i *skupiamy się* na samej *operacji składania*, a dzięki temu skupiamy
się na tym, jaką *rolę* odgrywają zbiory w przestrzeni zbiorów skończonych. Zgaduję, że nie możesz
się doczekać przykładów. Będę teraz pisał używając dwóch różnych czcionek. Gdy będę pisał w języku
teorii mnogości, będzie to wyglądało na przykład tak: $X, f(x)$. Gdy będę pisał w języku teorii
kategorii będzie to wyglądało na przykład tak: `X, f`.

Dla każdego zbioru jednoelementowego $T$ i każdego zbioru $S$ (łącznie z $T$!), istnieje dokładnie
jedna funkcja $f : S → T$, bo każda taka funkcja "*nie ma żadnego wyboru*", musi przecież gdzieś
posłać każdy element swojej dziedziny (bo jest funkcją), a przeciwdziedzina ma tylko jeden
element. I odwrotnie, jeżeli zbiór $T$ ma taką własność, że dla każdego zbioru $S$ istnieje
dokładnie jedna funkcja $f : S → T$, to zbiór $T$ musi być zbiorem jednoelementowym, bo gdyby $T$
był zbiorem pustym, to na przykład $f : \set{1, 2, 3} → T$ nie mogłoby istnieć, a gdyby $T$ miało
więcej niż jeden element, to dla każdego niepustego zbioru $S$ istniałyby różne funkcje posyłające
$S$ w $T$.

A to oznacza, że zbiory jednoelementowe to *dokładnie* takie *punkty*, do których wchodzi dokładnie
jedna strzałka od każdego punktu.

Teraz $f$ i $g$ oznaczają (niekoniecznie różne) *funkcje* (a więc posługujemy się językiem zbiorów i
funkcji, dlatego zmieniłem czcionkę): *Teoriomnogościowym* złożeniem $f$ i $g$ nazywamy funkcję,
którą oznaczamy jako $g ∘ f$ (a oznaczamy ją tak, bo jest *wynikiem teoriomnogościowego składania*
tych dwóch funkcji), taką, że że $(g ∘ f)(x) := g(f(x))$.  
(Zwracam uwagę, że znowu zastosowałem skrót myślowy, polegający na tym, że nie wspomniałem o
wymaganiu składalności, a to wymaganie obowiązuje również w teorii mnogości).

Teraz `f`, `g` i `h` oznaczają strzałki w *kategorii zbiorów skończonych* (czyli są kategoryjnymi
strzałkami, ale jednocześnie mają już dla nas objaśnioną wcześniej interpretację teoriomnogościową):

Kategoryjne złożenie `h (g f)` oznacza teraz teoriomnogościowe złożenie $h ∘ (g ∘ f)$, a to z
(teoriomnogościowej) definicji oznacza taką funkcję (powiedzmy) $i$, że (rozwijamy definicję
złożenia po raz pierwszy) $i(x) = h ∘ g(f(x)))$, a to oznacza (rozwijamy definicję złożenia po raz
drugi) $h(g(f(x))). 

Kategoryjne złożenie `(h g) f` oznacza teoriomnogościowe złożenie $(h ∘ g) ∘ f$, a to z kolei
oznacza funkcję (powiedzmy) $j$, taką, że (rozwijamy definicję złożenia po raz pierwszy) $j(x) = (h
∘ g)(f(x))$, a to oznacza (rozwijamy definicję złożenia po raz drugi) $h(g(f(x)))$.

Widzimy, że $i$ i $j$ są tą samą funkcją, bo każdemu elementowi swojej (w tym wypadku z konieczności
tej samej) dziedziny (którą możemy oznaczyć dla wygody jako $X$) przyporządkowują ten sam element
(również z konieczności tej samej) przeciwdziedziny, to jest $∀ x ∈ X, i(x) = h(g(f(x))) = j(x)$. A
więc dla wszystkich (składalnych w ten sposób) strzałek `f`, `g` i `h`, ponieważ nasz opis
przestrzeni zbiorów skończonych jest *izomorfizmem*, a więc nasze strzałki są tylko *innym sposobem
oznaczania* zbiorów skończonych, widzimy, że `h (g f) = (h g) f`.

### Przypisy

[^1]: Tak wiem, że [niby powinno *się* pisać iniekcja i
    suriekcja](https://sjp.pwn.pl/poradnia/haslo/;8643.html), a nie injekcja i surjekcja, ale
    pisownia przez *j* przeważa i według mnie jest bliżej sposobu, w jaki te słowa wymawiamy, a poza
    tym nie lubię, gdy ktoś mi próbuje *narzucać* jakiekolwiek reguły *bez uzasadnenia* innego niż
    "bo tak *się* robi".
