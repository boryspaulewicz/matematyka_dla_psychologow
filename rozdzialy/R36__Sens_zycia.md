<!-- -*- coding: utf-8 -*- -->
... oczywiście *środowiska*.

Skądś się te bodźce biorą i w czymś się te reakcje rozgrywają i na coś oddziałują, co nie? A *ciało*
to, za przeproszeniem, pies? 

Właściwie, jak się tak zastanowić, to środowisko nie jest wcale ani szczególnie małe, ania mało
znaczące. No ale (zdawałoby się, że) środowisko to nie fascynujący i tajemniczy *Umysł*; to tylko
łatwo obserwowalne, znane nam wszystkim i przez wszystkich niepsychopatów kochane sklepy Żabka,
jakieś ulice, jakieś przystanki i auta, przechodnie i kierowcy, dużo wody, ziemi i powietrza, trochę
zieleni i czerwieni, i to by było w zasadzie na tyle, bo - powiedzmy sobie szczerze - "écru
wpadające w limonkę" to nie kolor tylko stan umysłu, a ryba to praktycznie warzywo.

## Trzeci (również śmieszniejszy, ale to jest akurat znacznie bardziej subtelny żart) sposób na psychologię



## Brudna robota (o imieniu `Cat`)

Wyobraź sobie proszę, że jesteś n-ręką bandytką. Już wyjaśniam.

Zadanie n-rękiej bandytki to wyidealizowana wersja lubianej przez wielu zabawy, polegającej na tym,
że siedzimy lub stoimi przed takim sporym pudłem, ciągniemy za wajchę wystającą z prawej strony,
patrzymy na zmieniające się w kilku okienkach obrazki i rujnujemy sobie i swoim ewentualnym bliskim
życie. Co ciekawe, wiele osób zdaje się sądzić, że adekwatnym określeniem dla tej dualnie
urzekającej formy spędzania wolnego czasu jest słowo "ekscytująca".

Funkcjonalnie, chodzi tu oczywiście o skończony (`n : Nat, n > 1`) ...

1. zbiór dostępnych działań (`d : Dzialanie`), ...

2. które można wykonywać teoretycznie w nieskończoność (`iteracja : Nat → Dzialanie`) ...

3. i po których następuje cokolwiek, co można ocenić (`nagroda : Dzialanie → Sygnal`) ...

4. posługując się dowolną relacją porządku (`[Porzadek Sygnal]` \{powołanie się na instancję klasy
   `Porzadek`\}).

Wyobraź sobie, że masz nieskończenie dużo czasu, za to żadnych znajomych ani w ogóle nic innego do
roboty, `n = 3`, a nagrodami, jak w kasynie, są wypłaty pieniężne, które mimo swojej szczególnej
sytuacji nadal sobie cenisz. Zaczęłaś od jednokrotnego sprawdzenia każdego z dostępnych działań:

```lean
-- Ten parametryczny typ pozwala wygodnie rozumować na temat jakiegoś czegoś, co może być
-- niedostępne albo niepoznawalne albo bezużyteczne. W Leanie ten typ nazywa się `Option` i ma
-- konstruktory o nazwach `none` i `some`, ale poza tym to (funkcjonalnie) to samo.
inductive Co? (α : Type u) where
  | a_nic         : Co? α
  | a_to (to : α) : Co? α

open Co?

-- 0 ↦ 0, 1 ↦ 1, 2 ↦ 2, _ ↦ właśnie zaczął mi się urlop.
def odwazny_poczatek (n : Nat) : Co? Nat :=
    if n < 3 then (a_to n) else a_nic
```

Przypuszczam, że sposobu działania wyrażeń `if <warunek> then <term> else <term>` nie muszę
tłumaczyć, poza jedną subtelnością - żeby Lean coś takiego zaakceptował, term `warunek` musi być
*rozstrzygalny* (przez algorytm \{o czym więcej kiedy indziej\}).

