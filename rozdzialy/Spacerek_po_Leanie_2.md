## O czym teraz będzie

Przypominam, że to jest alternatywna wersja *tego samego rozdziału*. Zdecydowałem się napisać dwie
wersje, ponieważ to, jak łatwe będą dla Ciebie do zrozumienia rozdziały kolejne, będzie zależało w
znacznym stopniu od tego, jak dobrze uda mi się wytłumaczyć najważniejsze kwestie omawiane właśnie
tutaj. Dlatego być może dobrze będzie jeśli przynajmniej zerkniesz do poprzedniej wersji po tym jak
przeczytasz tą.

Po tym jak objaśnię ogólną strukturę i sposób działania funkcji w Leanie, w następnych rozdziałach
pokażę Ci, że będziesz już właściwie wiedzieć, czym jest *duży kwantyfikator* (chodzi o spójnik
logiczny *∀*, który czytamy *dla każdego*) i niewiele będzie trzeba, żebyś zrozumiała, jak w logice
konstruktywnej działa *implikacja* (chodzi o symbol *→*, który czytamy *jeżeli, to*), bo ta jest w
logice konstruktywnej tylko pewnego rodzaju funkcją. Pozostałe standardowe *spójniki logiczne* (*∧*,
*∨* i *∃*), za wyjątkiem *negacji* (*¬*), można również zdefiniować za pomocą funkcji / implikacji,
a żeby z kolei zdefiniować negację, wystarczy użyć czegoś, co w pewnym sensie zachowuje się jak
funkcja.

