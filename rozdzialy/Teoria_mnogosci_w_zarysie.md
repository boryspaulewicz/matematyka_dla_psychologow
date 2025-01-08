## Teoria mnogości w za[rysie](https://pl.wikipedia.org/wiki/Ry%C5%9B)

Jak być może wiesz, do niedawna w pewnym sensie najważniejszym podstawowym językiem matematyki był
język teorii mnogości, a konkretnie język teorii
[Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla). Nawet, jeżeli to wiesz,
to i tak na wszelki wypadek przytoczę tutaj odpowiedni
[cytat]((https://pl.wikipedia.org/wiki/Teoria_mnogo%C5%9Bci)) z Wikipedii (2024-12-29):

> Po odkryciu paradoksów tzw. naiwnej teorii mnogości udało się sformułować teorię zbiorów jako
> teorię aksjomatyczną; jej standardową wersją jest aksjomatyka ZF uwieńczona w latach 30. XX
> wieku. Stała się ona podstawą innych działów matematyki, ponieważ do pojęcia zbioru zredukowano
> inne szeroko używane obiekty jak liczby, funkcje oraz inne relacje; teoria mnogości stała się tak
> źródłem modeli różnych teorii formalnych.

Wolałbym chyba "w ten sposób" zamiast "tak" w tym ostatnim zdaniu, ale trudno, jest jak jest. Nie
będziemy się teraz przyglądać aksjomatom tej teorii, ponieważ my sobie sami *zrobimy* - ze strzałek
i funkcji - pewną wersję teorii mnogości w jednym z późniejszych rozdziałów, ale zanim to nastąpi,
zacznę odtąd intensywnie *korzystać* z półformalnej wersji teorii mnogości jako ze źródła ważnych
przykładów.

Pojęcie zbioru jako takiego jest interesujące przede wszystkim dla specjalistów zajmujących się
zbiorami, natomiast dla reszty świata, poza kilkoma powszechnie używanymi rodzajami konstrukcji
opartych na zbiorach, to raczej nie jest nic szczególnie ciekawego, bo zbiór to nic innego jak pewna
*kolekcja* (jakiś) elementów czy obiektów. 

Zbiory *skończone* możemy zapisać *dosłownie*, na przykład tak:

`{1, 20, *, X, -3.4}`

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, na przykład tak ...

`{0, 1, 2, 3, 4, ...}`

lub tak ...

`{n ∈ ℕ | Dodatnie n}`

... bo zapisane dosłownie nie zmieściłyby się na żadnej stronie. *Ostatni* przykład możemy odczytać
w ten sposób: Zbiór (`{`) złożony z takich liczb naturalnych `n` (`n ∈ ℕ`), że `Dodatnie n` (`|
Dodatnie n}`). Wymyślając *pierwszy* przykład chciałem od razu zasugerować, że - zgodnie z
dominującym w matematyce zwyczajem - zbiory mogą zawierać dowolne elementy, na przykład takie, które
nie należą do żadnego dającego się łatwo (albo nawet w ogóle) zidentyfikować rodzaju albo typu. A
więc zbiory to takie (niemal[^4]) *dowolne kolekcje potencjalnie różnorodnych elementów*.

**Rysunek 1. Prototypowy przykład funkcji**: Jak już wiesz, można powiedzieć, że funkcja to pewien
"obiekt", który przyporządkowuje każdemu elementowi swojej dziedziny dokładnie jeden element swojej
przeciwdziedziny. Żeby mieć jasny obraz sytuacji, upewnij się, że masz nad sobą jakieś źródło
światłą, przygotuj proszę czystą kartkę i z lewej strony `Narysus okrag` o średnicy kroku. O krok w
prawo od prawego brzegu tego okręgu również `Narysuj okrag`. W lewym okręgu `Narysuj Punkt x₁`,
`Narysuj Punkt x₂` i `Narysuj Punkt x₃`, jeden nad drugim, oznaczając je z *lewej* strony
indeksowanymi literami `x`, czyli oznaczając je jako `x₁`, `x₂` i `x₃`, tak, żeby indeksy rosły w
dół (jak [korzenie](https://pl.wikipedia.org/wiki/Korze%C5%84)). W prawym okręgu tak samo `Narysuj`
punkty `y₁`, `y₂` i `y₃`, ale te oznacz z *prawej*.

Mamy już kandydata na dziedzinę `X` i kandydata na przeciwdziedzinę `Y`. Teraz możemy *rysując coś
zdefiniować funkcję*. Stosujemy tutaj dosyć powszechną konwencję, zgodnie z którą duże litery
oznaczają zbiory, a małe litery oznaczają elementy. Czasami nie sposób trzymać się tej konwencji
konsekwentnie, ponieważ elementami zbiorów mogą być również zbiory, ale tym razem takie komplikacje
nie wystąpią.

**Tożsamość zbiorów**: Te liczbowe indeksy dolne są trochę mylące, ponieważ sugerują, że kolejność
elementów może mieć znaczenie. Trzeba wiedzieć, że to, w jakiej *kolejności* zapisane są elementy
zbioru *nie ma znaczenia*, tak samo jak nie ma znaczenia, czy ten sam element zapiszemy *więcej niż
raz*. Na przykład, `{1, 2}` to *ten sam zbiór* co `{2, 1}` i *ten sam zbiór* co `{1, 1, 2}`, bo do
wszystkich tych zbiorów *należą dokładnie te same elementy*, to jest `1` i `2`, a to, które elementy
do danego zbioru należą, a które nie, *decyduje o tożsamości zbioru*.

Celowo napisałem *ten sam zbiór*, a nie na przykład *ten sam obiekt*, bo takie *zapisy* jak `{1, 1,
2}` można przecież *interpretować dowolnie* (interpretacja jest zawsze pewnym *wyborem*,
pamiętasz?), a z pewnych punktów widzenia te trzy wyrażenia na pewno mogłyby oznaczać różne
"rzeczy". Gdy mówimy o czymś, że to jakiś "obiekt", nie wiadomo przecież co mamy na myśli, to znaczy
nie wiadomo, jakiego rodzaju obiekt dane coś ma reprezentować. 

A mówiąc to samo, ale inaczej: To, które elementy należą, a które nie należą do danego zbioru
decyduje o tym, które zbiory są *równe*, czyli *nierozróżnialne jako zbiory* (relacja równości jest
zawsze typowana, dlatego dodałem *jako zbiory*), czyli *wzajemnie zastępowalne jako
zbiory*. Zastąpienie w dowolnym miejsu, *w którym ma być jakiś zbiór* (znowu podkreślam typowanie),
na przykład zbioru `{1, 2}` przez zbiór `{2, 1, 1}`, *nic nie zmieni*, to jest zdanie pozostanie
prawdziwe albo fałszywe, jeżeli to jest miejsce w jakimś zdaniu, i dany obiekt pozostanie tym samym
obiektem, jeżeli to jest część wyrażenia charakteryzującego za pomocą zbiorów jakiś obiekt.

Można więc powiedzieć, że *każdy* zbiór jest *tym samym*, co pewna *kolekcja zdań* mówiących o tym,
że *taki a taki element należy do danego zbioru*. Być może wyjaśnienie tego w ten właśnie sposób
pozwoli Ci łatwiej zrozumieć, że powtórzenie i kolejność zapisanych elementów zbioru nie ma
znaczenia, bo przecież *treść* zawarta w kolekcji zdań mówiących o relacji należenia elementów do
zbioru *nie ulegnie zmianie*, gdy te zdania zapiszemy w innej kolejności, albo gdy niektóre zdania
zapiszemy więcej niż raz.

`Narysuj Strzalka x₁ y₁`, i tak samo dla par `⟨x₂, y₁⟩` (czyli `Narysuj Strzalka x₂ y₁`) i `⟨x₃,
y₃⟩`. W tym przykładzie chodzi między innymi o to, żeby element `y₂` "został na
[lodzie](https://www.youtube.com/watch?v=rog8ou-ZepE)". Oznacz ten rysunek od góry literą `f`, jak
*funkcja*, bo to jest pewna funkcja: *Każdemu* elementowi zbioru `X` przyporządkowałaś właśnie
*dokładnie jeden* element zbioru `Y`. To jest też użyteczny *przykład reprezentatywny* funkcji, bo
prawie wszystkie zbiory są niepuste, wiele funkcji nie "trafia" w każdy element przeciwdziedziny i
często zdarza się, że niektóre elementy "trafiają" w ten sam element. Zwróć też uwagę, że chociaż to
"tylko" rysunek, to jest to również *pełnoprawna matematyczna definicja*, ponieważ nie ma tu żadnych
wątpliwości ani na temat dziedziny, ani przeciwdziedziny, ani na temat struktury tej funkcji.

**Przykłady negatywne**: Byłoby dobrze, gdybyś jeszcze narysowała poniżej bardziej samodzielnie dwa
przykłady sposobów przyporządkowania elementom (czyli to będą *źródła* strzałek) jakiegoś zbioru `X`
(bo po co wymyślać dla kolejnych przykładów ciągle nowe nazwy) elementy (czyli to będą *cele*)
jakiegoś zbioru `Y`, tak, żeby to *nie* były funkcje. A "zepsuć funkcyjność" można na dokładnie
*dwa* sposoby - albo jakiś element z lewej będzie *wysyłał więcej niż jedną strzałkę*, albo jakiś
element z lewej *nie będzie wysyłał żadnej strzałki*. Takie rysunki będą poprawnymi definicjami
*relacji*, ale nie funkcji, bo funkcje to *relacje specjalne*, to jest takie, jak już
wyjaśniłem. Jeszcze raz? 

Funkcja każdemu elementowi swojej dziedziny przyporządkowuje dokładnie jeden element swojej
przeciwdziedziny. Jakim "obiektem" jest więc każda funkcja? *Tego rodzaju przyporządkowaniem*.

**Kilka sposobów myślenia o funkcjach teoriomnogościowych**: Jak zawsze, warto czasami pomyśleć o
tym samym na kilka różnych sposobów. O tak rozumianych funkcjach można myśleć jako o abstrakcyjnych
własnościach pewnego rodzaju. Na przykład, można powiedzieć, że na Twoim pierwszym rysunku każdy
element zbioru `X` ma określoną `f`-własność `Y`. Podobnie, każdy ma dokładnie jedno pierwsze imię i
dokładnie jedną datę urodzenia, a więc te własności to *funkcje osób*. Albo można o funkcjach myśleć
jako o *doskonałych pomiarach* czy może raczej *wartościach obserwowanych* pewnych właściwości albo
wymiarów. I jakby odwrotnie, można o funkcjach myśleć jako o pewnego rodzaju *kompletnych
oznaczeniach* albo *rozdaniach kart* w tym sensie, że każdy element dziedziny jest wykorzystany do
oznaczenia, albo że jest przydzielony do jakiegoś elementu należącego do przeciwdziedziny. Z tego
punktu widzenia każdy `x` `f`-oznacza jakiś `y`. Dobrze jest spróbować pomyśleć o takiej funkcji
choć raz na każdy z tych sposobów, bo czasem trudno przewidzieć, który z tych punktów widzenia
pozwoli zrozumieć jakiś problem lepiej.

Odtąd ograniczymy nasze rozważania do dowolnych zbiorów *skończonych*, to jest takich, które mają
skończenie wiele elementów. Mówiąc dokładniej, będziemy teraz opisywać świat (a lepiej:
*przestrzeń*) w którym istnieją tylko zbiory skończone i w którym występują wszystkie możliwe
funkcje między takimi zbiorami. Na początek omówimy kilka ważnych przykładów.

**Rysunek 2. Funkcje do zbioru jednoelementowego**: `Narysuj` proszę dwa zbiory jako okręgi, obok
siebie, i w lewym narysuj kilka kropek, które będą oznaczały (jakieś) elementy, a w prawym tylko
jedną kropkę. Zbiory jednoelementowe nazywamy również *zbiorami jednostkowymi* albo
*singletonami*. Czy widzisz, że istnieje tylko jedna funkcja ze zbioru lewego do prawego? Narysuj
proszę tą funkcję.

**Rysunek 3. Funkcje ze zbioru pustego**: A teraz `Narysuj` proszę obok siebie dwa zbiory, `X` i
`Y`, ale takie, że w lewym *nic* nie będzie, a w prawym będą na przykład dwa elementy. Jak już
wiesz, żeby "coś" było funkcją, musi przyporządkowywać każdemu elementowi dziedziny dokładnie jeden
element przeciwdziedziny. Jak myślisz, czy może istnieć funkcja z `X` do `Y`? Wydawałoby się, że
nie, prawda? A jednak istnieje! To jest taka funkcja, nazwijmy ją tym razem `p` (od pierwszej litery
w słowie [*pustka*](https://en.wikipedia.org/wiki/Nagarjuna)), że *gdybyś* wybrała dowolny element
zbioru `X`, to dostarczyła*by* dokładnie jeden element ze zbioru `Y`. Ponieważ jednak w zbiorze `X`
nie ma żadnych elementów, ta funkcja *nie może* nic zwrócić.

A zatem funkcja `p` "nic nie robi jeszcze bardziej" niż znana Ci już (teoriotypowa, nie
teoriomnogościowa, czyli *funkcja jako program*) funkcja `nic_nie_robie` i jest niemal tak
abstrakcyjna, bo w pewien sposób wirtualna, jak term typu `Absurd`. Tyle, że ta funkcja *istnieje*
na mocy konwencji. Co więcej, istnieje tylko jedna taka funkcja, bo wszystkie takie funkcje
*zwracają to samo dla każdego argumentu*, a właśnie ten warunek, razem z dziedziną i
przeciwdziedziną, decyduje o tożsamości funkcji. Tak samo istnieje dokładnie jedna, w pewnym sensie
"wirtualna" funkcja ze zbioru pustego do niego samego.

Zbiory puste zapisujemy albo jako `{}`, co wygląda trochę jak wywrócony na drugą stronę [*wazon
Rubina*](https://en.wikipedia.org/wiki/Rubin_vase), albo używając symbolu `∅`, który z kolei może
się kojarzyć (w każdym razie mi się kojarzy) z czymś, co można by nazwać "obszarem" (bo okrąg) "bez
zawartości" (bo przekreślony). Na cześć tej funkcji narysuj proszę `Strzalka X Y` i oznacz ją literą
`p`, a pod spodem zapisz komentarz: *Dla każdego zbioru* `Y`, *istnieje dokładnie jedna funkcja ze
zbioru pustego do* `Y`. *Może i trudno się z tym pogodzić, ale to tylko konwencja (dotycząca
funkcji), którą przyjmujemy po prostu dlatego, że sprawdza się w praktyce.*

**Rysunek 4. Funkcja identycznościowa na dwa sposoby**: `Narysuj` teraz proszę trójelementowy zbiór
`X`. Chciałbym, żebyś narysowała funkcję identycznościową o nazwie `Id` spełniającą warunek `Id(x) =
x`.  Użyłem tutaj symbolu równości zamiast symbolu definiowania, bo, jak powiedziałem, to jest
*warunek*, który ta funkcja ma spełniać, ale to *Ty* ją zdefiniujesz (rysując). Zastanów się proszę
przez chwilę, jak mogłabyś to zrobić, a gdy już wpadniesz na jakiś pomysł, albo gdy się poddasz,
przeczytaj moje objaśnienia [tutaj](Rysunek_identycznosc.md). Jeżeli przyszedł Ci do głowy tylko
jeden sposób, to również kliknij ten link. Jak już narysujesz definicję funkcji `Id`, podpisz ją
proszę komentarzem: *Przykład funkcji identycznościowej*.

**Rysunek 5. Przykład injekcji[^2]**: `Narysuj` proszę obok siebie dwuelementowy zbiór `X` i
czteroelementowy zbiór `Y` i narysuj funkcję, która nie "skleja" żadnej pary elementów `X`, to jest
nie posyła żadnych dwóch `x`-ów do tego samego `y`-a, i oznacz ją literą `i`. Takie funkcje nazywamy
*injekcjami* albo funkcjami *różnowartościowymi*. Czy widzisz, że aby istniała jakakolwiek injekcja,
dziedzina nie może mieć więcej elementów niż przeciwdziedzina? A czy widzisz, że *każda* injekcja to
*między innymi* pewien *wybór* albo *wskazanie podzbioru* przeciwdziedziny (i niejako przy okazji
jednokrotne oznaczenie elementów tego podzbioru wszystkimi `x`-ami)? Żeby to podkreślić, otocz
proszę ten podzbiór `Y` [linią](https://pl.wikipedia.org/wiki/Rysunek) przerywaną. `Napisz` pod
rysunkiem komentarz wyrażający krótko to, co w tym momencie rozumiesz na temat injekcji.

**Rysunek 6. Przykład surjekcji**: `Narysuj` proszę funkcję `s` z trójelementowego zbioru `X` do
dwuelementowego zbioru `Y`, tak, żeby każdy `y` "dostał strzałkę". Takie funkcje nazywamy
*surjekcjami* albo funkcjami [*na*](https://en.wiktionary.org/wiki/sur#French). Czy widzisz, że
*każda* surjekcja jest *podziałem całej dziedziny* na rozłączne kategorie albo podzbiory, których
`f-`nazwami są `y`-i? Żeby to podkreślić, otocz proszę wyznaczone w ten sposób części `X` liniami
przerywanymi. `Podpisz` też rysunek komentarzem podsumowującym Twoimi słowami to, co tutaj
przeczytałaś.

**Rysunek 7. Przykład bijekcji**: *Bijekcjami* nazywamy takie funkcje, które są jednocześnie
injekcjami i surjekcjami, czyli takie, które są różnowartościowe i na, czyli takie, które nie
sklejają żadnych elementów swojej dziedziny i trafiają we wszystkie elementy swojej
przeciwdziedziny. `Narysuj` proszę bijekcję z czteroelementowego zbioru `X` do czteroelementowego
zbioru `Y` i oznacz ją literą `b`. Czy rozumiesz, dlaczego nie może istnieć bijekcja, w dowolnym
kierunku, między zbiorami *różniącymi się wielkością*?

Bijekcje są *przykładami* [izomorfizmów](https://pl.wikipedia.org/wiki/Izomorfizm), ale pojęcie
izomorfizmu jest, jak się przekonasz, ogólniejsze. Czy widzisz, że izomorfizm jest jak powiedzenie
dokładnie tego samego, tylko innymi słowami albo symbolami, czyli to taki jakby wierny tłumacz w
obie strony? Dlatego nazywamy takie funkcje również funkcjami *wzajemnie jednoznacznymi*. W tym
wypadku to taka jakby *wymiana* `x`-ów na `y`-ki, ale poza tym nic się nie zmienia.

Ważną własnością funkcji izomorficznych i w ogóle wszelkiego rodzaju izomorfizmów jest ich
*odwracalność*. Dlatego proszę, żebyś narysowała jeszcze *odwrotność funkcji* `b`. To ma być taka
funkcja `b⁻¹`, że `b⁻¹` *odwraca działanie funkcji* `b`, to znaczy: Jeżeli do dowolnego `x`
zastosujesz `b`, to gdy do rezultatu zastosujesz `b⁻¹` (czyli pójdziesz po strzałce w drugą stronę),
uzyskasz ten sam `x`, czyli `b⁻¹(b(x)) = x` *i jednocześnie* dla każdego `y`, `b(b⁻¹(y)) = y`. Jak
tylko to zrobisz, zobaczysz czemu w wyrażeniu `b(b⁻¹(y))` pojawia się `y` a nie `x`. Można więc
powidzieć, że funkcje odwrotne są *lustrzanymi odbiciami wiernych odwzorowań dwóch* (z konieczności
równolicznych, prawda?) *zbiorów*.

Czy widzisz, że gdy już masz *jakąś* funkcję `f`, to może istnieć *co najwyżej jedna* funkcja `f⁻¹`?
Można powiedzieć, że jeżeli funkcja ma być odwrotnością jakiejś odwracalnej funkcji `f`, czyli
jakiejś bijekcji, to "nie ma żadnego wyboru", bo każdemu elementowi swojej dziedziny *musi*
przyporządkować dokładnie ten element, który w niego "f`-trafia" z jej przeciwdziedziny.  Właśnie
dlatego, że taka funkcja, jeżeli istnieje (a istnieje dokładnie wtedy, gdy `f` jest bijekcją), jest
*unikalna*, oznaczamy ją jako `f⁻¹`, to jest `f` z `-1` jako indeksem górnym, czyli jako *unikalne
coś, co powstaje w pewien sposób z funkcji* `f`. Byłoby dobrze, gdybyś pod tym rysunkiem również
zapisała jakiś zrozumiały dla Ciebie komentarz.

Może jeszcze `Narysuj` dowolną funkcję *nie*bijektywną i przekonaj się, że taka funkcja nie może być
odwracalna, to znaczy, gdyby `f` nie było bijekcją, bo albo sklejałoby jakieś elementy, albo nie
trafiało w jakiś element przeciwdziedziny, to nie mogłaby istnieć żadna *funkcja* `g` z
przeciwdziedziny `Y` funkcji `f` do dziedziny `X` tej funkcji taka, że `g(f(x)) = x` *i
jednocześnie* `f(g(y)) = y`.

Muszę odtąd czasem zrezygnować ze stosowania indeksów dolnych, bo standard kodowania
[Unikod](https://pl.wikipedia.org/wiki/Unicode) jest pod tym względem ograniczony. Jeżeli więc
napiszę na przykład `h_1`, to będzie to tylko
[namiastka](https://sjp.pwn.pl/slowniki/namiastka.html) `h₁` (akurat cyfry da się w ten sposób w
Unikodzie zapisywać, ale już na przykład większości liter nie).

Byłoby wspaniale, gdybyś jeszcze spróbowała zdefiniować za pomocą rysunków dwie funkcje, nazwijmy je
znowu `f` i `g`, takie, że `f : X → Y` ma tylko *lewą odwrotność*, ale *nie ma prawej*, to znaczy,
istnieje funkcja `l_f` taka, że `l_f(f(x)) = x`, ale *nie* istnieje funkcja `p_f` taka, że
`f(p_f(y)) = y` (tak, tu ma być `y`, a nie `x`), a `g : X → Y` ma tylko *prawą odwrotność*, ale *nie
ma lewej*, to znaczy, istnieje funkcja `p_g` taka, że `g(p_g(y)) = y`, ale *nie* istnieje funkcja
`l_g` taka, że `l_g(g(x)) = x`. Podpowiem Ci, że w tym zadaniu ważną rolę odgrywają własności bycia
injekcją, ale nie surjekcją i bycia surjekcją, ale nie injekcją.

**Rysunek 8. Składanie funkcji teoriomnogościowych**: Na koniec `Narysuj` jeszcze proszę trzy
zbiory, `X`, `Y` i `Z` takie, że pierwszy ma trzy elementy, drugi powiedzmy cztery i trzeci może też
cztery. Zdefiniuj rysując strzałki jakąś funkcję `f : X → Y`, czyli funkcję ze zbioru `X` do zbioru
`Y` i jakąś funkcję `g : Y → Z`. Pod spodem zapisz komentarz: *Teoriomnogościowe złożenie funkcji*
`f` *i* `g` *to taka funkcja* `g ∘ f` *(zapisujemy to w ten sposób w tej kolejności), że* `(g ∘
f)(x) := g(f(x))` *(właśnie dlatego w tej kolejności).* 

Czyli gdyby o funkcjach myśleć jako o programach albo operacjach, złożeniem funkcji byłaby funkcja,
która stosuje *najpierw* funkcję wymienioną jako *druga*, a *potem* funkcję wymienioną jako
*pierwsza*.  I tak na przykład, narysowanie sowy jest złożeniem dwóch operacji, czy może raczej
czynności - *najpierw* należy narysować w odpowiednich miejscach dwa nieco spłaszczone i pochylone
koła, a *następnie* narysować resztę [sowy](https://glebbahmutov.com/blog/how-to-draw-an-owl/),
czyli[^1] ...

`narysować_resztę_sowy p∘ narysowaniu_dwóch_kół`

Pod komentarzem `Narysuj` funkcję `g ∘ f`, to znaczy, najpierw skopiuj *tylko* zbiory `X` i `Z`, a
następnie narysuj strzałki od każdego elementu zbioru `X` do takich elementów `Z`, że z tych `x`-ów
można na Twoim rysunku dojść, idąc po (dwóch) strzałkach, do tych `z`-ów, idąc w ten sposób
funkcjami `f` i `g`. Czy widzisz, że niezależnie od tego, jakimi funkcjami są takie składalne
funkcje `f` i `g`, gdy zaczniesz od dowolnego `x`-a i będziesz podążać za `f` i za `g`, to nie
będziesz mieć nigdy żadnego wyboru i jednocześnie zawsze dojdziesz do jakiegoś `y`-a?

Oznacz tą funkcję literą `h` i podpisz proszę ten rysunek komentarzem: `h(x) = (g ∘ f)(x)`. Czy
widzisz, że ponieważ z każdego `x`-a można w ten sposób dojść do jednego i tylko jednego `z`-a, to w
ten sposób *zawsze* z dwóch składalnych funkcji uzyskamy dokładnie jedną funkcję?  Teoriomnogościowe
składanie jest więc *szczególnym przypadkiem "działania wybrednego"*, które *zachowuje się tak samo
jak kategoryjne składanie strzałek*. O tym, w jakim znaczeniu tak samo, powiem trochę więcej
później.

Czy rozumiesz, dlaczego dla każdych zbiorów `X` i `Y` i każdej funkcji `f : X → Y` zachodzi `Id_Y ∘
f = f = f ∘ Id_X`? Musiałem tutaj znowu inaczej oznaczyć identyczności, bo Unikod nie pozwala na
zapisanie na przykład litery `Y` jako indeksu dolnego. Spróbuję Ci teraz pomóc w ręcznym
skontruowaniu dowodu tych *dwóch* albo nawet *trzech zdań* (mamy tu dwie równości i niejawną
konsekwencję przechodniości relacji równości) i jednocześnie sprawdzeniu go w podobny sposób do
tego, w jaki mógłby to zrobić Lean.

O tożsamości funkcji teoriomnogościowych decyduje to, jaką mają dziedzinę i przeciwdziedzinę i to,
co zwracają dla każdego elementu dziedziny. Wystarczy rzut oka na podany wyżej skrótowy opis trzech
funkcji, żeby upewnić się, że `Id_Y ∘ f` oznacza funkcję, która ma taką samą dziedzinę i
przeciwdziedzinę jak funkcja `f` i jak funkcja `f ∘ Id_X`, a więc te trzy funkcje przynajmniej
*mogą* być tą samą funkcją (gdyby miały różne dziedziny lub przeciwdziedziny to byłyby automatycznie
różnymi funkcjami). Ale czy są? 

1. Niech `x` będzie dowolnym elementem zbioru `X`.  
   (tak zaczynamy konstrukcję dowodu zdania, które ma być prawdziwe dla każdego `x` należącego do `X`)  

2. Wtedy `(Id_Y ∘ f)(x) = Id_Y(f(x))`, ...  
   (rozwijamy definicję teoriomnogościowego składania funkcji)  

3. ... a ponieważ `Id_Y(f(x)) = f(x)` ...  
   (stosujemy definicję funkcji identycznościowej)  

4. ... to `(Id_Y ∘ f)(x) = f(x)`.  
   (stosujemy przechodniość relacji równości do już udowodnionych zdań 2 i 3)

Czyli *dla każdego `x ∈ X` jest prawdą, że* `(Id_Y ∘ f)(x) = f(x)`, albo krócej:

`∀ x ∈ X, (Id_Y ∘ f)(x) = f(x)`

A ponieważ to ostatnie zdanie oznacza, że kryterium równości funkcji jest dla tych dwóch funkcji
spełnione, to `Id_Y ∘ f` to ta sama funkcja, co `f`, czyli:

`Id_Y ∘ f = f`

**Sugestia**: Dokończ ten dowód w podobnym stylu dla drugiej równości, to jest dla `f = f ∘ Id_y`,
tylko może nie pisz aż tyle co ja. Przeprowadzając taki dowód po raz pierwszy warto chyba jednak
powstrzymać się przed daleko idącymi skrótami myślowymi.

## Iloczyn kartezjański zbiorów

Pamiętasz, że dowód koniunkcji można zaimplementować jako uporządkowaną parę dowodów? A pamiętasz,
jak pisałem, że typy co prawda nie są zbiorami, ale że mają coś ze zbiorów? Zresztą funkcje
teoriotypowe też nie są "zwykłymi" funkcjami matematycznymi, ale coś z tych funkcji mają, właściwie
nawet mają z nimi bardzo wiele wspólnego, bo pobierają tak naprawdę tylko jeden argument
(określonego *typu*, odpowiadającego teoriomnogościowej *dziedzinie*) i dla każdego argumentu
zwracają dokładnie jeden argument (też określonego *typu*, odpowiadającego teoriomnogościowej
*przeciwdziedzinie*). Pisałem też, że funkcje teoriotypowe to takie funkcje matematyczne, tylko że
obliczalne, to znaczy dające się "zrealizować" za pomocą algorytmu (i zarazem w ten sposób
*zrealizowane*). No więc *typ par uporządkowanych* to taki teoriotypowy odpowiednik, albo
"syntaktyczny cień", *iloczynu kartezjańskiego zbiorów*. Wydaje mi się teraz, że zaczynając w ten
sposób mówić o iloczynie kartezjańskim niekoniecznie pomagam ...

To może tak: Iloczyn kartezjański pojawił się również w rozdziale wprowadzającym do izomorfizmu
Curry'ego-Howarda, ponieważ mówiłem tam o *uporządkowanych parach liczb rzeczywistych*. Zbiór
wszystkich takich par to dokładnie zbiór wszystkich punktów na płaszczyźnie, *o ile* z tą
płaszczyzną jest związany układ współrzędnych kartezjańskich.

Teraz jeżeli na przykład ...

`X = {1, 2, 3}` i `Y = {a, b}`

... to ...

`X × Y = {(1, a), (1, b), (2, a), (2, b), (3, a), (3, b)}`

Zapisywanie uporządkowanych par za pomocą zwyczajnych nawiasów to oczywiście tylko konwencja i
równie dobrze moglibyśmy posługiwać się w tym celu notacją Leana. Wtedy zamiast na przykład `(1, a)`
pisalibyśmy `⟨1, a⟩`. Nie muszę już chyba wyjaśniać, czemu to (akurat niewybredne, bo "radzi sobie"
z każdą uporządkowaną parą zbiorów) *działanie na zbiorach* (zauważyłaś, że to działanie na
zbiorach?)  jest w matematyce bardzo ważne, ale powiem Ci o pewnym przydatnym czasem sposobie
myślenia o iloczynach kartezjańskich, jak również o dwóch nietypowych i ważnych przykładach
iloczynów zbiorów.

Dla dowolnych zbiorów `X` i `Y`, iloczyn kartezjański tych zbiorów, czyli `X × Y`, możemy rozumieć
jako przestrzeń wszystkich *niezależnych wyborów* elementów należących do zbioru `X` i do zbioru
`Y`, w tej kolejności. A niezależne wybory elementów należących do pewnych zbiorów, typów, albo
kategorii (w potocznym znaczeniu słowa kategoria) pojawiają się niezwykle często. Na przykład,
typowy obiad zamówiony w restauracji to czasem *logicznie* (ale nie *przyczynowo* albo
*statystycznie*) *niezależny potrójny wybór* zupy, dania głównego i deseru, gdzie każda z tych
kategorii dopuszcza dodatkowo wybór "pusty". A więc zgodnie z tym punktem widzenia albo definicją
można zamówić stosunkowo niedrogi obiad składający się z *niczego*[^3].

**Rysunek 8**: Żeby utrwalić sobie to pojęcie i zacząć się przyzwyczajać do bardziej elastycznego
myślenia o *wymiarach*, `Narysuj` proszę dwie prostopadłe osie, poziomą oznacz literą `X` a pionową
literą `Y`, i nanieś na nie elementy tych zbiorów tak, żeby tworzyły skale osi, to znaczy,
zaczynając od punktu przecięcia się osi, zaznacz "wysokości" za pomocą elementów `1`, `2` i `3` i
"szerokości" za pomocą elementów `a` i `b`. Następnie w odpowiednich miejscach uzyskanego w ten
sposób wykresu nanieś wszystkie uporządkowane pary zapisując je albo za pomocą zwykłych nawiasów,
albo [nawiasów ostrokątnych](https://pl.wikipedia.org/wiki/Nawias). Gdy już to zrobisz, podpisz ten
rysunek komentarzem: *Przykład iloczynu kartezjańskiego zbiorów* `X = {1, 2, 3}` *i* `Y = {a,
b}`. *Wartości oznaczone na osiach to tak zwane projekcje par uporządkowanych.*

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

Dla dowolnych zbiorów `X` i `Y`, *suma rozłączna* tych zbiorów to taki zbiór, który zawiera
dokładnie wszystkie *kopie*, zapisane w jakikolwiek sposób jako *różne* elementy, elementów tych
zbiorów. To znaczy, że wewnątrz sumy rozłącznej *zachowujemy informację* o tym, z którego z dwóch
zbiorów pochodzi każdy element.

Na przykład, jeżeli tak jak wcześniej `X = {1, 2, 3}` i `Y = {a, b}`, to nie musimy w żaden sposób
*oznaczać* elementów, bo żaden element nie należy jednocześnie do zbiorów `X` i `Y` i możemy po
prostu stwierdzić, że `X ⨿ Y = {1, 2, 3, a, b}`. Suma rozłączna to również pewne (niewybredne)
działanie na zbiorach, które zapisujemy między innymi za pomocą symbolu `⨿`.

**Rysunek 8**: Narysuj proszę te dwa zbiory a między nimi ich sumę rozłączną w taki sposób, żeby
zarówno z każdego elementu zbioru `X` jak i z każdego elementu zbioru `Y` wychodziły strzałki do ich
kopii w sumie rozłącznej. Otocz te dwie *części* zbioru `X ⨿ Y` liniami przerywanymi. Czy widzisz,
że to zawsze (bo tego wymaga definicja) muszą być rozłączne części i że zawsze w takiej sytuacji
istnieją dwie funkcje *injektywne* (bo to są dwie *wierne kopie*), w tym wypadku `i_X : X → X ⨿ Y` i
`i_Y : Y → X ⨿ Y`, które jakby *wyrażają* te *inkluzje* (bo tak między innymi nazywamy te funkcje)?
Podpisz proszę ten rysunek komentarzem, który Twoim zdaniem tu pasuje i który pozwoli Ci upewnić
się, że przynajmniej w tym momencie pamiętasz lub potrafisz odnaleźć i zapisać po swojemu
objaśnienia na temat wszystkich wymienionych właśnie właściwości tej konstrukcji.

**Rysunek 9**: Gdy dwa zbiory zawierają choćby tylko jeden wspólny element, nie możemy należących do
nich elementów po prostu "włożyć" do sumy rozłącznej bez żadnej modyfikacji, bo w ten sposób nie
uzyskamy dwóch rozłącznych kopii zbiorów wyjściowych. W takich sytuacjach musimy jakoś *oznaczyć*
wszystkie kopie tak, żeby *elementy wspólne dla obydwu zbiorów* były reprezentowane przez *różne*
kopie. Ponieważ suma rozłączna zbiorów jest działaniem binarnym w zasadzie jak każde inne, a dla
takich działań ważna jest kolejność obiektów czy argumentów, na których wykonujemy działanie, to
można przyjąć, że pisząc `X ⨿ Y` zdecydowaliśmy automatycznie, że `X` jest tutaj *pierwszym*, a `Y`
*drugim* członem tej sumy rozłącznej. 

*Spełniającą dokładnie tą samą rolę* sumę rozłączną `X ⨿ Y` możemy zatem skonstruować tak: `X ⨿ Y :=
{(1, 1), (2, 1), (3, 1), (a, 2), (b, 2)}`. Możemy więc w ten sposób *skorzystać z par
uporządkowanych* i liczb naturalnych `1` i `2`, żeby *zaimplemntować* operację tworzenia sum
rozłącznych z *dowolnych* par zbiorów. Ponieważ ten sposób jest *uniwersalny*, można zapomnieć o
poprzednim i stosować tylko ten. Myślę, że wiesz, jak należy przedstawić tą konstrukcję za pomocą
rysunku i jak, za pomocą strzałek od elementów zbioru `X` i od elementów zbioru `Y` do odpowiednich
kopii w zbiorze `X ⨿ Y`, należy oznaczyć obydwie funkcje-inkluzje (albo injekcje-inkluzje), czyli po
prostu obydwie inkluzje. Na koniec oznacz proszę te inkluzje jako `i_X` i `i_Y`, tylko może zamiast
symbolu `_` zapisz wtedy litery `X` i `Y` jako indeksy dolne. Otocz kopie przerywanymi liniami i
podpisz ten rysunek (ewentualnie wspomagając się tym tekstem) komentarzem sprawdzającym Twoją wiedzę
na temat tej konstrukcji.

Jeżeli masz już za sobą poprzedni dostępny poprzez link fragment "obowiązkowy", to zastanów się
proszę, jak ta operacja na zbiorach, zakładając, że wszystkie zbiory są *skończone*, musi "działać"
na parach zbiorów takich, że co najmniej jeden z nich jest zbiorem pustym, a jak na parach takich,
że co najmniej jeden zbiór jest singletonem. Następnie zastanów się proszę, jak ta operacja na
zbiorach skończonych ma się do (funkcji) mocy zbiorów i operacji *dodawania* liczb naturalnych. Gdy
już uznasz, że wystarczy tych samodzielnych rozmyślań (i może też rysunków i notatek), zapoznaj się
proszę z [drugim](Operacje_na_zbiorach_i_na_liczbach.md) i ostatnim w tym rozdziale fragmentem
"obowiązkowym".

Na koniec poznasz jeszcze dwie operacje na zbiorach, które są bardzo blisko związane z *koniunkcją*
i *alternatywą zdań*.

## Część wspólna zbiorów

Jeżeli `X` i `Y` to zbiory, to *częścią wspólną*, *przekrojem*, *przecięciem*, albo *iloczynem
mnogościowym* zbiorów `X` i `Y` nazywamy zbiór złożony dokładnie z takich elementów, które należą
*zarówno do* `X` *jak i do* `Y`. Tą operację zapisujemy za pomocą symbolu `∩`. Możemy to zapisać
półformalnie tak: Jeżeli `X` i `Y` to zbiory, to ...

`X ∩ Y := {z | (z ∈ X) ∧ (z ∈ Y)}`.

**Czytamy to**: Jeżeli `X` i `Y` to zbiory, to zbiór, który oznaczamy jako `X ∩ Y`, jest z definicji
takim zbiorem, który zawiera dokładnie te elementy, które należą do `X` *i* do `Y`.

Czy widzisz podobieństwo między symbolami `∩` i `∧` i czy widzisz, że jest nieprzypadkowe?

## Suma zbiorów

Jeżeli `X` i `Y` to zbiory, to *sumą* albo *unią* zbiorów `X` i `Y` nazywamy zbiór złożony dokładnie
z takich elementów, które należą do `X` *lub* do `Y`. Tą operację zapisujemy za pomocą symbolu
`∪`. Możemy to zapisać półformalnie tak: Jeżeli `X` i `Y` to zbiory, to ...

`X ∪ Y := {z | (z ∈ X) ∨ (z ∈ Y)}`.

**Czytamy to**: Jeżeli `X` i `Y` to zbiory, to zbiór, który oznaczamy jako `X ∪ Y`, jest z definicji
takim zbiorem, który zawiera dokładnie te elementy, które należą do `X` *lub* do `Y`. Spójnik
logiczny `∨`, którego jeszcze nie omawiałem, nazywamy między innymi *alternatywą* i czytamy właśnie
jako *lub*.

Czy widzisz podobieństwo między symbolami `∪` i `∨` i czy widzisz, że jest nieprzypadkowe?

**Rysunek 10**: Zrób proszę notatkę z odpowiednimi rysunkami, wzorując się na poprzednich rysunkach,
która będzie dla Ciebie ilustracją pojęć iloczynu i sumy zbiorów. Być może będzie Ci łatwiej, jeżeli
wcześniej zapoznasz się ze stronami Wikipedii dotyczącymi
[jednego](https://pl.wikipedia.org/wiki/Cz%C4%99%C5%9B%C4%87_wsp%C3%B3lna) i
[drugiego](https://pl.wikipedia.org/wiki/Suma_zbior%C3%B3w) pojęcia.

### Przypisy

[^1]: Jestem bardzo dumny z pomysłu, żeby wykorzystać w ten sposób symbol `∘` oznaczający operację
    składania. To może być moje największe osiągnięcie w tym roku (a jest dopiero styczeń).

[^2]: Tak wiem, że [niby powinno *się* pisać iniekcja i
    suriekcja](https://sjp.pwn.pl/poradnia/haslo/;8643.html) a nie injekcja i surjekcja, ale
    pisownia przez *j* przeważa i według mnie jest bliżej sposobu, w jaki te słowa wymawiamy, a poza
    tym nie lubię, gdy ktoś mi próbuje *narzucać* jakiekolwiek reguły *bez uzasadnenia* innego niż
    "bo tak *się* robi". Autorytet wymaga uzasadnienia!

[^3]: Ten przykład "ukradłem" i przerobiłem na bardziej "własny" wybitnemu, niestety nieżyjącemu już
    matematykowi [F. Williamowi Lawverowi](https://en.wikipedia.org/wiki/William_Lawvere) i
    [Stephenowi H. Schnauelowi](), którzy skorzystali z podobnego przykładu w dosyć niezwykłej,
    nawet jeżeli cokolwiek chaotycznej (i kto to mówi) książce, którą czytałem, wielokrotnie, dawno,
    dawno, dawno temu i która była dla mnie jedną z inspiracji podczas pisania tej (m.in. dlatego,
    że powstawała w interakcji z licealistami), pod tytułem [Conceptual
    Mathematics](https://www.cambridge.org/highereducation/books/conceptual-mathematics/00772F4CC3D4268200C5EC86B39D415A#contents). I
    tak, z pierwszym z wymienionych [kosiarzy
    umysłów](https://en.wikipedia.org/wiki/The_Lawnmower_Man_(film)) też kiedyś przez chwilę
    korespondowałem.

[^4]: Jest jeszcze kwestia paradoksu albo antynomii Russella, ale moim zdaniem nie trzeba sobie tym
    zaprzątać głowy.