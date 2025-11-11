<br>

**Moim zdaniem najważniejsze wskazówki na temat tego, w jaki sposób warto czytać tą książkę, są
[tutaj](./Wujek_dobra_rada.md).**

<hr>

## O czym teraz będzie

W tym rozdziale doświadczysz pewnego sposobu zajmowania się matematyką, który poznałaś już w szkole
podstawowej, ale być może nie zastanawiałaś się jak dotąd dłużej, o co w nim właściwie chodzi.
Będziemy przyglądać się z bliska wybranym, ważnym i często wykonywanym w matematyce czynnościom, a
właściwie tylko *jednej* prostej mechanicznej czynności polegającej na *podstawianiu*
(*wymienianiu*) jednych wyrażeń w miejsce innych (na inne wyrażenia).

<hr>

# Kilka trywialnych mechanicznych operacji

Przypuszczam, że już dawno stało się dla Ciebie oczywiste, że jeżeli *A = B* i *B = C*, to *A = C*,
niezależnie od tego, co podstawisz pod *A*, *B* i *C* (\{podwójnym\} nawiasem mówiąc, tą zasadę
nazywamy *przechodniością* \{relacji równości\}). Na pewno znajomy wyda Ci się również ten fragment
matematycznej prozy (mówiący o *przemienności* dodawania):

> Jeżeli *n* i *m* to liczby naturalne, to *n + m = m + n*.

I wiesz, że możesz *używać* takiego stwierdzenia *podstawiając* pod *n* lub *m* (czyli wymieniając
te symbole na inne wyrażenia):

1. Konkretną *liczbę* naturalną, na przykład liczbę *7*.

2. *Zmienną*, na przykład zmienną *a*, o której wcześniej *zdecydowałaś* (albo zdecydował autor
   czytanego przez Ciebie matematycznego tekstu), że oznacza *jakąś* liczbę naturalną.

3. Całe *złożone wyrażenie*, będące formułą albo przepisem, o którym wiesz, że po obliczeniu dałoby
   liczbę naturalną, takie jak *10 - 1*.

Poza tym, że to muszą być *wyrażenia odpowiedniego typu*, to jest (na mocy jawnych deklaracji i
powszechnie przyjętych konwencji) wyrażenia *oznaczające liczby naturalne*, trzeba też pamiętać,
żeby *podstawianie* było *konsekwentne*. To znaczy, w miejscu każdego wystąpienia *n* musi być
podstawione to samo coś, co oznacza liczbę naturalną, i w miejscu każdego wystąpienia *m* musi być
podstawione to samo. Wreszcie trzeba wiedzieć, że chociaż "n" i "m" to różne litery, to nie musimy
pod nie podstawiać różnych wyrażeń. I tak, zgodnie z przytoczonym fragmentem:

*2 + 3 = 3 + 2*
(na mocy powszechnej konwencji, że *2* i *3* to liczby naturalne)

A jeżeli *a* i *b* to jakieś liczby naturalne, to również:

*a + b = b + a*  
(na mocy deklaracji)

*a + 10 = 10 + a*  
(deklaracja dotycząca *a* i powszechna konwencja dotycząca *10*)

*b + b = b + b*  
(nie trzeba podstawiać różnych rzeczy)

*(2 + 3 + a) + b = b + (2 + 3 + a)*  
(możemy podstawiać *złożone* wyrażenia odpowiedniego typu)

Ostatnia równość jest wynikiem zastosowania twierdzenia o przemienności dodawania (przez poprawne
podstawianie), ponieważ *2 + 3 + a* oznacza w tym kontekście (oto cały \{lokalny\} kontekst:
umawiamy się, że *a* i *b* to jakieś liczby naturalne) liczbę naturalną, i tak dalej.

Myślę, że zgodzisz się, że takie operacje wiele dzieci opanowuje bez większego trudu jeszcze w
szkole podstawowej. W dodatku każda równość, którą możemy w ten sposób uzyskać, interesuje nas
głównie dlatego, że sama jest pewną regułą podstawiania, bo mówi o *zastępowalności* (w każdym
kontekście) - lewej strony przez prawą i prawej przez lewą. Cały czas chodzi więc o jedną i tą samą
prostą czynność mechanicznego, to jest w zasadzie bezmyślnego, ogólnie rozumianego podstawiania
(jeżeli zgodzimy się zastępowanie uzasadnione przez równość nazywać również podstawianiem).