Reguła działania jest taka prosta między innymi dlatego, że traktujemy tą sytuację, a dokładniej to
to zadanie, jakby nie miało *stanu*. Mówiąc inaczej, ale funkcjonalnie równoważnie, istnieje tylko
jeden stan tego (zewnętrznego wobec nas?) świata. To znaczy, że w tym świecie wszystko działa zawsze
tak samo, niezależnie od tego, co się wcześniej wydarzyło.

Widzimy więc znowu, że w pewnych sytuacjach singleton (tutaj możliwych stanów) zachowuje się tak,
jak będący jego dualnym odpowiednikiem zbiór pusty. W tym przypadku dlatego, że pojęcie stanu
struktury, świata, sytuacji, czy zadania jest tylko wtedy użyteczne, kiedy stany mogą być różne. A
mówiąc inaczej, ale w zasadzie to samo, *pojęcie* stanu *domaga się*, przynajmniej potencjalnej,
tego rodzaju różnorodności, bo kanonicznym zastosowaniem tego pojęcia jest *rozróżnianie* możliwych
stanów (z konieczności oparte na ich własnościach, jak to rozróżnianie).

No więc wyobraź sobie, że na początku *zastosowałaś* `n` razy tego rodzaju *strategię
eksploracyjną*, uzyskując takie oto (funkcjonalnie) zyski, będące jednocześnie (funkcjonalnie)
jedynymi dostępnymi informacjami na temat dynamiki środowiska:

`0 ↦ 665, 1 ↦ 664, 2 ↦ 667`

