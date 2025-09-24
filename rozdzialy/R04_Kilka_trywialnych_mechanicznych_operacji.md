<br>

**Moim zdaniem, najważniejsze wskazówki na temat tego, w jaki sposób warto czytać tą książkę, są
[tutaj](./Wujek_dobra_rada.md).**

<hr>

## O czym teraz będzie

W tym rozdziale doświadczysz pewnego sposobu zajmowania się matematyką, który poznałaś już w szkole
podstawowej, ale być może nie zastanawiałaś się jak dotąd dłużej, o co w nim właściwie
chodzi. Będziemy przyglądać się z bliska wybranym, ważnym i często wykonywanym w matematyce
czynnościom, a właściwie tylko *jednej* prostej mechanicznej operacji polegającej na *podstawianiu*.

<hr>

# Kilka trywialnych mechanicznych operacji

Przypuszczam, że już dawno stało się dla Ciebie oczywiste, że jeżeli *A = B* i *B = C*, to *A = C*,
niezależnie od tego, co podstawisz pod *A*, *B* i *C* (\{podwójnym\} nawiasem mówiąc, tą zasadę
nazywamy *przechodniością* \{relacji równości\}). Na pewno znajomy wyda Ci się również taki oto
fragment matematycznej prozy (mówiący o *przemienności* dodawania):

> Jeżeli *n* i *m* to liczby naturalne, to *n + m = m + n*.

I wiesz, że możesz *używać* takiego stwierdzenia *podstawiając* pod *n* lub *m*:

1. Konkretną *liczbę* naturalną, na przykład liczbę *7*.

2. *Zmienną*, na przykład zmienną *a*, o której wcześniej *zdecydowałaś* (albo zdecydował autor
   przetwarzanego przez Ciebie matematycznego tekstu), że oznacza *jakąś* liczbę naturalną.

3. Całe *złożone wyrażenie*, będące formułą albo przepisem, o którym wiesz, że po obliczeniu dałoby
   liczbę naturalną, takie jak *10 - 1*.

Poza tym, że to muszą być *wyrażenia odpowiedniego typu*, to jest (na mocy jawnych deklaracji i
powszechnie przyjętych konwencji) wyrażenia *oznaczające liczby naturalne*, trzeba też pamiętać,
żeby *podstawianie* było *konsekwentne*. To znaczy, w miejscu każdego wystąpienia *n* musi być
podstawione to samo coś, co oznacza liczbę naturalną, i w miejscu każdego wystąpienia *m* musi być
podstawione to samo. Wreszcie trzeba wiedzieć, że to nie muszą być dwie *różne* "rzeczy"
("matematyczne obiekty"). I tak, zgodnie z przytoczonym fragmentem:

*2 + 3 = 3 + 2*  
(na mocy powszechnej konwencji, że *2* i *3* to liczby naturalne)

A jeżeli *a* i *b* to jakieś liczby naturalne, to również:

*a + b = b + a*  
(na mocy wspomnianej deklaracji)

*a + 10 = 10 + a*  
(jawna deklaracja i powszechna konwencja)

*b + b = b + b*  
(nie trzeba podstawiać różnych rzeczy)

*(2 + 3 + a) + b = b + (2 + 3 + a)*  
(możemy konsekwentnie podstawiać dowolnie *złożone* wyrażenia odpowiedniego typu)

Ostatnia równość jest wynikiem zastosowania twierdzenia o przemienności dodawania przez poprawne
podstawianie, ponieważ *2 + 3 + a* oznacza w tym kontekście (oto cały \{lokalny\} kontekst: *a* i
*b* to jakieś liczby naturalne) liczbę naturalną, i tak dalej. Myślę, że się zgodzisz, że takie
mechaniczne operacje wiele dzieci opanowuje bez większego trudu jeszcze w szkole podstawowej.

## Ten tytuł jest tylko po to, żeby do niego później wrócić

