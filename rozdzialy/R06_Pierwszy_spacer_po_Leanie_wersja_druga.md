<br>

**Moim zdaniem, najważniejsza wskazówka na temat tego, jak czytać tą książkę, jest
[tutaj](./Wujek_dobra_rada.md).**

<hr>

## O czym teraz będzie

Przypominam, że to jest alternatywna wersja *tego samego rozdziału*. Zdecydowałem się napisać dwie
wersje, ponieważ to, jak łatwe będą dla Ciebie do zrozumienia kolejne rozdziały, będzie zależało w
znacznym stopniu od tego, jak dobrze uda mi się wytłumaczyć to, co omawiam tutaj. Dlatego być może
dobrze będzie, jeśli przynajmniej zerkniesz do poprzedniej wersji po tym, jak przeczytasz tą.

Gdy już objaśnię ogólną strukturę i sposób działania funkcji w Leanie, w następnych rozdziałach
pokażę Ci, że będziesz już właściwie wiedzieć, czym jest *duży kwantyfikator* (chodzi o spójnik
logiczny `∀`, który czytamy *dla każdego*) i niewiele będzie trzeba, żebyś zrozumiała, jak w logice
konstruktywnej działa *implikacja* (chodzi o symbol `→`, który akurat w logice czytamy *jeżeli,
to*), bo ta jest w logice konstruktywnej tylko pewnego rodzaju funkcją, a o funkcjach będziesz już
wtedy wiedzieć całkiem sporo. Pozostałe standardowe *spójniki logiczne* (`∧`, `∨` i `∃`), za
wyjątkiem *negacji* (`¬`), można również zdefiniować za pomocą funkcji/implikacji, a żeby z kolei
zdefiniować negację, wystarczy użyć czegoś, co w pewnym sensie zachowuje się jak funkcja. Ale te
ostatnie wątki pojawią się znacznie później.

