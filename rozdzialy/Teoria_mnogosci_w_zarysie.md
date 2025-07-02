## Teoria mnogości w za[rysie](https://pl.wikipedia.org/wiki/Ry%C5%9B)

Jak być może wiesz, do niedawna w pewnym sensie najważniejszym podstawowym językiem matematyki był
język teorii mnogości (czyli zbiorów), a konkretnie język teorii
[Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla). Nawet, jeżeli to wiesz,
to i tak na wszelki wypadek przytoczę tutaj odpowiedni
[cytat]((https://pl.wikipedia.org/wiki/Teoria_mnogo%C5%9Bci)) z Wikipedii (2024-12-29):

> Po odkryciu paradoksów tzw. naiwnej teorii mnogości udało się sformułować teorię zbiorów jako
> teorię aksjomatyczną; jej standardową wersją jest aksjomatyka ZF uwieńczona w latach 30. XX
> wieku. Stała się ona podstawą innych działów matematyki, ponieważ do pojęcia zbioru zredukowano
> inne szeroko używane obiekty jak liczby, funkcje oraz inne relacje; teoria mnogości stała się tak
> źródłem modeli różnych teorii formalnych.

Wolałbym chyba "w ten sposób" zamiast "tak" w ostatnim zdaniu, no i zamiast "zredukowania" wolałbym
na przykład "implementację", chodzi tu przecież o *modele*, ale trudno, jest jak jest. Nie będziemy
się teraz przyglądać aksjomatom teorii *ZF*, ponieważ sami sobie *zrobimy* - ze strzałek i funkcji -
pewną wersję teorii mnogości w jednym z późniejszych rozdziałów. Zanim to jednak nastąpi, zacznę
odtąd intensywnie korzystać z półformalnej wersji tej teorii jako ze źródła ważnych przykładów i
pretekstu do snucia amatorskich filozoficznych rozważań na temat natury matematyki.

Mogłoby się wydawać, że pojęcie zbioru *jako takiego* jest interesujące przede wszystkim dla
specjalistów zajmujących się zbiorami, natomiast dla reszty świata to raczej nie jest nic
szczególnie ciekawego, bo zbiór to tylko pewna *kolekcja* (jakiś) elementów. Jednak właśnie dzięki
temu, że to pojęcie - podobnie zresztą jak pojęcia *typu* i *przypisania* - jest tak (hm)
elementarne, niemal wszędzie albo do czegoś się przydaje, albo okazuje się wręcz niezbędne, i
dlatego też warto się temu pojęciu przyglądać długo i cierpliwie z pewnego oddalenia.

Zbiory *skończone* możemy zapisać *dosłownie*, na przykład tak:

`{1, 20, *, X, -3.4}`

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, na przykład tak ...

`{0, 1, 2, 3, 4, ...}`

... lub tak ...

`{n ∈ ℕ | Dodatnie n}`

... bo zapisane *dosłownie* nie zmieściłyby się na żadnej stronie. *Ostatni* przykład **czytamy
tak**: Zbiór (`{ ...`) złożony z takich liczb naturalnych `n` (`{ n ∈ ℕ ...`), że `Dodatnie n` (`{ n
∈ ℕ | Dodatnie n}`).

Wymyślając *pierwszy* przykład chciałem od razu zasugerować, że - zgodnie z dominującym w matematyce
*zwyczajem* - zbiory mogą zawierać (niemal[^4]) dowolne elementy, na przykład takie, które nie
należą do żadnego dającego się łatwo, a może nawet w ogóle zidentyfikować rodzaju albo typu. A więc
zbiory to takie (niemal) *dowolne kolekcje potencjalnie różnorodnych elementów*.

Natomiast *funkcje*, takie jak na przykład funkcja kwadratowa `f(x) = x²`, to (niemal) dowolne
*przyporządkowania*. Ale uwaga, nie należy mylić przyporządkowania *jako takiego* z *procesem
ustalania* tego przyporządkowania, takim jak na przykład *proces* obliczania kwadratu liczby, albo z
*formułą definiującą* przyporządkowanie elementom jakiegoś jednego zbioru elementów jakiegoś (być
może tego samego) zbioru, taką jak `x²`.

<hr>

### Oznaczanie jako wspólna rola zbiorów, elementów i funkcji w praktyce matematycznej

Z jednej strony, pojęcie zbioru może się wydawać mało interesujące. Z drugiej jednak strony, gdy
popatrzymy na zbiory w kontekście *innych* rodzajów matematycznych struktur, będziemy mogli
powiedzieć o zbiorach (i funkcjach) coś głębszego, a mianowicie, że zbiory (i funkcje) są w pewnym
ważnym sensie *strukturami ekstremalnymi*.

Na przykład, *liczby naturalne* to nie *tylko* pewna *kolekcja* obiektów, bo to jest *specjalna*
kolekcja - to kolekcja posiadająca skomplikowaną, nietrywialną *strukturę*. I tak, istnieje pewna
(naturalna!) relacja (liniowego) porządku na liczbach naturalnych, ze względu na tą relację istnieje
najmniejsza liczba naturalna, dla każdej liczby naturalnej istnieje unikalna następna liczba
naturalna, dla każdej liczby naturalnej różnej od zera istnieje unikalna poprzednia liczba
naturalna, dla każdej pary liczb naturalnych istnieje ich unikalna suma, która ma tą własność, że
liczba naturalna zero (czyli ta najmniejsza) jest elementem neutralnym ze względu na to działanie, i
tak dalej. 

A zatem liczby naturalne "w swej mnogości" to nie jest *jakaś tam* kolekcja. Jednak *rozpatrywane
jako kolekcja*, to jest *jako zbiór*, liczby naturalne to tylko *jakieś tam* obiekty, które możemy
wskazywać czy nazywać i orzekać o nich, czy są równe, czy nie, *i nic więcej*. Być może trudno
zrozumieć tą perspektywę, bo liczby naturalne tak bardzo kojarzą nam się z ich uporządkowaniem i
pewnymi operacjami, takimi jak dodawanie czy mnożenie, ale żeby zrozumieć czym *w istocie* są zbiory
*jako zbiory* musimy tymczasowo oderwać się od tych skojarzeń, albo przynajmniej nauczyć się *mówić*
tak, jakbyśmy się od takich skojarzeń oderwali.

Gdy mówimy o jakimkolwiek zbiorze *jako zbiorze*, to mówimy *tylko* o pozbawionej jakiejkolwiek
struktury innej niż struktura tożsamościowa kolekcji elementów. W tym sensie wskazany albo wyrażony
w piśmie zbiór jako taki jest trochę jak *częściowa definicja funkcji w Leanie*, której parametry
mają bliżej nieokreślone (a więc też nie-zależne) typy. Ta prawie-funkcja (czyli właściwie funkcja
aksjomatyczna) nic z tymi parametrami nie robi, bo jej parametry służą *tylko* do tego, żeby *coś*
każdemu z nich *przypisać*, dokonując w ten sposób jakby nieredukowalnej aplikacji do czegoś zbioru
jako pozbawionej ciała, albo takiej "otwartej" funkcji. Innym sposób, który może ułatwić myślenie w
ten sposób o zbiorach, polega na wyobrażeniu sobie, że każdy zbiór jest jak okrąg zawierający
pozbawione jakiegokolwiek charakteru *punkty zaczepienia*.

Może spróbuję wyjaśnić o co tu chodzi na konkretnym przykładzie: Pisząc coś takiego ...

`Z := {1, 20, *, X, -3.4}`

... "wchodzimy" razem z odbiorcą tego formalnego tekstu (którym możemy być my sami w przyszłości)
"do środka" pewnej "bezcielesnej" funkcji, albo "zakładamy abstrakcyjne okulary" o nazwie `Z`, przez
które można powiedzieć, że "widzimy" to ...

1, 20, *, X, -3.4

... i jednocześnie *wyrażamy* to: Odtąd aż do odwołania `z ∈ Z` będzie oznaczało, że `z` oznacza
albo to, co oznacza w tym kontekście `1`, czyli (pewnie) *liczbę* 1, albo liczbę 20, albo to, co w
tym kontekście oznacza `*` (to może być na przykład sama ta gwiazka, jako w pewien sposób
"samooznaczający się" symbol), albo to, co w tym kontekście oznacza `X`, albo liczbę -3.4, *i nic
innego*.

#### Zbiory, ich elementy, i funkcje jako językowe i pojęciowe narzędzia służące do maksymalnie swobodnego i zarazem konsekwentnego mówienia i myślenia niemal o czymkolwiek

Z zarysowanej (?)  właśnie perspektywy język teorii mnogości służy do *konsekwentnego* (moim zdaniem
do tego w praktyce sprowadza się "matematyczność" języka) i zarazem *swobodnego
wskazywania/oznaczania/wyróżniania*, w taki czy inny sposób, w tym również *całkiem arbitralnie*,
bez podania żadnego powodu czy zasady, wyróżnionych czy wybranych elementów, i do konsekwentnego i
zarazem swobodnego mówienia/myślenia o/badania niemal dowolnych, w tym również całkiem arbitralnych,
*własności* tych elementów.

**Graf skierowany jako struktura teoriomnogościowa**: Dla porównania, język grafów (skierowanych),
którego zaczęliśmy już używać, służy, a raczej *ma służyć* (bo - tak jak wszystkiego innego - można
go przecież używać jak tylko się chce, w tym również całkiem bez sensu) do konsekwentnego i zarazem
swobodnego mówienia o dowolnych obiektach, o których da się konsekwentnie mówić, że mają jakieś ...

1. ... (maksymalnie elastycznie rozumiane) *źródła* i *cele*, ...

2. ... i o takich obiektach, o których da się konsekwentnie mówić, że są jakimiś źródłami albo
celami czegoś. 

O tym, że języki takie jak język grafów są "mniej swobodne", bo "narzucają" pewną *strukturę*, albo
"domagają się" jej, podczas gdy język teorii mnogości albo nie "domaga się" żadnej struktury, albo
"domaga się" struktury w pewnym sensie minimalnej, możemy się przekonać rozważając taki oto przykład
konsekwentnego mówienia czy myślenia o czymś *jednocześnie* na co najmniej *dwa różne sposoby* (ten
przykład to oczywiście tylko pewna idealizacja):

*Każdy człowiek ma parę rodziców, którzy też są ludźmi*.

W kontekście tego przykładu możemy mówić między innymi o *zbiorze* ludzi `L` i o *strzałkach* (a to
już *nie* jest pojęcie wbudowane w język teorii mnogości) od każdej (oznaczonej jako element `L`)
osoby do (jakiegoś unikalnego elementu `L` oznaczającego) rodzica tej osoby. Możemy omawiać
strukturę uzyskanego albo wyróżnionego albo wstępnie wskazanego albo "przywołanego" w ten sposób
grafu posługując się narzucającym pewną strukturę albo domagającym się jej "językiem grafowym". Na
przykład, możemy mówić o strzałkach na tym grafie rozpatrując te strzałki *jako mini-grafy
jednostrzałkowe*. Ale możemy też dla pewnych celów traktować ludzi jako obiekty takie jak każde
inne. Wtedy odrywamy się w naszych rozważaniach od struktury grafowej, to znaczy *nie korzystamy z
faktu*, że każdy człowiek ma jakiś rodziców, ani tego faktu nie kwestionujemy.

Co więcej, dzięki jego "minimalnej strukturalności", język teorii mnogości nadaje się do pewnego
stopnia (bo język teorii kategorii jest w tym w pewnym sensie lepszy, dzięki temu, że jest *mniej*
elastyczny) do mówienia o *byciu grafem*! *Graf* (skierowany) to przecież *strzałki wychodzące z
jakiś punktów i wchodzące do jakiś punktów*, a więc to (jest funkcjonalnie to samo co) dowolna
kolekcja - czyli *zbiór* - *strzałek*, to znaczy jakichkolwiek rzeczy, obiektów, czy bytów (albo po
prostu *elementów*), które "mają", w znaczeniu *są traktowane jako mające*, jakieś *swoje źródła* i
*swoje cele*. *Źródła* i *cele* to (jedyne) *własności* strzałek (jako strzałek), a więc to pewne
*funkcje*.

Czym zatem jest graf (skierowany) *jako taki*? Z perspektywy (w języku) teorii mnogości graf
(skierowany) jest *dowolną parą zbiorów*, które możemy oznaczyć jako `S` (jak *s*trzałki) i `P` (jak
*p*unkty), i parą *dowolnych funkcji* *z* `S` *do* `P`, które możemy oznaczyć jako `z` i `c` (jak
*z*ródło i *c*el odpowiednio). W naszym przykładzie `S := L =: P` (dla zabawy odwróciłem tu symbol
definiowania), a każda strzałka `s ∈ S` to pewien *fakt*, dotyczący pewnej pary ludzi `l₁, l₂ ∈ L`,
polegający na tym, że `z(s) = l₁` i `t(s) = l₂`, czyli że `l₁` jest dzieckiem `l₂`, albo równoważnie
(bo dualnie), że `l₂` jest rodzicem `l₁`.

**Rysunek 1**: Wróć teraz proszę do którego chcesz diagramu, który (mam nadzieję) narysowałaś
czytając poprzedni rozdział, i zapisz go jako wewnętrzną strukturę funkcji `z` i `c`. To znaczy,
narysuj na górze okrąg zbioru `S` i umieść w nim strzałki diagramu *jako elementy tego zbioru*, a
poniżej narysuj okrąg zbioru `P` i umieść w nim punkty zaczepienia strzałek tego diagramu jako
elementy zbioru `P`. Na koniec nanieś strzałki `z` i strzałki `c` z elementów `S` do `P` i oznacz je
literami `z` i `c`. Czy widzisz, że w ten sposób wyraziłaś dokładnie to samo, co wyraża diagram
wyjściowy? A czy widzisz, że *ten* diagram mogłabyś zakodować w ten sam sposób, uzyskując jeszcze
inny diagram?

Tak oto z języka elemntów/zbiorów/funkcji, który nadaje się do maksymalnie swobodnego i zarazem
konsekwentnego mówienia niemal o czymkolwiek, *służy* przecież *do mówienia o* (niemal) *dowolnych
własnościach* (niemal) *dowolnie wyróżnionych elementów*, "wykrawamy" pewien "odpowiednio
ograniczony" *język dziedzinowy*, który *służy*/*nadaje się/jest dedykowany* do mówienia o dowolnych
*strukturach grafowych jako takich*. 

Korzystając z okazji zasygnalizuję już teraz pewien interesujący problem, o którym powiem więcej
kiedy indziej. Łatwo to przeoczyć, bo ten proces wydaje się być (mam nadzieję) względnie naturalny i
celowy, ale takie "wykrojenie" języka dziedzinowego, a mówiąc dokładniej *skonstruowanie go* z
elementów języka teorii mnogości (tutaj stworzenie czy też wskazanie pewnej konstrukcji złożonej z
dwóch zbiorów i dwóch równoległych funkcji) *nie* jest tak do końca konstrukcją
teoriomnogościową. Co prawda tworzymy tą konstrukcję *używając* do tego języka teorii mnogości, ale
nie robimy tego tak całkiem *w* tym języku. Dzieje się tak właśnie dlatego, że język teorii mnogości
jest w pewnym sensie maksymalnie odarty ze struktury.

Pozostawiając na razie bez odpowiedzi subtelne pytanie o to, co to dokładnie za dwa języki, jesteśmy
i tak w stanie zobaczyć, że gdy mamy już te dwa formalno-pojęciowe narzędzia, możemy się między nimi
swobodnie i konsekwentnie przełączać, czasami biorąc pod uwagę (*respektując*) grafowość czegoś -
gdy na przykład rozpatrujemy strzałki albo ścieżki *jako strzałki* i *jako ścieżki* odpowiednio - a
czasem tą grafowość ignorując, a więc mówiąc o de facto strzałkach i punktach jako o *bliżej
nieokreślonego rodzaju* elementach, to jest takich jak wszystkie inne (dowolnie wyróżnialne).

I jest jasne, że zarówno w naszym wewnątrz, jak i między-osobowym komunikowaniu się/myśleniu
potrzebujemy *obydwu* tych języków/punktów widzenia/sposobów myślenia/metod badania teoretycznego, i
że potrzebujemy te narzędzia swobodnie wymieniać i "ze sobą przeplatać". Dzięki temu na przykład
"rzucił nam się w oczy" (nomen omen) fakt, że w pojęciu bycia dzieckiem (i w dualnym pojęciu bycia
rodzicem) chodzi między innymi o pewne *abstrakcyjne fakty*. Posługując się jednocześnie językami
teorii mnogości i grafów do mówienia o *relacji* bycia rodzicem/dzieckiem jesteśmy w stanie zarazem
konsekwentnie i swobodnie mówić o tych *faktach* ...

1. ... jako o *elementach* ...  
(tu mamy *wy-abstrahowanie* pojęcia faktu)

2. ... w pewien sposób *zinterpretowanego* ...  
(tu mamy *wyjściowy sens*, rozumiany jako odniesienie do rzeczywistości pozajęzykowej)

3. ... *zbioru* `S`.  
(a tu mamy rozumianą chwilowo *nie-grafowo* \{bo mówimy o `S` *jako o pewnym zbiorze*\} *część grafu
jako takiego* \{bo *w tym kontekście* to jest też *jednocześnie* teoriomnogościowa część *ogólnej
struktury grafu* `z : S → P`, `c : S → P`\}).

A rolę takiego dajmy na to fragmentu ...

*Niech ℕ będzie zbiorem liczb naturalnych. Jeżeli n ∈ ℕ i m ∈ ℕ, to n + m = m + n, ponieważ ...*

..  można objaśnić tak: Pisząc tak do Ciebie próbuję Ci lub w Tobie *zainstalować* albo *wgrać*
pewną szczególną językową i pojęciową *procedurę*, czyli pewne *narzędzie*, które w tym wypadku jest
akurat dowodem (twierdzenia o przemienności dodawania liczb naturalnych). Cały fragment przed słowem
"ponieważ" ma więc pełnić taką samą rolę, co część definicji funkcji w Leanie, która poprzedza
symbol definiowania `:=`.

Zastąpiony tutaj wielokropkiem dowód, który po przyswojeniu go przez Ciebie ma stać się ciałem tego
twierdzenia jako funkcji zrealizowanej w Twoim ciele, działa poprawnie dla/dotyczy tylko określonych
rzeczy czy obiektów, to jest takich obiektów, które nauczyliśmy się (wystarczająco konsekwentnie)
nazywać liczbami naturalnymi. Z tego dowodu, odkąd go *zaakceptowałaś jako dowód*, korzystasz
zresztą tak samo jak Lean, bo *używając* przemienności dodawania ani nie przypominasz sobie tego
dowodu, ani tym bardziej go nie stosujesz do wyprowadzenia wniosku na temat konkretnych par liczb
naturalnych. Zamiast tego wystarczy Ci *pamiętać, że* to zdanie jest uniwersalnie prawdziwe. Być
może nawet nie poznałaś dotąd dobrze dowodu tego twierdzenia i używając go korzystasz z *pamięci
wspólnoty*, do której należysz i której w takich sprawach ufasz.

Główna rola, a więc sens, terminu technicznego *zbiór* sprowadza się w tego rodzaju komunikacyjnej
(w)grze do określania, jakie pojęciowe albo fizyczne wejścia może przetwarzać ta zapisana częściowo
nieformalnie funkcja (sic!) do typu zdaniowego, czyli ten dowód. Tutaj różnica między *zbiorami* i
*typami* jest więc kosmetyczna, a w innych sytuacjach, w których ta różnica nie wydaje już całkiem
kosmetyczna, możemy ją skutecznie zatrzeć, bowiem *całą* matematykę da się zakodować w Leanie.

Kiedy *przyjmując tą interpretację pojęcia zbioru* mówimy o *zbiorze* liczb naturalnych, a nie *o
liczbach naturalnych*, mówimy o pewnym *oznaczeniu* - a więc też o pewnej *funkcji do* - liczb
naturalnych *jako luźnej kolekcji*. Same wskazywane czy oznaczane obiekty nie tracą wtedy oczywiście
swoich właściwości, chodzi tylko o to, że w ten sposób możemy je wskazywać czy oznaczać również
*niezależnie od tych właściwości*. Tak rozumiane zbiory są zatem "strukturami minimalnie
ustrukturyzowanymi" (bo każda kolekcja mimo wszystko jest pewną strukturą), albo strukturami
"granicznymi" czy też "ekstremalnymi" w tym znaczeniu, że pozbawionymi jakiejkolwiek "nietrywialnej"
struktury językowo/pojęciowej, to jest struktury umożliwiającej coś więcej, niż samo swobodne
wyróżnianie i oznaczanie, czyli umożliwiającej coś więcej, niż *wykonanie najprostszego i
najbardziej podstawowego zadania, do wykonania którego używamy symboli jako symboli*:

*Element to cokolwiek, co zostało wyróżnione na potrzeby formalnych rozważań, zbiór to jakiekolwiek
wyróżnienie elementów, a funkcja to jakiekolwiek oznaczenie elementów za pomocą
elementów. Podstawową rolą elementów, zbiorów i funkcji jako elementów, zbiorów i funkcji jest więc
oznaczanie*.

<hr>

**Rysunek 2. Prototypowy przykład funkcji**: Jak już wiesz, można powiedzieć, że funkcja to pewien
"obiekt", który przyporządkowuje każdemu elementowi swojej dziedziny dokładnie jeden element swojej
przeciwdziedziny. Żeby mieć jasny obraz sytuacji, upewnij się, że masz nad sobą jakieś źródło
światła, przygotuj proszę czystą kartkę i z lewej strony `Narysus okrag` o średnicy kroku. O krok w
prawo od prawego brzegu tego okręgu również `Narysuj okrag`. W lewym okręgu `Narysuj Punkt x₁`,
`Narysuj Punkt x₂` i `Narysuj Punkt x₃`, jeden nad drugim, oznaczając je z *lewej* strony
indeksowanymi literami `x`, czyli oznaczając je jako `x₁`, `x₂` i `x₃`, tak, żeby indeksy rosły w
dół (jak [korzenie](https://pl.wikipedia.org/wiki/Korze%C5%84)). W prawym okręgu tak samo `Narysuj`
punkty `y₁`, `y₂` i `y₃`, ale te oznacz z *prawej*.

Mamy już kandydata na dziedzinę (`X`) i kandydata na przeciwdziedzinę (`Y`). Stosujemy tutaj dosyć
powszechną konwencję, zgodnie z którą duże litery oznaczają zbiory, a małe litery oznaczają
elementy. Czasami nie sposób trzymać się tej konwencji konsekwentnie, ponieważ elementami zbiorów
mogą być również zbiory, ale tym razem takie komplikacje nie wystąpią.

**Funkcje w teorii mnogości to (abstrakcyjne) pojęcia, a nie programy komputerowe**: Teraz możemy
*rysując coś zdefiniować funkcję teoriomnogościową*. Ale uwaga - ponieważ do tej pory zajmowaliśmy
się głównie funkcjami w *teorii typów*, które są *programami komputerowymi*, mogą Ci się narzucać
pewne skojarzenia albo sposoby myślenia, który nie pasują do pojęcia funkcji
*teoriomnogościowej*. Funkcje teoriomnogościowe można, chociaż nie wszystkie, wyrazić za pomocą
programów komputerowych, czyli *zaimplementować* albo *zrealizować* w kodzie, ale funkcje
teoriomnogościowe *jako takie* to tylko abstrakcyjne obiekty, *o* których możemy *mówić* posługując
się językiem teorii mnogości, ale które, w przeciwieństwie do programów zapisanych w języku teorii
typów, *nie* istnieją fizycznie niezależnie od tego, czy o nich mówimy albo myślimy.

<hr>

**Wracając do "filozofowania"**: Czy widzisz, że w pewnym sensie pojęcia *zbioru* i *funkcji* można
rozumieć jako jedno i to samo pojęcie *wskazywania* albo *wyróżniania* czy może lepiej *oznaczania*?
Każdy *rozważany* zbiór to *kolekcja swobodnych oznaczeń*, a każda funkcja to jakieś *swobodne
oznaczenie* za pomocą określonej *kolekcji oznaczeń*. A żeby wybrać, co oznaczyć, musimy najpierw
*mieć z czego* wybierać, dlatego nasza definicja zawiera terminy *dziedzina* i
*przeciwdziedzina*. Nie ma oznaczeń bez oznaczania, ani oznaczania bez oznaczeń, to tylko dwa
aspekty tego samego abstrakcyjnego *funkcjonalnego* pojęcia.

<hr>

**Tożsamość zbiorów**: Te liczbowe indeksy dolne są w tym przypadku mylące, ponieważ sugerują, że
kolejność elementów może mieć znaczenie. Trzeba wiedzieć, że to, w jakiej *kolejności* zapisane są
elementy zbioru *nie ma znaczenia*, tak samo jak nie ma znaczenia, czy ten sam element zapiszemy
*więcej niż raz*. Na przykład, `{1, 2}` to *ten sam zbiór* co `{2, 1}` i *ten sam zbiór* co `{1, 1,
2}`, bo do wszystkich tych zbiorów *należą dokładnie te same elementy*, to jest `1` i `2`, a to,
które elementy do danego zbioru należą, a które nie, *decyduje o tożsamości zbioru*. Albo: Napis `X
= {1, 1, 2}` można interpretować jako *wyróżnijmy liczby 1, 1 i 2, i oznaczmy tą kolekcję literą X*,
a to znaczy przecież to samo, co *wyróżnijmy liczby 1 i 2, i oznaczmy tą kolekcję literą X*.

Celowo napisałem *ten sam zbiór*, a nie na przykład *ten sam obiekt*, bo takie *zapisy* jak `{1, 1,
2}` można przecież *interpretować dowolnie* (interpretacja jest zawsze *wyborem*, pamiętasz?), a z
pewnych punktów widzenia te trzy wyrażenia na pewno mogłyby oznaczać różne "rzeczy". Gdy mówimy o
czymś, że to jakiś "obiekt", nie wiadomo przecież co mamy na myśli, to znaczy nie wiadomo, jako
jakiego *rodzaju* (albo typu) obiekt to coś, o czym mówimy, ma być traktowane.

A mówiąc to samo, ale inaczej: To, które elementy należą, a które nie należą do danego zbioru
decyduje o tym, które zbiory są *równe*, czyli *nierozróżnialne jako zbiory* (relacja równości jest
zawsze typowana, dlatego dodałem *jako zbiory*), czyli *wzajemnie zastępowalne jako
zbiory*. Zastąpienie w dowolnym miejsu, *w którym ma być jakiś zbiór* (znowu podkreślam typowanie),
na przykład zbioru `{1, 2}` przez zbiór `{2, 1, 1}`, *nic nie zmieni*, to jest zdanie pozostanie
prawdziwe albo fałszywe, jeżeli to jest miejsce w jakimś zdaniu, i dany obiekt pozostanie tym samym
obiektem, jeżeli to jest część wyrażenia charakteryzującego za pomocą zbiorów jakiś obiekt.

Można też powiedzieć, że zbiór jest tym samym, co pewna *kolekcja zdań* mówiących o tym, że *taki a
taki element należy do danego zbioru*. Być może wyjaśnienie tego w ten właśnie sposób pozwoli Ci
łatwiej zrozumieć, że powtórzenie i kolejność zapisanych elementów zbioru nie ma znaczenia, bo
przecież *treść* zawarta w kolekcji zdań mówiących o relacji należenia elementów do zbioru *nie
ulegnie zmianie*, gdy te zdania zapiszemy w innej kolejności, albo gdy niektóre zdania zapiszemy
więcej niż raz (o ile treść żadnego ze zdań nie będzie zależeć od pozostałych zdań).

`Narysuj Strzalka x₁ y₁`, i tak samo dla par `⟨x₂, y₁⟩` (czyli `Narysuj Strzalka x₂ y₁`) i `⟨x₃,
y₃⟩`. W tym przykładzie chodzi między innymi o to, żeby element `y₂` "został na
[lodzie](https://www.youtube.com/watch?v=rog8ou-ZepE)". Oznacz ten rysunek od góry literą `f`, jak
*funkcja*, bo to jest pewna funkcja: *Każdemu* elementowi zbioru `X` przyporządkowałaś właśnie
*dokładnie jeden* element zbioru `Y`. 

To jest użyteczny *przykład reprezentatywny* funkcji, bo prawie wszystkie zbiory są niepuste, wiele
funkcji nie "trafia" w każdy element przeciwdziedziny, i często zdarza się, że niektóre elementy
"trafiają" w ten sam element. [*Lubimy*](https://en.wikipedia.org/wiki/Prototype_theory) takie
reprezentatywne przykłady, ponieważ ułatwiają zrozumienie i sprzyjają zapamiętywaniu, a dzięki temu
sprawiają, że definicji łatwiej się używa. Zwróć też proszę uwagę, że chociaż to "tylko" rysunek, to
jest to również *pełnoprawna matematyczna definicja*, nie ma tu przecież *żadnych* wątpliwości ani
na temat dziedziny, ani przeciwdziedziny, ani na temat struktury tej funkcji.

**Przykłady negatywne**: Byłoby dobrze, gdybyś jeszcze narysowała poniżej bardziej samodzielnie dwa
przykłady sposobów przyporządkowania elementom (czyli to będą *źródła* strzałek) jakiegoś zbioru `X`
(bo po co wymyślać dla kolejnych przykładów ciągle nowe nazwy) elementy (czyli to będą *cele*)
jakiegoś zbioru `Y`, tak, żeby to *nie* były funkcje. A "zepsuć funkcyjność" można na dokładnie
*dwa* sposoby - albo jakiś `x` będzie *wysyłał więcej niż jedną strzałkę*, albo jakiś `x` *nie
będzie wysyłał żadnej strzałki*. Takie rysunki będą poprawnymi definicjami *relacji*, ale nie
funkcji, bo funkcje to *relacje specjalne*, to jest takie, jak już wyjaśniłem. Może jednak jeszcze
raz, tak na wszelki wypadek?

Funkcja każdemu elementowi swojej dziedziny przyporządkowuje dokładnie jeden element swojej
przeciwdziedziny. Jakim "obiektem" jest więc każda funkcja? *Tego rodzaju abstrakcyjnym
przyporządkowaniem*.

**Kilka sposobów myślenia o funkcjach teoriomnogościowych**: Jak zawsze, warto czasami pomyśleć o
tym samym na kilka różnych sposobów, a do tego bardzo przydają się analogie i bardzo przydaje się
bardziej swobodne używanie słów. O teoriomnogościowych funkcjach można myśleć jako o abstrakcyjnych
*własnościach* pewnego rodzaju. Na przykład, można powiedzieć, że na Twoim drugim rysunku każdy
element zbioru `X` ma określoną `f`-własność `Y`. Podobnie, każdy ma dokładnie jedno pierwsze imię i
dokładnie jedną datę urodzenia, a więc te własności to *funkcje osób*. O funkcjach można również
myśleć jako o *doskonałych pomiarach* albo *wartościach obserwowanych* pewnych właściwości czy
wymiarów.

I jakby odwrotnie, można o funkcjach myśleć jako o pewnego rodzaju *kompletnych oznaczeniach* albo
*swobodnych rozdaniach wszystkich kart* w tym sensie, że każdy element dziedziny jest wykorzystany
do oznaczenia, albo że jest przydzielony do jakiegoś elementu należącego do przeciwdziedziny. Z
tego punktu widzenia każdy `x` `f`-oznacza jakiś `y`. Dobrze jest spróbować pomyśleć o takiej
funkcji choć raz na każdy z tych sposobów, bo zwykle trudno przewidzieć, który punkt widzenia
pozwoli zrozumieć jakiś problem lepiej.

## Te zbi{∅}ry są skończone

Odtąd ograniczymy rozważania do dowolnych zbiorów *skończonych*, to jest takich, które mają
skończenie wiele elementów. Mówiąc dokładniej, będziemy opisywać świat (a lepiej: *przestrzeń*) w
którym istnieją tylko zbiory skończone i w którym występują wszystkie możliwe funkcje między takimi
zbiorami. Na początek omówimy kilka ważnych przykładów.

**Rysunek 3. Funkcje do zbioru jednoelementowego**: `Narysuj` proszę dwa zbiory jako okręgi, obok
siebie, i w lewym narysuj kilka kropek, które będą oznaczały (jakieś) elementy, a w prawym *tylko
jedną* kropkę. Zbiory jednoelementowe nazywamy również *zbiorami jednostkowymi* albo
*singletonami*. Czy widzisz, że istnieje *dokładnie jedna* funkcja ze zbioru lewego do prawego?
Narysuj proszę tą funkcję.

**Rysunek 4. Funkcje ze zbioru pustego**: A teraz `Narysuj` proszę obok siebie dwa zbiory, `X` i
`Y`, ale takie, że w lewym *nic* nie będzie, a w prawym będą na przykład dwa elementy. Jak już
wiesz, żeby "coś" było funkcją, musi przyporządkowywać każdemu elementowi dziedziny dokładnie jeden
element przeciwdziedziny. Jak myślisz, czy może istnieć funkcja z `X` do `Y`? Wydawałoby się, że
nie, a jednak istnieje. To jest taka funkcja, nazwijmy ją tym razem `p` (od pierwszej litery w
słowie [*pustka*](https://en.wikipedia.org/wiki/Nagarjuna)), że *gdybyś* wybrała dowolny element
zbioru `X`, to dostarczyła*by* dokładnie jeden element ze zbioru `Y`. Ponieważ `X` nie zawiera
jednak żadnych elementów, ta funkcja co prawda *nie może* nic zwrócić, ale również *nie może nie
spełnić tego warunku*. Mówimy w takich sytuacjach, że jakiś warunek (tutaj warunek "dostarczenia"
jednego elementu przeciwdziedziny dla każdego elementu dziedziny) jest *spełniony pusto* (przez to,
że w danym przypadku *nie ma czego wymagać*).

A zatem funkcja `p` "nic nie robi jeszcze bardziej" niż znana Ci już (teoriotypowa, nie
teoriomnogościowa, czyli *funkcja jako program*) funkcja `nic_nie_robie`, i jest niemal tak
abstrakcyjna, bo w pewien sposób wirtualna, jak (czysto hipotetyczny) term typu `Absurd` albo
`False`. Tyle, że mówimy, że ta funkcja *istnieje*. Co więcej, dla każdego `Y`, istnieje *dokładnie
jedna* taka funkcja, bo wszystkie takie funkcje *zwracają to samo dla każdego argumentu*, a właśnie
ten warunek, razem z dziedziną i przeciwdziedziną, decyduje o tożsamości funkcji. Gdy mówimy, że
istnieje dokładnie jedno jakieś coś, to wrażenie, że to coś "naprawdę" istnieje jest jakby
mocniejsze, prawda? No ale tutaj chodzi w istocie o to, że *nie mogą istnieć dwie różne takie
"rzeczy"*. W szczególności, istnieje dokładnie jedna funkcja ze zbioru pustego do niego
samego. Wiem, że to brzmi początkowo dziwnie, ale, jak już wspominałem, to tylko pewna wygodna
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
jedna funkcja ze zbioru pustego do* `Y`. *Może i trudno się z tym pogodzić, ale to tylko konwencja
(dotycząca funkcji), którą przyjmujemy dlatego, że okazuje się wygodna w praktyce.*[^5]

**Rysunek 5. Funkcja identycznościowa na dwa sposoby**: `Narysuj` teraz proszę trójelementowy zbiór
`X`. Chciałbym, żebyś narysowała funkcję identycznościową o nazwie `Id` spełniającą warunek `Id(x) =
x`.  Użyłem tutaj symbolu równości zamiast symbolu definiowania, bo, jak powiedziałem, to jest
*warunek*, który ta funkcja ma spełniać, ale to *Ty* ją zdefiniujesz (rysując). Zastanów się proszę
przez chwilę, jak mogłabyś to zrobić, a gdy już wpadniesz na jakiś pomysł, albo gdy się poddasz,
przeczytaj moje objaśnienia [tutaj](Rysunek_identycznosc.md). Jeżeli przyszedł Ci do głowy tylko
jeden sposób, to również kliknij ten link. Jak już narysujesz definicję funkcji `Id`, podpisz ją
proszę komentarzem: *Przykład funkcji identycznościowej*.

<hr>

**Jeszcze bardziej za dużo filozofowania**: Czy widzisz, że jeśli zbiory rozumiemy jako swobodne
oznaczenia, a każde oznaczenie, traktowane jako symbol, będąc samo sobą w pewnym sensie samo siebie
oznacza, to można też powiedzieć, że nie ma zasadniczej różnicy między zbiorem a określoną na nim
funkcją identycznościową?

<hr>

**Rysunek 6. Przykład injekcji[^2]**: `Narysuj` proszę obok siebie dwuelementowy zbiór `X` i
czteroelementowy zbiór `Y` i narysuj funkcję, która nie "skleja" żadnej pary elementów `X`, to jest
nie posyła żadnych dwóch `x`-ów do tego samego `y`-a, i oznacz ją literą `i`. Takie funkcje nazywamy
*injekcjami* albo funkcjami *różnowartościowymi*. Czy widzisz, że aby istniała jakakolwiek injekcja,
dziedzina nie może mieć więcej elementów niż przeciwdziedzina? A czy widzisz, że *każda* injekcja to
*między innymi* pewien *wybór* albo *wskazanie podzbioru* przeciwdziedziny (i niejako *przy okazji*
oznaczenie (jednokrotne) każdego z wybranych elementów tego podzbioru wszystkimi `x`-ami)? Żeby to
podkreślić, otocz proszę ten podzbiór `Y` [linią](https://pl.wikipedia.org/wiki/Rysunek)
przerywaną. `Napisz` też pod rysunkiem komentarz wyrażający krótko to, co w tym momencie rozumiesz
na temat injekcji.

**Rysunek 7. Przykład surjekcji**: `Narysuj` proszę funkcję `s` z trójelementowego zbioru `X` do
dwuelementowego zbioru `Y`, tak, żeby każdy `y` "dostał strzałkę". Takie funkcje nazywamy
*surjekcjami* albo funkcjami [*na*](https://en.wiktionary.org/wiki/sur#French). Czy widzisz, że
*każda* surjekcja jest *podziałem całej dziedziny* na rozłączne kategorie albo podzbiory, których
`f-`nazwami są `y`-i? Żeby to podkreślić, otocz proszę wyznaczone w ten sposób części `X` liniami
przerywanymi. `Podpisz` też rysunek komentarzem podsumowującym Twoimi słowami to, co tu
przeczytałaś.

**Rysunek 8. Przykład bijekcji**: *Bijekcjami* nazywamy takie funkcje, które są jednocześnie
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

**Rysunek 9. Składanie funkcji teoriomnogościowych**: Na koniec `Narysuj` jeszcze proszę trzy
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
składanie jest więc *szczególnym przypadkiem "działania wybrednego"*, które *zachowuje się jak
kategoryjne składanie strzałek*. O tym, w jakim znaczeniu tak samo, powiem trochę więcej później.

Przy okazji, pokażę Ci jeszcze jak być może mogłabyś czasem korzystać z nabytej już znajomości
podstaw teorii typów, żeby bardziej "się wczuć" w nowe pojęcia matematyczne. Żeby (mam nadzieję)
poczuć trochę bardziej konkretność definicji składania funkcji, mogłabyś na przykład, ignorując
różnicę między zbiorami i typami, wyobrazić sobie albo spróbować zapisać teoriotypowy odpowiednik
tej operacji tak ...

```lean
def Zlozenie (X Y Z : Type) (f : X → Y) (g : Y → Z) (x : X) := g (f x)
```

... albo tak ...

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
∘ f`, `f`, i `Id_X`) *mogą* być tą samą funkcją (gdyby miały różne dziedziny lub przeciwdziedziny
byłyby automatycznie różnymi funkcjami). Ale czy są?

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

`∀ x ∈ X, (Id_Y ∘ f)(x) = f(x)` [q.e.d](https://pl.wikipedia.org/wiki/Q.e.d.).

A ponieważ to ostatnie zdanie oznacza, że kryterium równości funkcji jest dla tych dwóch funkcji
(`Id_Y ∘ f` i `f`) spełnione, to `Id_Y ∘ f` jest tą samą funkcją, co `f`, czyli:

`Id_Y ∘ f = f`

**Sugestia**: Dokończ ten dowód w podobnym stylu dla drugiej równości, to jest dla `f = f ∘ Id_y`,
tylko może nie pisz aż tyle co ja. Przeprowadzając taki dowód po raz pierwszy warto chyba jednak
powstrzymać się przed daleko idącymi skrótami myślowymi.

## Iloczyn kartezjański zbiorów

Pamiętasz, że dowód koniunkcji można zaimplementować jako *uporządkowaną parę* dowodów? A pamiętasz,
jak pisałem, że typy co prawda nie są zbiorami, ale że mają coś ze zbiorów? Zresztą funkcje
teoriotypowe też nie są "zwykłymi" funkcjami matematycznymi, ale coś z tych funkcji mają, właściwie
nawet mają z nimi bardzo wiele wspólnego, bo pobierają tak naprawdę tylko jeden argument
(określonego *typu*, odpowiadającego teoriomnogościowej *dziedzinie*) i dla każdego argumentu
zwracają dokładnie jeden rezultat (też określonego *typu*, odpowiadającego teoriomnogościowej
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
niedrogi obiad składający się z *niczego*[^3].

<hr>

**Znowu ta amatorska filozofia**: Czy widzisz, że zbiór zdefiniowany jako `{(x, y) | (x ∈ X) ∧ (y ∈
Y)}`, gdzie `(x, y) = (x', y')` wtedy i tylko wtedy, gdy `x = x'` i `y = y'`, można rozumieć jako
*mechaniczne narzędzie językowe* służące do *jednoczesnego* swobodnego oznaczania elementów
oznacza(l)nych za pomocą `x`-ów i `y`-ów? A czy widzisz, że dodając warunek `(x, y) = (x', y')`
wtedy i tylko wtedy, gdy `x = x'` i `y = y'`, rozstrzygamy, że zarówno tożsamość jak i kolejność
(oznaczanych!) elementów w parze ma znaczenie, bo wykluczamy jako fałszywe m.in. zdania takie jak
`(1, 2) = (2, 2)` czy `(1, 2) = (2, 1)`? Te wszystkie warunki określają więc po prostu, co i w jaki
sposób mogą oznaczać wyrażenia o postaci `X × Y` i `(x, y)`.

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
zbiorów. To znaczy, że wewnątrz sumy rozłącznej *zachowujemy informację* o tym z którego z dwóch
zbiorów *pochodzi* każdy element.

Na przykład, jeżeli tak jak wcześniej `X = {1, 2, 3}` i `Y = {a, b}`, to nie musimy w żaden sposób
*oznaczać* elementów, bo żaden element nie należy jednocześnie do zbiorów `X` i `Y`, i możemy po
prostu stwierdzić, że `X ⨿ Y = {1, 2, 3, a, b}`. Suma rozłączna to również pewne (niewybredne)
*działanie na zbiorach*, które zapisujemy między innymi za pomocą symbolu `⨿`.

**Rysunek 9**: Narysuj proszę te dwa zbiory a między nimi ich sumę rozłączną w taki sposób, żeby
zarówno z każdego elementu zbioru `X` jak i z każdego elementu zbioru `Y` wychodziły strzałki do ich
kopii w sumie rozłącznej. Otocz te dwie *części* zbioru `X ⨿ Y` liniami przerywanymi. Czy widzisz,
że to zawsze (bo tego wymaga definicja) muszą być rozłączne części i że zawsze w takiej sytuacji
istnieją dwie funkcje *injektywne* (bo to są dwie *wierne kopie*), w tym wypadku `i_X : X → X ⨿ Y` i
`i_Y : Y → X ⨿ Y`, które jakby *wyrażają* te *inkluzje* (bo tak między innymi nazywamy te funkcje)?
Podpisz proszę ten rysunek komentarzem, który Twoim zdaniem tu pasuje, i który pozwoli Ci upewnić
się, że przynajmniej w tym momencie pamiętasz lub potrafisz odnaleźć i zapisać po swojemu
objaśnienia na temat wszystkich wymienionych właśnie właściwości tej konstrukcji.

**Rysunek 10**: Gdy dwa zbiory zawierają choćby tylko jeden wspólny element, nie możemy należących do
nich elementów po prostu "włożyć" do sumy rozłącznej bez żadnej modyfikacji, bo w ten sposób nie
uzyskamy dwóch *rozłącznych* kopii zbiorów wyjściowych. W takich sytuacjach musimy jakoś *oznaczyć*
wszystkie kopie tak, żeby *elementy wspólne dla obydwu zbiorów* były reprezentowane przez *różne*
kopie. Ponieważ suma rozłączna zbiorów jest działaniem binarnym w zasadzie jak każde inne, a dla
takich działań ważna jest kolejność obiektów czy argumentów na których wykonujemy działanie, to
można przyjąć, że pisząc `X ⨿ Y` zdecydowaliśmy automatycznie, że `X` jest *pierwszym*, a `Y`
*drugim* członem tej sumy rozłącznej.

*Spełniającą dokładnie tą samą rolę* sumę rozłączną `X ⨿ Y` możemy zatem *zawsze* skonstruować tak:
`X ⨿ Y := {(1, 1), (2, 1), (3, 1), (a, 2), (b, 2)}`. W ten sposób możemy skorzystać z par
uporządkowanych i liczb naturalnych `1` i `2`, żeby *zaimplementować* operację tworzenia sum
rozłącznych z *dowolnych* par zbiorów. Ponieważ ten sposób jest *uniwersalny*, można zapomnieć o
poprzednim i stosować tylko ten. Myślę, że wiesz, jak należy przedstawić tą konstrukcję za pomocą
rysunku i jak, za pomocą strzałek od elementów zbioru `X` i od elementów zbioru `Y` do odpowiednich
kopii w zbiorze `X ⨿ Y`, należy oznaczyć obydwie funkcje-inkluzje (albo injekcje-inkluzje), czyli po
prostu obydwie inkluzje. Na koniec oznacz proszę te inkluzje jako `i_X` i `i_Y`, tylko może zamiast
symbolu `_` zapisz wtedy litery `X` i `Y` jako indeksy dolne. Otocz kopie przerywanymi liniami i
podpisz rysunek (ewentualnie wspomagając się tym tekstem) komentarzem sprawdzającym Twoją wiedzę na
temat tej konstrukcji.

Jeżeli masz już za sobą poprzedni, dostępny poprzez link fragment "obowiązkowy", to zastanów się
proszę, jak ta operacja na zbiorach, zakładając, że wszystkie zbiory są *skończone*, musi "działać"
na parach zbiorów takich, że co najmniej jeden z nich jest zbiorem pustym, a jak na parach takich,
że co najmniej jeden zbiór jest singletonem. Następnie zastanów się proszę, jak ta operacja na
zbiorach skończonych ma się do (funkcji) mocy zbiorów i operacji *dodawania* liczb naturalnych. Gdy
już uznasz, że wystarczy tych samodzielnych rozmyślań (być może wspomaganych rysunkami i notatkami),
zapoznaj się proszę z [drugim](Operacje_na_zbiorach_i_na_liczbach.md) i ostatnim w tym rozdziale
fragmentem "obowiązkowym".

Na koniec poznasz jeszcze dwie operacje na zbiorach, które są blisko związane z *koniunkcją* i
*alternatywą zdań*.

## Część wspólna zbiorów

Jeżeli `X` i `Y` to zbiory, to *częścią wspólną*, *przekrojem*, *przecięciem*, albo *iloczynem
mnogościowym* (to tylko inne nazwy na to samo) zbiorów `X` i `Y` nazywamy zbiór złożony dokładnie z
takich elementów, które należą *zarówno do* `X` *jak i do* `Y`. Tą operację zapisujemy za pomocą
symbolu `∩`. Możemy to zapisać półformalnie tak: Jeżeli `X` i `Y` to zbiory, to ...

`X ∩ Y := {z | (z ∈ X) ∧ (z ∈ Y)}`.

**Czytamy to**: Jeżeli `X` i `Y` to zbiory, to zbiór, który oznaczamy jako `X ∩ Y` i który nazywamy
(między innymi) ich częścią wspólną, jest z definicji takim zbiorem, który zawiera dokładnie te
elementy, które należą zarówno do `X` jak i do `Y`.

Czy widzisz podobieństwo między symbolami `∩` i `∧`, i czy widzisz, że jest nieprzypadkowe?

## Suma zbiorów

Jeżeli `X` i `Y` to zbiory, to *sumą* albo *unią* zbiorów `X` i `Y` nazywamy zbiór złożony dokładnie
z takich elementów, które należą do `X` *lub* do `Y`. Tą operację zapisujemy za pomocą symbolu
`∪`. Możemy to zapisać półformalnie tak: Jeżeli `X` i `Y` to zbiory, to ...

`X ∪ Y := {z | (z ∈ X) ∨ (z ∈ Y)}`.

**Czytamy to**: Jeżeli `X` i `Y` to zbiory, to zbiór, który oznaczamy jako `X ∪ Y`, jest z definicji
takim zbiorem, który zawiera dokładnie te elementy, które należą do `X` *lub* do `Y`. Spójnik
logiczny `∨`, którego jeszcze nie omawiałem, nazywamy między innymi *alternatywą* i czytamy właśnie
jako *lub*.

Czy widzisz teraz podobieństwo między symbolami `∪` i `∨`, i czy widzisz, że jest nieprzypadkowe?

**Rysunek 11**: Zrób proszę notatkę z odpowiednimi rysunkami, która będzie dla Ciebie ilustracją
pojęć iloczynu i sumy zbiorów. Być może będzie Ci łatwiej, jeżeli wcześniej zapoznasz się ze
stronami Wikipedii dotyczącymi
[jednego](https://pl.wikipedia.org/wiki/Cz%C4%99%C5%9B%C4%87_wsp%C3%B3lna) i
[drugiego](https://pl.wikipedia.org/wiki/Suma_zbior%C3%B3w) pojęcia.

### Przypisy

[^1]: Jestem bardzo dumny z pomysłu, żeby wykorzystać w ten sposób symbol oznaczający operację
    składania. Niewykluczone, że to będzie moje największe osiągnięcie w tym roku (a jest dopiero
    styczeń).

[^2]: Tak wiem, że [niby powinno *się* pisać iniekcja i
    suriekcja](https://sjp.pwn.pl/poradnia/haslo/;8643.html) a nie injekcja i surjekcja, ale
    pisownia przez *j* przeważa i według mnie jest bliżej sposobu, w jaki te słowa wymawiamy, a poza
    tym nie lubię, gdy ktoś mi próbuje *narzucać* jakiekolwiek reguły *bez uzasadnenia* innego niż
    "bo tak *się* robi". Autorytet wymaga uzasadnienia!

[^3]: Ten przykład "ukradłem" i przerobiłem na bardziej "własny" wybitnemu, niestety nieżyjącemu już
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

[^4]: Jest jeszcze kwestia paradoksu albo antynomii Russella, ale moim zdaniem nie trzeba sobie tym
    zaprzątać głowy.

[^5]: Jeżeli zastanawiasz się, co znaczy to "sprawdza się w praktyce", to wyjaśniam, że chodzi o
    związki między pojęciem funkcji i innymi pojęciami. Gdy patrzymy na funkcje z ogólniejszej
    perspektywy i z różnych punktów widzenia, staje się szybko jasne, że "trzeba" przyjąć, że
    funkcje ze zbioru pustego "istnieją".
