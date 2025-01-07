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
można na Twoim rysunku dojść, idąc po (dwóch) strzałkach, do tych `y`-ów, "idąc" w ten sposób
"funkcjami" `f` i `g`. Czy widzisz, że niezależnie od tego, jakimi funkcjami są takie składalne
funkcje `f` i `g`, gdy zaczniesz od dowolnego `x`-a i będziesz podążać za `f` i za `g`, to nie
będziesz mieć nigdy żadnego wyboru i jednocześnie zawsze dojdziesz do jakiegoś `y`-a? 

Oznacz tą funkcję literą `h` i podpisz proszę ten rysunek komentarzem: `h(x) = (g ∘ f)(x)`. Czy
widzisz, że ponieważ z każdego `x`-a można w ten sposób dojść do jednego i tylko jednego `y`-a, to w
ten sposób *zawsze* z dwóch składalnych funkcji uzyskamy dokładnie jedną funkcję?  Teoriomnogościowe
składanie jest więc *szczególnym przypadkiem "działania wybrednego"*, które *zachowuje się tak samo
jak kategoryjne składanie strzałek*. O tym, w jakim znaczeniu tak samo, powiem trochę więcej
później.

Czy rozumiesz, dlaczego jeżeli `f : X → Y`, to `Id_Y ∘ f = f = f ∘ Id_X`? Musiałem tutaj znowu
inaczej oznaczyć identyczności, bo Unikod nie pozwala na zapisanie na przykład litery `Y` jako
indeksu dolnego. Spróbuję Ci teraz pomóc w ręcznym skontruowaniu dowodu tych *dwóch* albo nawet
*trzech zdań* (mamy tu dwie równości i jedną konsekwencję przechodniości relacji równości) i
jednocześnie sprawdzeniu go w podobny sposób do tego, w jaki mógłby to zrobić Lean.

O tożsamości funkcji teoriomnogościowych decyduje to, jaką mają dziedzinę i przeciwdziedzinę i to,
co zwracają dla każdego elementu dziedziny. Wystarczy rzut oka na podany wyżej skrótowy opis trzech
funkcji, żeby upewnić się, że `Id_Y ∘ f` oznacza funkcję, która ma taką samą dziedzinę i
przeciwdziedzinę jak funkcja `f` i jak funkcja `f ∘ Id_X`, a więc te trzy funkcje w ogóle *mogą* być
tą samą funkcją (gdyby miały różne dziedziny lub przeciwdziedziny to byłyby automatycznie różnymi
funkcjami). Ale czy są? Niech `x` będzie dowolnym elementem zbioru `X`. Wtedy (rozwijamy definicję
składania teoriomnogościowego) `(Id_Y ∘ f)(x) = Id_Y(f(x))`, a ponieważ (stosujemy definicję funkcji
identycznościowej) `Id_Y(f(x)) = f(x)`, to (stosujemy przechodniość relacji równości) `(Id_Y ∘ f)(x)
= f(x)`. Czyli dla każdego `x ∈ X` jest prawdą, że `(Id_Y ∘ f)(x) = f(x)`, a więc (bo to oznacza, że
kryterium równości funkcji jest dla tych dwóch funkcji spełnione) `Id_Y ∘ f` to ta sama funkcja,
co `f`, czyli `Id_Y ∘ f = f`.

**Sugestia**: Dokończ ten dowód w tym stylu dla drugiej równości, to jest dla `f = f ∘ Id_y`, tylko
może nie pisz aż tyle co ja. Przeprowadzając taki dowód warto jednak chociaż raz powstrzymać się
przed robieniem daleko idących skrótów myślowych.

## Iloczyn kartezjański zbiorów