Ponieważ *predykaty* (takie jak *jest dziwne* w zdaniu *Życie jest dziwne*) to, jak się przekonasz,
również funkcje, ucząc się w ten sposób jednocześnie - zarazem na skróty i od podstaw - matematyki i
programowania, stosunkowo szybko opanujesz podstawy *logiki predykatów*. To narzędzie pozwoli Ci
[prześlwietlać](https://www.youtube.com/watch?v=0pYyzolIN3I) logiczną strukturę nie tylko dowodów
matematycznych, ale również dowolnych innych rozumowań zapisanych w języku naturalnym. Rachunek
predykatów będziesz mogła później stosować do głównego rozumowania zawartego w swojej pracy
semestralnej, pracy magisterskiej, doktoracie albo artykule, lub do analizy - nierzadko
"dziurawych" - uzasadnień głównych wniosków w artykułach naukowych.

Często już sama tylko próba przeprowadzenia takiej formalizacji pozwoli Ci z nieosiągalną inaczej
precyzją wskazać, gdzie *dokładnie* w tych rozumowaniach znajdują się ewentualne błędy. Celowo
niedokończony i wydaje mi się, że interesujący przykład tego rodzaju zabawy znajdziesz [w jednym z
następnych rozdziałów](./Duzy_predykaty_Bog.md).

<hr>

# Pierwszy spacer po Leanie, wersja druga

Polecenia i zadania, które pojawiają się w pierwszych rozdziałach, nie wymagają instalacji Leana,
ale jeżeli dotarłaś do tego momentu, to możliwe, że brałaś już to pod uwagę. Warto go zainstalować,
na przykład w połączeniu z darmowym edytorem VS Code. Proste instrukcje, jak to zrobić, znajdziesz
[tutaj](https://lean-lang.org/lean4/doc/quickstart.html).

**Polecenie**: Jeżeli nie używasz edytora VS Code, a w pierwszych rozdziałach zakładam, że nie, to
skopiuj na początek do lewego okna taki fragment kodu:

```lean
-- Tekst zaczynający się od -- to komentarz. Komentarze są przez Leana ignorowane. Dzięki temu możemy 
-- napisać na przykład to:
--
-- Lean jest głupi
--
-- i nic się nie stanie.

-- Ta fascynująca funkcja pobiera jeden argument typu Nat, czyli liczbę naturalną, i nic z nią nie robi,
-- tylko ją zwraca (każda funkcja musi coś zwracać):
def nic_nie_robie (n : Nat) : Nat := n
```

**Czytamy to**: 

Definiuję (`def`) 

funkcję (funkcję, bo ma parametr) `nic_nie_robie`

która ma jeden parametr `n` typu `Nat` (`(n : Nat)`) 

i zwraca (tak czytamy symbol `:` pojawiający się po specyfikacji ostatniego parametru funkcji) term
typu `Nat`.

*Ciałem* tej funkcji jest (`:=`) samotna zmienna `n`. Czy nie wydaje Ci się, że składnia Leana
jest dość intuicyjna? Nawet, jeżeli tego jeszcze nie widzisz, wklej poniżej zapisanej właśnie
definicji następny fragment kodu i umieść kursor na komendzie `#eval`. Zobaczysz wtedy po prawej
rezultat *ewaluacji* aplikacji funkcji `nic_nie_robie` do termu `1`. To będzie `1`, bo funkcja
`nic_nie_robie` nic nie robi (tylko zwraca swój argument).

```lean
#eval nic_nie_robie 1
```

Teraz będziemy *sprawdzać typ termu* `nic_nie_robie`. W tym celu wklej lub przepisz z pamięci to:

```lean
#check @nic_nie_robie

#check nic_nie_robie
```

Gdy umieścisz kursor nad *pierwszym* wystąpieniem słowa `#check`, zobaczysz po prawej typ termu
`nic_nie_robie` zapisany w taki oto sposób:

`nic_nie_robie : Nat → Nat`

`Nat` to typ oznaczający liczby naturalne. Myślę, że zaczęłaś się już oswajać z tym, że w Leanie
wyrażenie o postaci `M : N`, gdzie `M` i `N` to jakieś wyrażenia, oznacza, że `M` ma typ `N`. Gdy
`M` to *zmienna*, na przykład `x`, takie wyrażenie nazywamy *deklaracją* (typu tej zmiennej), na
przykład, `x : N`, gdzie `N` to jakieś wyrażenie oznaczające typ, jest deklaracją, że `x` ma typ
`N`. A zawsze, gdy po stronie typu, czyli po prawej od symbolu `:`, widzisz strzałkę, masz do
czynienia z *typem funkcyjnym*[^1]. Na przykład `nic_nie_robie` jest termem typu funkcyjnego, czyli
funkcją, bo ma w typie strzałkę. Komunikat, który widzisz po prawej, gdy sprawdzasz typ tej stałej,
to jest komunikat:

`nic_nie_robie : Nat → Nat`

możesz więc odczytać tak:

*`nic_nie_robie` jest pewną funkcją, która z dowolnej liczby naturalnej robi jakąś liczbę
naturalną*.

Jeżeli umieścisz kursor nad drugim wystąpieniem komendy `#check`, tym, któremu nie towarzyszy symbol
`@`, to zobaczysz *tą samą informację*, tylko *przedstawioną w inny sposób* (zgodny z tym, jak
zapisałem definicję tej funkcji):

`nic_nie_robie (n : Nat) : Nat`

Wydaje mi się, że już rozumiesz, jak to odczytujemy, ale na wszelki wypadek jeszcze raz
wyjaśniam. Stąd, że obok stałej `nic_nie_robie` mamy fragment `(n : Nat)` możemy wywnioskować, że
`nic_nie_robie` jest funkcją, która wymaga jako argumentu liczby naturalnej. Nawiasem mówiąc,
nazwałem ten parametr `n`, ponieważ to pierwsza litera w słowie *naturalna*.

Gdy teraz skopiujesz do Leana jeszcze to:

```lean
#check nic_nie_robie 1
```

i umieścisz kursor nad komendą `#check`, to zobaczysz po prawej komunikat:

`nic_nie_robie 1 : Nat`

W tym komunikacie po lewej od `:` mamy teraz *dwa* termy, które razem tworzą jeden *term złożony*,
będący *aplikacją* (aplikacja jest zawsze zestawieniem wyrażenia oznaczającego jakąś funkcję i
jakiegoś innego wyrażenia), czyli w tym wypadku aplikację funkcji `nic_nie_robie` do `1`. Pierwszy z
tych termów jest funkcją, a drugi to liczba `1`. Pierwszy i jedyny parametr (`n`) funkcji
`nic_nie_robie` ma typ `Nat` i `1` również ma typ `Nat`, a zatem `1` jest termem typu, którego ta
funkcja wymaga. Dlatego aplikacja funkcji `nic_nie_robie` do termu `1` jest poprawna.

**Definicja aplikacji**: Samo *zestawienie* funkcji i jakiegoś termu nazywamy *aplikacją funkcji do
tego termu*, albo krócej *aplikacją*.

W Leanie wszystkie termy, w tym również złożone, *muszą* mieć jakiś typ. Ale uwaga, nie każdy term
*ma* typ, ponieważ można skonstruować termy *błędne*, to jest takie, których nie da się typować. Dla
Leana takie termy są po prostu bezsensowne. Jeżeli w tym momencie obawiasz się, że napiszesz jakieś
termy bezsensowne, to niepotrzebnie się tego obawiasz, bo prawie na pewno napiszesz wiele termów
bezsensownych. Im więcej piszesz, tym więcej bzdur napiszesz, jak zauważył zdaje się ten przenikliwy
obserwator ludzkiej natury Gombrowicz[^2]. To jest może zła wiadomość, chociaż nie jestem tego
pewien. Na pewno dobra wiadomość jest taka, że Lean Ci wtedy o tym powie.

Mam nadzieję, że od razu rzuca Ci się w oczy, że z termem `1 nic_nie_robie` jest coś nie tak. W
końcu `1` nie jest funkcją, a więc nie da się do niczego aplikować termu `1`. Myślę, że nie
potrzebujesz wsparcia Leana, żeby zauważyć, że to wyrażenie nie ma sensu. To, że aplikacja
`nic_nie_robie 1` ma typ `Nat` też jest już dla Ciebie mam nadzieję oczywiste. W końcu
`nic_nie_robie` jest funkcją, która z dowolnej liczby naturalnej robi jakąś liczbę
naturalną. Podobnie *1 + 2* jest jednocześnie złożonym wyrażeniem, aplikacją dodawania do dwóch
argumentów jak również pewną *liczbą naturalną*, bo to wyrażenie *oznacza* liczbę naturalną -
wszędzie, gdzie może się pojawić *dowolna* liczba naturalna, *1 + 2* również może się pojawić.

Funkcja, którą zdefiniowaliśmy, to *identyczność* albo inaczej funkcja identycznościowa. Ta funkcja
wydaje się wręcz zbędna, ale tak jak liczba zero, czasami nie możemy się bez niej obejść. Na
przykład wtedy, gdy taka funkcja okazuje się jedynym *rozwiązaniem problemu*.

**Potencjalnie dezorientująca dygresja**: Wiele problemów w matematyce można wyrazić jako zbiór
relacji między jakimiś funkcjami, z których co najmniej jedna funkcja jest nieznana i trzeba ją
znaleźć. Dokładnie tak, jak problem dotyczący liczb może polegać na tym, że mamy na przykład jakiś
układ równań z jedną lub wieloma niewiadomymi reprezentowanymi przez zmienne i chcemy znaleźć
wszystkie wartości tych zmiennych spełniające te równania. Okazuje się wtedy czasem, że przynajmniej
jedna niewiadoma może przyjąć wartość zero i między innymi wtedy zero bardzo się przydaje. Gdy
problem polega na szukaniu funkcji spełniających pewne wymagania, może się okazać, że jednym z
rozwiązań jest funkcja, która nic nie robi. Między innymi dlatego takie funkcje są niezbędne.

## Potęga typów zależnych

Nasza funkcja identycznościowa jest ograniczona w tym znaczeniu, że dotyczy tylko liczb naturalnych,
a przecież pojęcie *uniwersalnej* funkcji identycznościowej, która zwraca bez zmian termy *dowolnego
typu*, wydaje się całkiem sensowne. Żeby uzyskać taką ogólniejszą funkcję napiszemy tak:

```lean
def identycznosc (typ : Type) (a : typ) : typ := a
```

Ta funkcja ma *dwa* parametry, a nie jeden, bo chociaż jest uniwersalną identycznością, to nadal
"musi wiedzieć, o co chodzi". Dlatego wymaga najpierw podania typu parametru, który ma potem zwrócić
bez zmian. Żeby zastosować tą funkcję do liczby naturalnej `1`, musimy ją najpierw poinformować, że
dostanie liczbę naturalną. Jako pierwszy argument aplikacji musimy zatem podać typ `Nat`. Gdy po
skopiowaniu również poniższego kodu umieścisz kursor nad słowem `#eval`, to zobaczysz, że gdy ta
funkcja jest odpowiednio poinformowana co dostanie jako swój *drugi* argument, to zwraca ten
argument:

```lean
#eval identycznosc Nat 1
```

Żeby zilustrować ogólność tej funkcji zastosujemy ją jeszcze do termu typu `String`:

```lean
#eval identycznosc String "jakis tekst"
```

Uprzedzam, że będę teraz objaśniał **najtrudniejsze pojęcie w tym rozdziale**. Przypominam więc:
Jeżeli będziesz czuła, że trudno Ci to zrozumieć, albo będą Cię dręczyć jakieś niejasne wątpliwości
czy brak poczucia sensu, być może najlepszą strategią będzie albo czytać dalej, albo wrócić po
przerwie do poprzednich fragmentów i przede wszystkim *poczekać*, aż wszystko będzie się [powoli
stawało coraz bardziej
jasne](https://people.math.harvard.edu/~knill/teaching/math22b2019/handouts/lecture15.pdf). To jest
naprawdę w dużym stopniu kwestia przyzwyczajenia, a przede wszystkim *pamięci*.

Nowa wersja funkcji identycznościowej *działa dla dowolnego typu* dzięki temu, że *typ drugiego
argumentu* i zarazem jej *rezultatu* jest jej *pierwszym parametrem*. Mamy tutaj przykład *typu
zależnego*. Język, którego używamy pisząc w Leanie (albo innych podobnych asystentach dowodzenia)
swoją ekspresyjność zawdzięcza przede wszystkim obecności takich typów. Jeszcze raz: *typ* drugiego
parametru jest *wartością* pierwszego parametru.

**Parametry i argumenty**: *Parametr* jest częścią definicji funkcji, natomiast *argument funkcji*
to term, do którego ta funkcja jest aplikowana (ilustracja):

```lean
-- n jest tutaj *parametrem*. Nie kopiuj tego kodu, jeżeli wprowadziłaś już definicję tej funkcji.
def nic_nie_robie (n : Nat) : Nat := 
    -- To jest ciało tej funkcji, tylko zapisane w następnej linijce. Mamy tu *zmienną* n,
    -- będącą jednocześnie *parametrem* tej funkcji:
    n

-- Tutaj 1 jest *argumentem* (aplikacji funkcji nic_nie_robie), ale to tylko aplikacja, bo sprawdzajac
-- typ nie wymuszamy jeszcze ewaluacji aplikowanej funkcji. Wszystkie obliczenia, które muszą zajść, 
-- żeby ustalić typ takiej aplikacji, rozgrywają się tylko *po stronie typu*:
#check nic_nie_robie 1

-- Gdy wymuszamy ewaluację, otrzymujemy *rezultat* tej aplikacji, czyli najprostszą postać termu,
-- (tak zwaną postać normalną), do której to wyrażenie da się zredukować:
#eval nic_nie_robie 1 -- 1
```

## Obliczenia w dwóch wymiarach

Zarówno funkcja `identycznosc` jak i jej głupsza siostra `nic_nie_robie` pozwalają zaobserwować, że
w Leanie zachodzą dwa rodzaje "obliczeń".

Funkcja `nic_nie_robie` ma typ `Nat → Nat`. Gdy aplikujemy ją do termu `1`, żadne obliczenie
"wewnątrz" czy za pomocą tej funkcji jeszcze nie zachodzi, bo takie obliczenie wymaga ewaluacji. W
ramach samej aplikacji `nic_nie_robie 1` zachodzi jednak *przekształcenie typu* z `Nat → Nat` do
`Nat`, co też jest pewnego rodzaju obliczeniem:

```lean
#check @nic_nie_robie -- nic_nie_robie : Nat → Nat

-- Przed chwilą było Nat → Nat, a na skutek aplikacji pojawia się już tylko samo Nat.
-- To też można traktować jako pewnego rodzaju obliczenie.
#check nic_nie_robie 1 -- nic_nie_robie 1 : Nat
```

Na skutek wystąpienia aplikacji to, co jest przed strzałką w wyrażeniu `Nat → Nat`, zostaje oderwane
i zostaje tylko to, co jest po strzałce, czyli w tym wypadku sam typ `Nat`. To jest zrozumiała
zmiana, bo zastosowanie funkcji zwracającej liczbę naturalną jest jakimś sposodem zapisania liczby
naturalnej, tak samo jak *1 + 2* jest jakimś sposobem zapisania liczby naturalnej. Wszędzie, gdzie
możemy podstawić pod zmienną jakąś liczbę naturalną, możemy podstawić też całe wyrażenie *1 +
2*. Widzimy więc konieczność zajścia w ramach aplikacji pewnego rodzaju obliczenia na poziomie typu
albo "w wymiarze typów".

W przypadku aplikacji funkcji `identycznosc` tego rodzaju obliczenie jest bardziej złożone, ale
nadal (być może po pewnym czasie) zrozumiałe:

```lean
#check @identycznosc -- identycznosc : (typ : Type) → typ → typ

#check @identycznosc Nat 1 -- @identycznosc Nat 1 : Nat
```

To obliczenie jest bardziej złożone, bo poza oderwaniem typów odpowiadających dwóm podanym
argumentom następuje również *podstawianie na poziomie typu*. Warto chociaż raz rozpisać ten proces
na kroki.

Skoro argument `Nat` stał się *wartością parametru* `typ`, a słowo `typ` występuje później w
specyfikacji typu stałej `identycznosc` w roli *zmiennej*, to następny argument i rezultat aplikacji
też muszą mieć ten typ:

```lean
identycznosc Nat : Nat → Nat
```

To jest zatem typ (częściowej) aplikacji do samego tylko argumentu `Nat`. Jak już wiesz, ten term
jest poprawny (typowalny), ponieważ Lean pozwala na częściowe aplikacje. A czym jest sama częściowa
aplikacja `identycznosc Nat`? To przecież ta sama funkcja, co `nic_nie_robie`, czyli identyczność
działająca (tylko) na liczbach naturalnych.

*Typ* funkcji `identycznosc` (nie `identycznosc Nat`) jest więc *czymś w rodzaju funkcji* (jeszcze
raz: sam typ jest tutaj czymś w rodzaju funkcji) której parametr nosi nazwę `typ`. To *nie* jest
funkcja, bo *typu* nie możemy do niczego aplikować, ale *na etapie aplikacji* ten typ działa tak,
jakby był funkcją i jakby ta funkcja była aplikowana do argumentu `Nat`. Nie przejmuj się, jeżeli
mimo moich zapewnień, że to naturalny proces, wydaje Ci się to zbyt trudne; z czasem się do tego
przyzwyczaisz.

Do pewnego momentu będę mówił o funkcjach rozumianych tylko jako efektywne procedury obliczeniowe,
albo po prostu programy, procedury, czy algorytmy. Potem zacznę też mówić o *implikacji*. Mam
powody, żeby zacząć od funkcji, a potem mówić o implikacjach, ale trudno mi je dobrze wyjaśnić już
teraz, bo nie mogę zakładać, że wiesz o pewnych sprawach, bez znajomości których moje wyjaśnienia
byłyby pewnie niezrozumiałe, nieprzekonujące, a może nawet mogłyby budzić niepokój (cel jest
ambitny, ale bez obaw - dotrzemy do niego bez pośpiechu i zarazem relatywnie szybko).

Na razie powiem tylko tyle: Istnieje sposób, żeby jednocześnie uczyć się podstaw matematyki,
programowania, formalizowania treści wyrażonych w języku naturalnym, konstruowania dowodów
matematycznych, a później podstaw metodologii badań, a wszystko to w interakcji z programem, który w
tym pomaga, takim jak Lean. Postaram się, żeby ta nauka była dla Ciebie możliwie łatwa, przyjemna i
pożyteczna, a jeśli w którymś miejscu mi się to nie uda, proszę, żebyś mi o tym powiedziała, dzięki
temu będę miał szansę zrobić to lepiej (boryslaw.paulewicz@uj.edu.pl).

Żeby skorzystać z tego "sposobu na matematykę" (i metodologię badań, a może nawet na całą
psychologię, albo chociaż pewną jej ważną część), trzeba się *cierpliwie przyzwyczajać* do *nowego
sposobu myślenia*, polegającego między innymi na patrzeniu na funkcje, programy, a niebawem też na
implikacje jako na jedno i to samo.

## Funkcje

**Polecenie**: Popatrz na ten fragment kodu, spróbuj go odczytać i przepisz go z pamięci. Jeżeli na
tym etapie to za trudne, to albo go po prostu skopiuj, albo spróbuj kiedy indziej, gdy poczujesz, że
jesteś gotowa znowu spróbować:

```lean
def suma (n : Nat) (m : Nat) : Nat := n + m
```

**Czytamy to**: Definiuję (`def`) wartość / znaczenie / treść stałej suma (`suma`) jako term o typie
funkcja dwóch parametrów typu liczba naturalna (`(n : Nat) (m : Nat)`), której rezultat też jest
typu `Nat` (`: Nat`), czyli też jest liczbą naturalną. A więc wszystko między definiowanym symbolem
(tutaj symbolem `suma`) a symbolem definiowania `:=` jest określeniem *typu*, a nie treści (lepiej:
*ciała*) definicji.

**Czytamy dalej**: Ten term konstruuję albo definiuję (`:=`) jako zastosowanie funkcji dodawania -
bo to też jest pewna funkcja - do pierwszego i drugiego parametru, które to parametry nazwałam `n` i
`m`, bo tak mi się podobało, a poza tym zauważyłam, że inni matematycy często stosują tą konwencję,
gdy mówią o liczbach naturalnych.

**Nazwy parametrów funkcji nie mają znaczenia** w tym sensie, że na przykład taka oto ...

```lean
-- alternatywna definicja (z apostrofem w nazwie) ...
def suma' (a : Nat) (b : Nat) : Nat := a + b
```

... jest ewidentnie *tą samą*, tylko *inaczej zapisaną funkcją*. Jest też inaczej nazwana, bo nie
możemy ponownie definiować tych samych symboli.

**Ostateczność definicji**: Gdy raz zdefiniujemy jakiś symbol, tutaj symbole `suma` i `suma'`, nie
możemy już więcej (w tej samej [*przestrzeni
nazw*](https://pl.wikipedia.org/wiki/Przestrze%C5%84_nazw), ale o tym później) zmienić jego
definicji, chyba, że najpierw usuniemy poprzednią definicję. Dlatego właśnie takie symbole nazywamy
*stałymi*.

**Zmienne są zmienne**: Nazwy *parametrów funkcji* nie są stałymi, tylko *zmiennymi*, bo możemy im
przypisywać, a dokładniej pod nie *podstawiać*, dowolne argumenty typu wymaganego przez definicję
danej funkcji. Na przykład, możemy zastosować funkcję `suma` do termów `3` i `5` i wtedy te termy
"wskoczą" na miejsce pierwszego i drugiego parametru. Możemy potem zastosować tą samą funkcję
jeszcze raz, ale do innych termów i wtedy (i w tym miejscu) te inne termy wskoczą w miejsce *tych
samych* parametrów. Parametry funkcji są więc zmiennymi, bo te same parametry tej samej funkcji mogą
przyjmować różne wartości w różnych "sytuacjach".

**Polecenie**: Sprawdź typ aplikacji funkcji `suma` do dwóch liczb naturalnych, wszystko jedno
jakich, a następnie ewaluuj tą aplikację. Upewnij się, czy rozumiesz komunikaty pojawiające się w
panelu po prawej.

Żeby utrwalić sobie to, co do tej pory wyjaśniłem, rozważ proszę jeszcze taką oto funkcję:

```lean
def dodaj2 (a : Nat) : Nat := a + 2
```

**Polecenie**: Spróbuj odczytać samodzielnie sens tej defincji opierając się na fragmencie, w którym
objaśniłem, jak się czyta takie definicje. Może nawet zrób to na głos? Dzięki temu upewnisz się, czy
właściwy sposób czytania jest dla Ciebie jasny.

Myślę, że teraz już od razu widzisz, jak ta funkcja działa, nawet jeśli jeszcze niedawno nie
wiedziałaś, że język Lean istnieje. Myślę też, że jest już dla Ciebie oczywiste, że nazwa parametru
(tutaj `a`) nie ma znaczenia dla "sensu" tej funkcji: ta nazwa służy *tylko* do tego, żeby można
było wewnątrz ciała funkcji (całe ciało funkcji `dodaj2` to `a + 2`) "mówić" o ewentualnym
argumencie.

**Polecenie**: Spróbuj przepisać definicję stałej `dodaj2` z pamięci, żeby struktura takich
definicji zaczęła Ci się lepiej utrwalać i żebyś mogła ją szybciej mentalnie przetwarzać. Jeżeli Ci
się to nie uda, popatrz znowu na tą definicję, przełącz się na okno, w którym działa serwer Leana
tak, żeby nie było jej widać i spróbuj ponownie. I tak do skutku. To Ci pomoże w przyswajaniu
dalszych treści. Gdy już Ci się uda, sprawdź typ stałej `dodaj2`, raz poprzedzając ją symbolem `@`,
a raz nie. Sprawdź też proszę typ aplikacji tej stałej do wybranej liczby naturalnej. A na koniec
ewaluuj tą aplikację. Za każdym razem popatrz na rezultat w panelu po prawej.

**Ewaluacja aplikacji krok po kroku**: Mówiąc w pewnym uproszczeniu, gdy umieścisz kursor nad
komendą `#eval` w instrukcji `#eval dodaj2 2`, wtedy Lean:

1. Ewaluuje, czyli redukuje do najprostszej postaci, argument tej aplikacji. Tutaj jest tylko jeden
argument,`2`, i ten argument też może być zredukowany, ale o tym za chwilę.

2. Podstawia rezultat tej redukcji pod zmienną `a` w ciele funkcji, bo `a` jest (tutaj jedynym)
parametrem funkcji `dodaj2`. W ten sposób powstaje `2 + 2` (posługując się dalej znaną Ci notacją
cyfrową).

3. Wreszcie ewaluuje uzyskaną w ten sposób wersję ciała funkcji, co może wymagać dalszych ewaluacji,
aż nie będzie się dało niczego więcej zredukować do prostszej postaci.

Wydaje mi się, że mniej więcej czegoś takiego się spodziewałaś, może pomijając to, jak są
zdefiniowane liczby naturalne (a także dodawanie liczb naturalnych, o którym jeszcze nie mówiłem, a
które ma w Leanie piękną definicję rekurencyjną). Jeżeli chcesz się dowiedzieć czegoś więcej o
definicji liczb naturalnych, jaką stosuje Lean, możesz samodzielnie poszukać informacji na temat
aksjomatów Peano. Ja wyjaśnię teraz tylko tyle:

Liczba `0` jest przez Leana interpretowana jako stała `Nat.zero`. Podkreślam, że `Nat.zero` *to
tylko pewien napis*, nic więcej. Zwykle zapisujemy tą liczbę jako `0`, ale zapis cyfrowy istnieje
tylko dla naszej wygody. Liczba naturalna `1` odpowiada *samej aplikacji funkcji następnika do
stałej* `Nat.zero`, to jest `Nat.succ Nat.zero`. **Czytamy to**: *Następna* (stąd "następnik")
*liczba naturalna po liczbie zero*. Ta aplikacja jest *nieredukowalna*, co znaczy, że gdy pojawi się
w trakcie ewaluacji jako rezultat, ewaluacja na niej się zakończy. Innymi słowy, ta aplikacja
istnieje tylko po to, żeby można było ją *zapisać* i na przykład podać jako argument, albo zwrócić
jako rezultat, bo *sama aplikacja* `Nat.succ Nat.zero` *jest dla Leana liczbą `1`*.

Zastanawiasz się może, o co w tym chodzi? Spróbuję to wyjaśnić: Gdyby przedstawiciele jakiejś innej
cywilizacji wymyślili "obiekty abstrakcyjne", których używaliby dokładnie tak, jak my używamy liczb
naturalnych, ale zapisywaliby i nazywali je inaczej, powiedzielibyśmy, że to są te same "obiekty
abstrakcyjne", albo, że mają "ten sam sens", tylko są inaczej nazywane, prawda?  Jesteśmy co prawda
przyzwyczajeni do zapisu za pomocą cyfr arabskich, ale sposób, w jaki coś zapisujemy, nie decyduje o
*znaczeniu*, o tym decyduje *tylko* sposób *użycia*.

Stała `Nat.zero` i aplikacje takie jak `Nat.succ Nat.zero` całkiem dosłownie *są* więc liczbami
naturalnymi, tak samo jak `0` i `1` *są* liczbami naturalnymi. Możemy tak powiedzieć, ponieważ
wszystkie operacje, jakie możemy wykonywać na liczbach naturalnych, możemy wykonywać na tych
wyrażeniach, uzyskując przy tym wyniki zgodne z interpretacją: `0` to `Nat.zero`, `1` to `Nat.succ
Nat.zero`, `2` to `Nat.suc (Nat.succ Nat.zero)`, i tak dalej. Zapis nie ma tu znaczenia, poza tym,
że może być mniej lub bardziej wygodny dla osoby, która się nim posługuje.

Już ostatni raz: Sam *fragment kodu* albo *zapis* `Nat.succ Nat.zero` *jest* liczbą `1`. Nie wiem,
czy to Cię zaskakuje, ale sądzę, że może zaskakiwać. Kiedy się o tym uczyłem, na początku
spodziewałem się, że coś, co wygląda jak aplikacja, będzie "kryło pod sobą" jakąś "prawdziwą"
funkcję i jakąś "prawdziwą" liczbę jako argument i że tych "prawdziwych rzeczy" będzie można użyć,
żeby coś obliczyć. Wydaje się przecież, że skoro `Nat.succ Nat.zero` coś *znaczy*, to powinno być
jakby "coś pod spodem" `Nat.succ Nat.zero` i tym czymś powinna być albo para złożona z funkcji i
liczby, albo jakaś liczba *1* "jako taka", czy może "sama w sobie".

To, że *nic* pod spodem nie ma, to dobra wiadomość, bo oznacza, że *nie ma tu żadnych tajemnic*, są
tylko rozmaite *ciągi symboli i dopuszczalne sposoby ich przekształcania*. To taka rozległa pustka,
a w niej nic świętego[^3]. Można powiedzieć, że tym właśnie jest *matematyka formalna*, niczym
więcej, gdy tylko pominiemy jej *interpretację*, którą zresztą możemy zmieniać na dowolną inną,
jeśli tylko ta alternatywna interpretacja będzie spójna.

**Zasięg nazw**: Gdybyś teraz w kolejnej linijce wkleiła do Leana kod `#eval n`, to zobaczyłabyś
komuikat o błędzie, ponieważ `n` i `m` to w tym momencie *tylko* parametry funkcji `suma`, które są
*widoczne tylko z wnętrza ciała* funkcji `suma` (które to ciało składa się tylko z wyrażenia
`n + m`).

**Polecenie**: Napisz w nowej linijce `#eval n`. Zobaczysz wtedy, że symbol `n` będzie podkreślony
czerwoną falką. Usuń ten błędny kod. W ten sposób Lean sygnalizuje, że nie wie, o czym mówisz, a nie
wie, bo symbol `n` jest widoczny tylko wewnątrz ciała funkcji `suma`. Tak właśnie działa zasięg
nazw. 

Możesz sobie wyobrazić, że ciało funkcji to pewien mechanizm albo mały robot, który ma nad sobą
otwory, przez które może dostawać różne obiekty będące argumentami aplikacji funkcji. Te obiekty są
dla niego zawsze *opakowane* (czyli *jakieś*), a więc nie wie, jak dokładnie wyglądają, wie tylko,
że to są jakieś obiekty, które wpadły przez taki albo inny otwór. Jeżeli to jest robot pracujący
wewnątrz funkcji `suma`, to gdy dostanie dwie liczby, dla niego to będą tylko dwa opakowane obiekty,
o których będzie wiedział tyle, że mają typ `Nat` i będzie też wiedział, który jest pierwszy, a
który drugi, bo na opakowaniach będzie widział nazwy `n` i `m`. W przypadku funkcji `suma`,
wszystko, co ten robot robi (ech) to aplikacja dodawania do tych dwóch obiektów.

**Funkcja jako pudełko z mechanizmem**: Albo, nieco bardziej abstrakcyjnie, możemy myśleć o funkcji
takiej jak `suma` jako o pudełku, które ma dwa wejścia, jedno oznaczone literą `n`, a drugie literą
`m`, i które ma jedno wyjście, a w środku ma "mechanizm dodający" obiekty pojawiające się na
wejściach. Jeżeli wyobrazimy sobie, że ten wewnętrzny mechanizm jest "przyklejony" do wejść, to
stanie się jasne, że nazwy wejść nie mają znaczenia i istnieją tylko dla wygody użytkownika, czyli
naszej.

Za to *typy* wejść i *typ* wyjścia (funkcje mają zawsze tylko jedno wyjście, a tak naprawdę również
tylko jedno wejście) *mają* znaczenie. Można sobie wyobrazić, że typy wejść i typ wyjścia to
kształty otworów funkcji jako pudełka. Nie możemy podawać na wejściu funkcji `suma` czegokolwiek -
to muszą być wyrażenia typu liczba (tutaj akurat wymagamy liczb naturalnych) i tak też mówi nasza
definicja. Można więc powiedzieć, że funkcje w teorii typów są zawsze *wyspecjalizowane*. Jeżeli
podamy na wejściu dwa wyrażenia typu liczba naturalna, to gdy tylko wymusimy ewaluację, na wyjściu
pojawi się liczba naturalna. To będzie wynik dodawania wejść, bo tak jest skonstruowana zawartość
naszego pudełka o nazwie `suma`.

Metafora funkcji jako mechanizmu w pudełku ma pewne ograniczenia. Jak już wiesz, wyliczenie
rezultatu aplikacji funkcji polega tak naprawdę na ewaluacji argumentów, następnie na podstawieniu
ich zredukowanych postaci pod odpowiednie zmienne w ciele funkcji i na ewaluacji (czyli redukcji)
ciała funkcji, aż do skutku. Można więc powiedzieć, że "mechanizm obliczający" działa "na zewnątrz"
definicji funkcji. To zatem taki "uniwersalny ewaluator", albo "uniwersalny reduktor", który na
etapie używa definicji stałych, które napotyka, rozpakowuje je i redukuje napotkane aplikacje.

A oto bardziej skomplikowany przykład ewaluacji aplikacji. Myślę, że domyślasz się już trochę,
dlaczego ten (wiem, że dziwny) fragment kodu jest poprawny i jak działa:

```lean
#eval suma (Nat.succ (Nat.succ 3)) (6 - (2 + Nat.zero))
```

Prześledzimy po kolei, co się tutaj dzieje, dla uproszczenia stosując wygodny zapis cyfrowy
(ilustracja):

```lean
#eval suma (Nat.succ (Nat.succ 3)) (6 - (2 + Nat.zero))

suma (Nat.succ 4) (6 - 2)

suma 5 4

-- Ponieważ argumenty są w postaci normalnej (tutaj właściwie udajemy, że są), w tym momencie następuje 
-- rozpakowanie definicji stałej suma:
n + m

-- A ponieważ 5 ma być podstawione za zmienną n (pierwszy parametr) a 4 za zmienną m (drugi parametr)
-- to uzyskujemy taką wersję ciała:
5 + 4

-- W ten sam sposób przebiega ewaluacja aplikacji funkcji + do liczb 5 i 4. Ewaluacja trwa do momentu, gdy
-- nic więcej nie będzie się dało zredukować do prostszej postaci.
```

Ewaluacja całego tego wyrażenia zaczyna się od ewaluacji najbardziej wewnętrznych albo
zagnieżdżonych części argumentów: `(Nat.succ 3)` i `(2 + Nat.zero)`. Rezultatami tych ewaluacji są -
stosując zapis cyfrowy - liczby `4` (`1 + 3`) i `2` (`2 + 0`). To jednak nie koniec ewaluacji
argumentów, bo `(Nat.succ 3)` i `(2 + Nat.zero)` są tu argumentami pewnych aplikacji (funkcji
`Nat.succ` i funkcji `-`). Przypominam, że w tym kontekście `+` i `-` też oznaczają pewne
(dwuarguentowe) funkcje, tylko zapisane w *notacji infiksowej* ...

`argument1 funkcja argument2`, na przykład `1 + 2`

... zamiast w *notacji prefiksowej* ...

`funkcja argument1 argument2`, na przykład `suma 1 2`

bo tak się zwykle zapisuje dodawanie i odejmowanie. Można nauczyć Leana, żeby rozumiał taki zapis
dla samodzielnie zdefiniowanych funkcji, takich jak na przykład `suma`, ale nie będziemy tego teraz
robić.

**Aplikacje wieloargumentowe**: Jesteś w stanie się domyślić, na czym polega (wynikający z
niejednoznaczności zapisu) błąd w tym kodzie?

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
dwuargumentowa, ale tak naprawdę *nie* jest dwuargumentowa. Jest funkcją jednoargumentową, *która
zwraca funkcję jednoargumentową*, która dopiero dodaje parametr tej pierwszej funkcji do swojego
jedynego parametru.

Taki sposób definiowania funkcji więcej niż jednoargumentowych nazywa się *curryingiem*, od nazwiska
pewnego wybitnego [matematyka](https://en.wikipedia.org/wiki/Haskell_Curry), który pojawi się tu
jeszcze w znacznie poważniejszej roli.

**Polecenie**: Napisz kod pozwalający sprawdzić typ aplikacji funkcji `suma` do *tylko jednego*
argumentu `10`. Jak Ci się to uda, to w prawym panelu zobaczysz komunikat:

```lean
suma 10 : Nat → Nat
```

Ten przykład może Ci się wydawać znajomy. Faktycznie, przyglądaliśmy się już tego rodzaju częściowej
aplikacji, tylko, że wtedy używaliśmy dwuargumentowej funkcji `identycznosc`, aplikując ją tylko do
jednego termu, to jest do typu `Nat`.

**Czytamy to**: Aplikacja funkcji `suma` do termu `10` ma typ `Nat → Nat`. Typ `Nat → Nat` mówi nam,
że cała ta częściowa aplikacja (`suma 10`) jest pełnowartociową funkcją, przekształcającą liczby
naturalne w liczby naturalne. Jaka to jest funkcja? Znamy definicję stałej `suma`, domyślamy się
więc, że `suma 10` to wyrażenie, które jakby czeka na brakujący argument. Jest to zatem funkcja
jednoargumentowa, która do dowolnej liczby naturalnej dodaje `10` (dodaje `10` "od przodu", bo
"robi" `10 + m`).

**Polecenie**: Sprawdź typ stałej `suma`, ale poprzedzonej znakiem `@`, żeby się przekonać, że
`suma` ma typ, w którym występują *dwie strzałki*, bo to tak naprawdę funkcja, która przekształca
dowolną liczbę naturalną w funkcję, która to funkcja z kolei przekształca dowolną liczbę naturalną w
liczbę naturalną.

**Do rozważenia**: Po przeczytaniu tego rozdziału i ewentualnym podjęciu prób wykonania niektórych
lub wszystkich poleceń warto może wrócić do rozdziału poprzedniego, w którym pisałem o podobnych
sprawach, ale w inny sposób. Wydaje mi się, że w ten sposób dosyć szybko treści obydwu tych
pierwszych rozdziałów staną się dla Ciebie w miarę jasne.

### Przypisy

[^1]: Należy pamiętać, że *typ funkcyjny* znaczy to samo, co *typ funkcji*; to tylko inna nazwa na
    to samo. W szczególności, typ funkcyjny nie jest funkcją, tylko typem (funkcji). Czasami nazwa
    typ funkcyjny brzmi po prostu lepiej, na przykład: *Funkcje to dokładnie takie termy, których
    typem jest jakiś typ funkcyjny* brzmi chyba lepiej, niż *Funkcje to dokładnie takie termy,
    których typem jest jakiś typ funkcji*.

[^2]: ... który być może pojawi się tu jeszcze w drugiej części, bo do pewnych rzeczy pasuje jak
    ulał, i którego większość książek przeczytałem jeszcze w późnej podstawówce, czego akurat nikomu
    *nie* polecam, bo zbyt wczesny kontakt z Gombrowiczem raczej nie sprzyja socjalizacji. Jeżeli
    więc czytają to jacyś aktualni lub przyszli rodzice, to sugeruję, żeby Gombrowicza dzieciom
    stanowczo zakazać, przynajmniej dopóki nie zaczną częściej wychodzić na miasto. Zamiast tego
    lepiej niech czytają o teorii typów (albo kategorii), bo dzięki temu z pewnością szybko staną
    się [socjometrycznymi gwiazdami](https://pl.wikipedia.org/wiki/Gwiazda_socjometryczna). Nie ma
    za co.

[^3]: གང་ལ་སྟོང་པ་ཉིད་སྲིད་པ། ། དེ་ལ་དོན་རྣམས་ཐམས་ཅད་སྲིད། ། གང་ལ་སྟོང་ཉིད་མི་སྲིད་པ། ། དེ་ལ་ཅི་ཡང་མི་སྲིད་དོ། །