Ponieważ *predykaty* (takie jak *jest dziwne* w zdaniu *Życie jest dziwne*) to, jak się przekonasz,
również funkcje, podobnie jak wszelkie relacje, ucząc się w ten sposób jednocześnie, zarazem na
skróty i od podstaw, matematyki i programowania, stosunkowo szybko opanujesz podstawy *logiki
predykatów* (wyższego rzędu). To narzędzie pozwoli Ci
[prześlwietlać](https://www.youtube.com/watch?v=0pYyzolIN3I) strukturę nie tylko dowodów
matematycznych, ale również, przynajmniej do pewnego stopnia, rozumowań zapisanych w języku
naturalnym.

Między innymi właśnie rachunek predykatów będziesz mogła później stosować do głównego rozumowania w
swojej pracy semestralnej, pracy magisterskiej, doktoracie, albo artykule, lub do analizy -
nierzadko strukturalnie dosyć prostych i jednocześnie "dziurawych" - uzasadnień głównych wniosków w
artykułach naukowych. Często sama *próba* przeprowadzenia takiej formalizacji pozwoli Ci wskazać,
gdzie *dokładnie* są ewentualne *błędy logiczne* lub *kluczowe niejasności*. Celowo niedokończony i
mam nadzieję, że interesujący przykład tego rodzaju zabawy znajdziesz [w jednym z następnych
rozdziałów](./R12_Duzy_kwantyfikator.md).

<hr>

# Pierwszy spacer po Leanie, wersja druga

Polecenia i zadania, które pojawiają się w pierwszych rozdziałach, nie wymagają instalacji Leana,
ale jeżeli dotarłaś do tego momentu, to możliwe, że brałaś to już pod uwagę. Warto go zainstalować,
na przykład w połączeniu z darmowym edytorem [VS Code](https://code.visualstudio.com/). Proste
instrukcje jak to zrobić znajdziesz [tutaj](https://lean-lang.org/lean4/doc/quickstart.html).

**Polecenie**: Jeżeli nie używasz edytora *VS Code*, a w pierwszych rozdziałach zakładam, że nie, to
skopiuj na początek do lewego okna taki fragment kodu:

```lean
-- Tekst zaczynający się od -- to komentarz. Komentarze są przez Leana ignorowane. Dzięki temu
-- możemy napisać na przykład to:
--
-- Lean jest głupi
--
-- i nic się nie stanie.

-- Ta fascynująca funkcja pobiera jeden argument typu `Nat`, czyli liczbę naturalną, i nic z nią nie
-- robi, tylko ją zwraca (każda funkcja musi coś zwracać gdy tylko coś dostanie):
def nic_nie_robie (n : Nat) : Nat := n
```

**Czytamy to**: 

- Definiuję (`def`) ...

- funkcję (bo ma parametr) `nic_nie_robie` ...

- która ma (tutaj jeden) parametr `n` typu `Nat` (`(n : Nat)`) ...

- i zwraca (tak czytamy symbol `:`, który nazywam głównym dwukropkiem, pojawiający się po
  specyfikacji ostatniego parametru funkcji) term typu `Nat`.

- *Ciałem* tej funkcji jest (`:=`) samotna zmienna `n`. 

Czy nie wydaje Ci się, że składnia Leana jest prosta i intuicyjna? Nawet, jeżeli tego jeszcze nie
widzisz, wklej poniżej zapisanej właśnie definicji następny fragment kodu i umieść kursor na
komendzie `#eval`. Zobaczysz wtedy po prawej rezultat *ewaluacji* aplikacji funkcji `nic_nie_robie`
do termu `1`. Rezultatem tej ewaluacji też będzie `1`, bo funkcja `nic_nie_robie` zwraca argument
bez zmian.

```lean
#eval nic_nie_robie 1
```

Teraz będziemy na dwa różne sposoby *sprawdzać typ termu* `nic_nie_robie`. W tym celu wklej lub
przepisz z pamięci to:

```lean
#check @nic_nie_robie

#check nic_nie_robie
```

Te dwa sposoby różnią się obecnością prefiksu `@`. Gdy umieścisz kursor nad *pierwszym* wystąpieniem
słowa `#check`, zobaczysz po prawej typ termu `nic_nie_robie` zapisany w taki oto sposób:

`nic_nie_robie : Nat → Nat`

`Nat` to typ oznaczający liczby naturalne. Myślę, że zaczęłaś się już oswajać z tym, że w Leanie
wyrażenie o postaci `M : N`, gdzie `M` i `N` to jakieś wyrażenia, czytamy jako `M` *ma typ* `N`. Gdy
`M` to *zmienna*, na przykład `x`, takie wyrażenie nazywamy *deklaracją* (typu tej zmiennej), na
przykład, `x : N`, gdzie `N` to jakieś wyrażenie oznaczające typ, jest deklaracją, że `x` ma typ
`N`. A zawsze, gdy po stronie typu, czyli po prawej od symbolu `:`, widzisz strzałkę, masz do
czynienia z *typem funkcyjnym*[^1]. Na przykład, `nic_nie_robie` jest termem typu funkcyjnego, czyli
funkcją, bo ma w typie strzałkę. Komunikat, który widzisz po prawej, gdy sprawdzasz typ tej stałej,
to jest ...

`nic_nie_robie : Nat → Nat`

... możesz więc odczytać tak:

*`nic_nie_robie` jest jakąś funkcją, która z dowolnej liczby naturalnej robi jakąś liczbę naturalną*
(albo bardziej pedantycznie: *stała `nic_nie_robie` oznacza jakąś funkcję, która ...*).

Jeżeli umieścisz kursor nad *drugim* wystąpieniem komendy `#check`, tym, któremu nie towarzyszy
symbol `@`, to zobaczysz *tą samą informację*, tylko *przedstawioną w inny sposób* (zgodny z tym,
jak zapisałem definicję tej funkcji):

`nic_nie_robie (n : Nat) : Nat`

Wydaje mi się, że już rozumiesz, jak to odczytujemy, ale na wszelki wypadek jeszcze raz
wyjaśniam. Stąd, że obok stałej `nic_nie_robie` mamy fragment `(n : Nat)` możemy wywnioskować, że
`nic_nie_robie` jest funkcją, która wymaga jako argumentu liczby naturalnej. Nawiasem mówiąc,
nazwałem ten parametr `n`, ponieważ to pierwsza litera w słowie *naturalna*. Gdy teraz skopiujesz do
Leana jeszcze to ...

```lean
#check nic_nie_robie 1
```

... i umieścisz kursor nad komendą `#check`, to zobaczysz po prawej komunikat:

`nic_nie_robie 1 : Nat`

Tym razem sprawdzamy typ termu złożonego `nic_nie_robie 1`. W tym komunikacie po lewej od `:` mamy
teraz *dwa* termy proste albo atomowe, które razem tworzą właśnie term złożony, będący w tym
przypadku *aplikacją* (aplikacja jest zawsze zestawieniem {być może złożonego} wyrażenia
oznaczającego jakąś funkcję i jakiegoś innego {być może złożonego} wyrażenia), a mówiąc dokładniej
aplikacją (termu o typie) funkcji `nic_nie_robie` do (termu) `1`. Pierwszy i jedyny parametr `n`
funkcji `nic_nie_robie` ma typ `Nat` i `1` również ma typ `Nat`, a zatem `1` jest termem typu,
którego ta funkcja wymaga. Dlatego aplikacja funkcji `nic_nie_robie` do termu `1` jest poprawna,
inaczej *typowalna*.

**Definicja aplikacji**: Samo *zestawienie* funkcji i jakiegoś termu nazywamy *aplikacją funkcji do
tego termu*, albo krótko *aplikacją*.

W Leanie wszystkie termy, w tym również złożone, *muszą* mieć jakiś typ. Ale uwaga, nie każdy term
(niektórzy mówią w takich sytuacjach *wyrażenie*) *ma* typ, ponieważ można skonstruować termy (czy
może raczej wtedy tylko *wyrażenia*, rezerwując tym samym słowo *term* dla wyrażeń typowalnych)
*błędne*, to jest takie, których nie da się typować. Dla Leana takie termy (albo wyrażenia) są
"bezsensowne". Jeżeli w tym momencie obawiasz się, że napiszesz jakieś termy czy wyrażenia
bezsensowne, to niepotrzebnie się tego obawiasz, bo prawie na pewno napiszesz wiele bezsensownych
fragmentów kodu. Im więcej piszesz, tym więcej bzdur napiszesz, jak zauważył zdaje się ten
przenikliwy obserwator ludzkiej natury Gombrowicz[^2]. To jest może zła wiadomość, chociaż nie
jestem tego pewien. Na pewno dobra wiadomość jest taka, że Lean Ci wtedy o tym powie.

Mam nadzieję, że od razu rzuca Ci się w oczy, że z termem `1 nic_nie_robie` jest coś nie tak. W
końcu `1` nie jest funkcją, a więc nie da się do niczego aplikować termu `1`. To, że aplikacja
`nic_nie_robie 1` ma typ `Nat` też jest już dla Ciebie mam nadzieję oczywiste. W końcu
`nic_nie_robie` jest funkcją, która z dowolnej liczby naturalnej robi jakąś liczbę
naturalną. Podobnie *1 + 2* jest jednocześnie 1. złożonym wyrażeniem, 2. aplikacją dodawania do
dwóch argumentów, jak również 2. liczbą naturalną, bo to wyrażenie *oznacza liczbę naturalną*;
wszędzie, gdzie może się pojawić *dowolna* liczba naturalna, *1 + 2* również może się pojawić.

Funkcja, którą zdefiniowaliśmy, to *identyczność*, inaczej funkcja identycznościowa. Ta funkcja może
się wydawać zbędna, ale tak jak liczba zero (na przykład w kontekście dodawania), czasami okazuje
się niezbędna. Na przykład wtedy, gdy funkcja identycznościowa okazuje się jedynym *rozwiązaniem
problemu*.

**Potencjalnie dezorientująca dygresja**: Wiele problemów w matematyce można wyrazić jako zbiór
relacji między jakimiś funkcjami, z których co najmniej jedna funkcja jest nieznana i trzeba ją
znaleźć. Dokładnie tak, jak problem dotyczący liczb może polegać na tym, że mamy na przykład jakiś
układ równań z jedną lub wieloma niewiadomymi reprezentowanymi przez zmienne i chcemy znaleźć
wszystkie wartości liczbowe tych zmiennych spełniające te równania. Okazuje się wtedy czasem, że
przynajmniej jedna niewiadoma może przyjąć wartość zero i między innymi wtedy zero bardzo się
przydaje. Gdy problem polega na szukaniu funkcji spełniających pewne wymagania, może się okazać, że
jednym z rozwiązań jest funkcja, która nic nie robi. Między innymi dlatego takie funkcje są w
pewnych kontekstach niezbędne.

## Potęga typów zależnych

Nasza funkcja identycznościowa jest ograniczona w tym znaczeniu, że dotyczy tylko liczb naturalnych,
a przecież pojęcie *uniwersalnej* funkcji identycznościowej, która zwraca bez zmian termy *dowolnego
typu*, wydaje się całkiem sensowne. Żeby uzyskać ogólniejszą funkcję identycznościową napiszemy tak:

```lean
def identycznosc (typ : Type) (a : typ) : typ := a
```

Ta funkcja ma *dwa* parametry, a nie jeden, bo chociaż jest (bardziej) uniwersalną identycznością,
to nadal "musi wiedzieć, o co chodzi". Dlatego wymaga najpierw podania typu parametru, wartość
którego to parametru ma potem zwrócić bez zmian. Żeby zastosować tą funkcję do liczby naturalnej
`1`, musimy ją najpierw poinformować, że dostanie term o typie liczba naturalna. Jako pierwszy
argument aplikacji musimy zatem podać typ `Nat`. Gdy po skopiowaniu również poniższego kodu
umieścisz kursor nad słowem `#eval`, to zobaczysz, że gdy ta funkcja jest poinformowana o typie
termu, który dostanie jako swój *drugi* argument, zwraca ten argument:

```lean
#eval identycznosc Nat 1 -- `1`
```

Żeby zilustrować ogólność tej funkcji zastosujemy ją jeszcze do (pewnego
termu)[https://pl.wikipedia.org/wiki/42_(liczba)] typu `String`:

```lean
#eval identycznosc String "czterdzieści dwa"
```

Ponieważ będę teraz objaśniał **najtrudniejsze pojęcie w tym rozdziale**, przypominam: Jeżeli
będziesz czuła, że trudno Ci to zrozumieć, albo będą Cię dręczyć jakieś niejasne wątpliwości czy
brak poczucia sensu, być może najlepszą strategią będzie albo czytać dalej, albo wrócić po przerwie
do poprzednich fragmentów i przede wszystkim *poczekać*, aż wszystko będzie się [powoli stawało
coraz bardziej
jasne](https://people.math.harvard.edu/~knill/teaching/math22b2019/handouts/lecture15.pdf). I przede
wszystkim unikaj proszę *frustracji*, bo frustracja i wytrwałość raczej nie idą w parze, a chodzi tu
przede wszystkim właśnie o czas.

<hr>

**O analogii między wielokrotnym czytaniem o matematyce i słuchaniem muzyki**: Rozumienie matematyki
to naprawdę w niemałym stopniu kwestia *przyzwyczajenia*, a przede wszystkim *pamięci*. Jeśli zdarzy
Ci się czytać te same fragmenty ponownie, spróbuj proszę czytać je celowo *niespiesznie*. Polecam
szczególnie spróbować to zrobić z jakąś dobrze napisaną książką. Czytanie powoli fragmentów, *które
już się całkiem nieźle zrozumiało*, to dosyć szczególne doświadczenie, podobne moim zdaniem do
wielokrotnego słuchania tego samego utworu muzycznego. W przypadku muzyki *popularnej* takie
wielokrotne słuchanie może być i często jest przyjemne, ale ponieważ muzyka popularna ma prostą
strukturę, zwykle niewiele się wtedy zmienia. Z muzyką tak zwaną "poważną" albo "ambitną" jest
inaczej. Ponieważ struktura tego rodzaju muzyki jest bardziej złożona niż struktura muzyki
popularnej, utwory często początkowo brzmią jak takie bezduszne, płaskie, nudne "plumkanie" i
dopiero po wielokrotnym kontakcie z tego rodzaju utworem, kiedy jego przebieg zdąży się już lepiej
utrwalić w pamięci, zaczyna się coraz silniej odczuwać "muzyczną treść".

Jeżeli lubisz muzykę, a zakładam, że tak, to pewnie zdążyłaś już zauważyć, że te utwory, które od
razu wpadają w ucho, często równie szybko stają się nudne, a te utwory, które zaczynamy lubić
dopiero po pewnym czasie, zwykle podobają nam się znacznie dłużej i bardziej je sobie cenimy. To, że
muzyka "poważna", podobnie jak matematyka, jest często *początkowo* nieprzystępna, to cena, jaką
płacimy za złożoność; zyskujemy za to głębszą i bardziej trwałą satysfakcję. Jeżeli chcesz się
przekonać, jak to może działać w przypadku muzyki, możesz na przykład spróbować posłuchać
niezobowiązująco (to znaczy, nie starając się usłyszeć o co chodzi, tylko zdając się na działanie
czasu i pamięci), powiedzmy jeden raz każdego dnia przez nie więcej niż dwa tygodnie, na przykład
[tego](https://music.youtube.com/playlist?list=OLAK5uy_n9W5GrHqSOorLnpUmah4lZCLoX2DT0Suw),
początkowo dosyć dezorientującego i raczej niezbyt porywającego utworu. Niewykluczone, że po kilku
dniach przyda się wtedy nieco dłuższa przerwa, żeby efekt zmęczenia słuchaniem tego samego utworu
ustąpił. Może przytrafi Ci się wtedy w pewnym momencie wgląd, dzięki któremu stanie się oczywiste,
dlaczego cykl, którego ten utwór jest częścią, Schoenberg nazwał
[suitą](https://pl.wikipedia.org/wiki/Suita). A gdy to nastąpi, słuchanie tego utworu stanie się
moim zdaniem doświadczeniem podobnym do niespiesznego czytania po raz kolejny dobrze napisanego
tekstu dotyczącego złożonych zagadnień technicznych, który zdążyło się już nieźle zrozumieć.

Postanowiłem napisać o tym, bo jadąc niedawno autobusem, bez specjalnego powodu rzuciłem okiem na
pierwsze rozdziały znakomitej książki *Topoi: The Categorical Analysis of Logic* [Roberta
Goldblatta](https://en.wikipedia.org/wiki/Robert_Goldblatt), dostępnej na przykład
[tutaj](https://projecteuclid.org/ebooks/books-by-independent-authors/Topoi-The-Categorial-Analysis-of-Logic/toc/bia/1403013939),
którą czytałem dość dawno temu, a do której jakiś czas temu wróciłem, żeby na nowo zrobić trochę
notatek i pewne rzeczy zacząć po raz kolejny powtarzać. Ponieważ znałem te rozdziały już dość dobrze
i tematyka nie była mi obca, mogłem czytać zupełnie inaczej, niż gdybym nie był w ten sposób
przygotowany. Pierwszą rzeczą, na którą zwróciłem uwagę, był *styl*. 

Dzięki temu, że nie musiałem się starać żeby nadążyć za *treścią*, mogłem wreszcie docenić tą moim
zdaniem znakomitą *prozę* i doświadczyć nowego rodzaju przyjemności. Zacząłem też mieć wrażenie, że
niemal słyszę *ton* autora i wreszcie "łapię", kiedy na przykład Golblatt w pewien sposób buduje
napięcie przed ujawnieniem jakiejś pojęciowej czy technicznej niespodzianki. Ale być może
najcenniejszym skutkiem takiego ponownego czytania trudnego tekstu, który się już w miarę dobrze
poznało, jest łatwość myślenia o poruszanych tematach jakby z lotu ptaka, ponieważ wie się wtedy
mniej więcej jaką rolę czytany właśnie fragment odgrywa w ramach większej całości. Podobnie, kolejne
fragmenty złożonego, a przez to wymagającego wstępnego oswojenia się (a może raczej "opamiętania"?)
utworu muzycznego, który już się dobrze poznało, nabierają siły emocjonalnego wyrazu właśnie dzięki
temu, że czuje się, "skąd" te fragmenty "się wzięły" i "dokąd zmierzają".

<hr>

Wracając do Leana, nowa wersja funkcji identycznościowej *działa dla dowolnego typu* dzięki temu, że
*typ* drugiego parametru i zarazem jej *rezultatu* jest jej (pierwszym) *parametrem*. To przykład
*typu zależnego*, ponieważ **typ** *rezultatu* **zależy** *od wartości paremetru*. Język, którego
używamy pisząc w Leanie (albo innych podobnych asystentach dowodzenia) swoją ekspresyjność
zawdzięcza przede wszystkim obecności takich typów.

Jeszcze raz: *Typ* drugiego parametru jest tutaj *wartością* (albo *zależy od*) pierwszego
*parametru*.

**Parametry i argumenty**: *Parametr* jest częścią definicji funkcji, a więc własnością samej
funkcji, natomiast *argument* (*funkcji*, albo lepiej *aplikacji* {funkcji}) to term, do którego ta
funkcja jest (w danym kontekście) aplikowana (ilustracja):

```lean
-- `n` jest tutaj *parametrem*. Nie kopiuj tego kodu, jeżeli wprowadziłaś już definicję tej funkcji.
def nic_nie_robie (n : Nat) : Nat := 
    -- To jest *ciało* tej funkcji, tylko zapisane w następnej linijce. Mamy tu *zmienną* `n`,
    -- będącą jednocześnie *parametrem* tej funkcji:
    n

-- Tutaj `1` jest *argumentem* (aplikacji funkcji `nic_nie_robie`). To jest *tylko* aplikacja, bo
-- sprawdzając typ nie wymuszamy ewaluacji. Wszystkie obliczenia, które muszą zajść, żeby *ustalić
-- typ* takiej aplikacji, rozgrywają się tylko *po stronie typu*:
#check nic_nie_robie 1

-- Gdy wymuszamy *ewaluację*, otrzymujemy *rezultat* tej aplikacji, czyli najprostszą postać termu,
-- (tak zwaną postać normalną), do której to wyrażenie da się zredukować:
#eval nic_nie_robie 1 -- 1
```

## Obliczenia w dwóch wymiarach

Zarówno funkcja `identycznosc`, jak i jej głupsza siostra `nic_nie_robie`, pozwalają zaobserwować,
że w Leanie zachodzą *dwa* rodzaje obliczeń: Funkcja `nic_nie_robie` ma typ `Nat → Nat`. Gdy tylko
*aplikujemy* ją do termu `1`, żadne obliczenie "wewnątrz" czy za pomocą tej funkcji jeszcze nie
zachodzi, bo takie obliczenie wymaga *ewaluacji*. W ramach samej aplikacji `nic_nie_robie 1`
zachodzi jednak *przekształcenie typu* z `Nat → Nat` do `Nat`, co też jest pewnego rodzaju
obliczeniem:

```lean
#check @nic_nie_robie  -- `nic_nie_robie : Nat → Nat`

-- Przed chwilą było `Nat → Nat`, a na skutek (zapisanej przez nas) aplikacji pojawia się już tylko
-- samo `Nat`. To też można traktować jako pewnego rodzaju obliczenie (które nie miałoby bez naszego
-- udziału miejsca).
#check nic_nie_robie 1 -- `nic_nie_robie 1 : Nat`
```

Na skutek wystąpienia aplikacji to, co jest przed strzałką w występującym po stronie typu wyrażeniu
`Nat → Nat`, jest oderwane i zostaje tylko to, co jest po strzałce, czyli w tym wypadku sam typ
`Nat`. To jest zrozumiała zmiana, bo zastosowanie funkcji zwracającej liczbę naturalną jest jakimś
sposobem zapisania liczby naturalnej, tak samo jak *1 + 2* jest jakimś sposobem zapisania liczby
naturalnej. Wszędzie, gdzie możemy podstawić pod zmienną jakąś liczbę naturalną, możemy podstawić
też całe wyrażenie *1 + 2*. Widzimy więc konieczność zajścia w ramach samej aplikacji (czy może
raczej w ramach samego skonstruowania albo zapisania aplikacji) pewnego rodzaju obliczenia (inaczej
przekształcenia) na poziomie typu (albo "w wymiarze typów").

W przypadku aplikacji funkcji `identycznosc` tego rodzaju obliczenie jest bardziej złożone, bo ta
funkcja ma typ zależny, ale jest nadal (nawet jeśli dopiero po pewnym czasie) zrozumiałe:

```lean
#check @identycznosc       -- `identycznosc : (typ : Type) → typ → typ`

#check @identycznosc Nat 1 -- `@identycznosc Nat 1 : Nat`
```

To obliczenie jest bardziej złożone, bo poza samym *oderwaniem* typów odpowiadających dwóm podanym
argumentom następuje również *podstawianie na poziomie typu*. Warto chociaż raz rozpisać ten proces
na kroki: 

Skoro argument `Nat` stał się *wartością parametru* `typ`, a słowo `typ` występuje później w
*specyfikacji typu* stałej `identycznosc` w roli *zmiennej*, to następny argument i rezultat
aplikacji też muszą mieć ten typ:

```lean
#check @identycznosc Nat   -- `identycznosc Nat : Nat → Nat`
```

To jest zatem typ (częściowej) aplikacji do samego argumentu `Nat`. Jak już wiesz (i widzisz, bo nie
pojawia się tu błąd), ten term jest poprawny (inaczej *typowalny*), ponieważ Lean pozwala na
częściowe aplikacje. A czym jest sama częściowa aplikacja `identycznosc Nat`? To przecież
("ostatecznie", czyli po zredukowaniu tej aplikacji) ta sama funkcja co `nic_nie_robie`, czyli
identyczność działająca (tylko) na liczbach naturalnych.

*Sam typ* funkcji `identycznosc` (nie funkcji {będącej rezultatem aplikacji} `identycznosc Nat`), to
jest `(typ : Type) (a : typ) : typ`, a właściwie `(typ : Type) → (a : typ) → typ`, jest więc *czymś
w rodzaju funkcji* (jeszcze raz: sam typ jest tutaj czymś w rodzaju funkcji), której parametr nosi
nazwę `typ`. To *nie* jest funkcja, bo *typu* nie możemy do niczego aplikować, ale *na etapie
aplikacji* do termu `Nat` ten typ "działa" tak, jakby był funkcją i jakby ta funkcja była aplikowana
do argumentu `Nat`. Nie przejmuj się, jeżeli mimo moich zapewnień, że to naturalny proces, wydaje Ci
się to zbyt trudne; z czasem się do tego przyzwyczaisz, a nawet pewnie zapomnisz, czemu początkowo
to Ci się zdawało trudne.

Do pewnego momentu będę mówił o funkcjach rozumianych tylko jako efektywne procedury obliczeniowe,
albo po prostu programy, procedury, albo algorytmy (czyli jakby "abstrakcyjne mechanizmy" albo
"maszyny"). Potem zacznę mówić też o *implikacji*. Mam powody, żeby zacząć od funkcji, a potem mówić
o implikacjach, ale trudno mi te powody dobrze wyjaśnić już teraz, bo nie mogę zakładać, że wiesz o
pewnych sprawach, bez znajomości których moje wyjaśnienia byłyby pewnie niezrozumiałe,
nieprzekonujące, a może nawet mogłyby budzić niepokój (cel jest ambitny, ale bez obaw, dotrzemy do
niego bez pośpiechu i zarazem *relatywnie* szybko i bezboleśnie).

Na razie powiem tylko tyle: Istnieje sposób, żeby jednocześnie uczyć się współczesnych podstaw
matematyki, programowania, formalizowania treści wyrażonych w języku naturalnym, konstruowania
dowodów matematycznych, jednocześnie elastycznego i konwekwentnego abstrakcyjnego myślenia, a
później - dzięki tym wszystkim prerekwizytom w niemal porywającym tempie - matematycznych podstaw
współczesnej metodologii badań (wnioskowania statystycznego, testowania hipotez, wnioskowania
przyczynowego, teorii pomiaru), a wszystko to w interakcji z programem, który w tym pomaga, takim
jak Lean. Postaram się, żeby ta nauka była dla Ciebie możliwie łatwa, przyjemna i pożyteczna, a
gdyby w którymś momencie mi się to nie udało, będę wdzięczny, jeśli mi o tym powiesz, bo bez tego
rodzaju informacji będzie mi trudno zrobić to lepiej.

Żeby skorzystać z tego sposobu na matematykę i metodologię badań, a do pewnego stopnia również na
całą psychologię, trzeba się *powoli przyzwyczajać* do *nowych sposobów myślenia*, do których służą
rozmaite *sztuczne języki* (języki formalne). Jeden z tych nowych sposobów myślenia, do którego
między innymi znakomicie nadaje się formalny język teorii typów, polega na patrzeniu na funkcje,
programy, a niebawem również na implikacje, jako na jedno i to samo.

## Funkcje

**Polecenie**: Popatrz na ten fragment kodu, spróbuj go odczytać i przepisz z pamięci. Jeżeli na tym
etapie przepisanie z pamięci jest zbyt trudne, to albo go po prostu skopiuj, albo spróbuj kiedy
indziej, gdy poczujesz, że jesteś gotowa znowu spróbować:

```lean
def suma (n : Nat) (m : Nat) : Nat := n + m
```

**Czytamy to**: Definiuję (`def`) wartość/znaczenie/treść stałej suma (`suma`) o typie funkcja dwóch
parametrów typu liczba naturalna (`(n : Nat) (m : Nat)`), której rezultat też jest typu `Nat` (`:
Nat`), czyli też jest liczbą naturalną. A więc wszystko między definiowanym symbolem (tutaj symbolem
`suma`) a symbolem definiowania `:=` jest określeniem *typu*, a nie treści (oficjalnie: *ciała*)
definicji.

**Czytamy dalej**: Ten term konstruuję/definiuję (`:=`) jako zastosowanie funkcji dodawania, bo to
też jest pewna funkcja, do pierwszego i drugiego parametru, które to parametry nazwałam `n` i `m`,
bo tak mi się podobało, a poza tym zauważyłam, że inni matematycy często stosują tą konwencję gdy
piszą o liczbach naturalnych.

**Nazwy parametrów funkcji nie mają znaczenia** w tym sensie, że na przykład taka oto ...

```lean
-- ... alternatywna definicja (z apostrofem w nazwie, żeby uniknąć konfliktu definicji) ...
def suma' (a : Nat) (b : Nat) : Nat := a + b
```

... jest ewidentnie *tą samą*, tylko *inaczej zapisaną funkcją*. Jak się przekonasz w jednym z
późniejszych rozdziałów, możemy nawet w prosty sposób formalnie udowodnić w Leanie, że to jest ta
sama funkcja. Ta funkcja jest też inaczej nazwana, bo w Leanie nie możemy ponownie definiować tych
samych symboli.

**Ostateczność definicji**: Gdy raz zdefiniujemy jakiś symbol, tutaj symbole `suma` i `suma'`, nie
możemy już więcej (w tej samej [*przestrzeni
nazw*](https://pl.wikipedia.org/wiki/Przestrze%C5%84_nazw), ale o tym później) zmienić jego
definicji, chyba że najpierw usuniemy poprzednią definicję. Dlatego właśnie symbole, które zostały
w jakiś sposób zdefiniowane, nazywamy *stałymi*.

**Za to zmienne są ...zmienne**: Nazwy *parametrów* (na przykład funkcji) nie są stałymi, tylko
*zmiennymi*, bo możemy im *wielokrotnie* przypisywać, inaczej pod nie *podstawiać*, dowolne
*argumenty* typu wymaganego przez definicję na przykład danej funkcji. I tak, możemy zastosować
funkcję `suma` do termów `3` i `5` i wtedy te termy "wskoczą" na miejsce pierwszego i drugiego
parametru. Możemy potem zastosować tą samą funkcję jeszcze raz, ale do innych termów i wtedy (i w
tym miejscu) te inne termy wskoczą w miejsce *tych samych* parametrów. Parametry funkcji są więc
zmiennymi, bo te same parametry tej samej funkcji mogą się w pewnym sensie zmieniać, to jest
"przyjmować" różne wartości w różnych "sytuacjach".

**Polecenie**: Sprawdź typ aplikacji funkcji `suma` do dwóch liczb naturalnych, wszystko jedno
jakich, a następnie ewaluuj tą aplikację. Upewnij się, czy rozumiesz komunikaty pojawiające się w
panelu po prawej.

Żeby utrwalić sobie to, co do tej pory wyjaśniłem, rozważ proszę jeszcze taką oto funkcję:

```lean
def dodaj2 (a : Nat) : Nat := a + 2
```

**Polecenie**: Spróbuj odczytać samodzielnie sens tej defincji opierając się na fragmencie, w którym
objaśniłem, jak się czyta takie definicje. Może nawet zrób to na głos? Dzięki temu nie tylko
upewnisz się, czy właściwy sposób czytania jest dla Ciebie jasny, ale również zwiększysz łatwość, z
jaką będziesz przetwarzać strukturę takich definicji w przyszłości.

Myślę, że teraz już od razu widzisz, jak ta funkcja działa, nawet jeśli jeszcze niedawno nie
wiedziałaś, że język Lean istnieje. Myślę też, że jest już dla Ciebie oczywiste, że nazwa parametru
(tutaj `a`) nie ma znaczenia dla "sensu" (ani tożsamości) tej funkcji; ta nazwa służy *tylko* do
tego, żeby można było wewnątrz ciała funkcji (całe ciało funkcji `dodaj2` to `a + 2`) "mówić" o
ewentualnym argumencie. Podsumowując:

*Nazwy parametrów pełnią rolę zaimków, a nazwy stałych pełnią rolę nazw własnych*.

**Polecenie**: Spróbuj przepisać definicję stałej `dodaj2` z pamięci, żeby struktura takich
definicji zaczęła Ci się lepiej utrwalać i żebyś mogła ją szybciej mentalnie przetwarzać. Jeżeli Ci
się to nie uda, popatrz znowu na tą definicję, przełącz się na okno, w którym działa serwer Leana
tak, żeby nie było jej widać i spróbuj ponownie. I tak do skutku. To Ci prawdopodobnie pomoże w
przyswajaniu dalszych treści. Gdy już Ci się uda, sprawdź typ stałej `dodaj2`, raz poprzedzając ją
symbolem `@`, a raz nie. Sprawdź też proszę typ aplikacji tej stałej do wybranej liczby
naturalnej. A na koniec ewaluuj tą aplikację. Za każdym razem popatrz na rezultat w panelu po
prawej, upewniając się w ten sposób, czy wszystko się zgadza.

**Ewaluacja aplikacji krok po kroku**: Mówiąc w pewnym uproszczeniu, gdy umieścisz kursor nad
komendą `#eval` w instrukcji `#eval dodaj2 2`, wtedy Lean:

1. Ewaluuje, czyli redukuje do najprostszej postaci, argument tej aplikacji. Tutaj jest tylko jeden
argument,`2`, który może być zredukowany, a właściwie zastąpiony przez coś innego za pomocą nieco
innego procesu, ale o tym, co "kryje się pod" liczbą `2` powiem za chwilę, a o tym innym procesie
powiem więcej znacznie później.

2. Podstawia rezultat tej redukcji pod zmienną `a` w ciele funkcji, bo `a` jest (tutaj jedynym)
parametrem funkcji `dodaj2`. W ten sposób powstaje `2 + 2` (posługując się dalej znaną Ci notacją
cyfrową).

3. Wreszcie ewaluuje uzyskaną w ten sposób wersję ciała funkcji, co może wymagać dalszych ewaluacji,
aż nie będzie się dało niczego zredukować do prostszej postaci.

Wydaje mi się, że mniej więcej czegoś takiego się spodziewałaś, może pomijając to, jak są
zdefiniowane liczby naturalne, a także dodawanie liczb naturalnych, o którym jeszcze nie mówiłem, a
które ma w Leanie, podobnie jak same liczby naturalne, piękną definicję rekurencyjną. Jeżeli chcesz
się dowiedzieć czegoś więcej o definicji liczb naturalnych jaką stosuje Lean, możesz samodzielnie
poszukać informacji na temat aksjomatów Peano (to jest *Pean o*, tylko pisane razem). Ja wyjaśnię
teraz tylko tyle:

<hr>

**Implementacja liczb naturalnych w Leanie**: Liczba `0` jest przez Leana interpretowana jako
nieredukowalna stała `Nat.zero`. Podkreślam, że `Nat.zero` to w Leanie *tylko pewien napis*, nic
więcej. Zwykle zapisujemy tą liczbę jako `0`, ale zapis cyfrowy istnieje tylko dla naszej
wygody. Liczba naturalna `1` odpowiada *samej aplikacji* funkcji następnika `Nat.succ` do stałej
`Nat.zero`, to jest `Nat.succ Nat.zero`. **Czytamy to**: *Następna* (stąd "następnik") *liczba
naturalna po liczbie zero*. Ta aplikacja jest również *nieredukowalna*, co znaczy, że gdy pojawi się
w trakcie ewaluacji jako rezultat, ewaluacja na niej się zakończy. Innymi słowy, ta aplikacja
istnieje tylko po to, żeby można było ją *zapisać*, podać jako argument, albo zwrócić jako rezultat,
bo *sama aplikacja* `Nat.succ Nat.zero` (a nie jakaś jej wartość, której po prostu nie ma) *jest dla
Leana liczbą `1`*.

Zastanawiasz się może, o co w tym chodzi? Spróbuję to wyjaśnić tak: Gdyby przedstawiciele jakiejś
innej cywilizacji wymyślili "obiekty abstrakcyjne", których *używaliby* dokładnie tak, jak my
używamy liczb naturalnych, ale zapisywaliby i nazywali je inaczej, powiedzielibyśmy, że to są te
same "obiekty abstrakcyjne", albo, że mają "ten sam sens", tylko są inaczej nazywane, prawda?
Jesteśmy co prawda przyzwyczajeni do zapisu za pomocą cyfr arabskich, ale sposób, w jaki coś
zapisujemy, nie decyduje o *znaczeniu*, o tym decyduje sposób *użycia*.

Niredukowalna stała `Nat.zero` i nieredukowalne aplikacje takie jak `Nat.succ Nat.zero` całkiem
dosłownie *są* więc liczbami naturalnymi, tak samo jak `0` i `1` *są* liczbami naturalnymi. Wbrew
pozorom ten fakt nie ma *nic* wspólnego z zapisem; możemy tak powiedzieć, ponieważ wszystkie
*operacje*, jakie możemy *wykonywać* na liczbach naturalnych, możemy *wykonywać* na tych
wyrażeniach, uzyskując przy tym wyniki zgodne z interpretacją: `0` to (to samo co) `Nat.zero`, `1`
to `Nat.succ Nat.zero`, `2` to `Nat.suc (Nat.succ Nat.zero)`, i tak dalej. Zapis nie ma tu
znaczenia, poza tym, że może być mniej lub bardziej *wygodny* do pewnych zastosowań.

Już ostatni raz: Sam *nieredukowalny fragment kodu* albo *zapis* `Nat.succ Nat.zero` *jest* liczbą
`1`. Nie wiem, czy to Cię zaskakuje, ale sądzę, że może zaskakiwać. Kiedy się o tym uczyłem, na
początku spodziewałem się, że coś, co wygląda jak aplikacja, będzie redukowalne do jakiegoś wyniku
(tej aplikacji) i że w tym sensie coś takiego będzie "kryło pod sobą" jakąś "prawdziwą" funkcję i
jakąś "prawdziwą" liczbę jako argument, i że tych "prawdziwych rzeczy" będzie można użyć, żeby coś
obliczyć. Wydaje się przecież, że skoro `Nat.succ Nat.zero` zarazem *jest aplikają* i coś *znaczy*,
to powinno być "coś pod spodem" `Nat.succ Nat.zero`, i tym czymś powinna być albo para złożona z
funkcji i liczby, albo jakaś liczba *1* "jako taka", czy może "sama w sobie".

To, że *nic* pod spodem nie ma, to dobra wiadomość, bo oznacza, że *nie ma tu żadnych tajemnic*
(poza tymi, które kryją się w *nas*, użytkownikach tych wyrażeń), są tylko rozmaite *ciągi symboli i
dopuszczalne sposoby ich przekształcania*. To taka rozległa pustka, a w niej nic świętego[^3]. Można
powiedzieć, że tym właśnie jest *matematyka formalna*, niczym więcej, gdy tylko pominiemy jej
*interpretację*, którą zresztą możemy zmieniać na dowolną inną, byle spójną. Te uwagi dotyczą jednak
tylko *matematyki zastanej*, ponieważ, jak
[wiemy](https://pl.wikipedia.org/wiki/Problem_nierozstrzygalny), *tworzenie* nowej matematyki, w tym
*poszukiwanie* dowodów, ma z konieczności charakter *niealgorytmizowalny*.

<hr>

**Zasięg nazw**: Gdybyś teraz w kolejnej linii wkleiła do Leana kod `#eval n`, to zobaczyłabyś
komuikat o błędzie, ponieważ `n` i `m` to w tym momencie *tylko* parametry funkcji `suma`, które są
*widoczne tylko z wnętrza ciała* funkcji `suma` (które to ciało składa się akurat tylko z wyrażenia
`n + m`).

**Polecenie**: Napisz w nowej linii `#eval n`. Zobaczysz wtedy, że symbol `n` będzie podkreślony
czerwoną falką. Usuń ten błędny kod. W ten sposób Lean sygnalizuje, że nie wie, o czym mówisz, a nie
wie, bo symbol `n` jest widoczny tylko wewnątrz ciała funkcji `suma`. Tak właśnie, między innymi,
działa [*zasięg nazw*](https://pl.wikipedia.org/wiki/Zasi%C4%99g_(programowanie)).

**Metafora funkcji jako maszyny albo mechanizmu**: Możesz sobie wyobrazić, że ciało funkcji to
pewien mechanizm albo mały robot, który ma nad sobą otwory, przez które może dostawać różne obiekty
(będące argumentami aplikacji funkcji). Te obiekty są dla niego zawsze *opakowane*, to jest bliżej
nieokreślone/jakieś, a więc nie wie, jak dokładnie wyglądają, wie tylko, że to są obiekty, które
wpadły przez taki albo inny otwór, a więc muszą mieć kształt (typ) zgodny z kształtem (typem)
otworu, przez który wpadły. 

Jeżeli to jest robot pracujący wewnątrz funkcji `suma`, to gdy dostanie dwie liczby, dla niego to
będą tylko dwa opakowane obiekty, o których będzie wiedział tyle, że mają typ `Nat` i będzie też
wiedział, który jest pierwszy albo lewy, a który drugi albo prawy, bo na opakowaniach będzie widział
nazwy `n` i `m`. Nie będzie nawet wiedział, czy dwa różnie oznaczone obiekty tego samego typu są
*różne* (i tutaj metafora opakowań nam się trochę sypie). W przypadku funkcji `suma`, wszystko, co
ten robot robi (ech) to aplikacja funkcji `+` do tych dwóch obiektów.

Albo, nieco bardziej abstrakcyjnie, możemy myśleć o funkcji takiej jak `suma` jako o "pudełku",
które ma dwa wejścia, jedno oznaczone literą `n`, a drugie literą `m`, i które ma jedno wyjście, a w
środku ma "mechanizm dodający" obiekty pojawiające się na wejściach. Jeżeli wyobrazimy sobie, że ten
wewnętrzny mechanizm jest "przyklejony" do wejść, to stanie się jasne, że *nazwy* wejść nie mają
znaczenia i istnieją tylko dla wygody użytkownika (czyli naszej).

Za to *typy* wejść i *typ* wyjścia (funkcje mają zawsze tylko jedno wyjście, a w Leanie tak naprawdę
również tylko jedno wejście) *mają* znaczenie. Można sobie wyobrazić, że typy wejść i typ wyjścia to
kształty otworów funkcji jako pudełka. Nie możemy podawać na wejściu funkcji `suma` czegokolwiek -
to muszą być wyrażenia typu liczba (tutaj akurat wymagamy liczb naturalnych) i tak też mówi nasza
definicja. Można więc powiedzieć, że funkcje w teorii typów są zawsze *wyspecjalizowane*. Jeżeli
podamy na wejściu dwa wyrażenia typu liczba naturalna, to gdy tylko wymusimy ewaluację, na wyjściu
pojawi się liczba naturalna i samo to ograniczenie jest pewnego rodzaju specjalizacją.

Metafora funkcji jako mechanizmu w pudełku ma jeszcze inne ograniczenia. Jak już wiesz, wyliczenie
rezultatu aplikacji funkcji polega tak naprawdę na ewaluacji argumentów, następnie na podstawieniu
ich zredukowanych postaci pod odpowiednie zmienne w ciele funkcji i na ewaluacji (czyli redukcji)
ciała funkcji, aż do (nieredukowalnego) skutku. Można więc powiedzieć, że mechanizm obliczający
działa w Leanie *na zewnątrz* definicji funkcji. To zatem taki "uniwersalny ewaluator", albo
"uniwersalny reduktor", który używa definicji stałych, które napotyka, rozpakowuje je i redukuje
napotkane aplikacje, traktując aplikacje i definicje funkcji jak przepisy mówiące, co ma robić.

A oto bardziej skomplikowany przykład ewaluacji aplikacji. Myślę, że domyślasz się już trochę,
dlaczego ten (wiem, że dziwny) fragment kodu jest poprawny i jak działa:

```lean
#eval suma (Nat.succ (Nat.succ 3)) (6 - (2 + Nat.zero))
```

Prześledzimy po kolei, co się tutaj dzieje, dla uproszczenia stosując czasem wygodny zapis cyfrowy
(ilustracja):

```lean
#eval suma (Nat.succ (Nat.succ 3)) (6 - (2 + Nat.zero))

suma (Nat.succ 4) (6 - 2)

suma 5 4

-- Ponieważ argumenty są w postaci normalnej (tutaj właściwie udajemy, że są), w tym momencie
-- następuje rozpakowanie definicji stałej `suma`:
n + m

-- A ponieważ `5` ma być podstawione za zmienną `n` (pierwszy parametr) a `4` za zmienną `m` (drugi
-- parametr) to uzyskujemy taką wersję ciała:
5 + 4

-- W ten sam sposób przebiega ewaluacja aplikacji funkcji `+` do liczb `5` i `4`. Ewaluacja trwa do
-- momentu, gdy nic więcej nie będzie się dało zredukować do prostszej postaci.
```

Ewaluacja całego tego wyrażenia zaczyna się od ewaluacji najbardziej wewnętrznych albo
zagnieżdżonych części argumentów: `(Nat.succ 3)` i `(2 + Nat.zero)`. Rezultatami tych ewaluacji są,
stosując zapis cyfrowy, liczby `4` (`1 + 3`) i `2` (`2 + 0`). To jednak nie koniec ewaluacji
argumentów, bo `(Nat.succ 3)` i `(2 + Nat.zero)` są tu argumentami pewnych aplikacji (funkcji
`Nat.succ` i funkcji `-`). Przypominam, że w tym kontekście `+` i `-` też oznaczają pewne
(dwuargumentowe) funkcje, tylko zapisane w *notacji infiksowej* (inaczej wzrostkowej) ...

`argument1 funkcja argument2`, na przykład `1 + 2`

... zamiast w *notacji prefiksowej* (inaczej przedrostkowej) ...

`funkcja argument1 argument2`, na przykład `suma 1 2`

... bo tak się zwykle zapisuje dodawanie i odejmowanie. Można i czasem warto nauczyć Leana, żeby
rozumiał taki zapis dla samodzielnie zdefiniowanych funkcji, takich jak na przykład `suma`, ale
zrobimy to kiedy indziej.

**Nawiasy w aplikacjach wieloargumentowych**: Jesteś w stanie domyślić się, na czym polega,
wynikający z niejednoznaczności zapisu, błąd w tym fragmencie kodu?

```lean
#eval suma Nat.succ 2 3
```

Funkcja `suma` wymaga argumentów typu `Nat`. Pierwszy argument aplikacji jest tutaj jednak *funkcją*
`Nat.succ`, a nie liczbą naturalną. Żeby ten kod był poprawny, trzeba otoczyć fragment `Nat.succ 2`
nawiasami:

```lean
#eval suma (Nat.succ 2) 3
```

## Curry(ing)

**W Leanie nie ma funkcji "prawdziwie" dwuargumentowych**: Funkcja `suma` *wygląda* jak funkcja
dwuargumentowa i *do pewnego stopnia* tak się *zachowuje*, ale tak naprawdę *nie* jest
dwuargumentowa. Jest *funkcją jednoargumentową, która zwraca funkcję jednoargumentową*, która
dopiero dodaje jedyny parametr tej pierwszej funkcji do swojego jedynego parametru.

Taki sposób definiowania funkcji więcej niż jednoargumentowych nazywa się *curryingiem*, od nazwiska
pewnego wybitnego [matematyka](https://en.wikipedia.org/wiki/Haskell_Curry), który pojawi się tu
jeszcze w znacznie poważniejszej roli.

**Polecenie**: Napisz kod pozwalający sprawdzić typ aplikacji funkcji `suma` do *tylko jednego*
argumentu `10`. Jak Ci się to uda, to w prawym panelu zobaczysz komunikat:

```lean
suma 10 : Nat → Nat
```

Ten przykład może Ci się wydawać znajomy. Faktycznie, niedawno przyglądaliśmy się już tego rodzaju
częściowej aplikacji, ale wtedy używaliśmy dwuargumentowej funkcji `identycznosc`, aplikując ją
tylko do jednego termu, to jest do typu `Nat`.

**Czytamy to**: Aplikacja funkcji `suma` do termu `10` ma typ `Nat → Nat`. Typ `Nat → Nat` mówi nam,
że cała ta częściowa aplikacja (`suma 10`) jest pełnowartościową (bo poprawną, to znaczy typowalną)
funkcją, przekształcającą liczby naturalne w liczby naturalne. Jaka to jest funkcja? Znamy definicję
stałej `suma`, domyślamy się więc, że `suma 10` to wyrażenie, które jakby czeka na brakujący
argument. Term złożony `suma 10` to zatem jednocześnie częściowa aplikacja i (po zredukowaniu)
funkcja jednoargumentowa, która do dowolnej liczby naturalnej dodaje `10` (dodaje `10` "od przodu",
bo "robi" `10 + m`).

**Polecenie**: Sprawdź typ stałej `suma`, ale poprzedzonej znakiem `@`, żeby się przekonać, że
`suma` ma typ, w którym występują *dwie strzałki*, bo to tak naprawdę funkcja, która przekształca
dowolną liczbę naturalną w funkcję, która to funkcja z kolei przekształca dowolną liczbę naturalną w
liczbę naturalną.

**Sugestia**: Po przeczytaniu tego rozdziału i ewentualnym podjęciu prób wykonania niektórych lub
wszystkich poleceń warto może wrócić do rozdziału poprzedniego, w którym pisałem o podobnych
sprawach, ale w inny sposób. Wydaje mi się, że dzięki temu dosyć szybko treści omówione w tych dwóch
rozdziałach staną się dla Ciebie w miarę jasne.

### Przypisy

[^1]: *Typ funkcyjny* i *typ funkcji* to tylko dwie różne nazwy na to samo. W szczególności, typ
    funkcyjny nie jest funkcją, tylko typem (funkcji). Czasami nazwa typ funkcyjny brzmi po prostu
    lepiej, na przykład: *Funkcje to dokładnie takie termy, których typem jest jakiś typ funkcyjny*
    brzmi chyba lepiej, niż *Funkcje to dokładnie takie termy, których typem jest jakiś typ
    funkcji*.

[^2]: ... który być może pojawi się tu jeszcze w drugiej części, bo do pewnych rzeczy pasuje jak
    ulał, i którego większość książek przeczytałem jeszcze w późnej podstawówce, czego akurat nikomu
    *nie* polecam, bo zbyt wczesny kontakt z Gombrowiczem niekoniecznie sprzyja socjalizacji. Jeżeli
    więc czytają to jacyś aktualni lub przyszli rodzice, to sugeruję, żeby Gombrowicza dzieciom
    stanowczo zakazać, przynajmniej dopóki nie zaczną wychodzić na miasto. Zamiast tego niech
    czytają o teorii typów albo teorii kategorii, bo dzięki temu z pewnością szybko staną się
    [socjometrycznymi gwiazdami](https://pl.wikipedia.org/wiki/Gwiazda_socjometryczna). Nie ma za
    co.

[^3]: གང་ལ་སྟོང་པ་ཉིད་སྲིད་པ། ། དེ་ལ་དོན་རྣམས་ཐམས་ཅད་སྲིད། ། གང་ལ་སྟོང་ཉིད་མི་སྲིད་པ། ། དེ་ལ་ཅི་ཡང་མི་སྲིད་དོ། །
