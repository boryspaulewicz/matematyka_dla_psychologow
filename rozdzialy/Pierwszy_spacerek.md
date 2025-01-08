## O czym teraz będzie

W tym rozdziale doświadczysz pewnego sposobu zajmowania się matematyką. Właściwie to znasz ten
sposób dobrze jeszcze z czasów kiedy byłaś uczennicą szkoły podstawowej, ale być może nie
zastanawiałaś się jak dotąd dłużej, o co w nim właściwie chodzi. Będziemy się teraz przyglądać z
bliska wybranym, ważnym i często wykonywanym w matematyce czynnościom, polegającym tak naprawdę na
dosyć prostych mechanicznych operacjach.

<hr>

# Kilka trywialnych mechanicznych operacji

Przypuszczam, że już dawno stało się dla Ciebie oczywiste, że jeżeli *A = B* i *B = C*, to *A = C*,
niezależnie od tego, co podstawisz pod *A*, *B* i *C*. Na pewno znajomy wyda Ci się również taki oto
fragment matematycznej prozy:

> Jeżeli *n* i *m* to liczby naturalne, to *n + m = m + n*.

I z pewnością wiesz, że możesz *używać* takiego stwierdzenia *podstawiając* pod *n* lub *m*:

1. Konkretną *liczbę* naturalną

2. *Zmienną*, na przykład zmienną *a*, o której wcześniej założyłaś, że oznacza (jakąś) liczbę naturalną

3. *Wyrażenie*, które po obliczeniu daje liczbę naturalną, takie jak *10 - 1*

Trzeba tylko pamiętać, żeby podstawianie było konsekwentne, to znaczy, za *n* musi być wszędzie
podstawione to samo i za *m* wszędzie to samo. Trzeba też wiedzieć, że to nie muszą być dwie różne
rzeczy. Na przykład, zgodnie z przytoczonym fragmentem:

*2 + 3 = 3 + 2*

A jeżeli *a* i *b* to jakieś liczby naturalne, to na przykład:

*a + b = b + a*

*a + 10 = 10 + a*

*b + b = b + b*

i *(2 + 3 + a) + b = b + (2 + 3 + a)*, bo *2 + 3 + a* oznacza w tym kontekście (oto cały kontekst:
*a* i *b* to jakieś liczby naturalne) jakąś liczbę naturalną, i tak dalej. Myślę, że zgodzisz się ze
mną, że tego rodzaju operacje wiele dzieci opanowuje całkiem nieźle w szkole podstawowej.

## Ten tytuł jest tylko po to, żeby do niego później wrócić

Możemy popatrzeć na to wszystko również tak: Ten fragment matematycznej prozy jest jak *przepis*,
który *stosując* da się wyprodukować *nieskończenie wiele prawdziwych zdań* na temat liczb
naturalnych. Możemy nawet na niego popatrzeć jak na coś w rodzaju maszyny albo mechanizmu, który
działa dzięki temu, że *my* go używamy w określony sposób, to jest konsekwentnie podstawiając w
miejsca zmiennych wyrażenia właściwego typu (typu liczbowego). W tej części książki to jest nasz
punkt wyjścia i - jak się przekonasz - w pewnym momencie ta dziecinnie prosta zabawa symbolami
będzie również naszym punktem dojścia.

Spróbuj chwilowo potraktować takie formalne reguły jak te, które podałem wyżej, jakby były regułami
gry, która nie musi mieć żadnego sensu. Uwierz mi, bo sprawdzałem to wielokrotnie, na tym etapie
potrzeba sensu może Ci przeszkadzać. Obiecuję, że sens się sam pojawi, tylko może kiedy indziej.