Możemy popatrzeć na to wszystko również tak: Ten fragment matematycznej prozy jest jak *przepis*,
który *stosując* da się wyprodukować *nieskończenie wiele prawdziwych zdań* na temat liczb
naturalnych. Rozważany przepis (twierdzenie) zawdzięcza swoją "nieskończoną produktywność"
*parametryczności*, to jest temu, że jest wyrażony za pomocą *parametrów* albo *zmiennych* (*m* i
*n*). Możemy też na niego popatrzeć jak na coś w rodzaju *maszyny* albo *mechanizmu*, który (jak to
mechanizm) *działa*, nawet jeśli działa tylko dzięki temu, że to *my* go używamy w określony sposób,
to jest konsekwentnie podstawiając w miejsca wystąpień zmiennych wyrażenia odpowiedniego typu (tu
akurat liczbowego). Ten mechanizm składa się co najmniej z *trzech* części:

1. Zapisanego w jakiś sposób matematycznego, to jest "bezmyślnie" albo *mechanicznie* stosowalnego
   *przepisu*.

2. Z *nas* samych (sic!).

3. Z tego, jak tego przepisu *używamy*.

W tej części książki to jest nasz punkt wyjścia i, jak się przekonasz, w pewnym momencie ta
dziecinnie prosta zabawa symbolami będzie również naszym punktem dojścia.

<hr>

**Dygresja na temat natury matematyki**: Zwróć proszę uwagę, że żaden obiekt nie byłby przepisem,
gdyby nie było przynajmniej *hipotetycznego kogoś*, kto go może *zastosować*, i to my, ludzie,
jesteśmy albo autorami takich przepisów, albo odkrywcami lub autorami konwencji, zgodnie z którymi
pewne rzeczy (takie jak fizyczny zapis *Jeżeli A = B i B = C, to A = C.*) możemy traktować jak
przepisy (dzięki czemu *są* przepisami). Najgłębszą podstawą całej matematyki są więc *nasze cele,
postawy, i sposoby działania*. Nawet jeśli przyjmiemy, że matematyka jest czymś, co raczej
"odkrywamy" niż "tworzymy", nie ma *dla nas* i nigdy nie będzie innej matematyki niż ta, której
*jesteśmy w stanie używać*, bo matematyka *jako taka* jest *naszym narzędziem* (konsekwentnego i
swobodnego myślenia na dowolny temat).

Co ciekawe, tylko jeden z trzech wymienionych wyżej elementów jest "definicyjnie autonomiczny". Mam
na myśli fakt, że ja i Ty istniejemy jako ja i Ty odpowiednio niezależnie od tego, czy używamy tego
rodzaju przepisów, czy nie, ale żeby taki przepis był faktycznie przepisem, musi istnieć ktoś, kto
może go w ten sposób używać, i tak samo żeby opisany sposób używania tego przepisu był tym, czym
jest, to jest pewnym sposobem używania czegoś (tutaj przepisu), musi istnieć *coś, co może być tak
używane* (tutaj przepis) i (choćby tylko hipotetyczny) *ktoś, kto może tak tego używać*. Można więc
powiedzieć, że *dwa* spośród tych trzech pojęć (przepisu, sposobu użycia i użytkownika) w pewnym
sensie "zawierają w sobie" albo "pochłaniają" wszystkie trzy.

<hr>

Spróbuj chwilowo potraktować takie formalne reguły jak te, które podałem wyżej, jakby były regułami
*gry*, która *nie musi mieć żadnego sensu*. Uwierz mi proszę na próbę, bo sprawdzałem to już
wielokrotnie - na tym etapie potrzeba sensu może Ci przeszkadzać. Obiecuję, że sens się sam pojawi,
tylko może kiedy indziej i raczej stopniowo.

**Polecenie**: *To zadanie może być na tym etapie trochę zbyt trudne. Jeżeli tak będzie,
spróbuj najpierw wykonać następne zadanie, a później ewentualnie wróć do tego.*  