## Ten tytuł jest tylko po to, żeby do niego później wrócić

Możemy popatrzeć na to wszystko również tak: Ten fragment matematycznej prozy jest jak *przepis*,
który *stosując* da się wyprodukować *nieskończenie wiele prawdziwych zdań* na temat liczb
naturalnych. Swoją "nieskończoną produktywność" zawdzięcza *parametryczności*, to jest temu, że jest
zrobiony z *parametrów* albo *zmiennych* (*m* i *n*), czyli specjalnie oznaczonych miejsc, w które
możemy coś podstawiać. Możemy też na niego popatrzeć jak na coś w rodzaju *maszyny* albo
*mechanizmu*, który (jak to mechanizm) *działa*, chociaż tylko dzięki temu, że to *my go używamy* w
określony sposób, to jest konsekwentnie podstawiając w miejsca wystąpień zmiennych wyrażenia
odpowiedniego typu (tutaj akurat liczbowego). Ten mechanizm składa się co najmniej z *trzech*
części:

1. Zapisanego w jakiś sposób matematycznego *przepisu*.

2. Z *nas* samych (sic!).

3. I z tego, jak tego przepisu *używamy*.

W tej części książki to jest nasz punkt wyjścia i, jak się przekonasz, w pewnym momencie ta prosta
zabawa symbolami będzie również naszym punktem dojścia.

<hr>

### Zagadka "filozoficzna"

Zwróć proszę uwagę, że żaden "obiekt symboliczny" nie byłby przepisem, gdyby nie było przynajmniej
hipotetycznego *kogoś*, kto może go *zastosować*. To my, ludzie, jesteśmy albo autorami takich
przepisów, albo odkrywcami lub autorami konwencji, zgodnie z którymi pewne rzeczy (takie jak zapis
*Jeżeli A = B i B = C, to A = C.*) możemy traktować jak przepisy (dzięki czemu *są* przepisami).
Najgłębszą podstawą całej matematyki są zatem *nasze cele, postawy i sposoby działania*. Nawet jeśli
przyjmiemy, że matematyka jest czymś, co raczej "odkrywamy" niż "tworzymy", nie ma *dla nas* i nigdy
nie będzie innej matematyki niż ta, której *jesteśmy w stanie używać*, bo - *tak jak ją rozumiemy* -
matematyka *jako taka* jest *naszym narzędziem*.

Co więcej, tylko jeden z trzech wymienionych właśnie elementów jest "definicyjnie autonomiczny". Mam
na myśli fakt, że ja i Ty istniejemy jako ja i Ty odpowiednio niezależnie od tego, czy używamy tego
rodzaju przepisów, czy nie. Ale żeby przepis był przepisem, musi istnieć ktoś, kto może go jako
przepisu używać, i tak samo żeby sposób używania tego przepisu był tym, czym jest, to jest pewnym
sposobem używania czegoś, musi istnieć, przynajmniej hipotetycznie, *coś, co może być tak używane*
(tutaj przepis) i (choćby tylko hipotetyczny) *ktoś, kto może ten sposób stosować*.

Można więc powiedzieć, że *dwa* spośród tych trzech pojęć, to jest pojęcia przepisu i używania go, w
pewnym sensie "zawierają w sobie" wszystkie trzy pojęcia, razem z pojęciem (hipotetycznego)
użytkownika. W dodatku te dwa pojęcia są dwiema stronami tego samego medalu. Bo jeśli czegoś,
dosłownie czegokolwiek, możemy używać jak przepisu, to to coś po prostu jest dla nas przepisem. A
jeśli coś jest przepisem, to znaczy, że ktoś może tego czegoś używać jako przepisu.

Przepis jako taki i sposób używania go to zatem *jedno i to samo pojęcie oglądane z dwóch stron*,
obiektowej/materialnej i funkcjonalnej/użytkowej. Nie ma przepisów (będących sposobami ich używania)
bez przynajmniej potencjalnie używającego ich jako przepisów przynajmniej hipotetycznego podmiotu.
Za to podmioty (również hipotetyczne), istnieją (jeśli hipotetyczne, to aksjomatycznie) niezależnie
od tego, czy używają przepisów.

