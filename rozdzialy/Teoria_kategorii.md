# Nie ma to jak rysowanie

W tej książce nie ma na razie rysunków i nie wiem jeszcze, czy w ogóle jakieś będą. Mam ważny powód,
żeby ich unikać, ale na razie trudno mi to wyjaśnić. A teraz akurat będziemy potrzebowali rysunku, a
właściwie kilku, a tak naprawdę będziemy potrzebowali kilku *diagramów*.

**Polecenie**: Przygotuj czystą kartkę papieru i długopis albo cokolwiek innego do pisania. Może
najlepiej kartkę formatu A4. Połóż ją przed sobą poziomo. Poproszę Cię teraz, żebyś coś
narysowała. Zaczniemy w lewym górnym rogu.

1. Zapisz literę *A*, a zaraz *po prawej* od niej małe
   [koło](https://pl.wikipedia.org/wiki/Ko%C5%82o) (nie
   [okrąg](https://pl.wikipedia.org/wiki/Okr%C4%85g)), jakbyś chciała zaznaczyć tylko pewien *punkt*
   i oznaczyć go literą *A*.

2. Po prawej od *punktu A*, w odległości równej powiedzmy mniej więcej połowie długości Twojego
   palca wskazującego (naprawdę nie musi być dokładnie), zaznacz drugie podobne koło, a *po prawej*
   od tego koła zapisz literę *B*. Odtąd dla własnej wygody pisania i Twojej wygody czytania będę
   nazywał tą odległość *krokiem*, a kiedy powiem, dla `X : Litera`, *oznacz* dany *punkt literą `X`
   z prawej*, albo *z lewej*, albo *z góry*, albo *z dołu*, to będzie mi chodziło o to, żebyś
   zapisała tą literę zaraz po prawej, albo zaraz z lewej, albo zaraz nad, albo zaraz pod tym
   punktem odpowiednio.

3. Narysuj strzałkę wychodzącą z punktu *A* i wchodzącą do punktu *B*, czyli taką z grotem
   wskazującym na punkt *B*. Może narysuj ją tak, żeby nie stykała się całkiem z punktami, ale to
   tylko sugestia. Ja robię to raz tak, a raz inaczej, i często się waham, którą wersję
   wybrać. Zgodnie z instrukcjami ta strzałka powinna być mniej więcej pozioma. Odtąd będę mówił
   krócej, na przykład: jeżeli na karte `X : Punkt` i `Y : Punkt` (typowanie można czytać jak
   zdanie, pamiętasz?), to powiem *narysuj strzałkę z `X` do `Y`*, a właściwie powiem to nawet
   krócej (to tylko objaśnienie języka, jakim będę się w coraz większym stopniu posługiwał, nie
   instrukcja).

4. `Krok` poniżej `B : Punkt` narysuj `Punkt` i oznacz go z dołu literą `C`, a potem tak samo
   narysuj `Strzalka B C`, czyli strzałkę z punktu `B` do punktu `C`.

5. Zaraz nad `Strzalka A B` zapisz literę `f`, a zaraz po prawej od `Strzalka B C` zapisz literę
   `g`.

Masz teraz dwie strzałki, o których, gdy wymienimy je *w określonej kolejności*, możemy powiedzieć,
że są `Skladalne`, rozumiejąc przez to, że jedna strzałka (tutaj `f`) wchodzi do punktu (tutaj `B`),
z którego wychodzi druga (tutaj `g`). Ten fakt możemy więc zapisać jako zdanie `Skladalne f
g`. Zwróć uwagę, że *kolejność* strzałek ma tutaj znaczenie, bo nie jest prawdą, że `Skladalne g f`,
przecież strzałka `g` nie wchodzi do punktu, z którego wychodzi strzałka `f`.

Przydadzą nam się jeszcze słowa `Zrodlo` i `Cel`. Jeżeli `s : Strzalka` (na Twoim rysunku akurat
`f : Strzalka` i `g : Strzalka`, ale chcę podkreślić, że ta reguła obowiązuje ogólnie), to term
`Zrodlo s` będzie oznaczał odtąd (zauważyłaś, że to jest pół-formalna *definicja*?) `Punkt`, z
którego wychodzi `s`, a term `Cel s` będzie oznaczał `Punkt`, do którego wchodzi `s`.

Przyjmiemy teraz ważną *regułę* dotyczącą *strzałek*: Zawsze gdy mamy takie `f : Strzalka` i `g :
Strzalka`, że `Skladalne f g`, musimy *dorysować* (na razie *anonimową*) strzałkę, albo przynajmniej
*wiedzieć, że istnieje* strzałka, której `Zrodlo` to `Zrodlo f` i której `Cel` to `Cel g`. Czyli w
przypadku tego rysunku to byłaby pewna narysowana ukośnie `Strzalka A C`. Ale w tej chwili jeszcze
nie będziemy tego robić. 

`Skladalne` oznacza więc tylko, a właściwie będzie niebawem oznaczało po wprowadzeniu odpowiedniego
aksjomatu, że da się zawsze zrobić taką (unikalną) strzałkę. Konsekwencje jeszcze nie wprowadzonych
aksjomat*ów* (liczba mnoga), dotyczących operacji składania strzałek, można zapamiętać tak: *Dla
każdej skierowanej ścieżki istnieje jednostrzałkowa droga na skróty równa złożeniu wszystkich
strzałek należących do tej ścieżki* (czyli strzałka, której `Zrodlo` jest początkiem tej ścieżki, a
`Cel` jest jej końcem). Jeżeli to w tym momencie za dużo, nie przejmuj się, będziemy się do tego
bardzo stopniowo zbliżać.

Żeby zwiększyć szanse, że przypomnisz sobie o tej ważnej własności jaką jest składalność, gdy to
pojęcie okaże się później potrzebne, poproszę Cię teraz o narysowanie, po prawej od *diagramu* (to
*niejawna definicja*, zauważyłaś?), który już zaczęłaś rysować, pewien inny diagram z *komentarzem*.

6. Narysuj, po prawej od diagramu ze `Strzalka`-mi `f` i `g`, dwie poziome `Strzalka` oznaczone z
   góry literami `i` i `j`, tworzące *ścieżkę skierowaną* zaczynającą się w `Punkt X`, przebiegającą
   przez `Punkt Y` i kończącą się na `Punkt Z`. Powiedziałem to tym razem trochę inaczej i dość
   skrótowo, ale wiesz, o co mi chodzi, prawda? Na tym nowym diagramie powinny być dwie poziome
   strzałki, `i` i `j`, takie, że `Zrodlo i` to `Punkt X`, `Cel i` to `Punkt Y`, `Zrodlo j` to
   `Punkt Y` i wreszcie `Cel j` to `Punkt Z`.

7. Otocz ten diagram prostokątem i napisz pod nim następujący komentarz: *Takie pary strzałek są
   składalne. Zawsze, gdy mówimy o składalności strzałek, ważna jest* **kolejność** *w jakiej
   wymieniamy strzałki. W tym przypadku możemy powiedzieć, że składalne są strzałki `i` i `j`, ale*
   **nie** *możemy powiedzieć, że składalne są strzałki `j` i `i`, bo* **nie wiemy**, *czy `Cel j`
   to `Zrodlo i` (niedługo wyjaśnię o co chodzi z tym nie wiemy)*

Teraz, gdy mam nadzieję będziesz mogła trochę swobodniej operować formalnym pojęciem składalności,
możemy wrócić do pierwszego diagramu.

8. Narysuj `Strzalka`, której `Zrodlo` to `Zrodlo f` i której `Cel` to `Cel g`. Oznacz tą strzałkę
   zapisując po zewnętrznej stronie trójkąta, który w ten sposób powstał, literę `h`. Od tego
   momentu ta strzałka nie jest już anonimowa, bo nadaliśmy jej nazwę (`h`).

Byłbym zapomniał, a to jest przecież ważne. Wróćmy na chwilę do drugiego diagramu.

9. Pod zapisanym już komentarzem dodaj jeszcze ten: **Trudne (więc wymaga czasu), ale ważne**:
   *Rysunek* **sugeruje** *tutaj, że `X`, `Y` i `Z` to* **różne** *punkty i że `i` i `j` to*
   **różne** *strzałki i to faktycznie* **są** *różne punkty i strzałki* **na tym rysunku**, *ale to
   są jednocześnie tylko* **reprezentacje** *i te punkty i strzałki mogą, ale nie muszą*
   **oznaczać** *te same obiekty* (odpowiedniego typu). *Punkty `X`, `Y` i `Z` pełnią tu więc role
   abstrakcyjnych* **reprezentacji** *czegoś, co spełnia pewne wymagania* (jak się okaże, będą to
   wymagania kategorii), *to są więc takie* **rysunkowe zmienne** *i tak samo zmiennymi są wszystkie
   strzałki* (chyba, że z jakiś powodów przyjmiemy określone *definicje* tych symboli i staną się
   przez to *stałymi*).

Wiesz, o co mi chodzi? Teraz **Ty jesteś funkcją**, *która widzi, że dostała* **jakieś**,
*niekoniecznie różne obiekty, które dla Ciebie są oznaczone* (albo *reprezentowane*) *przez `Punkt`
`X`, `Y` i `Z` i* **jakieś**, *niekoniecznie różne obiekty, które dla Ciebie są oznaczone jako
`Strzalka` `i` i `j`, o których to obiektach wiesz tylko tyle, że `Skladalne i j`. Te obiekty są dla
Ciebie "opakowane" i nie możesz otworzyć tych opakowań.*

*To jest więc teraz* **Twój kontekst** *albo* **kontekst Ciebie jako funkcji**. *To jest całkiem
dosłownie* **Twój kontekst** *ponieważ to jest teraz część* **fragmentu środowiska fizycznego**,
*który, chociaż się nieustannie zmienia i nie jest tak naprawdę oddzielony od reszty świata żadną
ścisłą i nieprzepuszczalną granicą, jest jednak dla Ciebie szczególnie ważną częścią środowiska, bo
jest zawsze przy "Tobie", albo "jest" - przynajmniej do pewnego stopnia - "Tobą", zależnie od punktu
widzenia. Tą zawsze dla Ciebie łatwo dostępną i stosunkowo kontrolowalną część środowiska nazywasz*
**własnym ciałem**. *A część Twojego ciała, która* **pełni teraz rolę kontekstu Ciebie jako pewnej
funkcji** *nazywasz "Twoją"* **pamięcią**.

Nie ma znaczenia, czy się z tym zgadzasz, czy nie, bo tworząc ten rysunek i stosując zaproponowany
przeze mnie język opisu *sama* sprawiłaś, że to już się *stało*. I co Ty na to? Niby zwyczajna
(prawie) rozmowa, a jednocześnie nie taka całkiem zwyczajna, prawda? Właściwie nie różni się to
niczym od wszystkich moich wcześniejszych prób wytłumaczenia Ci czegoś, bo pisząc cały czas musiałem
zakładać, że będziesz w określony sposób ze mną *współpracować*, a w każdym razie cały czas miałem
taką nadzieję. Jeżeli tylko próbowałaś w jakikolwiek sposób zrozumieć to, o czym do Ciebie mówię, a
skoro czytasz ten fragment, to mogę założyć, że tak, to przez cały ten czas działo się dokładnie to
samo, teraz tylko szczegóły są nowe. Zgaduję jednak, że Twoje *wrażenie* na czym to polega może być
tym razem w jakiś trudny do określenia sposób inne.

Możemy teraz wrócić do pierwszego diagramu.

10. Narysuj, omijając z zewnątrz łukiem literę `h`, taką `i : Strzalka`, że `Rownolegle h i` i oznacz
    ją zapisując po zewnętrznej stronie literę `i`.

Przypuszczam, że od razu domyśliłaś się, o co mi chodzi, ale na wszelki wypadek wyjaśniam. Odtąd
czasem przyda nam się term `Rownolegle`. Jeżeli `i : Strzalka` i `j : Strzalka` i jednocześnie
`Zrodlo i` to `Zrodlo j`, a `Cel i` to `Cel j`, czyli jeżeli `i : Strzalka` i `j : Strzalka` mają to
samo `Zrodlo` i ten sam `Cel`, to możemy powiedzieć (bo te założenia pozwalają to zawsze udowodnić
na mocy \{tutaj niejawnie wprowadzonej\} aksjomatycznej definicji), że `Rownolegle i j`.

Myślę, że od razu widzisz, że `h` i `i` są nie tylko równoległe, ale również w taki sam, ważny dla
nas odtąd sposób związane ze strzałkami `f` i `g`. Można powiedzieć, że zarówno `h` jak i `i` są
jakby brakującymi bokami trójkąta o bokach `f : Strzalka` i `g : Strzalka` *i jednocześnie* (to też
jest w tym wypadku ważne) zachodzi między nimi coś w rodzaju *uogólnionej `Rownoleglosc`*, bo
(dwustrzałkowa) *ścieżka* `f - g` i *jednostrzałkowe ścieżki* `h` i `i` są wszystkie *kierunkowe* i
mają ten sam *początek* i *koniec*, jak dwie (niekoniecznie różne \{zacząłem teraz nagle mówić o
potencjalnym *znaczeniu* tych symboli\}) jednokierunkowe ulice, którymi możemy wyjechać z tego
samego miejsca i dojechać do tego samego miejsca. 

To ostatnie zdanie jest dosyć perfidne, więc nie przejmuj się nim, jeżeli jeszcze Ci się dobrze nie
"przykleja". Spokojna [tafla tego oceanu](https://ncatlab.org/nlab/show/The+Rising+Sea) będzie się i
tak powoli unosić, o ile oczywiście zdecydujesz żeby czytać dalej.

Jeszcze bardziej przyda nam się odtąd term `Kompatybilne`. Jeżeli `f : Strzalka`, `g : Strzalka` i
`h : Strzalka`, to jeżeli `Skladalne f g` i `Zrodlo h` to `Zrodlo f`, a `Cel h` to `Cel g`, tak jak
na pierwszym diagramie, to `Kompatybilne f g h`. Na Twoim rysunku taką relację spełniają więc dwie
trójki: `Kompatybilne f g h` i `Kompatybilne f g i`.

Wprowadzimy teraz pewnego rodzaju *działanie na strzałkach*, czyli operację podobną na przykład do
dodawania, ale ta operacja nie będzie dotyczyła liczb, tylko naszych strzałek. Będziemy ją
*zapisywać* tak, jak znaną Ci już *aplikację*: Jeżeli `f : Strzalka` i `g : Strzalka` i `Skladalne f
g`, to `Zlozenie f g : Strzalka`. Działanie nazywa się tutaj `Zlozenie` i stwierdziliśmy właśnie o
nim, że złożenie dwóch kompatybilnych strzałek `f` i `g` (w tej kolejności) jest również strzałką,
analogicznie do tego, że suma dwóch liczb naturalnych jest również liczbą naturalną. Nasza operacja
składania różni się jednak od dodawania między innymi w ten ważny sposób, że dodawanie ma sens dla
*każdej* pary liczb, a składadnie strzałek ma sens *tylko* dla tych (uporządkowanych) par strzałek,
które są `Kompatybilne`.

Ponieważ `Skladalne f g`, to skoro `Zlozenie` ma być *działaniem* na takich (szczególnych) parach,
*musi istnieć* `Strzalka`, która jest *unikalnym* `Zlozenie f g`, w tej kolejności. Mamy teraz do
wyboru dwie strzałki

TODO


## Liczby z niczego

Jak być może wiesz, do niedawna w pewnym sensie najważniejszym podstawowym językiem matematyki był
język teorii mnogości, a konkretnie język teorii
[Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla). Nawet, jeżeli to wiesz,
to i tak na wszelki wypadek przytoczę tutaj odpowiedni cytat z
[Wikipedii](https://pl.wikipedia.org/wiki/Teoria_mnogo%C5%9Bci) (2024-12-29):

> Po odkryciu paradoksów tzw. naiwnej teorii mnogości udało się sformułować teorię zbiorów jako
> teorię aksjomatyczną; jej standardową wersją jest aksjomatyka ZF uwieńczona w latach 30. XX
> wieku. Stała się ona podstawą innych działów matematyki, ponieważ do pojęcia zbioru zredukowano
> inne szeroko używane obiekty jak liczby, funkcje oraz inne relacje; teoria mnogości stała się tak
> źródłem modeli różnych teorii formalnych.

Nie będziemy się teraz przyglądać aksjomatom tej teorii, ponieważ my sobie akurat *zrobimy* - ze
strzałek i funkcji - pewną wersję teorii mnogości w jednym z późniejszych rozdziałów, ale zanim to
nastąpi, skorzystam tutaj z teorii *ZF* jako ważnego przykładu.

To, że teoria *ZF* ma status jednej z teorii podstawowych w matematyce oznacza między innymi, że
można skonstruować rozmaite obiekty matematyczne posługując się tylko zbiorami. Zbiory *skończone*
możemy zapisać *dosłownie*, na przykład tak:

$\set{1, 20, \*, X, -3.4}$

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, bo zapisane dosłownie nie
zmieściłyby się na żadnej stronie. Wymyślając ten przykład chciałem od razu zasugerować, że (zgodnie
z dominującym w matematyce zwyczajem) zbiory mogą zawierać dowolne elementy, na przykład takie,
które nie należą do żadnego dającego się łatwo zidentyfikować rodzaju albo typu. A więc zbiory to
takie dowolne[^1] kolekcje potencjalnie różnorodnych elementów.

Będę teraz mówił o jednym z możliwych sposobów skonstruowania liczb naturalnych z samych
zbiorów. Nie oczekuję, że to wszystko dobrze zapamiętasz i nie zdziwiłbym się wcale, gdyby Ci się to
nie sposobało. Piszę o tym tylko żeby coś w ten sposób zilustrować, dlatego zalecam przyjęcie
wspomnianej już wcześniej postawy turystki, która ogląda dłużej to, na co tylko ma ochotę i nie
stara się za wszelką cenę wszystkiego dogłębnie zrozumieć.

Jeden ze sposobów, żeby skontruować obiekty, których można używać tak, jak używamy liczb naturalnych
wygląda tak ($∅$ to symbol oznaczający zbiór pusty, czyli $\set{}$):

$0 := \set{}$

$1 := \set{0} = \set{\set{}}$

$2 := \set{0, 1} = \set{\set{}, \set{\set{}}}$ 

$3 := \set{0, 1, 2} = \set{\set{}, \set{\set{}}, \set{\set{}, \set{\set{}}}}$

I tak dalej. Autorem tego pomysłu jest wybitny matematyk polskiego pochodzenia, Jerzy von Neumann, o
którym już zresztą wspominałem. Mamy tutaj oczywisty odpowiednik liczby *0* (jako zbioru pustego) i
mamy pewną, niekoniecznie od razu łatwą do opisania *regułę konstrukcji* pozostałych liczb, którą
można zapisać w taki oto sposób (który zaraz krok po kroku zilustruję):

Mówiąc możliwie najkrócej: *$n + 1$ powstaje przez dołożenie $n$ do $n$ jako dodatkowego elementu*.

Na przykład, żeby z liczby $0$ będącej z definicji zbiorem pustym zrobić liczbę $1$ dokładamy $0$, a
więc zbiór pusty, do niego samego, uzyskując w ten sposób liczbę $1$ jako zbiór $\set{\set{}}$,
czyli według przyjętej dopiero co definicji $0$, zbiór $\set{0}$.

Mówiąc nieco staranniej: *Jeżeli* $n$ *jest liczbą naturalną (zbudowaną już w pewien sposób z samych
zbiorów), to zbiór powstający z* $n$ *jako zbioru, przez dołożenie do* $n$ *zbioru* $n$ *jako
elementu, jest następnikiem* $n$ *jako liczby naturalnej*.

A więc: 

$\set{}$ jest zbiorem, który postanawiamy traktować jako liczbę $0$.

Dokładając do liczby naturalnej $0$, będącej zbiorem $\set{}$, ten sam zbiór jako element,
uzyskujemy $\set{\set{}}$, to jest następnik liczby naturalnej $0$, który oznaczamy jako $1$.

Dokładając do liczby naturalnej $1$, będącej zbiorem $\set{\set{}}$, ten sam zbiór jako element
uzyskujemy $\set{\set{}, \set{\set{}}}$, który oznaczamy jako $2$.

I tak dalej.

Wygląda to dziwnie, bo to *jest* dziwne, ale ostatecznie liczy się tylko to, czy dana konstrukcja
*działa*, a tego rodzaju obiekty spełniają aksjomaty Peano, a więc można na nich zdefiniować
wszystkie sensowne operacje na liczbach naturalnych i te operacje będą się zachowywały zgodnie z
naszymi oczekiwaniami. Wobec tego, te dziwne konstrukcje *są* liczbami naturalnymi, tak samo jak są
nimi nasze `Nat.zero`, `Nat.succ Nat.zero`, `Nat.succ (Nat.succ Nat.zero)`, i tak dalej.

**Jak to działa?**: Dodawanie na przykład liczby $2$ do liczby $1$ to $2$-krotne zastosowanie
operacji następnika do liczby $1$, a więc:

$2 + 1 = ...$

Rozpakowujemy definicję stałej $1$ ...  
$2 + \set{0} = ...$

... i kontynuujemy rozpakowywanie definicji po prawej od symbolu +:  
$2 + \set{\set{}} = ...$

Stosujemy funkcję następnika po raz pierwszy ...  
$1 + \set{\set{}, \set{\set{}}} = ...$

... i po raz drugi i ostatni, bo dodawanie jest zdefiniowane w taki sposób, że dodanie $0$ nic 
    nie zmienia:  
$= \set{\set{}, \set{\set{}}, \set{\set{}, \set{\set{}}}}$

Wreszcie "pakując" definicję uzyskanego w ten sposób rezultatu odkrywamy, że:  
$2 + 1 = 3$

Porównajmy teraz tą teoriomnogościową definicję z definicją liczb naturalnych w Leanie:

```lean
inductive Nat where
    | zero : Nat
    | succ (n : Nat) : Nat
```

Orzeźwiające? Wydaje mi się, że się zgodzisz, że ta definicja wygląda znacznie bardziej
naturalnie[^1]. Można by nawet powiedzieć, że ta definicja *jest* aksjomatami Peano zapisanymi
niemal dosłownie, w dosyć elegancki sposób, w postaci [*definicji
indukcyjnej*](https://pl.wikipedia.org/wiki/Indukcja_matematyczna), a dokładnie w postaci definicji
tak zwanego *indukcyjnego typu danych*.

**Czytamy to**: Indukcyjnie zdefiniowany typ danych (`inductive`) liczba naturalna (`Nat`) to
*dokładnie wszystkie* takie termy, że (`where`):

1. `zero` jest termem typu `Nat` (`| zero : Nat`).

2. Jeżeli `n` jest termem typu `Nat`, to sama *nieredukowalna* aplikacja `succ n` jest również
   termem typu `Nat` (`| succ (n : Nat) : Nat`).

Gdy nie posługujemy się wygodnym zapisem cyfrowym, to zapisujemy te liczby zwykle w stylu
`Nat.zero`, `Nat.succ Nat.zero`, `Nat.succ (Nat.succ Nat.zero)`, i tak dalej, a nie `zero`, `succ
zero`, `succ (succ zero)`, i tak dalej, ponieważ stałe `zero` i `succ` są tutaj elementami
*przestrzeni nazw* `Nat`, która powstaje automatycznie w ramach każdej definicji indukcyjnego typu
danych. Jeśli jednak mamy ochotę, zawsze możemy taką przestrzeń nazw *otworzyć* i dzięki temu pisać
bez tego prefiksu:

```lean
-- Otwarcie przestrzeni nazw Nat umożliwia krótszy zapis dosłowny liczb naturalnych:
open Nat

#check zero             -- Nat.zero : Nat

#check succ zero        -- zero.succ : Nat

#check succ (succ zero) -- zero.succ.succ : Nat
```

Aplikacje takie jak `succ zero` czy `succ (succ zero)` są *nieredukowalne* po prostu dlatego, że
funkcja `succ` istnieje *aksjomatycznie*, a więc definicja stałej `succ` jest *pozbawiona ciała*
(nie ma tu nic do rozpakowania). Inaczej mówiąc, *pod stałymi `zero` i `succ` nic się nie
kryje*. Przyjmujemy tu konwencję, zgodnie z którą liczba naturalna $0$ *jest* (nieredukowalną) stałą
`zero`, liczba naturalna $1$ *jest* nieredukowalną aplikacją `succ zero`, i tak dalej.

**Jak to działa?**: Dla uproszczenia zamiast `zero` będę pisał $z$ a zamiast `succ` będę pisał $z$ i
nie będę też pisał nawiasów ani spacji, a więc: $z, sz, ssz, sssz$, i tak dalej, gdzie $sz$ to
następna liczba naturalna po liczbie $0$, a więc $1$, $ssz$ to $2$, $sssz$ to $3$, i tak
dalej. Dodawanie działa wtedy tak (rozpakowując i na końcu pakując definicje stałych w oczywisty
sposób):

$2 + 1 = 2 + sz = 1 + ssz = 0 + sssz = sssz = 3$.

Operację dodawania liczb naturalnych można w Leanie zdefiniować *rekurencyjnie* używając dopasowania
wzorca (ilustracja):

```lean
-- Nie przejmuj się, jeżeli ten kod wydaje Ci się w tym momencie zbyt skomplikowany, to tylko
-- ilustracja.
def add (m : Nat) (n : Nat) : Nat :=
    -- Wykonaj tą operację, która pasuje do postaci zmiennej m, to jest do *pierwszego* parametru:
    match m with
    --  Jeżeli m to Nat.zero, to zwróć n, bo przecież 0 + n powinno być równe n:
    | Nat.zero => n
    --  Jeżeli m to następna liczba naturalna po jakiejś liczbie k, a więc n może tu być dowolną
    --  liczbą różną od 0, bo 0 nie jest następnikiem żadnej liczby naturalnej, to zwróć następnik
    --  rezultatu zastosowania funkcji add do liczb k i n:
    | Nat.succ k => Nat.succ (add k n)

-- Widzimy na tych przykładach, że tak zdefiniowane dodawanie działa zgodnie z oczekiwaniami:
#eval add 2 1    -- 3
#eval add 100 99 -- 199

-- A tak przebiega ewaluacja tego rodzaju aplikacji (ilustracja):
add 2 1

-- Rozpakowujemy add i w ciele podstawiamy 2 za m i 1 za n ...
--
--    match 2 with
--    | Nat.zero => 1
--    | Nat.succ k => Nat.succ (add k 1)
--
-- ... a ponieważ 2 jest różne od Nat.zero, ale jest równe Nat.succ k gdy k = 1, to pasuje tylko
-- drugi wzorzec:
--
--    | Nat.succ 1 => Nat.succ (add 1 1)
--
-- a więc:
Nat.succ (add 1 1)

-- I znowu rozpakowujemy add i podstawiamy:
--
--    match 1 with
--    | Nat.zero => 1
--    | Nat.succ k => Nat.succ (add k 1)
--
-- Znowu nie pasuje pierwszy wzorzec, ale pasuje drugi, bo 1 to Nat.succ 0, a więc:
--
--    | Nat.succ 0 => Nat.succ (add 0 1)
--
-- I teraz uwaga - to była ewaulacja samej aplikacji (add 1 1) wewnątrz termu złożonego
-- Nat.succ (add 1 1), a więc:
Nat.succ (Nat.succ (add 0 1))

-- I znowu rozpakowujemy stałą add i podstawiamy:
--
--    match 0 with
--    | Nat.zero => 1
--    | Nat.succ k => Nat.succ (add k 1)
--
-- Tym razem pasuje pierwszy wzorzec, bo 0 to Nat.zero ...
--
--    | Nat.zero => 1
Nat.succ (Nat.succ 1)

-- ... czyli:
3
```

Mając definicję *dodawania* - jako iteracyjnego stosowania funkcji następnika, na przykład $2 + 2$
to $1 + 1 + 2$ - możemy w ten sam sposób (rekurencyjnie) zdefiniować *mnożenie* - jako iteracyjne
dodawanie - na przykład, $3 * 2$ to $2 + 2 + 2$, a mając definicję mnożenia możemy (również
rekurencyjnie) zdefiniować *potęgowanie* - jako iteracyjne mnożenie - na przykład, $2^3$ to $2 * 2 *
2$. Przyzwyczajenie się do rekurencji wymaga jednak trochę czasu (za to potem pisanie takich
programów może być bardzo satysfakcjonujące).

Mówiąc już całkiem po polsku i możliwie krótko, liczby naturalne w Leanie to wedłu definicji
*dokładnie* liczba zero i każda taka liczba, która jest liczbą następną po jakiejś liczbie
naturalnej. Mamy tu do czynienia z [*definicją
rekurencyjną*](https://pl.wikipedia.org/wiki/Rekurencja), ponieważ pojęcie liczby naturalnej jest
(formalnie) *zdefiniowane w kategoriach liczb naturalnych* i chociaż może się wydawać, że taka
definicja musi być błędna, bo występuje w niej pozornie jakieś [błędne
koło](https://pl.wikipedia.org/wiki/B%C5%82%C4%99dne_ko%C5%82o_w_definiowaniu), to jednak *nie ma tu
żadnego błędu*, ale o tym będę mówił kiedy indziej.

Widzimy więc, że zarówno liczb naturalnych zdefiniowane sposobem von Neumanna jak i tych
zdefiniowanych w Leanie możemy używać dokładnie tak, jak używamy ... liczb naturalnych. O definicji
zaproponowanej przez von Neumanna ktoś złośliwy (nie ja!) mógłby jednak powiedzieć, że jest
wegańska, bo przecież te rzekomo "naturalne" liczby są tam sklecone niemal z niczego (to jest *z
samych zbiorów*), a w dodatku wyglądają dosyć dziwnie, ale to jeszcze pół biedy (to znaczy, pół
biedy, że różni złośliwi i ograniczeni ludzie, z którymi nie mam nic wspólnego, tak czasami
mówią). Gorzej, że posługując się tą definicją możemy zapisać jako *poprawne* i zarazem *prawdziwe*
między innymi takie dosyć *bezsensowne* zdanie:

$1 ∈ 2$  
(Zdanie prawdziwe, a więc również poprawne, w każdej teorii, w której obowiązuje definicja liczb
naturalnych zaproponowana przez von Neumanna)

Widzimy tutaj przykładowy *skutek uboczny* tej definicji, polegający na tym, że *liczba naturalna
$1$ jest elementem zbioru liczba naturalna $2$*. Ten skutek uboczny wynika stąd, że te liczby są
*zaimplementowane* za pomocą zbiorów, a zbiory mają różne właściwości, których *nie mają* liczby
naturalne *jako takie*. W zasadzie nic nie szkodzi, jesteśmy przecież tolerancyjni, niemniej wydaje
się, że nawet ktoś tylko umiarkowanie złośliwy i ograniczony mógłby powiedzieć, że definicja von
Neumanna jest troszeczkę *zbyt* wegańska.

No to teraz uważaj, bo zaczniemy się przełączać na [*język
kosmitów*](https://en.wikipedia.org/wiki/Alien_language) (lub
[aniołów](https://biblehub.com/text/1_corinthians/13-1.htm), jak kto woli).

## Liczby naturalne z perspektywy kategoryjnej

Wprowadzimy sobie nowe aksjomaty. Wydaje mi się, że możesz sobie mniej więcej wyobrazić, jak można
by je zapisać w języku teorii typów, ale tym razem nie będziemy tego robić.

K1. Niech (aksjomatycznie) istnieją *być może* jakieś *obiekty*.

K2. Niech (aksjomatycznie) każdy obiekt $O$ będzie wyposażony w specjalną *strzałkę* z tego obiektu
do niego samego, którą będziemy czasem oznaczać jako $Id_O$, być może pisząc na przyklad tak:
$Id_O : O → O$.

K3. Niech poza tym *być może* istnieją jakieś inne strzałki i niech każda strzałka *wychodzi* z
jakiegoś unikalnego obiektu i *wchodzi* do jakiegoś unikalnego obiektu. Fakt, że jakaś konkretna
strzałka wychodzi z jakiegoś konkretnego obiektu $S$ i wchodzi do jakiegoś konkretnego, być może
tego samego obiektu $T$, będziemy oznaczać tak:
    
$f : S → T$.

gdzie $f$ to wybrana przez nas arbitralnie nazwa strzałki, a $S$ i $T$ to wybrane arbitralnie, ale
również tak, żeby się kojarzyły ze słowami *source* (po polsku *źródło*) i *target* (po polsku
*cel*) nazwy obiektu, z którego $f$ wychodzi i do którego wchodzi odpowiednio.

Spróbuj się nie przywiązywać za bardzo od myślenia o *tych* strzałkach jako o funkcjach. To *nie* są
funkcje, chociaż to *mogą* być funkcje. To *są* tylko strzałki o wymienionych właściwościach.

To są na razie *atomowe* "klocki" naszej nowej językowej gry. Potrzebujemy jeszcze dodać aksjomaty,
które będą nam mówiły, jak można się tymi klockami *bawić*, stosując jakieś wcześniej aksjomatycznie
wprowadzone operacje. No to przyjmujemy, że możemy zawsze mówić o (unikalnych) *złożeniach*
pasujących do siebie w pewien określony sposób strzałek.

K4. Jeżeli $A$, $B$ i $C$ są (niekoniecznie różnymi) obiektami, a $f$ i $g$ są (niekoniecznie
różnymi) strzałkami, w dodatku takimi, że są w następującym sensie *kompatybilne*:

$f : A → B$ i $g : B → C$

czyli druga wychodzi z obiektu, do którego wchodzi pierwsza, albo inaczej pierwsza wchodzi do
obiektu, z którego wychodzi druga, to istnieje *unikalna* strzałka będąca *złożeniem* tych dwóch
strzałek, a dokładnie:

$g ∘ f : A → C$

gdzie $∘$ oznacza binarną operację składania strzałek. Jeżeli strzałki nie są w ten sposób
kompatybilne, to nie da się ich tak złożyć.

K5. Składanie strzałek jest *łączne*, to znaczy, że jeżeli mamy taką kompatybilność:

$f : A → B$, $g : B → C$ i $h : C → D$

to zachodzi taka równość (to jest *wymienialność* takich wyrażeń):

$h ∘ (g ∘ f) = (h ∘ g) ∘ f$

K6. Strzałki typu $Id$ są elementami neutralnymi ze względu na operację składania, co znaczy, że
zachowują się jak liczba $0$ w dodawaniu. Zakładając kompatybilność $Id_A$ i $f$, a także $f$ i
$Id_B$ (co sprowadza się do $f : A → B$, bo z definicji $Id_A : A → A$ i $Id_B : B → B$):

$Id_B ∘ f = f = f ∘ Id_A$

Oto jest sześć aksjomatów [*kategorii*](https://pl.wikipedia.org/wiki/Teoria_kategorii).

## Liczby naturalne jako kategoria

## Pewna kategoria zdań

## Koniunkcja jako granica kategoryjna

### Przypisy

[^1]: Pun intended.
