<br>

**Moim zdaniem najważniejsze wskazówki na temat tego, w jaki sposób warto czytać tą książkę, są
[tutaj](./Wujek_dobra_rada.md).**

<hr>

## O czym teraz będzie

Ten rozdział i następny są tak naprawdę jednym rozdziałem, rozpisanym na wiele różnorodnych
powtórek. Będą się w nich działy rzeczy moim zdaniem ciekawe, jednak uprzedzam, że ciekawsze rzeczy
zaczną się na dobre pojawiać dopiero w rozdziale siódmym. Zaczniemy wtedy ćwiczyć pewien szczególny
sposób myślenia, polegający na "kontrolowanym żonglowaniu" różnymi dobrze określonymi punktami
widzenia na to samo.

W tym podwójnym rozdziale pokażę Ci - w nieco innej kolejności, akcentując trochę inne rzeczy i
wprowadzając czasami inne tematy - w jaki sposób w Leanie *definiujemy stałe* i konstruujemy
*funkcje anonimowe*. Zwrócę Twoją uwagę na *naturalność* i *prostotę składni* tego języka, a także
powiem trochę o roli, jaką w w Leanie odgrywają *typy*. Wreszcie omówię krok po kroku (nieco go
upraszczając) proces *ewaluacji*, a dokładnie *ewaluacji aplikacji* (funkcji do jakiś argumentów).

Mam nadzieję, że kilkukrotne i szczegółowe omówienie tego, w jaki sposób przebiega ewaluacja
aplikacji, pozwoli Ci lepiej zrozumieć mechanikę działania teorii typów, a dzięki temu czuć się
bardziej pewnie, gdy będziemy później na niej polegać udowadniając twierdzenia i definiując nowe
rodzaje struktur. To wszystko będziesz mogła zrozumieć jak sądzę bez większych trudności między
innymi dlatego, że będę się *do znudzenia powtarzał*.

Ponieważ najtrudniejszymi częściami obydwu rozdziałów są fragmenty dotyczące *curryingu*, to jest
sposobu, w jaki funkcje *jednoargumentowe* mogą udawać funkcje *wieloargumentowe*, zanim dotrę do
tego tematu omówię szczegółowo kilka prostych przykładów funkcji i zaproponuję Ci wykonanie niezbyt
skomplikowanych i moim zdaniem wskazanych na tym etapie zadań.

Jednym z ważniejszych aspektów uczenia się czegoś nowego jest stopniowe przyzwyczajenie się do
znaczeń terminów technicznych. Z niektórymi takimi terminami zapoznasz się tak zwaną (przeze mnie od
dzisiaj) metodą mimowolnego oswojenia, bo nie będę ich od razu objaśniał, tylko pokażę Ci, jak się
ich używa.

<hr>

# Pierwszy spacer po Leanie, wersja pierwsza

Ponieważ są tak ważne, treści, o których będziesz się uczyła w tym rozdziale, omówię jeszcze raz,
tylko inaczej, w rozdziale następnym. Dzięki temu mam nadzieję ułatwić Ci *aktywne powtarzanie
materiału*. Gdy więc czytając ten rozdział i wykonując polecenia poczujesz, że utknęłaś, być może
znajdziesz poprawne rozwiązanie, albo zaczniesz lepiej rozumieć, jak je znaleźć, w trakcie czytania
drugiej wersji.

W przypadku utknięcia sugeruję chwilowo *pozbyć się ambicji i czytać bez wstydu*, albo zrobić sobie
*przerwę*, albo *wrócić do wcześniejszych wyjaśnień*. Moim zdaniem najważniejsze w tym wszystkim
jest *unikanie nadmiernej frustracji*. A żeby jej unikać, trzeba najpierw zacząć *zwracać na nią
uwagę*. Zawsze możesz też zadać mi pytanie mailem (borys.paulewicz@gmail.com). Na pewno się ucieszę
i jeśli tylko nie odłożę odpowiedzi z powodu braku czasu, przez co później o niej zapomnę, co mi się
niestety zdaża, to spróbuję pomóc. Gdybym nie odpowiedział w ciągu kilku dni, nie obrażę się, jeśli
napiszesz znowu.

Zależy mi na tym, żeby zwłaszcza te pierwsze rozdziały były dopasowane do możliwości większości
studentów a nawet *uczniów liceum*, dlatego będę wdzięczny za informacje o pojawiających się
trudnościach. Przydadzą mi się między innymi uwagi w rodzaju "ten fragment był dla mnie wyraźnie
trudniejszy niż poprzedni", albo "to zdanie było tak długie, że musiałam je przeczytać kilka razy",
albo "ten fragment jest moim zdaniem niepotrzebny", albo "wolałabym, żeby to było wytłumaczone
bardziej szczegółowo", albo "czytając ten fragment zastanawiałam się kilka razy, czy...".

Tylko proszę, jeśli napiszesz, nie zwracaj się do mnie per Panie Doktorze. Wiem, że studenci tak
robią z dobrej woli i że pracownicy uczelni często tego oczekują, ale moim zdaniem, zwłaszcza w
dyscyplinach takich jak psychologia, takie tytuły są nie tylko groteskowe, ale mogą też utrudniać
przyjęcie krytycznej postawy wobec tego, co taki lub inny Doktor czy Profesor opowiada. Dlatego
między innymi piszę tą książkę niemal na żywo. Dzięki temu możesz się sama przekonać, jak w ten
sposób sam się pewnych rzeczy uczę i jak całość wyłania się stopniowo niemal z niczego. Z tego
samego powodu próbuję też pisać tak, jakbym z Tobą *rozmawiał*; bo według mnie to powinna być
rozmowa.

**Polecenie**: Korzystając z dowolnej przeglądarki wejdź na stronę:

https://live.lean-lang.org