Czy w takim razie matematyka i [gotowanie](https://youtu.be/O8OrsCw0OC0?si=5vJf16PoaT2-J0SZ) nie są
przypadkiem *subdyscyplinami psychologii*?  

Taka zagadka.

<hr>

Spróbuj chwilowo potraktować formalne reguły takie jak te, które podałem przed tym ostatnim nieco
dygresyjnym i wybiegającym w przyszłość fragmentem, jakby były regułami *gry*, która *nie musi mieć
sensu*. Uwierz mi proszę na próbę, bo sprawdzałem to już wielokrotnie - na tym etapie potrzeba sensu
może Ci przeszkadzać. Obiecuję, że sens się pojawi, tylko może kiedy indziej i raczej stopniowo.

**Polecenie**: *To zadanie może być w tym momencie zbyt trudne. Jeśli tak będzie, spróbuj najpierw
wykonać następne zadanie, a później wróć do tego*.  

Znajdź czystą kartkę papieru i coś do pisania. Napisz na kartce cztery zdania, które będziemy
chwilowo rozumieć jako *aksjomaty*, czyli *reguły gry* (a nie *założenia*), albo jeszcze lepiej
*reguły językowe* albo *komunikacyjne*, na które (wyobrażam sobie, że) *umawiamy się bez
uzasadnienia*:

1. Istnieją *fldsmdfry*.

Jeżeli $x$ i $y$ to jakieś (niekoniecznie różne)
[fldsmdfry](https://cloudywithachanceofmeatballs.fandom.com/wiki/FLDSMDFR), to ...

2. $\underbrace{x}$, $\underbrace{x, y}$, i $x \odot y$ są (jakimiś) liczbami.

3. $\underbrace{x, y}$ $=$ $\underbrace{y, x}$.

4. $x \odot y$ $*$ $\underbrace{y}$ = $\underbrace{x, y}$.

Wyobraź sobie teraz, że dałem Ci dwa fldsmdfry; nazwijmy je $a$ i $b$. Użyj reguły 4, żeby uzyskać
*dwa nowe równania*, najpierw podstawiając $a$ *wszędzie* tam, gdzie w regule 4 występuje zmienna
$x$ i $b$ wszędzie tam, gdzie występuje $y$, a potem odwrotnie, $a$ za $y$ i $b$ za $x$. Te dwa nowe
równania będą takie same jak równanie w regule 4, ale będą w nich występowały inne symbole ($a$ i
$b$ zamiast $x$ i $y$), nadal w roli zmiennych, bo przyjmujemy, że *a* i *b* to *jakieś*, czyli
bliżej nieokreślone fmldsmdfry.

Następnie korzystając z przechodniości relacji równości użyj reguły 3 w jedyny sposób, w jaki się da
(ta reguła mówi coś o tych dwóch nowych równaniach, a raczej o ich *stronach*), żeby uzyskać trzecie
nowe równanie. Zakładając, że $\underbrace{b} \neq 0$, podziel obie strony tego ostatniego równania
przez $\underbrace{b}$ (zgodnie z przyjętą konwencją te strony to \{jakieś\} liczby, a więc możemy
je dzielić przez liczby niezerowe) i uprość jedyną rzecz, którą możesz.

Jeżeli masz wątpliwości, czy dobrze wykonałaś to zadanie, albo ta egzotyczna i bezsensowna notacja
budzi Twój niepokój, nie przejmuj się tym, niebawem wszystko powinno się wyjaśnić. Jeżeli natomiast
wydaje Ci się, że wykonałaś zadanie poprawnie, ale czujesz frustrację wynikającą z braku poczucia
sensu, to znakomicie, bo właśnie taki efekt miałem nadzieję uzyskać. Jeżeli tak się stało, to może
dzięki temu będziesz lepiej rozpoznawać w przyszłości pewną ważną i nieoczywistą przeszkodę w nauce
matematyki.

Naprawdę uważam, że w nauce matematyki przydaje się zdolność do *tymczasowego* stłumienia potrzeby
sensu. Chodzi w tym przede wszystkim o to, żeby na początku nie próbować uczyć się zbyt wielu rzeczy
jednocześnie, a w przypadku teorii matematycznych trzeba opanować notację i terminologię, sztywne i
abstrakcyjne reguły (aksjomaty, twierdzenia i zwykłe definicje), a także sposoby, w jaki można te
reguły stosować w różnych sytuacjach, w tym również do rozwiązywania problemów *nie*matematycznych.
Wygląda na to, że aby *zrozumieć dlaczego* te teorie są tak a nie inaczej skonstruowane, trzeba
czasem *najpierw* dobrze *poznać ich podstawy*, a nie odwrotnie. Być może dałoby się je przedstawiać
objaśniając najpierw celowość *każdego* wprowadzanego elementu w sposób zrozumiały dla
początkujących, ale jak dotąd nie spotkałem się z żadnym przykładem udanego zastosowania takiego
podejścia.

Od kilku lat prowadzę dla doktorantów zajęcia dotyczące wnioskowania przyczynowego i bayesowskiego.
Nie będzie ani trochę przesadą jeśli powiem, że zapisują się na nie wspaniali studenci. Tacy, którzy
wydają mi się często autentycznie zainteresowani poszerzaniem wiedzy. Prędzej czy później zaczynam
im mówić o [twierdzeniu Bayesa](https://pl.wikipedia.org/wiki/Twierdzenie_Bayesa), ale od niedawna
robię to inaczej.

Przedtem poprzedzałem wyprowadzenie dowodu krótkim wstępem. Gdy zapowiadałem potem uczestnikom, że
będą go sami dowodzić, zauważałem u niektórych objawy lekkiej paniki. Podobną panikę widziałem
zresztą w oczach pracowników naukowych, którzy byli obecni na moim otwarciu przewodu, kiedy na
slajdach pojawił się symbol [*sumy indeksowanej*](https://pl.wikipedia.org/wiki/Rodzina_indeksowana)
(*∑*). W tym roku po raz pierwszy spróbowałem wprowadzić twierdzenie Bayesa bez wstępu, na
pierwszych albo drugich zajęciach, i postarałem się nakłonić wszystkich, żeby skupili się tylko na
prostych formalnych przekształceniach, takich jak stosowanie zasady przechodniości relacji równości.
Różnica w *wykonaniu*, nawet jeśli niekoniecznie w *zrozumieniu*, była oczywista.

**Polecenie**: Znajdź czystą kartkę papieru i coś do pisania. Napisz na kartce trzy zdania, które
będziemy chwilowo rozumieć jako *aksjomaty*, czyli *reguły gry* (a nie *założenia*), albo jeszcze
lepiej *reguły językowe* albo *komunikacyjne*, na które (wyobrażam sobie, że) *umawiamy się bez
uzasadnienia*:

1. Istnieją tak zwane *zdarzenia*.

2. Istnieje funkcja *p*, która *zdarzeniom* lub ich parom przypisuje *liczby*.

3. Jeżeli *x* i *y* to *zdarzenia*, to *p(x, y) = p(y, x)*.

Niektóre symbole i terminy techniczne matematyki, to jest *=*, *funkcja*, *liczba* i *para*
(uporządkowana) traktujemy tutaj jako część wspólnej wiedzy zastanej. Właściwie z pierwszych dwóch
reguł nie będziemy korzystać jawnie, więc jeśli chcesz, możesz się skupić tylko na regule trzeciej.

Być może przyszła Ci do głowy narzucająca się interpretacja symboli *zdarzenie* i *p*. Jeżeli tak,
to spróbuj ją proszę zignorować, na ile tylko jesteś w stanie. Jeszcze raz podkreślam, że na tym
etapie to jest tylko
[*gra*](https://www.guinnessworldrecords.com/world-records/largest-jigsaw-puzzle-most-pieces).

Poza wymienionymi aksjomatami będziemy jeszcze potrzebować *definicji* symbolu *|*:

4. Jeżeli *x* i *y* to *zdarzenia*, to *p(x|y) * p(y) = p(x, y)*.

Zapisz teraz nową wersję definicji tej pionowej kreski, ale wpisując *y* wszędzie tam, gdzie w
wersji źródłowej jest *x*, a *x* wszędzie tam, gdzie w wersji źródłowej jest *y*. Czyli potraktuj tą
definicję jak przepis, tak jak pewnego rodzaju przepisem był dla nas wcześniej fragment prozy
matematycznej dotyczący przemienności dodawania. Uzyskasz w ten sposób dwie wersje zdania będącego
treścią definicji - oryginalną i tą, która powstała przez podstawianie.

Skorzystaj z aksjomatu *3* w jedyny sposób, w jaki możesz, żeby ustalić, że lewe strony obydwu
wersji definicji są równe (na mocy przechodniości relacji równości). Zapisz tą równość.

Podziel obie strony przez *p(y)*, zakładając oczywiście, że ta wartość jest różna od zera (wynik
dzielenia przez zero jest niezdefiniowany). Prosząc Cię, żebyś to założyła, mam na myśli, żebyś
"miała tego świadomość". Uprość jedyną stronę równania, którą da się w tym momencie uprościć.

Jeżeli wykonałaś poprawnie wszystkie te *trywialne*, *mechaniczne* operacje, polegające tylko na
podstawianiu pewnych wyrażeń w miejsce innych wyrażeń zgodnie z kilkoma prostymi regułami, to udało
Ci się udowodnić nieznacznie uproszczoną wersję twierdzenia Bayesa. W dodatku zrobiłaś to już po raz
drugi, bo ten dowód i poprzedni *jako formalne dowody* różniły się tylko nazwami stałych, a takie
różnice są w matematyce *nieistotne* (choć mają znaczenie praktyczne). Moim studentom, kiedy
udowadniają w ten (drugi) sposób to twierdzenie po raz pierwszy w życiu, nie zajmuje to więcej niż
15 minut.

Zwróć przy okazji uwagę, że udowodniłaś to twierdzenie ani nie przytaczając, ani nie odnosząc się do
żadnych konkretnych *zdarzeń*, ani nie obliczając żadnych wartości funkcji *p*. Czy widzisz, że o to
między innymi, to znaczy o *parametryczność* pozwalającą korzystać z nich w wielu różnych sytuacjach
przez niemal bezmyślne podstawianie, chodzi w tego rodzaju twierdzeniach?

<hr>

### Dygresja na temat różnicy między aksjomatami i zwykłymi definicjami

Kilka razy posłużyłem się w tym rozdziale terminami technicznymi "aksjomat" i "definicja". Będę
jeszcze do nich wracał, ale na wszelki wypadek wyjaśnię już teraz, jak tych terminów używamy *w
matematyce*. Jeżeli jeszcze nie *poczujesz*, o czym tu będę mówił, nie przejmuj się tym, bo nie bez
powodu nazwałem ten fragment dygresją.

*Zwykłe definicje są wyborami językowymi określającymi alternatywne, często krótsze i ułatwiające
czytanie ze zrozumieniem sposoby zapisywania tego samego.*

*Aksjomaty też są definicjami, a więc pewnymi językowymi wyborami, ale określającymi dopuszczalne
sposoby zapisywania niczego.*

Ciekawe, prawda? W matematyce różnica między aksjomatem i definicją polega *tylko* na tym, że
aksjomat jest *decyzją*, że *jakiś nowy symbol lub całe wyrażenie oznacza coś jakiegoś typu, bo
tak*, a definicja jest *decyzją*, że *jakiś nowy symbol lub wyrażenie oznacza to samo, co jakieś
dające się już poprawnie skonstruować wyrażenie, oznaczające coś jakiegoś typu*.

Ponieważ to są decyzje (albo wybory), nie ma sensu pytanie, czy aksjomaty albo zwykłe definicje są
prawdziwe czy fałszywe, natomiast zawsze można zapytać, czy te decyzje są *korzystne* lub *trafne*
ze względu na określone cele. W szczególności, możemy sensownie zapytać, czy *zastosowanie* danego
aksjomatu, być może do czegoś niematematycznego, jest poprawne. Pytamy wtedy, czy jakiś aksjomat
jest prawdziwy *o czymś*, a nie czy sam aksjomat jest prawdziwy. Założeniem, które może być
prawdziwe lub fałszywe, jest wtedy stwierdzenie, że coś jest ze względu na przyjęte cele poprawnie
*opisywalne przez aksjomat*.

Reguła 3 to (dla nas, bo można ją wyprowadzić z bardziej elementarnych zasad) aksjomat, czyli
*definicja nierozkładalna*. To jest definicja w postaci zdania (będącego akurat równaniem),
określająca poprawny sposób użycia *przecinka*, gdy ten oddziela argumenty aplikacji funkcji *p*.
Aksjomatyczność tej definicji polega tu między innymi na tym, że stosując ją nie pozbywamy się
symbolu, którego ta definicja dotyczy.

Reguła 4 to *zwykła* definicja określająca poprawny sposób użycia *pionowej kreski*, bo określa
dopuszczalny sposób *rozwinięcia* wyrażeń zawierających pionową kreskę do takich, w których pionowa
kreska *nie* występuje.

Podobnie, jeden z *aksjomatów* Peano mówi, że *0* jest liczbą naturalną. Można to rozumieć jako
*stwierdzenie* (a więc zdanie), że istnieje coś, co znaczy symbol "0" i to coś jest liczbą
naturalną, bo tak (to jest ta aksjomatyczność). Ale nie trzeba. Niezależnie od tego, czy przyjmiemy,
że liczba zero w takim lub innym znaczeniu istnieje, czy że przyjmując aksjomat, że *0* jest liczbą
naturalną, umawiamy się tylko na pewien użyteczny sposób mówienia, teoria liczb naturalnych będzie
działała tak samo dobrze jako narzędzie rozwiązywania typowych problemów do jakich ją stosujemy.
Fragment "bo tak" można więc rozumieć jako znaczący coś w rodzaju "będziemy odtąd w ten sposób
pisać", to jest jako *arbitralną regułę komunikacyjną* (zawsze przecież piszemy *do kogoś*, nawet
jeśli tym kimś jesteśmy my sami \{w przyszłości\}). Inny *aksjomat* Peano mówi z kolei, że istnieje
(tak samo tajemnicza jak liczba *0*, bo nie *skonstruowana* z niczego innego) operacja *następnika*,
która z każdej liczby naturalnej "robi" (nie wiadomo jak, to znaczy nijak) jakąś (unikalną) liczbę
naturalną.

Z kolei już zwykła, bo nie aksjomatyczna *definicja* symbolu "1" mówi, że "1" oznacza to samo, co
dające się *skonstruować* na mocy wcześniejszych aksjomatów wyrażenie "następnik 0". W końcu *0*
jest na mocy aksjomatu liczbą naturalną, a *następnik* jest na mocy aksjomatu funkcją, którą możemy
stosować do dowolnych liczb naturalnych, w tym również do *0*. A więc wyrażenie "następnik 0"
oznacza liczbę naturalną, którą da się uzyskać stosując w żaden sposób nie skonstruowaną funkcję
*następnik* do również nie skonstruowanej liczby *0*, i właśnie tą liczbę (na mocy tej definicji)
możemy zapisać krótko za pomocą symbolu "1".

Inaczej mówiąc, w matematyce aksjomaty to dokładnie *wybrane przez kogoś definicje, których nie ma
do czego rozwinąć* (albo "rozpakować"), a *zwykłe* definicje to tylko *wybrane przez kogoś
alternatywne sposoby zapisu*, służące zwykle do tego, żeby można było coś napisać krócej lub
bardziej zrozumiale, albo żeby pewne mechaniczne przekształcenia z użyciem tych wyrażeń łatwiej się
automatyzowały.

<hr>

Wersja twierdzenia Bayesa, którą właśnie udowodniłaś, jest uproszczona. Prawdopodobieństwa nie mogą
być mniejsze niż *0* ani większe niż *1*, a nasze prawdopodobieństwa to dowolne liczby, nie wiadomo
nawet jakie, czy na przykład rzeczywiste, czy wymierne. Tak się jednak składa, że nie
potrzebowaliśmy korzystać z tych własności prawdopodobieństwa, nasze reguły nie były więc wcale
*niezgodne* z rachunkiem prawdopodobieństwa, tylko *słabsze*, w znaczeniu "mniej zobowiązujące", nie
w znaczeniu "gorsze" czy "bardziej wątpliwe".

Wypadałoby niby poza tym wprowadzić pojęcie [*zmiennnej
losowej*](https://pl.wikipedia.org/wiki/Zmienna_losowa), a zamiast o *zdarzeniach* powinniśmy może
mówić o (dyskretnych) [*zdarzeniach
elementarnych*](https://pl.wikipedia.org/wiki/Przestrze%C5%84_zdarze%C5%84_elementarnych), albo o
zdarzeniach zdefiniowanych
[ogólniej](https://pl.wikipedia.org/wiki/Przestrze%C5%84_probabilistyczna). Jednak jako narzędzie
stworzone dla pewnych celów dydaktycznych i w rękach kogoś, kto zna i ma na uwadze te ograniczenia,
taka uproszczona wersja jest w mojej ocenie lepsza niż nic. Wystarcza na przykład do zilustrowania
wielu ciekawych zastosowań twierdzenia Bayesa w psychologii, albo do snucia ogólnych rozważań na
temat oceny hipotez empirycznych.

Mam nadzieję, że skonstruowanie tego dowodu, a zwłaszcza jego pierwszej, agresywnie bezsensownej
wersji, pozwoliło Ci doświadczyć czegoś, co sam niby wiedziałem od dawna, ale dopiero ostatnio
zaczęło do mnie lepiej docierać, co z tego wynika. Gdy tworząc pierwszą wersję skryptu, z którego
niedługo potem powstał ten rozdział, poprosiłem doktorantów o skonstruowanie, według wskazówek
zapisanych w skrypcie w języku Lean, dowodów kilku prostych twierdzeń, większość, o ile nie wszyscy,
wykonali to zadanie z łatwością. Gdy zapytałem potem o wrażenia - o ile dobrze pamiętam po chwili
wahania - zgłosiła się Sofiia Honcharova i zdobyła się na odwagę, żeby powiedzieć, że chociaż
wykonała zadanie dość szybko, to *nie wiedziała, co się stało*.

Ta odpowiedź nie dawała mi później spokoju, dlatego poprosiłem Sofiię, żeby spróbowała powiedzieć
coś więcej. I wtedy wyjaśniła, że "czuła się jak małpa". Moim zdaniem mówiąc to trafiła w sedno.
*Znalezienie* dowodu jest *sztuką*, ale skonstruowanie dowodu *według wskazówek*, tak samo jak
*sprawdzenie* poprawności dowodu, to czynności *mechaniczne*. A skoro to są czynności mechaniczne,
to znaczy, że można zarówno *skonstruować* dowód *według instrukcji* (ale nie *znaleźć*), jak i
*sprawdzić* go, *nie rozumiejąc sensu dowiedzionego twierdzenia*. Wynika stąd, że sama *znajomość
dowodu mówi niewiele*, a często może nawet *nic*, o znaczeniu dowiedzionego zdania.

Żeby zrozumieć co *znaczy* dane zdanie, trzeba go przede wszystkim *używać*, dowodząc za jego pomocą
*innych* zdań lub rozwiązując jakieś problemy i poznając w ten sposób jego *konsekwencje*. Dlatego
zależy mi, żebyś nie oczekiwała od dowodów tego, czego nie będą mogły Ci dać. Rolą dowodu *nie* jest
*ujawnianie sensu dowodzonego zdania*, tylko *rozstrzyganie o jego prawdziwości*, jak również -
zawsze tylko częściowe - *ujawnienie znaczenia założeń dowodu*. Wykonując dwa razy ten sam w
zasadzie dowód poznałaś więc pewien fakt - że twierdzenie Bayesa wynika logicznie z pewnych reguł -
i *w pewnym sensie* dowiedziałaś się czegoś na temat znaczenia czy sensu *tych reguł*, ponieważ
miałaś okazję doświadczyć niektórych sposobów, w jakie można je *zastosować*, czyli poznałaś
niektóre ich *konsenwencje*.

Od chwili, w której jakieś matematyczne zdanie zostało formalnie udowodnione, wiemy na pewno, że
było, jest, i zawsze już będzie prawdziwe, choć tylko w tym znaczeniu, że jest nieuchronną
konsekwencją przyjętych wyborów językowych. Od tego momentu o samym dowodzie, to jest o jego
konkretnej strukturze, możemy spokojnie *zapomnieć*, chyba, że chcemy z niego skorzystać jako ze
wskazówki podczas poszukiwania innego dowodu.

Będziemy odtąd robić podobne rzeczy, ale [nie zawsze na
kartce](R05_Pierwszy_spacer_po_Leanie_wersja_pierwsza.md).
