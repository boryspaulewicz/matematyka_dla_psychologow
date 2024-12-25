## O czym teraz będzie

W tym rozdziale będziesz mogła nareszcie zacząć robić gwałtowne postępy w uczeniu się matematyki, a
konkretnie zaczniesz ćwiczyć dowodzenie twierdzeń. W gruncie rzeczy, poza pierwszym kontaktem z
trybem interaktywnym i z typem zdaniowym `Prop`, nie pojawia się tu nic nowego, ale to, co będziemy
robić, będzie miało szczególny *sens* albo *interpretację*. Dlatego największym wyzwaniem podczas
lektury tego rozdziału będzie przyzwyczajnie się do subtelności o charakterze *pojęciowym*; pod
względem praktyki programowania to będzie właściwie bułka z masłem.

Dlatego - jeżeli oczywiście nie zaczęłaś tego robić wcześniej - proponuję spróbować zacząć robić
*jakiekolwiek* notatki, a może nawet zaplanować jakaś (pierwszą?) generatywną powtórkę. W ten sposób
znacznie lepiej wykorzystasz czas i wysiłek, który wkładasz w czytanie tej książki.

<hr>

# Logika na Leanie, pierwsze kroki

**Polecenie**: Żeby było *łatwiej*, zaczniemy od mam nadzieję *niezrozumiałego* na tym etapie
zadania. Pamiętasz naszą uogólnioną identyczność zdefiniowaną przy pomocy zapisu skrótowego?

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
takie, jak te wyżej, jako punkt wyjścia do dalszej nauki, to pewnie warto wrócić do wcześniejszych
rozdziałów.

Wybierzemy teraz arbitralnie jedną z wersji definicji i skupimy się tylko na niej:

```lean
def identycznosc (typ : Type) (a : typ) : typ := a
```

**Czytamy to**: Funkcja `identycznosc` dla dowolnego typu (`(typ : Type)`) i dowolnego argumentu
*tego* typu (`(a : typ)`) zwraca *ten* argument.

Spróbuj teraz zobaczyć, że to, co widać niżej, to prawie to samo, co widać wyżej, w definicji stałej
`identycznosc'`, tylko że:

1. Zamiast słowa kluczowego `def` pojawia się słowo `theorem` oznaczające *twierdzenie*, które dla
Leana oznacza *prawie* to samo, co `def`.

2. Zamiast typu `Type` pojawia się typ `Prop`.

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
stworzyłaś w Leanie swój pierwszy *dowód twierdzenia matematycznego*.

## Typy to też termy, a zdania to jednocześnie termy typu Prop i typy, których termy są ich dowodami. Co?

Muszę teraz wprowadzić pojęcie *hierarchii typów*. Jak wiesz, stała `2` jest termem typu
`Nat`. Zapis `2 : Nat` ma dla Leana sens, bo `Nat` jest również pewną, znaną od razu Leanowi
stałą. W teorii typów, której używamy w Leanie, *każdy typ* (na przykład typy `Nat` i `Type`) *jest
również termem*, ale *typu ogólniejszego* inaczej *wyższego* (na przykład `Type : Type 1`), i tak w
nieskończoność[^1]:

```lean
-- 2 to "zwykły" term, inaczej *term atomowy*, to jest taki, który nie jest typem. Wyobrażam sobie czasem, że takie 
-- termy "są na dnie":
#check 2 -- 2 : Nat

-- Nat to typ i jednocześnie term ogólniejszego typu, który nazywa się Type. Chciałoby się zapisać:
--  2 : Nat : Type
-- ale Lean nie pozwala na taką notację. Type to tak naprawdę Type 0, ale ponieważ typ Type 0 pojawia się bardzo często,
-- Lean pozwala zapisać go w ten skrótowy sposób i tak też go wyświetla.
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

Lean ma również wbudowany typ `Prop`, który będzie odtąd dla nas ważny. To jest typ wyższego rzędu,
podobnie jak na przykład `Type 1`, to znaczy, termy typu `Prop` same są typami, ale typ `Prop`
zachowuje się trochę inaczej niż typy `Type n` (gdzie `n` to dowolna liczba naturalna). Pokażę Ci
teraz, że typ `Prop` jest jakby odnogą albo odgałęzieniem hierarchii typów:

```lean
#check Prop -- Prop : Type

-- Komenda variable służy do deklarowania, że mamy ("skądś") jakiś term danego typu.
variable (cos_pod_typem_Prop : Prop)

-- cos_pod_typem_Prop jest jednocześnie termem (typu Prop) i typem.
variable (jakis_term : cos_pod_typem_Prop)

#check Nat -- Nat : Type

-- 2 nie jest typem, to tylko term, czyli 2 to pewien *term atomowy*.
#check 2 -- 2 : Nat
```

Nazwa typu `Prop` jest skrótem od angielskiego *Proposition* oznaczającego *zdanie* albo *sąd*. Oto,
dlaczego ten typ będzie dla nas odtąd ważny (chodzi o izomorfizm Curry'ego-Howarda):

*Termy typu `Prop` można konsekwentnie interpretować jako zdania*.

A ponieważ `Prop` jest typem wyższego rzędu, *zdania są typami*, dlatego zdania będziemy nazywać
czasem *typami zdaniowymi*.

*Termy typu zdaniowego można konsekwentnie interpretować jako dowody tego zdania (tego typu zdaniowego)*.

To może być na początku dezorientujące, więc jeszcze raz, tylko inaczej:

Jeżeli `a : Prop` (czytaj: `a` jest termem typu `Prop` albo `a` jest zdaniem), to jeżeli `h : a`
(czytaj: `h` ma typ `a` albo `h` jest termem typu `a` albo `h` jest termem typu zdaniowego `a`), to
możemy konsekwentnie interpretować `h` jako *dowód* albo *świadectwo prawdziwości zdania
`a`*. Ponieważ będziemy intensywnie korzystać z możliwości takiej spójnej interpretacji, zwykle
będziemy w takich sytuacjach mówić po prostu, że *`h` jest dowodem `a`*. Mamy tu do czynienia z
dwoma poziomami, na których występują typy (to tylko ilustracja):

```lean
-- jakis_dowod to tylko term, nie typ, inaczej term atomowy
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
konsekwentnie traktować jak dowody. Dzięki temu będzie się zacierać, a czasem całkiem znikać,
różnica między matematyką i programowaniem.

**Motywator**: Że dowód jest termem o typie, który jest zdaniem, którego to zdania ten term dowodzi
(*uff*), to jest jedna z tych początkowo dezorientujących konwencji, do których trzeba się po prostu
stopniowo przyzwyczaić. Gdy do pewnego stopnia to nastąpi, ta akurat konwencja pozwoli Ci zobaczyć
*całą* matematykę w nowy sposób. Wydaje mi się czasam, że im bardziej próbuję to wyjaśnić, tym może
być gorzej i niewykluczone, że najlepiej w tym wypadku działa metoda mimowolnego i stosunkowo
bezmyślnego oswojenia.

