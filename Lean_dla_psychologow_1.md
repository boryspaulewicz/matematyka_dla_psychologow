# Ogólne uwagi o skryptach

**Ten skrypt ma dwie wersje**: To jest przegadana wersja skryptu, odpowiednia dla całkiem
początkujących. Jeżeli miałeś już przez jakiś czas kontakt z tą wersją, może przyda Ci się zerknąć
czasem do [wersji zwięzłej](./Lean_dla_psychologow_1z.md), zwłaszcza na etapie powtarzania
materiału.

**Dwa powody, dla których to napisałem**: Żeby dobrze zrozumieć status i rolę teorii normatywnych
czy analizy racjonalnej w psychologii, trzeba się trochę oswoić z matematycznymi teoriami
rozumowania (na przykład z logiką), wydawania sądów (rachunek prawdopodobieństwa i wnioskowanie
bayesowskie) i podejmowania decyzji (na przykład teoria wyboru racjonalnego). To jest jeden powód.

Drugi powód, to że w mojej ocenie zdecydowana większość psychologów - mam tu na myśli również
utytuowanych pracowników naukowych z bogatym "dorobkiem" - z jednej strony polega w ogromnym stopniu
na matematyce (na przykład, używając wnioskowania statystycznego, ale nie tylko wtedy) i próbuje
zrozumieć bardzo złożone i trudne do wyjaśnienia zjawiska (takie jak zachowania ludzi czy strukturę
i przebieg procesów umysłowych), a z drugiej nie ma najczęściej o matematyce bladego pojęcia. Tacy
(niestety w psychologii liczni) matematyczni analfabeci nagminnie wyciągają z własnych i cudzych
badań nieuzasadnione (czytaj: wyssane z palca, co nie znaczy, że na pewno fałszywe) wnioski,
popełniając przy tym często najprostsze nawet błędy. Dobrymi przykładami są powszechne wnioskowanie
o braku efektu na podstawie samego tylko nieistotnego wyniku testu statystycznego, albo wnioskowanie
o wpływie czy innych własnościach przyczynowych bez wprowadzenia i uzasadnienia koniecznych założeń
(nadal nie wszyscy psychologowie wiedzą, że [przyczynowość została
zmatematyzowana](https://en.wikipedia.org/wiki/Causal_inference)). Matematycznym analfabetom udaje
się publikować swoje prace w wysokopunktowanych czasopismach, bo te prace są zwykle oceniane przez
innych matematycznych analfabetów, pełniących funkcje redaktorów czasopism i recenzentów.

Matematyczny analfabetyzm ogromnej większości psychologów jest łatwym do zaobserwowania
faktem. Równie łatwo można wskazać jedną z głównych przyczyn tego faktu - *nikt*, włączając w to
osoby prowadzące zajęcia ze statystyki, nie wymaga od psychologów znajomości matematyki, a mało kto
systematycznie uczy się matematyki z własnej woli. W mojej ocenie to jest jednocześnie śmieszne,
groteskowe, nieakceptowalne, i nie widzę, żeby ktokolwiek próbował to zmienić.

To jest eksperyment pedagogiczny oparty na założeniu, że (przynajmniej Ci młodsi) psychologowie
często mniej boją się programowania niż matematyki, a poza tym z programowaniem mogą się oswajać w
interakcji z komputerem dostarczającym natychmiastowej informacji zwrotnej. Ten eksperyment
pedagogiczny ma pomóc w oswajaniu się z matematyką studentom na kierunku psychologia i pracownikom
akademickim zajmującym się badaniami psychologicznymi, którzy są gotowi podjąć próbę poznania
nowego, pięknego, i bardzo ekspresyjnego języka programowania.

Ten skrypt *może zawierać i prawie na pewno zawiera błędy we fragmentach napisanych w języku
naturalnym*, czyli w tych częściach, w których mniej lub bardziej po swojemu objaśniam kod lub
zapędzam się w dygresje. Ryzyko pojawienia się błędu w tych fragmentach skryptu nie jest małe, bo
jestem tylko matematycznym amatorem. Gdybyś znalazł/a błąd, byłoby mi bardzo miło, gdybyś mi o tym
napisał/a (borys.paulewicz@gmail.com).

Ten skrypt *prawie na pewno nie zawiera błędów w częściach formalnych*, to jest zakodowanych w
pewnej wersji języka teorii typów zależnych zaimplementowanej w asystencie dowodzenia
[Lean](https://lean-lang.org/). To jest o ile te części sprawdziłem przed posłaniem zmian do
repozytorium. Jeżeli tak właśnie akurat zrobiłem, to znaczy, że wszystkie części całkowicie formalne
zostały sprawdzone przez algorytm, którego używa. Wtedy mało czego można być tak pewnym jak tego, że
są bezbłędne.

**Ostrzeżenie**: Nawet jeżeli przeczytasz tą część skryptu do końca i uda Ci się zrobić poprawnie
zadania, których jest zresztą niewiele, jest możliwe, że po wszystkim będziesz czuć coś w rodzaju
dezorientacji lub braku poczucia sensu. Będziemy się zajmować bardzo abstrakcyjnymi pojęciami,
dlatego takie poczucie jest na początku prawdopodobne. Ja też się podobnie czułem, gdy po raz
pierwszy miałem kontakt z tymi treściami. To poczucie może się stopniowo zmienić w coraz głębsze
zrozumienie, ale to wymaga *cierpliwości*. 

W związku z tym, oto moja rada: Naukowcem z prawdziwego zdarzenia nie zostaje się z dnia na
dzień. Daj sobie czas, żeby wszystko zdążyło się trochę "uleżeć" i pogódź się z tym, że dobre
opanowanie tego rodzaju materiału wymaga czasem wielokrotnego aktywnego czytania tych samych
fragmentów. O ile nie zabraknie wytrwałości, to prędzej czy później może stać się to, co dzieje się,
gdy przez dłuższy czas idziemy dokądś, niekoniecznie dążąc stale do jednego celu, a powietrze jest
bardzo wilgotne. Chociaż nie ma wyraźnego momentu, kiedy zachodzi jakościowa zmiana, odkrywamy w
końcu, że choć nie padał deszcz, jesteśmy przemoczeni[^1].

**Praktyczna wskazówka**: Gdy pojawi się frustracja, a całkiem możliwe, że się pojawi, poczekaj albo
wróć do tego, co wydaje Ci się, że już dobrze zrozumiała/eś. Poczucie zrozumienia bywa
zwodnicze. Kilka razy w życiu zdarzyło mi się uczyć trudnego materiału wykonując coraz odleglejsze w
czasie generatywne powtórki. Prawie za każdym razem gdy powtarzałem w ten sposób materiał
przekonywałem się, że moje wcześniejsze poczucie zrozumienia było częściowo złudne. Szczerze mówiąc,
jestem zdania, że rozumienie to jest coś, do czego można stale *dążyć*, ale co rzadko, o ile w ogóle
kiedykolwiek, można naprawdę *osiągnąć*. Tym bardziej, że nawet na najprostsze sprawy można próbować
patrzeć z nowego punktu widzenia.

**Przepis na sukces**: Ten skrypt nie jest długi. Przeczytanie go i wykonanie poleceń powinno Ci
zająć nie więcej niż półtorej godziny. Jest też samowystarczalny w tym znaczeniu, że nie zakłada
żadnej specjalnej wcześniejszej wiedzy ani instalacji oprogramowania - wszystko jest wyjaśnione od
podstaw, a jedyny program, którego potrzebujemy, jest dostępny za darmo w przeglądarce. Treści będą
jednak trudne. Polecam znaleźć kartkę i coś do pisania, włączyć minutnik na 30 minut, i robić
*jakiekolwiek* notatki (na przykład, zapisywać wątpliwości, albo pomysły czy skojarzenia). Po 30
minutach zrobić około 5 minutową (nie za długą) przerwę, w trakcie której nie będziesz robić nic
wciągającego, a potem znowu pracować przez 30 minut. Po dwóch takich jednostkach trzeba sobie zrobić
dłuższą przerwę, ja w każdym razie tego wtedy potrzebuję.

## Zachęta i jednocześnie ćwiczenie wskazane nawet dla osób nie całkiem początkujących

**Polecenie**: Myślę, że już w podstawówce stało się dla Ciebie oczywiste, że jeżeli *A = B* i *B =
C*, to *A = C*, niezależnie od tego, czym są *A*, *B* i *C*. Na pewno też jako znajomy rozpoznasz
taki oto fragment "matematycznej prozy":

> Jeżeli *n* i *m* to liczby naturalne, to *n + m = m + n*.

I z pewnością wiesz, że możesz *używać* takiego stwierdzenia *podstawiając* pod *n* lub *m*:

- Konkretną liczbę naturalną

- Zmienną, o której wcześniej założyłeś/aś, że oznacza (jakąś) liczbę naturalną

- Wyrażenie, które po obliczeniu daje liczbę naturalną

Trzeba tylko pamiętać, żeby podstawianie było konsekwentne, to znaczy, za *n* powinno być wszędzie
podstawione to samo i za *m* wszędzie to samo, i to nie muszą być dwie różne rzeczy. Na przykład,
zgodnie z przytoczonym fragmentem *2 + 3 = 3 + 2*, jak również, jeżeli *a* i *b* to liczby
naturalne, to *a + b = b + a*, *a + 10 = 10 + a*, *b + b = b + b*, *(2 + 3 + a) + b = b + (2 + 3 +
a)*, bo *2 + 3 + a* oznacza w tym kontekście (oto cały kontekst: *a* i *b* są liczbami naturalnymi)
jakąś liczbę naturalną, i tak dalej. Myślę, że zgodzisz się ze mną, że tego rodzaju formalne
operacje większość dzieci opanowuje w szkole podstawowej.

Możemy popatrzeć na to wszystko również tak: Ten fragment matematycznej prozy jest jak przepis,
który stosując możemy wyprodukować nieskończenie wiele prawdziwych zdań na temat liczb
naturalnych. Albo jak coś w rodzaju maszyny albo mechanizmu, który działa dzięki temu, że używamy go
w określony sposób, to jest konsekwentnie podstawiając w miejsca zmiennych wyrażenia odpowiedniego
typu (typu liczbowego). W tej części skryptu to jest nas punkt wyjścia i - jak się przekonasz - to
będzie również nasz punkt dojścia.

Spróbuj chwilowo potraktować takie formalne reguły jak te wyrażone w przytoczonym fragmencie jako
*reguły gry, która nie musi mieć żadnego sensu*. Uwierz mi, bo sprawdzałem to wielokrotnie, potrzeba
sensu na tym etapie może Ci przeszkadzać. Obiecuję, że sens się pojawi, tylko kiedy
indziej. Zdolność do tymczasowego stłumienia w sobie potrzeby sensu bywa bardzo korzystna, a czasem
wręcz nieodzowna w nauce matematyki.

Znajdź czystą kartkę papieru i coś do pisania. Napisz na niej trzy zdania, które będziemy chwilowo
rozumieć jako *aksjomaty*, czyli reguły gry, na które umawiamy się bez uzasadnienia:

1. Istnieją tak zwane *zdarzenia*.

2. Istnieje funkcja *p*, która *zdarzeniom* lub ich *skończonym sekwencjom* przypisuje *liczby*.

3. Jeżeli *x* i *y* to *zdarzenia*, to *p(x, y) = p(y, x)*.

Niektóre symbole i terminy techniczne matematyki, to jest *=*, *funkcja*, *skończona sekwencja* i
*liczba*, traktujemy tutaj jako część wspólnej wiedzy zastanej. 

Pewnie przyszła Ci do głowy narzucająca się interpretacja symboli *zdarzenie* i *p*. Spróbuj ją
proszę ignorować, na ile tylko jesteś w stanie. 

Poza aksjomatami będziemy jeszcze potrzebować *definicji* symbolu |:

4. Jeżeli *x* i *y* to *zdarzenia*, to *p(x|y) * p(y) = p(x, y)*.

Zapisz teraz nową wersję definicji pionowej kreski, ale wpisując *y* wszędzie tam, gdzie w
oryginalnej wersji jest *x*, a *x* wszędzie tam, gdzie w oryginalnej wersji jest *y*. Czyli
traktując tą definicję jak przepis, dokładnie tak samo jak wcześniej traktowaliśmy inny fragment
matematycznej prozy. Uzyskasz w ten sposób dwie wersje zdania będącego (parametryczną) treścią
definicji - oryginalną i tą, która powstała przez podstawienie.

Skorzystaj z aksjomatu 3 w jedyny sposób, w jaki możesz, żeby ustalić, że lewe strony obydwu wersji
definicji są równe. Zapisz tą równość.

Podziel obie strony przez *p(y)* (zakładając oczywiście, że ta wartość jest niezerowa). Uprość
jedyną stronę równania, którą da się w tym momencie uprościć.

Jeżeli wykonała/eś wszystkie te trywialne, mechaniczne operacje zgodnie z instrukcjami, to udało Ci
się udowodnić twierdzenie Bayesa, a właściwie jego uproszczoną wersję. Moim studentom, gdy robią to
po raz pierwszy w życiu, nie zajmuje to zwykle więcej niż 15 minut. Zwróć uwagę, że udowodniła/eś to
twierdzenie ani nie przytaczając ani nie odnosząc się do żadnych konkretnych *zdarzeń*, ani nie
obliczając żadnych wartości funkcji *p*. Czy widzisz, że o to między innymi, to znaczy o duży
stopień ogólności, chodzi w takich twierdzeniach?

Muszę zaznaczyć, że wersja twierdzenia Bayesa, którą udało Ci się udowodnić, jest mocno
uproszczona. Prawdopodobieństwa nie mogą być mniejsze niż *0* ani większe niż *1*, a nasze
prawdopodobieństwa to dowolne liczby, nie wiadomo nawet jakie, czy na przykład rzeczywiste, czy
wymierne. Tak się jednak składa, że nie potrzebowaliśmy korzystać z tych własności
prawdopodobieństwa. Wypadałoby wprowadzić pojęcie *zmiennnej losowej*, a zamiast o *zdarzeniach*
powinniśmy mówić o (dyskretnych) *zdarzeniach elementarnych*, albo o zdarzeniach zdefiniowanych
ogólniej. Niemniej, jako narzędzie stworzone dla pewnych skromnych celów dydaktycznych i w rękach
kogoś, kto zna i ma na uwadze wspomniane ograniczenia, ta zabawkowa wersja jest moim zdaniem
znacznie lepsza, niż nic.

Twierdzenie Bayesa odgrywa ważną rolę w psychologii - poznawczej i nie tylko - jak również w
ogólnych rozważaniach na temat oceny hipotez empirycznych, jednak nie będzie nas ono na razie
interesowało. Będziemy robić podobne rzeczy, ale nie na kartce.

# Funkcje, programy i implikacja

W tej części mówię dużo o funkcjach rozumianych jako efektywne procedury obliczeniowe (albo po
prostu programy, procedury, czy algorytmy) i o implikacji (w logice). Mam powody, żeby od tego
zacząć, ale trudno mi je dobrze wyjaśnić już teraz, bo nie mogę zakładać, że wiesz o pewnych
sprawach, bez znajomości których moje wyjaśnienia byłyby pewnie niezrozumiałe, nieprzekonujące, a
może nawet onieśmielające (cel jest dość ambitny).

Może powiem tak: Istnieje sposób, żeby jednocześnie uczyć się podstaw matematyki, programowania,
formalizowania treści wyrażonych w języku naturalnym i konstruowania dowodów matematycznych, a
wszystko to w interakcji z programem, który w tym pomaga. Żeby skorzystać z tego sposobu, trzeba się
*cierpliwie przyzwyczajać* do *nowego sposobu myślenia*, polegającego na patrzeniu na funkcje,
programy i implikacje jako na jedno i to samo.

## Funkcje w Lean

**Polecenie**: Korzystając z dowolnej przeglądarki wejdź na stronę

https://live.lean-lang.org

Rozpoczniesz w ten sposób interaktywną sesję z asystentem dowodzenia Lean. Będziesz pisać w oknie po
lewej i czasem zaglądać do okna po prawej. Żeby stworzyć w Lean proces dodający dwie liczby
naturalne możemy napisać tak (**Polecenie**: wklej poniższy kod do lewego okna Lean'a - wystarczy
kliknąć w ikonę kopiowania widoczną poniżej z prawej strony):

```lean
def suma (n : Nat) (m : Nat) : Nat := n + m
```

**Czytamy kod**: definiuję (`def`) wartość / znaczenie / treść symbolu suma (`suma`) jako term o
typie:

> Funkcja dwóch parametrów typu `Nat`, czyli typu liczba naturalna (`(n : Nat) (m : Nat)`), której
> rezultat też jest typu `Nat` (`: Nat`).

A więc wszystko między symbolem `suma` a symbolem definiowania `:=` to określenie *typu*, a nie
treści (lepiej: *ciała*) definicji stałej `suma`.

**Czytamy dalej**: Ten term konstruuję / definiuję jako (`:=`) zastosowanie funkcji dodawania - bo
to też jest pewna funkcja - do pierwszego i drugiego parametru, które to parametry nazwałem/am `n` i
`m`, bo tak mi się podobało.

Nazwy parametrów funkcji nie mają znaczenia w tym sensie, że na przykład taka oto alternatywna
definicja (z apostrofem w nazwie):

```lean
def suma' (a : Nat) (b : Nat) : Nat := a + b
```

jest w łatwym do uchwycenia sensie *tą samą* tylko *inaczej zapisaną funkcją*. Jest też inaczej
nazwana, bo w Lean nie możemy dowolnie re-definiować symboli.

**Ostateczność definicji w Lean**: Gdy raz zdefiniujemy jakiś symbol, tutaj symbole `suma` i
`suma'`, nie możemy już więcej (w tym samym kontekście, ale o tym kiedy indziej) zmienić jego
definicji, chyba, że najpierw usuniemy poprzednią definicję. Dlatego nazywamy te symbole *stałymi*.

**Polecenie**: Zastosuj funkcję `suma` do dwóch liczb naturalnych wklejając poniższy kod. Taką
konstrukcję nazywamy *aplikacją* funkcji do termu lub termów. Mówiąc dokładniej, poniższy kod
wymusza na Lean ewaluację (`#eval`) aplikacji funkcji `suma` do termów `1` i `2`. Umieść kursor nad
komendą `#eval` i odnajdź rezultat ewaluacji (liczbę *3*) w prawym oknie.

```lean
#eval suma 1 2
```

Zanim wyjaśnię, co się dzieje, gdy Lean ewaluuje taką aplikację, rozważymy prostszą funkcję:

```lean
def dodaj2 (a : Nat) : Nat := a + 2
```

**Polecenie**: Spróbuj odczytać samodzielnie sens tej defincji opierając się na fragmencie, w którym
objaśniłem jak się czyta poprzednią definicję. Najlepiej zrób to na głos, dzięki temu upewnisz się,
czy właściwy sposób czytania jest dla Ciebie jasny.

Myślę, że od razu widzisz, jak ta funkcja działa, nawet jeśli przed chwilą nie wiedziałe/aś nawet,
że język Lean istnieje. Myślę też, że jest już dla Ciebie oczywiste, że nazwa parametru (tutaj `a`)
nie ma znaczenia dla "sensu" tej funkcji: ta nazwa służy *tylko* do tego, żeby można było wewnątrz
ciała funkcji (całe ciało funkcji `dodaj2` to `a + 2`) "mówić" o jej argumencie.

**Polecenie**: Wklej *powyższy* kod, albo jeszcze lepiej, spróbuj go najpierw przepisać z pamięci,
żeby struktura takich definicji zaczęła Ci się lepiej utrwalać i żebyś ją szybciej mentalnie
"parsował/a". Następnie wpisz poniższą komendę i umieść kursor nad słowem `#check`:

```lean
#check @dodaj2
```

W prawym oknie widać teraz typ termu: `dodaj2 : Nat → Nat`. W Lean wyrażenie o postaci `A → B`
oznacza *typ*: *funkcja przekształcająca termy typu `A` w termy typu `B`*.

W widocznym po najechaniu kursorem na słowo `#check` komunikacie `dodaj2 : Nat → Nat` rozpoznajemy
więc informację, że `dodaj2` jest funkcją przekształcającą termy typu `Nat` w termy typu `Nat`,
czyli liczby naturalne w liczby naturalne. **Polecenie**: Przepisz poniższy kod i najedź kursorem na
słowo `#check`:

```lean
#check dodaj2
```

Teraz w prawym oknie widać tą samą informację co wcześniej, tylko pokazaną w innym stylu, bo symbol
`dodaj2` nie jest poprzedzony znakiem `@`.

**Polecenie**: Napisz w Lean w nowej linijce kod, który oznacza ewaluację aplikacji funkcji `dodaj2`
do liczby `2`. Najedź kursorem na `#eval` i popatrz na prawe okno. Upewnij się, że widzisz tam
poprawny wynik, czyli liczbę *4*.

**Ewaluacja aplikacji krok po kroku**: Zanim Lean obliczy (lepiej: dokona *ewaluacji*) rezultat
zastosowania (mówimy raczej aplikacji, żeby podkreślić, że chodzi nam o samo *zestawienie* funkcji z
argumentem, jeszcze bez żadnej ewaluacji) funkcji `dodaj2` do argumentu `2`:

1. Ewaluuje, czyli redukuje do prostszej postaci argument aplikacji. Tutaj jest tylko jeden
argument, `2`, a `2` jest tak naprawdę zdefiniowane jako `Nat.succ (Nat.succ Nat.zero)`, czyli jako
dwukrotna aplikacja funkcji `Nat.succ` - tak zwanej funkcji następnika - do symbolu `Nat.zero`,
który możemy traktować jako liczbę naturalną zero. W matematyce liczby naturalne definiuje się
zwykle w tym stylu, ale to nas teraz nie będzie interesowało. Teraz interesuje nas tylko to: przed
ewaluacją aplikacji funkcji do termu, który jest wtedy argumentem funkcji, Lean ewaluuje argument.

2. Lean podstawia rezultat ewaluacji pod (tak zwane *wolne*, ale o tym kiedy indziej) zmienne,
będące *parametrami funkcji*, w *ciele funkcji*. Tutaj podstawia "znaczenie" symbolu `2`, czyli
`Nat.succ (Nat.succ Nat.zero)`, pod symbol `a` w ciele funkcji `dodaj2`. W ten sposób powstaje `2 + 2`
(posługując się dalej zwięzłą notacją cyfrową).

3. Następnie Lean ewaluuje uzyskaną w ten sposób wersję ciała funkcji. Tego wątku nie będę teraz
rozwijał, powiem tylko, że dodawanie liczb naturalnych ma w Lean piękną definicję rekurencyjną.

Wydaje mi się, że dokładnie czegoś takiego się spodziewałe/aś, może pomijając to, jak są
zdefiniowane liczby naturalne i dodawanie. Jeżeli chcesz się dowiedzieć czegoś więcej o tej
definicji liczb naturalnych, poszukaj samodzielnie informacji na temat aksjomatów Peano.

**Parametry i argumenty**: Symbol `a` jest *parametrem* funkcji `dodaj2`. Gdy aplikujemy `dodaj2` na
przykład do liczby `10`, to wtedy (i tylko wtedy) `10` staje się *argumentem* tej funkcji. Parametr
funkcji jest więc jej stałą częścią, a konkretnie nazwanym "wejściem" i ta nazwa jest widoczna dla
kodu w ciele funkcji, natomiast argument jest termem, który w danym fragmencie kodu jest przypisany
do parametru:

```lean
def minus2 (a : Nat) : Nat := 
    -- To jest ciało funkcji, tylko zapisane w następnej linijce. Widać tu zmienną a, będącą parametrem tej funkcji:
    a - 2

-- Tutaj 3 jest argumentem funkcji minus2, ale nie zachodzi ewaluacja, sprawdzamy tylko typ aplikacji:
#check minus2 3

-- A tu wymuszamy ewaluację aplikacji, czyli podstawienie argumentu 3 za parametr a w ciele minus2:
#eval minus2 3
```

**Zasięg nazw**: Gdybyś teraz w kolejnej linijce wkleił/a do Lean'a kod `#eval n`, to zobaczył/abyś
błąd, ponieważ `n` i `m` to w tym momencie *tylko* formalne parametry funkcji `suma`, które są
*widoczne tylko z wnętrza ciała* funkcji `suma` (które to ciało składa się tylko z wyrażenia `n + m`).

**Polecenie**: Napisz `#eval n` w nowej linijce - zobaczysz wtedy, że symbol `n` będzie podkreślony
czerwoną falką. W ten sposób Lean sygnalizuje, że nie ma pojęcia, o czym mówisz, a nie ma pojęcia,
bo symbol `n` jest widoczny tylko wewnątrz ciała funkcji `suma` . Usuń ten błędny kod.

**Funkcja jako pudełko z mechanizmem**: Możemy myśleć o funkcji `suma` jako o pudełku, które ma dwa
wejścia, jedno oznaczone literą *n*, a drugie literą *m*, i które ma jedno wyjście, a w środku
zawiera "mechanizm dodający" obiekty pojawiające się na wejściach. Jeżeli wyobrazimy sobie, że ten
wewnętrzny mechanizm jest "przyklejony" do wejść, to stanie się jasne, że nazwy wejść nie mają
znaczenia i istnieją tylko dla wygody użytkownika.

Za to *typy* wejść i *typ* wyjścia (funkcja ma zawsze tylko jedno wyjście) *mają* znaczenie. Nie
możemy podawać na wejściu funkcji dodającej liczby czegokolwiek - to muszą być wyrażenia typu liczba
(tutaj akurat wymagamy liczb naturalnych) i tak też mówi nasza definicja. Jeżeli podamy na wejściu
dwa wyrażenia typu liczba naturalna, to na wyjściu pojawi się (gdy wymusimy ewaluację) liczba
naturalna. To będzie wynik dodawania wejść, bo tak jest skonstruowana zawartość pudełka o nazwie
*suma*.

**Bardziej skomplikowany przykład ewaluacji aplikacji**: Myślę, że domyślasz się już, dlaczego jest
poprawny i jak jest ewaluowany poniższy (dziwaczny, wiem) fragment kodu. Przypominam, że `Nat.succ`
to funkcja następnika. Ta funkcja dla każdej liczby naturalnej daje następną liczbę naturalną.
`Nat.zero` to z perspektywy Lean'a dosłownie (a nie cyfrowo) zapisana liczba naturalna zero:

```lean
#eval suma (Nat.succ (Nat.succ 3)) (6 - (2 + Nat.zero))
```

Ewaluacja całego tego wyrażenia zaczyna się od ewaluacji argumentów, które same są aplikacjami, w
dodatku czasem aplikacjami pewnych funkcji (`Nat.succ` i `-`) *do rezultatów aplikacji* pewnych
funkcji (`Nat.succ` aplikowane do rezultatu aplikacji `Nat.succ` do termu `3` i funkcja `-`
aplikowana do termu `6` i rezultatu aplikacji funkcji `+`). Zwracam uwagę, że w tym kontekście `+` i
`-` też oznaczają pewne (dwuarguentowe) funkcje, tylko zapisane w *notacji infiksowej*:

`argument1 funkcja argument2`, na przykład `1 + 2`

zamiast w *notacji prefiksowej*:

`funkcja argument1 argument2`, na przykład `suma 1 2`

bo tak się zwykle zapisuje dodawanie i odejmowanie. Każdą taką ewaluację Lean zaczyna od ewaluacji
najbardziej "wewnętrznych" aplikacji (jeżeli w ogóle jakieś są).

**Co jest czego czym w aplikacjach**: Jesteś w stanie domyślić się, na czym polega błąd w kodzie
poniżej?

```lean
#eval suma Nat.succ 2 3
```

Funkcja `suma` wymaga argumentów typu `Nat`. Pierwszy argument aplikacji jest tutaj jednak *funkcją*
(`Nat.succ`), a nie liczbą naturalną. Żeby ten kod był poprawny, trzeba otoczyć fragment `Nat.succ
2` nawiasami:

```lean
#eval suma (Nat.succ 2) 3
```

**W Lean nie ma funkcji "prawdziwie" dwuargumentowych**: Funkcja `suma` *wygląda* jak funkcja
dwuargumentowa, ale tak naprawdę nie jest dwuargumentowa. Jest funkcją jednoargumentową, *która
zwraca funkcję jednoargumentową*, która dopiero dodaje parametr tej pierwszej funkcji do swojego
jedynego parametru. Może przeczytaj to jeszcze raz. Taki sposób definiowania funkcji więcej niż
jednoargumentowych nazywa się *Curryingiem*, od nazwiska pewnego wybitnego matematyka.

**Polecenie**: Napisz kod pozwalający zobaczyć typ (uwaga: *typ*, a nie *rezultat ewaluacji*, a więc
nie masz teraz używać komendy `#eval`) aplikacji funkcji `suma` do *tylko jednego* argumentu
`10`. Jak Ci się uda, zobaczysz w prawym oknie komunikat:

```lean
suma 10 : Nat → Nat
```

**Czytamy to**: aplikacja funkcji `suma` do termu `10` ma typ `Nat → Nat`, czyli jest funkcją (w
Lean *jest funkcją* znaczy to samo, co *jest termem typu funkcja*) przekształcającą liczby naturalne
w liczby naturalne. Jaka to jest funkcja? Znamy definicję symbolu `suma`, więc domyślamy się, że
`suma 10` to wyrażenie, które jakby "czeka na brakujący argument". Jest to więc jednoargumentowa
funkcja, która do dowolnej liczby naturalnej dodaje `10` (dodaje `10` "od przodu", bo "robi" `10 +
m`).

**Polecenie**: Sprawdź typ (a nie ewaluuj) termu `suma`, ale poprzedzonego znakiem `@`, żeby się
przekonać, że `suma` to tak naprawdę funkcja, która przekształca dowolną liczbę naturalną w funkcję,
która z kolei przekształca dowolną liczbę naturalną w liczbę naturalną.

## Typy to też termy, a zdania to jednocześnie termy typu Prop i typy, których termy są ich dowodami

Stała `2` jest termem typu `Nat`. `Nat` jest tylko pewną stałą / pewnym symbolem, czyli zapisem,
etykietą, niczym więcej, którą możemy konsekwentnie interpretować jako oznaczającą typ liczb
naturalnych. W szczególności, `Nat` *nie* jest *zbiorem liczb naturalnych*, chociaż w dużym stopniu
możemy go używać dość podobnie. Termy typu `Nat` są liczbami naturalnymi, ponieważ Lean dostarcza
dla nich taką a nie inną funkcjonalność. Mówimy, że te termy *zamieszkują* typ `Nat`, a nie, że są
jego *elementami*, bo ta terminologia jest zarezerwowana dla elementów należących do zbiorów.

W teorii typów której używamy w Lean każdy typ jest również termem, ale typu ogólniejszego, i tak w
nieskończoność (jak skopiujesz ten kod, to gdy kursor będzie nad `#check`, zobaczysz po prawej to,
co jest zapisane jako komentarz po znakach `--`):

```lean
#check 2 -- 2 : Nat

#check Nat -- Nat : Type

#check Type -- Type : Type 1

#check Type 1 -- Type 1 : Type 2
```

i tak dalej... Te typy wyższych rzędów są potrzebne tylko z pewnych (dość nudnych) powodów
technicznych (może słyszała/eś o paradoksie Russella? Chodzi o coś zbliżonego).

Lean ma również wbudowany typ `Prop`, który będzie odtąd dla nas ważny. Nazwa tego typu jest skrótem
od angielskiego słowa *Proposition* oznaczającego *zdanie* albo *sąd*. Termy typu `Prop` można
konsekwentnie interpretować jako zdania. Będziemy więc mówić po prostu, że termy typu `Prop` to
zdania. To może być na początku dezorientujące:

Jeżeli `a : Prop` (czytaj: `a` jest termem typu `Prop` albo `a` jest zdaniem), to jeżeli `h : a`
(czytaj: `h` ma typ `a` albo `h` jest termem typu `a`), to możemy konsekwentnie interpretować `h`
jako *dowód zdania `a`*. Dlatego będziemy w takich sytuacjach mówić krótko, że `h` jest dowodem `a`:

To, że możemy w ten sposób konsekwentnie interpretować termy typu `Prop` i termy, których te termy
są typami (nie zgubiła/eś się?) wynika z [izomorfizmu
Curry'ego-Howarda](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence), czyli z
identyczności strukturalnej (bo tym jest izomorfizm) zachodzącej między (pewną) przestrzenią
programów komputerowych i przestrzenią dowodów. Inne określenie na to samo to *Propositions As
Types*, czyli *sądy jako typy*, o takim samym skrócie - *PAT* - co jeszcze inne określenie na to
samo, *Proofs As Terms*, czyli *dowody jako termy*. Jeżeli te uwagi budzą Twój niepokój, nie
przejmuj się nimi, będziemy korzystać z tego izomorfizmu, ale nie będziemy się mu szczegółowo
przyglądać.

W praktyce izomorfizm Curry'ego-Howarda oznacza, że możemy kodować, to jest zapisywać w języku
teorii typów w sposób dający się konsekwentnie interpretować w zamierzony sposób, matematyczne
pojęcia, struktury i zdania jako *typy* i że termy typów zdaniowych możemy konsekwentnie traktować
jak dowody. Dzięki temu zaciera się, a czasem całkiem znika, różnica między matematyką i
programowaniem.

**(De)Motywator**: Że dowód jest termem o typie, który jest zdaniem, którego to zdania ten term
dowodzi (*uff*), to jest jedna z tych początkowo dezorientujących konwencji, do których trzeba się
po prostu stopniowo przyzwyczaić. Gdy to już do pewnego stopnia nastąpi, ta akurat konwencja pozwoli
Ci zobaczyć *całą* matematykę w nowy sposób.

Jedną z wielu zalet tego punktu widzenia jest i ta, że można wtedy uprawiać matematykę albo tylko
uczyć się jej w interakcji z programem wspomagającym konstruowanie pojęć, teorii, własnej notacji i
dowodów matematycznych, czyli z asystentem dowodzenia, takim jak Lean. Można mieć wtedy nie tylko
pewność, że to, co się napisało czy skonstruowało jest poprawne, albo że jest błędne, ale też można
korzystać z rozmaitych ułatwień, jakie oferuje dany asystent.

## O logice w Lean

**Ostrzeżenie**: Będzie trzeba się stopniowo oswoić z konsekwentnym *odróżnianiem* (i elastycznym
*przełączaniem się* między odpowiadającymi następującym różnicom punktami widzenia):

1. Dowolnych zdań *jako takich*, a więc niekoniecznie prawdziwych, od...

2. *Prawdziwości lub fałszywości* dowolnych zdań, a tego z kolei od...

3. Ewentualnego *faktu*, że jakieś zdanie (albo jego negacja) *ma dowód*, wreszcie...

4. *Założenia*, że zdanie ma *jakiś* dowód, od faktu, że taki dowód został *skonstruowany*.

W tym momencie to, że to nie są te same rzeczy czy fakty, może Ci się wydawać wręcz oczywiste i nie
warte objaśniania, ale przekonasz się, że te fundamentalne rozróżnienia będą Ci sprawiać trudności
nawet w stosunkowo prostych sytuacjach. Jeszcze raz - cierpliwości. Gdybym ja czytał tekst taki jak
ten, nie znając wcześniej tematu, na pewno wracałbym wielokrotnie do niektórych mniej jasnych dla
mnie fragmentów.

**O czym to będzie**: Zajmiemy się *implikacją*. Implikacja jest być może najważniejszym spójnikiem
w logice. Mówiąc luźno, implikacjami nazywamy zdania o postaci *Jeżeli A, to B*, gdzie *A* i *B* to
*dowolne* zdania, proste lub złożone (i tylko same zdania, a nie ich prawdziwość czy fałszywość,
albo fakt bycia dowiedzionym, albo ich dowody). Powszechnie zapisuje się implikację za pomocą
strzałki skierowanej w prawo: →.

Jeżeli *A* i *B* to zdania - i tylko wtedy - to formalnie, czyli w "oficjalnym" języku matematyki,
implikację *Jeżeli A, to B* zapisujemy zwykle jako *A → B*. Czy przypomina Ci to coś, o czym
mówiliśmy już wcześniej?

**Dygresja**: Niektórzy mówią, że język matematyki jest *precyzyjny*, jednak w matematyce mówimy
czasem *celowo nieprecyzyjnie*. Na przykład, możemy wyrazić wprost w matematyce zdanie, że jakaś
wielkość znajduje się w jakimś szerokim interwale, albo że jest mniej lub bardziej prawdopodobna.

W matematyce mówimy też czasem *celowo wieloznacznie*. Na przykład, my niebawem będziemy stopniowo
zacierać różnice między funkcjami i implikacjami.

Co więc wyróżnia język matematyki, poza *relatywną sztucznością*, która nie wydaje się taka istotna?
Nie jestem pewien, ale gdybym miał zgadywać, powiedziałbym, że jest to *jednoznaczność i sztywność
reguł użycia*, ale tylko *formalnego*, czyli mechanicznego. I jeszcze to, że chociaż pojęcia
matematyczne często mają genezę w pojęciach często używanych w języku naturalnym, to zwykle stanowią
ich wersję bardzo uproszczoną do kilku dobrze określonych właściwości. Te są wyrażane czasem jako
*aksjomaty*, czyli podawane bez uzasadnienia formalnego, a więc *bez dowodu* (za to zwykle z
uzasadnieniem w języku naturalnym) *konwencje dotyczące dopuszczalnych sposobów używania pojęć*
(czyli pewne formalne reguły gry).

W ten sposób - odzierając pojęcia (na przykład, pojęcia zdania, prawdy i fałszu) ze zbędnych dla
dobrze określonych celów znaczeń (na przykład, dla celu analizy w pewien techniczny sposób
rozumianej poprawności rozumowań), uzyskujemy całkowitą sztywność reguł użycia i wysoki poziom
abstrakcji. Sztywność reguł pozwala na mechaniczną weryfikację wyrażeń (w tym poprawności dowodów),
a abstrakcyjność daje ogólność zastosowań.

**Oswojenie z terminologią logiczną**: Zawsze, gdy mamy jakieś dwa, niekoniecznie różne zdania *A* i
*B*, możemy napisać *A → B* i to będzie poprawne wyrażenie (poprawna formuła logiczna), które
interpretujemy jako (niekoniecznie prawdziwe, a tym bardziej udowodnione) zdanie *Jeżeli A, to
B*. Mówimy też, że *→* to w logice pewna *dwuargumentowa operacja* albo *działanie*, tyle że na
zdaniach, które to działanie z dwóch *zdań jako takich* (niekoniecznie udowodnionych czy
prawdziwych) robi jedno (niekoniecznie udowodnione czy prawdziwe) unikalne zdanie złożone, dające
się konsekwentnie interpretować jako *Jeżeli A, to B*. 

Może przyda Ci się wyobrażenie sobie, że zdanie w logice to coś płaskiego i niemal przezroczystego,
a jego dowód to jakiś barwny skarb, który prześwituje przez powierzchnię zdania, jeśli ten dowód
istnieje i umiemy na to zdanie popatrzeć tak, żeby ten prześwit zobaczyć.

**Analogia między implikacją i typem funkcyjnym**:

Jeżeli *A* i *B* to *zdania*, to *A → B* jest *implikacją*.

Jeżeli `A` i `B` to *typy*, to `A → B` jest *typem funkcji przekształcających termy typu `A` w termy
typu `B`*.

**Polecenie**: Spróbuj zaakceptować tą konsekwencję nie szukając w tym na razie sensu (nie musisz
tego teraz zapamiętać): *Ponieważ w teorii typów każde zdanie jest typem, to każda implikacja jest
funkcją*.

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
aplikację tej funkcji do trzech liczb naturalnych i sprawdź, czy wynik się zgadza.

[Do następnej części](./Lean_dla_psychologow_2.md)

### Przypisy

[^1]: To jest luźna parafraza cytatu, ale nie pamiętam czyjego. Chyba jakiegoś buddysty.
