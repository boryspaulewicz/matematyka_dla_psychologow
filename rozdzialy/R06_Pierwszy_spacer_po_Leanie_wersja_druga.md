**Tematy do powtarzania**: Wyrażenie, term, typ, typowalność, funkcja, parametr, zmienna, argument,
aplikacja, wystąpienie zmiennej jako miejsce w kodzie funkcji połączone z parametrem/wejściem o tej
samej nazwie, currying, ewaluacja/redukcja, typ zależny, uogólniona identyczność, definicja, stała,
ciało definicji a ciało funkcji.

<br>

U mojej córki mniej więcej od drugiego roku życia można było zauważyć wyraźne opóźnienie w rozwoju
mowy. Dlatego od wczesnego dzieciństwa chodziła między innymi na dodatkowe zajęcia logopedyczne. W
trakcie jednego ze spotkań z logopedką, która jej wtedy pomagała, dowiedziałem się, że dorosły
człowiek może coś dobrze zapamiętać dopiero wtedy, kiedy powtórzy mu się to coś trzy razy.

Nie powiedziałem, że napisałem metateoretyczny doktorat na temat podstaw psychologii, ani że przez
ponad dziesięć lat prowadziłem zajęcia między innymi z psychologii poznawczej, bo nie widziałem
takiej potrzeby. Ale co sobie wtedy pomyślałem, to sobie pomyślałem. A teraz zastosuję się do tej w
praktyce chyba wcale nie tak rzadko użytecznej rady, przypominając po raz trzeci i ostatni, że
**najważniejsze moim zdaniem wskazówki na temat tego, w jaki sposób warto czytać tą książkę, są
[tutaj](./Wujek_dobra_rada.md).**

<hr>

## O czym teraz będzie

Przypominam, że to jest alternatywna wersja *tego samego rozdziału*. Postanowiłem napisać dwie
wersje, ponieważ to, jak łatwe będą dla Ciebie do zrozumienia kolejne rozdziały, będzie zależało w
znacznym stopniu od tego, jak dobrze uda mi się wytłumaczyć to, co omawiam tutaj. Dlatego może choć
raz zerknij do poprzedniej wersji po tym, jak przeczytasz tą.

Gdy już objaśnię ogólną strukturę i sposób działania funkcji w Leanie, w następnych rozdziałach
pokażę Ci, że będziesz już właściwie wiedzieć, czym jest *duży kwantyfikator*, czyli spójnik
logiczny `∀`, który czytamy jako *dla każdego*. I niewiele będzie trzeba, żebyś zrozumiała, jak w
logice konstruktywnej działa *implikacja*, którą w logice czytamy jako *jeżeli, to* i oznaczamy
nieprzypadkowo tym samym symbolem `→`, który w teorii typów oznacza typ funkcji. Ta zbieżność
oznaczeń wynika stąd, że w logice konstruktywnej implikacja jest pewnego rodzaju funkcją. Pozostałe
standardowe *spójniki logiczne* (`∧`, `∨` i `∃`), za wyjątkiem *negacji* (`¬`), można również
zdefiniować za pomocą funkcji/implikacji, a żeby z kolei zdefiniować negację, wystarczy użyć czegoś,
co w pewnym sensie zachowuje się jak funkcja. Ale z powodów, które trudno mi teraz dobrze
wytłumaczyć, te ostatnie spójniki wprowadzę znacznie później. Zapowiadam to już teraz, żeby
sygnalizując w jaki sposób to jest faktycznie droga na skróty i od podstaw zachęcić Cię do dalszej
nauki matematyki przez opanowanie podstaw teorii typów.