Jedną z wielu zalet tego punktu widzenia jest i ta, że można wtedy uprawiać matematykę albo tylko
się uczyć jej w interakcji z programem komputerowym, który wspomaga konstruowanie pojęć, teorii,
własnej notacji i dowodów matematycznych, czyli z [asystentem
dowodzenia](https://en.wikipedia.org/wiki/Proof_assistant), takim jak Lean. Można mieć wtedy nie
tylko pewność, że to, co się napisało czy skonstruowało jest poprawne, albo że jest błędne, ale
można też korzystać z rozmaitych udogodnień, które taki asystent oferuje. Dzięki temu możesz
korzystać z pełnej swobody uczenia się matematyki bez oceniającego Cię nauczyciela, w ramach
interaktywnej eksploracji, to jest metodą prób i błędów, od razu widząc rezultaty swoich działań.

## Ogólne uwagi na temat logiki w Leanie

**Ostrzeżenie i wyzwanie**: Będzie trzeba *stopniowo* opanować sztukę *w miarę* konsekwentnego
*odróżniania*:

1. Dowolnych zdań *jako takich*, a więc niekoniecznie prawdziwych, od...

2. *Prawdziwości lub fałszywości* dowolnych zdań, a tego z kolei od...

3. Ewentualnego *faktu*, że jakieś zdanie (albo jego negacja) *ma dowód*, wreszcie...

4. *Założenia, że* zdanie ma *jakiś* dowód, od *konkretnego kodu* albo *konstrukcji* takiego dowodu.

W tym momencie samo to, że to nie są te same rzeczy czy fakty, może Ci się wydawać zrozumiałe i może
wręcz nie warte objaśniania, ale przekonasz się, że te fundamentalne rozróżnienia będą Ci na
początku sprawiały trudności nawet w stosunkowo prostych sytuacjach. Dlatego przypominam jeszcze
raz - cierpliwości. Gdybym czytał tekst taki jak ten, nie znając wcześniej tematu, na pewno
wracałbym wielokrotnie do niektórych mniej jasnych dla mnie fragmentów i czułbym wiele razy, że się
gubię.

## Implikacje jako funkcje

Implikacja jest być może najważniejszym spójnikiem w logice. Mówiąc luźno, implikacjami nazywamy
zdania o postaci *Jeżeli A, to B*, gdzie *A* i *B* to *dowolne* zdania, proste lub złożone (i tylko
same zdania, a nie ich prawdziwość czy fałszywość, albo fakt bycia dowiedzionym, albo ich
dowody). Implikacje zapisujemy formalnie za pomocą strzałki skierowanej w prawo: →. Wygląda znajomo?

Jeżeli *A* i *B* to zdania - i tylko wtedy - to formalnie, czyli w "oficjalnym" języku matematyki,
implikację *Jeżeli A, to B* zapisujemy zwykle jako *A → B*. Nic? Żadnych skojarzeń?

Niektórzy mówią, że język matematyki jest *precyzyjny*, jednak w matematyce mówimy czasem *celowo
nieprecyzyjnie*, tyle, że ta nieprecyzyjność jest jakby pod kontrolą. Na przykład, możemy wyrazić
wprost w matematyce zdanie, że jakaś wielkość znajduje się w jakimś szerokim interwale, albo że jest
bardziej lub mniej prawdopodobna. W matematyce mówimy też czasem *celowo wieloznacznie*. Na
przykład, my niebawem będziemy stopniowo zacierać różnice między funkcjami i implikacjami.

Co zatem wyróżnia język matematyki, poza *relatywną sztucznością*, która nie wydaje się taka
istotna? Sam do końca nie wiem, ale gdybym miał zgadywać, powiedziałbym, że jest to *jednoznaczność
i sztywność reguł użycia*, ale tylko *formalnego*, czyli takiego mechanicznego albo nawet
"bezmyślnego". I jeszcze to, że chociaż pojęcia matematyczne często powstają jako wyspecjalizowane
wersje pojęć używanych w języku naturalnym, to zwykle stanowią ich wersję "usztywnioną", to jest
uproszczoną do kilku dobrze określonych właściwości. Te są wyrażane czasem jako *aksjomaty*, czyli
podawane bez uzasadnienia formalnego, a więc *bez dowodu* (za to zwykle z uzasadnieniem w języku
naturalnym) *konwencje określające dopuszczalne sposoby używania pewnych słów albo wyrażeń*.

W ten sposób - odzierając pojęcia (na przykład, pojęcie zdania, prawdy, fałszu, prawdopodobieństwa,
czy wpływu) ze zbędnej dla dobrze określonych celów elastyczności użycia (w przypadku pojęć zdania,
prawdy i fałszu - na potrzeby analizy w pewien techniczny sposób rozumianej poprawności rozumowań),
uzyskujemy całkowitą sztywność reguł i wysoki poziom abstrakcji. Sztywność reguł pozwala na
mechaniczną weryfikację wyrażeń, w tym poprawności dowodów, a abstrakcyjność daje ogólność
zastosowań.

**Terminologia logiczna**: Mówiąc krótko, jeżeli *A* i *B* to zdania, to *A → B* to zdanie, które
czytamy jako *Jeżeli A, to B*. A mówiąc trochę dłużej: Zawsze, gdy mamy jakieś dwa, niekoniecznie
różne zdania *A* i *B*, możemy napisać *A → B* i to będzie poprawne wyrażenie (poprawna *formuła
logiczna*), które interpretujemy jako (niekoniecznie prawdziwe, a tym bardziej udowodnione) zdanie
*Jeżeli A, to B*. Mówimy też, że *→* to w logice pewna *dwuargumentowa operacja* albo *działanie*,
tyle że na zdaniach, które to działanie z dwóch *zdań jako takich* (niekoniecznie udowodnionych czy
prawdziwych) robi jedno (niekoniecznie udowodnione czy prawdziwe) unikalne zdanie złożone, dające
się konsekwentnie interpretować jako *Jeżeli A, to B*.

Może przyda Ci się wyobrazić sobie, że zdanie w logice to coś płaskiego i niemal przezroczystego, a
jego dowód to jakiś barwny skarb, który prześwituje przez powierzchnię zdania, jeśli ten dowód
istnieje i umiemy na to zdanie popatrzeć tak, żeby ten prześwit zobaczyć. Ja tak czasem o tym myślę.

**Analogia między implikacjami i typami funkcyjnymi**:

Jeżeli *A* i *B* to *zdania*, to *A → B* jest *implikacją*.

Jeżeli `A` i `B` to *typy*, to `A → B` jest *typem funkcyjnym*.

**Polecenie**: Nie proszę Cię, żebyś ją zapamiętała, ale proszę, żebyś nie szukając w niej na siłę
sensu spróbowała zaakceptować na razie bez głębszego uzasadnienia następującą konsekwencję:
*Ponieważ w teorii typów każde zdanie jest typem, to każda implikacja jest funkcją*.

**Przy okazji**: Powyższa analogia może wygląda jak wieloznaczność i w pewnym sensie nią
jest. Jednak to byłaby wieloznaczność problematyczna tylko gdybyśmy sprawili, że nie jest całkiem
jasne, którą interpretację stosujemy i gdyby *jednocześnie* ta różnica w dopuszczalnych
interpretacjach miała znaczenie dla poprawności wniosków. Używając układu współrzędnych też
korzystałaś z wieloznaczności i wyszło Ci to, jak sądzę, na dobre, prawda?

**Terminologia ogólna**: W matematyce *unikalne* znaczy zwykle *dokładnie jedno danego rodzaju*. I
tak, w przypadku implikacji otrzymujemy unikalne zdanie powstające w taki a nie inny sposób z każdej
określonej pary zdań: Jeżeli *A* i *B* to zdania, to *A → B* jest unikalną implikacją *powstającą z
tych dwóch zdań w tej kolejności*, czyli jest unikalnym obiektem *tego rodzaju*. Podobnie dodawanie
(*+*) to operacja na liczbach, która z dwóch dowolnych, niekoniecznie różnych liczb, na przykład *2*
i *2*, robi unikalną liczbę, w tym wypadku *4*. Ten wynik jest w przyjętym znaczeniu unikalny,
chociaż dodawanie nieskończenie wielu innych par liczb (na przykład całkowitych) daje taki sam
rezultat. Możemy też powiedzieć, że zdanie w postaci implikacji jest *funkcją* uporządkowanej (bo
liczy się, które zdanie będzie traktowane jako poprzednik, a które jako następnik implikacji) pary
zdań.

**Zalety (i wady) maksymalnej formalności**: Wiem, że często piszę długie zdania. Tym razem jednak
chociaż przez chwilę robiłem to celowo. Chciałem w ten sposób zilustrować coś ważnego: Dzięki temu,
że posługujemy się prostymi symbolami na oznaczenie dowolnie złożonych zdań, możemy łatwiej
zapanować nad strukturą rozumowania w sytuacjach, w których bez takiego skrótowego zapisu moglibyśmy
się łatwo pogubić. Logika pozwala nam w ten sposób *w kontrolowany sposób ignorować treść*, *bez
szkody dla poprawności*. To też, to jest pewnego rodzaju "beztreściowość", mamy na myśli mówiąc o
"formalności" zapisu matematycznego. Wreszcie, formalny zapis ułatwia robienie czegoś, co jest
ogromną siłą matematyki: ułatwia a właściwie umożliwia rozwiązywanie zarówno prostych jak i
złożonych problemów *mechanicznie*, jakbyśmy układali puzzle, albo grali w grę.

Coś takiego będziemy właśnie robić, to znaczy, będziemy grać w grę polegającą na konstruowaniu
dowodów, bo będziemy *całkowicie* formalizować każdy problem. Będziemy więc używać matematyki w
sposób *bardziej* formalny niż ma to zwykle miejsce nawet w najbardziej zaawansowanych podręcznikach
do matematyki. Matematycy tak zwykle *nie* postępują, bo im się nie chce i (zwykle) nie muszą;
zamiast tego polegają na domyślności kompetentnego odbiorcy. My nie chcemy się musieć niczego
domyślać, bo nie jesteśmy tak kompetentni jak zawodowi matematycy. Jesteśmy za to psychologami, a
więc zarówno sami matematycy jak wszystko, co robią, należy do *przedmiotu naszych badań*.

Pełna formalizacja wymaga dodatkowego wysiłku, ale dzięki niej będzie nam czasem (jednak nie
oszukujmy się, nie zawsze) *łatwiej*. Przede wszystkim zaś wszystko, co napiszemy, będzie
*sprawdzone przez algorytm, który zawsze da nam odpowiedź, czy to, co napisaliśmy, jest
matematycznie poprawne*. Będziemy więc w pewnym sensie "zawsze bezpieczni" w swoich
(sformalizowanych) rozważaniach.

**(De?)motywator**: Koszt, który musimy ponieść, żeby to osiągnąć, to częściowe oswojenie się z co
prawda mniej złożonym niż język polski, ale obcym, sztucznym, i bezlitośnie sztywnym językiem, jakim
jest formalny język matematyki. Tak jak to ma miejsce w przypadku nauki każdego nowego języka,
trzeba się uzbroić w cierpliwość (jeszcze chyba wspomnę o tej cierpliwości później). 

Jest jak sądzę wiele prawdy w stwierdzeniu, którego autorem jest genialny polski matematyk [Jerzy
von Neumann](https://en.wikipedia.org/wiki/John_von_Neumann), że często matematykę się nie tyle
rozumie, ile raczej się do niej stopniowo *przyzwyczaja*. Dodam od siebie, że gdy się już trochę do
niej przyzwyczai (co wymaga czasu), to zadziwiająco często okazuje się, że jej pojęcia, twierdzenia
i teorie wyrażają coś, co rozumiało się dobrze od samego początku, tylko nie umiało się o tym
dostatecznie konsekwetnie *mówić*, a więc również konsekwentnie albo spójnie *myśleć*.

**Polecenie**: W ramach powtórki napisz proszę samodzielnie definicję funkcji o nazwie
`plus_i_minus`, albo krótszej nazwie `pim`, która do swojego pierwszego parametru dodaje drugi i
odejmuje trzeci i której wszystkie parametry i rezultat są typu `Nat`. Używając komendy `#check`
sprawdź typ zdefiniowanej w ten sposób stałej, jak również typ aplikacji tej funkcji do jednej,
dwóch i trzech liczb naturalnych, wszystko jedno jakich. Ewaluuj za pomocą komendy `#eval` aplikację
tej funkcji do trzech liczb naturalnych i sprawdź, czy wynik się zgadza. Jeżeli ten wynik miałby być
mniejszy od zera, to Lean poda jako rezultat liczbę zero, ponieważ ujemne liczby naturalne nie
istnieją.

## Pierwsze zadanie z logiki

Niebawem udowodnimy takie oto zdanie:

*Jeżeli a, to a.*

Arbitralne zdanie oznaczyłem tu za pomocą małej litery bo tak jest szybciej, a poza tym w logice
zdań to jest najczęściej stosowana konwencja. To zdanie jest trywialne i trywialnie prawdziwe, ale w
matematyce nawet trywialne prawdy wymagają dowodu; wyjątkiem są tylko aksjomaty. Nadamy naszemu
dowodowi nazwę i ten nazwany dowód razem z jego nazwą i zdaniem, którego dowodzi, stanie się jedną
strukturą, to jest matematycznym *twierdzeniem*. Uprzedzam, że chociaż zdanie *Jeżeli a, to a* jest
w oczywisty sposób zawsze prawdziwe, a jego dowód jest bardzo prosty, to i tak wykonując to zadanie
po raz pierwszy prawdopodobnie zdążysz się co najmniej raz poczuć zagubiona.

Musimy sobie teraz wyjaśnić coś na temat dwóch najważniejszych logik (liczba mnoga).

**Uwagi o logice klasycznej i konstruktywnej**: Być może miałaś już do czynienia z elementami logiki
zdań. Jeśli tak, to może to być teraz do pewnego stopnia *przeszkoda*. Logika zdań jest najczęściej
wykładana w wersji tak zwanej *klasycznej*, w której prawdą jest, że:

*Każde zdanie jest albo prawdziwe, albo fałszywe.* (zdanie prawdziwe w logice klasycznej)

Jak również:

*Dla każdego zdania* p *, jeżeli nieprawda, że nieprawda, że* p *, to* p. (inne zdanie prawdziwe w
logice klasycznej)

W Lean domyślnie (można to łatwo zmienić, ale nie będziemy tego teraz robić) używamy logiki
*konstruktywnej*, inaczej *intuicjonistycznej*, a nie klasycznej. Ta logika jest "ostrożniejsza" w
tym znaczeniu, że wszystko, co jest prawdą w logice konstruktywnej, jest też prawdą w logice
klasycznej (o ostrożniejszych założeniach lub teoriach i o ogólniejszych pojęciach mówimy, że są
*słabsze*), ale nie odwrotnie. W logice konstruktywnej można przyjąć, że:

*Zdanie prawdziwe to to samo co zdanie udowodnione.* (dopuszczalna interpretacja prawdy w logice
konstruktywnej)

Co za różnica? Jeżeli postanowimy intepretować słowo "prawdziwe" jako równoznaczne z "udowodnione",
to *nie możemy* zaakceptować jako prawdziwego zdania *Każde zdanie jest albo prawdziwe, albo
fałszywe* (nazywanego m.in. [zasadą wyłączonego
środka](https://en.wikipedia.org/wiki/Law_of_excluded_middle)). Wiemy (istnieje twierdzenie, które
to mówi), że w matematyce da się skonstruować zdania prawdziwe, których nie da się udowodnić. Nie
możemy więc też zaakceptować zasady podwójnej negacji (jeżeli nieprawda, że nieprawda, że *p*, to
*p*), bo zasada wyłączonego środka z niej wynika (i vice versa). Jeśli Cię to niepokoi, to
zapewniam, że ta różnica nieprędko będzie dla nas ważna, a gdy już to nastąpi, będziesz na to
gotowa.

Wracamy do zdania *a → a*. W logice konstruktywnej, żeby udowodnić implikację *A → B*, gdzie *A* i
*B* to dowolne zdania, trzeba *skontruować procedurę*, która dowolny dowód zdania *A* przekształca w
dowód zdania *B*. Jeszcze jedna uwaga na temat często stosowanych konwencji: Gdy matematycy nagle
zmieniają notację i wydaje się, że na to samo zamiast małych liter używają dużych, często chcą w ten
sposób zasugerować, że mają na myśli dowolnie złożone obiekty danego typu. Tutaj nagle zacząłem
oznaczać arbitralne zdania dużymi literami właśnie w tym celu - żeby zasygnalizować, że może chodzić
o dowolnie złożone zdania.

Niebawem rozwiążesz zadanie opierając się na konstruktywnej interpretacji prawdy, a mimo to zgaduję,
że i tak możesz przez pewien czas po tym sukcesie czuć, że ta interpretacja jest dla Ciebie
dziwna. Z drugiej strony, jest też całkiem możliwe, że ta interpretacja okaże się dla Ciebie
*bardziej* intuicyjna niż jakakolwiek interpretacja pasująca do logiki klasycznej.

**Polecenie**: Skopiuj poniższy fragment kodu albo jeszcze lepiej przepisz go z pamięci:

```lean
theorem t1 (a : Prop) : a → a := by
```

**Czytamy to**: Wyrażenie `a : Prop` czytamy jako: `a` jest wyrażeniem (przypominam, że oficjalna
nazwa na takie coś to *term*) typu `Prop`, a ponieważ `Prop` to typ zdań (od angielskiego
*Proposition* oznaczającego sąd), to znaczy, że `a` jest jakimś, niekoniecznie prawdziwym albo
udowodnionym zdaniem, inaczej sądem.

Twierdzenie (`theorem`), które nazwaliśmy bez żadnego specjalnego powodu *t1* (`t1`), a które z
jednego argumentu `a` (nazwa *a* też była wybrana arbitralnie) typu `Prop` (`(a : Prop)`) robi term
typu `a → a`, czyli *dowód zdania* `a → a` (`: a → a`) - bo `a` jest zdaniem, a więc `a → a` też
jest zdaniem - można skonstruować albo (w Lean to jest to samo) zdefiniować (`:=`) za pomocą trybu
interaktywnego (`by`) w taki oto sposób... i tu będziemy niebawem konstruować dowód. To było długie
zdanie z licznymi wtrąceniami. Może warto przeczytać je jeszcze raz.

**Tryb interaktywny jest Twoim przyjacielem**: Zanim przejdziemy dalej, warto zapamiętać, że w
trybie interaktywnym Lean będzie Ci cały czas pokazywał, co masz zrobić (jakiego typu term masz
skonstruować) i co masz do dyspozycji w kontekście (jakimi lokalnymi stałymi możesz się w tym celu
posługiwać). Nie pokaże Ci co prawda stałych zdefiniowanych globalnie, takich jak aksjomaty, albo
liczne funkcje dostępne w bibliotece Leana, bo to nie są parametry dowodu, a więc nie należą do
kontekstu ciała dowodu, ale na razie zwykle nie będziemy używać takich stałych. Ponieważ Lean będzie
Ci w ten sposób pokazywał, co masz zrobić i z czego, będziesz mogła łatwo sprawdzić, czy sposób,
który przychodzi Ci do głowy, odnosi zamierzony skutek. Nie powstrzymuj się więc proszę od swobodnej
eksploracji i eksperymentowania.

**O równości definicyjnej i równości jako zdaniu**: Gdy w Lean piszemy na przykład:

```lean
def n : Nat := 10
```

to jak już wiesz, *definiujemy raz na zawsze* stałą `n` o typie `Nat` *powiadamiając* Leana, że
*postanowiliśmy*, że stała `n` będzie odtąd oznaczała liczbę `10`. Symbol `:=` oznacza więc w Lean
*operację definiowania*, która jest niczym innym jak naszym *wyborem językowym*. Jeżeli natomiast
napiszemy na przykład `n = 10`, gdzie znak `=` występuje bez poprzedzającego dwukropka, to
*stworzymy zdanie*, o *treści* "*n jest równe 10*". Takie zdanie może być w danym kontekście
prawdziwe (w logice konstruktywnej: udowodnione), fałszywe (w logice konstruktywnej: może istnieć
dowód jego negacji), albo może mieć nieokreślony status pod względem prawdziwości.

Nawet, gdy zdefiniujemy `n` jako stałą o wartości `10`, to zdanie `n = 10` (`=`, a nie `:=`) będzie
wymagało udowodnienia, żeby można je było uznać za prawdziwe. Taki dowód jest bardzo prosty, bo
polega jedynie na tak zwanym *rozpakowaniu* albo *zastosowaniu* definicji stałej `n`, ale nadal jest
to jakiś dowód.

**Wracamy do twierdzenia `t1`**: Słowo kluczowe `by` jest teraz podkreślone czerwoną falką, bo dowód
jest rozpoczęty, ale nie jest jeszcze zakończony. Ponieważ pisząc `by` weszliśmy w *tryb dowodzenia
interaktywnego*, gdy kursor znajduje się *za* słowem `by`, to w prawym oknie pod zakładką *Tactic
state* widzimy *aktualny stan* konstruowanego w trybie interaktywnym dowodu:

```lean
1 goal
a : Prop
⊢ a → a
```

**Czytamy to**: Został jeden cel do udowodnienia (`1 goal`), inaczej term albo program do
skonstruowania, który mamy zrealizować czy skonstruować posługując się (tutaj akurat tylko jednym)
założeniem, że `a` jest (niekoniecznie prawdziwym albo udowodnionym) zdaniem (`a : Prop`). Ten cel
to implikacja `a → a` (`⊢ a → a`). Mówiąc krótko, mając do dyspozycji tylko jakieś zdanie `a`,
musimy skonstruować term typu `a → a`.

Jak już wiesz, stworzenie dowodu zdania `a → a` w Leanie jest tym samym co stworzenie termu (można
myśleć programu albo kodu) o typie `a → a`. Jak mamy skonstruować taki term / dowód / program? Musi
on udowadniać następnik zakładając poprzednik, co w logice konstruktywnej znaczy:

*Przekształcać dowolny dowód zdania `a` w dowód zdania `a`*.

A mówiąc ogólniej o dowodzeniu implikacji w logice konstruktywnej:

*Jeżeli A i B to zdania, to w logice konstruktywnej dowód zdania A → B to każda funkcja, która w
jakikolwiek sposób przekształca dowolny dowód zdania A w dowód zdania B.*

Dlaczego można to uznać za pełnowartościowy dowód implikacji? Po prostu dlatego, że to oznacza, że
zawsze, gdy mamy dowód poprzednika *A*, możemy skonstruować dowód następnika *B*, a więc zawsze, gdy
poprzednik jest prawdziwy, następnik również jest prawdziwy.

**Polecenie**: Zanim pójdziemy dalej, spróbuj proszę samodzielnie skonstruować taki dowód korzytając
tylko z tego, czego już się nauczyłaś. Jedyne, co musisz zrobić, to:

Zakładając, że `a` jest zdaniem, skonstruować dowód zdania `a → a`, czyli ...

... zakładając, że `a` jest dowolnym termem typu `Prop`, skonstruować term typu `a → a`, czyli ...

... dokonczyć poniższą definicję ...

```lean
theorem t1 (a : Prop) : a → a := 
```

... jakby to była definicja zwykłej funkcji, w dodatku takiej, którą już poznałaś; właściwie to
najprostszej funkcji tego rodzaju. Jeżeli to na razie jest za trudne, nie przejmuj się, niedługo
będzie oczywiste.

To jeszcze raz:

*Jeżeli A i B to zdania, to w logice konstruktywnej dowód zdania A → B to każda funkcja, która w
jakikolwiek sposób przekształca dowolny dowód zdania A w dowód zdania B.*

Być może czytając powyższe zdanie wyobrażałaś sobie, że ta funkcja / dowód przekształca dowód zdania
*A* w jakiś sposób "zaglądając do środka" tego dowodu, albo w jakimś sensie polegając na
własnościach struktury tego dowodu, na przykład rozbiera go na części, albo wykrywa coś w jego
wnętrzu. Nie o to chodzi. Ta funkcja / dowód ma dostarczyć dowód *B* korzystając z *bliżej
nieokreślonego* dowodu *A*, a więc z samego *faktu istnienia* dowodu *A*.

**Dygresja terminologiczna**: Symbol `⊢` to symbol derywacji albo wnioskowania albo konstruowania.
Różnie można na to patrzeć, więc też różnie można ten symbol nazywać.

**Terminologia**: Zdanie *A* w implikacji *A → B* nazywamy *poprzednikiem*, a dokładnie
poprzednikiem implikacji *A → B*, a zdanie *B* jej *następnikiem*.

Zwróć proszę uwagę, że w naszym niedokończonym dowodzie twierdzenia `t1` ...

```lean
theorem t1 (a : Prop) : a → a := 
```

... mamy do czynienia z typem zależnym: `a → a` to określenie typu rezultatu twierdzenia / funkcji
`t1`, ale to określenie nie miałoby sensu, gdyby nie było wiadomo, czym jest `a`. Ponieważ `a` jest
pierwszym parametrem tego twierdzenia / funkcji i typ tego parametru (`Prop`) jest podany w jego
specyfikacji, to nie ma tu żadnych symboli, które byłyby albo niezdefiniowane, albo nie
zadeklarowane.

Jeżeli to jest niejasne, nie przejmuj się tym teraz. Z czasem posługiwanie się typami zależnymi
stanie się nie tylko jasne, ale wręcz całkiem naturalne, o ile będziesz dość cierpliwa. Może to Ci
pomoże dostrzec naturalność typów zależnych: Przytoczony w czwartym rozdziale fragment prozy
matematycznej można traktować jako funkcję, która z dowolnych dwóch liczb naturalnych, które można
nazwać *m* i *n*, tworzy zdanie *n + m = m + n*, traktowane przypuszczalnie jako po prostu
prawdziwe, to jest bez dowodu. Powiedziałem przypuszczalnie, bo ten fragment prozy był wyrwany z
kontekstu (a tak naprawdę wymyślony przeze mnie).

Pomijając kwestię statusu zdania *n + m = m + n* w tym fragmencie, jest oczywiste, że to zdanie ma
sens *tylko* w kontekście, w którym *n* i *m* oznaczają jakieś liczby. Gdybyśmy chcieli częściowo (o
kodowaniu relacji równości i operacji takich jak dodawanie będziemy mówić kiedy indziej) formalnie
zakodować ten fragment w stylu teorii typów, moglibyśmy napisać tak:

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

Myślę, że widzisz już wyraźnie konieczność zadeklarowania typów zmiennych *n* i *m* zanim napiszemy
*m + n = n + m*.

**Implikacja w praktyce dowodzenia**: Żeby udowodnić w Leanie zdanie `p → q`, trzeba udowodnić, że
zdanie `q` (następnik) jest prawdziwe, *zakładając*, że zdanie `p` (poprzednik) jest prawdziwe,
czyli w hipotetycznej sytuacji, w której `p` jest prawdziwe. W logice konstruktywnej to znaczy:

*Udowodnić zdanie *p → q* to podać sposób skonstruowania dowodu *q*, *zakładając*, że *p* ma *jakiś*
dowód*.

**Polecenie**: Jeżeli zdefiniowałaś już stałą `t1`, czyli udowodniłaś to twierdzenie, to usuń tą
definicję. Będziemy teraz pracować tylko z tym fragmentem kodu:

```lean
theorem t1 (a : Prop) : a → a := by
```

Umieść kursor w następnej linijce. Po prawej powinnaś zobaczyć aktualny stan dowodu, który już
wcześniej objaśniłem - w kontekście jest tylko `a : Prop` i mamy jeden cel, to jest udowodnienie
zdania `a → a` czyli stworzenie termu tego typu. Napisz teraz w następnej linijce komendę:

`intro h`

Jeżeli przesuniesz kursor *za* wpisaną właśnie komendę `intro h`, to w prawym oknie zobaczysz, że
*stan dowodu uległ zmianie*:

```lean
1 goal
a : Prop
h : a
⊢ a
```

Lean pokazuje w ten sposób, co *masz* (nad symbolem `⊢`) i co jeszcze musisz *zrobić* (za tym
symbolem), żeby zakończyć dowód.

Mówiąc ogólnie, jeżeli aktualnym celem w trybie interaktywnym jest udowodnienie zdania o postaci *P
→ Q* (tutaj akurat `a → a`, ale *P* i *Q* mogą być dowolnie złożonymi poprawnymi zdaniami), to
`intro` z argumentem `h` spowoduje, że *wprowadzimy jako założenie hipotetyczny dowód `h`*
poprzednika implikacji *P → Q*, czyli wprowadzamy jako założenie hipotetyczny dowód zdania *P*
(tutaj akurat dowód zdania "atomowego", czyli nie-złożonego, `a`), i oznaczamy ten hipotetyczny
dowód wybranym do tego symbolem `h` (bo tak nam się podoba). Jeżeli coś innego, co mamy (nad `⊢`),
już ma nazwę `h`, to musimy wybrać inną, bo nazwy zmiennych występujących w kontekście (a wszystko
nad `⊢` to właśnie kontekst) muszą być unikalne.

**Uwaga na temat taktyk**: `intro` jest tak zwaną *taktyką*, to znaczy operacją, której możemy
używać *tylko* w trybie interaktywnym. Taktyk możemy używać do interaktywnego konstruowania
dowolnych termów określonego typu, ale tutaj akurat konstruujemy dowód zdania.

Wprowadzając `a` jako założenie, a dokładniej zakładając, że `a` ma *jakiś* dowód i to *posiadanie
jakiegoś dowodu* przyjmując jako założenie `h`, sprawiliśmy, że poprzednik implikacji `a → a`, a
ściślej (hipotetyczny) dowód tego poprzednika, "wskoczył na górę" jako coś, co zakładamy, że mamy, a
przez to to, co mamy skonstruować, czyli cel, *uprościło się* do samego następnika (tutaj `a`). Mamy
więc prostszy cel i więcej środków, żeby go udowodnić! A przy okazji, czy takie "chowanie się" tego,
co jest na początku strzałki coś Ci przypomina?

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

**Jeszcze raz, ale inaczej, objaśnie, co się właśnie stało**: Pisząc `by` weszłaś w tryb
interaktywnego konstruowania termu. Ponieważ typem konstruowanego termu był typ `a → a`, gdzie `a`
było zdaniem, zacząłaś w ten sposób konstruować dowód zdania `a → a`. Wpisując komendę `intro h`
przyjąłaś założenie, że `a` ma jakiś dowód (`h`) i zakładając to udowodniłaś `a` w najprostszy
możliwy sposób - przytaczając ten dowód. Pisząc `exact h` powiedziałaś Leanowi - proszę, `h` to jest
dokładnie to, co mam dostarczyć, oto dowód tego zdania.

Ale przecież dowodzenie jest programowaniem! Dlatego można też powiedzieć, że skutkiem komendy
`intro h` było *rozpoczęcie konstruowania anonimowej funkcji*, czyli znanej Ci już *λ-abstrakcji*,
`fun (h : a) =>` ... - a skutkiem komendy `exact h` było *zdefiniowanie ciała* tej funkcji jako
"dokładnie" albo "po prostu" `h`, czyli ostatecznie dowód polegał na interaktywnej konstrukcji
anonimowej funkcji `fun (h : a) => h`!

Co robi ta funkcja? Pobiera dowolny dowód `a` i go zwraca. Prawie nic nie robi. A właściwie, to
można nawet powiedzieć, że nic. Bo to jest pratycznie ta sama funkcja, co nasza
`identycznosc`. Funkcja `fun (h : a) => h` jest jakby "ucieleśnieniem" (trywialnego) faktu, że jeśli
`a` ma dowód, to `a` na dowód. W logice konstruktywnej to właśnie znaczy *Jeżeli* a *, to* a.

Dowód, który skonstruowaliśmy za pomocą taktyk w trybie interaktywnym jest więc taki sam, jak ten,
który możemy zdefiniować wprost pisząc po prostu:

```lean
theorem t1 (a : Prop) : a → a := fun (h : a) => h
```

Można to przeczytać również tak: dla każdego dowodu `h` zdania `a`, zracam / mam / można stworzyć /
istnieje dowód `a` i jest nim `h`.

**Zadanie do samodzielnego rozwiązania**: Spróbuj teraz samodzielnie dokończyć dowód następującego
twierdzenia, kopiując najpierw poniższy fragment kodu. Gdy poczujesz się zagubiona, zaglądaj czasem
do okna po prawej, albo do wcześniejszych fragmentów tego rozdziału. Albo weź głęboki oddech, albo
zrób sobie krótką albo dłuższą przerwę. To są sprawy wielkiej wagi, a w sprawach wielkiej wagi
zwykle nie należy się moim zdaniem spieszyć.

Najpierw spróbuj bez podpowiedzi, a jak poczujesz, że to jednak za trudne (co by mnie wcale nie
zdziwiło), zerknij poniżej, znajdziesz tam pomoc. Jeżeli chcesz skorzystać z podpowiedzi, za każdym
razem spróbuj "wygrać w tą grę" zaglądając tylko do jednej podpowiedzi, z której jeszcze nie
skorzystałaś.

```lean
theorem t2 (p : Prop) (q : Prop) : p → q → p := by
```

**Podpowiedź**: Chodzi o skonstruowanie dowodu w trybie interaktywnym. Mamy dwie strzałki w zdaniu
do udowodnienia, a więc trzeba dwa razy użyć taktyki `intro`, w dodatku jeden raz "jakby
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

**Ostrzeżenia na temat stylu**: Jeżeli rozwiązałaś poprzednie zadanie w trybie nieinteraktywnym, to
musiałaś na pewnym etapie zakodować funkcję, której parametrem był jakiś dowód zdania `q`. Ten dowód
nie był wewnątrz ciała tej funkcji do niczego potrzebny, bo ostatecznie trzeba tylko skądś wziąć
dowód `p`, dlatego Lean wyświetlił ten parametr na szaro. To tylko ostrzeżenie o stylu, a nie błąd i
jako takie można je spokojnie zignorować. Takie ostrzeżenie sygnalizuje, że dany parametr nie jest
później nigdzie używany, co może być czasem przydatne, ale w tym wypadku akurat raczej nie jest.

**Nie czytaj, jeżeli jeszcze nie rozwiązałeś ostatniego zadania**: Co tu się stało? Nie powiedziałem
tego wcześniej, ale `p → q → p` to tak naprawdę `p → (q → p)`. Nawiasy muszą tu być, nawet, gdy są
niejawne, bo `→` jest operatorem dwuargumentowym, więc bez przyjęcia jakiejś konwencji dotyczącej
nawiasów `p → q → p` jest wyrażeniem w sposób problematyczny niejednoznacznym. Ale to już przecież
wiesz, bo to są *te same strzałki* co do tej pory, my je tylko inaczej *interpretujemy*.

No więc celem jest `p → (q → p)`. Jeżeli celem jest implikacja, a `p → (q → p)` jest implikacją z
poprzednikiem `p` i następnikiem `(q → p)`, to udowodnienie jej polega na skonstruowaniu dowodu
następnika, czyli `(q → p)`, zakładając dowód poprzednika, czyli dowód `p`. Zakładamy, że mamy `h1 :
p` i od tego momentu mamy nowy, prostszy cel, `(q → p)`. Żeby osiągnąć ten cel zakładamy `h2 : q` i
próbujemy udowodnić / unicestwić nowy cel `p`. Ale to już mamy jako `h1 : p`, a więc przytaczamy
dowód `h1` dosłownie (`exact h1`). Nie ma więcej celów, Lean się na nic nie skarży, a więc dowód
jest skonstruowany / zakończony.

Ten sam dowód moglibyśmy zdefiniować wprost w ten sposób:

```lean
theorem t2 (p : Prop) (q : Prop) : p → q → p := 
    fun (h1 : p) => 
        fun (h2 : q) => h1
```

Czy widzisz, że pozornie zbędne wprowadzenie założenia / (λ-)abstrahowanie od dowodu `q` było
konieczne, żeby typ konstruowanego dowodu / termu zgadzał się z celem / zdaniem / typem `p → q → p`?

**Polecenie**: Po udanym wykonaniu tego zadania spróbuj je zrobić od początku jeszcze raz, ale
tłumacząc przy tym, jaka jest przyjęta przez nas interpretacja tego, co robisz. Jak się pogubisz w
tych wyjaśnieniach, poszukaj wskazówek w poprzednich komentarzach.

# O twierdzeniach jako funkcjach i ich stosowaniu

Być może zaczynasz już dostrzegać, że zachodzi tu doskonała analogia między twierdzeniami i
funkcjami. W istocie, w Leanie twierdzenia całkiem dosłownie *są* funkcjami. Jedyna różnica polega
na tym, że słowo kluczowe `theorem`, którego używamy zamiast słowa kluczowego `def` mówi Leanowi,
żeby *nie rozpakowywał definicji* danej funkcji, bo nie ma takiej potrzeby, bo *dowody są nieważne*
(sic!), o czym za chwilę.

Jeżeli teraz na przykład *zadeklarujemy* (to akurat nie jest definicja, tylko deklaracja, która
obowiązuje tylko w tych fragmentach kodu, w których `a` jest zarazem widoczne i używane), że mamy
(jakieś) zdanie `a`, używając słowa kluczowego `variable` ...

```lean
-- W ten sposób deklarujemy, że mamy jakieś zdanie a:
variable (a : Prop)
```

... to będziemy mogli zastosować twierdzenie `t1` tak samo, jak stosowaliśmy funkcje `suma` czy
`dodaj2`.

**Polecenie**: Wklej ten fragment do Leana i umieść kursor nad komendą `#check`, powinienaś zobaczyć
po prawej to, co zapisałem poniżej jako komentarz. Widzisz, że mamy tu do czynienia z pewnym
obliczeniem na poziomie typów, które zachodzi, ponieważ rezultat twierdzenia / funkcji `t1` ma typ
zależny (od pierwszego argumentu)?

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

i te wszystkie *aplikacje* będą *dowodami* tych zdań.

**Typy zależne**: Słowo `theorem` istnieje głównie dla wygody urzytkownika. Moglibyśmy równie dobrze
zastąpić je tutaj słowem `def`, bo `t1` jest zarazem *twierdzeniem* i *funkcją*. Różni się jednak
pod ważnym względem od na przykład funkcji `suma`. Funkcja `suma` zwraca liczby naturalne, czyli
termy typu `Nat` *i tylko tego typu*. Funkcja `t1` zwraca za to dowody *różnych* zdań, czyli *termy
różnych typów*, zależnie od tego, jakie zdanie dostanie jako argument. Jak już wiesz, to jest przykład typu
zależnego.

Czy widzisz, jak dobrze to traktowanie twierdzeń jako parametrycznych funkcji pasuje do sposobu, w
jaki posługujemy się tym, co można odczytać ze zwykłej "prozy matematycznej"?  Żeby to jeszcze raz
zilustrować, przypomnimy sobie znowu ten sam fragment, tylko nadamy mu nazwę:

```
Przemienność dodawania: Jeżeli n i m to liczby naturalne, to n + m = m + n
```

Stąd jest już bardzo blisko do:

```
Przemienność dodawania (n : Liczba naturalna) (m : Liczba naturalna) : n + m = m + n
```

co możemy wyrazić w Leanie w ten sposób, jako aksjomat, czyli *definicję bez ciała* {sic!}. To jest
poprawny kod Leana, jak chcesz możesz go przekleić albo spróbować wpisać z pamięci:

```lean
axiom przemiennosc_dodawania (n : Nat) (m : Nat) : n + m = m + n
```

Nie wiem, czy na Tobie to robi takie wrażenie jak na mnie, ale fakt, że ten formalny zapis jest tak
blisko zapisu w języku naturalnym nadal co jakiś czas budzi we mnie zachwyt. Słowo kluczowe `axiom`
sprawia, że możemy odtąd traktować `przemiennosc_dodawania` jako nazwę na istniejący, chociaż bliżej
nieokreślony, term typu `n + m = m + n`, czyli mamy odtąd bliżej nieokreślony dowód zdania `n + m =
m + n`. Jeżeli to nie jest naturalna, elegancka i dosłowna formalizacja naszego fragmentu prozy
matematycznej wyrażonej w języku naturalnym, to nie wiem, co mogłoby nią być.

Aksjomat możemy zastosować tak, jakby był twierdzeniem, bo przecież to jest term takiego a nie
innego typu, tyle tylko, że w żaden sposób nie został skonstruowany (na tym polega jego
aksjomatyczność):

```lean
-- Dowód zdania 1 + 2 = 2 + 1 za pomocą aksjomatu o przemienności dodawania
#check przemiennosc_dodawania 1 2 -- przemiennosc_dodawania 1 2 : 1 + 2 = 2 + 1
```

Wręcz widać, że w ten sam sposób "stosujemy" fragmenty prozy matematycznej, takie jak ten dotyczący
przemienności dodawania, tylko że robimy to zwykle "w głowie", prawda?

## Widok z lotu ptaka

Nasze twierdzenia zakodowane w Leanie są więc *jednocześnie*:

1. Zdaniami matematycznymi połączonymi z dowodami tych zdań i unikalną w danym kontekście (lepiej -
   *środowisku*) nazwą.

2. Termami pewnego typu, konkretnie tak zwanego typu zależnego: *funkcja obliczająca / konstruująca
   z dowolnego termu `a` typu `Prop` term typu `a → a`*.

W ten oto sposób *znika różnica między uprawianiem matematyki teoretycznej i
programowaniem*. Zobaczysz, przyjdzie taki moment, o ile już nie nastąpił, że będzie Ci *trudno*
oddzielić te dwa punkty widzenia, tak jak od dawna trudno Ci oddzielić dwa sposoby myślenia - czysto
geometryczny i liczbowy - na przykład wtedy, gdy myślisz o trójkątach, i tego Ci z całego serca
życzę. A teraz zerknij może ponownie
[tutaj](https://github.com/boryspaulewicz/matematyka_dla_psychologow/blob/main/rozdzialy/Pierwszy_spacerek.md#ten-tytu%C5%82-jest-tylko-po-to-%C5%BCeby-do-niego-p%C3%B3%C5%BAniej-wr%C3%B3ci%C4%87),
bo wydaje mi się, że zobaczysz ten pojawiający się na początku książki fragment w całkiem nowym
świetle.

**Ostatni motywator**: Jak wspominałem, mam powody sądzić, że nawet jeżeli dotarłaś do tego momentu
i udało Ci się wykonać poprawnie wszystkie polecenia, możesz nadal mieć poczucie dezorientacji albo
braku sensu. W związku z tym oferuję takie pocieszenie: Być może zdarzyło Ci się kiedyś grać w gry
typu FPS. Gdy nie ma się w takich grach doświadczenia, poruszanie się po mapie bywa nieporadne, a
wiele początkujących osób spędza dużo czasu z "nosem w ścianie" albo nawet "w podłodze". Z czasem,
gdy gra się trochę dłużej, stopniowo pojawia się coraz lepsza, utrzymująca się coraz dłużej
świadomość własnego położenia na mapie jako całości. To trochę tak, jakby jednocześnie patrząc przez
te niby-własne oczy patrzyło się również, ale mentalnie, na swoje działania z lotu ptaka, albo jakby
się było jednocześnie we własnym ciele i w pewnym sensie ponad nim. To samo dzieje się, gdy nabiera
się praktyki w używaniu narzędzi formalnych. I tego też Ci życzę, bo zdarza się czasem, że taki
widok z lotu ptaka na wyrafinowane i bywa, że wręcz ekstremalnie abstrakcyjne konstrukcje formalne
dostarcza poczucia ogromnej intelektualnej mocy.

**Ostatni (dez)orientator**: Z wnętrza ciała każdej funkcji widać jej parametry, na przykład z
wnętrza ciała naszej funkcji `suma` (a w innym rozdziale `plus`) widać parametry `n` i `m` o typie
`Nat`, ale z wnętrza ciała każdej funkcji widać też zmienne, które zostały zdefiniowane wcześniej
*na zewnątrz* definicji funkcji. Na przykład, w ciele funkcji `dodaj2` używaliśmy stałej `2` i
stałej `+`, które są zdefiniowane w automatycznie ładowanej bibliotece Leana, na zewnątrz definicji
funkcji `dodaj2`.

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
`a → p`. A ponieważ `a → p` jest zdaniem (termem typu `Prop`) - bo `a` i `p` są zdaniami - to
znaczy, że można zrobić dowód zdania `a → p`, czyli, mówiąc krótko, dla każdego zdania `a`, jeżeli
`a`, to `p`.

Faktycznie, z każdego dowodu zdania `a` możemy w tym momencie zrobić dowód zdania `p`, *ignorując*
dowód zdania `a` i przytaczając dowód `dp` zdania `p`, który teraz (w aktualnym *środowisku*)
istnieje aksjomatycznie, czyli na mocy naszego (językowego) wyboru i jest widoczny również wewnątrz
ciała definicji `t3`.

W pierwszej chwili to się może wydawać dziwne, ale przecież, jeżeli na przykład *wiemy już*, że
jutro będzie sobota (i ta wiedza tymczasowo spełnia rolę aksjomatu), to przyjmując obowiązującą w
logice interpretację implikacji, prawdą jest, że *jeżeli dzisiaj pada deszcz, to jutro będzie
sobota*, niezależnie od tego, czy dzisiaj pada deszcz, czy nie i niezależnie od tego, że między
dzisiejszym deszczem a jutrzejszym dniem tygodnia nie ma związku. *W tej sytuacji* prawdą jest, że
*jeżeli dzisiaj pada deszcz, to jutro będzie sobota*, po prostu dlatego, że ... jutro będzie sobota.

### Przypisy

[^1]: Dawno, dawno temu byłem w Krakowie na koncercie zespołu
    [5’nizza](https://pl.wikipedia.org/wiki/5%E2%80%99nizza), na którym Serhij Babkin i Andriej
    Zaporożec wykonywali utwory z płyty [П'ятниця](https://www.youtube.com/watch?v=nnWMrmTWonI),
    której wtedy lubiłem czasem posłuchać. W pewnym momencie któryś z wykonawców wziął butelką i
    wtedy usłyszał z sali krzyk "Nie pij tej wody!". Uważam, że to było bardzo śmieszne.