Naprawdę uważam, że zdolność do tymczasowego stłumienia potrzeby sensu bywa bardzo korzystna, a
czasami nawet nieodzowna w nauce matematyki. Od kilku lat prowadzę na Uniwersytecie Jagiellońskim
dwusemestralny kurs dla doktorantów dotyczący wnioskowania przyczynowego i bayesowskiego. Bez
przesady mogę powiedzieć, że na ten kurs trafiają nieodmiennie wymarzeni wprost studenci, tacy,
którzy wydają mi się często autentycznie zainteresowani poszerzaniem wiedzy. Prędzej czy później
zaczynam na tym kursie mówić o [twierdzeniu
Bayesa](https://pl.wikipedia.org/wiki/Twierdzenie_Bayesa), ale od niedawna robię to inaczej.

Przedtem poprzedzałem wyprowadzenie dowodu krótkim ogólnym wprowadzeniem i gdy zapowiadałem
uczestnikom, że zaraz będą sami go dowodzić, zauważałem u niektórych objawy lekkiej paniki. Podobną
panikę widziałem zresztą w oczach niektórych pracowników naukowych, którzy byli obecni na moim
otwarciu przewodu, kiedy na slajdach pojawił się symbol [*sumy
indeksowanej*](https://pl.wikipedia.org/wiki/Rodzina_indeksowana) (*∑*). W tym roku po raz pierwszy
spróbowałem wprowadzić twierdzenie Bayesa bez wstępu, na pierwszych albo drugich zajęciach, i
postarałem się nakłonić wszystkich, żeby skupili się tylko na bardzo prostych w tym wypadku
operacjach formalnych. Różnica w wykonaniu była natychmiast oczywista.

**Polecenie**: Znajdź czystą kartkę papieru i coś do pisania. Napisz na niej trzy zdania, które
będziemy chwilowo rozumieć jako *aksjomaty*, czyli *reguły gry*, albo jeszcze lepiej *reguły
językowe* albo *komunikacyjne*, na które umawiamy się bez uzasadnienia:

1. Istnieją tak zwane *zdarzenia*.

2. Istnieje funkcja *p*, która *zdarzeniom* lub ich parom przypisuje *liczby*.

3. Jeżeli *x* i *y* to *zdarzenia*, to *p(x, y) = p(y, x)*.

Niektóre symbole i terminy techniczne matematyki, to jest *=*, *funkcja*, i *liczba* traktujemy
tutaj jako część wspólnej wiedzy zastanej. Właściwie z pierwszych dwóch reguł nie będziemy tu
korzystać jawnie, a więc jeśli chcesz, możesz się skupić tylko na regule trzeciej.

Być może przyszła Ci do głowy narzucająca się interpretacja symboli *zdarzenie* i *p*. Jeżeli tak,
to spróbuj ją proszę zignorować, na ile tylko jesteś w stanie. Jeszcze raz podkreślam, *to tylko
gra*.

Poza aksjomatami będziemy jeszcze potrzebować *definicji* symbolu |:

4. Jeżeli *x* i *y* to *zdarzenia*, to *p(x|y) * p(y) = p(x, y)*.

Zapisz teraz nową wersję definicji tej pionowej kreski, ale wpisując *y* wszędzie tam, gdzie w
oryginalnej wersji jest *x*, a *x* wszędzie tam, gdzie w oryginalnej wersji jest *y*. Czyli
potraktuj tą definicję jak przepis, dokładnie tak samo jak wcześniej potraktowaliśmy inny fragment
matematycznej prozy. Uzyskasz w ten sposób dwie wersje zdania będącego treścią definicji -
oryginalną i tą, która powstała przez podstawianie.

Skorzystaj z aksjomatu *3* w jedyny sposób, w jaki możesz, żeby ustalić, że lewe strony obydwu
wersji definicji są równe i zapisz tą równość.

Podziel obie strony przez *p(y)*, zakładając oczywiście, że ta wartość jest różna od zera (wynik
dzielenia przez zero jest niezdefiniowany). Mówiąc, że masz to założyć, mam na myśli tylko, żebyś
"miała tego świadomość", tak na wszelki wypadek. Uprość jedyną stronę równania, którą da się w tym
momencie uprościć.

Jeżeli wykonałaś wszystkie te *trywialne*, *mechaniczne* operacje zgodnie z instrukcjami, to udało
Ci się udowodnić nieznacznie uproszczoną wersję twierdzenie Bayesa. Moim studentom, gdy robią to po
raz pierwszy w życiu, nie zajmuje to zwykle więcej niż 15 minut. Zwróć uwagę, że udowodniłaś to
twierdzenie ani nie przytaczając, ani nie odnosząc się do żadnych konkretnych *zdarzeń*, ani nie
obliczając żadnych wartości funkcji *p*. Czy widzisz, że o to między innymi, to znaczy o duży
stopień ogólności, chodzi w tego rodzaju twierdzeniach?

Wersja twierdzenia Bayesa, którą udało Ci się udowodnić, jest faktycznie wersją
uproszczoną. Prawdopodobieństwa nie mogą być mniejsze niż *0* ani większe niż *1*, a nasze
prawdopodobieństwa to dowolne liczby, nie wiadomo nawet jakie, czy na przykład rzeczywiste, czy
wymierne. Tak się jednak składa, że nie potrzebowaliśmy korzystać z tych własności
prawdopodobieństwa, nasz aksjomat nie był więc wcale *niezgodny* z rachunkiem prawdopodobieństwa, on
był tylko *słabszy*.

Wypadałoby niby poza tym wprowadzić pojęcie [*zmiennnej
losowej*](https://pl.wikipedia.org/wiki/Zmienna_losowa), a zamiast o *zdarzeniach* powinniśmy mówić
o (dyskretnych) [*zdarzeniach
elementarnych*](https://pl.wikipedia.org/wiki/Przestrze%C5%84_zdarze%C5%84_elementarnych), albo o
zdarzeniach zdefiniowanych
[ogólniej](https://pl.wikipedia.org/wiki/Przestrze%C5%84_probabilistyczna). Jednak jako narzędzie
stworzone dla pewnych celów dydaktycznych i w rękach kogoś, kto zna i ma na uwadze wszystkie te
ograniczenia, ta wersja jest moim zdaniem znacznie lepsza, niż nic. Wystarcza na przykład do
zilustrowania wielu ciekawych zastosowań tego twierdzenia w psychologii, albo do snucia ogólnych
rozważań na temat oceny hipotez empirycznych.

Mam nadzieję, że skonstruowanie tego dowodu pozwoliło Ci też doświadczyć czegoś, co sam niby
wiedziałem od dawna, ale dopiero ostatnio zaczęło do mnie trochę lepiej docierać, co z tego
wynika. Gdy poprosiłem doktorantów uczestniczących w moim kursie dotyczącym wnioskowania
przyczynowego i bayesowskiego o skonstruowanie według wskazówek zapisanych w skrypcie w języku Lean
dowodów kilku prostych tautologii, większość, o ile nie wszyscy, wykonali to zadanie bez większego
problemu. Gdy zapytałem potem o wrażenia - o ile dobrze pamiętam po chwili wahania - zgłosiła się
Sofiia Honcharova i zdobyła się na odwagę, żeby mi powiedzieć, że chociaż rozwiązała zadanie, "nie
wiedziała, co się stało".

Ta odpowiedź niedawno mi się przypomniała i od tej pory nie dawała mi spokoju. Dlatego poprosiłem
Sofiię, żeby spróbowała powiedzieć coś więcej. I wtedy wyjaśniła, że "czuła się jak małpa". Moim
zdaniem mówiąc to trafiła w sedno. *Znalezienie* dowodu jest *sztuką*, ale skonstruowanie dowodu
*według wskazówek*, tak samo jak *weryfikacja* poprawności dowodu, to czynności *mechaniczne*. A
stąd od razu można wywnioskować, że *znajomość dowodu* mówi niewiele, a często może nawet *nic*, o
*sensie* dowiedzionego zdania. Żeby zrozumieć, co *znaczy* dane zdanie, trzeba go przede wszystkim
*używać*, dowodząc *innych* zdań lub rozwiązując jakieś problemy i poznając w ten sposób jego
*konsekwencje*. Dlatego zależy mi, żebyś nie oczekiwała od dowodów tego, czego nie będą mogły Ci
dać; rolą dowodu danego zdania *nie* jest ujawnianie znaczenia tego zdania, tylko rozstrzyganie o
jego prawdziwości i (częściowe) ujawnienie znaczenia *założeń dowodu*.
