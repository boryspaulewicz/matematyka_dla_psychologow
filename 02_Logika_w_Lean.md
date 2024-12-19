# Twierdzenia to funkcje

**Polecenie**: Żeby było łatwiej, zaczniemy od niezrozumiałego na tym etapie zadania. Pamiętasz
naszą uogólnioną identyczność zdefiniowaną przy pomocy zapisu skrótowego?

```lean
def identycznosc (typ : Type) (a : typ) : typ :=
    a
```

A czy pamiętasz jeszcze, że pod takim skrótowym zapisem ukrywa się zawsze jakaś funkcja
jednoargumentowa, bo w Leanie tak naprawdę mamy tylko takie funkcje?

```lean
def identycznosc (jakis_typ : Type) : jakis_typ → jakis_typ :=
    fun (jakis_argument : jakis_typ) => jakis_argument
```

Może jednak taka, krócej zapisana wersja będzie łatwiejsza do czytania (nie wiem, którą wolisz)?:

```lean
def identycznosc (t : Type) : t → t :=
    fun (a : t) => a
```

Przypomę jeszcze, że wszystkie specyfikacje parametrów w definicjach funkcji, takie jak `(t : Type)`
w definicji, którą widać wyżej, to tak naprawdę niejawne λ-abstrakcje:

```lean
def identycznosc : (t : Type) → t → t :=
    fun (t : Type) =>
        fun (a : t) => a
```

I dodam, że zgodnie z obowiązującą w Leanie regułą wiązania dla strzałki `(t : Type) → t → t` znaczy
to samo, co `(t : Type) → (t → t)`.

Jeżeli w tym momencie masz wrażenie, że już trochę to rozumiesz, ale czujesz się niepewnie, bo takie
przesuwanie dwukropka to na razie dla Ciebie trochę zbyt wiele, to moim zdaniem to może w zupełności
wystarczyć, żeby czytać dalej. Jeżeli jednak nie jesteś jeszcze gotowa, żeby traktować przykłady
takie jak te wyżej jako punkt wyjścia do dalszej nauki, to pewnie warto wrócić do dwóch poprzednich
rozdziałów.

Wybierzemy teraz arbitralnie jedną z wersji definicji i skupimy się tylko na niej:

```lean
def identycznosc (typ : Type) (a : typ) : typ := a
```

**Czytamy to**: Funkcja `identycznosc` dla dowolnego typu (`(typ : Type)`) i dowolnego argumentu
*tego* typu (`(a : typ)`) zwraca ten argument.

Spróbuj teraz zobaczyć, że to, co widać niżej, to prawie to samo, co widać wyżej, w definicji stałej
`identycznosc'`, tylko:

- Zamiast słowa kluczowego `def` pojawia się `theorem`, czyli *twierdzenie*, które dla Leana oznacza
*prawie* to samo, co `def`.

- Zamiast typu `Type` pojawia się typ `Prop`. 

Twoim zadaniem jest teraz dokończyć tą definicję twierdzenia / funkcji `tautologia` tak, żeby była
poprawna, w najprostszy możliwy sposób. Podpowiadam, że nie ma prostszej funkcji o podobnym typie
niż funkcja `identycznosc`:

```lean
-- Dokończ definicję korzystając z definicji funkcji identycznosc' jako wzorca:
theorem tautologia (jakies_zdanie : Prop) : jakies_zdanie → jakies_zdanie :=
```

Jeżeli Ci się to udało, to całkiem możliwe, że udało Ci się dzięki temu, że nie próbowałaś za bardzo
"utrzymać świadomego rozumienia" tego, co robiłaś wykonując polecenie. A może jednak nie? Mogę tylko
zgadywać. Tak czy inaczej, nie wiedząc o tym jeszcze (chyba, że czytasz to ponownie), właśnie
stworzyłaś w Leanie swój pierwszy *dowód twierdzenia matematycznego*. Już wyjaśniam.

## Typy to też termy, a zdania to jednocześnie termy typu Prop i typy, których termy są ich dowodami. Co?

Najpierw muszę Ci powiedzieć o *hierarchii typów*. Jak wiesz, stała `2` jest termem typu
`Nat`. Zapis `2 : Nat` ma dla Leana sens, bo `Nat` jest również pewną, znaną od razu Leanowi
stałą. W teorii typów, której używamy w Leanie, *każdy typ* (na przykład typy `Nat` i `Type`) *jest
również termem*, ale *typu ogólniejszego* inaczej *wyższego* (na przykład `Type : Type 1`), i tak w
nieskończoność[^1]:

```lean
-- 2 to "zwykły" term, to jest taki, który nie jest typem. Ja sobie wyobrażam, że takie termy "są na dnie":
#check 2 -- 2 : Nat

-- Nat to typ i jednocześnie term ogólniejszego typu, który nazywa się Type. Chciałoby się zapisać:
--  2 : Nat : Type
-- ale Lean nie pozwala na taką notację.
#check Nat -- Nat : Type, a tak naprawdę Nat : Type 0

-- Type (czyli Type 0) to typ i jednocześnie term ogólniejszego typu Type 1
#check Type -- Type : Type 1

-- Już mniej więcej wiesz, na czym polega ta hierarchia typów, prawda?
#check Type 1 -- Type 1 : Type 2

--- ...

#check Type 665 -- Nie umieszczaj nigdy kursora na tej linii! I nie pij tej wody!!

-- A więc pisząc w sposób, którego Lean nie lubi:
-- 2 : Nat : Type 1 : Type 2 : Type 3 : Type 4 : i tak dalej ...
```

