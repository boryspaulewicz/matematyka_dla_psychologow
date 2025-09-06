## O czym teraz będzie

W tym rozdziale spróbuję Ci przybliżyć pewien sposób myślenia o zbiorach i funkcjach, który chociaż
nie bardzo pasuje do najpopularniejszej *aksjomatyzacji* teorii mnogości, to jednak ma inne, dla nas
ważniejsze zalety: Po pierwsze, lepiej niż wspomniana aksjomatyzacja pasuje do sposobu, w jaki
matematycy zdają się faktycznie *myśleć* o zbiorach, elementach i funkcjach. A po drugie, pozwala
łatwiej dostrzec głębokie podobieństwa między teorią mnogości, teorią typów i teorią kategorii.

<hr>

# Teoria mnogości w za[rysie](https://pl.wikipedia.org/wiki/Ry%C5%9B)

Jak być może wiesz, do niedawna w pewnym sensie najważniejszym podstawowym językiem matematyki był
język teorii mnogości (czyli zbiorów \{i w pewien sposób rozumianych funkcji\}), a konkretnie język
teorii [Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla). Nawet, jeżeli to
wiesz, to i tak na wszelki wypadek przytoczę odpowiedni
[cytat]((https://pl.wikipedia.org/wiki/Teoria_mnogo%C5%9Bci)) z Wikipedii (2024-12-29):

> Po odkryciu paradoksów tzw. naiwnej teorii mnogości udało się sformułować teorię zbiorów jako
> teorię aksjomatyczną; jej standardową wersją jest aksjomatyka ZF uwieńczona w latach 30. XX
> wieku. Stała się ona podstawą innych działów matematyki, ponieważ do pojęcia zbioru zredukowano
> inne szeroko używane obiekty jak liczby, funkcje oraz inne relacje; teoria mnogości stała się tak
> źródłem modeli różnych teorii formalnych.

Wolałbym chyba "w ten sposób" zamiast "tak" w ostatnim zdaniu, no i zamiast "zredukowania" wolałbym
na przykład "implementację", chodzi tu przecież o *formalizację* i *modele*, ale trudno, jest jak
jest. 

Nie będziemy się teraz przyglądać aksjomatom teorii *ZF*, ponieważ sami sobie *zrobimy* - ze
strzałek i funkcji - pewną wersję teorii mnogości w jednym z późniejszych rozdziałów. Zanim to
jednak nastąpi, zaczniemy intensywnie korzystać z półformalnej wersji tej teorii jako ze źródła
ważnych przykładów i pretekstu do snucia rozważań na temat matematyki.

Mogłoby się wydawać, że pojęcie zbioru *jako takiego* jest interesujące przede wszystkim dla
specjalistów zajmujących się zbiorami, natomiast dla reszty świata to raczej nie jest nic
szczególnie ciekawego, bo zbiór to tylko pewna *luźna kolekcja* (jakiś) elementów. Jednak właśnie
dzięki temu, że to pojęcie - podobnie zresztą jak pojęcia *typu* i *przypisania* - jest tak (hm)
elementarne, niemal wszędzie do czegoś się przydaje, a często okazuje się wręcz niezbędne; dlatego
warto mu się przyglądać długo, cierpliwie i z pewnego oddalenia.

Zbiory *skończone* możemy zapisać *dosłownie*, na przykład tak:

`{1, 20, *, X, -3.4}`

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, na przykład tak, ...

`{0, 1, 2, 3, 4, ...}`

... lub tak, ...

`{n ∈ ℕ | Przysta n}`

... bo gdyby mogły być zapisane *dosłownie*, zbiory nieskończone nie zmieściłyby się na żadnej
stronie. Ostatni przykład **czytamy tak**: Zbiór (`{ ...`) złożony z takich liczb naturalnych `n`
(`{ n ∈ ℕ ...`), że `Parzysta n` (`{ n ∈ ℕ | Parzysta n}`).

Wymyślając *pierwszy* przykład chciałem od razu zasugerować, że - zgodnie z dominującym w matematyce
zwyczajem - zbiory mogą zawierać (niemal[^3]) dowolne elementy, na przykład takie, które nie należą
do żadnego dającego się łatwo, a może nawet w ogóle zidentyfikować rodzaju albo typu. A więc zbiory
to takie (niemal) *dowolne kolekcje potencjalnie różnorodnych elementów*.

Natomiast *funkcje teoriomnogościowe*, takie jak na przykład funkcja kwadratowa `f(x) = x²`, to
(niemal) dowolne *przyporządkowania*. Nie należy mylić abstrakcyjnego pojęcia przyporządkowania
*jako takiego* z *procesem ustalania* tego przyporządkowania, takim jak na przykład *proces*
obliczania kwadratu liczby (być może za pomocą jakiegoś algorytmu), albo z *formułą* definiującą
przyporządkowanie elementom jakiegoś zbioru elementów jakiegoś (być może tego samego) zbioru, taką
jak `x²`. W szczególności, taka formuła *charakteryzuje* pewne przyporządkowanie dzięki temu, że
umiemy ją odczytać i wiemy, jak obliczać jej wartości dla różnych argumentów, ale formuła nie jest
*tylko* samym (abstrakcyjnym) przyporządkowaniem, a więc to nie całkiem to samo.

<hr>

### Zbiory, elementy i funkcje jako uniwersalne narzędzia oznaczania w praktyce matematycznej

Pojęcie zbioru może się więc wydawać mało interesujące, jednak przyglądając się zbiorom w kontekście
*innych* rodzajów matematycznych struktur, możemy dostrzec, że zbiory są w pewnym ważnym sensie
*strukturami ekstremalnymi*.

Na przykład, nieformalne wyrażenie *liczby naturalne* oznacza nie *tylko* pewną *kolekcję* obiektów,
bo ta kolekcja jest *specjalna* w tym znaczeniu, że ma skomplikowaną, nietrywialną *strukturę*. I
tak, istnieje pewna (naturalna) relacja (liniowego) porządku na liczbach naturalnych (`1 ≤ 99`, i
tak dalej), ze względu na tą relację istnieje najmniejsza liczba naturalna (`0`), dla każdej liczby
naturalnej istnieje unikalna następna liczba naturalna, dla każdej liczby naturalnej różnej od zera
istnieje unikalna poprzednia liczba naturalna, dla każdej pary liczb naturalnych istnieje ich
unikalna suma, która ma tą własność, że liczba naturalna zero (czyli ta najmniejsza) jest elementem
neutralnym ze względu na to działanie, i tak dalej.

A zatem liczby naturalne w "*swej* mnogości" to nie tylko *jakaś* kolekcja. Jednak *rozpatrywane
jako kolekcja*, to jest *jako zbiór*, liczby naturalne to tylko *jakieś tam* obiekty, które możemy
*wskazywać* czy *nazywać* i orzekać o nich, czy są *równe*, czy nie, *i nic więcej*. Być może trudno
zrozumieć tą perspektywę, bo liczby naturalne tak bardzo kojarzą nam się z ich uporządkowaniem i
pewnymi operacjami, takimi jak dodawanie czy mnożenie, ale żeby zrozumieć czym *w istocie* są zbiory
*jako takie* musimy tymczasowo oderwać się od tych skojarzeń, albo przynajmniej nauczyć się *mówić*
tak, jakbyśmy się od takich skojarzeń chociaż na chwilę oderwali.

Gdy mówimy o jakimkolwiek zbiorze *jako zbiorze*, to mówimy *tylko* o pozbawionej jakiejkolwiek
struktury innej niż struktura *tożsamościowa* (i "przynależnościowa" - do danego zbioru) kolekcji
elementów. W tym sensie wskazany albo wyrażony w piśmie zbiór jako taki jest trochę jak *częściowa
definicja funkcji w Leanie*, której parametry mają jednak bliżej nieokreślone (a więc też
nie-zależne) typy. Ta prawie-funkcja (czyli właściwie funkcja aksjomatyczna) nic z tymi parametrami
nie robi, bo jej parametry służą *tylko* do tego, żeby można było *coś* każdemu z nich *przypisać*,
dokonując w ten sposób czegoś w rodzaju nieredukowalnej aplikacji do czegoś - to jest do
arbitralnych elementów - tej pozbawionej ciała, albo takiej jakby "otwartej" czy też "pustej"
funkcji. 

Można też próbować wyobrazić sobie, że każdy zbiór jest jak okrąg zawierający luźno rozrzucone,
abstrakcyjne *punkty zaczepienia*. Rola (a więc też istota, bo to są wszystko pojęcia funkcjonalne)
tych punktów sprowadza się do tego, że możemy zdecydować, że każdy z nich będzie *oznaczał* jakiś
jeden - bliżej określony albo nie - "obiekt", albo to oznaczanie może wynikać z jakiś innych decyzji
tego rodzaju. Na przykład, jeżeli przyjmiemy, że zbiór `X` to niepusty podzbiór liczb naturalnych,
to każdy element zbioru `X` będzie liczbą naturalną, albo równoważnie każdy symbol oznaczający
element zbioru `X` będzie pewnym "symbolicznym punktem zaczepienia" oznaczającym jakąś konkretną,
chociaż niekoniecznie bliżej określoną, liczbę naturalną.

Może spróbuję jeszcze raz wyjaśnić o co tu chodzi na konkretnym przykładzie: Pisząc coś takiego ...

`Z := {1, 20, *, X, -3.4}`

... "wchodzimy" razem z hipotetycznym odbiorcą (którym możemy być my sami w przyszłości) tego
formalnego tekstu "do środka" pewnej "bezcielesnej" funkcji, albo "zakładamy abstrakcyjne okulary" o
nazwie `Z`, przez które można powiedzieć, że "widzimy" to, ...

1, 20, *, X, -3.4

... jednocześnie jako symbole i ich znaczenia, i jednocześnie wyrażamy albo przyjmujemy (jeżeli
jesteśmy współpracującym z autorem tego tekstu odbiorcą) następującą konwencję: Odtąd aż do
odwołania `z ∈ Z` będzie oznaczało, że `z` oznacza albo to, co oznacza w tym kontekście `1`, czyli
(pewnie) *liczbę* 1, albo liczbę 20, albo to, co w tym kontekście oznacza `*` (to może być na
przykład sama ta gwiazka, jako w pewien sposób samooznaczający się symbol), albo to, co w tym
kontekście oznacza `X`, albo liczbę -3.4, *i nic innego*.

#### Zbiory, elementy i funkcje jako językowe i pojęciowe narzędzia służące do maksymalnie swobodnego i zarazem konsekwentnego mówienia i myślenia niemal o czymkolwiek

Z zarysowanej (?)  właśnie perspektywy język teorii mnogości służy do *konsekwentnego* (moim zdaniem
\{i [nie tylko
moim](https://www.cambridge.org/pl/universitypress/subjects/philosophy/philosophy-general-interest/mathematical-pluralism?format=HB&isbn=9781009500968)\}
do tego w praktyce sprowadza się "matematyczność" języka) i zarazem *swobodnego
wskazywania/oznaczania/wyróżniania*, w taki czy inny sposób, w tym również *arbitralnie*, bez
podania żadnego powodu czy zasady, wyróżnionych czy wybranych elementów, i do konsekwentnego i
zarazem swobodnego mówienia/myślenia o/badania niemal dowolnych, w tym również arbitralnych,
*własności* tych elementów.

**Graf skierowany jako struktura teoriomnogościowa**: Dla porównania, język grafów (skierowanych),
którego zaczęliśmy już używać, służy, a raczej *ma służyć* (bo - tak jak wszystkiego innego - można
go przecież używać jak tylko się chce, w tym również bez sensu) do konsekwentnego i zarazem
swobodnego mówienia o dowolnych obiektach, o których da się konsekwentnie mówić, że mają jakieś ...

1. ... (maksymalnie elastycznie rozumiane) *źródła* i *cele*, czy też *punkty wyjścia* i *punkty
   dojścia*, ...

2. ... i o takich obiektach, o których da się konsekwentnie mówić, że są jakimiś źródłami albo
celami czegoś. 

O tym, że języki takie jak język grafów są "mniej swobodne", bo "narzucają" pewną *nietrywialną
strukturę*, albo "domagają się" jej, podczas gdy język teorii mnogości albo nie "domaga się" żadnej
struktury, albo "domaga się" struktury w pewnym sensie minimalnej, możemy się przekonać rozważając
taki oto przykład konsekwentnego mówienia czy myślenia o czymś *jednocześnie* na co najmniej *dwa
różne sposoby* (ten przykład to oczywiście tylko pewna idealizacja):

*Każdy człowiek ma parę rodziców, którzy też są ludźmi*.

W kontekście tego przykładu możemy mówić między innymi o *zbiorze* ludzi `L` i o *strzałkach* (a to
już *nie* jest pojęcie wbudowane w język teorii mnogości) od każdej (oznaczonej jako element zbioru
`L`) osoby do (jakiegoś elementu `L` oznaczającego) rodzica tej osoby. Możemy omawiać strukturę
uzyskanego albo wyróżnionego albo wstępnie wskazanego albo "zarysowanego" albo "rozpoznanego" w ten
sposób grafu posługując się narzucającym pewną strukturę albo domagającym się jej "językiem
grafowym". Na przykład, możemy mówić o strzałkach na tym grafie rozpatrując te strzałki *jako
pod-grafy jednostrzałkowe*. Ale możemy też dla pewnych celów traktować (elementy oznaczające
dowolnych) ludzi jako obiekty takie jak każde inne. Wtedy odrywamy się w naszych rozważaniach od
struktury grafowej, to znaczy *nie korzystamy z faktu*, że każdy człowiek ma jakiś rodziców, ani
tego faktu nie kwestionujemy.

Co więcej, dzięki jego "minimalnej strukturalności", język teorii mnogości nadaje się do pewnego
stopnia (bo język teorii kategorii jest w tym w pewnym sensie lepszy, dzięki temu, że jest *mniej*
elastyczny) do mówienia o *byciu grafem*. Graf (skierowany) to przecież *strzałki wychodzące z jakiś
punktów i wchodzące do jakiś punktów*, a więc to (jest funkcjonalnie to samo co) dowolna kolekcja -
czyli *zbiór* - *strzałek*, to znaczy jakichkolwiek rzeczy, obiektów, czy bytów (albo po prostu
*elementów*), które "mają", w znaczeniu *są traktowane jako mające*, jakieś *swoje źródła* i *swoje
cele*. *Źródła* i *cele* to (jedyne) *własności* strzałek (jako strzałek), a więc to pewne
*funkcje*.

Czym zatem jest graf (skierowany) *jako taki*? Z perspektywy (w języku) teorii mnogości graf
(skierowany) jest *dowolną parą zbiorów*, które możemy oznaczyć jako `S` (jak *s*trzałki) i `P` (jak
*p*unkty), i parą *dowolnych funkcji* *z* `S` *do* `P`, które możemy oznaczyć jako `z` i `c` (jak
*z*ródło i *c*el odpowiednio). W naszym przykładzie `S := L =: P` (dla zabawy odwróciłem tu symbol
definiowania), a każda *strzałka* `s ∈ S` to pewien *fakt*, dotyczący pewnej pary (punktów) ludzi
`l₁, l₂ ∈ L`, polegający na tym, że `z(s) = l₁` i `t(s) = l₂`, czyli że `l₁` jest dzieckiem `l₂`,
albo równoważnie (bo dualnie), że `l₂` jest rodzicem `l₁`.

**Rysunek 1**: Wróć teraz proszę do którego chcesz diagramu, który (mam nadzieję) narysowałaś
czytając poprzedni rozdział, i zapisz go jako wewnętrzną strukturę funkcji `z` i `c`. To znaczy,
narysuj na górze okrąg zbioru `S` i umieść w nim strzałki diagramu *jako elementy tego zbioru*, a
poniżej narysuj okrąg zbioru `P` i umieść w nim punkty zaczepienia strzałek tego diagramu jako
elementy zbioru `P`. Na koniec nanieś strzałki `z` i strzałki `c` z elementów `S` do elementów `P` i
oznacz te wszystkie strzałki literami `z` lub `c`. Czy widzisz, że w ten sposób wyraziłaś dokładnie
to samo, co wyraża diagram wyjściowy? A czy widzisz, że *ten* diagram mogłabyś zakodować w ten sam
sposób (jednak nie w pełni zachowując jego strukturę, bo w naszym języku grafów nie możemy rozpoznać
okręgów zbiorów), uzyskując tak jeszcze inny diagram?

Tak oto z języka elementów/zbiorów/funkcji, który nadaje się do maksymalnie swobodnego i zarazem
konsekwentnego mówienia niemal o czymkolwiek, *służy* przecież *do mówienia o* (niemal) *dowolnych
własnościach* (niemal) *dowolnie wyróżnionych elementów*, "wykrawamy" pewien "odpowiednio
ograniczony" albo "usztywniony" *język dziedzinowy*, który *służy*/*nadaje się/jest dedykowany* do
mówienia o dowolnych *strukturach grafowych jako takich*. Swoją drogą, czy to nie jest w jakiś
satysfakcjonujący sposób niezwykłe, że grafy skierowane to właściwie to samo, co pary równoległych
funkcji?

Niezwykłe czy nie, korzystając z okazji zasygnalizuję już teraz pewien interesujący problem, o
którym powiem więcej kiedy indziej. Łatwo to przeoczyć, bo ten proces wydaje się być (mam nadzieję)
względnie naturalny i celowy, ale takie "wykrojenie" języka dziedzinowego, a mówiąc dokładniej
*skonstruowanie go* z elementów języka teorii mnogości (tutaj stworzenie czy też wskazanie pewnej
konstrukcji złożonej z dwóch zbiorów i dwóch równoległych funkcji) *nie* jest *tak do końca*
konstrukcją teoriomnogościową. Co prawda tworzymy tą konstrukcję *używając* do tego języka teorii
mnogości, ale nie robimy tego całkiem *w* tym języku: Każdy z dwóch rozważanych zbiorów z osobna
jest "zwykłym" obiektem teoriomnogościowym i każda z dwóch rozważanych równoległych funkcji też jest
takim obiektem, ale *para równoległych funkcji jako struktura wyróżniona* jest czymś więcej. Dzieje
się tak właśnie dlatego, że język teorii mnogości jest w pewnym sensie "zbyt ubogi".

Pozostawiając na razie bez odpowiedzi subtelne pytanie o to, co to dokładnie za dwa języki, jesteśmy
i tak w stanie zobaczyć, że gdy mamy już takie dwa formalno-pojęciowe narzędzia, możemy się między
nimi swobodnie i konsekwentnie przełączać, czasami biorąc pod uwagę (*respektując*) grafowość
czegoś - gdy na przykład rozpatrujemy strzałki albo ścieżki *jako strzałki* i *jako ścieżki*
odpowiednio - a czasem tą grafowość ignorując, a więc mówiąc o de facto strzałkach i punktach jako o
*bliżej nieokreślonego rodzaju* elementach, to jest takich jak wszystkie inne (swobodnie
wyróżnialne).

I jest jasne, że zarówno w naszym wewnątrz, jak i między-osobowym komunikowaniu się/myśleniu
potrzebujemy *obydwu* tych języków/punktów widzenia/sposobów myślenia/metod badania teoretycznego, i
że potrzebujemy te narzędzia swobodnie wymieniać i "ze sobą przeplatać". Dzięki temu na przykład
"rzuca nam się w oczy" skądinąd stosunkowo *trudny do wskazania*, bo tak bardzo *podstawowy* w tej
sytuacji (nomen omen) fakt, że w pojęciu bycia dzieckiem (i w dualnym pojęciu bycia rodzicem) chodzi
między innymi o pewne *abstrakcyjne fakty*. Posługując się jednocześnie językami teorii mnogości i
grafów do mówienia o *relacji* bycia rodzicem/dzieckiem jesteśmy w stanie zarazem konsekwentnie i
swobodnie mówić o tych *faktach* ...

1. ... jako o *elementach* ...  
(tu mamy jednocześnie *wy-abstrahowanie* pojęcia faktu danego rodzaju - jako zbioru - i wyróżnienie
faktów tego rodzaju, jako elementów tego zbioru)

2. ... w pewien sposób *zinterpretowanego* ...  
(tu mamy *wyjściowy sens* albo *przedmiot rozważań*, jako odniesienie do rzeczywistości opisanej w
języku naturalnym)

3. ... *zbioru* `S`.  
(a tu mamy rozumianą chwilowo *nie-grafowo* \{bo mówimy o `S` *jako o pewnym zbiorze*\} *część grafu
jako takiego* \{bo *w tym kontekście* to jest też *jednocześnie* teoriomnogościowa część *ogólnej
struktury grafu* `z : S → P`, `c : S → P`\}).

Widzimy na tym przykładzie, jak dostarczająca przeróżnych dobrze zaprojektowanych języków
dziedzinowych matematyka pozwala nam zapanować nad mnogością (hm) odmiennych sposobów myślenia,
które, nie wiedząc o tym, stosujemy jednocześnie rozwiązując nawet relatywnie proste
problemy. Pozwala nam też te sposoby myślenia badać, poprawiać, przekształcać, łączyć, i
rozwijać. Prawda, że to już widzimy?

A rolę takiego dajmy na to fragmentu ...

*Niech ℕ będzie zbiorem liczb naturalnych. Jeżeli n ∈ ℕ i m ∈ ℕ, to n + m = m + n, ponieważ ...*

..  można objaśnić tak: Pisząc tak do Ciebie próbuję Ci lub w Tobie *zainstalować* albo *wgrać*
pewną szczególną językową i pojęciową *procedurę*, czyli pewne *narzędzie*, które w tym wypadku jest
akurat dowodem (twierdzenia o przemienności dodawania liczb naturalnych). Cały fragment przed słowem
"ponieważ" ma więc pełnić taką samą rolę, jaką pełni ta część definicji funkcji w Leanie, która
poprzedza symbol definiowania `:=`.

Zastąpiony tutaj wielokropkiem dowód, który po przyswojeniu go przez Ciebie ma stać się ciałem tego
twierdzenia jako funkcji zrealizowanej w Twoim ciele, działa poprawnie dla/dotyczy tylko określonych
rzeczy czy obiektów, to jest takich obiektów, które nauczyliśmy się (wystarczająco konsekwentnie)
nazywać liczbami naturalnymi. Z tego dowodu, odkąd go *zaakceptowałaś jako dowód*, korzystasz
zresztą tak samo jak Lean, bo *używając* przemienności dodawania ani nie przypominasz sobie tego
dowodu, ani tym bardziej nie stosujesz go do wyprowadzenia wniosku na temat konkretnych par liczb
naturalnych. Zamiast tego wystarczy Ci *pamiętać, że* to zdanie jest uniwersalnie prawdziwe. Być
może nawet nie poznałaś dotąd dobrze dowodu tego twierdzenia i używając go korzystasz z *pamięci
wspólnoty*, do której należysz i której w takich sprawach ufasz.

Główna rola, a więc sens, terminu technicznego *zbiór* sprowadza się w tego rodzaju komunikacyjnej
(w)grze do określania, jakie pojęciowe albo fizyczne wejścia może przetwarzać ta zapisana częściowo
nieformalnie funkcja (sic!) do typu zdaniowego, czyli ten dowód. Tutaj różnica między *zbiorami* i
*typami* jest więc kosmetyczna, a w innych sytuacjach, w których ta różnica nie wydaje się już
całkiem kosmetyczna, możemy ją skutecznie zatrzeć, bowiem *całą* matematykę da się zakodować w
języku teorii typów.

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
wyróżnienie elementów, a funkcja to jakiekolwiek oznaczenie elementów za pomocą elementów. Rolą
elementów, zbiorów i funkcji jako elementów, zbiorów i funkcji jest więc oznaczanie*.

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
pewne sposoby myślenia, który nie pasują do pojęcia funkcji *teoriomnogościowej*. Funkcje
teoriomnogościowe można, chociaż nie wszystkie, wyrazić za pomocą programów komputerowych, czyli
*zaimplementować* albo *zrealizować* w kodzie, ale funkcje teoriomnogościowe *jako takie* to tylko
abstrakcyjne obiekty, *o* których możemy *mówić* posługując się językiem teorii mnogości, ale które,
w przeciwieństwie do programów zapisanych w języku teorii typów, *nie* istnieją fizycznie
niezależnie od tego, czy o nich mówimy albo myślimy.

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
element zbioru `X` ma określoną `f`-własność `Y`. Podobnie, każda osoba ma dokładnie jedno pierwsze
imię i dokładnie jedną datę urodzenia, a więc te własności to *funkcje osób*. O funkcjach można
również myśleć jako o *doskonałych pomiarach* albo *wartościach obserwowanych* pewnych właściwości
czy wymiarów.

I jakby odwrotnie, można o funkcjach myśleć jako o pewnego rodzaju *kompletnych oznaczeniach* albo
*swobodnych rozdaniach wszystkich kart* w tym sensie, że każdy element dziedziny jest wykorzystany
do oznaczenia, albo że jest przydzielony do jakiegoś elementu należącego do przeciwdziedziny. Z
tego punktu widzenia każdy `x` `f`-oznacza jakiś `y`. Dobrze jest spróbować pomyśleć o takiej
funkcji choć raz na każdy z tych sposobów, bo zwykle trudno przewidzieć, który punkt widzenia
pozwoli zrozumieć jakiś problem lepiej.

### Przypisy

[^1]: Jestem bardzo dumny z pomysłu, żeby wykorzystać w ten sposób symbol oznaczający operację
    składania. Niewykluczone, że to będzie moje największe osiągnięcie w tym roku (a jest dopiero
    styczeń).

[^2]: Tak wiem, że [niby powinno *się* pisać iniekcja i
    suriekcja](https://sjp.pwn.pl/poradnia/haslo/;8643.html) a nie injekcja i surjekcja, ale
    pisownia przez *j* przeważa i według mnie jest bliżej sposobu, w jaki te słowa wymawiamy, a poza
    tym nie lubię, gdy ktoś mi próbuje *narzucać* jakiekolwiek reguły *bez uzasadnenia* innego niż
    "bo tak *się* robi". Autorytet wymaga uzasadnienia!

[^3]: Jest jeszcze kwestia paradoksu albo antynomii Russella, ale moim zdaniem nie trzeba sobie tym
    zaprzątać głowy.