*W tym wypadku* możemy jednoznacznie i autorytatywnie stwierdzić, co w pewnym sensie *powinnaś*
zrobić, bo to wynika z definicji, a wynika z niej, bo to jest definicja *zadania*. Stwierdzenie, że
coś się powinno albo czegoś się nie powinno ma sens *tylko* zakładając jakiś cel, a ponieważ cel
jako taki jest zawsze pewną preferencją czyli oceną, a ocena jako taka jest zawsze postawą,
funkcjonalnie równoważną pewnej relacji porządku, czyli ostatecznie punktem widzenia, założenie na
temat celu jest [*nieuzasadnialne*](https://pl.wikipedia.org/wiki/Gilotyna_Hume%E2%80%99a) inaczej
niż ze względu na jakieś ewentualne inne preferencje czyli postawy czyli oceny czyli relacje
porządku:

*Jeżeli* zależy Ci tylko na pieniądzach (nie oceniam), to zgodnie ze wszystkimi dostępnymi danymi,
*powinnaś* wybrać `2`, ponieważ *najlepszym* wyborem jest `2` i tylko `2`, albo, równoważnie,
jedynym *racjonalnym* wyborem jest `2`.

Zwróć proszę uwagę, że w tym kontekście *racjonalny* znaczy *dokładnie* to samo, co *najlepszy*, a
najlepszy znaczy *dokładanie* to samo, co *największy*. Ponadto *rozstrzygnięcie*, który wybór jest
w danym momencie racjonalny, wymaga *pamięci*, która akurat tutaj przyjęła maksymalnie uniwersalną
postać *sekwencji reakcji*. Akurat w tym przykładzie reakcja jest *parą* złożoną z bodźca i
działania, ale w ogólnym przypadku będzie (funkcjonalnie) *trójką*, złożoną z ...

1. bodźca, czyli funkcjonalnie (zwykle ekstremalnie fragmentarycznej) *informacji na temat
aktualnego stanu* (świata), ...

2. działania wykonanego w danej *próbie* i ...

3. stanu *całego* (ale za to tylko rozważanego) *świata*.

Mówimy tu więc o reakcjach z perspektywy wszechwiędzącej obserwatorki.

Żeby było ciekawiej, zmienimy teraz język na taki, który
[wymaga](https://pl.wikipedia.org/wiki/Odzie%C5%BC_ochronna) założenia co najmniej rękawic do smaru
i oleju, okularów ochronnych i maski przeciwpyłowej, to jest na używany przez wielu psychologów
zajmujących się (często niestety nieudolnie) analizą danych język R. Zaczniemy od zdefiniowania w
nim prostej *funkcji środowiska*:

```r
## Ta funkcja jest naszym modelem środowiska, w którym może być lepiej lub gorzej, a to, jak w nim
## (nam) jest zależy od tego, jakie wykonujemy ruchy. Uprzedzam, że to jest *nowy* język
## programowania (R), który zarówno pod względem składni jak i sposobu działania bardzo różni się od
## Leana.

E = function(a){
    c(665, 664, 667)[a + 1]
}
```

Funkcja środowiska pobiera tylko indeks (albo po prostu numer) ruchu (albo po prostu ruch), czyli w
pewnym sensie "decyzję", której wartościami mogą być liczby naturalne od 0 do 2. W ciele tej
funkcji, zdefiniowanym między nawiasami klamrowymi, widzimy wyrażenie (`c(...)`) tworzące *wektor*
trójelementowy (czyli pewnego rodzaju sekwencję), którego wartościami są nagrody/sygnały
odpowiadające każdemu z ruchów/działań. Na tym wektorze wykonywana jest operacja indeksowania, czyli
wskazywania elementu sekwencji za pomocą liczby naturalnej, którą to operację oznaczamy w R używając
nawiasów kwadratowych. Ponieważ w R indeksujemy pozycje w typach sekwencyjnych od 1, a nie od 0, jak
w większości innych języków programowania, do indeksu działania dodajemy 1.

*Zmienna* `E` *będzie* nazwą tej funkcji od momentu, w którym poddamy ten kod ewaluacji. W
przeciwieństwie do Leana, napisany w skrypcie R-a kod nie zaczyna więc "od razu działać" w
R. Widzimy też, że nie ma tu żadnej jawnej informacji o typach danych, bo (ubogi) system typów
języka R został zaprojektowany do znacznie skromniejszych celów niż formalizacja całej matematyki.

Jeżeli teraz w *wierszu poleceń* interpretera języka R (`> ...`), którego w Leanie nie ma, bo
interakcja z Leanem nie polega na wykonywaniu pętli [REPL](https://pl.wikipedia.org/wiki/REPL),
napiszemy `E(1)` i naciśniemy Enter, zobaczymy następującą odpowiedź środowiska:

```r
> E(1)
[1] 664
```

Ten komunikat **czytamy jako**: Się robi, szefowo (bo R to interpreter pochodzenia wiejskiego, ale w
dobrym znaczeniu), oto wektor jednoelementowy (`[1]`) o zawartości `664`.

## Najprościej, jak się da, żeby było najprościej, jak się da

W rozważanej sytuacji nie jest takie ważne, czy mamy do wyboru trzy różne ruchy, czy dwa, byle tylko
był wybór. Wobec tego dokonamy uproszczenia i pozbędziemy się jednej z alternatyw, tym bardziej, że
zbiory dwuelementowe mają dla nas głębsze, o ile nie zbyt głębokie znaczenie. Nie będziemy się też
bawić w mapowanie *indeksów* ruchów na *same* ruchy, bo to jest w tym przypadku (funkcjonalnie)
jedno i to samo.

Wyobraźmy sobie teraz, że wiemy z góry tylko tyle, że możemy używać dwóch różnych ruchów. Żeby
napisać funkcję, która w jakiś sensowny sposób gra w tą grę, *musimy* skorzystać z *pamięci*. Z
powodów, które staną się jasne niebawem, rozwiążemy ten problem w sposób, który bardziej przypomina
styl kodowania w języku funkcyjnym niż w języku imperatywnym:

```r
## Tu określamy, gdzie są jakie
konfitury = c(44, 77)

## Ta prosta funkcja jest naszym roboczym modelem środowiska, w którym to, jak w danym momencie
## jest, zależy od ruchu, który wystąpił w poprzedniej iteracji.
E = function(a){ konfitury[a] }

## A to jest funkcja "podmiotu" albo "agenta". Na początku nie ma sygnału ze środowiska (`sygnal =
## NA`), pamięć jest pusta, kondycja ma poziom wyjściowy i agent jest najmłodszą możliwą wersją
## siebie.
A = function(sygnal = NA, ## To są domyślne wartości parametrów tej funkcji, ...
             pamiec = c(NA, NA),
             wypas = 0,
             zycia = 9){
    ## ... a to jej ciało:
    ##
    ## Etap wyboru następnego ruchu:
    if(is.na(sygnal)){
        ## Jeżeli nie ma informacji na temat ostatniego sygnału, to musi to być pierwsza próba, w
        ## której arbitralnie wybieramy pierwszy ruch.
        ruch = 1
    }else{
        ## Jeżeli natomiast to nie jest początek interakcji ze środowiskiem ...
        if(zycia == 0){
            ## ... ale to ostatnie życie, oddajemy wszystko, co nam zostało, ...
            print("Cześć, i dzięki za ryby")
            return(wypas)
        }else{
            ## ... a jeżeli to nie jest ostatnie życie, ...
            if(any(is.na(pamiec))){
                ## ... to jeżeli nie ma jeszcze zapisu pamięciowego sygnału po którymś ruchu, to
                ## wybieramy pierwszy ruch, dla którego nie ma takiego zapisu, ...
                ruch = which(is.na(pamiec))[1]
            }else{
                ## ... w przeciwnym razie wybieramy ruch o największym zapamiętanym sygnale:
                ruch = which(pamiec == max(pamiec))[1]
            }
        }
    }
    ## Etap przetwarzania sygnału:
    ##
    ## Odbieramy sygnał ze środowiska ...
    sygnal = E(ruch)
    ## .. i oddajemy się konsumpcji:
    wypas = wypas + sygnal
    ## Najadłwszy się, zapamiętujemy sygnał jako własność ostatnio wybranego ruchu, ...
    pamiec[ruch] = sygnal
    ## ... a następnie - trochę się od tego wszystkiego starzejąc - ...
    zycia = zycia - 1
    ## ... aplikujemy Się do dostępnych danych:
    A(sygnal, pamiec, wypas, zycia)
}

A()
```

Cały ten kod możesz wkleić [tutaj](https://rdrr.io/snippets/), lub do zainstalowanego na swoim
komputerze interpretera R. Po wykonaniu ewaluacji (inaczej *u-ruchomieniu* kodu) przekonasz się
wtedy, że - jak można policzyć (ale komu by się chciało) - po pierwszych dwóch eksploracyjnych
wyborach ten agent wybiera już do samego końca ruch, po którym występuje największy sygnał nagrody:

```r
> A()
[1] "Cześć, i dzięki za ryby"
[1] 660
```

**Przypomnienie o fundamentalnej różnicy między językami funkcyjnymi i imperatywnymi**: W języku R
symbole takie jak tutaj `E`, `A`, `konfitury`, `sygnal`, czy `ruch` nie są *stałymi*, tylko
zmiennymi, które w dodatku mają *inny* charakter niż zmienne w Leanie. Zmienne w Leanie są *tylko*
nazwami wejść (czystych) funkcji, a zmienne w R są również *nazwami miejsc w pamięci komputera*, a
poza tym *nie* mają ustalonego typu. Dlatego *w każdej chwili* można *przypisać* - za pomocą
operacji tylko *wyglądającej* jak równość matematyczna - na przykład do zmiennej `E` *jakąkolwiek*
wartość. Zależnie od kontekstu, ta operacja jest więc albo *nadaniem wartości początkowej*, albo
*zmianą* wartości zmiennej. Ponieważ ciała funkcji napisanych w R mogą korzystać z dowolnych
widocznych w tych ciałach zmiennych, a wartości zmiennych w R mogą się zmieniać w trakcie działania
programu, funkcje w R mogą mieć i często mają *skutki uboczne*, co znaczy, że *nie* muszą zwracać i
często nie zwracają tych samych wartości dla tych samych wejść.

Kod napisany w R to jednak *również* matematyka. Możemy udowadniać twierdzenia dotyczące sposobu
działania kodu napisanego w językach imperatywnych po prostu dlatego, że to są języki formalne i
napisane w nich programy działają zgodnie z jednoznacznymi, sztywnymi zasadami. Różnica polega na
tym, że dowodzenie twierdzeń na temat działania programów napisanych w językach imperatywnym może
wymagać uwzględnienia co najmniej modelu komputera kontrolowanego przez program, jeżeli nie
"świata", a to wymaga zastosowania jakiejś wersji logiki *przyczynowej*, którą poznamy kiedy
indziej.

Nasz (domniemany) agent rodzi się w tym małym świecie z bazową "kondycją" (domyślna wartość
zmiennej/parametru/argumentu `wypas` to 0). Częściowo wewnątrz (ciała \{funkcji\}) agenta
zdeterminowana jest również - jako przekształcana w ciele, początkowa wartość jednej ze zmiennych -
długość jego "życia". Można więc powiedzieć, że ten agent rodzi się z wbudowanym "zegarem
biologicznym", który resetuje się do wartości "fabrycznej", kiedy agent wydaje z siebie pierwotny
krzyk (`A()`). Domyślna, a więc tutaj tylko początkowa wartość sygnału ze środowiska to `NA`, co w
języku R jest standardowym oznaczeniem braku danych (ang. *Not Available*). Czyli ten agent "rodzi
się z zamkniętymi oczami".

Mogłoby się wydawać, że rodzi się też jako tabula rasa, ale to tylko złudzenie, wynikające naiwnego
rozumienia takich pojęć jak pamięć i wiedza. Pamięć jest tu co prawda początkowo pusta, ale jest
*dwu*komórkowa, a to znaczy, że jej struktura jest "od urodzenia" *dopasowana do zadania*. Można
powiedzieć, że już samo to jest czymś w rodzaju wbudowanej (uogólnionej) *wiedzy*, Ponieważ jednak
wiedza musi być w jakiś sposób zapisana fizycznie, a tym, co czyni własność fizyczną (funkcjonalnie)
wiedzą jest *możliwość wnioskowania* z tej własności w połączeniu z *wiedzą o tej możliwości*
(zgadza się, to jest sfunkcjonalna definicja rekurencyjna) - bo nie może być wiedzą coś, o czym nic
nie wiemy - to jednak ta wbudowana gotowość jest wiedzą tylko w ogólniejszym, czyli słabszym
sensie. 

Zastanawiasz się, co to za uogólnione pojęcie wiedzy? Otóż *struktura* (ciała \{funkcji\}) agenta
jest (między innymi) *modelem* (określonych własności) *zadania*!

W szczególności, *sposób działania* tej funkcji jest dopasowany do jednoznacznie określonego celu
(maksymalizacja skonsumowanej sumy konfitur) i do dynamiki środowiska, czyli właśnie do
zadania. Właściwie jedyna wbudowana "niepewność" to początkowy brak wbudowanej w jakikolwiek sposób
(uogólnionej) wiedzy na temat konkretnych wartości sygnałów następujących po każdym z dostępnych
ruchów. Dlatego ten agent nie musi się prawie w ogóle *uczyć* i dlatego będzie dla nas pouczającym
punktem wyjścia w rozważaniach na temat sensu życia.

## Ostateczne rozstrzygnięcie kwestii sensu życia

TODO uczenie na podstawie nagród vs nadzorowane

TODO Ten agent dopasowuje albo uczy się modelu środowiska.

TODO konieczne założenia przyczynowe w RELE

TODO homomorfizm
planowania działań.

TODO Sutton i Barto nie wiedząc o tym odkryli "wielkie TO".

TODO GIBSON

Postrzeganie świata w kategoriach interfejsu programistycznego. Uogólnione rozumienie programowania
jako fizycznego rozwiązywania problemów.