Typy wyższych rzędów są potrzebne *tylko* z pewnych nudnawych powodów technicznych i rzadko, o ile w
ogóle, będą nas interesować. Może słyszałaś o paradoksie albo [antynomii
Russella](https://pl.wikipedia.org/wiki/Antynomia_Russella)? Fryzjer, który goli tych i tylko tych
mieszkańców, którzy akurat stoją na jednej nodze, ale niekoniecznie swojej, dlatego musi być tym
bardziej ostrożny, gdy używa brzytwy, bo jak ich goli, to... Może pomińmy szczegóły. Chodzi w każdym
razie o coś zbliżonego. Nie słyszałaś? To zazdroszczę.

**Typy są trochę jak zbiory, ale nie całkiem**: 

Lean ma również wbudowany typ `Prop`, który będzie odtąd dla nas ważny. To jest typ wyższego rzędu,
podobnie jak na przykład `Type 1`, to znaczy, termy typu `Prop` same są typami, ale typ `Prop`
zachowuje się trochę inaczej niż typy `Type n` (gdzie *n* to liczba naturalna). Jego nazwa jest
skrótem od angielskiego *Proposition* oznaczającego *zdanie* albo *sąd*. Oto, dlaczego ten typ
będzie dla nas odtąd ważny (chodzi o izomorfizm Curry'ego-Howarda):

*Termy typu `Prop` można konsekwentnie interpretować jako zdania*.

A ponieważ `Prop` jest typem wyższego rzędu, *zdania są typami*. Dlatego często je nazywać *typami
zdaniowymi*.

*Termy typu zdaniowego można konsekwentnie interpretować jako dowody tego zdania (tego typu zdaniowego)*.

To może być na początku dezorientujące, więc jeszcze raz, tylko inaczej:

Jeżeli `a : Prop` (czytaj: `a` jest termem typu `Prop` albo `a` jest zdaniem), to jeżeli `h : a`
(czytaj: `h` ma typ `a` albo `h` jest termem typu `a` albo `h` jest termem typu zdaniowego `a`), to
możemy konsekwentnie interpretować `h` jako *dowód* albo *świadectwo prawdziwości zdania
`a`*. Zwykle będziemy w takich sytuacjach mówić krótko, że *`h` jest dowodem `a`*. Mamy tutaj do
czynienia z dwoma poziomami, na których występują typy (to tylko ilustracja):

```lean
-- jakis_dowod to tylko term, nie typ
-- jakies_zdanie to typ, ale również term, bo każdy typ to również term
-- Typem termu (i zarazem typu) jakies_zdanie jest Prop. Wiem wiem, ale pamiętaj proszę, że przecież wszystko mija.
jakis_dowod : jakies_zdanie : Prop
```

**Komentarz dla nazbyt dociekliwych i chaotycznie czytających**: To, że możemy w ten sposób
konsekwentnie interpretować termy typu `Prop` i termy, których te termy są typami (nie zgubiłaś się
jeszcze?) wynika z [izomorfizmu
Curry'ego-Howarda](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence), czyli z
identyczności strukturalnej (bo tym jest izomorfizm) zachodzącej między (pewną) przestrzenią
programów komputerowych i przestrzenią dowodów. Inne określenie na to samo to *Propositions As
Types*, czyli *sądy jako typy*, o takim samym skrócie - *PAT* - co jeszcze inne określenie na to
samo, *Proofs As Terms*, czyli *dowody jako termy*. Jeżeli te uwagi budzą Twój niepokój, nie
przejmuj się nimi, będziemy korzystać z tego izomorfizmu, ale nie będziemy go oglądać z bliska, bo
nie ma takiej potrzeby.

Izomorfizm Curry'ego-Howarda oznacza w praktyce, że możemy kodować, to jest zapisywać w języku
teorii typów w sposób dający się konsekwentnie interpretować w zamierzony sposób, dowolne
matematyczne pojęcia, struktury i zdania jako *typy* i że termy typów zdaniowych możemy
konsekwentnie traktować jak dowody. Dzięki temu zaciera się, a czasem całkiem znika, różnica między
matematyką i programowaniem.

**(De)Motywator**: Że dowód jest termem o typie, który jest zdaniem, którego to zdania ten term
dowodzi (*uff*), to jest jedna z tych początkowo dezorientujących konwencji, do których trzeba się
po prostu stopniowo przyzwyczaić. Gdy do pewnego stopnia to nastąpi, ta akurat konwencja pozwoli Ci
zobaczyć *całą* matematykę w nowy sposób. Wydaje mi się czasami, że im bardziej próbuję to wyjaśnić,
tym może być gorzej i niewykluczone, że najlepiej w tym wypadku działa metoda mimowolnego (i
relatywnie bezmyślnego) oswojenia.

Jedną z wielu zalet tego punktu widzenia jest i ta, że można wtedy uprawiać matematykę albo tylko
się uczyć jej w interakcji z programem komputerowym, który wspomaga konstruowanie pojęć, teorii,
własnej notacji i dowodów matematycznych, czyli z [asystentem
dowodzenia](https://en.wikipedia.org/wiki/Proof_assistant), takim jak Lean. Można mieć wtedy nie
tylko pewność, że to, co się napisało czy skonstruowało jest poprawne, albo że jest błędne, ale
można też korzystać z rozmaitych udogodnień, które taki asystent oferuje.

## O logice w Lean

**Ostrzeżenie i zarazem wyzwanie**: Będzie trzeba *stopniowo* opanować sztukę *w miarę*
konsekwentnego *odróżniania*:

1. Dowolnych zdań *jako takich*, a więc niekoniecznie prawdziwych, od...

2. *Prawdziwości lub fałszywości* dowolnych zdań, a tego z kolei od...

3. Ewentualnego *faktu*, że jakieś zdanie (albo jego negacja) *ma dowód*, wreszcie...

4. *Założenia, że* zdanie ma *jakiś* dowód, od kodu czy *konstrukcji* takiego dowodu.

W tym momencie samo to, że to nie są te same rzeczy czy fakty, może Ci się wydawać zrozumiałe i może
wręcz nie warte objaśniania, ale przekonasz się, że te fundamentalne rozróżnienia będą Ci sprawiać
trudności nawet w stosunkowo prostych sytuacjach. Jeszcze raz - cierpliwości. Gdybym ja czytał tekst
taki jak ten, nie znając wcześniej tematu, na pewno wracałbym wielokrotnie do niektórych mniej
jasnych dla mnie fragmentów i wiele razy czułbym, że się gubię.

Zajmiemy się najpierw *implikacją*. Implikacja jest być może najważniejszym spójnikiem w
logice. Mówiąc luźno, implikacjami nazywamy zdania o postaci *Jeżeli A, to B*, gdzie *A* i *B* to
*dowolne* zdania, proste lub złożone (i tylko same zdania, a nie ich prawdziwość czy fałszywość,
albo fakt bycia dowiedzionym, albo ich dowody). Powszechnie zapisuje się implikację za pomocą
strzałki skierowanej w prawo: →. Wygląda znajomo?

Jeżeli *A* i *B* to zdania - i tylko wtedy - to formalnie, czyli w "oficjalnym" języku matematyki,
implikację *Jeżeli A, to B* zapisujemy zwykle jako *A → B*. Nic? Żadnych skojarzeń?

**Dygresja**: Niektórzy mówią, że język matematyki jest *precyzyjny*, jednak w matematyce mówimy
czasem *celowo nieprecyzyjnie*. Na przykład, możemy wyrazić wprost w matematyce zdanie, że jakaś
wielkość znajduje się w jakimś szerokim interwale, albo że jest bardziej lub mniej prawdopodobna. W
matematyce mówimy też czasem *celowo wieloznacznie*. Na przykład, my niebawem będziemy stopniowo
zacierać różnice między funkcjami i implikacjami.

Co więc wyróżnia język matematyki, poza *relatywną sztucznością*, która nie wydaje się taka istotna?
Nie jestem pewien, ale gdybym miał zgadywać, powiedziałbym, że jest to *jednoznaczność i sztywność
reguł użycia*, ale tylko *formalnego*, czyli takiego mechanicznego albo nawet "bezmyślnego". I
jeszcze to, że chociaż pojęcia matematyczne często mają genezę w pojęciach często używanych w języku
naturalnym, to zwykle stanowią ich wersję bardzo uproszczoną do kilku dobrze określonych
właściwości. Te są wyrażane czasem jako *aksjomaty*, czyli podawane bez uzasadnienia formalnego, a
więc *bez dowodu* (za to zwykle z uzasadnieniem w języku naturalnym) *konwencje dotyczące
dopuszczalnych sposobów używania pojęć*.

W ten sposób - odzierając pojęcia (na przykład, pojęcie zdania, prawdy, fałszu, prawdopodobieństwa,
czy wpływu) ze zbędnych dla dobrze określonych celów znaczeń (w przypadku pojęć zdania, prawdy i
fałszu - dla celu analizy w pewien techniczny sposób rozumianej poprawności rozumowań), uzyskujemy
całkowitą sztywność reguł użycia i wysoki poziom abstrakcji. Sztywność reguł pozwala na mechaniczną
weryfikację wyrażeń, w tym poprawności dowodów, a abstrakcyjność daje ogólność zastosowań.

TODO **Oswojenie z terminologią logiczną**: Zawsze, gdy mamy jakieś dwa, niekoniecznie różne zdania
*A* i *B*, możemy napisać *A → B* i to będzie poprawne wyrażenie (poprawna formuła logiczna), które
interpretujemy jako (niekoniecznie prawdziwe, a tym bardziej udowodnione) zdanie *Jeżeli A, to
B*. Mówimy też, że *→* to w logice pewna *dwuargumentowa operacja* albo *działanie*, tyle że na
zdaniach, które to działanie z dwóch *zdań jako takich* (niekoniecznie udowodnionych czy
prawdziwych) robi jedno (niekoniecznie udowodnione czy prawdziwe) unikalne zdanie złożone, dające
się konsekwentnie interpretować jako *Jeżeli A, to B*.

Może przyda Ci się wyobrażenie sobie, że zdanie w logice to coś płaskiego i niemal przezroczystego,
a jego dowód to jakiś barwny skarb, który prześwituje przez powierzchnię zdania, jeśli ten dowód
istnieje i umiemy na to zdanie popatrzeć tak, żeby ten prześwit zobaczyć. Ja czasem tak o tym myślę.

**Analogia między implikacjami i typami funkcyjnymi**:

Jeżeli *A* i *B* to *zdania*, to *A → B* jest *implikacją*.

Jeżeli `A` i `B` to *typy*, to `A → B` jest *typem funkcji przekształcających termy typu `A` w termy
typu `B`*.

**Polecenie**: Nie proszę Cię, żebyś ją zapamiętała, ale proszę, żebyś nie szukając w niej na siłę
sensu spróbowała zaakceptować następującą konsekwencję: *Ponieważ w teorii typów każde zdanie jest
typem, to każda implikacja jest funkcją*.

**Przy okazji**: Powyższa analogia może wygląda jak wieloznaczność i w pewnym sensie nią
jest. Jednak to byłaby wieloznaczność problematyczna tylko gdybyśmy sprawili, że nie jest całkiem
jasne, którą interpretację stosujemy i gdyby *jednocześnie* ta różnica w dopuszczalnych
interpretacjach miała znaczenie dla poprawności wniosków.

**Terminologia ogólna**: W matematyce *unikalne* znaczy zwykle *dokładnie jedno danego rodzaju*. I
tak, w przypadku implikacji otrzymujemy unikalne zdanie powstające w taki a nie inny sposób z każdej
określonej pary zdań. Podobnie dodawanie (*+*) to operacja na liczbach, która z dwóch dowolnych,
niekoniecznie różnych liczb, na przykład *2* i *2*, robi unikalną liczbę, w tym wypadku *4*. Ten
wynik jest w przyjętym znaczeniu unikalny, chociaż dodawanie nieskończenie wielu innych par liczb
(na przykład całkowitych) daje taki sam rezultat. Możemy też powiedzieć, że zdanie w postaci
implikacji jest *funkcją* uporządkowanej (bo liczy się, które zdanie będzie traktowane jako
poprzednik, a które jako następnik implikacji) pary zdań.

**Zalety maksymalnej formalności**: Wiem, że często piszę długie zdania. Tym razem jednak chociaż
przez chwilę robiłem to celowo. Chciałem w ten sposób zilustrować coś ważnego: Dzięki temu, że
posługujemy się prostymi symbolami na oznaczenie dowolnie złożonych zdań, możemy łatwiej zapanować
nad strukturą rozumowania w sytuacjach, w których bez takiego skrótowego zapisu moglibyśmy się łatwo
pogubić. Logika pozwala nam *w kontrolowany sposób ignorować treść* zdań *bez szkody dla
poprawności* wnioskowania. To też, to jest "beztreściowość", mamy na myśli mówiąc o "formalności"
zapisu matematycznego. Wreszcie, formalny zapis ułatwia robienie czegoś, co jest ogromną siłą
matematyki: ułatwia a właściwie umożliwia rozwiązywanie zarówno prostych jak i złożonych problemów
*mechanicznie*, jakbyśmy układali puzzle, albo grali w grę.

Coś takiego będziemy właśnie robić, to znaczy, będziemy grać w grę polegającą na konstruowaniu
dowodów, bo będziemy *całkowicie* formalizować każdy problem. Będziemy więc używać matematyki w
sposób *bardziej* formalny niż ma to zwykle miejsce nawet w najbardziej zaawansowanych podręcznikach
do matematyki. Matematycy tak zwykle *nie* postępują, bo im się nie chce i (zwykle) nie muszą;
zamiast tego polegają na domyślności kompetentnego odbiorcy. My nie chcemy się musieć niczego
domyślać, bo nie jesteśmy tak kompetentni jak zawodowi matematycy. Jesteśmy tylko, i aż,
psychologami.

Pełna formalizacja wymaga dodatkowego wysiłku, ale dzięki niej będzie nam czasem (jednak nie
oszukujmy się, nie zawsze) *łatwiej*. Przede wszystkim zaś wszystko, co napiszemy, będzie
*sprawdzone przez algorytm, który zawsze da nam odpowiedź, czy to, co napisaliśmy, jest
matematycznie poprawne*. Będziemy więc w pewnym sensie "zawsze bezpieczni" w swoich
(sformalizowanych) rozważaniach.

**(De?)motywator**: Koszt, który musimy ponieść, żeby to osiągnąć, to częściowe oswojenie się z co
prawda mniej złożonym niż język polski, ale obcym, sztucznym, i bezlitośnie sztywnym językiem, jakim
jest formalny język matematyki. Tak jak to ma miejsce w przypadku nauki każdego nowego języka,
trzeba się uzbroić w cierpliwość (jeszcze chyba wspomnę o tej cierpliwości później). 

Jest jak sądzę wiele prawdy w stwierdzeniu, którego autorem jest genialny polski matematyk Jerzy von
Neumann (https://en.wikipedia.org/wiki/John_von_Neumann), że często matematykę się nie tyle rozumie,
ile raczej się do niej *przyzwyczaja*. Dodam od siebie, że gdy się już trochę do niej przyzwyczai
(co wymaga czasu), to zadziwiająco często okazuje się, że jej pojęcia, twierdzenia i teorie wyrażają
coś, co rozumiało się dobrze od samego początku, tylko nie umiało się o tym dostatecznie
konsekwetnie *mówić*, a więc również konsekwentnie albo spójnie *myśleć*.

**Polecenie**: Możemy zapisać symbol implikacji w Leanie pisząc `\to` i naciskając spację. Wpisz
teraz w Leanie `\to` i naciśnij spację, a następnie ulegnij olśnieniu na widok powstającej
strzałki. Jak już ochłoniesz, usuń ten symbol, bo `→` w izolacji nie jest poprawnie skonstruowanym
wyrażeniem języka Lean, co Lean sygnalizuje podkreślając je czerwoną falką.

**Analogia dla osób, które już programowały**: Być może znasz jakiś inny język programowania, na
przykład *C*. Jeżeli nie, to te uwagi być może nie będą dla Ciebie pomocne, ale nie zaszkodzi
spróbować. W języku *C* możemy *zadeklarować*, albo "ogłosić" - jeszcze zanim przypiszemy jej
jakąkolwiek wartość - że zmienna `x` ma być liczbą całkowitą, pisząc (nie pisz tego w Lean, Lean Cię
nie zrozumie):

```C
int x;
```

*C* jest wspaniałym językiem, do pewnych zastosowań sprawdza się znakomicie, ale w porównaniu do
Lean'a *C* jest językiem dosyć prymitywnym i mało ekspresyjnym. Siła ekspresji języka Lean jest tak
duża, że można w nim zakodować we względnie naturalny sposób wszelkiego rodzaju treści matematyczne!
Chcę przez to powiedziec, że moim zdaniem jesteś wart/a Lean'a.

W języku Lean możemy wyrazić (prawie) to samo, co `int x` wyraża w języku *C*, czyli, że zmienna `x`
jest (jakąś) liczbą całkowitą, pisząc (ale nie pisz tego teraz w Lean, to tylko przykład):

```lean
x : Z
```

Moim zdaniem szybko oswoisz się z tą notacją. Litera *Z* jest powszechnie przyjętym symbolem
oznaczającym liczby całkowite (od niemieckiego słowa "*Zahlen*"), o czym wspominam bo czuję, że
wypada, chociaż nie będziemy korzystać z typu `Z`.

**Polecenie**: Napisz samodzielnie definicję funkcji o nazwie `plus_i_minus`, która do swojego
pierwszego parametru dodaje drugi i odejmuje trzeci i której wszystkie parametry i rezultat są typu
`Nat`. Używając komendy `#check` sprawdź typ samej tej funkcji, jak również aplikacji tej funkcji do
jednej, dwóch i trzech liczb naturalnych, wszystko jedno jakich. Ewaluuj za pomocą komendy `#eval`
aplikację tej funkcji do trzech liczb naturalnych i sprawdź, czy wynik się zgadza. Jeżeli ten wynik
miałby być mniejszy od zera, to Lean poda zero, ponieważ ujemne liczby naturalne nie istnieją.

# Pierwsze zadanie z logiki

Niebawem udowodnimy takie oto zdanie:

*Jeżeli a, to a.*

To zdanie jest trywialne i trywialnie prawdziwe, ale w matematyce nawet trywialne prawdy wymagają
(zwykle) dowodu. Nadamy naszemu dowodowi nazwę i ten nazwany dowód razem z jego nazwą i zdaniem,
którego dowodzi, staną się jedną strukturą - matematycznym *twierdzeniem*. Uprzedzam, że chociaż
zdanie *Jeżeli a, to a* jest w oczywisty sposób zawsze prawdziwe, a jego dowód jest bardzo prosty,
to i tak wykonując to zadanie po raz pierwszy prawdopodobnie zdążysz się co najmniej raz poczuć
zagubiony/a.

Musimy sobie teraz wyjaśnić coś na temat logiki w Lean.

**Uwagi o logice klasycznej i konstruktywnej**: Być może miałe/aś już do czynienia z elementami
logiki zdań. Jeśli tak, to może to być teraz do pewnego stopnia *przeszkoda*. Logika zdań jest
najczęściej wykładana w wersji tak zwanej *klasycznej*, w której prawdą jest, że:

*Każde zdanie jest albo prawdziwe, albo fałszywe.* (zdanie prawdziwe w logice klasycznej)

Jak również:

*Dla każdego zdania* p *, jeżeli nieprawda, że nieprawda, że* p *, to* p. (inne zdanie prawdziwe w
logice klasycznej)

W Lean domyślnie (można to łatwo zmienić, ale nie będziemy tego teraz robić) używamy logiki
*konstruktywnej*, inaczej *intuicjonistycznej*, a nie klasycznej. Ta logika jest "ostrożniejsza" w
tym znaczeniu, że wszystko, co jest prawdą w logice konstruktywnej, jest też prawdą w logice
klasycznej (o ostrożniejszych założeniach lub teoriach i o ogólniejszych pojęciach mówimy, że są
*słabsze*), ale nie odwrotnie. W logice konstruktywnej można przyjąć, że:

*Zdanie prawdziwe znaczy to samo co zdanie udowodnione.* (dopuszczalna interpretacja prawdy w logice
konstruktywnej)

Co za różnica? Jeżeli postanowimy intepretować słowo "prawdziwe" jako równoznaczne z "udowodnione",
to *nie możemy* zaakceptować jako prawdziwego zdania *Każde zdanie jest albo prawdziwe, albo
fałszywe* (nazywanego m.in. zasadą wyłączonego środka), bo wiemy (istnieje twierdzenie, które to
mówi), że w matematyce da się skonstruować zdania prawdziwe, których nie da się udowodnić. Nie
możemy więc też zaakceptować zasady podwójnej negacji (jeżeli nieprawda, że nieprawda, że *p*, to
*p*), bo zasada wyłączonego środka z niej wynika (i vice versa). Jeśli Cię to niepokoi, to
zapewniam, że ta różnica nieprędko będzie dla nas ważna, a gdy już to nastąpi, będziesz na to
gotowa/y.

Wracamy do zdania *a → a*. W logice konstruktywnej, żeby udowodnić implikację *A → B*, gdzie *A* i
*B* to dowolne zdania, trzeba *skontruować procedurę*, która dowolny dowód zdania *A* przekształca w
dowód zdania *B*. Niebawem rozwiążesz zadanie opierając się na tej interpretacji prawdziwości
implikacji, a mimo to zgaduję, że i tak możesz przez pewien czas po tym sukcesie czuć, że ta
interpretacja jest dla Ciebie dziwna.

**Polecenie**: Skopiuj poniższy fragment kodu do lewego okna sesji Lean:

```lean
theorem t1 (a : Prop) : a → a := by
```

**Objaśnienie kodu**: Wyrażenie `a : Prop` czytamy jako: `a` jest wyrażeniem (przypominam, że
oficjalna nazwa na takie coś to *term*) typu `Prop`, a ponieważ `Prop` to typ zdań (od angielskiego
*Proposition* oznaczającego sąd), znaczy to, że `a` jest jakimś, niekoniecznie prawdziwym albo
udowodnionym zdaniem, inaczej sądem.

**Czytamy kod**: Twierdzenie (`theorem`), które nazwaliśmy bez żadnego specjalnego powodu *t1*
(`t1`), a które z jednego argumentu `a` (nazwa *a* też była wybrana arbitralnie) typu `Prop` (`(a :
Prop)`) robi term typu `a → a`, czyli dowód zdania `a → a` (`: a → a`), bo `a` jest zdaniem, można
skonstruować albo (w Lean to jest to samo) zdefiniować (`:=`) za pomocą trybu interaktywnego (`by`)
w taki oto sposób... i tu będziemy niebawem konstruować dowód. To było długie zdanie z licznymi
wtrąceniami. Może warto przeczytać je jeszcze raz.

**Uwaga o równości definicyjnej i równości jako zdaniu**: Gdy w Lean piszemy na przykład:

```lean
def n : Nat := 10
```

to *definiujemy raz na zawsze* stałą `n` o typie `Nat` *powiadamiając* Lean, że *postanowiliśmy*, że
`n` znaczy `10`. Symbol `:=` oznacza więc w Lean *operację definiowania*, która jest niczym innym
jak naszym *wyborem językowym*. Jeżeli natomiast piszemy (nie pisz tego w Lean) na przykład `n =
10`, gdzie znak `=` występuje bez poprzedzającego dwukropka, to *tworzymy zdanie*, którego *treścią*
jest "*n jest równe 10*" i to zdanie może być w danym kontekście prawdziwe (w logice konstruktywnej:
udowodnione), fałszywe (w logice konstruktywnej: istnieje dowód jego negacji), albo może mieć
nieokreślony status pod względem prawdziwości. 

Nawet, gdy zdefiniujemy `n` jako stałą o wartości `10`, to zdanie `n = 10` (tu jest symbol `=`, a
nie `:=`) będzie wymagało w Lean udowodnienia, żeby można je było uznać za prawdziwe!  Ten dowód
jest bardzo prosty, bo polega jedynie na tak zwanym *rozpakowaniu* albo *zastosowaniu definicji*
zmiennej `n`, ale nadal jest to dowód.

**Wracamy do twierdzenia `t1`**: Słowo kluczowe `by` jest teraz podkreślone czerwoną falką, bo dowód
jest rozpoczęty, ale nie jest jeszcze zakończony. Ponieważ pisząc `by` weszliśmy w *tryb dowodzenia
interaktywnego*, gdy kursor znajduje się *za* słowem `by`, to w prawym oknie widzimy *aktualny stan*
konstruowanego w trybie interaktywnym dowodu. Pod zakładką *Tactic state* w prawym oknie widzimy
teraz:

```lean
1 goal
a : Prop
⊢ a → a
```

Czytamy to jako: Został jeden cel do udowodnienia (`1 goal`), inaczej term albo program (sic!) do
skonstruowania, który mamy zrealizować czy skonstruować posługując się (tutaj akurat tylko jednym)
założeniem, że `a` jest (niekoniecznie prawdziwym albo udowodnionym) zdaniem (`a : Prop`). Ten cel
to implikacja `a → a` (`⊢ a → a`). 

Jak już wiesz, stworzenie dowodu zdania `a → a` w Lean jest tym samym co stworzenie termu (można
myśleć programu albo kodu) o typie `a → a`. Jak mamy skonstruować taki term / dowód / program? Musi
on udowadniać następnik zakładając poprzednik, co w logice konstruktywnej znaczy:

*Przekształcać dowolny dowód zdania `a` w dowód zdania `a`*.

A mówiąc ogólniej o dowodzeniu implikacji w logice konstruktywnej:

*Jeżeli A i B to zdania, to w logice konstruktywnej dowód zdania A → B to każda funkcja, która w
jakikolwiek sposób przekształca dowolny dowód zdania A w dowód zdania B.*

Być może czytając powyższe zdanie wyobrażała/eś sobie, że ta funkcja / dowód przekształca dowód
zdania *A* w jakiś sposób "zaglądając do środka" tego dowodu, albo w jakimś sensie polegając na
własnościach struktury tego dowodu, na przykład rozbiera go na części, albo wykrywa coś w jego
wnętrzu. Nie o to chodzi. Ta funkcja / dowód ma dostarczyć dowód *B* korzystając z *bliżej
nieokreślonego* dowodu *A*, a więc z samego *faktu istnienia* dowodu *A*.

**Dygresja terminologiczna**: Symbol `⊢` to symbol derywacji albo wnioskowania albo konstruowania
(różnie można na to patrzeć, więc też różnie można ten symbol nazywać).

**Terminologia**: Zdanie *A* w implikacji *A → B* nazywamy *poprzednikiem*, a dokładnie
poprzednikiem implikacji *A → B*, a zdanie *B* jej *następnikiem*.

**Dezorientator**: Pokażę Ci teraz naprostszy sposób skonstruowania dowodu tego twiedzenia. Nie
kopiuj tego kodu, tylko może zastanów się nad nim przez chwilę:

```lean
theorem najprosciej (a : Prop) : a → a := fun (x : a) => x
```

A teraz jeszcze inny, ale podobny sposób, który może Ci na początku namieszać trochę w głowie:

```lean
theorem najprosciej_ale_inaczej : (a : Prop) → a → a := fun (a : Prop) => fun (x : a) => x
```

To twierdzenie jest funkcją przekształcającą dowolne zdanie, które dla wygody nazwamy `a`, w term
typu `a → a`, czyli w dowód zdania `a → a`, który to dowód sam jest funkcją, tyle, że
przekształcającą dowolny dowód zdania `a` w ten sposób, że nic z nim nie robi, tylko go zwraca.

Zauważ, że musimy najpierw "mieć" `a` typu `Prop`, czyli jakieś zdanie `a`, żeby w ogóle móc mówić /
pisać w języku teorii typów zależnych o zdaniu `a → a`, albo o dowodzie zdania `a` jako argumencie
funkcji anonimowej (`(x : a)`). Gdyby nie wcześniejsza informacja, że `a : Prop`, *nie byłoby
wiadomo, czym są* wyrażenia `(x : a)` i `a → a` (bo `a` byłoby tak zwaną zmienną wolną). `a → a` to
przykład *typu zależnego* - `a → a` jest *typem, który zależy od / jest skonstruowany z / jest
funkcją* argumentu `a`. Czegoś takiego nie można wyrazić wprost w językach takich jak *C* albo *R*.

Jeżeli to jest niejasne, nie przejmuj się tym teraz. Z czasem posługiwanie się typami zależnymi
stanie się nie tylko jasne, ale wręcz całkiem naturalne, o ile będziesz dość cierpliwy/a. Może
jednak to Ci choć trochę pomoże dostrzec naturalność typów zależnych: Przytoczony na początku tego
skryptu fragment prozy matematycznej można traktować jako funkcję, która z dowolnych dwóch liczb
naturalnych, które można nazwać *m* i *n*, tworzy zdanie *n + m = m + n*, traktowane przypuszczalnie
jako po prostu prawdziwe, to jest bez dowodu. Powiedziałem przypuszczalnie, bo ten fragment prozy
był wyrwany z kontekstu (a tak naprawdę wymyślony przeze mnie).

Pomijając kwestię statusu czy sensu zdania *n + m = m + n* w tym fragmencie, jest oczywiste, że to
zdanie ma sens tylko w kontekście, w którym *n* i *m* oznaczają jakieś liczby. Gdybyśmy chcieli
częściowo (o kodowaniu relacji równości i operacji takich jak dodawanie będziemy mówić kiedy
indziej) formalnie zakodować ten fragment w stylu teorii typów, moglibyśmy napisać:

```
m : Liczba naturalna
n : Liczba naturalna
jakiś_dowód : m + n = n + m
```

Naturalność tego kodowania staje się oczywista, gdy porównamy je z fragmentem napisanym w języku
naturalnym:

```
Jeżeli n i m to liczby naturalne, to 
m + n = n + m
```

Myślę, że widzisz teraz wyraźnie konieczność zadeklarowania typów zmiennych *n* i *m* zanim napisze
się *m + n = n + m*.

**Implikacja w praktyce dowodzenia**: Żeby udowodnić w Lean zdanie `p → q`, trzeba udowodnić, że
zdanie `q` (następnik) jest prawdziwe, *zakładając*, że zdanie `p` (poprzednik) jest prawdziwe,
czyli w hipotetycznej sytuacji, w której `p` jest prawdziwe. W logice konstruktywnej to znaczy:

*Udowodnić zdanie *p → q* to podać sposób skonstruowania dowodu *q*, *zakładając*, że *p* ma *jakiś*
dowód*.

**Polecenie**: Napisz teraz w następnej linijce, zaraz pod skopiowanym wcześniej do Lean'a kodem
zaczynającym się od `theorem ...`, a kończącym na `by`, komendę:

`intro h`

Jeżeli przesuniesz kursor *za* wpisaną właśnie komendę `intro h`, to w prawym oknie zobaczysz, że
*stan dowodu uległ zmianie*:

```lean
1 goal
a : Prop
h : a
⊢ a
```

W ten sposób Lean pokazuje nam, co *mamy* (nad symbolem `⊢`) i jeszcze musimy *zrobić* (za tym
symbolem), żeby zakończyć dowód.

Mówiąc ogólnie, jeżeli aktualnym celem w trybie interaktywnym jest udowodnienie zdania o postaci *P
→ Q* (tutaj akurat `a → a`, ale *P* i *Q* mogą być dowolnie złożonymi poprawnymi zdaniami), to
`intro` z argumentem `h` powoduje, że *wprowadzamy jako założenie hipotetyczny dowód* poprzednika
implikacji *P → Q*, czyli wprowadzamy jako założenie hipotetyczny dowód zdania *P* (tutaj akurat
dowód zdania "atomowego", czyli nie-złożonego, `a`), i oznaczamy ten hipotetyczny dowód wybranym do
tego symbolem `h` (bo tak nam się podoba). Jeżeli coś innego, co mamy (nad `⊢`), już ma tą samą
nazwę, to musimy wybrać inną, bo nazwy zmiennych występujących w kontekście (a wszystko nad `⊢` to
właśnie kontekst) muszą być unikalne. Może przeczytaj cały ten fragment jeszcze raz.

**Uwaga na temat taktyk**: `intro` jest tak zwaną *taktyką*, to znaczy operacją, której możemy
używać *tylko* w trybie interaktywnym (ogólnie, do interaktywnego konstruowania dowolnych termów
określonego typu, ale tutaj akurat konstruujemy dowód zdania).

Wprowadzając `a` jako założenie, a dokładniej zakładając, że `a` ma *jakiś* dowód i to *posiadanie
jakiegoś dowodu* przyjmując jako założenie `h`, sprawiliśmy, że poprzednik implikacji `a → a`, a
ściślej (hipotetyczny) dowód tego poprzednika, "wskoczył na górę" jako coś, co zakładamy, że mamy, a
przez to to, co mamy skonstruować, czyli cel, *uprościło się* do samego następnika (tutaj `a`). Mamy
więc prostszy cel i więcej środków, żeby go udowodnić!

**Polecenie**: Ten dowód możesz zakończyć natychmiast, używając wprost dostępnego w tym momencie
(hipotetycznego) dowodu zdania `a`, bo *to zdanie jest takie samo jak jedyny cel*. Żeby to osiągnąć,
napisz w następnej linijce:

`exact h`

Jeżeli kursor znajdzie się za wpisaną właśnie komendą `exact h`, to stan dowodu widoczny w prawym
oknie powinien wyglądać tak:

`No goals`

Mówimy czasem w takich sytuacjach, że cel został "usunięty", albo "zniszczony", albo "zanihilowany",
albo "unicestwiony" i to jest moim zdaniem piękne (jak również "formalne" w swojej mechanicznej
wymowie).

Udało Ci się właśnie udowodnić, dla arbitralnego, czyli dowolnego zdania `a`, twierdzenie `a → a` o
nazwie `t1`, używając jednocześnie logiki konstruktywnej (inaczej intuicjonistycznej), teorii typów
zależnych, izomorfizmu Curry'ego-Howarda i prawdopodobnie nie znanego Ci w ogóle wcześniej języka
programowania Lean. Możesz się pochwalić znajomym, rodzinie, czy przypadkowo spotkanym osobom.

**Jeszcze raz, ale inaczej, objaśnie, co się właśnie stało**: Pisząc `by` weszłaś/wszedłeś w tryb
interaktywny konstruowania termu. Ponieważ typem konstruowanego termu był `a → a`, gdzie `a` było
zdaniem, zacząłeś/aś w ten sposób konstruować dowód zdania `a → a`. Wpisując komendę `intro h`
przyjąłeś/aś założenie, że `a` ma jakiś dowód (`h`) i zakładając to udowodniła/eś `a` w najprostszy
możliwy sposób - przytaczając ten dowód (`exact h`, czyli dokładnie `h` jest rozwiązaniem / dowodem
/ termem typu, który jest celem).

Ale przecież dowodzenie jest programowaniem! Dlatego można też powiedzieć, że skutkiem komendy
`intro h` było *rozpoczęcie konstruowania anonimowej funkcji* (tak zwanej *λ-abstrakcji*) - `fun
(h : a) =>` ... - a skutkiem komendy `exact h` było zdefiniowanie ciała tej funkcji jako "dokładnie"
albo "po prostu" `h`, czyli ostatecznie dowód polegał na interaktywnej konstrukcji anonimowej
funkcji `fun (h : a) => h`. 

Co robi ta funkcja? Pobiera dowolny dowód `a` i go zwraca. Istnienie tej funkcji jest jakby
"ucieleśnieniem" (trywialnego) faktu, że jeśli `a` ma dowód, to `a` na dowód. W logice
konstruktywnej to właśnie znaczy *Jeżeli *a*, to *a*.*

Dowód, który skonstruowaliśmy za pomocą taktyk w trybie interaktywnym jest więc taki sam, jak ten,
który możemy zdefiniować wprost pisząc:

```lean
theorem t1 (a : Prop) : a → a := fun (h : a) => h
```

Można to przeczytać również tak: dla każdego dowodu `h` zdania `a`, zracam / mam / można stworzyć /
istnieje dowód `a` i jest nim `h`.

**Zadanie do samodzielnego rozwiązania**: Spróbuj teraz samodzielnie dokończyć dowód następującego
twierdzenia, kopiując najpierw poniższy fragment kodu. Gdy poczujesz się zagubiona/y, zaglądaj
czasem do okna po prawej, albo do wcześniejszych fragmentów tego skryptu. Albo weź głęboki oddech,
albo zrób sobie krótką albo dłuższą przerwę. To są sprawy wielkiej wagi, a w sprawach wielkiej wagi
zwykle nie należy się spieszyć.

Najpierw spróbuj bez podpowiedzi, a jak poczujesz, że to jednak za trudne (co by mnie wcale nie
zdziwiło), zerknij poniżej, znajdziesz tam pomoc. Jeżeli chcesz skorzystać z podpowiedzi, za każdym
razem spróbuj "wygrać w tą grę" zaglądając tylko do jednej podpowiedzi, z której jeszcze nie
skorzystałaś/eś.

```lean
theorem t2 (p : Prop) (q : Prop) : p → q → p := by
```

**Podpowiedź**: Trzeba dwa razy użyć taktyki `intro`, w dodatku jeden raz "jakby
niepotrzebnie". Trzeba też uważać z nazwami podanymi jako argumenty dla `intro`, bo nie mogą się
powtarzać w tym samym kontekście (przypominam, w trybie interaktywnym kontekst widać jako listę
deklaracji nad znakiem `⊢`). Skutek zastosowania taktyki zobaczysz z prawej jeżeli kursor będzie się
znajdował za końcem komendy użycia tej taktyki.

**Podpowiedź**: Taktyki `intro` trzeba użyć za każdym razem w nowej linijce, albo w tej samej, ale
oddzielając oba użycia symbolem `;`. W ramach tego samego dowodu trzeba zwykle wybierać inną nazwę
dla każdego nowego wprowadzanego (`intro` to skrót od *introduction*) założenia, na przykład
najpierw nazwę `h1`, a następnie nazwę `h2`, albo najpierw nazwę `Jas`, a potem `Malgosia`. Dobrze
jest stosować jakąś prostą, spójną konwencję w wymyślaniu nazw.

**Podpowiedź**: Na końcu trzeba będzie użyć taktyki `exact` z odpowiednim argumentem. Nie podpowiem
już którym, ale podpowiem, że o ile wszystko do tej pory poszło dobrze, to nazwę odpowiedniego
argumentu dla taktyki `exact` znajdziesz w tym, co masz lokalnie do dyspozycji, czyli w oknie po
prawej powyżej symbolu `⊢`, czyli w kontekście. W ten sposób unicestwisz jedyny cel, jaki będzie do
unicestwienia (jeżeli wprowadziłeś oba założenia tej podwójnej implikacji).

**Nie czytaj, jeżeli jeszcze nie rozwiązałeś ostatniego zadania**: Co tu się stało? Nie powiedziałem
tego wcześniej, ale `p → q → p` to tak naprawdę `p → (q → p)`. Nawiasy muszą tu być, nawet, gdy są
niejawne, bo `→` jest operatorem dwuargumentowym, więc bez przyjęcia jakiejś konwencji dotyczącej
nawiasów `p → q → p` jest wyrażeniem w sposób problematyczny niejednoznacznym. 

No więc celem jest `p → (q → p)`. Jeżeli celem jest implikacja, a `p → (q → p)` jest implikacją z
poprzednikiem `p` i następnikiem `(q → p)`, to odowodnienie jej polega na skonstruowaniu dowodu
następnika, czyli `(q → p)`, zakładając dowód poprzednika, czyli dowód `p`. Zakładamy, że mamy `h1 :
p` i od tego momentu mamy nowy, prostszy cel, `(q → p)`. Żeby osiągnąć ten cel zakładamy `h2 : q` i
próbujemy udowodnić / unicestwić nowy cel `p`. Ale to już mamy jako `h1 : p`, a więc przytaczamy
dowód `h1` dosłownie (`exact h1`). Nie ma więcej celów, czyli dowód jest skonstruowany / zakończony.

Ten sam dowód moglibyśmy zdefiniować wprost w ten sposób:

```lean
theorem t2 (p : Prop) (q : Prop) : p → q → p := fun (h1 : p) => fun (h2 : q) => h1
```

Czy widzisz, że pozornie zbędne wprowadzenie założenia / abstrahowanie od dowodu `q` było konieczne,
żeby typ konstruowanego dowodu / termu zgadzał się z celem / zdaniem / typem `p → q → p`?

**Polecenie**: Po udanym wykonaniu tego zadania spróbuj je zrobić od początku jeszcze raz, ale
tłumacząc przy tym, jaka jest przyjęta przez nas interpretacja tego, co robisz. Jak się pogubisz w
tych wyjaśnieniach, poszukaj wskazówek w poprzednich komentarzach.

# O twierdzeniach jako funkcjach i ich stosowaniu

Być może widzisz już analogię między tym, jak zapisaliśmy twierdzenie, a raczej jak skonstruowaliśmy
jego dowód, a tym, jak definiuje się funkcje albo procedury w bardziej przyziemnych językach
programowania. Na przykład, w języku *C*:

```C
int suma(int a, int b){
  return a + b;
}
```

to definicja funkcji albo procedury dodającej dwie liczby typu `int`. Dokładniej, ta napisana w *C*
funkcja z dwóch dowolnych argumentów typu `int` (liczb całkowitych), które z perspektywy kodu "w
środku" funkcji suma (czyli z perspektywy jej ciała) nazywają się `a` i `b`, robi liczbę całkowitą
wyliczoną przez ich dodawanie i zwraca tą liczbę jako rezultat.

W *C* typ rezultatu funkcji piszemy najpierw (`int` na początku pierwszej linijki), potem piszemy
nazwę definiowanej funkcji (tutaj znowu `suma`), potem w nawiasach wyliczamy jej parametry podając
najpierw ich typy i oddzielając je przecinkiem, a na końcu definiujemy ciało funkcji, otaczając je
nawiasami klamrowymi. Średnik sygnalizuje koniec instrukcji, przy czym tutaj mamy tylko jedną
instrukcję w ciele, `return a + b`. Tak zdefiniowaną funkcję możemy potem w języku C *zastosować* do
dwóch argumentów całkowitoliczbowych, na przykład tak:

```C
int wynik = suma(1, 20);
```

W ten sposób zadeklarowaliśmy jako całkowitoliczbową nową zmienną `wynik` i jednocześnie
przypisaliśmy jej, będącą wynikiem zastosowania funkcji `suma` do argumentów `1` i `20`, wartość
`21`.

**Trochę się obawiam o tym pisać, ale muszę**: Mamy tu znowu znak równości i znowu ten symbol znaczy
coś innego! Tym razem to nie jest (ostateczna) definicja, ani nie jest to równość jako zdanie, tylko
*operacja przypisania wartości do zmiennej*. Operacja przypisania stanie się dla nas niezwykle ważna
gdy będziemy mówić o *formalnej teorii przyczynowości*. Różnica między przypisaniem i definicją
polega na tym, że raz przypisaną do zmiennej wartość można później *zmienić*, natomiast definicje są
*ostateczne*. Zmienne, którym przypisujemy wartości są więc jak pudełka, które mają modyfikowalną
wartość. Z kolei raz zdefniowane stałe są nieodwołalnymi konwencjami językowymi.

Definicja, a tak naprawdę *przypisanie* (w ten sposób *R* interpretuje znak `=`) do zmiennej `suma`
analogicznej funkcji w języku *R* wygląda podobnie, ale prościej:

```R
suma = function(a, b){
  a + b
}
```

Język *R* również traktuje wszystkie zmienne jako obiekty, które mają określony typ i w *R*, tak jak
w *C*, równość oznacza przypisanie wartości do zmiennej, ale w *R* nie musimy zwykle jawnie
deklarować typu, bo na ogół sam się tego "domyśla".

W takim zwykłym języku programowania jak *C* jawne typowanie służy zmniejszeniu ryzyka błędu: Jeżeli
na przykład spróbujemy zastosować mnożenie do dwóch zmiennych tekstowych, a nie liczbowych, to
program nie zostanie skompilowany do wersji, którą możemy uruchomić, bo bez napisania specjalnego
kodu mnożenie nie działa w *C* dla zmiennych tekstowych. Dzięki wykryciu błędu na tym wczesnym
etapie, to jest przed uruchomieniem programu, unikamy (potencjalnie trudnych do wykrycia) problemów
po uruchomieniu. W Lean typowanie ma również i takie zastosowanie, ale służy też do znacznie
ciekawszych rzeczy, takich jak formalizacja i automatyczne sprawdzanie poprawności treści
matematycznych.

Twierdzenia w języku Lean zapisaliśmy używając składni języka Lean, a nie składni języka *C* czy
*R*, bo Lean to nie *C* ani *R*, ale ogólna struktura kodu definiującego twierdzenie jest taka sama
("modulo notacja"), jak na przykład struktura definicji funkcji w *C*:

`theorem t2 (p : Prop) (q : Prop) : p → q → p := by ...`

Nazwę funkcji podaliśmy po słowie kluczowym `theorem`, typ rezultatu podaliśmy po znaku `:`, od razu
widać też, gdzie są parametry twierdzenia-jako-funkcji `t2` i jakie mają typy, wreszcie ciało tej
funkcji zdefiniowaliśmy za pomocą kodu występującego po znaku `:=`.

Jeżeli teraz na przykład *zadeklarujemy* (to akurat nie jest definicja, tylko deklaracja, która
obowiązuje tylko w tych fragmentach kodu, w których `a` jest zarazem widoczne i używane), że mamy
(jakieś) zdanie `a`, używając w Lean słowa kluczowego `variable`:

```lean
variable (a : Prop)
```

to będziemy mogli zastosować twierdzenie `t1` tak samo, jak stosowaliśmy funkcje `suma` czy `dodaj2`
i tak samo, jak stosuje się funkcje w *C* czy w *R*, tylko pisząc to trochę inaczej, bo składnia
jest inna. 

**Polecenie**: Wklej ten fragment do Lean'a i umieść kursor nad komendą `#check`, powinieneś/aś
zobaczyć po prawej to, co zapisałem poniżej jako komentarz.

```lean
#check t1 a -- t1 : a → a
```

W ten oto sposób możemy *stosować twierdzenie* `t1` do dowolnego zdania, na przykład do jakiegoś
zdania bardziej złożonego, takiego jak `a → a`:

```lean
#check t1 (a → a) -- t1 (a → a) : (a → a) → (a → a)
```

albo do zdania `a → (a ∧ a)` [Czytaj: `a` implikuje koniunkcję zdań `a` i `a`]

```lean
#check t1 (a → (a ∧ a)) -- t1 (a → (a ∧ a)) : (a → (a ∧ a)) → (a → (a ∧ a))
```

**Typy zależne**: Słowo `theorem` istnieje głównie dla wygody urzytkownika. Moglibyśmy równie dobrze
zastąpić je tutaj słowem `def`, bo `t1` jest zarazem *twierdzeniem* i *funkcją*. Różni się jednak
pod ważnym względem od na przykład funkcji `suma`. Funkcja `suma` zwraca liczby naturalne, czyli
termy typu `Nat` *i tylko tego typu*. Funkcja `t1` zwraca za to dowody *różnych* zdań, czyli *termy
różnych typów*, zależnie od tego, jakie zdanie dostanie jako argument. To jest przykład *typu
zależnego*. Tego też nie możemy zrobić wprost w językach takich jak *C* czy *R*.

Czy widzisz, jak dobrze to traktowanie twierdzeń jako parametrycznych funkcji pasuje do sposobu, w
jaki posługujemy się tym, co można odczytać ze zwykłej "prozy matematycznej"?  Żeby to jeszcze raz
zilustrować, przypomnimy sobie znowu ten sam fragment, tylko nadamy mu nazwę:

```
Przemienność dodawania: Jeżeli n i m to liczby naturalne, to n + m = m + n
```

Stąd już bardzo blisko do:

```
Przemienność dodawania (n : Liczba naturalna) (m : Liczba naturalna) : n + m = m + n
```

co możemy wyrazić w Lean w ten sposób (jako aksjomat, czyli *definicję bez ciała* {sic!}):

```lean
axiom przemiennosc_dodawania (n : Nat) (m : Nat) : n + m = m + n
```

Słowo kluczowe `axiom` sprawia, że możemy odtąd traktować `przemiennosc_dodawania` jako nazwę na
istniejący, chociaż bliżej nieokreślony, term typu `n + m = m + n`, czyli bliżej nieokreślony dowód
zdania `n + m = m + n`. Jeżeli to nie jest naturalna i dosłowna formalizacja naszego fragmentu prozy
matematycznej wyrażonej w języku naturalnym, to nie wiem, co mogłoby nią być.

Aksjomat możemy zastosować tak, jakby był twierdzeniem:

```lean
#check przemiennosc_dodawania 1 2 -- przemiennosc_dodawania 1 2 : 1 + 2 = 2 + 1
```

Wydaje się, że w ten sam sposób "stosujemy" fragmenty prozy matematycznej, takie jak ten dotyczący
przemienności dodawania, tylko że czasem robimy to "w głowie".

# Widok z lotu ptaka

Nasze twierdzenia zakodowane w Lean są więc jednocześnie:

1. Zdaniami matematycznymi połączonymi z dowodami tych zdań i unikalną w danym kontekście (lepiej -
   *środowisku*) nazwą.

2. Termami pewnego typu, konkretnie tak zwanego zależnego typu: *funkcja obliczająca / konstruująca
   z dowolnego zdania `a` term typu / dowód zdania `a → a`*.

W ten oto sposób *znika różnica między uprawianiem matematyki teoretycznej i programowaniem*.

**Ostatni motywator**: Jak wspominałem, mam powody sądzić, że nawet jeżeli dotarła/eś do tego
momentu i udało Ci się wykonać poprawnie wszystkie polecenia, możesz nadal mieć poczucie
dezorientacji i braku sensu. W związku z tym oferuję takie pocieszenie: Być może zdarzyło Ci się
kiedyś grać w gry typu FPS. Gdy nie ma się w takich grach doświadczenia, poruszanie się po mapie
bywa nieporadne, a wiele początkujących osób spędza dużo czasu z "nosem w ścianie" albo nawet "w
podłodze". Z czasem, gdy gra się trochę dłużej, stopniowo pojawia się coraz lepsza, utrzymująca się
coraz dłużej świadomość własnego położenia na mapie jako całości. To trochę tak, jakby jednocześnie
patrząc przez "niby-własne" oczy patrzyło się również, ale mentalnie, na swoje działania z lotu
ptaka, albo jakby się było jednocześnie we własnym ciele i w pewnym sensie ponad nim. To samo dzieje
się, gdy nabiera się praktyki w używaniu narzędzi formalnych. I tego Ci życzę, bo zdarza się czasem,
że taki widok z lotu ptaka na wyrafinowane i bywa, że wręcz ekstremalnie abstrakcyjne konstrukcje
formalne dostarcza poczucia ogromnej intelektualnej mocy.

**Ostatni (dez)orientator**: Z wnętrza ciała każdej funkcji widać jej parametry, na przykład z
wnętrza ciała naszej funkcji `suma` widać parametry `n` i `m` o typie `Nat`, ale z wnętrza ciała
każdej funkcji widać też zmienne, które zostały zdefiniowane wcześniej *na zewnątrz* definicji
funkcji. Na przykład, w ciele funkcji `dodaj2` używaliśmy stałej `2` i stałej `+`, które są
zdefiniowane w automatycznie ładowanej bibliotece Lean'a, na zewnątrz definicji funkcji `dodaj2`.

Jeżeli teraz przyjmiemy *aksjomatycznie*, czyli bo tak, że `p` jest (jakimś) zdaniem i że istnieje
term `dp`, który jest (jakimś) dowodem zdania `p`:

```lean
axiom p : Prop
axiom dp : p
```

to *w tym środowisku* (*środowisko* to *kontekst globalny*), albo *w ramach tej formalnej
(mini-)teorii* będziemy mogli udowodnić takie oto twierdzenie:

```lean
theorem t3 (a : Prop) : a → p := fun (h : a) => dp
```

To twierdzenie mówi: Dla każdego (zdania) `a`, jeżeli `a` (jest prawdą = ma dowód), to `p` (jest
prawdą = ma dowód).

Albo:

Dla każdego zdania `a`, w ten oto sposób (podany po symbolu definicji `:=`) można zrobić term typu
`a → p`. A ponieważ `a → p` jest zdaniem (= termem typu `Prop`) - bo `a` i `p` są zdaniami - to
znaczy, że można zrobić dowód zdania `a → p`, czyli, mówiąc krótko, dla każdego zdania `a`, jeżeli
`a`, to `p`.

Faktycznie, z każdego dowodu zdania `a` możemy w tym momencie zrobić dowód zdania `p`, *ignorując*
dowód zdania `a` i przytaczając dowód `dp` zdania `p`, który teraz (w aktualnym *środowisku*)
istnieje aksjomatycznie, czyli na mocy naszego wyboru i jest widoczny również wewnątrz ciała
definicji `t3`.

W pierwszej chwili to się może wydawać dziwne, ale przecież, jeżeli na przykład *wiemy już*, że
jutro będzie sobota (i ta wiedza tymczasowo spełnia rolę aksjomatu), to przyjmując obowiązującą w
logice interpretację implikacji, prawdą jest, że *jeżeli dzisiaj pada deszcz, to jutro będzie
sobota*, niezależnie od tego, czy dzisiaj pada deszcz, czy nie i niezależnie od tego, że między
dzisiejszym deszczem a jutrzejszym dniem tygodnia nie ma związku. *W tej sytuacji* prawdą jest, że
*jeżeli dzisiaj pada deszcz, to jutro będzie sobota*, po prostu dlatego, że ... jutro będzie
sobota.

[Do następnej części](./Matematyka_dla_psychologow_1.md)

## Przypisy

[^1]: Dawno, dawno temu byłem w Krakowie na koncercie zespołu
    [5’nizza](https://pl.wikipedia.org/wiki/5%E2%80%99nizza), na którym Serhij Babkin i Andriej
    Zaporożec wykonywali utwory z płyty [П'ятниця](https://www.youtube.com/watch?v=nnWMrmTWonI),
    której wtedy lubiłem czasem posłuchać. W pewnym momencie któryś z wykonawców wziął butelką i
    wtedy usłyszał z sali krzyk "Nie pij tej wody!". Uważam, że to było bardzo śmieszne.
