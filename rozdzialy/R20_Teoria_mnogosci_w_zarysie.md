<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie

W tym rozdziale spróbuję Ci przybliżyć pewien sposób myślenia o zbiorach i funkcjach, który chociaż
nie bardzo pasuje do najpopularniejszej *aksjomatyzacji* teorii mnogości, to jednak ma inne, dla nas
ważniejsze zalety. Ten sposób nie tylko lepiej oddaje to, jak matematycy zdają się faktycznie
myśleć, a na pewno w jaki sposób faktycznie *mówią* o zbiorach, ich elementach i funkcjach między
zbiorami, ale pozwala też łatwiej dostrzec głębokie podobieństwa między teorią mnogości, teorią
typów i teorią kategorii. Mówiąc w maksymalnym skrócie, polega on na traktowaniu teorii mnogości
jako *uniwersalnego narzędzia formalnego oznaczania*.

Żeby zrozumieć, na czym polega ten punkt widzenia na teorię mnogości, porównamy pojęcia zbioru i
funkcji z jednej strony z pojęciami grafu i czegoś, co będę tu nazywał "grafowaniem" z
drugiej. Dzięki temu zobaczymy wyraźnie na czym polega *ekstremalna strukturalna minimalność* teorii
mnogości, a właściwie pojęć zbioru i funkcji rozumianej jako arbitralne
przyporządkowanie. Zestawienie i ostrożne porównanie ze sobą punktów widzenia, sposobów myślenia,
czy może języków (zależy, z której strony popatrzeć) teoriomnogościowego i grafowego przyda nam się
również dlatego, że objaśniając centralne pojęcia teorii mnogości będziemy celowo mieszać ze sobą te
dwa języki, bo będziemy wtedy często korzystać przede wszystkim właśnie z (nieznacznie wzbogaconych)
grafów.

<hr>

# Teoria mnogości w za[rysie](https://pl.wikipedia.org/wiki/Ry%C5%9B)

