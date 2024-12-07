# Ogólne uwagi o skrypcie

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
badań nieuzasadnione (czytaj: błędne, co nie znaczy, że na pewno fałszywe) wnioski, popełniając przy
tym często najprostsze nawet błędy. Dobrymi przykładami są wnioskowanie o braku efektu na podstawie
samego tylko nieistotnego wyniku testu statystycznego, albo wnioskowanie o wpływie czy innych
własnościach przyczynowych bez wprowadzenia i uzasadnienia koniecznych założeń (nadal nie wszyscy
psychologowie wiedzą, że [przyczynowość została
zmatematyzowana](https://en.wikipedia.org/wiki/Causal_inference)). Matematycznym analfabetom udaje
się publikować swoje prace w wysokopunktowanych czasopismach, bo te prace są najczęściej oceniane
przez innych matematycznych analfabetów.

Matematyczny analfabetyzm ogromnej większości psychologów jest łatwym do zaobserwowania faktem. Ten
analfabetyzm, a raczej jego ekstremalny poziom, ma tylko jedną przyczynę - *nikt*, włączając w to
osoby prowadzące zajęcia ze statystyki, nie wymaga od psychologów znajomości matematyki, a mało kto
systematycznie uczy się matematyki z własnej woli. W mojej ocenie to jest jednocześnie śmieszne,
żałosne, nieakceptowalne, i nie widzę, żeby ktokolwiek próbował to zmienić.

To jest eksperyment pedagogiczny oparty na założeniu, że (przynajmniej Ci młodsi) psychologowie
często mniej boją się programowania niż matematyki, a poza tym z programowaniem mogą się oswajać w
interakcji z komputerem dostarczającym natychmiastowej informacji zwrotnej. Ten eksperyment
pedagogiczny ma pomóc w oswajaniu się z matematyką studentom na kierunku psychologia i pracownikom
akademickim zajmującym się badaniami psychologicznymi, którzy są gotowi podjąć próbę poznania
nowego, pięknego, i bardzo ekspresyjnego języka programowania.

Ten skrypt *może zawierać błędy we fragmentach napisanych w języku naturalnym*, czyli w tych
częściach, w których mniej lub bardziej po swojemu objaśniam kod lub zapędzam się w dygresje. Gdybyś
znalazł/a błąd, byłoby mi bardzo miło, gdybyś mi o tym napisał/a (borys.paulewicz@gmail.com).

Ten skrypt *prawie na pewno nie zawiera błędów w częściach formalnych*, to jest zakodowanych w
pewnej wersji języka teorii typów zależnych zaimplementowanej w asystencie dowodzenia Lean. Ponieważ
te części zostały sprawdzone przez algorytm, którego używa [Lean](https://lean-lang.org/), mało
czego można być tak pewnym jak tego, że są bezbłędne.

**Ostrzeżenie**: Nawet jeżeli przeczytasz ten skrypt do końca i uda Ci się zrobić poprawnie zadania,
których jest zresztą niewiele, jest możliwe, że po wszystkim będziesz czuć coś w rodzaju
dezorientacji lub braku poczucia sensu. Będziemy się zajmować bardzo abstrakcyjnymi pojęciami,
dlatego takie poczucie jest na początku prawdopodobne. Ja też się podobnie czułem, gdy po raz
pierwszy miałem kontakt z tymi treściami. To poczucie może się stopniowo zmienić w coraz głębsze
zrozumienie, ale to wymaga *cierpliwości*. Oto moja rada: Naukowcem z prawdziwego zdarzenia nie
zostaje się z dnia na dzień. Daj sobie czas, żeby wszystko zdążyło się trochę "uleżeć" i pogódź się
z tym, że dobre opanowanie tego rodzaju materiału wymaga czasem wielokrotnego aktywnego czytania
tych samych fragmentów.

**Praktyczna wskazówka**: Ten skrypt nie jest długi. Przeczytanie go i wykonanie poleceń powinno Ci
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

- Zmienną, o której wcześniej założyłeś, że oznacza (jakąś) liczbę naturalną

- Wyrażenie, które po obliczeniu daje liczbę naturalną

Trzeba tylko pamiętać, żeby podstawianie było konsekwentne, to znaczy, za *n* powinno być wszędzie
podstawione to samo i za *m* wszędzie to samo, i to nie muszą być dwie różne rzeczy. Na przykład,
zgodnie z przytoczonym fragmentem *2 + 3 = 3 + 2*, jak również, jeżeli *a* i *b* to liczby naturalne
(i tylko wtedy!), to *a + b = b + a*, *a + 10 = 10 + a*, *b + b = b + b*, *(2 + 3 + a) + b = b +
(2 + 3 + a)*, bo *2 + 3 + a* oznacza w tym kontekście (oto cały kontekst: *a* jest liczbą naturalną)
jakąś liczbę naturalną, i tak dalej. Myślę, że zgodzisz się ze mną, że tego rodzaju formalne
operacje większość dzieci opanowuje w szkole podstawowej.

Spróbuj chwilowo potraktować takie formalne reguły jako *reguły gry, która nie musi mieć żadnego
sensu*. Uwierz mi, bo sprawdzałem to wielokrotnie, potrzeba sensu na tym etapie może Ci
przeszkadzać. Obiecuję, że sens się pojawi, tylko kiedy indziej. Zdolność do tymczasowego stłumienia
w sobie potrzeby sensu bywa bardzo korzystna, a czasem wręcz nieodzowna w nauce matematyki.

Znajdź czystą kartkę papieru i coś do pisania. Napisz na niej trzy zdania, które będziemy chwilowo
rozumieć jako *aksjomaty*, czyli reguły gry na które umawiamy się bez uzasadnienia:

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
oryginalnej wersji jest *x*, a *x* wszędzie tam, gdzie w oryginalnej wersji jest *y*. Uzyskasz w ten
sposób dwie wersje zdania będącego treścią tej definicji - oryginalną i tą, która powstała przez
podstawienie.

Skorzystaj z aksjomatu 3 w jedyny sposób, w jaki możesz, żeby ustalić, że lewe strony obydwu wersji
definicji są równe. Zapisz tą równość.

Podziel obie strony przez *p(y)* (zakładając oczywiście, że ta wartość jest niezerowa). Uprość
jedyną stronę równania, którą da się w tym momencie uprościć.

Jeżeli wykonała/eś wszystkie te trywialne, mechaniczne operacje zgodnie z instrukcjami, to udało Ci
się właśnie udowodnić twierdzenie Bayesa. Moim studentom, gdy robią to po raz pierwszy w życiu, nie
zajmuje to zwykle więcej niż 15 minut. Zwróć uwagę, że udowodniła/eś to twierdzenie ani nie
przytaczając ani nie odnosząc się do żadnych konkretnych *zdarzeń*, ani nie obliczając żadnych
wartości funkcji *p*. Czy widzisz, że o to między innymi, to znaczy o duży stopień ogólności, chodzi
w takich twierdzeniach?

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

# Funkcje, programy, i implikacja

W tej części mówię dużo o funkcjach rozumianych jako efektywne procedury obliczeniowe (albo po
prostu programy, procedury, czy algorytmy) i o implikacji (w logice). Mam powody, żeby od tego
zacząć, ale trudno mi je dobrze wyjaśnić już teraz, bo nie mogę zakładać, że wiesz o pewnych
sprawach, bez znajomości których moje wyjaśnienia byłyby pewnie niezrozumiałe, nieprzekonywujące, a
może nawet onieśmielające (cel jest ambitny).

Może powiem tak: Istnieje sposób, żeby jednocześnie uczyć się podstaw matematyki, programowania,
formalizowania treści wyrażonych w języku naturalnym, i konstruowania dowodów matematycznych, a
wszystko to w interakcji z programem, który w tym pomaga. Żeby skorzystać z tego sposobu, trzeba się
*cierpliwie przyzwyczajać* do *nowego sposobu myślenia*, polegającego na patrzeniu na funkcje,
programy i implikacje jako na jedno i to samo.

## Funkcje w Lean

**Polecenie**: Korzystając z dowolnej przeglądarki wejdź na stronę

https://live.lean-lang.org

Rozpoczniesz w ten sposób interaktywną sesję z asystentem dowodzenia Lean. Będziesz pisać w oknie po
lewej i czasem zaglądać do okna po prawej. Żeby stworzyć w Lean proces dodający dwie liczby
naturalne możemy napisać tak (**Polecenie**: wklej poniższy kod do lewego okna Leana - wystarczy
kliknąć w ikonę kopiowania widoczną poniżej z prawej strony):

```lean
def suma (n : Nat) (m : Nat) : Nat := n + m
```

**Czytamy kod**: definiuję (`def`) wartość / znaczenie / treść symbolu suma (`suma`) jako term o
typie:

> Funkcja dwóch parametrów typu `Nat`, czyli typu liczba naturalna (`(n : Nat) (m : Nat)`), której
> rezultat też jest typu `Nat` (`: Nat`).

A więc wszystko między symbolem `suma` a symbolem definiowania `:=` to określenie *typu*, a nie
treści, definicji stałej `suma`.

**Czytamy dalej**: Ten term konstruuję / definiuję jako (`:=`) zastosowanie funkcji dodawania (bo to
też jest pewna funkcja!) do pierwszego i drugiego parametru, które to parametry nazwałem/am `n` i
`m`, bo tak mi się podobało.

Nazwy parametrów funkcji nie mają znaczenia w tym sensie, że na przykład taka oto alternatywna
definicja (z apostrofem w nazwie):

```lean
def suma' (a : Nat) (b : Nat) : Nat := a + b
```

jest w łatwym do uchwycenia sensie *tą samą* tylko *inaczej zapisaną funkcją* (i inaczej nazwaną, bo
w Lean nie możemy dowolnie re-definiować symboli).

**Ostateczność definicji w Lean**: Gdy raz zdefiniujemy jakiś symbol, tutaj symbole `suma` i
`suma'`, nie możemy już więcej (w tym samym kontekście, ale o tym kiedy indziej) zmienić jego
definicji, chyba, że najpierw usuniemy poprzednią definicję.

**Polecenie**: Zastosuj funkcję `suma` do dwóch liczb naturalnych wklejając poniższy kod. Taką
konstrukcję nazywamy *aplikacją* funkcji do termu lub termów. Mówiąc dokładniej, poniższy kod
wymusza na Lean ewaluację (`#eval`) aplikacji funkcji `suma` do termów `1` i `2`. Umieść kursor nad
komendą `#eval` i odnajdź rezultat ewaluacji (liczbę *3*) w prawym oknie.

```lean
#eval suma 1 2
```

Zanim wyjaśnię, co się dzieje, gdy Lean ewaluuje taką aplikację, popatrzymy na prostszą funkcję:

```lean
def dodaj2 (a : Nat) : Nat := a + 2
```

**Polecenie**: Spróbuj odczytać samodzielnie sens tej defincji opierając się na fragmencie, w którym
objaśniłem jak się czyta poprzednią definicję. Najlepiej zrób to na głos, dzięki temu upewnisz się,
czy każdy aspekt sposobu czytania takiego kodu jest dla Ciebie jasny.

Myślę, że od razu widzisz, jak ta funkcja działa, nawet jeśli przed chwilą nie wiedziałe/aś nawet,
że język Lean istnieje. Myślę też, że jest już dla Ciebie oczywiste, że nazwa parametru (tutaj `a`)
nie ma znaczenia dla "sensu" tej funkcji: ta nazwa służy *tylko* do tego, żeby można było wewnątrz
ciała funkcji (całe ciało funkcji `dodaj2` to `a + 2`) "mówić" o jej argumencie.

**Polecenie**: Wklej *powyższy* kod, albo jeszcze lepiej, spróbuj go najpierw przepisać z pamięci,
żeby struktura takich definicji zaczęła Ci się lepiej utrwalać i żebyś ją szybciej mentalnie
"parsował/a". Następnie wpisz poniższą komendę i najedź kursorem na słowo `#check`:

```lean
#check @dodaj2
```

W prawym oknie widać teraz typ termu - `dodaj2 : Nat → Nat`. W Lean wyrażenie o postaci `A → B`
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

**Ewaluacja aplikacji krok po kroku**: Zanim Lean obliczy (mówimy raczej dokona *ewaluacji*, bo to
ogólniejsze pojęcie) rezultat zastosowania (mówimy raczej aplikacji, żeby podkreślić, że chodzi nam
o samo *zestawienie* funkcji z argumentem, jeszcze bez żadnej ewaluacji) funkcji `dodaj2` do
argumentu `2`:

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
(tutaj akurat wymagamy liczb naturalnych), i tak też mówi nasza definicja. Jeżeli podamy na wejściu
dwa wyrażenia typu liczba naturalna, to na wyjściu pojawi się liczba naturalna. To będzie wynik
dodawania wejść, bo tak jest skonstruowana zawartość pudełka o nazwie *suma*.

**Bardziej skomplikowany przykład ewaluacji aplikacji**: Myślę, że domyślasz się już, dlaczego jest
poprawny i jak jest ewaluowany poniższy (dziwaczny, wiem) fragment kodu. Przypominam, że `Nat.succ`
to funkcja następnika. Ta funkcja dla każdej liczby naturalnej daje następną liczbę naturalną.
`Nat.zero` to z perspektywy Lean'a dosłownie (a nie cyfrowo) zapisana liczba naturalna zero:

```lean
#eval suma (Nat.succ (Nat.succ 3)) (6 - (2 + Nat.zero))
```

Ewaluacja całego tego wyrażenia zaczyna się od ewaluacji argumentów, które same są aplikacjami, i to
czasem aplikacjami pewnych funkcji (`Nat.succ` i `-`) do rezultatów aplikacji pewnych funkcji
(`Nat.succ` aplikowane do rezultatu aplikacji `Nat.succ` do termu `3` i funkcja `-` aplikowana do
termu `6` i rezultatu aplikacji funkcji `+`). Zwracam uwagę, że w tym kontekście `+` i `-` też
oznaczają pewne - dwuarguentowe - funkcje, tylko zapisane w *notacji infiksowej*:

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
(`Nat.succ`), a nie liczbą naturalną. Żeby ten kod był poprawny trzeba otoczyć fragment `Nat.succ 2`
nawiasami:

```lean
#eval suma (Nat.succ 2) 3
```

**W Lean nie ma funkcji "prawdziwie" dwuargumentowych**: Funkcja `suma` *wygląda* jak funkcja
dwuargumentowa, ale tak naprawdę nie jest dwuargumentowa. Jest funkcją jednoargumentową, *która
zwraca funkcję jednoargumentową*, która dopiero dodaje parametr tej pierwszej funkcji do parametru
tej drugiej. Może przeczytaj to jeszcze raz. Taki sposób definiowania funkcji więcej niż
jednoargumentowych nazywa się Curryingiem, od nazwiska pewnego wybitnego matematyka.

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

## Typy to też termy, a zdania to jednocześnie termy typu `Prop` i typy, których termy są ich dowodami

Stała `2` jest termem typu `Nat`. `Nat` jest tylko zapisem albo etykietą, niczym więcej, którą
możemy konsekwentnie interpretować jako oznaczającą typ liczb naturalnych, ponieważ Lean dostarcza
taką a nie inną funkcjonalność dla termów typu `Nat`. W teorii typów której używamy w Lean każdy typ
jest również termem, ale typu ogólnijszego, i tak w nieskończoność (jak skopiujesz ten kod, to gdy
kursor będzie nad `#check` zobaczysz po prawej to, co jest zapisane jako komentarz po znakach `--`):

```lean
#check 2 -- 2 : Nat

#check Nat -- Nat : Type

#check Type -- Type : Type 1
```

Te typy wyższych rzędów są potrzebne tylko z (dość nudnych) powodów technicznych (może słyszała/eś o
paradoksie Russella? Chodzi o coś zbliżonego). 

Lean ma również wbudowany typ `Prop`, który będzie odtąd dla nas ważny, będący skrótem od
angielskiego słowa *Proposition* oznaczającego *zdanie* albo *sąd*. Termy typu `Prop` można
konsekwentnie interpretować jako zdania. Będziemy więc mówić po prostu, że termy typu `Prop` to
zdania. To może być na początku dezorientujące:

Jeżeli `a : Prop` (czytaj: `a` jest termem typu `Prop` albo `a` jest zdaniem), to jeżeli `h : a`
(czytaj `h` ma typ `a` albo `h` jest termem typu `a`), to możemy konsekwentnie interpretować `h`
jako *dowód zdania `a`*. Dlatego będziemy w takich sytuacjach mówić krótko, że `h` jest dowodem `a`.

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
pojęcia, struktury i zdania jako *typy*, i że termy typów zdaniowych możemy konsekwentnie traktować
jak dowody. Dzięki temu zaciera się, a czasem znika, różnica między matematyką i programowaniem.

**(De)Motywator**: Że dowód jest termem o typie, który jest zdaniem, którego to zdania ten term
dowodzi (*uff*), to jest jedna z tych początkowo dezorientujących konwencji, do których trzeba się
po prostu stopniowo przyzwyczaić. Gdy to już do pewnego stopnia nastąpi, ta akurat konwencja pozwoli
Ci zobaczyć *całą* matematykę w nowy sposób.

Jedną z wielu zalet tego punktu widzenia jest i ta, że można wtedy uprawiać matematykę albo tylko
uczyć się jej w interakcji z programem wspomagającym konstruowanie pojęć, teorii i dowodów
matematycznych, czyli z asystentem dowodzenia, takim jak Lean. Można mieć wtedy nie tylko pewność,
że to, co się napisało czy skonstruowało jest poprawne, albo że jest błędne, ale też można korzystać
z rozmaitych ułatwień, jakie oferuje dany asystent.

## O logice w Lean

**Ostrzeżenie**: Będzie trzeba się stopniowo oswoić z konsekwentnym odróżnianiem (i przełączaniem
się czasem między odpowiadającymi tym różnicom punktami widzenia):

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
strzałki skierowanej w prawo →.

Jeżeli *A* i *B* to zdania - i tylko wtedy - to formalnie, czyli w oficjalnym, jednoznacznym języku
matematyki, implikację *Jeżeli A, to B* zapisujemy zwykle jako *A → B*. Czy przypomina Ci to coś, o
czym mówiliśmy już wcześniej?

**Dygresja**: Niektórzy mówią, że język matematyki jest *precyzyjny*, jednak w matematyce mówimy
czasem *celowo nieprecyzyjnie*. Na przykład, możemy wyrazić wprost w matematyce zdanie, że jakaś
wielkość znajduje się w jakimś szerokim interwale, albo że jest mniej lub bardziej prawdopodobna.

W matematyce mówimy też czasem *celowo wieloznacznie*. Na przykład, my niebawem będziemy stopniowo
zacierać różnice między funkcjami i implikacjami.

Co więc wyróżnia język matematyki, poza *relatywną sztucznością*, która nie wydaje się taka istotna?
Nie jestem pewien, ale gdybym miał zgadywać, powiedziałbym, że jest to *jednoznaczność i sztywność
reguł użycia*. I jeszcze to, że chociaż pojęcia matematyczne często mają genezę w pojęciach często
używanych w języku naturalnym, to zwykle stanowią ich wersję bardzo uproszczoną do kilku dobrze
określonych własności. Te własności są wyrażane na przykład jako aksjomaty, czyli konwencje
dotyczące dopuszczalnych sposobów używania pojęć.

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

**Przy okazji**: Powyższa analogia może wygląda jak wieloznaczność i w pewnym sensie nią
jest. Jednak to byłaby wieloznaczność problematyczna tylko gdybyśmy sprawili, że nie jest całkiem
jasne, którą interpretację stosujemy i gdyby *jednocześnie* ta różnica w dopuszczalnych
interpretacjach miała znaczenie dla poprawności wniosków.

**Terminologia ogólna**: W matematyce *unikalne* znaczy zwykle *dokładnie jedno danego rodzaju*, a
*nie* dokładnie jedno *tak w ogóle*. Na przykład, w przypadku implikacji dostajemy dokładnie jedno
zdanie powstające w taki a nie inny sposób z każdej określonej pary zdań. Podobnie dodawanie (*+*)
to operacja na liczbach, która z dwóch dowolnych, niekoniecznie różnych liczb, na przykład *2* i
*2*, robi jedną unikalną liczbę, w tym wypadku *4*. Możemy też powiedzieć, że zdanie w postaci
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
sposób *bardziej formalny* niż ma to zwykle miejsce nawet w najbardziej zaawansowanych podręcznikach
do matematyki. Matematycy tak zwykle *nie* postępują, bo im się nie chce i (zwykle) nie muszą;
zamiast tego polegają na domyślności kompetentnego odbiorcy. My nie chcemy się musieć niczego
domyślać, bo nie jesteśmy tak kompetentni jak zawodowi matematycy. 

Pełna formalizacja wymaga dodatkowego wysiłku, ale dzięki niej będzie nam czasem (jednak nie
oszukujmy się, nie zawsze) *łatwiej*. Przede wszystkim zaś wszystko, co napiszemy, będzie
*sprawdzone przez algorytm, który zawsze da nam odpowiedź, czy wszystko, co napisaliśmy, jest
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
Chcę przez to powiedziec, że moim zdaniem jesteś wart/a Leana.

W języku Lean możemy wyrazić (prawie) to samo, co `int x` wyraża w języku *C*, czyli, że zmienna `x`
jest (jakąś) liczbą całkowitą, pisząc (ale nie pisz tego teraz w Lean, to tylko przykład):

```lean
x : Z
```

Moim zdaniem szybko oswoisz się z tą notacją. Litera *Z* jest powszechnie przyjętym symbolem
oznaczającym liczby całkowite (od niemieckiego słowa "*Zahlen*"), o czym wspominam bo czuję, że
wypada, chociaż nie będziemy korzystać z typu `Z`.

## Pierwsze zadanie z logiki

Niebawem udowodnimy takie oto zdanie:

*Jeżeli a, to a.*

To zdanie jest trywialne i trywialnie prawdziwe, ale w matematyce nawet trywialne prawdy wymagają
(zwykle) dowodu. Nadamy naszemu dowodowi nazwę i ten nazwany dowód razem z jego nazwą i zdaniem,
którego dowodzi, staną się jedną strukturą - matematycznym twierdzeniem. Uprzedzam, że chociaż
zdanie *Jeżeli a, to a* jest w oczywisty sposób zawsze prawdziwe, a jego dowód jest bardzo prosty,
to i tak wykonując to zadanie po raz pierwszy prawdopodobnie zdążysz się co najmniej raz poczuć
zagubiony/a.

Musimy sobie teraz wyjaśnić coś na temat logiki w Lean.

**Uwagi o logice klasycznej i konstruktywnej**: Być może miałe/aś już do czynienia z elementami
logiki zdań. Jeśli tak, to może to być teraz do pewnego stopnia *przeszkoda*. Logika zdań jest
najczęściej wykładana w wersji tak zwanej *klasycznej*, w której prawdą jest, że:

*Każde zdanie jest albo prawdziwe, albo fałszywe.* (zdanie prawdziwe w logice klasycznej)

Jak również:

Dla każdego zdania *p*, jeżeli nieprawda, że nieprawda, że *p*, to *p* (inne zdanie prawdziwe w logice klasycznej)

W Lean domyślnie (można to zmienić, ale nie będziemy tego na razie robić) używamy logiki
*konstruktywnej*, inaczej *intuicjonistycznej*, a nie klasycznej. Ta logika jest "ostrożniejsza" w
tym sensie, że wszystko, co jest prawdą w logice konstruktywnej, jest też prawdą w logice klasycznej
(mówimy, że jest *słabsza*), ale nie odwrotnie. W logice konstruktywnej można przyjąć, że:

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
oficjalna nazwa na takie coś to "term") typu `Prop`, a ponieważ `Prop` to typ zdań (od angielskiego
"*Proposition*" oznaczającego sąd), znaczy to, że `a` jest jakimś, niekoniecznie prawdziwym albo
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
jest "*n jest równe 10*", i to zdanie może być w danym kontekście prawdziwe (w logice
konstruktywnej: udowodnione), fałszywe (w logice konstruktywnej: istnieje dowód jego negacji), albo
może mieć nieokreślony status pod względem prawdziwości. Nawet, gdy zdefiniujemy `n` jako stałą o
wartości `10`, to zdanie `n = 10` będzie wymagało w Lean udowodnienia, żeby można je było uznać za
prawdziwe! Ten dowód jest bardzo prosty, bo polega jedynie na tak zwanym *rozpakowaniu* albo
*zastosowaniu definicji* zmiennej `n`, ale nadal jest to dowód.

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
wnętrzu. Nie o to chodzi - ta funkcja / dowód ma dostarczyć dowód *B* korzystając z *bliżej
nieokreślonego* dowodu *A*, a więc w zasadzie z *samego faktu istnienia* dowodu *A*.

**Dygresja terminologiczna**: Symbol `⊢` to symbol derywacji albo wnioskowania albo konstruowania
(różnie można na to patrzeć, więc też różnie można ten symbol nazywać).

**Terminologia**: Zdanie *A* w implikacji *A → B* nazywamy *poprzednikiem*, a dokładnie
poprzednikiem implikacji *A → B*, a zdanie *B* jej *następnikiem*.

**Dezorientator**: Pokażę Ci teraz naprostszy sposób skonstruowania dowodu tego twiedzenia. Nie
kopiuj tego kodu, tylko może zastanów się nad nim przez chwilę:

```lean
theorem najprosciej (a : Prop) : a → a := fun (x : a) => x
```

A teraz jeszcze inny, ale podobny sposób, który może Ci na początku namieszać w głowie:

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

Jeżeli to jest niejasne, nie przejmuj się tym teraz - z czasem posługiwanie się typami zależnymi
stanie się nie tylko jasne, ale wręcz naturalne, o ile będziesz cierpliwy/a. Może jednak to Ci choć
trochę pomoże dostrzec naturalność typów zależnych: Przytoczony na początku tego skryptu fragment
prozy matematycznej można traktować jako funkcję, która z dowolnych dwóch liczb naturalnych, które
można nazwać *m* i *n*, tworzy zdanie *n + m = m + n*, traktowane przypuszczalnie jako po prostu
prawdziwe, to jest bez dowodu. Powiedziałem przypuszczalnie, bo ten fragment prozy był wyrwany z
kontekstu (a tak naprawdę wymyślony przeze mnie). 

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

> Udowodnić zdanie *p → q* to znaczy podać sposób skonstruowania dowodu *q*, *zakładając*, że *p* ma
> *jakiś* dowód.

**Polecenie**: Napisz teraz w następnej linijce, zaraz pod skopiowanym wcześniej do Leana kodem
zaczynającym się od `theorem ...` a kończącym na `by`, komendę:

`intro h`

Jeżeli przesuniesz kursor *za* wpisaną właśnie komendę `intro h`, to w prawym oknie zobaczysz, że
*stan dowodu uległ zmianie* i wygląda teraz tak:

```lean
1 goal
a : Prop
h : a
⊢ a
```

W ten sposób Lean pokazuje nam, co już mamy, a co jeszcze musimy zrobić, żeby zakończyć dowód.

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

Wprowadzając a jako założenie, a dokładniej zakładając, że a ma *jakiś* dowód i to *posiadanie
jakiegoś dowodu* przyjmując jako założenie `h`, sprawiliśmy, że poprzednik implikacji `a → a`, a
ściślej (hipotetyczny) dowód tego poprzednika, "wskoczył na górę" jako coś, co zakładamy, że mamy, a
przez to to, co mamy skonstruować, czyli cel, *uprościł się* do samego następnika (tutaj `a`). Mamy
więc teraz prostszy cel i więcej środków, żeby go udowodnić!

**Polecenie**: Ten dowód możesz zakończyć natychmiast, używając wprost dostępnego w tym momencie
(hipotetycznego) dowodu zdania `a`, bo *to zdanie jest takie samo jak jedyny cel*. Żeby to osiągnąć,
napisz w następnej linijce:

`exact h`

Jeżeli kursor znajdzie się za wpisaną właśnie komendą `exact h`, to stan dowodu widoczny w prawym
oknie powinien wyglądać tak:

`No goals`

Mówimy czasem w takich sytuacjach, że cel został "usunięty", albo "zniszczony", albo
"zanihilowany", albo "unicestwiony", i to jest moim zdaniem piękne (jak również "formalne" w
swojej mechanicznej wymowie). 

Udało Ci się właśnie udowodnić, dla arbitralnego, czyli dowolnego zdania `a`, twierdzenie `a → a` o
nazwie `t1`, używając jednocześnie logiki konstruktywnej (inaczej intuicjonistycznej), teorii typów
zależnych, izomorfizmu Curry'ego-Howarda, i prawdopodobnie nie znanego Ci w ogóle wcześniej języka
programowania Lean. Możesz się pochwalić znajomym, rodzinie, czy przypadkowo spotkanym osobom.

Jeszcze raz, ale inaczej, objaśnie, co się właśnie stało: Pisząc `by` weszłaś/wszedłeś w tryb
interaktywny konstruowania termu. Ponieważ typem konstruowanego termu był `a → a`, gdzie `a` było
zdaniem, zacząłeś/aś w ten sposób konstruować dowód zdania `a → a`. Wpisując komendę `intro h`
przyjąłeś/aś założenie, że `a` ma jakiś dowód (`h`) i zakładając to udowodniła/eś `a` w najprostszy
możliwy sposób - przytaczając ten dowód (`exact h`, czyli dokładnie `h` jest rozwiązaniem / dowodem
/ termem typu, który jest celem). 

Ale przecież dowodzenie jest programowaniem! Można również powiedzieć, że skutkiem komendy `intro h`
było *rozpoczęcie konstruowania anonimowej funkcji* (tak zwanej λ-abstrakcji) - `fun (h : a) =>`
... - a skutkiem komendy `exact h` było zdefiniowanie ciała tej funkcji jako "dokładnie" albo "po
prostu" `h`, czyli ostatecznie dowód polegał na interaktywnej konstrukcji anonimowej funkcji `fun
(h : a) => h`. Co robi ta funkcja? Pobiera dowolny dowód `a` i go zwraca. Istnienie tej funkcji jest
jakby "ucieleśnieniem" (trywialnego) "faktu", że jeśli `a` ma dowód, to `a` na dowód. W logice
konstruktywnej to właśnie znaczy Jeżeli *a*, to *a*.

Dowód, który skonstruowaliśmy za pomocą taktyk w trybie interaktywnym jest więc taki sam, jak ten,
który możemy zdefiniować wprost pisząc:

```lean
theorem t1 (a : Prop) : a → a := fun (h : a) => h
```

Można to przeczytać również tak: dla każdego dowodu `h` zdania `a`, zracam / mam / można stworzyć /
istnieje dowód `a`, i jest nim `h`.

**Zadanie do samodzielnego rozwiązania**: Spróbuj teraz samodzielnie dokończyć dowód następującego
twierdzenia, kopiując najpierw poniższy fragment kodu. Gdy poczujesz się zagubiona/y, zaglądaj
czasem do okna po prawej, albo do wcześniejszych fragmentów tego skryptu. Albo weź głęboki oddech,
albo zrób sobie krótką albo dłuższą przerwę. To są sprawy wielkiej wagi, a w sprawach wielkiej wagi
zwykle nie należy się spieszyć. 

Najpierw spróbuj bez podpowiedzi, a jak poczujesz, że to jednak za trudne (co by mnie wcale nie
zdziwiło), zerknij poniżej, znajdziesz tam pomoc. Jeżeli chcesz skorzystać z podpowiedzi, za każdym
razem spróbuj "wygrać w tą grę" zaglądając tylko do jednej podpowiedzi, z której jeszcze nie
skorzytałe/aś. 

```lean
theorem t2 (p : Prop) (q : Prop) : p → q → p := by
```

**Podpowiedź**: Trzeba dwa razy użyć taktyki `intro`, w dodatku jeden raz "jakby
niepotrzebnie". Trzeba też uważać z nazwami podanymi jako argumenty dla `intro`, bo nie mogą się
powtarzać w tym samym kontekście (przypominam, w trybie interaktywnym kontekst widać jako listę
deklaracji nad znakiem `⊢`). Skutek zastosowania taktyki zobaczysz z prawej tylko jeżeli kursor
będzie się znajdował za końcem komendy użycia tej taktyki.

**Podpowiedź**: Taktyki `intro` trzeba użyć za każdym razem w nowej linijce, albo w tej samej, ale
oddzielając oba użycia symbolem `;`. W ramach tego samego dowodu trzeba zwykle wybierać inną nazwę
dla każdego nowego wprowadzanego (`intro` to skrót od *introduction*) założenia, na przykład
najpierw nazwę `h1`, a następnie nazwę `h2`, albo najpierw nazwę `jas`, a potem `malgosia`. Dobrze
jest stosować jakąś prostą, spójną konwencję w wymyślaniu nazw.

**Podpowiedź**: Na końcu trzeba będzie użyć taktyki `exact` z odpowiednim argumentem. Nie podpowiem
już którym, ale podpowiem, że o ile wszystko do tej pory poszło dobrze, to nazwę odpowiedniego
argumentu dla taktyki `exact` znajdziesz w tym, co masz lokalnie do dyspozycji, czyli w oknie po
prawej powyżej symbolu `⊢`, czyli w kontekście. W ten sposób unicestwisz jedyny cel, jaki będzie do
unicestwienia (jeżeli wprowadziłeś oba założenia tej podwójnej implikacji).

**Nie czytaj, jeżeli jeszcze nie rozwiązałeś ostatniego zadania**: Co tu się stało? Nie powiedziałem
tego wcześniej, ale `p → q → p` to tak naprawdę `p → (q → p)`. Nawiasy muszą tu być, nawet, gdy są
niejawne, bo `→` jest operatorem dwuargumentowym, więc bez przyjęcia jakiejś konwencji dotyczącej
nawiasów `p → q → p` jest niejednoznaczne. No więc celem jest `p → (q → p)`. Jeżeli celem jest
implikacja, a `p → (q → p)` jest implikacją z poprzednikiem `p` i następnikiem `(q → p)`, to
odowodnienie jej polega na skonstruowaniu dowodu następnika, czyli `(q → p)`, zakładając dowód
poprzednika, czyli dowód `p`. Zakładamy, że mamy `h1 : p` i od tego momentu mamy nowy, prostszy
cel - `(q → p)`. Żeby osiągnąć ten cel zakładamy `h2 : q` i próbujemy udowodnić / unicestwić nowy
cel `p`. Ale to już mamy jako `h1 : p`, a więc z tego korzystamy przytaczając ten dowód `p`
dosłownie. Teraz nie ma już więcej celów, czyli dowód jest zakończony.

Ten sam dowód moglibyśmy zdefiniować wprost w ten sposób:

```lean
theorem t2 (p : Prop) (q : Prop) : p → q → p := fun (h1 : p) => fun (h2 : q) => h1
```

Czy widzisz, że pozornie zbędne wprowadzenie założenia / abstrahowanie od dowodu `q` było konieczne,
żeby typ konstruowanego dowodu / termu zgadzał się z celem / typem `p → q → p` jako zdaniem?

**Polecenie**: Po udanym wykonaniu tego zadania spróbuj je zrobić od początku jeszcze raz, ale
tłumacząc przy tym, jaka jest przyjęta przez nas interpretacja tego, co robisz. Jak się pogubisz w
tych wyjaśnieniach, poszukaj wskazówek w poprzednich komentarzach.

## O stosowaniu twierdzeń jako funkcji

Być może widzisz już analogię między tym, jak zapisaliśmy twierdzenie, a raczej jak skonstruowaliśmy
jego dowód, a tym, jak definiuje się funkcje albo procedury w bardziej przyziemnych językach
programowania. Na przykład, w języku *C*:

```C
int suma(int a, int b){
  return a + b;
}
```

to definicja funkcji albo procedury dodającej dwie liczby typu `int`. Dokładniej, ta funkcja `suma`
napisana w *C* z dwóch dowolnych argumentów typu `int` (liczb całkowitych), które z perspektywy kodu
"w środku" funkcji suma (czyli jej ciała) nazywają się `a` i `b`, robi liczbę całkowitą wyliczoną
przez ich dodawanie i zwraca tą liczbę jako rezultat. 

W *C* typ rezultatu funkcji piszemy najpierw (`int` na początku pierwszej linijki), potem piszemy
nazwę definiowanej funkcji (tutaj znowu `suma`), potem w nawiasach wyliczamy jej parametry podając
najpierw ich typy i oddzielając je przecinkiem, a na końcu definiujemy ciało funkcji, otaczając je
nawiasami klamrowymi. Średnik sygnalizuje koniec instrukcji, przy czym tutaj mamy tylko jedną
instrukcję w ciele - `return a + b`. Tak zdefiniowaną funkcję możemy potem w języku C *zastosować*
do dwóch argumentów całkowitoliczbowych, na przykład tak:

```C
int wynik = suma(1, 20);
```

W ten sposób zadeklarowaliśmy jako całkowitoliczbową nową zmienną `wynik` i jednocześnie
przypisaliśmy jej, będącą wynikiem zastosowania funkcji `suma` do argumentów `1` i `20`, wartość
`21`.

**Trochę się obawiam o tym pisać, ale muszę**: Mamy tu znowu znak równości i znowu ten symbol znaczy
coś innego! Tym razem to nie jest (ostateczna) definicja, ani nie jest to równość jako zdanie, tylko
*operacja przypisania wartości do zmiennej*. Różnica polega na tym, że raz przypisaną do zmiennej
wartość można później *zmienić*, natomiast definicje są *ostateczne*.

Definicja analogicznej funkcji w języku *R* wygląda podobnie, ale prościej:

```R
suma = function(a, b){
  a + b
}
```

Język *R* również traktuje wszystkie zmienne jako obiekty, które mają określony typ, i w *R* tak jak
w *C* równość oznacza przypisanie wartości do zmiennej, ale w *R* nie musimy zwykle jawnie
deklarować typu, bo na ogół *R* sam się tego domyśla.

W takim zwykłym języku programowania jak *C* jawne typowanie służy zmniejszeniu ryzyka błędu: Jeżeli
na przykład spróbujemy zastosować mnożenie do dwóch zmiennych tekstowych, a nie liczbowych, to
program nie zostanie skompilowany do wersji, którą możemy uruchomić, bo bez napisania specjalnego
kodu mnożenie nie działa w *C* dla zmiennych tekstowych. Dzięki wykryciu błędu na tym wczesnym
etapie, to jest przed uruchomieniem programu, unikamy (potencjalnie trudnych do wykrycia) problemów
po uruchomieniu. W Lean typowanie ma również i takie zastosowanie, ale służy też do znacznie
ciekawszych rzeczy, takich jak formalizacja treści matematycznych.

Twierdzenie w języku Lean zapisaliśmy używając składni języka Lean, a nie składni języka *C* czy
*R*, bo Lean to nie *C* ani *R*, ale ogólna struktura kodu definiującego twierdzenie jest taka sama
("modulo notacja"), jak na przykład struktura definicji funkcji w *C*:

`theorem t2 (p : Prop) (q : Prop) : p → q → p := by ...`

Nazwę funkcji podaliśmy po słowie kluczowym `theorem`, typ rezultatu podaliśmy po znaku `:`, od razu
widać też, gdzie są parametry twierdzenia-jako-funkcji `t2` i jakie mają typy, wreszcie ciało tej
funkcji zdefiniowaliśmy za pomocą kodu występującego po znaku `:=`. 

Jeżeli teraz *zadeklarujemy*, że mamy (jakieś) zdanie `a`, używając w Lean słowa kluczowego
`variable`:

```lean
variable (a : Prop)
```

to będziemy mogli zastosować twierdzenie `t1` tak samo, jak stosowaliśmy funkcję `suma`, albo
`dodaj2`, i tak samo, jak stosuje się funkcję w *C* czy w *R*, tylko pisząc to trochę inaczej, bo
składnia jest inna:

Polecenie: Wklej ten fragment do Leana i umieść kursor nad komendą `#check`, powinieneś/aś zobaczyć
po prawej to, co zapisałem poniżej jako komentarz.

```lean
#check t1 a -- t1 : a → a
```

W ten oto sposób możemy stosować nasze twierdzenie `t1` do dowolnego zdania, na przykład do jakiegoś
zdania bardziej złożonego, takiego jak `a → a` (musi być tutaj w nawiasach):

```lean
#check t1 (a → a)
```

albo do zdania `a → (a ∧ a)` [Czytaj: `a` implikuje koniunkcję zdań `a` i `a`]

```lean
#check t1 (a → (a ∧ a))
```

Czy widzisz, jak dobrze to traktowanie twierdzeń jako parametrycznych funkcji pasuje do sposobu, w
jaki posługujemy się tym, co można odczytać ze zwykłej "prozy matematycznej"? Przypomnimy sobie
jeszcze raz ten sam fragment, tylko nadamu mu nazwę:

```
Przemienność dodawania: Jeżeli n i m to liczby naturalne, to n + m = m + n
```

Stąd już bardzo blisko do:

```
Przemienność dodawania (n : Liczba naturalna) (m : Liczba naturalna) : n + m = m + n
```

co możemy wyrazić w Lean w ten sposób:

```lean
axiom przemiennosc_dodawania (n : Nat) (m : Nat) : n + m = m + n
```

Słowo kluczowe `axiom` sprawia, że możemy odtąd traktować `przemiennosc_dodawania` jako nazwę na
istniejący, chociaż bliżej nieokreślony, term typu `n + m = m + n`, czyli bliżej nieokreślony dowód
zdania `n + m = m + n`. Jeżeli to nie jest naturalna i dosłowna formalizacja naszego fragmentu prozy
matematycznej wyrażonej w języku naturalnym, to nie wiem, co mogłoby nią być.

Taki aksjomat stosujemy tak, jakby był twierdzeniem:

```lean
#check przemiennosc_dodawania 1 2 -- przemiennosc_dodawania 1 2 : 1 + 2 = 2 + 1
```

Dokładnie w ten sposób "stosujemy" fragmenty prozy matematycznej takie jak ten dotyczący
przemienności dodawania.

## Widok z lotu ptaka

Nasze twierdzenia zakodowane w Lean są więc jednocześnie:

1. Zdaniami matematycznymi połączonymi z dowodami tych zdań i unikalną w danym kontekście nazwą.

2. Termami pewnego typu, konkretnie tak zwanego zależnego typu: funkcja obliczająca / konstruująca z
   dowolnego zdania `a` term typu / dowód zdania `a → a`.

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
istnieje aksjomatycznie, czyli na mocy naszego wyboru, i jest widoczny również wewnątrz ciała
definicji `t3`.

W pierwszej chwili to się może wydawać dziwne, ale przecież, jeżeli na przykład *wiemy już*, że
jutro będzie sobota (i ta wiedza tymczasowo spełnia rolę aksjomatu), to przyjmując obowiązującą w
logice interpretację implikacji, prawdą jest, że *jeżeli dzisiaj pada deszcz, to jutro będzie
sobota*, niezależnie od tego, czy dzisiaj pada deszcz, czy nie i niezależnie od tego, że między
dzisiejszym deszczem a jutrzejszym dniem tygodnia nie ma związku. *W tej sytuacji* prawdą jest, że
*jeżeli dzisiaj pada deszcz, to jutro będzie sobota*, po prostu dlatego, że ... jutro będzie
sobota.