Rozpoczniesz w ten sposób interaktywną sesję z [*asystentem
dowodzenia*](https://en.wikipedia.org/wiki/Proof_assistant) Lean. Nie przejmuj się, jeżeli widzisz
to okno po raz pierwszy i wydaje Ci się obce, bo to minie. Będziesz pisać w panelu po lewej i
czasami zaglądać do panelu po prawej. Gdybyś miała ochotę, możesz też od razu spróbować zainstalować
darmowy edytor Visual Studio Code, który ma bardzo dobre wsparcie dla Leana. Wystarczy go ściągnąć z
[tej](https://code.visualstudio.com/download) strony, a po uruchomieniu skorzystać z instrukcji,
które znajdziesz [tutaj](https://docs.lean-lang.org/lean4/doc/quickstart.html).

Ostrzegam, że błędy będą się pojawiać, ponieważ jesteś (zgaduję)
[człowiekiem](https://www.youtube.com/watch?v=UVL186zzOXo). Gdy pojawi się błąd, Lean Cię o tym
powiadomi podkreślając go czerwoną falką. Na początku najczęściej to będzie *literówka*. Czasami
samo miejsce, w którym pojawi się czerwona falka, pozwoli Ci szybko zauważyć, co należy zmienić, ale
nie zawsze. W razie wątpliwości przeczytaj komunikat o błędzie, który pojawi się w panelu po prawej,
i spróbuj domyślić się, o co Leanowi może chodzić.

Zgodnie z tym, co wcześniej napisałem o potrzebie sensu, uważam, że czasem warto, żebyś przed
przeczytaniem szczegółowych wyjaśnień spróbowała wykonać od razu kilka zadań. Tym razem jednak
spróbuję najpierw czegoś innego, ale w pewnym sensie chyba zbliżonego.

**Uczenie się poprzez wcielenie się w rolę**: Wyobraź sobie, że Twoim zadaniem jest *zaprojektowanie
sztucznego języka*, który pozwalałby w jednoznaczny, zwięzły i czytelny sposób zapisywać
*definicje*. Zależałoby Ci wtedy pewnie na jawnym wyrażeniu tego jakie operacje z użyciem
definiowanych stałych mają sens, a jakie nie mają. Byłoby też wskazane, żeby do definiowania nie
używać symbolu równości (*=*), bo ten odgrywa w matematyce bardzo ważną rolę i mógłby się jeszcze
przydać do czegoś innego, to jest do oznaczania relacji równości, a nie *decyzji*, że jakieś
wyrażenie *ma być* wartością jakiejś stałej, bo tak.

Przydałoby się więc jakieś krótkie i łatwe do zapamiętania *słowo kluczowe*, na przykład `def`, bo
to kojarzy się ze słowem *definicja*. Nie byłoby też źle, gdyby zapis informujący o operacjach,
które można wykonywać z użyciem definiowanej stałej, kojarzył się na przykład z naklejeniem na coś
etykiety. A najlepiej, żeby symbol oznaczający bycie treścią albo ciałem definicji przypominał ten,
którego używa się często w tym celu w informatyce. Co byś wtedy powiedziała na takie rozwiązanie?

**Polecenie**: Skopiuj do Leana poniższy fragment kodu. Możesz wkleić go do schowka klikając na dwa
małe kwadraty widoczne po prawej.

```lean
def dziesiec : Nat := 10
```

To jest *definicja* (w języku Lean), co poznajemy po słowie `def` i po symbolu `:=`. Symbol `:=`
**czytamy jako** *niech oznacza* (*już na zawsze*). Każda definicja jest definicją jakiejś *stałej*,
w tym wypadku stałej o *nazwie* `dziesiec`. Mówimy, że tym, co jest definiowane, są stałe, po prostu
dlatego, że definicje są (w danym kontekście) ostateczne. W języku teorii typów każda zdefiniowana
stała - tak jak w ogóle każde poprawne wyrażenie nazywane w tej teorii *termem* - ma jakiś *typ*. Na
przykład, zdefiniowana wyżej stała `dziesiec` ma typ `Nat` (`: Nat`), to jest ma typ *liczba
naturalna*. *Ciało* tej definicji, czyli jej wartość albo treść, to liczba, a mówiąc ogólnie *term*
`10`.

Będę czasem pisał tak, jakby fragment kodu taki jak `dziesiec : Nat` pełnił rolę *rzeczownika* - na
przykład, *stała `dziesiec : Nat` jest ...* to będzie inny sposób, żeby powiedzieć *stała `dziesiec`
o typie `Nat` jest ...* - albo *zdania*, na przykład, *Jeżeli `dziesiec : Nat`, to ...*  to będzie
inny sposób, żeby powiedzieć *Jeżeli stała `dziesiec` ma typ `Nat`, to ...*. W obydwu przypadkach
właściwa interpretacja będzie wynikała z kontekstu. Fragmenty tekstu takie jak *stała `dziesiec :
Nat` jest ...*, zapisane jednocześnie w dwóch językach, to jest naturalnym (*stała ... jest*) i
*formalnym* (*`dziesiec : Nat`*), będę wprowadzał między innymi po to, żebyś mogła zauważyć i
przyzwyczaić się do tego, jak naturalna może być formalizacja w języku teorii typów.

**Polecenie**: Napisz w Leanie analogiczną definicję stałej o nazwie `trzy`, tak, żeby oznaczała
liczbę `3`. Wystarczy skorzystać z `dziesiec` jako przykładu, zamieniając dwa elementy definicji,
nazwę stałej i jej wartość, czyli oficjalnie *ciało*. Jeżeli zobaczysz fragment podkreślony czerwoną
falką, spróbuj wywnioskować na czym polega problem z komunikatu o błędzie, który zobaczysz w panelu
po prawej.

**Polecenie**: Zmień swoją poprawną definicję stałej `trzy` na *błędną*, zastępując `3` (a więc
*ciało* tej definicji, a nie nazwę definiowanej stałej) przez słowo `tszy`, bez cudzysłowów. Ta
definicja będzie błędna nie dlatego, że to słowo zawiera błąd ortograficzny. Umieść kursor na słowie
`tszy` i odczytaj komunikat o błędzie widoczny po prawej. Powinnaś wtedy zobaczyć komunikat `unknown
identifier 'tszy'`, co oznacza, że Lean nie wie, czym jest `tszy`. Przekonasz się w ten sposób, że
błędy to tylko okazja, żeby Lean mógł się wykazać i żebyś mogła nauczyć się robić coś lepiej (albo
gorzej).

W Leanie można definiować stałe (nieskończenie) wielu różnych typów, nie tylko liczbowych. I tak,
poniższy kod definiuje stałą o typie *tekstowym* (`String`), nazywanym przez informatyków typem
*napisów*, *stałych łańcuchowych* lub [*literałów
łańcuchowych*](https://pl.wikipedia.org/wiki/Litera%C5%82_%C5%82a%C5%84cuchowy) (to tylko różne
nazwy na to samo). Zwróć proszę uwagę, że wartości tekstowe muszą być otoczone cudzysłowami.

**Polecenie**: Skopiuj do Leana lub przepisz z pamięci:

```lean
def gwiazda_wieczorna : String := "Rihanna"
```

Żeby zobaczyć wartość stałej trzeba użyć komendy `#eval` (od agielskiego *evaluation*):

```lean
#eval dziesiec
```

**Polecenie**: Napisz teraz w nowej linii `#eval gwia`, tylko tyle. Zobaczysz, że Lean zaoferuje Ci
możliwość szybkiego wpisania pełnej nazwy. Żeby z tego skorzystać, naciśnij klawisz Tab, kiedy Lean
podświetli właściwą kontynuację, lub wskaż ją za pomocą myszki lub klawiszy strzałek. Ponieważ
kursor będzie się wtedy znajdował w linii, która zaczyna się od komendy `#eval`, po prawej zobaczysz
wartość wpisywanej stałej.

Typ każdego termu, czyli każdego poprawnego wyrażenia, a więc też każdej zdefiniowanej wcześniej
stałej, możemy sprawdzić za pomocą komendy `#check` (czyli *sprawdź*):

```lean
#check dziesiec
```

Po wpisaniu powyższego kodu nie zobaczysz (w panelu po prawej) *wartości* stałej `dziesiec`, ale
zobaczysz, że stała `dziesiec` ma typ `Nat`, czyli że to, co ta stała oznacza, może być traktowane
jako liczba naturalna. Możemy również użyć komendy `#check`, żeby sprawdzić, czy jakiś term ma
*określony* przez podane jawnie wyrażenie typ używając w tym celu *jawnego typowania*. Na przykład,
w ten sposób możemy sprawdzić, czy stała `dziesiec` ma (również, bo to jest nazwa *innego* niż `Nat`
typu) typ `String`:

```lean
-- Lean sygnalizuje błąd, ponieważ stała `dziesiec` ma z definicji typ `Nat`, a `Nat` i `String` to
-- termy (jak również stałe) oznaczające różne typy (w teorii typów każdy term ma *unikalny* typ).
-- W ten sposób można sprawdzać, czy jakieś wyrażenie ma określony typ.
#check (dziesiec : String)
```

Teraz już wiesz, jak możesz definiować stałe oznaczające liczby naturalne albo wartości tekstowe,
jak możesz wyświetlać wartości takich (poprawnych) wyrażeń, których wartości Lean potrafi wyświetlić
(akurat z liczbami naturalnymi i wartościami tekstowymi radzi sobie bez pomocy), i jak możesz poznać
typ dowolnego wyrażenia, albo upewnić się, czy jakieś wyrażenie ma typ określony przez jakieś inne
wyrażenie. A jeżeli zdarzy Ci się zapomnieć, jak się robi którąkolwiek z tych rzeczy, zawsze
będziesz mogła sobie to przypomnieć zaglądając do tego rozdziału.

**Polecenie**: Za pomocą komendy `#check` sprawdź typ którejś ze zdefiniowanych dotąd stałych.

**Wbrew pozorom przydatne ćwiczenie**: Jeśli masz ochotę, stwórz własną zmienną tekstową, o jakiej
chcesz wartości. Nawet, jeżeli wydaje Ci się to zbyt proste, może warto to na tym etapie jednak
zrobić, bo dzięki temu Lean zadomowi się bardziej "w Twoich palcach" i następne fragmenty kodu
będziesz lepiej "czuć". 

To jest trochę tak jak z robieniem notatek. Sama czynność notowania mniej więcej na temat, nawet gdy
wydaje się, że nic nie wnosi, zmienia sposób, w jaki przetwarzamy informacje i wpływa na to, co
później pamiętamy, a przez to wpływa na to, jak postrzegamy podobne treści i jak na nie reagujemy. A
jeżeli taka czynność wydaje się tak łatwa, że aż zbędna, to może nawet lepiej. Głęboki i
jednocześnie łatwy do przeoczenia wpływ takich pozornie pozbawionych większego znaczenia ćwiczeń na
pamięć, percepcję i *rozumienie* wynika moim zdaniem stąd, że cały czas, nawet jeżeli tylko
częściowo świadomie, postrzegamy wszystko przede wszystkim w kategoriach możliwych konsekwencji
wykonywalnych sekwencji działań.

## Funkcje w Leanie

Stałe, które do tej pory zdefiniowaliśmy, nie pozwalają nam za wiele *zrobić*. Najważniejszą częścią
programów komputerowych nie są tego rodzaju "statyczne" konstrukcje, tylko *funkcje*, rozumiane jako
przepisy, algorytmy, albo efektywne procedury obliczeniowe, które *w pewnym sensie* już "coś zrobić"
mogą. Żeby stworzyć definicje funkcji będziemy jawnie podawać ich typ, inaczej jawnie typować, tak
jak wcześniej wprost napisaliśmy, że chcemy, aby stała `dziesiec` miała typ `Nat` (pisząc `dziesiec
: Nat`).

**Uczenie się przez wcielenie się w rolę**: Wyobraź sobie teraz, że masz zaprojektować również
składnię, która pozwalałaby jednoznacznie, zwięźle i czytelnie zapisywać *strukturę funkcji*
rozumianych jako efektywne procedury obliczeniowe albo po prostu programy czy przepisy określające,
jak *jeden* term określonego typu (rezultat działania funkcji) ma być zrobiony z jednego lub
większej liczby niekoniecznie różnych termów niekoniecznie takich samych, ale określonych typów.

Skoro definicje zapisujemy za pomocą słowa kluczowego `def`, to w tym wypadku można by użyć słowa
kluczowego `fun`. Funkcje rozumiane jako programy mają być, cóż, jak programy, ale chcemy również,
żeby sposób ich zapisywania przywodził na myśl funkcje rozumiane tak, jak się je rozumie w "bardziej
tradycyjnej" matematyce, bo od pewnego momentu będziemy celowo ignorować występujące między nimi
różnice.

A "zwykłe" funkcje *matematyczne* to nie programy, tylko *abstrakcyjne* "obiekty", które każdemu
elementowi pewnego *zbioru*, nazywanego *dziedziną funkcji*, "abstrakcyjnie przyporządkowują"
dokładnie jeden element pewnego *niekoniecznie innego* zbioru, nazywanego *przeciwdziedziną
funkcji*. Na przykład, *matematyczna* funkcja kwadratowa ze zbioru liczb rzeczywistych (będącego jej
dziedziną ...) do zbioru liczb rzeczywistych (... jak również jej przeciwdziedziną) *każdej* liczbie
*x* należącej do tego zbioru przyporządkowuje (chociaż *nic nie robi*) *dokładnie jedną* wartość,
określoną przez wyrażenie *x \* x*. To wyrażenie *nie* jest częścią tej matematycznej funkcji, tylko
zapisem, który pozwala *nam* ustalać, jakie liczby są przyporządkowane do jakich "przez" tą funkcję.
A tak naprawdę jakie przyporządkowania liczb do liczb nią *są*.

Ponieważ jednak w języku, o którym teraz mówimy, funkcje mają być *programami* (albo
[algorytmami](https://pl.wikipedia.org/wiki/Algorytm) \{czyli pewnymi przepisami\}), chciałabyś też
pewnie, żeby sposób ich zapisywania kojarzył się bardziej z *procesem* przekształcania niż z
abstrakcyjnym przyporządkowaniem. No to co byś wtedy powiedziała na to? (bo mi się wydaje, że trudno
to zrobić lepiej):

```lean
-- (anonimowa) Funkcja kwadratowa ograniczona do liczb naturalnych jako program komputerowy:
fun (n : Nat) => n * n
```

Tylko nie wklejaj tego kodu do Leana, bo zobaczysz błąd. To jest poprawny *opis struktury funkcji*,
ale to *nie* jest poprawny *samodzielny* fragment kodu (czyli term) w języku Lean, ani tym bardziej
w języku teorii typów, którego Lean jest wersją wzbogaconą. Nie wiem, czy się zgodzisz, ale moim
zdaniem symbol `=>` bardziej kojarzy się z jakimś (fizycznym, bo przecież tylko takie istnieją)
procesem niż na przykład symbol `->`, choćby dlatego, że symbol `=>` jest bardziej "mięsisty".

Pozostaje jeszcze kwestia sposobu zapisywania typów tego rodzaju wyrażeń. Zgodzisz się chyba, że
naturalnie byłoby oznaczać je w sposób, który mówi jaki jest typ argumentu (odpowiadający dziedzinie
abstrakcyjnej funkcji matematycznej) i jaki jest typ rezultatu (odpowiadający przeciwdziedzinie
abstrakcyjnej funkcji matematycznej), a przy tym kojarzy się łatwo z pojęciami przekształcania i
przyporządkowywania. To może tak? (tego też nie wklejaj do Leana, to też tylko ilustracja):

```lean
-- Typ funkcji, które w jakiś sposób przekształcają liczby naturalne w liczby naturalne
Nat → Nat
```

Zwracam uwagę, że w opisie *struktury* funkcji występuje gruba strzałka (`=>`), a w opisie *typu*
funkcji występuje cienka strzałka (`→`).

**Polecenie**: Żeby wpisać w Leanie cienką strzałkę napisz `\to` i ulegnij olśnieniu. Gdy już
ochłoniesz, usuń tą strzałkę, bo sama strzałka nie jest poprawnym fragmentem kodu.

Nawet najprostsze fragmenty kodu możemy zapisać w Leanie na wiele sposobów, w tym również skrótowo,
to jest pomijając informacje, które Lean może wywnioskować z informacji podanych jawnie. Ta
elastyczność ma służyć użytkownitce, ale na razie nie będziemy z niej korzystać, bo naszym celem w
tym momencie jest *opanowanie podstaw*, a nie *korzystanie z udogodnień*.

Będę odtąd częściej używał *komentarzy*. Komentarzem jest tekst zaczynający się od znaków `--`. Lean
ignoruje wszystko, co jest napisane po tych znakach, taki tekst ma zatem służyć tylko Tobie.

W ten sposób możemy zdefiniować funkcję, która przyjmuje argument typu `Nat` i zwraca jego wartość
zwiększoną o *2*:

```lean
-- `Nat → Nat` oznacza typ funkcji, które pobierają dowolny argument typu `Nat` i zwracają rezultat
-- typu `Nat`.
def dodaj2 : Nat → Nat := 
    -- `fun` to słowo kluczowe i jednocześnie skrót od *function*. W Leanie oznacza *funkcję
    -- anonimową*, inaczej *λ-abstrakcję* (to tylko inna nazwa na to samo).
    fun (moj_parametr : Nat) => moj_parametr + 2

-- Można to zapisać krócej, bo *domyślnie* `+` oznacza w Leanie dodawanie liczb naturalnych, a więc
-- Lean może wywnioskować, że w definicji ...
def dodaj2' := fun n => n + 2
-- ... parametr `n` musi mieć typ `Nat`, wyrażenie `n + 2` w ciele funkcji musi mieć typ `Nat`, a
-- więc stała `dodaj2'` musi mieć typ `Nat → Nat`. Na razie jednak nie będziemy korzystać z tego
-- udogodnienia.
```

**Polecenie**: Funkcję `dodaj2` można zastosować do dowolnej liczby naturalnej, w tym również do
stałej `dziesiec`, bo ta stała ma taki sam typ jak parametr (czyli "wejście") funkcji `dodaj2`. Żeby
to zrobić i jednocześnie obliczyć wynik - być może przyspieszając pisanie i zmniejszając ryzyko
pojawienia się literówki za pomocą klawisza Tab - po wklejeniu lub przepisaniu powyższego kodu
napisz Leanowi *z pamięci*:

```lean
#eval dodaj2 dziesiec
```

**Definicja aplikacji**: Samo *zapisanie obok siebie* (albo "zestawienie") funkcji i jakiegokolwiek
wyrażenia o typie takim jak parametr tej funkcji, bez obliczania wyniku, nazywamy *aplikacją*. Na
przykład, zapis `dodaj2 dziesiec` jest (poprawną) aplikacją, bo `dodaj2` wymaga jako argumentu
dowolnego termu typu `Nat`, a stała `dziesiec` jest właśnie takim termem. 

Ten zapis *jest i nie jest* liczbą `12`, zależnie od tego, jak na niego spojżeć. Z jednej strony,
*oznacza* liczbę `12` i dlatego możemy powiedzieć, że nią *jest*. Z drugiej strony, liczba/term `12`
jest czymś, co *uzyskujemy na skutek ewaluacji* tego zapisu (a mówiąc dokładniej na skutek
zastosowania funkcji `dodaj2` do termu `2`), a więc coś musi się *wydarzyć*, żeby ta liczba się tu
"pojawiła" jako *skutek* tego czegoś, co musi się wydarzyć. W tym sensie ta aplikacja i liczba `12`
to to samo i zarazem nie całkiem to samo.

Jak się być może domyślasz, ta różnica ma czasem znaczenie, a czasem nie. Wyraźne odróżnienie
*aplikacji*, czyli samego *zestawienia* funkcji z jej argumentami, od *ewaluacji*, czyli tak lub
inaczej rozumianego "obliczenia" wartości wyrażenia, może się wydawać zbędne, ale okaże się
potrzebne między innymi podczas dowodzenia twierdzeń, kiedy to normą stanie się konstruowanie
aplikacji, których *nie będziemy chcieli* ewaluować.

Funkcja `dodaj2` jest ewidentnie *jedno*argumentowa. Zdefiniujemy teraz funkcję, która będzie
dodawała *dwie* dowolne liczby naturalne i zrobimy to w sposób, który pozwoli Ci zobaczyć, że takie
funkcje w Leanie też są tak naprawdę *jedno*argumentowe (i jednocześnie dwuargumentowe \{ale nie
"tak naprawdę"\}). Ponieważ to będzie **najtrudniejsza** część tego rozdziału, wyjaśnię jak to
działa na kilka sposobów.

**Jak do tego podejść**: *Zalecam teraz uzbroić się w cierpliwość i czytać dalej, nawet jeżeli
będziesz miała poczucie, że "tego wszystkiego" jest na raz za dużo. "To wszystko" stanie się w miarę
zrozumiałe dopiero wtedy, gdy będzie Ci wystarczająco łatwo wydobyć kluczowe "puzzle" z pamięci i
dzięki temu łatwiej Ci będzie układać je "w głowie". Dlatego trzeba się liczyć z koniecznością
czytania tych samych fragmentów więcej niż raz, być może po pewnej przerwie. Procesu poprawiania się
dostępności pamięciowej nie da się chyba za bardzo przyspieszyć, ale to tylko kwestia*
**czasu**[^1].

```lean
-- Ta definicja może się w pierwszej chwili wydawać dziwna, ale niebawem stanie się oczywista.
def plus : Nat → (Nat → Nat) := 
    fun (pierwsza : Nat) => 
      fun (druga : Nat) => pierwsza + druga
```

Zamiast od razu tłumaczyć, czemu ten kod ma tak pozornie niepotrzebnie złożoną strukturę, powiem Ci
najpierw, w jaki sposób Lean ewaluuje (czyli "oblicza") aplikację funkcji `dodaj2` do termu `2`, a
potem wyjaśnię, jak ewaluuje aplikację funkcji `plus` do termów `1` i `2`. Nie kopiuj poniższego
kodu do Leana, bo to tylko ilustracja.

```lean
-- Żeby ewaluować aplikację `dodaj2 2`, Lean ewaluuje, czyli redukuje do najprostszej postaci, argument
-- aplikacji. Cyfra `2` oznacza tutaj coś bardziej podstawowego, ale o tym powiem innym razem. Na razie
-- będziemy udawać, że pod cyfrą `2` nie kryje się nic więcej.
#eval dodaj2 2

-- Lean rozpakowuje również definicję stałej funkcyjnej, czyli tutaj stałej `dodaj2`. W rezultacie w miejscu
-- `dodaj2` pojawia się *funkcja anonimowa*, bo już bez nazwy "dodaj2", to jest:
-- `fun (moj_parametr : Nat) => moj_parametr + 2`

-- Po tym kroku ewaluacji zapis wygląda tak (żeby zapis był jednoznaczny, otoczyłem funkcję nawiasami):
(fun (moj_parametr : Nat) => moj_parametr + 2) 2

-- Lean odrzuca część przed symbolem `=>`, zostawiając tylko *ciało* funkcji ...
moj_parametr + 2

-- ... i *jednocześnie podstawia* zredukowaną wersję argumentu pod parametr funkcji w ciele funkcji,
-- czyli w tym wypadku podstawia `2` pod *zmienną* `moj_parametr`:
2 + 2
```

### "Parametr" i "argument" to terminy techniczne oznaczające blisko związane, ale różne rzeczy

Czy widzisz, że warto przynajmniej czasami używać innej nazwy - "parametr" - na to, co pojawia się
po słowie `fun` (czyli tutaj na określenie tego, czym jest nazwa `moj_parametr`), i innej -
"argument" - na to, co pojawia się jako drugi term w tej aplikacji (czyli na `2`)? Bez nazywania
tych dwóch rzeczy za pomocą innych słów byłoby czasem trudno o tym mówić w sposób zrozumiały.

*Parametry* są *własnościami* (i częściami) *samych funkcji*, a *argumenty* są *własnościami (i
częściami) aplikacji funkcji*. Inaczej mówiąc, parametry to *wejścia* funkcji, a argumenty to
obiekty albo termy, które na tych wejściach *podajemy* funkcji do przetworzenia. Funkcje mają (cały
czas) określone (w definicjach) parametry i mają je niezależnie od tego, czy są kiedykolwiek do
czegokolwiek aplikowane. Funkcje jako takie nie mają więc argumentów, bo argumenty są tylko
(odpowiednimi) częściami *aplikacji* (jakiś) funkcji, a nie częściami funkcji.

*Zmienna* to natomiast oznaczone za pomocą nazwy parametru *miejsce w ciele funkcji*, po prawej od
symbolu definiowania `:=`. Bo zmienne są czymś, pod co albo za co albo w miejsce czego można coś, to
jest argument aplikacji funkcji odpowiadający parametrowi (czyli wejściu o tej samej nazwie co ta
zmienna) *podstawiać*. Zmienne pełnią więc rolę *zaimków*. Ale może nie próbuj tego na siłę od razu
zapamiętać, bo jeszcze do tego wrócimy.

W praktyce często używamy terminów "parametr" i "argument" wymiennie, przy czym częściej pojawia się
termin "argument" (na przykład, "ta funkcja ma argument liczbowy" zamiast "ta funkcja ma parametr
liczbowy" lub "ta funkcja przyjmuje argumenty liczbowe"), ponieważ zwykle można łatwo wywnioskować z
kontekstu, czy chodzi o parametr jako własność funkcji, czy o argument jako własność aplikacji (na
przykład, gdy mówimy "ta funkcja ma argument liczbowy", ewidentnie chodzi o parametr).

```lean
-- `+` to także funkcja, tylko taka, której aplikację możemy zapisać w *notacji infiksowej*, inaczej
-- *wzrostkowej*, czyli w stylu: `argument1 funkcja argument2`, na przykład pisząc `2 + 3`. Lean na
-- to pozwala, jeśli mu wytłumaczymy, jak ma przekształcać taki zapis na zwyczajny zapis aplikacji.
-- Akurat w przypadku funkcji `+` wie to z góry.

-- W końcu Lean rozpakowuje definicję funkcji odpowiadającej symbolowi `+` i stosuje ją do obydwu
-- argumentów. Ten proces trwa aż do momentu, gdy nie da się nic więcej zredukować. W ten sposób
-- powstaje wynik dodawania i właśnie ten wynik pojawia się jako rezultat, gdy wymuszamy ewaluację
-- aplikacji `dodaj2 2`:
#eval dodaj2 2 -- Kiedy kursor znajduje się w tej linii, po prawej widać liczbę `4`
```

Przypuszczam, że tego właśnie się mniej więcej spodziewałaś, tylko może sens tej operacji nie wydaje
Ci się jeszcze całkiem oczywisty, bo przysłaniają go moje (celowo!) rozwlekłe objaśnienia. Teraz
pokażę Ci, jak przebiega ewaluacja bardziej skomplikowanej, bo (w pewnym sensie) dwuargumentowej
funkcji `plus` do argumentów `1` i `2`. Ten kod to również tylko ilustracja:

```lean
#eval plus 1 2

-- Ponieważ udajemy tutaj, że w przypadku termów `1` i `2` nie ma nic do rozpakowania, pierwszy krok
-- ewaluacji to rozpakowanie definicji stałej `plus`:
(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 1 2

-- Drugi krok to odczepienie ciała ...
(fun (druga : Nat) => pierwsza + druga)

-- ... i jednocześnie podstawienie argumentu `1` pod zmienną `pierwsza`, będącą jednocześnie parametrem
-- funkcji, której aplikacja jest ewaluowana. W ten sposób za każdym razem, gdy funkcja `plus` dostaje
-- pierwszy argument (typu `Nat`), ta funkcja tworzy nową funkcję albo nową wersję funkcji, którą
-- można tu nazwać "wewnątrzną":
(fun (druga : Nat) => 1 + druga) 2

-- Ponieważ uzyskujemy w ten sposób kolejną aplikację, trzeci krok to również ewaluacja aplikacji, a
-- więc kolejne odczepienie ciała ...
1 + druga

-- ... i jednocześnie podstawienie, tym razem argumentu `2` pod zmienną `druga`, będącą parametrem
-- funkcji, której aplikacja jest w tym kroku ewaluowana:
1 + 2

-- Ewaluacja postępuje dalej w ten sam sposób, aż nie zostanie nic, co można i warto zredukować.
```

Napisałem "można i *warto*", ponieważ na przykład symbol `2` *można* w Leanie zredukować do czegoś,
co się pod nim kryje (`2` to w Leanie nazwa na następną liczbę naturalną po następnej liczbie
naturalnej po liczbie naturalnej zero), ale zwykle *nie warto*, bo wygodniej jest zapisywać liczby
naturalne za pomocą cyfr. A teraz jeszcze raz to samo, ale tym razem bez komentarzy i bez
zapisywania w osobnej linijce odczepianego ciała (to też tylko ilustracja, a nie poprawny kod):

```lean
-- Ewaluacja aplikacji `plus 1 2` w zarysie
#eval plus 1 2

-->
(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 1 2

-->
(fun (druga : Nat) => 1 + druga) 2

-->
1 + 2

-->
3
```

Czy widzisz, jak kolejne argumenty, tak jakby "przechodząc" przez odpowiednie wejścia/parametry,
"wskakują" na właściwe miejsca/wystąpienia zmiennych w ciele funkcji, oznaczone nazwami tych
parametrów? Warto choć raz spróbować sobie wyobrazić, że między parametrem, takim jak `(pierwsza :
Nat)`, a wystąpieniem tej samej nazwy (tutaj `pierwsza`) w ciele funkcji jest coś w rodzaju
niewidocznego przewodu. Gdybyśmy mogli zapisywać jakoś takie przewody w kodzie, nazwy parametrów i
zmiennych byłyby zbędne, bo te przewody służyłyby tak samo dobrze do tego samego celu. W jednym z
późniejszych rozdziałów właśnie to będziemy robić, kiedy zastąpimy zwykły zapis szeregowy albo
jednowymiarowy [dwuwymiarowym formalnym językiem
rysunkowym](https://en.wikipedia.org/wiki/String_diagram).

Teraz mogę już chyba wyjaśnić, że wyrażenie `1 + 2` jest przez Leana zastępowane przez aplikację
`Nat.add 1 2`, bo w tym kontekście `+` to tylko inny sposób zapisania dostępnej w Leanie funkcji
`Nat.add`, która obsługuje dodawanie liczb naturalnych. Pokażę Ci jeszcze raz to samo, ale używając
notacji, którą chętnie stosują matematycy. Dla uproszczenia pominę jednak typy parametrów.

Funkcje anonimowe, takie jak `fun (moj_parametr : Nat) => moj_parametr + 2`, nazywamy również
*λ-abstrakcjami*. Lean wie o tej konwencji i pozwala zamiast `fun` napisać `λ`. Jeżeli chcesz
skorzystać z tego zapisu, możesz uzyskać tą literę pisząc `\la`. Ja wolę pisać `fun`, bo taki zapis
jest bardziej powszechny, wydaje mi się czytelniejszy i szybciej to słowo wpisuję, za to `λ`
bardziej mi się podoba.

Gdy zastosujemy uproszczoną (bo bez typowania) notację, którą częściej stosują matematycy nie będący
programistami, gdzie zamiast `fun` będziemy pisać *λ*, a zamiast `=>` będziemy pisać *kropkę*, to
zobaczymy znowu, że ewaluacja aplikacji anonimowej (bo bez nazwy "dodaj2") wersji funkcji `dodaj2`
...

*(λ x . x + 2) 2*

... polega w pierwszym kroku na odczepeniu ciała λ-abstrakcji, czyli części po kropce ...

*x + 2*

... i podstawieniu argumentu w miejscu wystąpienia zmiennej *x*, będącym czymś w rodzaju portu
połączonego wirtualnym przewodem z wejściem o tej samej nazwie/parametrem aplikowanej λ-abstrakcji:

*2 + 2*

Ewaluacja aplikacji anonimowej wersji funkcji `plus` do liczb *1* i *2* ...

*(λ x . (λ y . x + y)) 1 2*

... też polega na takim samym odczepieniu ciała λ-abstrakcji ...

*(λ y . x + y)*

... i podstawieniu argumentu w miejscu wystąpienia zmiennej *x*, będącym (portem połączonym
wirtualnym przewodem z) parametrem zewnętrznej λ-abstrakcji. W ten sposób z ciała zewnętrznej
λ-abstrakcji powstaje wersja funkcji *(λ y . x + y)* wyspecjalizowana w ten sposób, że zamiast *x*
jest *1*, a cała początkowa aplikacja *(λ x . (λ y . x + y)) 1 2* zostaje w tym kroku zredukowana do
postaci:

*(λ y . 1 + y) 2*

Ewaluacja jeszcze nie jest zakończona, bo jest co do czego aplikować. Matematycy mówią w takiej
sytuacji (po angielsku), że jest jeszcze jakiś *redex* (to skrót od *reducible expression*). A więc
znowu odczepiamy ciało ...

*1 + y* 

... i jednocześnie (mówiąc krótko i nieco inaczej) zastępujemy zmienną *y* przez argument *2*:

*2 + 2*

Jeszcze raz to samo, ale tym razem bez komentarzy:

*(λ x . (λ y . x + y)) 1 2*  

*(λ y . 1 + y) 2*  

*1 + 2*  

*3*

Rozumiesz już, że możemy w ten sposób definiować funkcje, które zachowują się jak funkcje
*dwu*argumentowe, posługując się tylko funkcjami *jedno*argumentowymi? Ten sposób to tak zwany
*currying*, od nazwiska wybitnego matematyka [Haskella
Curry'ego](https://en.wikipedia.org/wiki/Haskell_Curry), który go wymyślił, którego imię lub
nazwisko jest, na jego cześć, nazwą aż trzech różnych języków programowania, i którego jeszcze
niebawem spotkamy.

Pozostaje mi objaśnić *zapis typu* tej funkcji, to jest `Nat → (Nat → Nat)`. Funkcja `plus` dobrze
udaje zwykłą funkcję dwuargumentową dzięki temu, że ciało funkcji wewnętrznej jest przez
(zewnętrzną) funkcję `plus` konstruowane z tego, co `plus` dostaje jako (w pewnym sensie jedyny)
argument. To znowu tylko ilustracja (tym razem dlatego, że stała `plus` jest już zdefiniowana):

```lean
def plus : Nat → (Nat → Nat) := 
    -- Funkcja "zewnętrzna":
    fun (pierwsza : Nat) =>
        -- Funkcja "wewnętrzna", której *ciało zmienia się* na skutek podstawiania pod zmienną
        -- `pierwsza`, gdy ewaluujemy aplikację funkcji `plus` do pierwszego argumentu:
        fun (druga : Nat) => pierwsza + druga
```

Mam nadzieję, że jest dla Ciebie jasne, że *wewnętrzna* funkcja ma typ `Nat → Nat`, skoro pobiera
term typu `Nat` i zwraca term typu `Nat` (będący w tym wypadku rezultatem dodawania). Natomiast
*zewnętrzna* (albo "otaczająca") funkcja pobiera term typu `Nat`, ale *zwraca funkcję*, dlatego
właśnie typ stałej `plus` to `Nat → (Nat → Nat)`.

Nawiasy w `Nat → (Nat → Nat)` nie są konieczne, bo w Leanie *strzałka wiąże z prawej*. Gdyby nie ta
konwencja, zapis `Nat → Nat → Nat` byłby problematycznie wieloznaczny, ponieważ nie byłoby wiadomo,
czy chodzi o `(Nat → Nat) → Nat` czy o `Nat → (Nat → Nat)`, a to nie to samo: `(Nat → Nat) → Nat` to
typ (jakichkolwiek) funkcji, które przekształcają *funkcje* typu `Nat → Nat` w liczby naturalne, a
`Nat → (Nat → Nat)` to typ (jakichkolwiek) funkcji, które przekształcają *liczby naturalne* w
*funkcje* typu `(Nat → Nat)`.

Mówiąc ogólnie, to, że w Leanie strzałka wiąże z prawej oznacza, że dla dowolnych (być może
złożonych) typów `A`, `B` i `C`, zapis `A → B → C` Lean interpretuje jako `A → (B → C)`, a więc
(podstawiając typ `Nat` pod `A`, `B` i `C`) `Nat → Nat → Nat` interpretuje jako `Nat → (Nat → Nat)`.
Zapisałem to wprost, nie polegając na tej konwencji i zamiast tego używając nawiasów, żebyś nie
musiała się tego od razu domyślać.

Lean pozwala również na zapis skrótowy między innymi w takim stylu (to tylko *alternatywne sposoby*
zapisania *tej samej* definicji) ...

```lean
-- Nie kopiuj tego kodu do Leana, jeżeli nie usunęłaś wcześniej definicji funkcji `plus`. Lean nie
-- pozwala definiować dwa razy tej samej stałej w tym samym kontekście, dlatego właśnie stałe
-- nazywamy stałymi.
def plus (pierwsza : Nat) (druga : Nat) : Nat := pierwsza + druga
```

... albo w takim, ...

```lean
-- Tego też nie kopiuj, jeżeli nie usunęłąś wcześniej definicji stałej `plus`. Tutaj nie podajemy
-- jawnie typu rezultatu (nie ma fragmentu `: Nat` przed symbolem `:=`), co nie jest błędem, bo Lean
-- może wywnioskować, że rezultat musi mieć typ `Nat`, skoro jest sumą dwóch termów typu `Nat`.
def plus (pierwsza : Nat) (druga : Nat) := pierwsza + druga
```

... a nawet w takim, ...

```lean
-- Skoro parametr `druga` ma typ `Nat` i jest dodawany do parametru `pierwsza`, to parametr
-- `pierwsza` musi mieć typ `Nat`.
def plus (pierwsza) (druga : Nat) := pierwsza + druga
```

... albo w takim, ...

```lean
def plus (pierwsza : Nat) (druga) := pierwsza + druga
```

... ale w takim już *nie*, bo symbol `+` ma *w pewnym sensie* (wyjaśnię w jakim znacznie później,
gdy będę mówił o *kontrolowanej wieloznaczności* w matematyce i o *klasach typów*) wiele definicji
(dla różnych typów liczbowych, takich jak liczby naturalne, całkowite, wymierne i rzeczywiste), a
widoczna poniżej definicja nie pozwala automatycznie wywnioskować, którą wersję wybrać:

```lean
-- Ta definicja jest zapisana zbyt skrótowo i dlatego *błędna*, bo nie pozwala Leanowi automatycznie
-- wywnioskować typu parametrów i rezultatu, przez co nie pozwala wywnioskować, jakiej wersji dodawania
-- (na przykład, dla liczb naturalnych czy może wymiernych) należy tu użyć:
def plus (pierwsza) (druga) := pierwsza + druga
```

Skrótowy zapis jest bardzo wygodny i często właśnie takiego zapisu będziemy używać, ale na tym
etapie jest ważne, żebyś wiedziała, co takie skróty oznaczają. Nie musisz sobie o tym przypominać za
każdym razem, kiedy definiujesz stałe albo ich używasz, ale w pewnych sytuacjach ta wiedza będzie Ci
potrzebna.

Pokażę Ci jeszcze, w jaki sposób Lean interpretuje podawanie parametrów definiowanej funkcji przed
typem jej rezultatu, czyli przed "głównym" drukropkiem. Na prywatny użytek nazywam to
"przestawialnością dwukropka" w definicjach funkcji (ilustracja):

```lean
-- Ta definicja ...
def plus (pierwsza : Nat) (druga : Nat) : Nat := pierwsza + druga

-- ... znaczy to samo, co ta ...
def plus (pierwsza : Nat) : Nat → Nat := fun (druga : Nat) => pierwsza + druga

-- ... i to samo, co ta ...
def plus : Nat → (Nat → Nat) := fun (pierwsza : Nat) => (fun (druga : Nat) => pierwsza + druga)

-- To tylko różne sposoby zapisania tej samej definicji.
```

Czy zaczynasz już widzieć, że zapisywanie parametrów w nawiasach zaraz po nazwie definiowanej
funkcji a przed symbolem definiowania `:=` to tylko skrótowy sposób zapisania λ-abstrakcji?

**Polecenie**: Stosując wygodny zapis *skrótowy*, zdefiniuj funkcję `plusplus` pobierającą *trzy*
argumenty typu `Nat`, każdy o innej nazwie (różne parametry tej samej funkcji muszą mieć różne
nazwy), i dodającą je do siebie. Sprawdź typ zdefiniowanej w ten sposób stałej `plusplus` za pomocą
komendy `#check`. Zobaczysz wtedy po prawej jeszcze bardziej skrótowy sposób zapisywania listy
parametrów. 

Ten bardziej skrótowy zapis polega na tym, że nazwy parametrów są zapisane jedna obok drugiej między
tą samą parą nawiasów, a typ jest zapisany tylko raz, od razu dla tych wszystkich parametrów. Można
tu użyć tego jeszcze bardziej skrótowego zapisu, bo *sąsiadujące* parametry funkcji `plusplus` mają
*ten sam typ*, dzięki czemu Lean może z takiego zapisu wywnioskować o co chodzi. Usuń więc
definicję, którą właśnie napisałaś i napisz ją jeszcze raz, ale tym razem stosując ten nowy zapis
skrótowy. Na koniec ewaluuj aplikację funkcji `plusplus` do dowolnych trzech liczb naturalnych.

## Częściowe aplikacje

Ponieważ funkcja `plus` to "tak naprawdę" funkcja, która zwraca tworzoną przez siebie funkcję,
możemy aplikować funkcję `plus` do *jednego* argumentu, na przykład do termu `3`. Wartością tej
aplikacji nie będzie liczba naturalna, tylko *funkcja* (jednoargumentowa), która do dowolnej liczby
naturalnej dodaje `3` (ilustracja):

```lean
-- To ...
plus 3

-- ... zgodnie z definicją stałej `plus` jest tym samym, co to ...
(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 3

-- ... a to redukuje się (a więc też *tym jest*) do tego ...
(fun (druga : Nat) => 3 + druga)

-- ... a więc do funkcji, która do dowolnej liczby naturalnej dodaje `3`.
```

Ponieważ rezultatem tej *częściowej* aplikacji jest *funkcja*, to możemy *aplikować tą częściową
aplikację* do dowolnej liczby naturalnej. W istocie to właśnie robimy, gdy piszemy na przykład `plus
3 2`, bo to wyrażenie nie oznacza "tak naprawdę" aplikacji funkcji `plus` do dwóch argumentów, tylko
`(plus 3) 2` (właśnie dlatego w Leanie *aplikacje* wiążą *z lewej*), czyli aplikację do liczby `2`
(będącego funkcją) rezultatu aplikacji funkcji `plus` do liczby `3`. Tak jak w przypadku każdego
innego termu, czyli poprawnego wyrażenia teoriotypowego, możemy zapisać tą częściową aplikację jako
ciało definicji jakiejś nie zdefiniowanej jeszcze stałej, na przykład stałej o nazwie `dodaj3`. Ta
stała będzie miała wtedy typ `Nat → Nat` (już wiesz, dlaczego ta stała będzie miała ten typ?):

```lean
-- Ponieważ funkcja `plus` jest (jakby) dwuargumentowa, aplikacja `plus 3` "czeka" na drugi argument.
-- Mówiąc dokładniej, ta aplikacja jest (po zredukowaniu/ewaluacji) funkcją powstającą przez podstawienie
-- `3` pod zmienną `pierwsza` w "wewnętrznej" funkcji ...
-- `fun (druga : Nat) => pierwsza + druga` 
-- ... czyli jest funkcją:
-- `fun (druga : Nat) => 3 + druga`

-- Ten kod możesz skopiować, bo jest poprawny, zakładając, że stała `plus` jest zdefiniowana zgodnie
-- z wcześniejszym poleceniem. W ten sposób `dodaj3` staje się *funkcją, która powstaje z aplikacji
-- funkcji `plus` do liczby 3*:
def dodaj3 : Nat → Nat := plus 3

-- Równie dobrze, korzystając z przestawialności dwukropka i domyślności Leana (nie podajemy tu jawnie typu
-- rezultatu), mogliśmy zapisać tą definicję tak:
def dodaj3' (n : Nat) := plus 3 n

-- Funkcję `dodaj3` możemy stosować tak samo, jak każdą inną:
#eval  dodaj3 3 -- `6`
#check dodaj3   -- `dodaj3 : Nat → Nat`
```

Co ciekawe, samej częściowej aplikacji `plus 3` nie możemy *ewaluować*, bo Lean nie potrafi bez
naszej pomocy *wyświetlać funkcji*, tak jak wyświetla na przykład (w panelu po prawej) wartości
liczbowe albo tekstowe.

**Polecenie dla ambitnych**: Gdy już poczujesz, że możesz sobie z tym poradzić, spróbuj zrobić coś
podobnego do tego, co zrobiłem z częściową aplikacją funkcji `plus`, ale użyj zdefiniowanej
wcześniej funkcji `plusplus`. Gdyby pojawił się błąd, *przeczytaj komunikat* (początkujący chyba
często wpadają w lekką panikę widząc komunikaty o błędzie). Jeżeli to polecenie okaże się zbyt
trudne, zamiast się tym przejmować spróbuj to może *docenić*. Będzie to przecież znaczyło, że możesz
nauczyć się czegoś na tyle dla Ciebie *nowego*, że aż początkowo trudnego, a gdy *nieuchronnie* po
pewnym czasie to coś stanie się dla Ciebie łatwe, to będzie znaczyło, że Twoja wiedza i umiejętności
znacznie wzrosły.

**Polecenie dla nadmiernie ambitnych**: Zdefiniuj i zastosuj funkcję, która pobiera dwa argumenty:

1. *Funkcję* typu `Nat → Nat`, na przykład dodającą `2` do swojego parametru, albo jakąkolwiek inną
tego typu, anonimową lub będącą wartością jakiejś stałej.

2. Term typu `Nat`.

Definiowana przez Ciebie funkcja ma w swoim ciele stosować swój pierwszy argument (rozluźniłem
reguły użycia terminu "argument", zauważyłaś?), czyli wartość pierwszego parametru, czyli funkcję
przekształcającą liczby naturalne w liczby naturalne, czyli term typu `Nat → Nat`, do drugiego
parametru, to jest do (dowolnego) termu typu `Nat`. *Sprawdź typ* zdefiniowanej w ten sposób funkcji
i *oblicz* rezultat zastosowania jej do jakiejś zapisanej przez siebie (w nawiasach) funkcji
anonimowej, lub jakiejś wcześniej przypisanej do stałej (na przykład do `dodaj2`) funkcji typu `Nat
→ Nat` jako pierwszego argumentu, a także jakiejś liczby naturalnej jako drugiego.

W ten sposób skorzystasz z faktu, że Lean pozwala nie tylko na definiowanie funkcji, które tworzą
funkcje, czyli *programów, które tworzą programy*, ale również na definiowanie funkcji, które
stosują do czegoś funkcje podane jako argumenty, czyli *programów, które przetwarzają albo stosują
dostarczane na wejściach programy*.

### Przypisy

[^1]: Pierwszym znanym mi tak młodym, bo czternastoletnim (sic!) czytelnikiem tej książki był Szymon
    Strypling, który przyswoił sobie treści zawarte w tym rozdziale w ciągu około 30 minut, a
    jedynym miejscem, w którym poczuł się przez chwilę nieco przytłoczony nadmiarem informacji, było
    właśnie to, dotyczące funkcji `plus`. Gdy jednak Szymon doczytał trochę dalej, wszystko się
    rozjaśniło i reszta poszła mu już, o ile mi wiadomo, jak z płatka. Na Jego cześć dodałem więc to
    ostrzeżenie i słowa zachęty.