Znajdź czystą kartkę papieru i coś do pisania. Napisz na niej cztery zdania, które będziemy chwilowo
rozumieć jako *aksjomaty*, czyli *reguły gry*, albo jeszcze lepiej *reguły językowe* albo
*komunikacyjne*, na które *umawiamy się bez uzasadnienia*:

1. Istnieją *fldsmdfry*.

Jeżeli $x$ i $y$ to jakieś (niekoniecznie różne)
[fldsmdfry](https://cloudywithachanceofmeatballs.fandom.com/wiki/FLDSMDFR), to ...

2. $\underbrace{x}$, $\underbrace{x, y}$, i $x \odot y$ są (jakimiś) liczbami.

3. $\underbrace{x, y}$ $=$ $\underbrace{y, x}$.

4. $x \odot y$ $*$ $\underbrace{y}$ = $\underbrace{x, y}$.

Wyobraź sobie teraz, że dałem Ci dwa fldsmdfry, $a$ i $b$. Użyj reguły 4, żeby uzyskać *dwa nowe
równania*, najpierw podstawiając $a$ *wszędzie* tam, gdzie w regule 4 występuje zmienna $x$ i $b$
wszędzie tam, gdzie występuje $y$, a potem odwrotnie, $a$ za $y$ i $b$ za $x$. Te dwa nowe równania
będą takie same jak równanie w regule 4, ale będą w nich występowały inne symbole ($a$ i $b$ zamiast
$x$ i $y$), nadal w roli zmiennych (bo przyjmujemy, że *a* i *b* to *jakieś* fmldsmdfry). Następnie,
korzystając z przechodniości relacji równości użyj reguły 3 w jedyny sposób, w jaki się da (ta
reguła mówi coś o tych dwóch nowych równaniach, a raczej o ich *stronach*), żeby uzyskać trzecie
nowe równanie. Zakładając, że $\underbrace{b} \neq 0$ podziel obie strony tego ostatniego równania
przez $\underbrace{b}$ (zgodnie z przyjętą konwencją te strony to \{jakieś\} liczby, a więc możemy
te strony dzielić przez liczby niezerowe), i uprość jedyną rzecz, którą możesz.

Jeżeli masz wątpliwości, czy dobrze wykonałaś to zadanie, nie przejmuj się tym, za chwilę wszystko
powinno się wyjaśnić. Jeżeli natomiast wydaje Ci się, że wykonałaś zadanie poprawnie, ale czujesz
frustrację związaną w jakiś sposób z brakiem poczucia sensu, to znakomicie, bo właśnie taki efekt
miałem nadzieję uzyskać. Jeżeli tak się stało, to może dzięki temu będziesz lepiej rozpoznawać w
przyszłości pewną ważną i nieoczywistą przeszkodę w nauce matematyki.

Naprawdę uważam, że zdolność do *tymczasowego* stłumienia potrzeby sensu bywa bardzo korzystna w
nauce matematyki. Od kilku lat prowadzę kurs dla doktorantów dotyczący wnioskowania przyczynowego i
bayesowskiego. Bez przesady mogę powiedzieć, że zapisują się na niego nieodmiennie wymarzeni wprost
studenci, tacy, którzy wydają mi się często autentycznie zainteresowani poszerzaniem wiedzy. Prędzej
czy później zaczynam na tym kursie mówić o [twierdzeniu
Bayesa](https://pl.wikipedia.org/wiki/Twierdzenie_Bayesa), ale od niedawna robię to inaczej.

Przedtem poprzedzałem wyprowadzenie dowodu krótkim wprowadzeniem. Gdy potem zapowiadałem
uczestnikom, że zaraz będą sami go dowodzić, zauważałem u niektórych objawy lekkiej paniki. Podobną
panikę widziałem zresztą w oczach pracowników naukowych, którzy byli obecni na moim otwarciu
przewodu, kiedy na slajdach pojawił się symbol [*sumy
indeksowanej*](https://pl.wikipedia.org/wiki/Rodzina_indeksowana) (*∑*). W tym roku po raz pierwszy
spróbowałem wprowadzić twierdzenie Bayesa bez wstępu, na pierwszych albo drugich zajęciach, i
postarałem się nakłonić wszystkich, żeby skupili się tylko na bardzo prostych w tym wypadku
operacjach formalnych. Różnica w *wykonaniu* - ale niekoniecznie w *zrozumieniu*! - była natychmiast
widoczna.

**Polecenie**: Znajdź czystą kartkę papieru i coś do pisania. Napisz na niej trzy zdania, które
będziemy chwilowo rozumieć jako *aksjomaty*, czyli *reguły gry*, albo jeszcze lepiej *reguły
językowe* albo *komunikacyjne*, na które *umawiamy się bez uzasadnienia*:

1. Istnieją tak zwane *zdarzenia*.

2. Istnieje funkcja *p*, która *zdarzeniom* lub ich parom przypisuje *liczby*.

3. Jeżeli *x* i *y* to *zdarzenia*, to *p(x, y) = p(y, x)*.

Niektóre symbole i terminy techniczne matematyki, to jest *=*, *funkcja*, *liczba* i *para*
(uporządkowana) traktujemy tutaj jako część wspólnej wiedzy zastanej. Właściwie z pierwszych dwóch
reguł nie będziemy korzystać jawnie, więc jeśli chcesz, możesz się skupić tylko na regule trzeciej.

Być może przyszła Ci do głowy narzucająca się interpretacja symboli *zdarzenie* i *p*. Jeżeli tak,
to spróbuj ją proszę zignorować, na ile tylko jesteś w stanie. Jeszcze raz podkreślam, że na tym
etapie to jest *tylko gra*.

Poza wymienionymi aksjomatami będziemy jeszcze potrzebować *definicji* symbolu *|*:

4. Jeżeli *x* i *y* to *zdarzenia*, to *p(x|y) * p(y) = p(x, y)*.

Zapisz teraz nową wersję definicji tej pionowej kreski, ale wpisując *y* wszędzie tam, gdzie w
wersji źródłowej jest *x*, a *x* wszędzie tam, gdzie w wersji źródłowej jest *y*. Czyli potraktuj tą
definicję jak przepis, tak jak pewnego rodzaju przepisem był dla nas wcześniej fragment
matematycznej prozy dotyczącej przemienności dodawania. Uzyskasz w ten sposób dwie wersje zdania
będącego treścią definicji - oryginalną i tą, która powstała przez podstawianie.

Skorzystaj z aksjomatu *3* w jedyny sposób, w jaki możesz, żeby ustalić, że lewe strony obydwu
wersji definicji są równe (na mocy przechodniości równości). Zapisz tą równość.

Podziel obie strony przez *p(y)*, zakładając oczywiście, że ta wartość jest różna od zera (wynik
dzielenia przez zero jest niezdefiniowany). Prosząc Cię, żebyś to założyła, mam na myśli, żebyś
"miała tego świadomość". Uprość jedyną stronę równania, którą da się w tym momencie uprościć.

Jeżeli wykonałaś wszystkie te *trywialne*, *mechaniczne* operacje zgodnie z instrukcjami, to udało
Ci się udowodnić nieznacznie uproszczoną wersję twierdzenie Bayesa. W dodatku zrobiłaś to już po raz
drugi, bo ten dowód i poprzedni *jako formalne dowody* różniły się tylko cechami *powierzchownymi*,
w tym wypadku nazwami stałych. Moim studentom, kiedy udowadniają w ten (drugi) sposób to twierdzenie
po raz pierwszy w życiu, nie zajmuje to więcej niż 15 minut.

Zwróć przy okazji uwagę, że udowodniłaś to twierdzenie ani nie przytaczając, ani nie odnosząc się do
żadnych konkretnych *zdarzeń*, ani nie obliczając żadnych wartości funkcji *p*. Czy widzisz, że o to
między innymi, to znaczy o duży stopień ogólności, chodzi w tego rodzaju twierdzeniach?

<hr>

**Dygresja na temat różnicy między aksjomatem i (zwykłą) definicją**: Kilka razy posłużyłem się w
tym rozdziale terminami technicznymi "aksjomat" i "definicja". Będę jeszcze do nich wracał, ale na
wszelki wypadek wyjaśnię już teraz, jak tych terminów używamy *w matematyce*. Jeżeli jeszcze nie
"czujesz", o czym tu mówię, nie przejmuj się tym, bo nie bez powodu nazwałem ten fragment
"dygresją".

Wszystkie aksjomaty są (specyficznymi) definicjami, a wszystkie definicje są (czyimiś) decyzjami. W
matematyce różnica między aksjomatem i definicją polega *tylko* na tym, że aksjomat jest *decyzją*,
że *jakiś nowy symbol oznacza coś jakiegoś typu, bo tak*, a definicja jest *decyzją*, że *jakiś nowy
symbol oznacza to samo, co jakieś dające się już poprawnie skonstruować wyrażenie, oznaczające coś
jakiegoś typu*.

Na przykład, jeden z *aksjomatów* Peano mówi, że *0* jest liczbą naturalną, czyli że *istnieje coś,
co oznacza symbol "0", i to coś jest liczbą naturalną, bo tak*. Fragment "bo tak" można rozumieć
między innymi jako "mówmy odtąd w ten sposób", to jest jako *arbitralną regułę komunikacyjną*. Inny
*aksjomat* Peano mówi, że istnieje (tak samo tajemnicza jak liczba *0*, bo nie *skonstruowana* z
niczego innego) operacja *następnika*, która z każdej liczby naturalnej "robi" (nie wiadomo jak)
jakąś liczbę naturalną.

Z kolei *definicja* symbolu "1" mówi, że "1" oznacza to samo, co dające się *skonstruować* na mocy
wcześniejszych aksjomatów wyrażenie "następnik 0". W końcu *0* jest na mocy aksjomatu liczbą
naturalną, a *następnik* jest na mocy aksjomatu funkcją, którą możemy stosować do dowolnych liczb
naturalnych, w tym również do *0*. A więc wyrażenie "następnik 0" oznacza konkretną liczbę
naturalną, którą da się uzyskać stosując konkretną, chociaż w żaden sposób nie skonstruowaną funkcję
*następnik* do również konkretnej, ale nie skonstruowanej liczby *0*, i którą to liczbę (na mocy
definicji) możemy zapisać za pomocą symbolu "1".

Inaczej mówiąc, w matematyce aksjomaty to dokładnie *wybrane przez kogoś definicje, których nie ma
do czego rozwinąć* (albo "rozpakować"), a *zwykłe* definicje to tylko *wybrane przez kogoś
alternatywne sposoby zapisu*, służące zwykle do tego, żeby można było coś napisać krócej lub
bardziej czytelnie.

<hr>

Wersja twierdzenia Bayesa, którą właśnie udowodniłaś, jest uproszczona. Prawdopodobieństwa nie mogą
być mniejsze niż *0* ani większe niż *1*, a nasze prawdopodobieństwa to dowolne liczby, nie wiadomo
nawet jakie, czy na przykład rzeczywiste, czy wymierne. Tak się jednak składa, że nie
potrzebowaliśmy korzystać z tych własności prawdopodobieństwa, nasze reguły nie były więc wcale
*niezgodne* z rachunkiem prawdopodobieństwa, tylko *słabsze* (w znaczeniu "mniej zobowiązujące", nie
w znaczeniu "gorsze" czy "bardziej wątpliwe").

Wypadałoby niby poza tym wprowadzić pojęcie [*zmiennnej
losowej*](https://pl.wikipedia.org/wiki/Zmienna_losowa), a zamiast o *zdarzeniach* powinniśmy może
mówić o (dyskretnych) [*zdarzeniach
elementarnych*](https://pl.wikipedia.org/wiki/Przestrze%C5%84_zdarze%C5%84_elementarnych), albo o
zdarzeniach zdefiniowanych
[ogólniej](https://pl.wikipedia.org/wiki/Przestrze%C5%84_probabilistyczna). Jednak jako narzędzie
stworzone dla pewnych celów dydaktycznych i w rękach kogoś, kto zna i ma na uwadze te ograniczenia,
taka uproszczona wersja jest moim zdaniem znacznie lepsza, niż nic. Wystarcza na przykład do
zilustrowania wielu ciekawych zastosowań twierdzenia Bayesa w psychologii, albo do snucia ogólnych
rozważań na temat oceny hipotez empirycznych.

Mam nadzieję, że skonstruowanie tego dowodu, a zwłaszcza jego pierwszej, agresywnie bezsensownej
wersji, pozwoliło Ci doświadczyć czegoś, co sam niby wiedziałem od dawna, ale dopiero ostatnio
zaczęło do mnie lepiej docierać, co z tego wynika. Gdy poprosiłem doktorantów o skonstruowanie,
według wskazówek zapisanych w skrypcie w języku Lean, dowodów kilku prostych tautologii, większość,
o ile nie wszyscy, wykonali to zadanie z łatwością. Gdy zapytałem potem o wrażenia - o ile dobrze
pamiętam po chwili wahania - zgłosiła się Sofiia Honcharova, i zdobyła się na odwagę, żeby
powiedzieć, że chociaż wykonała zadanie dość szybko, to *nie wiedziała, co się stało*.

Ta odpowiedź nie dawała mi później spokoju, dlatego poprosiłem Sofiię, żeby spróbowała powiedzieć
więcej. I wtedy wyjaśniła, że "czuła się jak małpa". Moim zdaniem mówiąc to trafiła w
sedno. *Znalezienie* dowodu jest *sztuką*, ale skonstruowanie dowodu *według wskazówek*, tak samo
jak *weryfikacja* poprawności dowodu, to czynności *mechaniczne*. A skoro to są czynności
mechaniczne, to znaczy, że można zarówno *skonstruować* (ale nie *znaleźć*) dowód jak i *sprawdzić*
go *nie rozumiejąc sensu dowodzonego twierdzenia*. Wynika stąd, że sama *znajomość dowodu mówi
niewiele*, a często może nawet *nic*, o znaczeniu dowiedzionego zdania.

Żeby zrozumieć, co *znaczy* dane zdanie, trzeba go przede wszystkim *używać*, dowodząc za jego
pomocą *innych* zdań lub rozwiązując jakieś problemy, poznając w ten sposób jego
*konsekwencje*. Dlatego zależy mi, żebyś nie oczekiwała od dowodów tego, czego nie będą mogły Ci
dać. Rolą dowodu *nie* jest *ujawnianie sensu dowodzonego zdania*, tylko *rozstrzyganie o jego
prawdziwości*, jak również - zawsze tylko częściowe - *ujawnienie znaczenia założeń
dowodu*. Wykonując dwa razy ten sam w zasadzie dowód poznałaś więc pewien fakt - że twierdzenie
Bayesa wynika logicznie z pewnych reguł - i *w pewnym sensie* dowiedziałaś się czegoś na temat
znaczenia czy sensu *tych reguł*, ponieważ miałaś okazję doświadczyć niektórych sposobów, w jaki
można je *zastosować*, czyli poznałaś niektóre ich *konsenwencje*.

Od chwili, w której jakieś matematyczne zdanie zostało formalnie udowodnione, wiemy na pewno, że
było, jest i zawsze już będzie prawdziwe. Od tego momentu o samym dowodzie, to jest o jego
konkretnej strukturze, możemy spokojnie *zapomnieć*, chyba, że chcemy z niego skorzystać jako ze
wskazówki podczas poszukiwania innego dowodu.

Będziemy odtąd robić podobne rzeczy, ale [nie na
kartce](R05_Pierwszy_spacer_po_Leanie_wersja_pierwsza.md).