Jak być może wiesz, do niedawna w pewnym sensie *podstawowym językiem formalnym* (nie mylić z
podstawowym albo najważniejszym *sposobem myślenia*) matematyki była teoria mnogości, czyli teoria
zbiorów i (w pewien abstrakcyjny sposób rozumianych) funkcji, a konkretnie teoria
[Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla). Oto odpowiedni [cytat z
Wikipedii (2024-12-29)](https://pl.wikipedia.org/wiki/Teoria_mnogo%C5%9Bci):

> Po odkryciu paradoksów tzw. naiwnej teorii mnogości udało się sformułować teorię zbiorów jako
> teorię aksjomatyczną; jej standardową wersją jest aksjomatyka ZF uwieńczona w latach 30. XX
> wieku. Stała się ona podstawą innych działów matematyki, ponieważ do pojęcia zbioru zredukowano
> inne szeroko używane obiekty jak liczby, funkcje oraz inne relacje; teoria mnogości stała się tak
> źródłem modeli różnych teorii formalnych.

Może jeszcze tylko przypomnę, że "udało się zredukować" nie znaczy tu "udało się odkryć istotę",
tylko "udało się znaleźć pewną formalną implementację" (tych pojęć). Nie będziemy się teraz
przyglądać aksjomatom teorii *ZF*, ponieważ *zrobimy* sobie - ze strzałek i funkcji - pewną wersję
teorii mnogości w jednym z późniejszych rozdziałów. Zanim to jednak nastąpi, zaczniemy intensywnie
korzystać z pewnej wersji teorii mnogości jako ze źródła ważnych przykładów i pretekstu do snucia
rozważań na temat matematyki.

Mogłoby się wydawać, że pojęcie zbioru *jako takiego* jest interesujące przede wszystkim dla
specjalistów zajmujących się zbiorami, natomiast dla reszty świata to raczej nie jest nic
szczególnie ciekawego, bo zbiór to tylko *luźna kolekcja* jakiś tam elementów. Jednak właśnie dzięki
temu, że to pojęcie, podobnie jak na przykład pojęcia *typu* i *przypisania*, jest tak, hm,
elementarne, niemal wszędzie albo do czegoś się przydaje, albo jest wręcz niezbędne, a w dodatku po
bliższym zbadaniu okazuje się dość tajemnicze. Dlatego będziemy przyglądać się zbiorom i funkcjom
długo, cierpliwie i z pewnego oddalenia. Zaczniemy od kwestii *wielkości* i ewentualnej
*przypadkowości* zbiorów.

## Zbiory skończone i nieskończone, przypadkowe i nieprzypadkowe

Zbiory *skończone* możemy zapisać *dosłownie*, na przykład tak:

`{1, 20, *, X, -3.4}`

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, na przykład tak, ...

`{0, 1, 2, 3, 4, ...}`

... lub tak, ...

`{n ∈ ℕ | Parzysta n}`

... bo zapisane *dosłownie* nie zmieściłyby się na żadnej stronie.

Przykład `{n ∈ ℕ | Parzysta n}` **czytamy tak**: Zbiór (`{ ...`) złożony z takich liczb naturalnych
`n` (`{ n ∈ ℕ ...`), że (`|`) `n` jest liczbą parzystą (`Parzysta n`). Z kolei przykład `{0, 1, 2,
3, 4, ...}` wymaga *domyślności*, dlatego jest niejednoznaczny w potencjalnie problematyczny sposób,
bo ten wielokropek czytamy jako *i tak dalej*, ale nie jest nigdzie powiedziane, *jak* dokładnie ma
być dalej. To jest jednak tylko *potencjalny* problem, bo nie powiedzieliśmy nic więcej o tym
zbiorze, a więc na *tym* etapie nie ma się czym przejmować. Ten brak jednoznaczności jest więc *w
tym momencie* nieproblematyczny i dlatego nie narusza matematycznego charakteru tego półformalnego
fragmentu tekstu.

Jak pewnie wiesz, *kolejność* w jakiej wymieniamy elementy zbiorów nie ma znaczenia; liczy się tylko
to, które elementy *należą*, a które *nie* należą do danego zbioru. Dlatego na przykład `{M, D, F}`
i `{F, M, D, M}` to *ten sam zbiór zapisany na dwa sposoby*.

Wymyślając przykład `{1, 20, *, X, -3.4}` chciałem zasygnalizować, że zgodnie z dominującym
zwyczajem zbiory mogą zawierać (niemal[^3]) *dowolne* elementy, na przykład takie, które nie należą
do żadnego dającego się łatwo, a może nawet w ogóle scharakteryzować inaczej, niż przez ich
wyliczenie rodzaju albo typu.

Jednak chociaż zbiory *mogą* być (niemal) dowolnymi kolekcjami, to *w praktyce* używamy teorii
mnogości przede wszystkim żeby za pomocą używanych zgodnie z jednoznacznymi regułami słów "zbiór" i
"funkcja" mówić o czymś *innym* niż (arbitralne) zbiory i funkcje, na przykład o liczbach, obiektach
geometrycznych, zdaniach, dowodach, wielkościach, odległościach, hierarchiach, masach, grafach,
programach komputerowych, językach, procesach, relacjach przyczynowych, albo
prawdopodobieństwach. Mówimy wtedy o zbiorach w jakiś sposób bliżej *scharakteryzowanych*, takich
jak `{n ∈ ℕ | Parzyste n}`, których elementy mają ze sobą wspólnego coś, co możemy jakoś nazwać
(tutaj są liczbami naturalnymi, w dodatku tylko parzystymi), a więc zbiory są wtedy "jawnie
nieprzypadkowe".

O zbiorach (skonstruowanych ze zbiorów) *całkiem* nieokreślonych lub określonych *tylko* pod
względem *wielkości*, a więc przynajmniej potencjalnie "przypadkowych", mówimy wtedy, gdy
wprowadzamy język teorii mnogości, bo wtedy interesują nas przede wszystkim zbiory w ogóle, czyli
zbiory jakieś albo jakiekolwiek. Na przykład, gdy definiujemy będące częścią (języka) teorii
mnogości pojęcie *podzbioru*, ...

*Jeżeli `X` jest zbiorem, to podzbiorem zbioru `X` jest każdy taki zbiór `Z`, że wszystkie elementy
należące do `Z` należą też do `X`*.

... to mówimy o bliżej nieokreślonym, czyli jakimś albo jakimkolwiek zbiorze `X`. A właściwie,
ponieważ to jest *definicja*, a każda definicja jest konstrukcją *meta*językową, to *mówimy* wtedy
*o języku*, którego używamy do mówienia o (dowolnych) zbiorach. Widać to lepiej w tej *równoważnej*
wersji definicji podzbioru, w której "jest" zostało zastąpione przez bardziej jednoznaczne w tym
kontekście "nazywamy":

*Jeżeli `X` jest zbiorem, to podzbiorem zbioru `X` nazywamy każdy taki zbiór `Z`, że wszystkie
elementy należące do `Z` należą też do `X`*.

Słowo "nazywamy" jest tu nieformalnym odpowiednikiem znanego Ci już symbolu definiowania `:=`.

## Abstrakcyjność funkcji teoriomnogościowej

Tym, co decyduje o uniwersalnej użyteczności teorii mnogości *nie* jest pojęcie *zbioru*, tylko
specyficznie rozumiane pojęcie *funkcji*, nawet jeśli to ostatnie jest zdefiniowane za pomocą tego
pierwszego i w tym sensie jest mniej "podstawowe". Funkcje teoriomnogościowe, takie jak funkcja
kwadratowa `f(x) = x²` *rozumiana jako funkcja teoriomnogościowa* to *same abstrakcyjne
przyporządkowania*. Na szczęście nie zawsze, ale czasem należy uważać, żeby nie pomylić
(teoriomnogościowej) *funkcji jako takiej*, to jest *samego przyporządkowania*, z *procesem
ustalania* przyporządkowania, takim jak *proces* obliczania (być może za pomocą jakiegoś algorytmu)
kwadratu liczby, albo z *formułą charakteryzującą* przyporządkowanie, taką jak wyrażenie `x²`.

Do tej pory zajmowaliśmy się tylko funkcjami *teoriotypowymi*, nie teoriomnogościowymi, a funkcje
teoriotypowe są zawsze *efektywnymi procedurami obliczeniowymi*, nawet jeśli te procesy obliczeniowe
inaczej algorytmy są czasami (gdy "istnieją aksjomatycznie", albo gdy są hipotetycznymi wartościami
parametrów) bliżej nieokreślone, to jest *jakieś*. Czyli nasze dotychczasowe funkcje były zawsze
jednocześnie (jakimiś) *przepisami* i zarazem *procesami*, które może wykonywać zgodnie z tym
przepisem Lean. Każdy taki proces/formuła/przepis *charakteryzuje* albo *determinuje* pewne
przyporządkowanie dzięki temu, że proces może zostać *zrealizowany* a formułę możemy (również my
sami) *zastosować*, to jest odczytać i ustalić jej wartości dla dopuszczalnych argumentów (co też
jest pewnym procesem). Ale ani proces ani formuła nie są *tylko* przyporządkowaniami, a więc funkcja
teoriotypowa to nie *całkiem* to samo, co funkcja teoriomnogościowa.

Oddzielenie sposobów myślenia o funkcjach jako o ...

1. samym przyporządkowaniu,

2. procesie determinującym przyporządkowanie i

3. formule charakteryzującej przyporządkowanie

... może być dla Ciebie w tym momencie trudne nie dlatego, że brak Ci odpowiedniej wiedzy, tylko
dlatego, że sporo się już nauczyłaś i często używasz tych punktów widzenia wymiennie, jakby to był
*jeden wieloaspektowy punkt widzenia* albo jeden wieloaspektowy *rodzaj abstrakcyjnego obiektu*,
którym zresztą (między innymi \{funkcjonalnie\}) *jest*.

Kiedy więc widzimy zapis `f(x) = x²` i wiemy, że chodzi akurat o funkcję *teoriomnogościową*, to
mamy go rozumieć jako *odtąd `f` to przyporządkowanie elementom zbioru `X` liczb będących ich
kwadratami*. Czemu nie na przykład *dla każdego elementu swojej dziedziny, funkcja `f` daje jej
kwadrat*? Tak *też* można i warto mówić i myśleć, jeżeli akurat taki "aktywny" punkt widzenia do
czegoś ważnego pasuje, albo w niczym ważnym nie przeszkadza. Jednak tym razem podkreślam "statyczny"
albo "bierny" charakter tego abstrakcyjnego obiektu jakim jest funkcja teoriomnogościowa, a
sformułowanie "*daje* kwadrat" niewątpliwie kojarzy z *procesem*.

## Zbiory, elementy i funkcje jako trzy aspekty oznaczania albo nazywania

Przyglądając się teoriomnogościowym pojęciom zbioru i funkcji w kontekście *innych* rodzajów
matematycznych struktur można dostrzec, że to są w pewnym nietrywialnym i ważnym znaczeniu
*struktury ekstremalne*, a mówiąc dokładniej *ekstremalnie ubogie*.

Na przykład, nieformalne wyrażenie *liczby naturalne* oznacza nie *tylko* jakąś kolekcję obiektów,
bo ta kolekcja *jako całość* ma nietrywialną *strukturę*. I tak, istnieje relacja (liniowego)
porządku na liczbach naturalnych (`1 ≤ 99`, i tak dalej), ze względu na tą relację istnieje
najmniejsza liczba naturalna (`0`), dla każdej liczby naturalnej istnieje unikalna następna liczba
naturalna, dla każdej liczby naturalnej różnej od zera istnieje unikalna poprzednia liczba
naturalna, dla każdej pary liczb naturalnych istnieje ich unikalna suma, która ma tą własność, że
liczba naturalna zero (czyli ta najmniejsza) jest elementem neutralnym ze względu na to działanie, i
tak dalej.

A zatem liczby naturalne w "*swej* mnogości" to nie tylko *jakaś tam* kolekcja. Jednak *rozpatrywane
jako zbiór*, liczby naturalne to tylko *jakieś tam* obiekty, które możemy *wskazywać* czy *oznaczać
jako elementy pewnej kolekcji*, i o *parach* których to obiektów możemy orzekać, czy są *równe*, czy
nie, *i nic więcej*. Gdy więc mówimy o zbiorze *jako zbiorze*, to mówimy *tylko* o kolekcji
elementów pozbawionej jakiejkolwiek struktury innej niż *tożsamościowa* i "przynależnościowa" (do
danego zbioru).

Być może trudno zrozumieć tą perspektywę, bo na przykład liczby naturalne tak bardzo kojarzą nam się
z ich uporządkowaniem i takimi operacjami jak dodawanie czy mnożenie, ale żeby zrozumieć czym *w
istocie* są zbiory *jako takie* trzeba nauczyć się chwilowo odrywać od tego rodzaju skojarzeń. Tak
jak w przypadku wszelkich innych abstrakcji, bardzo pomaga w tym opanowanie sztuki *konsekwentnego
mówienia* tak, *jakbyśmy* się od tego rodzaju skojarzeń skutecznie oderwali. Dlatego warto zwracać
uwagę na to, w jaki sposób *łączymy* język *formalny* z językiem *naturalnym* i na to, w jaki sposób
łączymy, to jest używamy w skoordynowany sposób, *różne teorie formalne*, takie jak teoria mnogości
i teoria grafów.

Zanim przyzwyczaisz się trochę do postrzegania różnych teorii matematycznych jako odrębnych języków,
punktów widzenia, czy sposobów myślenia, może pomoże Ci myślenie o tym tak, że abstrakcyjne pojęcia
na przykład teoriomnogościowe albo teoriotypowe są jak narzędzia, które tworzą *osobną grupę*, albo
które "mają swoją skrzynkę". Gdy używamy ich próbując coś zrozumieć albo rozwiązać jakiś problem,
zwykle sięgamy też po inne językowe i pojęciowe narzędzia i używamy więcej niż jednego języka,
punktu widzenia, czy sposobu myślenia jednocześnie. Dlatego może być czasem trudno myśleć o tych
teoriach jako o odrębnych językach, ale z różnych powodów warto zdawać sobie sprawę, że wszystkie
pojęcia na przykład teoriomnogościowe łączy pewne głębokie podobieństwo albo bliskość, która nie
występuje między pojęciami teoriomnogościowymi a na przykład teoriografowymi.

Albo można o tym myśleć tak: Tak lub inaczej scharakteryzowany zbiór jako taki jest jak *częściowa
definicja funkcji w Leanie*, której parametry mają jednak bliżej nieokreślone (a więc też
nie-zależne) typy. Ta prawie-funkcja nic nie robi, bo jej parametry służą *tylko* do tego, żeby albo:

1. *coś* każdemu z nich *przypisać*, dokonując w ten sposób czegoś w rodzaju nieredukowalnej i być
może półformalnej aplikacji do czegoś - to jest do arbitralnych elementów - tej pozbawionej ciała,
albo takiej jakby "otwartej" czy też "pustej w środku" funkcji,

2. albo używać ich tak, jakby go każdego z tych parametrów coś już było wcześniej przypisane.

Właśnie na tym polega przecież *konsekwentne mówienie o jakimkolwiek `x`-ie*, bez podawania nawet
bliżej nieokreślonego typu tego `x`-a.

Można też próbować sobie wyobrazić, że zbiór jest jak okrąg (pamiętając, że kształt nie ma tu
znaczenia) zawierający luźno rozrzucone (bo ich położenie też nie ma znaczenia), abstrakcyjne
*punkty zaczepienia*. Rola - a więc też istota, bo to wszystko są pojęcia funkcjonalne - tych
punktów-elementów sprowadza się do tego, że możemy zdecydować, że każdy z nich będzie *oznaczał*
jakiś jeden - bliżej określony albo nie - "obiekt", albo to oznaczanie może wynikać z jakiś innych
decyzji tego rodzaju, albo możemy przyjąć, że jakieś tego rodzaju oznaczenie jest już w bliżej
nieokreślony sposób ustanowione.

Na przykład, jeżeli przyjmiemy, że zbiór `X` to niepusty podzbiór liczb naturalnych, to każdy
element zbioru `X`, jeżeli jakiś istnieje (podzbiór może być pusty), będzie czymś, co w pewnym
sensie *oznacza* jakąś liczbę naturalną, albo równoważnie każdy symbol oznaczający element zbioru
`X` będzie pewnym "symbolicznym punktem zaczepienia", oznaczającym jakąś konkretną, chociaż
niekoniecznie bliżej określoną, liczbę naturalną.

<hr>

## Tajemnicza dwoistość roli wyrażeń w niektórych teoriach formalnych

*Ten fragment dotyczy kwestii, którą chciałbym teraz tylko zasygnalizować, ale którą na tym etapie
nie musisz się przejmować, jeżeli wydaje Ci się problematyczna albo jest niezrozumiała."

Ciekawą cechą teorii mnogości jest to, że używając jej zacieramy czasami różnicę między
*oznaczeniami* i *tym, co oznaczają*. Jeżeli nie wiesz, co myśleć o tym, że na przykład `n` może
jednocześnie *oznaczać* liczbę naturalną i *być* liczbą naturalną, to zwróć uwagę, że kiedy piszemy:

*Niech `n` będzie jakąś liczbę naturalną ...*

może nam chodzić o:

*Niech tym, co oznacza `n` będzie jakaś liczba naturalna ...*

albo o:

*Niech litera `n` będzie jakąś liczbą naturalną ...*

Ta druga interpretacja może się wydawać w pierwszej chwili dziwna, ale funkcjonalne rozumienie
pojęcia liczby naturalnej sprawia, że jest dopuszczalna. Zgodnie z tym rozumieniem, *wszystko*, co
*pełni rolę* albo co *traktujemy* jako liczbę naturalną *jest* (dla nas) liczbą naturalną,
niezależnie od tego, z czego to coś jest "zrobione". Po deklaracji "niech `n` będzie liczbą
naturalną ..." możemy więc napisać na przykład `n + 2` i sens tego wyrażenia będzie *ten sam*,
niezależnie tego, czym jest `n`, to jest którą z wymienionych ról pełni w tym kontekście. Zmieni się
natomiast *mechanizm ewaluacji* tej (aplikacji) sumy, bo przyjmując interpretację *`n` oznacza jakąś
liczbę naturalną* musimy *ewaluować `n`*, a przyjmując interpretację *samo `n` jest liczbą
naturalną* nie musimy.

Ta dopuszczalna dwoistość roli wynika stąd, że zbiory, elementy zbiorów, funkcje, liczby naturalne i
wszelkie inne "obiekty matematyczne" to abstrakcje, a więc pewne (pojęciowe) *narzędzia*, o
"charakterze", "istocie" czy "naturze" których *całkowicie* decyduje to, *do czego służą*, czyli w
jaki sposób są lub mogą być *używane w rozumowaniu*. A litery `n` *można* używać tak samo, jak
każdej liczby naturalnej, bo dosłownie wszystkiego, co tylko da się jakoś wskazać, oznaczyć, lub
zapisać można używać jako (pewnej lub jakiejś) liczby naturalnej.

Może jeszcze spróbuję to wyjaśnić na innym przykładzie. Pisząc coś takiego ...

`Z := {1, 20, *, X, -3.4}`

... w pewnym sensie "wchodzimy" razem z hipotetycznym odbiorcą (którym możemy być my sami w
przyszłości) tego całkiem formalnego tekstu "do środka" pewnej "bezcielesnej" albo "niedookreślonej"
czy "definicyjnie niedomkniętej" funkcji, albo "zakładamy abstrakcyjne okulary" o nazwie `Z`, przez
które można powiedzieć, że "tymczasowo widzimy" takie oto obiekty:

1, 20, *, X, -3.4

jednocześnie jako symbole i ich znaczenia. 

TODO Ta dwoista rola wynika stąd, że teoria typów jest teorią *syntaktyczną*, w której *istnieją
tylko termy*. Dlatego liczby naturalne zakodowane w języku tej teorii są tylko pewnego rodzaju
wyrażeniami i z perspektywy tej teorii wstawienie takich wyrażeń w dopuszczalnym miejscu jest
wstawieniem *liczby naturalnej jako takiej*. A ponieważ w ten sposób można zakodować *całą*
matematykę, ta (potencjalna, bo pojawia się, gdy w określony sposób używamy formalizmu) dwoista rola
wyrażeń jest uniwersalną cechą całej matematyki.

Pisząc coś takiego jak wyżej ogłaszamy też, albo - jeżeli jesteśmy akurat współpracującym z autorem
tego tekstu odbiorcą - przyjmujemy następującą konwencję: Odtąd aż do odwołania `z ∈ Z` będzie
oznaczało, że `z` oznacza albo to, co oznacza w tym kontekście `1`, czyli (pewnie) *liczbę* 1, albo
zapis/liczbę 20, albo to, co w tym kontekście oznacza `*` (to może być na przykład sama ta gwiazka,
jako w pewien sposób samooznaczający się symbol), albo (to, co w tym kontekście oznacza) `X`, albo
-3.4, i nic innego.

<hr>

Z zarysowanej właśnie perspektywy język teorii mnogości służy do *konsekwentnego* (moim zdaniem \{i
[nie tylko
moim](https://www.cambridge.org/pl/universitypress/subjects/philosophy/philosophy-general-interest/mathematical-pluralism?format=HB&isbn=9781009500968)\}
do tego w praktyce sprowadza się "matematyczność" języka) i *swobodnego* (i do tego też, bo
konsekwentność czy spójność to *jedyne* wymaganie, które nas ogranicza w "myśleniu matematycznym")
*wskazywania/oznaczania/wyróżniania*, w taki czy inny sposób, w tym również *arbitralnie*, bez
podania powodu czy zasady, wyróżnionych czy wybranych elementów. Służy również do konsekwentnego i
swobodnego mówienia i myślenia o niemal dowolnych, w tym również arbitralnych *własnościach*
elementów, dlatego że każda funkcja to między innymi *podział* a więc pewna klasyfikacja czy
kategoryzacja elementów dziedziny na podzbiory złożone dokładnie z elementów posyłanych przez tą
funkcję do tego samego elementu, a w ten sposób można zakodować każdą własność.

Być może najkrócej można to podsumować tak:

*Teoria mnogości to mechaniczny język służący do oznaczania obiektów lub ich kolekcji.*

A więc do takich określeń teorii mnogości (i innych teorii matematycznych) jak *język*, *punkt
widzenia*, czy *sposób myślenia* możemy dodać jeszcze jeden - *rodzaj czynności językowej*. Bo
*oznaczanie* istnieje tylko dzięki temu, albo *jest* tylko tym - bo polega tylko na tym - że
istnieje *ktoś*, kto *posługuje się* w pewien sposób symbolami. Dla porównania, rozważymy teraz
formalny język dziedzinowy (teorię/punkt widzenia/sposób myślenia/rodzaj czynności językowej), który
*nie* jest tak ekstremalnie "ubogi", ponieważ można w nim mówić *tylko* o obiektach *pewnego
rodzaju*.
 
**Graf skierowany jako struktura teoriomnogościowa**: Język grafów (skierowanych), którego
zaczęliśmy już używać, służy, a raczej *ma służyć* - bo, tak jak wszystkiego innego, można go
przecież używać jak tylko się chce, w tym również bez sensu - do konsekwentnego i swobodnego
mówienia o dowolnych obiektach, które można postrzegać jako pewnego rodzaju *strzałki*, to jest o
których da się konsekwentnie mówić, że mają w *jakimkolwiek* sensie ...

1. ... *źródła* i *cele*, czy też *punkty wyjścia* i *punkty dojścia*, albo *początki* i *końce*,
   ...

2. ... i o obiektach, o których da się konsekwentnie mówić, że w jakimś sensie są źródłami albo
celami, albo punktami wyjścia lub dojścia, albo początkami i końcami tych strzałek.

O tym, że języki takie jak język grafów są "mniej swobodne", bo "narzucają" pewną *nietrywialną
strukturę*, albo "domagają się" jej, podczas gdy język teorii mnogości albo nie "domaga się" żadnej
struktury, albo "domaga się" struktury w pewnym sensie minimalnej, możemy się przekonać rozważając
taki oto przykład konsekwentnego mówienia o czymś *jednocześnie* na co najmniej *dwa różne sposoby*:

*Każdy człowiek ma parę rodziców, którzy też są ludźmi*.

Rodzice to dwie różne - bo każdy ma matkę i ojca - *własności* każdego człowieka, a więc pojęcia
matki i ojca możemy zakodować formalnie jako *funkcje* ze zbioru ludzi do zbioru ludzi. Gdybyśmy
więc chcieli mówić o ludziach i ich rodzicach posługując się przynajmniej częściowo formalnym
językiem teorii mnogości, moglibyśmy to zrobić na przykład tak:

*Niech `L` będzie zbiorem ludzi, a `m` i `o` niech będą funkcjami na tym zbiorze, które każdemu
człowiekowi przyporządkowują odpowiednio matkę i ojca*.

Warto zwrócić uwagę, że potraktowanie tych dwóch fragmentów tekstu jako równoznacznych wymaga
pewnych decyzji interpretacyjnych. Na przykład, w drugim fragmencie nie powiedzieliśmy *wprost*, że
funkcje `m` i `o` *istnieją*. Stwierdziliśmy tylko, że symbole `m` i `o` mają oznaczać pewnego
rodzaju obiekty, czyli podaliśmy *typ* tych stałych, ale to, czy oznaczalne w ten sposób obiekty
istnieją, nie zostało jawnie rostrzygnięte. Czyli podaliśmy tylko typowanie pewnych symboli, ale ani
nie *skonstruowaliśmy* ich definicji, ani nie powiedzieliśmy wprost (być może aksjomatycznie), że
to, co te symbole mają oznaczać, istnieje. Jest jednak jasne, że w tego typu sytuacjach zakładamy
niejawnie, że oznaczane obiekty istnieją, nawet jeśli tylko jako abstrakcyjne procesy czy struktury
pojęciowe. A skoro tak, to drugi fragment tekstu mówi *to samo* co pierwszy - że każdy człowiek ma
parę rodziców - tyle, że innymi słowami. I *częściowo* formalnie. 

Czyli właściwie jak?

Częściowa formalność polega tu na ogłoszeniu albo *deklaracji* - w języku *naturalnym* -
obowiązujących w danym kontekście albo "odtąd" *zasad koordynacji*, czyli jednoczesnego użycia do
mówienia o powiązanych sprawach, pewnych części języka naturalnego i wybranego języka formalnego
(tutaj akurat formalnego języka teorii mnogości). Ten fragment tekstu jest półformalny również w tym
znaczeniu, że deklaracja dotycząca symbolu `L` jest czymś w rodzaju ustanowienia "półformalnej
funkcji" między obiektami językowymi, to jest jakimikolwiek symbolami, które zgodnie z późniejszymi
deklaracjami będą oznaczały elementy zbioru `L`, i obiektami *pozajęzykowymi*, to jest *ludźmi*.

Żeby lepiej zrozumieć półformalny charakter tej prawie funkcji warto zadać sobie pytanie, czy chodzi
o wszystkich ludzi, którzy urodzili się do tej pory, czy tylko o wszystkich ludzi, którzy żyją w tym
(czyli właściwie którym?) momencie, albo może o wszystkich ludzi, którzy kiedykolwiek żyli lub
faktycznie będą żyli w przyszłości (ale czy ten zbiór jest dobrze określony?), albo nawet o
wszystkich *możliwych* ludzi. Zgaduję, że kiedy przeczytałaś po raz pierwszy półformalną deklarację
typów stałych `L`, `m` i `o`, tego rodzaju wątpliwości mogły Ci przyjść do głowy.

Wiemy, że `L` nie może być zbiorem ludzi, którzy żyją lub żyli w jakimś konkretnym momencie, bo
wtedy wartości funkcji `m` i `o` nie byłyby określone dla ludzi, którzy mieliby w tym momencie co
najmniej jednego martwego rodzica, ale poza tym nie wiadomo, która interpretacja jest poprawna. A to
znaczy, że ten fragment półformalnego tekstu jest wieloznaczny w potencjalnie problematyczny
sposób. W takich sytuacjach decydujące znaczenie mają deklaracje formalne, ponieważ w ich przypadku
nie ma swobody użycia. Jeśli nowa deklaracja okaże się niezgodna z przyjętą wcześniej interpretacją
tekstu, należy poszukać takiej, która jest zgodna z dotychczasowymi deklaracjami. Na przykład, gdyby
pojawił się fragment z którego wynika, że zbiór ludzi jest nieskończony, należałoby to potraktować
jako niejawną deklarację, że symbol `L` ma oznaczać nie tylko ludzi, którzy żyli do tej pory, ale
albo wszystkich ludzi, którzy żyli, żyją, lub będą żyć w przyszłości, albo wszystkich w jakimś
sensie możliwych ludzi.

Jednocześnie mamy tutaj parę endofunkcji, którą co prawda opisaliśmy (częściowo) za pomocą języka
teorii mnogości, ale której sam język teorii mnogości nie "rozpoznaje" jako struktury wyróżnionego
typu. *My* możemy tego rodzaju struktury *zbudować* posługując się językiem teorii mnogości i możemy
je *rozumieć/traktować jako grafy*, a więc jako coś w pewnym sensie innego niż tylko jakaś tam para
równoległych funkcji. Bo graf to nie całkiem to samo; to na przykład również pewnego rodzaju
*rysunek*, albo jakakolwiek inna struktura czy reprezentacja, w której w jakimś sensie (albo dla
jakiegoś obserwatora) "są strzałki" i "są punkty zaczepienia" strzałek. Tak się składa, że często
posługujemy się pojęciem pary równoległych funkcji jako wygodnym w użyciu *formalnym odpowiednikiem*
pojęcia grafu, ale to tylko jedna z możliwych "kodyfikacji" zasad użycia *nieformalnego* (chociaż
dość abstrakcyjnego) pojęcia grafu.

Mogłoby się wydawać, że jeśli każdy *nieformalny* graf odpowiada unikalnej parze równoległych
funkcji, a każda para równoległych funkcji odpowiada unikalnemu nieformalnemu grafowi, a więc między
tymi dwoma rodzajami struktur istnieje coś w rodzaju *pół*formalnego izomorfizmu, to na jedno
wychodzi. Ale gdy tylko zaczynamy posługiwać się językiem *naturalnym* dotyczącym grafów, a więc
również *pojęciami grafowymi* i *grafowym sposobem myślenia*, okazuje się, że - zgodnie z omawianą
strukturą rozumianą jako graf i przyjmując, że funkcja `o` oznacza źródła strzałek - mamy tu "graf
rodzicielstwa", na którym *każdy człowiek jest strzałką od swojego ojca do swojej matki*.

Ten opis w kategoriach "własności grafowych" sugeruje sposoby myślenia - na przykład taki, że
dziecko jest rezultatem pewnego rodzaju oddziaływania organizmu ojca na stan organizmu matki -
których opis teoriomnogościowy raczej nie sugeruje, a nawet może *utrudniać* ich zauważenie. Widzimy
więc, że graf to nie całkiem to samo co jakaś tam para równoległych funkcji. Można by powiedzieć, że
skoro jednak między nieformalnymi grafami i parami równoległych funkcji istnieje (prawie, bo jedna
"strona" jest tu nieformalna) izomorfizm, to różnica jest "tylko psychologiczna", ale (tutaj tylko
prawie) "formalnie na jedno wychodzi". I moim zdaniem to byłoby błędne stwierdzenie, bo
psychologiczny charakter czegoś polega na tym, czym to coś jest lub może być *dla nas* i jak się
wobec tego czegoś zachowujemy lub możemy zachować, a takie własności są przecież dla nas
- trywialnie - najważniejsze, bo *tylko* takie własności są lub mogą być dla nas ważne. Widzimy więc
oto powody, żeby zastosować w przypadku omawianego półformalnego fragmentu tekstu matematyczną
*teorię grafów*, a dzięki temu skorzystać ze *skojarzeń*, które nasuwa *grafowy sposób myślenia*.

Zobaczymy też w jednym z późniejszych rozdziałów, że tak jak w teorii mnogości podstawową rolę
odgrywa "nakładanie się" zbiorów na (czasem - tak jak w naszym przykładzie z ludźmi i rodzicami -
nieformalne albo pozajęzykowe) zbiory, czyli takie jakby "zbiorowanie" albo "kolekcjonowanie", które
polega dokładnie na istnieniu jakiejkolwiek (czasem półformalnej) funkcji (mapującej elementy zbioru
jako takie na to, czym w danym kontekście mają być), tak w teorii grafów podstawową rolę odgrywa
*nakładanie (się) grafów na grafy*, albo takie jakby "grafowanie". W dodatku to jest "grafowanie
grafów", tak jak w teorii mnogości "zbiorujemy" zawsze jakieś zbiory, albo "oznaczamy" tylko te
obiekty, które same są już w jakimś sensie (arbitralnymi) oznaczeniami, bo zanim te obiekty
*formalnie* oznaczymy (za pomocą funkcji), musimy już je "mieć zawarte" w naszym formalnym świecie
zbiorów i funkcji. Jednak nakładanie (się) albo *mapowanie*, inaczej *odwzorowywanie* grafów *nie*
sprowadza się do istnienia *arbitralnych* funkcji, tylko polega na rozpoznaniu jednego grafu *jako
grafu* w strukturze drugiego (być może tego samego) grafu.

Na przykład, graf będący tylko punktem bez strzałek, a więc taki, który zgodnie z przyjętą wcześniej
definicją odpowiada parze funkcji ze zbioru pustego (bo nie ma strzałek) do jakiegokolwiek zbioru
jednoelementowego (bo ma tylko jeden punkt, który nie jest źródłem ani celem żadnej strzałki, ale
wciąż jest *punktem grafu*), można "sensownie rozpoznać" w każdym innym grafie na tyle sposobów, ile
jest w tym innym grafie punktów, w teorii grafów nazywanych oficjalnie *węzłami*. Każde takie
"sensowne" albo "strukturalne rozpoznanie" albo "zobaczenie" jednego grafu w strukturze drugiego
musi być zgodne ze strukturą obydwu grafów (inaczej nie zasługiwałoby na miano sensownego czy
strukturalnego). Na przykład, nie można nakładać *strzałki* jednego grafu na *punkt* drugiego,
chyba, że *wcześniej zadeklarujemy*, że ten punkt będziemy traktować jako *arbitralny element*
służący jako "budulec" grafu konstruowanego "od podstaw", to jest "rozpoznamy" go "ponownie" na
poziomie albo w języku *arbitralnego oznaczania*, czyli na poziomie zbiorów i funkcji. Tak samo bez
wcześniejszego "odarcia" grafu oznaczanego z jego struktury, to jest bez wcześniejszej deklaracji,
że będziemy ją ignorować, nie można "sensownie" albo "strukturalnie mapować" endostrzałki (czyli
strzałki, która ma to samo źródło i cel) na strzałkę, która nie jest endostrzałką, bo to by wymagało
nałożenia *jednego* punktu na *dwa*, a to by było niezgodne z podstawowymi intuicjami na temat tego,
jak działa oznaczanie, mapowanie, czy rozpoznawania jako.

A mówiąc ogólnie, to jest niekoniecznie o "grafowaniu", zachowujące strukturę oznaczanie czy też
nakładanie, oficjalnie nazywane *mapowaniem* albo *odwzorowywaniem*, musi ...

1. zachowywać *typ części* nakładanej struktury i ...  

Tutaj punkty mają oznaczać punkty, a strzałki strzałki.

2. nie może niczego "rozrywać".

Na przykład, punkty połączone strzałką na grafie nakładanym muszą być nałożone na punkty połączone
strzałką na grafie oznaczanym, bo jeźeli strzałka `f` jest nałożona na strzałkę `f'`, to źródło
\{cel\} `f` musi być nałożone na źródło \{cel\} `f'`). Za to ...


3. można "sensownie sklejać" części.  

Na przykład, nakładając graf `A → B → C` na zawierający endostrzałkę graf `X → Y → Y` możemy nałożyć
`A → B` na `X → Y`, ale nałożenie punktu `B` na punkt `Y` wymusza wtedy nałożenie strzałki `B → C`
na endostrzałkę `Y → Y`. Przypisujemy wtedy dwóm punktom `B` i `C`, które są *różne jako
oznaczenia*, ten sam punkt oznaczany (który też może coś oznaczać). Nakładanie, a oficjalnie
mapowanie grafu na (lub w) graf polega więc na tym, że każda strzałka jest posłana w jakąś strzałkę,
a każdy punkt w jakiś punkt, tak, że źródła są nałożone na źródła, a cele na cele. Czyli polega to
na zachowaniu "własności pozytywnych", takich jak bycie źródłem strzałki, albo bycie taką parą
strzałek, że cel pierwszej jest źródłem drugiej. Natomiast własności "negatywne", takie jak fakt, że
jakieś dwa punkty są różne, albo nie są połączone strzałką, *nie* muszą być zachowane.

Podobnie w teorii typów można podać więcej niż raz ten sam term jako argument aplikacji funkcji,
pisząc na przykład `suma 2 2`, o ile ten term "zasili" parametry tego samego typu, a funkcja
teoriomnogościowa może posyłać dwa różne elementy w ten sam element swojej przeciwdziedziny, tak jak
to ma miejsce w przypadku funkcji kwadratowej. Dopóki konsekwentnie stosujemy te zasady, to
stwierdzając, że jakaś struktura "jest grafem", wyrażamy fakt, że da się tą strukturę "sensownie
oznaczyć" czy opisać za pomocą punktów (czyli węzłów) i strzałek "formalnego grafu" tak, jakby
punkty i strzałki tego formalnego grafu były parametrami czy zmiennymi, które są w jakiś sposób
"powiązane grafowo", ale poza tym nie muszą oznaczać różnych rzeczy.

Mogłoby się wydawać, że *graf jednopunktowy* jest tym samym, co *zbiór jednoelementowy*, ale gdy
zapominamy o (tutaj pustym, dlatego może się wydawać mało znaczący) zbiorze pełniącym rolę zbioru
strzałek i o funkcjach traktowanych jako oznaczenia źródeł i celów, nie zostaje nam nic, co
pozwalałoby traktować zbiór jednoelementowy jako zbiór zawierający punkt czy węzeł *na
grafie*. Musimy wtedy *sami zadeklarować*, że będziemy traktować ten zbiór jako zbiór punktów, tym
samym niejawnie wprowadzając pozostałe części ogólnej struktury grafu, to jest (wtedy pusty) zbiór
strzałek i (również puste) funkcje źródła i celu.

Podobnie graf zawierający tylko jedną strzałkę, która ma różne punkty jako swoje źródło i swój cel,
można "sensownie rozpoznać" w każdym grafie na tyle sposobów, ile jest w tym "analizowanym" grafie
strzałek. Możemy wtedy rozpoznawać tą pojedynczą strzałkę również jako dowolną endostrzałkę na
grafie analizowanym, bo rozróżnialność *oznaczeń* (tutaj punktów będących źródłem i celem) nie
wymusza rozróżnialności obiektów *oznaczanych*. Gdy na grafie analizowanym nie ma żadnej strzałki,
takie *mapowanie zachowujące strukturę grafu* nie istnieje, bo na grafie oznaczanym nie ma niczego,
co można by "sensownie oznaczyć" jako strzałkę.

TODO PRZERÓBKI CD W kontekście tego przykładu możemy mówić między innymi o *zbiorze* ludzi `L` i o
*strzałkach* (a to już *nie* jest pojęcie *wbudowane* w język teorii mnogości) od każdej (oznaczonej
jako element zbioru `L`) osoby do (jakiegoś elementu `L` oznaczającego) rodzica tej osoby. Możemy
omawiać strukturę "zarysowanego" w ten sposób grafu posługując się właśnie "językiem grafowym". 

Na przykład, możemy mówić o strzałkach na tym grafie rozpatrując te strzałki *jako pod-grafy
jednostrzałkowe*. Ale możemy też dla pewnych celów traktować (elementy oznaczające dowolnych) ludzi
jako obiekty takie jak każde inne. Wtedy odrywamy się w naszych rozważaniach od struktury grafowej,
to znaczy *nie korzystamy z faktu*, że każdy człowiek ma jakiś rodziców, ani tego faktu nie
kwestionujemy.

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