Ponieważ *predykaty* (takie jak *jest dziwne* w zdaniu "Życie jest dziwne") to, jak się przekonasz,
również funkcje, podobnie jak wszelkie relacje, które są zresztą uogólnionymi predykatami, ucząc się
w ten sposób jednocześnie matematyki i programowania stosunkowo szybko opanujesz podstawy *logiki
predykatów*. W dodatku będzie to logika predykatów "bardzo wysokiego" rzędu, bo teoria typów pozwala
kwantyfikować po termach dowolnego typu, a system typów tej teorii jest wyjątkowo bogaty. Logika
predykatów (a później też inne logiki) pozwoli Ci
[prześlwietlać](https://www.youtube.com/watch?v=0pYyzolIN3I) strukturę nie tylko dowodów
matematycznych, ale również rozumowań zapisanych w języku naturalnym.

Rachunek predykatów będziesz mogła stosować do głównego rozumowania w swojej pracy semestralnej,
pracy magisterskiej, doktoracie, albo artykule, lub do analizy - nierzadko strukturalnie dosyć
prostych i jednocześnie po bliższym zbadaniu zaskakująco (?) "dziurawych" i "zagadkowych", albo
wręcz "tajemniczych" - uzasadnień głównych wniosków w artykułach naukowych. Często nawet sama tylko
*próba* przeprowadzenia takiej formalizacji pozwoli Ci wskazać, gdzie *dokładnie* są ewentualne
*błędy logiczne* lub *kluczowe niejasności*. Nie zawsze będziemy je nazywać błędami *logicznymi*, bo
czasem będą to wady, których *nie da się* uchwycić za pomocą *logiki* i trzeba będzie użyć do nich
ogólniejszej, ale wciąż matematycznej [teorii *rozumowania*](https://philarchive.org/rec/HLORFL).
Celowo niedokończony i mam nadzieję, że interesujący przykład tego rodzaju zabawy znajdziesz [w
jednym z następnych rozdziałów](./R12_Duzy_kwantyfikator.md).

<hr>

# Pierwszy spacer po Leanie, wersja druga

Polecenia i zadania, które pojawiają się w pierwszych rozdziałach, nie wymagają instalacji Leana,
ale jeżeli dotarłaś do tego momentu, to możliwe, że brałaś to już pod uwagę. Warto go zainstalować,
na przykład w połączeniu ze znakomitym darmowym edytorem [VS Code](https://code.visualstudio.com/).
Instrukcje znajdziesz [tutaj](https://lean-lang.org/lean4/doc/quickstart.html).

**Polecenie**: Jeżeli nie używasz edytora *VS Code*, a w pierwszych rozdziałach zakładam, że
niekoniecznie, to skopiuj na początek do lewego okna sesji Leana w przeglądarce taki fragment kodu:

```lean
-- Tekst zaczynający się od znaków `--` to komentarz. Komentarze są przez Leana ignorowane. Dzięki
-- temu możemy napisać na przykład to:
--
-- Lean jest głupi
--
-- i nic się nie stanie.

-- Ta fascynująca funkcja pobiera jeden argument typu `Nat`, czyli liczbę naturalną, i nic z nią nie
-- robi, tylko ją zwraca (każda funkcja musi coś zwracać {gdy coś dostanie}):
def nic_nie_robie (n : Nat) : Nat := n
```

**Czytamy to**: 

- Definiuję (`def`) ...

- funkcję (bo ma parametr) `nic_nie_robie` ...

- która ma (tutaj jeden) parametr `n` typu `Nat` (`(n : Nat)`) ...

- i zwraca (tak czytamy pojawiający się po specyfikacji ostatniego parametru funkcji symbol `:`,
  który nazywam wtedy *głównym dwukropkiem*) term typu `Nat`.

- *Ciałem* tej funkcji jest (`:=`) samotna zmienna `n`. 

Czy nie wydaje Ci się, że składnia Leana jest prosta i intuicyjna? Nawet, jeżeli tego jeszcze nie
czujesz, wklej poniżej zapisanej właśnie definicji następny fragment kodu i umieść kursor na
komendzie `#eval`. Zobaczysz wtedy po prawej rezultat *ewaluacji* aplikacji funkcji `nic_nie_robie`
do termu `1`. Rezultatem tej ewaluacji też będzie `1`, bo funkcja `nic_nie_robie` zwraca argumenty
bez zmian.

```lean
#eval nic_nie_robie 1
```

Teraz będziemy na dwa sposoby *sprawdzać typ* termu `nic_nie_robie`. W tym celu wklej lub przepisz z
pamięci to:

```lean
#check @nic_nie_robie

#check nic_nie_robie
```

Jak widać, w zapisie te dwa sposoby różnią się tylko obecnością znaku `@`, który mówi Leanowi, jak
ma wyświetlać typ. Gdy umieścisz kursor nad *pierwszym* wystąpieniem słowa `#check`, zobaczysz po
prawej typ termu `nic_nie_robie` zapisany tak:

`nic_nie_robie : Nat → Nat`

gdzie `Nat` to typ oznaczający liczby naturalne. Myślę, że zaczęłaś się już oswajać z tym, że term o
postaci `M : N`, gdzie `M` i `N` to jakieś termy, czytamy jako `M` *ma typ* `N`. Gdy `M` *ma być*
później używane jako *zmienna*, takie wyrażenie nazywamy *deklaracją* (nazwy i typu zmiennej). A
więc ...

```lean
x : N
```

... gdzie `N` to jakiś term oznaczający typ, **czytamy jako**:

*Deklaruję, że nazwa `x` będzie odtąd używana jako zmienna o typie `N`*. Jeszcze raz: takie
wyrażenia czytamy w ten sposób, gdy dana nazwa *ma być traktowana jako zmienna*. A o tym, czy `x` ma
być traktowana jako zmienna czy stała decyduje to, *gdzie* term o postaci `x : N` występuje. Jeśli
pojawia się zaraz po słowie kluczowym `def`, to mamy do czynienia z *definicją* (wartości/treści)
*stałej* `x`, a nie z *deklaracją*, że `x` ma być traktowana jako *zmienna*. 

Definicję funkcji `nic_nie_robie` ...

```lean
def nic_nie_robie : Nat → Nat := fun (n : Nat) => n
```

... możemy teraz objaśnić tak: Program/kod to *sekwencja reguł* albo *zasad*, które są *wyrazem
życzeń* albo *oczekiwań* wobec kogoś/czegoś (na przykład Leana), kto/co ma te reguły *stosować*.
Dlatego kod możemy czytać jako szczególnego rodzaju tekst, który mówi, *jak coś ma działać*. Zgodnie
z powyższym fragmentem kodu, symbol (o nazwie) `nic_nie_robie` *ma być* traktowany jako *stała*, bo
pojawia się po słowie kluczowym `def`. Ta stała ma oznaczać pewną konkretną, to jest *jawnie
skonstruowaną* (bo to jest zwykła, a nie aksjomatyczna definicja) funkcję, która przyjmuje liczby
naturalne i zwraca liczby naturalne. Ta funkcja ma działać w taki sposób, że:

*Jeśli to, co może dostać jako argument, nazwiemy `n`, to ta funkcja ma zwracać `n`*.

<hr>

**Parametry i zmienne to dwa aspekty tego samego językowego zjawiska działającego jak układ
przewodów albo połączeń**: Widzimy, że symbol `n` pełni tu *podwójną* rolę *czegoś oznaczającego
wejście* i zarazem *oznaczenia miejsca w kodzie*. A to, którą `n` pełni rolę, zależy od tego, *gdzie
występuje*. Symbol `n` występujący w ciele funkcji oznacza nie *samo wejście*, tylko *cokolwiek, co
może się pojawić na wejściu*. I właśnie na tym, że to może być *cokolwiek* (określonego typu),
polega "zmiennościowość" użytej w ten sposób nazwy `n`.

Mówiąc krótko: *Specyfikacja parametru funkcji* jest *szczególnego rodzaju* (bo nadaje jej status
nazwy \{jedynego\} wejścia funkcji) *deklaracją zmiennej obowiązującą w ciele funkcji*.

A mówiąc obrazowo, bo w kategoriach *połączeń*: Podwójna rola `n` jako parametru/zmiennej albo
zaimka/miejsca w kodzie polega na tym, że *wystąpienia* nazwy `n` w definicji funkcji są albo
jedynym "początkiem" (gdy `n` pojawia  się w miejscu specyfikacji parametru, czyli jako nazwa
wejścia funkcji), albo jakimś "końcem wirtualnego przewodu", bo takie wystąpienia służą dokładnie do
oznaczania *połączeń wejścia funkcji z miejscami w jej ciele*. Dlatego o parametrach i zmiennych
można myśleć jako o dwóch aspektach jednej i tej samej "rzeczy", to jest pewnego rodzaju "układu
językowych przewodów" albo "połączeń", które przypominają odwrócone drzewa, bo końce połączeń będące
wystąpieniami tej samej zmiennej mają ten sam początek/to samo wejście (parametr).

Na przykład, w definicji funkcji `podwajam` można zobaczyć wirtualne drzewo przewodów, które ma
jeden korzeń/wejście/parametr i dwa węzły/liście/miejsca wystąpienia zmiennej:

```lean
-- Podany na wejściu argument "spływa do" lub "zasila" tutaj dwa różne miejsca w ciele.
-- *Pierwsze wystąpienie* `n` jest *deklaracją* o treści: W ciele tej funkcji `n` ma oznaczać wartość
-- podaną na wejściu.
def podwajam (n : Nat) :=
    -- Te          *dwa różne wystąpienia tego samego symbolu* `n`
    -- pełnią rolę *miejsc                dla takich samych (zmiennych) wartości*.
    n + n

-- W ten sposób wszystkie trzy wystąpienia symbolu `n` *działają jak drzewo połączeń z jednym
-- korzeniem*.
```

Być może najprościej można to wszystko powiedzieć tak: *Parametr* to *nazwane wejście*, a
*występienie zmiennej* to *miejsce połączone z wejściem o tej samej nazwie*.

Ostatni raz: Parametry i zmienne to tylko *oznaczenia początków i końców wewnętrznych połączeń*.

Ten sposób mówienia i myślenia o parametrach i zmiennych "dotyka" ich "istoty" w tym znaczeniu, że
określa dokładnie to, w jaki sposób *używamy* parametrów i zmiennych, a w przypadku tego rodzaju
pojęć *tylko* to jest ważne, bo to są pojęcia *funkcjonalne* w znaczeniu *dotyczące roli w
realizacji określonych celów*. I dlatego też ten sposób mówienia i myślenia jest taki *obrazowy* i
*dynamiczny*, bo chodzi w nim o *zmierzanie do* (pewnych celów), to jest o pewnego rodzaju
(ukierunkowany) *ruch* i o *przekształcanie* czegoś (w coś). Akurat tutaj (lokalnie) "ostatecznym"
celem jest obliczenie wartości aplikacji funkcji do (odpowiednich) argumentów.

Widzimy z tej perspektywy, że funkcja `nic_nie_robie` ma *najprostsze możliwe ciało*, bo każda
funkcja musi mieć jedno wejście i jedno wyjście, więc musi mieć co najmniej jeden "wewnętrzny
przewód", a funkcja `nic_nie_robie` ma tylko jeden "wewnętrzny przewód" i poza tym nie ma w jej
ciele nic więcej, bo ta funkcja nie robi nic ponad to, co musi robić każda możliwa funkcja.

<hr>

A zawsze, gdy po stronie typu, czyli po prawej od symbolu `:`, widzisz strzałkę, masz do czynienia z
*typem funkcyjnym* inaczej *typem funkcji*[^1]. Na przykład, `nic_nie_robie` jest termem typu
funkcyjnego, czyli funkcją, bo ma w typie strzałkę. Komunikat, który widzisz po prawej, gdy
sprawdzasz typ tej stałej, to jest ...

`nic_nie_robie : Nat → Nat`

... możesz więc krótko odczytać też tak:

*`nic_nie_robie` jest jakąś funkcją, która z dowolnej liczby naturalnej robi jakąś liczbę naturalną*
(albo nieco bardziej pedantycznie: *stała `nic_nie_robie` oznacza jakąś funkcję, która ...*).

Jeżeli umieścisz kursor nad wystąpieniem komendy `#check`, któremu nie towarzyszy symbol `@`,
zobaczysz *tą samą informację*, tylko *przedstawioną w inny sposób*:

`nic_nie_robie (n : Nat) : Nat`

Wydaje mi się, że już rozumiesz, jak to odczytujemy, ale na wszelki wypadek jeszcze raz wyjaśniam.
Stąd, że obok stałej `nic_nie_robie` mamy fragment `(n : Nat)` możemy wywnioskować, że
`nic_nie_robie` jest funkcją, która wymaga jako argumentu liczby naturalnej. Gdy teraz skopiujesz do
Leana jeszcze to ...

```lean
#check nic_nie_robie 1
```

... i umieścisz kursor nad komendą `#check`, to zobaczysz po prawej komunikat:

`nic_nie_robie 1 : Nat`

Tym razem sprawdzamy typ termu *złożonego* `nic_nie_robie 1`. Po lewej od `:` widzimy *dwa* termy
*proste* albo *atomowe*, które zapisane w tej kolejności tworzą *jeden* term *złożony*, będący w tym
przypadku *aplikacją* (aplikacja jest zawsze zestawieniem {być może złożonego} termu oznaczającego
jakąś funkcję i jakiegoś innego {być może złożonego} termu), a mówiąc dokładniej aplikacją (termu o
typie) funkcji `nic_nie_robie` do (termu) `1`. Pierwszy i jedyny parametr `n` funkcji
`nic_nie_robie` ma typ `Nat` i term `1` ma typ `Nat`, a zatem `1` jest termem typu, którego ta
funkcja wymaga. Dlatego aplikacja funkcji `nic_nie_robie` do termu `1` jest poprawna, inaczej
*typowalna*.

**Definicja aplikacji**: Samo *zestawienie*, to jest *zapisanie obok siebie* funkcji i jakiegoś
termu nazywamy *aplikacją funkcji do tego termu*, albo krótko *aplikacją*.

W Leanie wszystkie termy, w tym również złożone, *muszą* mieć typ i ten typ musi być *unikalny*,
czyli *dokładnie jeden*. Ale nie każdy term *ma* typ, ponieważ można skonstruować termy *błędne*, to
jest takie, których nie da się typować. Niektórzy mówią w takich sytuacjach *wyrażenie* i rezerwują
słowo "term" dla wyrażeń typowalnych czyli poprawnych. Wyrażenia skonstruowane z elementów języka
teorii typów, których typu nie da się jednoznacznie określić, można uznać za "bezsensowne".

Jeżeli obawiasz się, że napiszesz wyrażenia bezsensowne, to uspokajam, że prawie na pewno napiszesz
wiele bezsensownych fragmentów kodu. Im więcej piszesz, tym więcej bzdur napiszesz, jak zauważył
zdaje się ten przenikliwy obserwator ludzkiej natury Gombrowicz[^2]. To jest może zła wiadomość,
chociaż nie jestem tego pewien. Na pewno dobra wiadomość jest taka, że Lean Ci wtedy o tym powie.

Mam nadzieję, że od razu rzuca Ci się w oczy, że z wyrażeniem `1 nic_nie_robie` jest coś nie tak. W
końcu `1` nie jest funkcją, a więc nie da się aplikować termu `1`. To wyrażenie jest co prawda
sekwencją termów, można więc powiedzieć, że jest w pewnym sensie "wypowiedzią" w języku teorii
typów, ale nie jest poprawną wypowiedzią, ponieważ reguły typowania nie pozwalają automatycznie
rozstrzygnąć o typie tego wyrażenia. Czyli nie jest termem. Uprzedzam jednak, że czasem może mi się
zdarzyć, że użyję słowa "term" na określenie przynajmniej potencjalnie błędnego wyrażenia.

To, że aplikacja `nic_nie_robie 1` ma typ `Nat` też jest już dla Ciebie mam nadzieję oczywiste. W
końcu `nic_nie_robie` jest funkcją, która z dowolnej liczby naturalnej robi jakąś liczbę naturalną.
Ogólna reguła typowania, która pozwala rozstrzygnąć, że to jest term, mówi, że:

*Jeżli `M` i `N` to jakieś termy, a `A` i `B` to jakieś typy, to*  
(tutaj `M` to `nic_nie_robie`, `N` to `1`, a `A` i `B` to `Nat`)

*jeżeli `M : A → B`*  
(tutaj `nic_nie_robie : Nat → Nat`)

*i `N : A`*,  
(tutaj `1 : Nat`),

*to `M N : B`.*  
(`nic_nie_robie 1 : Nat`)

Ta reguła mówi, że sekwencja dwóch termów o takiej strukturze typów jest typowalna, a więc jest
termem (złożonym), i ma typ `B`. Podobnie *1 + 2* jest jednocześnie 1. złożonym wyrażeniem, 2.
termem, 3. aplikacją funkcji `+` do dwóch argumentów, jak również 4. liczbą naturalną, bo to
wyrażenie oznacza (to jest daje po zredukowaniu) liczbę naturalną; wszędzie, gdzie może się pojawić
*dowolna* liczba naturalna, *1 + 2* również może się pojawić.

Funkcja `nic_nie_robie` to *identyczność*, inaczej funkcja identycznościowa. Ta funkcja może się
wydawać niepotrzebna, ale tak jak liczba zero, czasami okazuje się niezbędna. Na przykład wtedy, gdy
identyczność jest *rozwiązaniem* jakiegoś *problemu*.

**Potencjalnie dezorientująca dygresja**: Wiele problemów w matematyce można wyrazić jako zbiór
relacji między jakimiś funkcjami, z których co najmniej jedna funkcja jest nieznana i trzeba ją
znaleźć. Dokładnie tak, jak problem dotyczący liczb może polegać na tym, że mamy na przykład jakiś
układ równań z jedną lub wieloma niewiadomymi reprezentowanymi przez zmienne (np. `x + y = 1` i `y =
1`) i chcemy znaleźć wszystkie liczby spełniające te równania (tutaj tylko `x = 0`). Dany jest wtedy
zbiór relacji między *liczbami*, a nie funkcjami, ale sytuacja jest poza tym podobna, bo w obydwu
przypadkach szukamy pewnego rodzaju obiektów spełniających wymagania określone za pomocą pewnych
relacji. Okazuje się wtedy czasami, że przynajmniej jedna niewiadoma może przyjąć wartość zero, i
wtedy zero bardzo się przydaje. Gdy problem polega na szukaniu *funkcji* spełniających określone
wymagania, może się okazać, że jednym z rozwiązań jest funkcja, która nic nie robi. Między innymi
dlatego takie funkcje są czasem niezbędne.

## Potęga typów zależnych

Nasza funkcja identycznościowa jest ograniczona w tym znaczeniu, że dotyczy tylko liczb naturalnych,
a przecież pojęcie *uniwersalnej* funkcji identycznościowej, która zwraca bez zmian termy *dowolnego
typu*, wydaje się całkiem sensowne. Żeby uzyskać ogólniejszą identyczność napiszemy tak:

```lean
def identycznosc (typ : Type) (a : typ) : typ := a
```

Ta funkcja ma *dwa* parametry, ponieważ jest *bardziej* (ale jeszcze nie całkiem, o czym kiedy
indziej) uniwersalną identycznością, a ponieważ jest funkcją teoriotypową, potrzebuje więcej
informacji. W teorii typów każdy term musi mieć typ, dlatego ta funkcja wymaga podania najpierw typu
argumentu, wartość którego ma potem zwrócić bez zmian. Żeby zastosować tą funkcję na przykład do
liczby naturalnej `1`, musimy ją najpierw poinformować, że dostanie term o typie liczba naturalna,
jako pierwszy argument podając term `Nat`. Gdy po skopiowaniu również poniższego kodu umieścisz
kursor nad słowem `#eval`, to zobaczysz, że gdy ta funkcja jest poinformowana o typie termu, który
dostanie jako drugi argument, zwraca ten argument:

```lean
#eval identycznosc Nat 1 -- `1`
```

Żeby zilustrować uniwersalność tej identyczności zastosujemy ją jeszcze do (pewnego
termu)[https://pl.wikipedia.org/wiki/42_(liczba)] typu `String`:

```lean
#eval identycznosc String "czterdzieści dwa" -- `"czterdzieści dwa"`
```

Ponieważ będę teraz objaśniał **najtrudniejsze pojęcie w tym rozdziale**, przypominam: Jeżeli
poczujesz, że trudno Ci to zrozumieć, być może najlepszą strategią będzie albo czytać dalej, albo
wrócić po przerwie do poprzednich fragmentów i *poczekać*, aż wszystko będzie się [powoli stawało
coraz bardziej
jasne](https://people.math.harvard.edu/~knill/teaching/math22b2019/handouts/lecture15.pdf). I przede
wszystkim unikaj proszę *frustracji*, bo frustracja nie sprzyja wytrwałości, a liczymy głównie na
*powolne* zmiany zachodzące w tak zwanej pamięci *trwałej*.

<hr>

**O analogii między wielokrotnym czytaniem o matematyce i słuchaniem muzyki**: Rozumienie matematyki
to naprawdę w niemałym stopniu kwestia *przyzwyczajenia*, a przede wszystkim *pamięci* (trwałej).
Jeśli zdarzy Ci się czytać te same fragmenty ponownie, może spróbuj czasami czytać je celowo
*niespiesznie*. Polecam szczególnie spróbować to zrobić z jakąś dobrze napisaną książką. Czytanie
powoli fragmentów, *które już się nieźle zrozumiało*, to szczególne doświadczenie, podobne moim
zdaniem do wielokrotnego słuchania tego samego utworu muzycznego. W przypadku muzyki *popularnej*
takie wielokrotne słuchanie może być i często bywa przyjemne, ale ponieważ muzyka popularna ma
prostą strukturę, zwykle niewiele się wtedy zmienia.

Z muzyką tak zwaną "poważną", "klasyczną", albo "ambitną" jest inaczej. Ponieważ struktura tego
rodzaju muzyki jest bardziej złożona niż struktura muzyki popularnej, utwory często początkowo
brzmią jak takie bezduszne, płaskie, nudnawe i męczące ciamkanie, plumkanie, lub wycie; dopiero po
wielokrotnym, być może znacznie rozłożonym w czasie kontakcie, gdy struktura takich utworów zdąży
się dobrze utrwalić w pamięci, można zacząć słyszeć i czuć zawarty w nich "muzyczny sens".

Jeżeli lubisz muzykę, a zakładam, że prawdopodobnie tak, to pewnie zdążyłaś już zauważyć, że te
utwory, które od razu wpadają nam w ucho, często szybko stają się nudne, a te, które zaczynamy lubić
dopiero po pewnym czasie, zwykle podobają nam się dłużej i bardziej je sobie cenimy. To, że muzyka
"poważna", podobnie jak matematyka, jest często *początkowo* nieprzystępna, to cena, jaką płacimy za
*złożoność*. Zyskujemy za to potencjalnie głębszą i bardziej trwałą satysfakcję. Jeżeli chcesz się
przekonać, jak to może działać w przypadku muzyki, możesz na przykład spróbować posłuchać
niezobowiązująco (to znaczy, nie starając się usłyszeć "o co chodzi", tylko zdając się na działanie
czasu i pamięci), powiedzmy jeden raz każdego dnia, nie dłużej niż przez około dwa tygodnie, na
przykład [tego](https://music.youtube.com/playlist?list=OLAK5uy_n9W5GrHqSOorLnpUmah4lZCLoX2DT0Suw),
początkowo dosyć nieprzystępnego utworu. Niewykluczone, że po kilku dniach przyda się wtedy nieco
dłuższa przerwa, żeby efekt zmęczenia słuchaniem codziennie tego samego ustąpił. Może przytrafi Ci
się wtedy wgląd, dzięki któremu stanie się dla Ciebie oczywiste, dlaczego cykl, którego ten utwór
jest częścią, Schoenberg nazwał [suitą](https://pl.wikipedia.org/wiki/Suita). A gdy to nastąpi,
słuchanie tej subtelnie złożonej muzyki stanie się moim zdaniem doświadczeniem podobnym do
niespiesznego czytania po raz kolejny dobrze napisanego tekstu dotyczącego złożonych zagadnień
technicznych, który zdążyło się już nieźle zrozumieć.

Postanowiłem o tym napisać, bo jadąc niedawno autobusem, bez specjalnego powodu rzuciłem okiem na
pierwsze rozdziały znakomitej książki *Topoi: The Categorical Analysis of Logic* [Roberta
Goldblatta](https://en.wikipedia.org/wiki/Robert_Goldblatt), dostępnej na przykład
[tutaj](https://projecteuclid.org/ebooks/books-by-independent-authors/Topoi-The-Categorial-Analysis-of-Logic/toc/bia/1403013939),
którą czytałem dość dawno temu, a do której jakiś czas temu wróciłem, żeby na nowo zrobić trochę
notatek i pewne rzeczy zacząć po raz kolejny powtarzać. Ponieważ znałem te rozdziały dość dobrze i
tematyka nie była mi obca, mogłem czytać zupełnie inaczej, niż gdybym nie był w ten sposób
przygotowany. I pierwszą rzeczą, na którą zwróciłem uwagę, był *styl* i jednocześnie *ton*.

Dzięki temu, że nie musiałem się starać, żeby nadążyć za *treścią*, mogłem wreszcie docenić tą moim
zdaniem znakomitą *prozę*, doświadczając w ten sposób nowego rodzaju przyjemności. Miałem wrażenie,
że niemal słyszę ton autora i wreszcie "łapię", kiedy na przykład Golblatt w pewien sposób buduje
napięcie przed ujawnieniem jakiejś większej niespodzianki. Ale być może najcenniejszym skutkiem
takiego ponownego czytania trudnego tekstu, który się już w miarę dobrze poznało, jest łatwość
myślenia o poruszanych tematach jakby z lotu ptaka, ponieważ wie się wtedy mniej więcej, jaką rolę
czytany właśnie fragment odgrywa w ramach większej całości. Podobnie, kolejne fragmenty złożonego, a
przez to wymagającego wstępnego oswojenia się (czy może "opamiętania"?) utworu muzycznego, który już
się dobrze poznało, nabierają emocjonalnego wyrazu właśnie dzięki temu, że czuje się, *bo dobrze się
pamięta*, "skąd" te fragmenty "się wzięły" i "dokąd to wszystko zmierza".

<hr>

Wracając do Leana, nowa wersja funkcji identycznościowej *działa dla* (niemal, o czym kiedy indziej)
*dowolnego typu* dzięki temu, że *typ* drugiego parametru i zarazem jej *rezultatu* jest jej
(pierwszym) *parametrem*. To przykład *typu zależnego*, ponieważ *typ zależy od czegoś zmiennego*,
to jest od wartości parametru. Język teorii typów, którego używamy pisząc w Leanie i innych
podobnych asystentach dowodzenia, swoją ekspresyjność zawdzięcza przede wszystkim obecności właśnie
takich typów.

Jeszcze raz: *Typ* drugiego parametru jest *wartością* (czyli *zależy od*) pierwszego *parametru*.

**Parametry i argumenty**: *Parametr* jest częścią definicji funkcji, którą można rozumieć jako
(typowane) wejście, a więc jest własnością samej funkcji, natomiast *argument* (*funkcji*, albo
lepiej *aplikacji* {funkcji}) to term, do którego ta funkcja jest akurat aplikowana (ilustracja):

```lean
-- `n` jest tutaj *parametrem*. Nie kopiuj tego kodu, jeżeli wprowadziłaś już definicję tej funkcji.
def nic_nie_robie (n : Nat) : Nat := 
    -- To jest *ciało* tej funkcji, tylko zapisane w następnej linijce. Mamy tu *zmienną* `n`,
    -- będącą jednocześnie *parametrem* tej funkcji:
    n

-- Tutaj `1` jest *argumentem* (aplikacji funkcji `nic_nie_robie`). To jest *tylko* aplikacja, bo
-- sprawdzając typ nie wymuszamy ewaluacji. Dlatego wszystkie obliczenia, które muszą zajść, żeby
-- *ustalić typ* tej aplikacji, rozgrywają się tylko *po stronie typu*:
#check nic_nie_robie 1

-- Gdy wymuszamy *ewaluację*, otrzymujemy *rezultat* tej aplikacji, czyli najprostszą postać termu,
-- (tak zwaną postać normalną), do której to wyrażenie można zredukować:
#eval nic_nie_robie 1 -- 1
```

## Obliczenia w dwóch wymiarach

Zarówno funkcja `identycznosc`, jak i jej głupsza siostra `nic_nie_robie` pozwalają zobaczyć, że w
Leanie zachodzą *dwa* rodzaje obliczeń: Funkcja `nic_nie_robie` ma typ `Nat → Nat`. Gdy *aplikujemy*
ją do termu `1`, żadne obliczenie *wewnątrz* czy raczej *za pomocą* tej funkcji jeszcze nie
zachodzi, bo takie "wewnętrzne" obliczenie polega na *ewaluacji*. W ramach samej aplikacji
`nic_nie_robie 1` zachodzi jednak (można powiedzieć, że "w tle", albo "na zewnątrz")
*przekształcenie typu* z `Nat → Nat` do `Nat`, co też jest pewnego rodzaju obliczeniem:

```lean
#check @nic_nie_robie  -- `nic_nie_robie : Nat → Nat`

-- Przed chwilą było `Nat → Nat`, a na skutek (zapisanej przez nas) aplikacji pojawia się już tylko
-- samo `Nat`. To też można traktować jako pewnego rodzaju obliczenie (które nie zaszłoby bez
-- udziału autora kodu).
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
funkcja ma typ *zależny*:

```lean
#check @identycznosc       -- `identycznosc : (typ : Type) → typ → typ`

#check @identycznosc Nat 1 -- `@identycznosc Nat 1 : Nat`
```

Poza samym *oderwaniem* typów odpowiadających dwóm podanym argumentom następuje tutaj również
*podstawianie na poziomie typu*. Warto chociaż raz rozpisać ten proces na kroki:

W ramach (a może na skutek?) aplikacji, argument `Nat` staje się *wartością parametru* `typ`. To
samo słowo `typ` występuje jednak później w *specyfikacji typu* stałej `identycznosc`. A skoro to
późniejsze wystąpienie słowa `typ` jest częścią definicji tej samej funkcji, to słowo `typ`
występuje tam w roli *zmiennej*. Gdy definicję uogólnionej identyczności zapiszemy tak, ...

```lean
def identycznosc : (typ : Type) → typ → typ :=
    fun (typ : Type) =>
        fun (a : typ) =>
            a
```

... możemy zobaczyć, że `identycznosc` tworzy wyspecjalizowaną wersję "wewnętrznej" identyczności na
podstawie podanego typu, i możemy sobie wyobrazić, że między *czwartym*, ale również będącym
*deklaracją* wystąpieniem słowa `typ` (drugie wystąpienie fragmentu `(typ : Type)`) i wystąpieniem
piątym (`(a : typ)`) w roli zmiennej istnieje "wirtualne połączenie" albo "przewód". To może być
początkowo dezorientujące między innymi dlatego, że deklaracja `(typ : Type)` pojawia się dwa razy.
Jest tak dlatego, że w przypadku typów zależnych mamy do czynienia z *tymi samymi zmiennymi*, czyli
*połączonymi z tym samym wejściem miejscami do wypełnienia* (przez termy odpowiedniego typu),
występującymi zarówno w specyfikacji *typu* definiowanej stałej jak i w *ciele* definicji.

*Sam typ* funkcji `identycznosc` (nie funkcji {będącej rezultatem aplikacji} `identycznosc Nat`), to
jest `(typ : Type) → (a : typ) → typ`, jest więc *czymś w rodzaju funkcji* (jeszcze raz: sam typ
jest tutaj czymś w rodzaju funkcji), której parametr nosi nazwę `typ`. To *nie* jest funkcja w tym
znaczeniu, że *typu* nie możemy w Leanie do niczego aplikować, ale *na etapie aplikacji termu tego
typu* ten typ działa tak, jakby był funkcją i jakby ta funkcja była do czegoś aplikowana. A więc to
jest *coś w rodzaju* ewaluacji zachodzącej automatycznie w ramach aplikacji termów, które mają typ
zależny. Nie przejmuj się, jeżeli mimo moich zapewnień, że to naturalny proces, wydaje Ci się to
zbyt trudne; z czasem się do tego przyzwyczaisz, a nawet pewnie zapomnisz, czemu początkowo to Ci
się zdawało trudne.

## Funkcje

Do pewnego momentu będę mówił o funkcjach rozumianych tylko jako efektywne procedury obliczeniowe,
albo po prostu przepisy, programy, procesy, albo algorytmy (czyli jakby "abstrakcyjne mechanizmy"
albo "maszyny"). Potem zacznę mówić też o *implikacji*. Mam powody, żeby zacząć od funkcji, a potem
mówić o implikacjach, ale trudno mi te powody dobrze wyjaśnić już teraz, bo nie mogę zakładać, że
wiesz o pewnych sprawach, bez znajomości których moje wyjaśnienia byłyby pewnie niezrozumiałe,
nieprzekonujące, a może nawet mogłyby budzić niepokój (cel jest ambitny, ale bez obaw, dotrzemy do
niego bez pośpiechu i zarazem *relatywnie* szybko i bezboleśnie).

Na razie powiem tylko tyle: Istnieje sposób, żeby niemal równolegle uczyć się współczesnych podstaw
matematyki, programowania, formalizowania treści wyrażonych w języku naturalnym, konstruowania
dowodów matematycznych, jednocześnie konwekwentnego, elastycznego i wieloaspektowego abstrakcyjnego
myślenia, a później - dzięki tym wszystkim prerekwizytom w niemal porywającym tempie -
matematycznych podstaw współczesnej metodologii badań, to jest wnioskowania statystycznego,
testowania hipotez, wnioskowania przyczynowego, teorii pomiaru, a wszystko to w interakcji z
programem, który w tym pomaga, takim jak Lean. Postaram się, żeby ta nauka była dla Ciebie możliwie
łatwa, przyjemna i pożyteczna, a gdyby w którymś momencie mi się to nie udało, będę wdzięczny, jeśli
mi o tym powiesz, bo bez tego rodzaju informacji trudno będzie mi to zrobić lepiej.

Żeby skorzystać z tego sposobu na matematykę i metodologię badań, a jak się okaże w rozdziałach od
29 w górę, w niemałym stopnia również na całą psychologię, trzeba się *powoli przyzwyczajać* do
*nowych sposobów myślenia*, do których służą rozmaite *sztuczne języki*, czyli języki *formalne*.
Jeden z tych sposobów, do którego między innymi znakomicie nadaje się język teorii typów, polega na
patrzeniu na funkcje, programy, a niebawem również na implikacje, jako na jedno i to samo.

**Polecenie**: Przyjżyj się temu fragmentowi kodu, a następnie spróbuj go odczytać "po ludzku" i
przepisać z pamięci. Jeżeli na tym etapie przepisanie z pamięci jest zbyt trudne, to albo go po
prostu skopiuj, albo spróbuj później, gdy już poczujesz, że *masz ochotę* znowu spróbować:

```lean
def suma (n : Nat) (m : Nat) : Nat := n + m
```

Czy widzisz, że w tej definicji nie ma typów zależnych? Można powiedzieć, że brak typów zależnych
polega na tym, że "wirtualne przewody" (tutaj `n` i `m`) łączą wejścia *tylko* z miejscami w *ciele*
funkcji (tutaj `n + m`), a nie z miejscami w specyfikacji jej *typu*.

**Czytamy to**: Definiuję (`def`) wartość/znaczenie/treść stałej suma (`suma`) o typie funkcja dwóch
parametrów typu liczba naturalna (`(n : Nat) (m : Nat)`), której rezultat też jest typu `Nat` (`:
Nat`), czyli też jest liczbą naturalną. A więc wszystko między definiowanym symbolem (tutaj `suma`)
a symbolem definiowania `:=` jest określeniem *typu*, a nie treści (oficjalnie: *ciała*) definicji.

**Czytamy dalej**: Ten term konstruuję/definiuję (`:=`) jako zastosowanie funkcji `+`, bo to też
jest pewna funkcja, do pierwszego i drugiego parametru (albo wejścia albo nawet - pamiętając, o co
chodzi - argumentu), które to parametry nazwałam `n` i `m`, bo zauważyłam, że inni matematycy często
stosują tą konwencję, gdy piszą o liczbach naturalnych.

**Nazwy parametrów funkcji nie mają znaczenia** w tym sensie, że na przykład taka ...

```lean
-- ... alternatywna definicja (z apostrofem w nazwie, żeby uniknąć konfliktu definicji) ...
def suma' (a : Nat) (b : Nat) : Nat := a + b
```

... jest ewidentnie *tą samą*, tylko *inaczej zapisaną funkcją*. Gdy parametry i zmienne postrzegamy
jako korzenie i liście drzew wirtualnych przewodów, ten fakt staje się chyba oczywisty. Jak się
zresztą przekonasz w jednym z późniejszych rozdziałów, możemy łatwo *udowodnić* w Leanie, że to ta
sama funkcja. Ta funkcja jest też inaczej nazwana, bo nie możemy w tym samym kontekście ponownie
definiować tych samych symboli.

**Ostateczność definicji**: Gdy raz zdefiniujemy jakiś symbol, tutaj symbole `suma` i `suma'`, nie
możemy już więcej w tym samym kontekście (a mówiąc dokładniej w tej samej [*przestrzeni
nazw*](https://pl.wikipedia.org/wiki/Przestrze%C5%84_nazw), ale o tym później) zmienić jego
definicji, chyba że najpierw usuniemy poprzednią definicję. Dlatego właśnie symbole, które są już
zdefiniowane, nazywamy *stałymi*.

**Za to zmienne są ...zmienne**: Nazwy *parametrów* nie są stałymi, tylko *zmiennymi*, bo możemy im
*wielokrotnie* przypisywać, a mówiąc dokładniej *podstawiać* pod nie czy za nie dowolne *argumenty*
typu wymaganego przez definicję funkcji. I tak, możemy zastosować funkcję `suma` do termów `3` i
`5`, i wtedy te termy "wskoczą" w miejsce pierwszego i drugiego parametru, a właściwie w miejsca
wystąpień zmiennych odpowiadających tym parametrom/wejściom. Możemy potem zastosować tą samą funkcję
jeszcze raz, ale do innych termów i wtedy (i w tym miejscu) te inne termy (w ramach ewaluacji kodu)
wskoczą w miejsce *tych samych* parametrów/zmiennych. Parametry są więc *zmiennymi wejściami*, a
zmienne są połączeniami miejsc w kodzie z tymi wejściami, bo te same parametry tej samej funkcji
mogą się w pewnym sensie zmieniać, to jest "przyjmować" różne wartości w różnych "sytuacjach", a
wartości parametrów są zawsze takie same jak wartości odpowiadających im zmiennych w danym ciele.

**Polecenie**: Sprawdź typ aplikacji funkcji `suma` do dwóch liczb naturalnych, wszystko jedno
jakich, a następnie ewaluuj tą aplikację. Upewnij się, czy rozumiesz komunikaty pojawiające się w
panelu po prawej.

Żeby utrwalić sobie to, co do tej pory wyjaśniłem, rozważ proszę jeszcze taką oto funkcję:

```lean
def dodaj2 (a : Nat) : Nat := a + 2
```

Jesteś już w stanie zobaczyć tu szybko (jedyny) "wirtualny przewód"?

**Polecenie**: Spróbuj odczytać samodzielnie sens tej defincji, opierając się na fragmencie, w
którym objaśniłem, jak się takie definicje czyta. Może nawet zrób to na głos? Dzięki temu nie tylko
upewnisz się, czy właściwy sposób czytania jest dla Ciebie jasny, ale dodatkowo małym kosztem
zwiększysz łatwość, z jaką będziesz przetwarzać strukturę takich definicji w przyszłości.

Przypuszczam, że teraz już od razu widzisz, jak ta funkcja działa, nawet jeśli jeszcze niedawno nie
wiedziałaś, że język Lean istnieje. Zgaduję też, że jest już dla Ciebie oczywiste, że *nazwa*
parametru (tutaj `a`) nie ma znaczenia dla "sensu" (ani tożsamości) funkcji; ta nazwa służy *tylko*
do tego, żeby można było wewnątrz ciała funkcji (całe ciało funkcji `dodaj2` to `a + 2`) "mówić" o
ewentualnym argumencie. Podsumowując, można (i moim zdaniem warto) powiedzieć, że:

*Nazwy parametrów pełnią rolę zaimków, a nazwy stałych pełnią rolę nazw własnych*.

**Polecenie**: Spróbuj przepisać definicję stałej `dodaj2` z pamięci, żeby struktura takich
definicji zaczęła Ci się lepiej utrwalać, i żebyś mogła ją szybciej mentalnie przetwarzać. Jeżeli Ci
się to nie uda, popatrz znowu na tą definicję, przełącz się na okno, w którym działa serwer Leana,
tak, żeby nie było jej widać, i spróbuj ponownie. I tak do skutku, uważając oczywiście na
frustrację, nudę i zmęczenie. To Ci prawdopodobnie pomoże w przyswajaniu dalszych treści. Gdy już Ci
się uda, sprawdź typ stałej `dodaj2`, raz poprzedzając ją symbolem `@`, a raz nie. Sprawdź też typ
aplikacji tej stałej do wybranej liczby naturalnej. A na koniec ewaluuj tą aplikację. Za każdym
razem popatrz na rezultat w panelu po prawej, upewniając się w ten sposób, czy wszystko się zgadza.

**Ewaluacja aplikacji krok po kroku**: Mówiąc w pewnym uproszczeniu, gdy umieścisz kursor nad
komendą `#eval` w instrukcji `#eval dodaj2 2`, wtedy Lean:

1. Ewaluuje, czyli redukuje do najprostszej postaci, argument tej aplikacji. Tutaj jest tylko jeden
argument, `2`, który może być zredukowany, a właściwie zastąpiony przez coś innego za pomocą nieco
innego procesu niż redukcja, ale o tym, co "kryje się" pod liczbą `2` powiem za chwilę, a o tym
innym procesie, który polega na *kontrolowanej wieloznaczności* odpowiadającej temu, co w praktyce
często robią matematycy, powiem więcej znacznie później.

2. Podstawia rezultat tej redukcji pod zmienną `a` w ciele funkcji, bo `a` jest (tutaj jedynym)
parametrem funkcji `dodaj2`. W ten sposób powstaje `2 + 2` (posługując się dalej znaną Ci notacją
cyfrową).

3. Wreszcie ewaluuje uzyskaną w ten sposób wersję ciała funkcji, co może wymagać dalszych ewaluacji,
aż nie będzie się dało, albo nie będzie warto redukować niczego więcej do prostszej postaci.

Wydaje mi się, że mniej więcej czegoś takiego się spodziewałaś, może pomijając to, jak są
zdefiniowane liczby naturalne, a także dodawanie liczb naturalnych, o którym jeszcze nie mówiłem, a
które ma w Leanie, podobnie jak same liczby naturalne, piękną definicję rekurencyjną. Jeżeli chcesz
się dowiedzieć czegoś więcej o definicji liczb naturalnych jaką stosuje Lean, możesz samodzielnie
poszukać informacji na temat aksjomatów Peano. Ja wyjaśnię teraz tylko tyle:

<hr>

## Liczby naturalne w Leanie

Zgodnie z aksjomatami Peano, liczby naturalne w Leanie to dokładnie obiekty powstające z czegoś, co
możemy nazywać *zerem*, a do czego możemy dowolnie wiele razy zastosować operację dającą *następną
liczbę naturalną*. Można by to zapisać na przykład tak: `0, n0, nn0, nnn0, ...`, gdzie `0` możemy
traktować jako zero, `n0` jako `1`, `nn0` jako `2`, i tak dalej. Równie dobrze moglibyśmy jako
liczby naturalne traktować też na przykład dowolne skończone ciągi gwiazdek, to jest `*`, `**`,
`***`, i tak dalej, ale wtedy musielibyśmy pamiętać, że pojedyncza gwiazdka ma działać jak zero, co
byłoby chyba nieintuicyjne.

No więc symbol `0` jest przez Leana interpretowany jako zapisana w inny sposób, *nieredukowalna*
stała `Nat.zero`. Podkreślam, że `Nat.zero` to w Leanie *tylko pewien napis*, nic więcej. Zwykle
zapisujemy tą liczbę jako `0`, ale zapis za pomocą cyfr arabskich istnieje tylko dla naszej *wygody*
i nie decyduje o tym, czym *są* liczby naturalne (albo co jest liczbą naturalną). Liczba naturalna
`1` odpowiada w Leanie *nieredukowalnej aplikacji* funkcji następnika `Nat.succ` do stałej
`Nat.zero`, to jest `Nat.succ Nat.zero`. **Czytamy to**: *Następna* (stąd nazwa "następnik") *liczba
naturalna po liczbie zero*. Podkreślam, że ta aplikacja jest również *nieredukowalna*, co znaczy, że
gdy pojawi się w trakcie ewaluacji jako rezultat, ta część ewaluacji na niej się zakończy. Innymi
słowy, ta aplikacja istnieje tylko po to, żeby można było ją *zapisać*, podać jako argument, albo
zwrócić jako rezultat, bo *sama aplikacja* `Nat.succ Nat.zero` (a nie jakaś jej wartość, której po
prostu nie ma) *jest dla Leana liczbą `1`*.

Czy widzisz podobieństwo między tym sposobem definiowania liczb naturalnych a wspomnianymi wcześniej
sposobami polegającymi na zapisywaniu ich jako skończonych ciągów (w tym również ciągu pustego)
złożonych z symbolu `n` i zaczynających się od symbolu `0`? To jest (funkcjonalnie) ten sam
*sposób*, tylko nieco inaczej *zrealizowany*.

Zastanawiasz się może, o co w tym chodzi? Spróbuję to wyjaśnić tak: Gdyby przedstawiciele obcej
cywilizacji wymyślili "obiekty abstrakcyjne", których *używaliby* tak samo, jak my używamy liczb
naturalnych, ale zapisywaliby i nazywali je inaczej, powiedzielibyśmy, że to są te same "obiekty
abstrakcyjne", albo, że mają "ten sam *sens*", tylko są inaczej *nazywane*, albo inaczej
*wyglądają*, prawda? Jesteśmy co prawda przyzwyczajeni do zapisu za pomocą cyfr arabskich, ale
sposób, w jaki coś zapisujemy, nie decyduje o *znaczeniu*; o tym decyduje sposób *użycia*.

Nieredukowalna stała `Nat.zero` i nieredukowalne aplikacje takie jak `Nat.succ Nat.zero` całkiem
dosłownie *są* więc liczbami naturalnymi, tak samo jak `0` i `1` *są* liczbami naturalnymi,
dokładnie dlatego, że *możemy ich używać* jako liczb naturalnych. Wbrew pozorom, ten fakt nie ma
*nic* wspólnego z zapisem. Możemy traktować termy takie jak `Nat.zero` i `Nat.succ Nat.zero` jako
liczby naturalne, ponieważ wszystkie *operacje*, jakie możemy *wykonywać* na liczbach naturalnych,
możemy *wykonywać* na tych termach, uzyskując wyniki zgodne z interpretacją: `0` to (to samo co)
`Nat.zero`, `1` to `Nat.succ Nat.zero`, `2` to `Nat.suc (Nat.succ Nat.zero)`, i tak dalej. Zapis nie
ma tu znaczenia, poza tym, że może być mniej lub bardziej *wygodny* do pewnych zastosowań.

Już ostatni raz: Sam *nieredukowalny fragment kodu* albo *zapis* aplikacji `Nat.succ Nat.zero`
*jest* liczbą `1`. Nie wiem, czy to Cię zaskakuje, ale sądzę, że może zaskakiwać. Kiedy się o tym
uczyłem, na początku spodziewałem się, że coś, co wygląda jak aplikacja, będzie redukowalne do
jakiegoś wyniku (tej aplikacji) i że to coś będzie "kryło pod sobą" jakąś "prawdziwą" funkcję i
jakąś "prawdziwą" liczbę jako argument, i że tych "prawdziwych rzeczy" będzie można użyć, żeby coś
obliczyć. Wydaje się przecież, że skoro `Nat.succ Nat.zero` *jest aplikają* i zarazem coś *znaczy*,
to powinno być coś "pod spodem" `Nat.succ Nat.zero`, i tym czymś powinna być albo para złożona z
funkcji i liczby, albo jakaś liczba *1* jako taka, czy może "sama w sobie".

To, że *nic* pod spodem nie ma, to dobra wiadomość, bo oznacza, że *nie ma tu tajemnic*, poza tymi
licznymi i fascynującymi tajemnicami, które kryją się *ponad* zapisami w *nas*, to jest w twórcach i
użytkownikach tych termów, wyrażeń i języków, a które to tajemnice są przedmiotem badań
*psychologii*, a nie matematyki. W "czystej" matematyce mamy tylko *struktury złożone z symboli i
dopuszczalne sposoby ich konstruowania i przekształcania*. To taka rozległa pustka, a w niej nic
świętego[^3]. Można powiedzieć, że tym właśnie jest *matematyka formalna*, niczym więcej, gdy tylko
pominiemy jej *interpretację*, którą zresztą możemy zmieniać na dowolną inną, byle spójną. A
właściwie na niespójną też możemy, ale wtedy może być trudno powiedzieć po co.

Te uwagi dotyczą jednak tylko *matematyki zastanej*, ponieważ, jak
[wiemy](https://pl.wikipedia.org/wiki/Problem_nierozstrzygalny), *tworzenie* nowej matematyki, w tym
*poszukiwanie* nie znanych wcześniej dowodów, ma w ogólnym przypadku z konieczności charakter
*niealgorytmizowalny*. A więc - *dowiedlnie* - tworzenie nowej matematyki zawsze będzie procesem do
pewnego stopnia *inherentnie* twórczym. Co zresztą *z definicji* czyni również i ten proces
przedmiotem badania psychologii.

<hr>

**Zasięg nazw**: Gdybyś teraz w kolejnej linii wkleiła do Leana kod `#eval n`, to zobaczyłabyś
komuikat o błędzie, ponieważ `n` i `m` to w tym momencie *tylko* parametry funkcji `suma`, a więc
tylko jej oznaczone arbitralnie *wejścia*, które jako takie są *widoczne tylko z wnętrza ciała*
funkcji `suma` (które to ciało składa się akurat z wyrażenia `n + m`).

**Polecenie**: Napisz w nowej linii `#eval n`. Zobaczysz wtedy, że symbol `n` będzie podkreślony
czerwoną falką. Usuń ten błędny kod. W ten sposób Lean sygnalizuje, że nie wie, o czym mówisz, a nie
wie, bo symbol `n` jest widoczny tylko wewnątrz ciała funkcji `suma`. Tak właśnie, między innymi,
działa [*zasięg nazw*](https://pl.wikipedia.org/wiki/Zasi%C4%99g_(programowanie)), czyli *zakres
widoczności* określonych definicji lub "ról" nazw w kodzie.

**Metafora funkcji jako maszyny albo mechanizmu**: Warto chociaż raz spróbować sobie wyobrazić, że
ciało funkcji to pewien mechanizm albo mały robot, który ma nad sobą otwory, przez które może
dostawać różne obiekty (będące w danym momencie argumentami aplikacji funkcji). Te obiekty są dla
niego zawsze *opakowane*, to jest bliżej nieokreślone/jakieś, a więc nie wie, jak dokładnie
wyglądają, wie tylko, że to są obiekty, które wpadły przez taki albo inny otwór, a więc muszą mieć
kształt (typ) zgodny z kształtem (typem) otworu, przez który wpadły. A to pozwala mu określić, co
może, a czego nie może z tymi obiektami robić.

Jeżeli to jest robot pracujący wewnątrz funkcji `suma`, to gdy dostanie dwie liczby, dla niego to
będą tylko dwa opakowane obiekty, o których będzie wiedział tyle, że mają typ `Nat` i będzie też
wiedział, który jest pierwszy albo lewy, a który drugi albo prawy, bo na opakowaniach będzie widział
nazwy `n` i `m`. Nie będzie nawet wiedział, czy dwa różnie oznaczone obiekty tego samego typu są
*różne*, i tutaj metafora nieprzezroczystych opakowań niestety się sypie (za to metafora wirtualnych
połączeń albo przewodów nadal jest akceptowalna). W przypadku funkcji `suma`, wszystko, co ten robot
(nomen omen) robi, to delegowanie dalszego przetwarzania argumentów do niezależnie zdefiniowanej
funkcji o nazwie `+`.

Albo, nieco bardziej abstrakcyjnie, możemy myśleć o funkcji takiej jak `suma` jako o "pudełku",
które ma dwa wejścia, jedno oznaczone literą `n`, a drugie literą `m`, i które ma jedno wyjście, a w
środku ma "mechanizm dodający" obiekty pojawiające się na wejściach. Jeżeli wyobrazimy sobie, że ten
wewnętrzny mechanizm jest "przyklejony" do wejść lub połączony z nimi, to stanie się jasne, że
*nazwy* wejść nie mają znaczenia i istnieją tylko dla wygody *czytelników kodu*, czyli naszej.

Za to *typy* wejść i *typ* wyjścia (funkcje mają zawsze tylko jedno wyjście, a w Leanie tak naprawdę
również tylko jedno wejście) *mają* znaczenie, ale tylko na etapie *konstruowania* kodu, kiedy
decydują o tym, które wyrażenia są termami, czyli są poprawne, czyli typowalne. Można sobie
wyobrazić, że typy wejść i typ wyjścia to kształty otworów funkcji jako pudełka. Nie możemy podawać
na wejściu (konstruować aplikacji) funkcji `suma` (do) czegokolwiek - muszą to być termy typu `Nat`.
Można więc powiedzieć, że funkcje w teorii typów są zawsze w jakiś sposób *wyspecjalizowane*: Jeżeli
podamy na wejściu dwa wyrażenia typu liczba naturalna, to gdy tylko wymusimy ewaluację, na wyjściu
pojawi się liczba naturalna, i już samo to ograniczenie jest pewną specjalizacją.

Metafora funkcji jako mechanizmu w pudełku ma jeszcze inne ograniczenia. Jak już wiesz, wyliczenie
rezultatu aplikacji funkcji polega tak naprawdę na ewaluacji argumentów, następnie na podstawieniu
ich zredukowanych postaci pod odpowiednie zmienne (w odpowiednie miejsca) w ciele funkcji, i na
ewaluacji (czyli redukcji) uzyskanej w ten sposób wersji ciała funkcji, aż do ostatecznego, to jest
nieredukowalnego skutku. Można więc powiedzieć, że mechanizm obliczający działa w Leanie *na
zewnątrz definicji* funkcji, bo ta definicja nie jest tak naprawdę mechanizmem, tylko *przepisem*
mówiącym, co ma być zrobione z argumentami w ramach ewaluacji aplikacji. Mechanizmem jest więc tutaj
pewien "uniwersalny ewaluator" albo "reduktor", który używa dostarczonych mu definicji stałych i
redukuje napotykane aplikacje, traktując aplikacje i definicje jak przepisy określające, co ma
robić. I to jest w dodatku mechanizm "na korbkę", którą kręcimy *my*, ostateczni autorzy i
użytkownicy wszystkich tych przepisów.

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

-- Ponieważ argumenty są w *postaci normalnej*, to jest maksymalnie zredukowanej (tutaj właściwie
-- udajemy, że są), w tym momencie następuje rozpakowanie definicji stałej `suma`:
n + m

-- A ponieważ `5` ma być podstawione za zmienną `n` (pierwszy parametr), a `4` za zmienną `m` (drugi
-- parametr), to uzyskujemy taką wersję ciała:
5 + 4

-- W ten sam sposób przebiega ewaluacja aplikacji funkcji `+` do liczb `5` i `4`. Ewaluacja trwa do
-- momentu, gdy nic więcej nie będzie się dało lub nie będzie warto, redukować do prostszej postaci.
```

Ewaluacja całego tego wyrażenia zaczyna się od ewaluacji najbardziej *wewnętrznych* albo
zagnieżdżonych części argumentów: `(Nat.succ 3)` i `(2 + Nat.zero)`. Rezultatami tych ewaluacji są,
stosując zapis cyfrowy, liczby `4` (`1 + 3`) i `2` (`2 + 0`). To jednak nie koniec ewaluacji
argumentów, bo `(Nat.succ 3)` i `(2 + Nat.zero)` są tu argumentami pewnych aplikacji (funkcji
`Nat.succ` i funkcji `-`). Przypominam, że w tym kontekście `+` i `-` też oznaczają pewne
(dwuargumentowe) funkcje, tylko zapisane w *notacji infiksowej* (inaczej wzrostkowej) ...

`argument1 funkcja argument2`, na przykład `1 + 2`

... zamiast w *notacji prefiksowej* (inaczej przedrostkowej), ...

`funkcja argument1 argument2`, na przykład `suma 1 2`

... bo tak się zwykle zapisuje dodawanie i odejmowanie. Można i czasem warto nauczyć Leana, żeby
rozumiał taki zapis dla samodzielnie zdefiniowanych funkcji, takich jak na przykład `suma`, ale
zrobimy to kiedy indziej.

**Nawiasy w aplikacjach wieloargumentowych**: Jesteś w stanie domyślić się, na czym polega
wynikający z niejednoznaczności zapisu błąd, który Lean wykrywa w tym fragmencie kodu?

```lean
#eval suma Nat.succ 2 3
```

Funkcja `suma` wymaga argumentów typu `Nat`. Pierwszy argument aplikacji jest tu jednak *funkcją*
`Nat.succ`, a nie *liczbą naturalną*. Żeby ten kod był poprawny, trzeba otoczyć fragment `Nat.succ
2` nawiasami; wtedy pierwszy argument `(Nat.succ 2)` będzie miał typ `Nat`:

```lean
#eval suma (Nat.succ 2) 3
```

## Curry(ing)

**W Leanie nie ma funkcji "prawdziwie" dwuargumentowych**: Funkcja `suma` *wygląda* jak funkcja
dwuargumentowa i *do pewnego stopnia* tak się *zachowuje*, a więc *jest* dwuargumentowa, ale jest
funkcją dwuargumentową "z dodatkową funkcjonalnością", polegającą na możliwości częściowej
aplikacji, w ramach której można używać tej funkcji jako funkcji *jedno*argumentowej. Mówiąc wprost,
("funkcjonalnie" albo "zastosowaniowo") `suma` jest *jednocześnie* funkcją dwuargumentową i funkcją
jednoargumentową, która zwraca funkcję jednoargumentową (która dodaje jedyny parametr tej pierwszej
funkcji do swojego jedynego parametru).

Taki sposób definiowania funkcji więcej niż jednoargumentowych nazywa się *curryingiem*, od nazwiska
pewnego wybitnego [matematyka](https://en.wikipedia.org/wiki/Haskell_Curry), który pojawi się tu
jeszcze w znacznie poważniejszej roli.

**Polecenie**: Napisz kod pozwalający sprawdzić typ aplikacji funkcji `suma` do *jednego* argumentu
`10`. W prawym panelu zobaczysz wtedy komunikat:

```lean
suma 10 : Nat → Nat
```

Ten przykład może Ci się wydawać znajomy. Faktycznie, niedawno przyglądaliśmy się już tego rodzaju
częściowej aplikacji, ale wtedy używaliśmy dwuargumentowej funkcji `identycznosc`, aplikując ją
tylko do jednego termu `Nat`.

**Czytamy to**: Aplikacja funkcji `suma` do termu `10` ma typ `Nat → Nat`. Typ `Nat → Nat` mówi nam,
że cała ta częściowa aplikacja (`suma 10`) jest pełnowartościową (bo poprawną, to znaczy typowalną)
funkcją, przekształcającą liczby naturalne w liczby naturalne. Jaka to jest funkcja? Znamy definicję
stałej `suma`, domyślamy się więc, że `suma 10` to wyrażenie, które jakby czeka na brakujący
argument. Term złożony `suma 10` to zatem jednocześnie częściowa aplikacja i (po zredukowaniu)
funkcja jednoargumentowa, która do dowolnej liczby naturalnej dodaje `10` (dodaje `10` "od przodu",
bo "robi" `10 + m`).

**Polecenie**: Sprawdź typ stałej `suma`, ale poprzedzonej znakiem `@`, żeby się przekonać, że
`suma` ma typ, w którym występują *dwie strzałki*, bo to tak naprawdę funkcja, która przekształca
dowolną liczbę naturalną w funkcję, która z kolei przekształca dowolną liczbę naturalną w liczbę
naturalną.

**Sugestia**: Po przeczytaniu tego rozdziału i ewentualnym podjęciu prób wykonania niektórych lub
wszystkich poleceń warto chociaż raz wrócić do rozdziału poprzedniego, w którym pisałem o podobnych
sprawach, ale w inny sposób. Wydaje mi się, że dzięki temu dosyć szybko treści omówione w tych dwóch
rozdziałach staną się dla Ciebie w miarę jasne i nie będziesz ich musiała później prawie w ogóle
powtarzać, bo będziemy tego wszystkiego ciągle do czegoś używać.

**Tematy do powtarzania**: Wyrażenie, term, typ, typowalność, funkcja, parametr, zmienna, argument,
aplikacja, wystąpienie zmiennej jako miejsce w kodzie funkcji połączone z parametrem/wejściem o tej
samej nazwie, currying, ewaluacja/redukcja, typ zależny, uogólniona identyczność, definicja, stała,
ciało definicji a ciało funkcji.

### Przypisy

[^1]: *Typ funkcyjny* i *typ funkcji* to tylko dwie różne nazwy na to samo. W szczególności, typ
    funkcyjny nie jest funkcją, tylko typem (funkcji). Czasami nazwa "typ funkcyjny" brzmi lepiej,
    na przykład: "Funkcje to dokładnie takie termy, które mają typ funkcyjny" brzmi chyba lepiej lub
    mniej dezorientująco, niż "Funkcje to dokładnie takie termy, których typem jest jakiś typ
    funkcji".

[^2]: ... który być może pojawi się tu jeszcze w drugiej części, bo do pewnych rzeczy pasuje jak
    ulał, i którego większość książek przeczytałem jeszcze w późnej podstawówce, czego akurat nikomu
    *nie* polecam, bo zbyt wczesny kontakt z Gombrowiczem niekoniecznie sprzyja socjalizacji. Jeżeli
    więc czytają to jacyś aktualni lub przyszli rodzice, to sugeruję, żeby Gombrowicza dzieciom
    stanowczo zakazać, przynajmniej dopóki nie zaczną wychodzić na miasto. Zamiast tego niech
    czytają o teorii typów lub teorii kategorii, bo dzięki temu szybko zostaną [socjometrycznymi
    gwiazdami](https://pl.wikipedia.org/wiki/Gwiazda_socjometryczna). Nie ma za co.

[^3]: གང་ལ་སྟོང་པ་ཉིད་སྲིད་པ། ། དེ་ལ་དོན་རྣམས་ཐམས་ཅད་སྲིད། ། གང་ལ་སྟོང་ཉིད་མི་སྲིད་པ། ། དེ་ལ་ཅི་ཡང་མི་སྲིད་དོ། །