Pamiętasz, że dowód koniunkcji można zaimplementować jako uporządkowaną parę dowodów? A pamiętasz,
jak pisałem, że typy co prawda nie są zbiorami, ale że mają coś ze zbiorów? Zresztą funkcje
teoriotypowe też nie są "zwykłymi" funkcjami matematycznymi, ale coś z tych funkcji mają, właściwie
nawet mają z nimi bardzo wiele wspólnego, bo pobierają tak naprawdę tylko jeden argument
(określonego *typu* odpowiadającego teoriomnogościowej *dziedzinie*) i dla każdego argumentu
zwracają dokładnie jeden argument (określonego *typu* odpowiadającego teoriomnogościowej
*przeciwdziedzinie*). Pisałem zresztą, że funkcje teoriotypowe to takie funkcje matematyczne, tylko
że obliczalne, to znaczy dające się "zrealizować" za pomocą algorytmu (i zarazem w ten sposób
*zrealizowane*). No więc typ par uporządkowanych to taki teoriotypowy odpowiednik, albo "cień",
[*iloczynu kartezjańskiego zbiorów*](https://pl.wikipedia.org/wiki/Iloczyn_kartezja%C5%84ski).

Iloczyn kartezjański pojawił się również w rozdziale 7-01, ponieważ mówiłem tam o *uporządkowanych
parach liczb rzeczywistych*. Zbiór wszystkich takich par to dokładnie zbiór wszystkich punktów na
płaszczyźnie, o ile z tą płaszczyzną jest związany układ współrzędnych kartezjańskich. Jeżeli na
przykład ...

`X = {1, 2, 3}` i `Y = {a, b}`

... to ...

`X × Y = {(1, a), (1, b), (2, a), (2, b), (3, a), (3, b)}`

Zapisywanie uporządkowanych par za pomocą zwyczajnych nawiasów to oczywiście tylko konwencja i
równie dobrze moglibyśmy posługiwać się w tym celu notacją Leana, zamiast na przykład `(1, a)`
pisząc `⟨1, a⟩`. Nie muszę już chyba wyjaśniać, czemu to (akurat niewybredne, bo "radzi sobie" z
każdą uporządkowaną parą zbiorów) *działanie na zbiorach* (zauważyłaś, że to działanie na zbiorach?)
jest w matematyce bardzo ważne, ale powiem Ci o pewnym przydatnym czasem sposobie myślenia o
iloczynach kartezjańskich, jak również o dwóch nietypowych i ważnych przykładach.

Dla dowolnych zbiorów `X` i `Y`, iloczyn kartezjański tych zbiorów, czyli `X × Y`, możemy rozumieć
jako przestrzeń wszystkich *niezależnych wyborów* elementów należących do zbioru `X` i do zbioru
`Y`, w tej kolejności. A niezależne wybory elementów należących do pewnych zbiorów, typów, albo
kategorii (w potocznym znaczeniu tego słowa) pojawiają się niezwykle często. Na przykład, typowy
obiad zamówiony w restauracji to czasem *logicznie* (ale nie *przyczynowo* albo *statystycznie*)
niezależny *potrójny* wybór zupy, tak zwanego dania głównego i deseru, gdzie każda z tych kategorii
dopuszcza dodatkowo wybór "pusty" (a więc zgodnie z tym punktem widzenia albo definicją można
zamówić obiad składający się z *niczego*)[^2].

**Rysunek 8**: Żeby utrwalić sobie to pojęcie i zacząć się przyzwyczajać do bardziej elastycznego
myślenia o *wymiarach*, `Narysuj` proszę dwie prostopadłe osie, poziomą oznacz literą `X` a pionową
literą `Y`, i nanieś na nie elementy tych zbiorów jakby były podziałkami, to jest, zaczynając od
punktu przecięcia się osi, zaznacz "wysokości" za pomocą, w tym przypadku elementów, `1`, `2` i `3`
i "szerokości" za pomocą elementów `a` i `b`. Następnie w odpowiednich miejscach uzyskanego w ten
sposób wykresu nanieś wszystkie uporządkowane pary. Gdy już to zrobisz, podpisz ten rysunek
komentarzem: *Przykład iloczynu kartezjańskiego zbiorów* `X = {1, 2, 3}` *i* `Y = {a, b}`. *Wartości
oznaczone na osiach to tak zwane projekcje par uporządkowanych.*

A teraz będą dwa zapowiedziane przykłady. Zastanów się proszę przez chwilę, jak zgodnie z definicją
(która mówi, że iloczyn kartezjański dwóch zbiorów to taki zbiór, którego elementami są dokładnie
wszystkie uporządkowane pary elementów należących do pierwszego i drugiego zbioru) powinien wyglądać
zbiór `∅ × X`, gdzie `∅` to zbiór pusty, czyli zbiór `{}` (oznaczamy go tak i tak, zależnie od tego,
jak jest nam w danej sytuacji wygodniej). Jak postanowisz, że już czas, kliknij w
[ten](Iloczyn_zbioru_pustego_i_X.md) link żeby przeczytać moje wyjaśnienia.

Drugim ważnym dla nas przykładem jest `{1} × Y`, czyli iloczyn kartezjański pewnego singletona i
scharakteryzowanego wcześniej zbioru `Y`. Wykombinowanie, jak powinien wyglądać ten konkretny zbiór,
nie powinno Ci moim zdaniem sprawić szczególnych trudności.

Po wykonaniu bądź podjęciu prób wykonania tych zadań-sugestii, gdy już uznasz, że jesteś na to
gotowa, zapoznaj się jeszcze proszę z [tym](Iloczyn_kartezjanski_jako_mnozenie.md) "obowiązkowym"
fragmentem.

## Suma rozłączna zbiorów

Dla dowolnych zbiorów `X` i `Y`, [suma
rozłączna](https://pl.wikipedia.org/wiki/Suma_roz%C5%82%C4%85czna) tych zbiorów to taki zbiór, który
zawiera dokładnie wszystkie kopie, zapisane w jakikolwiek sposób jako *różne* elementy, elementów
tych zbiorów. To znaczy, że niejako wewnątrz sumy rozłącznej *zachowujemy informację* o tym, z
którego z dwóch zbiorów pochodzi każdy element.

Na przykład, jeżeli tak jak wcześniej `X = {1, 2, 3}` i `Y = {a, b}`, to nie musimy w żaden sposób
*oznaczać* elementów, bo żaden element nie należy jednocześnie do zbiorów `X` i `Y` i możemy po
prostu stwierdzić, że `X ⨿ Y = {1, 2, 3, a, b}`. Suma rozłączna to również pewne (niewybredne)
działanie na zbiorach, które akurat zapisujemy między innymi za pomocą symbolu `⨿`.

**Rysunek 8**: Narysuj proszę te dwa zbiory a między nimi ich sumę rozłączną w taki sposób, żeby
zarówno z każdego elementu zbioru `X` jak i z każdego elementu zbioru `Y` wychodziły strzałki do ich
kopii w sumie rozłącznej. Otocz te dwie *części* zbioru `X ⨿ Y` liniami przerywanymi. Czy widzisz,
że to zawsze (bo tego wymaga definicja) muszą być rozłączne części i że zawsze w takiej sytuacji
istnieją dwie funkcje *injektywne* (bo to są dwie *wierne kopie*), w tym wypadku `i_X : X → X ⨿ Y` i
`i_Y : Y → X ⨿ Y`, które jakby *wyrażają* te *inkluzje* (bo tak między innymi nazywamy te funkcje)?
Podpisz proszę ten rysunek komentarzem, który Twoim zdaniem tu pasuje i który pozwoli Ci upewnić
się, że przynajmniej w tym momencie pamiętasz lub potrafisz odnaleźć i zapisać po swojemu
objaśnienia na temat wszystkich wymienionych właśnie właściwości tej konstrukcji.

**Rysunek 9**: Gdy dwa zbiory zawierają choćby tylko jeden wspólny element, nie możemy ich po prostu
"włożyć" do sumy rozłącznej bez żadnej modyfikacji, bo tak nie uzyskamy dwóch rozłącznych kopii. W
takich sytuacjach musimy jakoś *oznaczyć* wszystkie kopie tak, żeby *elementy wspólne dla obydwu
zbiorów* były reprezentowane przez *różne* kopie. Ponieważ suma rozłączna zbiorów jest działaniem
binarnym w zasadzie jak każde inne, a dla takich działań ważna jest kolejność obiektów czy
argumentów, na których wykonujemy działanie, to można przyjąć, że pisząc `X ⨿ Y` zdecydowaliśmy
automatycznie, że `X` jest tutaj *pierwszym*, a `X` *drugim* członem tej sumy
rozłącznej. *Spełniającą dokładnie tą samą rolę* sumę rozłączną `X ⨿ Y` możemy zatem skonstruować
tak: `X ⨿ Y := {(1, 1), (2, 1), (3, 1), (a, 2), (b, 2)}`. Możemy więc w ten sposób *skorzystać z par
uporządkowanych* i liczb naturalnych `1` i `1`, żeby *zaimplemntować* w ten sposób operację
tworzenia sum rozłącznych z *dowolnych* par zbiorów. Ponieważ ten sposób jest *uniwersalny*, można
zapomnieć o poprzednim i stosować tylko ten. Myślę, że wiesz, jak należy przedstawić tą konstrukcję
za pomocą rysunku i jak, za pomocą strzałek od elementów zbioru `X` i od elementów zbioru `Y` do
odpowiednich kopii w zbiorze `X ⨿ Y`, należy oznaczyć obydwie funkcje-inkluzje (albo
injekcje-inkluzje), czyli po prostu obydwie inkluzje. Na koniec oznacz proszę te inkluzje jako `i_X`
i `i_Y`, tylko może zamiast symbolu `_` zapisz wtedy litery `X` i `Y` jako indeksy dolne. Otocz
kopie przerywanymi liniami i podpisz ten rysunek (ewentualnie wspomagając się tym tekstem)
komentarzem sprawdzającym Twoją wiedzę na temat tej konstrukcji.

Jeżeli masz już za sobą poprzedni dostępny poprzez link fragment "obowiązkowy", to zastanów się
proszę, jak ta operacja na zbiorach, zakładając, że wszystkie zbiory są *skończone*, musi "działać"
na parach zbiorów takich, że co najmniej jeden z nich jest zbiorem pustym, a jak na parach takich,
że co najmniej jeden zbiór jest singletonem. Następnie zastanów się proszę, jak ta operacja na
zbiorach skończonych ma się do (funkcji) mocy zbiorów i operacji dodawania liczb naturalnych. Gdy
już uznasz, że wystarczy tych samodzielnych rozmyślań (i może też rysunków i notatek), zapoznaj się
proszę z [drugim]() i ostatnim w tym rozdziale fragmentem "obowiązkowym".

Na koniec poznasz jeszcze dwie operacje na zbiorach, które są bardzo blisko związane z *koniunkcją*
i *alternatywą zdań*.

## Część wspólna zbiorów

Jeżeli `X` i `Y` to zbiory, to *częścią wspólną*, albo *przekrojem*, albo *przecięciem*, albo
*iloczynem mnogościowym* zbiorów `X` i `Y` nazywamy zbiór złożony dokładnie z takich elementów,
które należą *zarówno do* `X` *jak i do* `Y`. Tą operację zapisujemy za pomocą symbolu `∩`. Możemy
to zapisać półformalnie tak: Jeżeli `X` i `Y` to zbiory, to ...

`X ∩ Y := {z | z ∈ X ∧ z ∈ Y}`.

**Czytamy to**: Jeżeli `X` i `Y` to zbiory, to zbiór, który oznaczamy jako `X ∩ Y` jest z definicji
takim zbiorem, który zawiera dokładnie te elementy, które należą do `X` i do `Y`.

Czy widzisz podobieństwo między symbolami `∩` i `∧` i czy widzisz, że jest nieprzypadkowe?

## Suma zbiorów

Jeżeli `X` i `Y` to zbiory, to sumą, albo *unią* zbiorów `X` i `Y` nazywamy zbiór złożony dokładnie
z takich elementów, które należą do `X` *lub* do `Y`. Tą operację zapisujemy za pomocą symbolu
`∩`. Możemy to zapisać półformalnie tak: Jeżeli `X` i `Y` to zbiory, to ...

`X ∪ Y := {z | z ∈ X ∨ z ∈ Y}`.

**Czytamy to**: Jeżeli `X` i `Y` to zbiory, to zbiór, który oznaczamy jako `X ∪ Y` jest z definicji
takim zbiorem, który zawiera dokładnie te elementy, które należą do `X` *lub* do `Y`. Spójnik
logiczny `∨`, którego jeszcze nie omawiałem, nazywamy między innymi *alternatywą* i czytamy właśnie
jako *lub*.

Czy widzisz podobieństwo między symbolami `∪` i `∨` i czy widzisz, że jest nieprzypadkowe?

**Rysunek 10**: Zrób proszę notatkę z odpowiednimi rysunkami, wzorując się na poprzednich rysunkach,
która byłaby dla Ciebie ilustracją pojęć iloczynu i sumy zbiorów. Być może będzie Ci łatwiej, jeżeli
wcześniej zapoznasz się ze stronami Wikipedii dotyczącymi
[jednego](https://pl.wikipedia.org/wiki/Cz%C4%99%C5%9B%C4%87_wsp%C3%B3lna) i
[drugiego](https://pl.wikipedia.org/wiki/Suma_zbior%C3%B3w) pojęcia.
