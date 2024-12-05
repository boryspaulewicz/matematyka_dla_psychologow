**Czemu to napisałem (tylko jeden z powodów)**: Żeby dobrze zrozumieć status i rolę teorii
normatywnych czy analizy racjonalnej w psychologii, trzeba się chociaż trochę oswoić z
matematycznymi teoriami rozumowania (w szczególności z logiką), wydawania sądów (rachunek
prawdopodobieństwa i na przykład wnioskowanie bayesowskie), i podejmowania decyzji (np. teoria
wyboru racjonalnego). Ten skrypt jest eksperymentem pedagogicznym, który ma w tym pomóc studentom na
kierunku psychologia i pracownikom akademickim zajmującym się badaniami psychologicznymi.

**Ostrzeżenie**: Nawet jeżeli przeczytasz ten skrypt do końca i uda Ci się zrobić poprawnie zadania,
których zresztą nie ma zbyt wiele, jest możliwe, że po wszystkim będziesz czuć coś w rodzaju
dezorientacji lub braku poczucia sensu. Będziemy się zajmować bardzo abstrakcyjnymi pojęciami,
dlatego takie poczucie zagubienia czy braku sensu jest na początku prawdopodobne. Ja też się
podobnie czułem, gdy po raz pierwszy miałem kontakt z tymi treściami. To poczucie może zmienić się
stopniowo w poczucie coraz głębszego zrozumienia, ale to wymaga *cierpliwości*. Moja rada jest
następująca: Daj sobie czas, żeby wszystko zdążyło się chociaż trochę "uleżeć".

**Jeszcze jedna rada**: Ten skrypt nie jest długi. Przeczytanie go i wykonanie poleceń powinno Ci
zająć nie więcej niż półtorej godziny. Jest też samowystarczalny w tym znaczeniu, że nie zakłada
żadnej specjalnej wcześniejszej wiedzy, ani instalacji żadnego oprogramowania - wszystko jest
wyjaśnione od podstaw, a jedyny program, którego potrzebujemy, jest dostępny za darmo w
przeglądarce. Treści będą jednak trudne. Polecam znaleźć kartkę i coś do pisania, włączyć minutnik
na 30 minut, i robić *jakiekolwiek* notatki (np. zapisywać wątpliwości, albo pomysły czy
skojarzenia). Po 30 minutach zrobić około 5 minutową (nie za długą) przerwę, w trakcie której nie
będziesz robić nic wciągającego, a potem znowu pracować przez 30 minut. Po dwóch takich jednostkach
trzeba sobie zrobić dłuższą przerwę, ja w każdym razie tego wtedy potrzebuję.

# Funkcje w Lean

**Polecenie**: Korzystając z dowolnej przeglądarki wejdź teraz na stronę

https://live.lean-lang.org

Rozpoczniesz w ten sposób interaktywną sesję z asystentem dowodzenia Lean. Będziesz pisać w oknie po
lewej i czasem zaglądać do okna po prawej. Żeby stworzyć w Lean proces dodający dwie liczby
naturalne możemy napisać tak (**Polecenie**: wklej poniższy kod do lewego okna Leana - wystarczy
kliknąć w ikonę kopiowania widoczną poniżej z prawej strony):

```lean
def suma (n : Nat) (m : Nat) : Nat := n + m
```

**Czytamy to**: definiuję (`def`) wartość / znaczenie symbolu suma (`suma`) jako term o typie:

> Funkcja dwóch parametrów typu `Nat`, czyli typu liczba naturalna (`(n : Nat) (m : Nat)`), której
> rezultat też jest typu `Nat` (`: Nat`).

A więc wszystko między symbolem `suma` a symbolem definiowania `:=` to określenie *typu*, a nie
treści, tej definicji.

**Czytamy dalej**: Ten term konstruuję albo definiuję jego wartość jako (`:=`) zastosowanie funkcji
dodawania (bo to też jest pewna funkcja!) do pierwszego i drugiego parametru, które to parametry
nazwałem/am `n` i `m`, bo tak mi się podobało.

Nazwy parametrów funkcji nie mają znaczenia w tym sensie, że na przykład taka oto alternatywna
definicja (z apostrofem w nazwie):

```lean
def suma' (a : Nat) (b : Nat) : Nat := a + b
```

jest w łatwym do uchwycenia sensie *tą samą* tylko *inaczej zapisaną funkcją* (i inaczej nazwaną, bo
w Lean nie możemy dowolnie re-definiować symboli).

**Ostateczność definicji w Lean**: Gdy raz zdefiniujemy jakiś symbol, tutaj symbole `suma` i
`suma'`, nie możemy już więcej (w tym samym kontekście, ale o tym może kiedy indziej) zmienić jego
definicji, chyba, że najpierw *usuniemy* poprzednią definicję.

**Polecenie**: Zastosuj funkcję `suma` do dwóch liczb naturalnych wklejając poniższy kod. Taką
konstrukcję nazywamy *aplikacją* funkcji do termu lub termów. Umieść kursor nad komendą `#eval` i
odnajdź rezultat ewaluacji tego wyrażenia w prawym oknie.

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
ciała funkcji "mówić" o jej argumencie.

**Polecenie**: Wklej *powyższy* kod, albo jeszcze lepiej, spróbuj go najpierw przepisać z pamięci,
żeby struktura takich definicji zaczęła Ci się lepiej utrwalać i żebyś ją szybciej mentalnie
"parsował/a". Następnie wpisz poniższą komendę i najedź kursorem na słowo `#check`:

```lean
#check @dodaj2
```

W prawym oknie widać teraz typ termu - `dodaj2 : Nat → Nat`. W Lean wyrażenia o postaci `A → B`
oznaczają typ (ale *tylko* sam typ, nie żaden konkretny term czy obiekt tego typu!):

> Funkcja przekształcająca termy typu `A` w termy typu `B` (interpretacja wyrażenia o postaci `A →
> B`)

No więc widzimy, że `dodaj2` przekształca termy typu `Nat` w termy typu `Nat`, co już
wiedzieliśmy. **Polecenie**: Przepisz poniższy kod i najedź kursorem na słowo `#check`:

```lean
#check dodaj2
```

Teraz w prawym oknie widać tą samą informację co wcześniej, tylko pokazaną w innym stylu, bo symbol
`dodaj2` nie jest poprzedzony znakiem `@`.

**Polecenie**: Napisz w Lean w nowej linijce kod, który oznacza ewaluację aplikacji funkcji `dodaj2`
do liczby `2`. Najedź kursorem na `#eval` i popatrz na prawe okno.

**Co tu się stało, krok po kroku**: Zanim Lean obliczy (mówimy raczej dokona *ewaluacji*, bo to
ogólniejsze pojęcie) wartość zastosowania (mówimy raczej aplikacji, żeby podkreślić, że chodzi nam o
samo *zestawienie* funkcji z argumentem, jeszcze bez żadnej ewaluacji) funkcji `dodaj2` do argumentu
`2`:

1. Ewaluuje, czyli redukuje do prostszej postaci argument aplikacji. Tutaj jest tylko jeden
argument, `2`, a `2` jest tak naprawdę zdefiniowane jako `Nat.succ (Nat.succ Nat.zero)`, czyli jako
dwukrotna aplikacja funkcji `Nat.succ` - tak zwanej funkcji następnika - do symbolu `Nat.zero`,
który możemy traktować jako liczbę naturalną zero. W matematyce liczby naturalne definiuje się
zwykle w tym stylu, ale to nas teraz nie będzie interesowało. Teraz interesuje nas tylko to: przed
ewaluacją aplikacji funkcji do termu, który jest argumentem tej aplikacji albo funkcji, Lean
ewaluuje argument.

2. Lean podstawia rezultat ewaluacji pod (tak zwane *wolne*, ale o tym może kiedy indziej) zmienne,
będące *parametrami funkcji*, w *ciele funkcji*. Tutaj podstawia "znaczenie" symbolu `2`, czyli
`Nat.succ (Nat.succ Nat.zero)`, pod symbol `a` w ciele funkcji `dodaj2`. Wychodzi z tego oczywiście
`2 + 2` (posługując się notacją cyfrową).

3. Następnie Lean ewaluuje uzyskaną w ten sposób wersję ciała funkcji (tego wątku nie będę rozwijał,
powiem tylko, że dodawanie liczb naturalnych ma w Lean piękną definicję rekurencyjną).

Wydaje mi się, że dokładnie czegoś takiego się spodziewałe/aś, może pomijając to, jak są
zdefiniowane liczby naturalne i dodawanie. Jeżeli chcesz się dowiedzieć czegoś więcej o tej
definicji liczb naturalnych, poszukaj samodzielnie informacji na temat aksjomatów Peano.

**Zasięg nazw**: Gdybyś teraz w kolejnej linijce wkleił/a do Lean'a kod `#eval n`, to zobaczył/abyś
błąd, ponieważ `n` i `m` to w tym momencie *tylko* formalne parametry funkcji `suma`, które są
*widoczne tylko z wnętrza ciała* funkcji `suma` (które to ciało składa się akurat tylko z wyrażenia
`n + m`).

**Polecenie**: Napisz `#eval n` w nowej linijce - zobaczysz wtedy, że symbol `n` będzie podkreślony
czerwoną falką. W ten sposób Lean sygnalizuje, że nie ma pojęcia, o czym mówisz. Usuń ten błędny
kod.

**Potencjalnie przydatna metafora - funkcja jako pudełko z mechanizmem w środku**: Możemy myśleć o
funkcji `suma` jako o pudełku, które ma dwa wejścia, jedno oznaczone literą *n*, a drugie literą
*m*, i które ma jedno wyjście, a w środku zawiera "mechanizm dodający" obiekty pojawiające się na
wejściach. Jeżeli wyobrazimy sobie, że ten wewnętrzny mechanizm jest "przyklejony" do wejść, to
stanie się jasne, że nazwy wejść nie mają tutaj znaczenia i istnieją tylko dla wygody użytkownika.

Za to *typy* wejść i *typ* wyjścia (funkcja ma zawsze tylko jedno wyjście) jak *mają* znaczenie. Nie
możemy podawać na wejściu funkcji dodającej liczby czegokolwiek - to muszą być wyrażenia typu liczba
(tutaj akurat wymagamy liczb naturalnych), i tak też mówi nasza definicja. Jeżeli podamy na wejściu
dwa wyrażenia typu liczba naturalna, to na wyjściu pojawi się liczba naturalna. To będzie wynik
dodawania wejść, bo tak jest skonstruowana zawartość pudełka o nazwie *suma*.

**Bardziej skomplikowany przykład ewaluacji aplikacji funkcji**: Myślę, że domyślasz się już,
dlaczego jest poprawny i jak jest ewaluowany poniższy (dziwaczny, wiem) fragment kodu (przypominam,
że `Nat.succ` to funkcja następnika, która dla każdej liczby naturalnej daje następną liczbę
naturalną, a `Nat.zero` to liczba naturalna zero):

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
suma Nat.succ 2 3
```

Funkcja `suma` wymaga argumentów typu `Nat`. Pierwszy argument aplikacji jest tutaj jednak *funkcją*
(`Nat.succ`), a nie liczbą naturalną. Żeby ten kod był poprawny trzeba otoczyć fragment `Nat.succ 2`
nawiasami:

```lean
#eval suma (Nat.succ 2) 3
```

Z takimi bardziej skomplikowanymi aplikacjami trzeba uważać!

**W Lean nie ma funkcji "prawdziwie" dwuargumentowych**: Zdefiniowana funkcja `suma` *wygląda* jak
funkcja dwuargumentowa, ale tak naprawdę nie jest dwuargumentowa. Jest funkcją jednoargumentową,
*która zwraca funkcję jednoargumentową*, która dopiero dodaje parametr tej pierwszej funkcji do
parametru tej drugiej. Może przeczytaj to jeszcze raz. Taki sposób definiowania funkcji więcej niż
jednoargumentowych nazywa się Curryingiem, od nazwiska pewnego wybitnego matematyka.

**Polecenie**: Napisz kod pozwalający zobaczyć typ (uwaga: *typ*, a nie *rezultat ewaluacji*, a więc
nie masz teraz używać komendy `#eval`) aplikacji funkcji `suma` do *tylko jednego* argumentu
`10`. Jak Ci się uda, zobaczysz w prawym oknie komunikat:

```lean
suma 10 : Nat → Nat
```

**Czytamy to**: aplikacja funkcji `suma` do termu `10` ma typ `Nat → Nat`, czyli jest funkcją (W
Lean *jest funkcją* znaczy *jest termem typu funkcja*) przekształcającą liczby naturalne w liczby
naturalne. Jaka to jest funkcja? Znamy definicję symbolu `suma`, więc wiemy, że `suma 10` to
wyrażenie, które jakby "czeka na brakujący argument" - jest to więc jednoargumentowa funkcja, która
dodaje do dowolnej liczby naturalnej `10` (dodaje `10` "od przodu", bo "robi" `10 + m`).

**Polecenie**: Sprawdź typ (a nie ewaluuj) termu `suma`, ale poprzedzonego znakiem `@`, żeby się
przekonać, że `suma` to tak naprawdę funkcja, która przekształca dowolną liczbę naturalną w funkcję,
która z kolei przekształca kolejną dowolną liczbę naturalną w liczbę naturalną. *Uff*.

# Trochę mniej o programowaniu i trochę więcej o logice i pewnych typach danych w Lean

**Definiowanie indukcyjnych typów danych**: W logice dwuwartościowej mamy dokładnie dwie wartości
logiczne, *prawdę* i *fałsz*. Gdy używamy logiki w sposób czysto formalny, czyli "beztreściowy",
prawda i fałsz są tylko jakimiś dwiema różnymi wartościami albo obiektami, i niczym więcej - liczy
się tylko to, że te obiekty są dwa i że są różne. Cały "logiczny sens" tych obiektów czy wyrażeń
sprowadza się do tego, w jakie relacje wchodzą z innymi wyrażeniami, a nie "czym naprawdę są", bo,
jeszcze raz, z formalnego punktu widzenia nie są niczym więcej niż jakimiś dwiema różnymi
wartościami / dwoma różnymi obiektami / dwoma różnymi wyrażeniami.

W Lean możemy zdefiniować nowy typ danych który ma dokładnie dwie wartości w taki oto sposób
(**Polecenie**: wklej poniższy kod do Leana):

```lean
inductive dwie where
  | jedna : dwie
  | druga : dwie
```

Specjalnie wybrałem takie nieciekawe nazwy, żeby podkreślić, że prawda i fałsz jako obiekty formalne
to nic innego jak *jakieś* dwie różne wartości. Słowo kluczowe `inductive` mówi Leanowi, że
zaczynamy definicję indukcyjną. Nie będę w tym momencie objaśniał szczegółowo co to znaczy, powiem
tylko jak się czyta tą akurat definicję:

**Czytamy kod**: Symbol `dwie` oznaczał będzie odtąd indukcyjny (`inductive`) typ danych, gdzie
(`where`) wartość (term) tego typu to taka, która jest albo:

- Symbolem `jedna`, albo

- symbolem `druga`

i to są *różne wartości* i *nie ma innych danych typu* `dwie`.

Dana typu `dwie` to zatem jeden z dwóch różnych symboli, `jedna` lub `druga`, i nic więcej, to *są*
te symbole: *nic się nie kryje* pod tymi symbolami i te symbole to jedyne dane typu
`dwie`. Moglibyśmy zbudować całą teorię logiki dwuwartościowej posługując się tymi symbolami (i
paroma innymi konstrukcjami) i to by była *ta sama teoria formalna, tylko inaczej zapisana*.

# Bardziej o samej logice w Lean

**Ostrzeżenie**: Będzie trzeba się stopniowo oswoić z konsekwentnym odróżnianiem (i przełączaniem
się czasem między odpowiadającymi tym różnicom punktami widzenia):

1. Dowolnych zdań *jako takich*, a więc niekoniecznie prawdziwych, od...

2. *Prawdziwości lub fałszywości* dowolnych zdań, a tego z kolei od...

3. Ewentualnego *faktu*, że jakieś zdanie (albo jego negacja) *ma dowód*, wreszcie...

4. *Założenia*, że jakieś zdanie ma (jakiś) dowód, od faktu, że taki dowód został *skonstruowany*.

W tym momencie to, że to nie są te same rzeczy czy fakty, może Ci się wydawać wręcz oczywiste i nie
warte objaśniania, ale przekonasz się, że te fundamentalne rozróżnienia będą Ci sprawiać trudności
nawet w stosunkowo prostych sytuacjach. Jeszcze raz - cierpliwości. Gdybym ja czytał tekst taki jak
ten, nie znając wcześniej tematu, na pewno wracałbym wielokrotnie do niektórych mniej jasnych dla
mnie fragmentów.

**O czym to będzie**: Zajmiemy się *implikacją*. Implikacja jest chyba najważniejszym spójnikiem w
całej logice. Mówiąc na razie luźno, implikacjami nazywamy zdania o postaci *Jeżeli A, to B*.

gdzie *A* i *B* to *dowolne* zdania, proste lub złożone (i tylko same zdania, a nie ich prawdziwość
czy fałszywość, albo fakt bycia dowiedzionym, albo ich dowody). Powszechnie zapisuje się implikację
za pomocą strzałki skierowanej w prawo →.

Jeżeli *A* i *B* to zdania (i tylko wtedy!), to formalnie, czyli w oficjalnym, jednoznacznym języku
matematyki, implikację *Jeżeli A, to B* zapisujemy więc zwykle jako *A → B*. Czy przypomina Ci to
coś, o czym mówiliśmy już wcześniej?

**Dygresja**: Niektórzy mówią, że język matematyki jest *precyzyjny*, ale w matematyce możemy mówić
również - i to celowo! - *nieprecyzyjnie*. Na przykład, możemy wyrazić wprost w matematyce zdanie,
że jakaś wielkość znajduje się w jakimś szerokim interwale, albo że jest mniej lub bardziej
prawdopodobna. *Nigdy* jednak nie mówimy *celowo wieloznacznie*. 

Na przykład, w logice klasycznej zdanie to *jakiekolwiek* wyrażenie, które może być albo prawdziwe,
albo fałszywe. Tylko tyle. Prawda i fałsz to *jedynie* jakieś dwie, bliżej nieokreślone ale różne
wartości, które albo *arbitralnie przypisujemy* jakimś zdaniom (wtedy po prostu *formalnie
zakładamy* ich prawdziwość lub fałszywość, ignorując w ogóle kwestię ewentualnego istnienia ich
dowodów), albo *formalnie ustalamy*, za pomocą dowodzenia, które zdania są w danej sytuacji
prawdziwe lub fałszywe, albo wreszcie *decydujemy* (bo tak!) o prawdziwości zdań *formalnie
zakładając, że mają (jakiś) dowód* (i to jest coś innego niż samo założenie prawdziwości!).

Jeżeli czytasz to pierwszy raz i jeszcze się nie pogubiła/eś, to być może nie przeczytała/eś tego
ostatniego fragmentu uważnie.

W ten sposób - całkowicie odzierając pojęcia (tutaj pojęcia zdania, prawdy i fałszu) z wszelkiego
rodzaju zbędnych dla dobrze określonych celów znaczeń (tutaj dla celu analizy w pewien techniczny
sposób rozumianej poprawności rozumowań), uzyskujemy maksymalną *jednoznaczność*. I to jest taka
banalna jednoznaczność pojęć, polegająca *tylko* na tym, że decydujemy się używać wyłącznie kilku
prostych, mechanicznych reguł. Uzyskujemy w ten sposób (czasem ekstremalną) *abstrakcyjność*, czyli
*ogólność teorii*. A ogólne teorie są wartościowe dzięki temu, że są ... ogólne, czyli znajdują
zastosowanie w różnych sytuacjach.

**Oswojenie z terminologią logiczną**: Zawsze, gdy mamy jakieś dwa, niekoniecznie różne zdania *A* i
*B*, możemy napisać *A → B* i to będzie poprawne wyrażenie (poprawna formuła logiczna), które
interpretujemy jako (niekoniecznie prawdziwe, a tym bardziej udowodnione!) zdanie *Jeżeli A, to
B*. Mówimy też, że *→* to w logice pewna *dwuargumentowa operacja* albo *działanie*, tyle że na
zdaniach, które to działanie z dwóch *zdań jako takich* (niekoniecznie udowodnionych czy
prawdziwych) robi jedno (niekoniecznie udowodnione czy prawdziwe) unikalne zdanie złożone, dające
się konsekwentnie interpretować jako *Jeżeli A, to B*. Może przyda Ci się wyobrażenie sobie, że
zdanie w logice to coś płaskiego i niemal przezroczystego, a jego dowód to jakiś barwny skarb, który
prześwituje przez powierzchnię zdania, jeśli istnieje i jeśli umiemy na to zdanie tak popatrzeć,
żeby ten prześwit zobaczyć.

**Analogia między implikacją i typem funkcyjnym**:

Jeżeli *A* i *B* to *zdania*, to *A → B* jest *implikacją*.

Jeżeli `A` i `B` to *typy*, to `A → B` jest *typem funkcji przekształcających termy typu `A` w termy
typu `B`*.

**Przy okazji**: Powyższa analogia może wygląda jak wieloznaczność i w pewnym sensie nią
jest. Jednak to byłaby wieloznaczność problematyczna tylko gdybyśmy sprawili, że nie jest całkiem
jasne, którą interpretację stosujemy i gdyby jednocześnie ta różnica w dopuszczalnych
interpretacjach miała znaczenie dla poprawności czy sensu wniosków, które wyciągamy.

**Terminologia ogólna**: W matematyce *unikalne* znaczy zwykle *dokładnie jedno danego rodzaju*, a
*nie* dokładnie jedno *tak w ogóle*. Na przykład, w przypadku implikacji dostajemy dokładnie jedno
zdanie powstające w taki a nie inny sposób z każdej określonej pary zdań. Podobnie dodawanie (*+*)
to operacja na liczbach, która z dwóch dowolnych, niekoniecznie różnych liczb, na przykład *2* i
*2*, robi jedną unikalną liczbę, w tym wypadku *4*. Umiesz dodawać, więc wiesz o co chodzi. Możemy
też powiedzieć, że zdanie w postaci implikacji jest *funkcją* uporządkowanej (bo liczy się, które
zdanie będzie traktowane jako poprzednik, a które jako następnik implikacji) pary zdań.

**Zachęta - uwagi o zaletach (maksymalnej!) formalności**: Wiem, że często piszę długie zdania. Tym
razem jednak chociaż przez chwilę robiłem to celowo. Chciałem w ten sposób zilustrować coś ważnego:
Dzięki temu, że posługujemy się prostymi symbolami na oznaczenie dowolnie złożonych zdań, możemy
łatwiej zapanować nad strukturą rozumowania w sytuacjach, w których bez takiego skrótowego zapisu
moglibyśmy się łatwo pogubić. Co ważne, logika pozwala nam *w kontrolowany sposób ignorować treść*
zdań *bez szkody dla poprawności* wnioskowania. To też, to jest "beztreściowość", mamy na myśli
mówiąc o "formalności" zapisu matematycznego. Wreszcie, formalny zapis ułatwia robienie czegoś, co
jest ogromną siłą matematyki: ułatwia a właściwie umożliwia rozwiązywanie zarówno prostych jak i
złożonych problemów *mechanicznie*, jakbyśmy układali puzzle, albo grali w grę.

Coś takiego będziemy właśnie robić, to znaczy, będziemy grać w grę polegającą na konstruowaniu
dowodów, bo będziemy *całkowicie* formalizować każdy problem. Będziemy więc używać matematyki w
sposób *bardziej* jednoznaczny, niż ma to zwykle miejsce nawet w najbardziej zaawansowanych
podręcznikach do matematyki. Matematycy tak zwykle *nie* postępują, bo im się nie chce i (zwykle)
nie muszą; zamiast tego polegają na domyślności kompetentnego odbiorcy. My nie chcemy się musieć
niczego domyślać, bo nie jesteśmy tak kompetentni jak zawodowi matematycy. Pełna formalizacja wymaga
jednak dodatkowego wysiłku, ale dzięki niej będzie nam nawet czasem (ale nie oszukujmy się, nie
zawsze) *łatwiej*. Przede wszystkim zaś wszystko, co napiszemy, będzie *sprawdzone przez niezawodny
algorytm, który zawsze da nam odpowiedź, czy wszystko, co napisaliśmy, jest matematycznie
poprawne*. Będziemy więc w pewnym sensie "zawsze bezpieczni" w swoich (sformalizowanych)
rozważaniach.

**(De?)motywator**: Koszt, który musimy ponieść, żeby to osiągnąć, to częściowe oswojenie się z co
prawda mniej złożonym niż język polski, ale obcym, sztucznym, i bezlitośnie "sztywnym" językiem,
jakim jest formalny język matematyki. Tak jak to ma miejsce w przypadku nauki każdego nowego języka,
trzeba się uzbroić w cierpliwość (jeszcze chyba wspomnę o tej cierpliwości później). Jest wiele
prawdy w stwierdzeniu, które zresztą bardzo lubię, a którego autorem jest genialny polski matematyk
Jerzy von Neumann (https://en.wikipedia.org/wiki/John_von_Neumann), że często matematykę się nie
tyle rozumie, ile raczej się do niej *przyzwyczaja*. Dodam od siebie, że gdy się już trochę do niej
przyzwyczai (co wymaga czasu), to zadziwiająco często okazuje się, że jej pojęcia, twierdzenia i
teorie wyrażają coś, co rozumiało się dobrze od samego początku, tylko nie umiało się o tym
dostatecznie konsekwetnie *mówić*, a więc również konsekwentnie albo spójnie *myśleć*.

**Polecenie**: Możemy zapisać symbol implikacji w Leanie pisząc `\to` i naciskając spację. Wpisz
teraz w Leanie `\to` i naciśnij spację, a następnie ulegnij olśnieniu na widok powstającej
strzałki. Przypominam, że to jest polecenie. Jak już ochłoniesz, usuń ten symbol, bo symbol `→` w
izolacji nie jest poprawnie skonstruowanym wyrażeniem języka Lean, co Lean sygnalizuje podkreślając
je czerwoną falką.

**Potencjalnie przydatna analogia**: Być może znasz trochę jakiś inny język programowania, na
przykład *C*. Jeżeli nie, to te uwagi być może nie będą dla Ciebie pomocne, ale nie zaszkodzi
spróbować. W języku *C* możemy *zadeklarować*, albo "ogłosić" - jeszcze zanim przypiszemy jej
jakąkolwiek wartość - że zmienna o nazwie na przykład `x` ma być liczbą całkowitą, pisząc (nie pisz
tego w Lean, Lean Cię nie zrozumie):

```C
int x;
```

*C* jest wspaniałym językiem, do pewnych zastosowań sprawdza się znakomicie, ale w porównaniu do
Lean'a *C* jest językiem dosyć prymitywnym i mało ekspresyjnym. Siła ekspresji języka Lean jest tak
duża, że można w nim zakodować we względnie naturalny sposób wszelkiego rodzaju treści matematyczne!
Chcę przez to powiedziec, że moim zdaniem jesteś wart/a Leana.

W języku Lean możemy wyrazić (prawie) to samo, co `int x` wyraża w języku *C*, czyli, że zmienna `x`
jest (jakąś!) liczbą całkowitą, pisząc (ale nie pisz tego teraz w Lean, to tylko przykład):

```lean
x : Z
```

Moim zdaniem szybko oswoisz się z tą notacją. Litera *Z* jest powszechnie przyjętym symbolem
oznaczającym liczby całkowite (od niemieckiego słowa "*Zahlen*"), o czym wspominam bo czuję, że
wypada, chociaż nie będziemy korzystać z typu `Z`.

**Zadanie**: Na początek udowodnimy takie oto trywialne zdanie:

*Jeżeli a, to a.*

Nadamy też temu dowodowi nazwę, przez co dowód stanie się prawdziwym matematycznym
twierdzeniem. Zdanie *Jeżeli a, to a* jest w oczywisty sposób zawsze prawdziwe, a jego dowód jest
bardzo prosty, ale i tak zdążysz się co najmniej raz poczuć zagubiony/a. Musimy sobie teraz wyjaśnić
coś na temat tego, jak logika działa w języku Lean.

**Uwagi o logice klasycznej i konstruktywnej**: Być może miałe/aś już do czynienia z elementami
logiki zdań. Jeśli tak, to może to być teraz do pewnego stopnia *przeszkoda*. Logika zdań jest
najczęściej wykładana w wersji tak zwanej *klasycznej*, w której prawdą jest, że:

*Każde zdanie jest albo prawdziwe, albo fałszywe.* (zdanie prawdziwe w logice klasycznej)

W Lean domyślnie (można to zmienić, ale nie będziemy tego robić) używamy logiki *konstruktywnej*,
inaczej *intuicjonistycznej*, a nie klasycznej. Ta logika jest w pewnym sensie "ostrożniejsza". W
logice konstruktywnej można przyjąć, że:

*Zdanie prawdziwe znaczy to samo co zdanie udowodnione.* (dopuszczalna interpretacja prawdy w logice
konstruktywnej)

Co za różnica? Jeżeli postanowimy intepretować słowo "prawdziwe" jako równoznaczne z "ma dowód", to
*nie możemy* zaakceptować jako uniwersalnie prawdziwego zdania *Każde zdanie jest albo prawdziwe,
albo fałszywe* bo wiemy (mamy takie twierdzenie), że w matematyce da się skonstruować zdania
prawdziwe, których nie da się udowodnić.

Wracając do naszego trywialnego zdania *a → a*. W logice konstruktywnej, żeby udowodnić implikację
*A → B*, gdzie *A* i *B* to dowolne zdania, trzeba *skontruować procedurę*, która dowolny dowód
zdania *A* przekształca w dowód zdania *B*. Niebawem rozwiążesz zadanie opierając się na tej
interpretacji prawdziwości implikacji, a mimo to zgaduję, że i tak przez pewien czas po tym sukcesie
będziesz czuć, że ta interpretacja jest dla Ciebie dziwna.

**Polecenie**: Skopiuj poniższy fragment kodu, do lewego okna sesji Lean:

```lean
theorem t1 (a : Prop) : a → a := by
```

**Objaśnienie kodu**: Wyrażenie `a : Prop` czytamy jako: `a` jest wyrażeniem (przypominam, że
oficjalna nazwa na takie coś to "term") typu `Prop`, a ponieważ `Prop` to typ zdań (od angielskiego
"*Proposition*" oznaczającego sąd), znaczy to, że `a` jest *jakimś, niekoniecznie prawdziwym albo
udowodnionym (!)  zdaniem*, inaczej sądem. Cały ten krótki fragment kodu czytamy jako:

Twierdzenie (`theorem`), które nazwaliśmy bez żadnego specjalnego powodu *t1* (`t1`), a które z
jednego argumentu `a` (nazwa *a* też była wybrana bo tak) typu `Prop` (`(a : Prop)`) robi term typu
`a → a`, czyli dowód zdania `a → a` (`: a → a`), można skonstruować albo (w Lean to jest to samo)
zdefiniować (`:=`) za pomocą trybu interaktywnego (`by`) w taki oto sposób... i tu będziemy niebawem
konstruować dowód. To było długie zdanie z licznymi wtrąceniami. Może warto przeczytać je jeszcze
raz.

**Uwaga o równości definicyjnej i równości jako zdaniu**: Gdy w Lean piszemy na przykład:

```lean
def n : Nat := 10
```

to *definiujemy raz na zawsze* zmienną `n`, o typie liczba naturalna (`Nat`), *powiadamiając* Lean,
że *postanowiliśmy*, bo tak, że `n` znaczy `10`. Symbol `:=` oznacza więc w Lean *operację
definiowania*. Jeżeli natomiast piszemy (nie pisz tego w Lean) na przykład `n = 10`, to *tworzymy
zdanie*, którego *treścią* jest "*n jest równe 10*", i to zdanie może być w danym kontekście
prawdziwe (w logice konstruktywnej: udowodnione albo udowadnialne), fałszywe (w logice
konstruktywnej: da się udowodnić jego negację), albo może mieć nieokreślony status pod względem
prawdziwości. Nawet, jeżeli zdefiniowaliśmy już `n` jako zmienną o wartości `10`, to zdanie `n = 10`
wymaga w Lean udowodnienia, żeby było uznane przez Lean za prawdziwe! Ten dowód jest bardzo prosty,
bo polega jedynie na tak zwanym *rozpakowaniu* albo *zastosowaniu definicji* zmiennej `n`, ale nadal
jest to dowód.

**Wracając do konstruowanego przez nas teraz dowodu twierdzenia `t1`**: Słowo kluczowe `by` jest
teraz podkreślone czerwoną falką, bo dowód jest rozpoczęty, ale nie jest jeszcze
zakończony. Ponieważ pisząc `by` weszliśmy w *tryb dowodzenia interaktywnego*, gdy kursor znajduje
się *za* słowem `by`, to w prawym oknie widzimy *aktualny stan* konstruowanego w trybie
interaktywnym dowodu. Pod zakładką *Tactic state* w prawym oknie widzimy teraz:

```lean
1 goal
a : Prop
⊢ a → a
```

Czytamy to jako: Został jeden cel do udowodnienia (`1 goal`), inaczej term albo program (sic!) do
skonstruowania, który mamy zrealizować czy skonstruować posługując się (tutaj akurat tylko jednym)
założeniem, że `a` jest (niekoniecznie prawdziwym albo udowodnionym) zdaniem (`a : Prop`). Ten cel
to implikacja `a → a` (`⊢ a → a`). Stworzenie dowodu tego zdania w Lean jest równoznaczne ze
stworzeniem termu (można myśleć programu albo kodu) o typie `a → a`, albo programu zwracającego
dowód zdania `a → a`.

Jak mamy skonstruować taki dowód/program? Taki program musi udowadniać prawdziwość następnika
zakładając poprzednik, co w logice konstruktywnej znaczy:

*Przerabiać dowolny dowód zdania `a` w dowód zdania `a`.*

Może przeczytaj powyższy akapit co najmniej jeszcze raz. A potem spróbuj zobaczyć chociaż trochę
sensu w tym krótkim podsumowaniu:

*Jeżeli A i B to zdania, to w logice konstruktywnej dowód zdania A → B to dowolna funkcja, która w
jakikolwiek sposób zamienia dowolny dowód zdania A w dowód zdania B.*

Może przeczytaj cały ostatni fragment spokojnie jeszcze jeden raz. To jest najważniejszy moment w
całym skrypcie.

**Dygresja terminologiczna**: Symbol `⊢` to symbol derywacji albo wnioskowania albo konstruowania
(różnie można na to patrzeć, więc też różnie można ten symbol nazywać).

**Terminologia**: Zdanie *A* w implikacji *A → B* nazywamy *poprzednikiem*, a dokładnie
poprzednikiem implikacji *A → B*, a zdanie *B* jej *następnikiem*.

**Dezorientator**: Pokażę Ci teraz naprostszy sposób skonstruowania dowodu tego twiedzenia. Nie
kopiuj tego kodu, tylko może zastanów się nad nim przez chwilę:

```lean
theorem najprosciej (a : Prop) : a → a := fun (x : a) => x
```

**Wspaniała wiadomość**: Zrobimy w zasadzie to samo konstruując niebawem dowód `t1`, ale w znacznie
bardziej skomplikowany sposób.

**Implikacja w praktyce dowodzenia**: Żeby udowodnić w Lean zdanie `p → q`, trzeba udowodnić, że
zdanie `q` (następnik) jest prawdziwe, *zakładając*, że zdanie `p` (poprzednik) jest prawdziwe,
czyli w hipotetycznej sytuacji, w której `p` jest prawdziwe. No a w logice konstruktywnej to znaczy:

> Udowodnić zdanie p → q to znaczy podać sposób skonstruowania dowodu q, *zakładając*, że p ma
> *jakiś* dowód.

Może spokojnie przeczytaj to jeszcze raz.

**Polecenie**: Napisz teraz w następnej linijce, pod skopiowanym wcześniej do Leana kodem
zaczynającym się od `theorem ...`, komendę:

`intro h`

Jeżeli przesuniesz kursor *za* wpisaną właśnie komendę `intro h`, to w prawym oknie zobaczysz, że
*stan dowodu uległ zmianie* i wygląda teraz tak:

```lean
1 goal
a : Prop
h : a
⊢ a
```

Mówiąc ogólnie, jeżeli aktualnym celem jest udowodnienie zdania o postaci P → Q (tutaj akurat a → a,
ale P i Q mogą być dowolnie złożonymi poprawnymi zdaniami), to instrukcja intro z argumentem h
powoduje, że *wprowadzamy jako założenie hipotetyczny dowód* poprzednika implikacji P → Q, czyli
wprowadzamy jako założenie hipotetyczny dowód zdania P (tutaj akurat dowód zdania "atomowego", czyli
nie-złożonego, a), i oznaczamy ten hipotetyczny dowód wybranym do tego symbolem h, bo tak nam się
podoba (albo ktoś nas do tego zmusił, nie wiadomo). Może przeczytaj ten fragment jeszcze raz. A
potem jeszcze raz. I znowu. Może nawet jeszcze raz, po krótkiej przerwie.

UWAGA TECHNICZNA O LEAN: intro jest tak zwaną taktyką, to znaczy operacją, której możemy używać
*tylko* w trybie dowodzenia interaktywnego (a ogólniej interaktywnego konstruowania dowolnych termów
określonego typu),

OSOBLIWA MAGIA IZOMORFIZMU CURRY'EGO-HOWARDA: Mówiąc ogólnie, jeżeli p to zdanie, czyli jeżeli:

p : Prop

to wtedy:

h : p

jest *termem typu p*, co w języku Lean (a ogólnie w każdym języku teorii typów zależnych) może
być konsekwentnie rozumiane (na mocy wspomnianego izomorfimu Curry'ego-Howarda) jako:

h jest *dowodem* zdania p!

(DE)MOTYWATOR / UWAGI Z META-POZIOMU: Że dowód jest termem o typie, który jest zdaniem, którego
to zdania ten term dowodzi, to jest jedna z tych początkowo dziwnych konwencji (bo to jest
jednocześnie tylko konwencja, i aż bardzo ważna konwencja, która uniwersalnie "działa" i ma
potężne praktyczne konsekwencje), do których trzeba się po prostu stopniowo przyzwyczaić. Gdy to
już (do pewnego stopnia) nastąpi, ta akurat konwencja pozwala zobaczyć *całą* matematykę w
zupełnie nowy sposób. Nie przesadzam - ten nowy sposób patrzenia na matematykę polega na tym, że
*znika* różnica między uprawianiem czy stosowaniem matematyki i *programowaniem*, z którym w
mojej ocenie wielu studentów czuje się bardziej komfortowo niż z tradycyjnym dowodzeniem
matematycznym.

Jedną z zalet tego punktu widzenia jest i ta, że można wtedy uprawiać matematykę albo tylko uczyć
się jej w interakcji z programem wspomagającym konstruowanie pojęć, teorii i dowodów
matematycznych, czyli z asystentem dowodzenia, takim jak Lean. Można mieć wtedy *zawsze pewność*
(dzięki temu, że Lean spełnia tak zwane kryterium albo warunek de Bruijna), że to, co się
napisało / skonstruowało, jest poprawne, albo, że jest błędne, a także można korzystać z
rozmaitych ułatwień, jakie oferuje dany asystent.

POWRÓT DO ZADANIA: Wprowadzając a jako założenie, a dokładniej zakładając, że a ma *jakiś* dowód
i to *posiadanie jakiegoś dowodu* przyjmując jako założenie, które nazwaliśmy h, sprawiliśmy, że
poprzednik implikacji a → a, a ściślej (hipotetyczny) dowód tego poprzednika, "wskoczył na górę"
jako coś, co zakładamy, że mamy, i co nazwaliśmy sobie literą h, a przez to to, co mamy
skonstruować, czyli cel, *uprościł się* do samego następnika (tutaj a). Mamy więc teraz prostszy
cel i więcej środków, żeby go udowodnić!

POLECENIE: Ten dowód możemy zakończyć natychmiast, używając wprost dostępnego w tym momencie
(hipotetycznego!) dowodu zdania a, bo to zdanie jest takie samo jak jedyny cel. Żeby to osiągnąć,
napisz w następnej linijce (przypominam, że bez znaków --):

`exact h`

Jeżeli kursor znajdzie się za wpisaną właśnie komendą exact h, to stan dowodu widoczny w prawym
oknie powinien wyglądać tak:

`No goals`

Mówimy czasem w takich sytuacjach, że cel został "usunięty", albo "zniszczony", albo
"zanihilowany", albo "unicestwiony", i to jest moim zdaniem piękne (jak również "formalne" w
swojej mechanicznej wymowie). Udało Ci się właśnie udowodnić, dla arbitralnego, czyli dowolnego
zdania a, twierdzenie a → a, używając jednocześnie logiki konstruktywnej (inaczej
intuicjonistycznej), teorii typów zależnych, izomorfizmu Curry'ego-Howarda, i prawdopodobnie nie
znanego Ci w ogóle wcześniej języka programowania Lean. Możesz o tym śmiało opowiedzieć znajomym,
rodzinie, czy przypadkowo spotkanym osobom, o ile uda Ci się to wszystko zapamiętać (można sobie
zapisać w telefonie albo na karteczce). Być może będą pod wrażeniem (a propos problematycznych
żartów, jeżeli brałe/aś udział w moich zajęciach, to pewnie już wiesz, że żenada jest moim
zdaniem wartościowym środkiem dydaktycznym {podobnie jak głęboka, dojmująca dezorientacja}).

**(Re czy Dez?)orientator**: Dowód, który właśnie skonstruowaliśmy za pomocą taktyk w trybie
interaktywnym, jest *taki sam*, jak ten, który możemy skonstruować wprost pisząc kod:

```lean
theorem t1 (a : Prop) : a → a := fun (h : a) => h
```

W jakim sensie to jest dowód zdania `a → a`? Implikacja `p → q` oznacza, że jeśli *p*, to
*q*. Inaczej mówiąc, jeśli *p* jest prawdą, to *q* jest prawdą. A z perspektywy logiki
konstruktywnej, która wymaga dowodu, żeby można było mówić o prawdziwości, jeśli *p* ma dowód, to
*q* ma dowód. No ale jeżeli *a* ma dowód, to z tego dowodu możemy zawsze zrobić przecież ... dowód
*a*, po prostu go przekazując dalej. W ten sposób, konstruując funkcję, która zamienia dowód *a* w
dowód *a* w tym sensie, że pobiera dowód *a* jako argument i nic nie robi, tylko zwraca ten
argument, pokazujemy, że:

Mając dowód *a* zawsze można zrobić dowód *a*. 

No a w takim razie jeśli *a*, to *a*, nie może być inaczej.

Domyślasz się już trochę, co "tak naprawdę" robią taktyki `intro` i `exact`? Gdy użyliśmy taktyki
`intro`, żeby wprowadzić jako założenie `h` hipotetyczny, ale *bliżej nieokreślony* dowód zdania
`a`, to tak jakbyśmy powiedzieli "dla każdego dowodu zdania *a*". A gdy potem użyliśmy taktyki
`exact h`, to tak jak byśmy powiedzieli "zwracam", albo "podaję ten dowód", gdzie zaimek "ten"
spełnia tą samą rolę, co symbol `h`, i *tylko* tą rolę - pozwala mówić o tym samym dowodzie
(hipotetycznym dowodzie zdania *a*) w obu wyrażeniach. To samo wyraża anonimowa funkcja:

```lean
fun (h : a) => h
```

Można to przeczytać tak: Dla każdego dowodu *h* zdania *a*, zracam/mam/można stworzyć/istnieje dowód
*a*, i jest nim *h*.

**Zadanie do samodzielnego rozwiązania**: Spróbuj teraz samodzielnie dokończyć dowód następującego
twierdzenia, kopiując najpierw poniższy fragment kodu. Gdy poczujesz się zagubiona/y, zaglądaj
czasem do okna po prawej, albo do wcześniejszych fragmentów tego skryptu. Albo weź głęboki oddech,
albo zrób sobie krótką albo dłuższą przerwę. To są sprawy wielkiej wagi, a w sprawach wielkiej wagi
zwykle nie należy się spieszyć. Najpierw spróbuj bez podpowiedzi, a jak poczujesz, że to jednak za
trudne (co by mnie wcale nie zdziwiło), zerknij poniżej, znajdziesz tam pomoc. Jeżeli chcesz
skorzystać z podpowiedzi, za każdym razem spróbuj "wygrać w tą grę" zaglądając tylko do jednej
podpowiedzi, z której jeszcze nie skorzytałe/aś.  theorem t2 (p : Prop) (q : Prop) : p → q → p := by
sorry -- nie kopiuj tej linijki

**Podpowiedź**: Trzeba dwa razy użyć taktyki intro, w dodatku jeden raz jakby niepotrzebnie. Trzeba
też uważać z nazwami podanymi jako argumenty dla intro (nie mogą się powtarzać w ramach tej samej
części dowodu). Skutek zastosowania taktyki zobaczysz z prawej tylko jeżeli kursor będzie się
znajdował za końcem komendy użycia tej taktyki.

**Podpowiedź**: Taktyki intro trzeba użyć za każdym razem w nowej linijce, albo w tej samej, ale
oddzielając oba użycia symbolem ;. W ramach tego samego dowodu trzeba zwykle wybierać inną nazwę dla
każdego nowego wprowadzanego (intro to skrót od introduction) założenia, na przykład najpierw nazwę
h1, a następnie nazwę h2, albo najpierw nazwę jas, a potem malgosia. Dobrze jest stosować jakąś
prostą, spójną konwencję w wymyślaniu nazw.

**Podpowiedź**: Na końcu trzeba będzie użyć taktyki exact z odpowiednim argumentem. Nie podpowiem
już którym, ale podpowiem, że o ile wszystko do tej pory poszło dobrze, to nazwę odpowiedniego
argumentu dla taktyki exact znajdziesz w tym, co masz lokalnie do dyspozycji, czyli w oknie po
prawej powyżej symbolu ⊢. W ten sposób unicestwisz jedyny cel, jaki będzie do unicestwienia (jeżeli
wprowadziłeś oba założenia tej podwójnej implikacji).

**Polecenie**: Po udanym wykonaniu tego zadania spróbuj je zrobić od początku jeszcze raz, ale
tłumacząc sobie, jaki jest sens, czyli jaka jest przyjęta przez nas interpretacja tego, co
robisz. Jak się pogubisz w tych wyjaśnieniach, poszukaj wskazówek w poprzednich komentarzach.

**O stosowaniu twierdzeń - dalsze uwagi na temat izomorfizmu Curry'ego-Howarda**: Być może widzisz
już analogię między tym, jak zapisaliśmy twierdzenie, a raczej jak skonstruowaliśmy jego dowód, a
tym, jak definiuje się funkcje albo procedury w bardziej przyziemnych językach programowania. Na
przykład, w języku *C*:

```C
int suma(int a, int b){
  return a + b;
}
```

to definicja funkcji albo procedury dodającej dwie liczby typu int. Dokładniej, funkcja suma z
dwóch dowolnych argumentów typu int (liczb całkowitych), które z perspektywy kodu "w środku"
funkcji suma nazywają się a i b, robi liczbę całkowitą wyliczoną przez ich dodawanie i zwraca tą
liczbę jako rezultat. W C typ rezultatu funkcji piszemy najpierw ("int" na początku pierwszej
linijki), potem piszemy nazwę definiowanej funkcji (tutaj "suma"), potem w nawiasach wyliczamy
jej parametry podając najpierw ich typy i oddzielając je przecinkiem, a na końcu definiujemy
ciało funkcji, otaczając je nawiasami klamrowymi. Średnik sygnalizuje koniec instrukcji, przy
czym tutaj mamy tylko jedną instrukcję w ciele - "return a + b". Tak zdefiniowaną funkcję możemy
potem w języku C *zastosować* do dwóch argumentów całkowitoliczbowych, na przykład tak:

```C
int wynik = suma(1, 20);
```

W ten sposób zadeklarowaliśmy jako całkowitoliczbową nową zmienną o nazwie wynik i jednocześnie
przypisaliśmy jej, będącą wynikiem zastosowania funkcji suma do argumentów 1 i 20, wartość 21.

**Trochę się obawiam o tym pisać, ale muszę**: Mamy tu znowu znak równości i znowu ten symbol znaczy
coś innego!  Tym razem to nie jest {ostateczna} definicja, ani nie jest to równość jako zdanie,
tylko *operacja przypisania wartości do zmiennej*. Różnica polega na tym, że w C raz przypisaną do
zmiennej wartość można później zmienić, natomiast definicje w Lean są *ostateczne*.

Definicja analogicznej funkcji w języku R wygląda podobnie, ale prościej:

```R
suma = function(a, b){
  a + b
}
```

Język R również traktuje wszystkie zmienne jako obiekty, które mają określony typ, i w R tak jak
w C równość oznacza przypisanie wartości do zmiennej, ale w R nie musimy zwykle jawnie deklarować
typu, bo na ogół R sam się tego domyśla.

W takim zwykłym języku programowania jak C jawne typowanie służy zmniejszeniu ryzyka błędu:
Jeżeli na przykład spróbujemy zastosować mnożenie do dwóch zmiennych tekstowych, a nie
liczbowych, to program nie zostanie skompilowany do wersji, którą możemy uruchomić, bo bez
napisania specjalnego kodu mnożenie nie działa w C dla zmiennych tekstowych. Dzięki wykryciu
błędu na tym wczesnym etapie, to jest przed uruchomieniem programu, unikamy (potencjalnie
trudnych do wykrycia) problemów po uruchomieniu. W Lean typowanie ma również i takie
zastosowanie, ale służy też do znacznie ciekawszych rzeczy, takich jak formalizacja treści
matematycznych.

Twierdzenie w języku Lean zapisaliśmy używając składni języka Lean, a nie składni języka C czy R,
bo Lean to nie C ani R, ale ogólna struktura kodu definiującego nasze twierdzenie jest taka sama
("modulo notacja"), jak struktura definicji funkcji w C:

`theorem t2 (p : Prop) (q : Prop) : p → q → p := by`
 ... tu miał się pojawić Twój dowód i stać się ciałem definicji t1 ...

Nazwę funkcji podaliśmy po słowie kluczowym theorem, typ rezultatu podaliśmy po znaku :, od razu
widać też, gdzie są parametry twierdzenia-jako-funkcji t2 i jakie mają typy, wreszcie ciało tej
funkcji zdefiniowaliśmy za pomocą kodu występującego po znaku :=. Jeżeli teraz *zadeklarujemy*, że
mamy (jakieś) zdanie o nazwie "a", używając słowa kluczowego variable:

**Polecenie**: Jeżeli wkleisz ten fragment do Leana.

```lean
variable (a : Prop)
```

to będziemy mogli zastosować twierdzenie `t1` tak samo, jak stosowaliśmy funkcję `suma`, albo
`dodaj2`, i tak samo, jak stosuje się funkcję w *C* czy w *R*, tylko pisząc to trochę inaczej, bo
składnia jest inna:

Polecenie: Wklej ten fragment do Leana i umieść kursor nad komendą `#check`.

```lean
#check t1 a
```

Komenda `#check` *wyrażenie* pozwala zobaczyć w oknie po prawej, gdy kursor znajduje się nad słowem
`check`, jaki jest typ podanego wyrażenia, o ile wyrażenie jest poprawnie skonstruowane. W tym
wypadku typem całego wyrażenia - `t1 a` - czyli aplikacji twierdzenia-jako-funkcji `t1` do zdania
`a`, jest zdanie `a → a`. W ten oto sposób możemy stosować nasze twierdzenie `t1` do dowolnego
zdania, na przykład do jakiegoś zdania bardziej złożonego, takiego jak `a → a` (musi być tutaj w
nawiasach):

```lean
#check t1 (a → a)
```

albo do zdania `a → (a ∧ a)` [Czytaj: *a* implikuje koniunkcję zdań *a* i *a*]

```lean
#check t1 (a → (a ∧ a))
```

**Widok z lotu ptaka**: Nasze twierdzenia zakodowane w Lean są więc jednocześnie:

1. Zdaniami matematycznymi połączonymi z dowodami tych zdań.

2. Termami pewnego typu, konkretnie (tak zwanego zależnego, ale nie przejmuj się tym) typu:

funkcja obliczająca/konstruująca z dowolnego zdania `a` dowód zdania `a → a`

W ten oto sposób *znika różnica między uprawianiem matematyki teoretycznej i programowaniem*.

**Ostatni motywator**: Jak wspominałem, mam powody sądzić, że nawet jeżeli dotarła/eś do tego
momentu i udało Ci się wykonać poprawnie wszystkie polecenia, możesz nadal mieć poczucie
dezorientacji i braku sensu. W związku z tym oferuję takie pocieszenie: Być może zdarzyło Ci się
kiedyś grać w gry typu FPS. Gdy nie ma się w takich grach doświadczenia, poruszanie się po mapie
bywa nieporadne, a wiele początkujących osób chodzi często z "nosem w ścianie" albo nawet "w
podłodze". Z czasem, gdy gra się trochę dłużej, stopniowo pojawia się coraz lepsza, utrzymująca się
coraz dłużej świadomość własnego położenia na mapie jako całości. To trochę tak, jakby jednocześnie
patrząc przez "niby-własne" oczy patrzyło się również, ale mentalnie, na swoje działania z lotu
ptaka, albo jakby się było jednocześnie we własnym ciele i w pewnym sensie ponad nim. To samo dzieje
się, gdy nabiera się praktyki w używaniu narzędzi formalnych. I tego Ci życzę, bo zdarza się, że
taki widok z lotu ptaka na wyrafinowane i bywa, że wręcz ekstremalnie abstrakcyjne konstrukcje
formalne czasami dostarcza poczucia ogromnej intelektualnej mocy.

**Ostatni dezorientator**: Z wnętrza ciała każdej funkcji widać jej parametry, na przykład z wnętrza
ciała naszej funkcji `suma` widać parametry `n` i `m` o typie `Nat`, ale z wnętrza ciała każdej
funkcji widać też zmienne, które zostały zdefiniowane wcześniej *na zewnątrz* definicji funkcji. Na
przykład, w ciele funkcji `dodaj2` używaliśmy symbolu `2` i symbolu `+`, które są zdefiniowane w
automatycznie ładowanej bibliotece Lean'a, na zewnątrz definicji funkcji `dodaj2`. 

Jeżeli teraz przyjmiemy *aksjomatycznie*, czyli bo tak, że `p` jest (jakimś) zdaniem i że istnieje
term `dp`, który jest dowodem zdania `p`:

```lean
axiom p : Prop
axiom dp : p
```

to *w tym kontekście*, albo *w ramach tej formalnej mini-teorii* będziemy mogli udowodnić takie oto
twierdzenie:

```lean
theorem t3 (a : Prop) : a → p := fun (h : a) => dp
```

To, co "mówi" twierdzenie zapisane w Lean można odczytać z kodu po jego nazwie i przed symbolem
`:=`. Być może jesteś już teraz w stanie sam/a zobaczyć, że twierdzenie `t3` mówi dosłownie:

Dla każdego (zdania) `a`, jeżeli `a` (jest prawdą = ma dowód), to `p` (jest prawdą = ma dowód).

Albo:

Dla każdego zdania `a`, można zrobić term typu `a → p`, czyli dowód zdania `a → p`, czyli, mówiąc
krótko, dla każdego zdania `a`, jeżeli `a`, to `p`. I można to zrobić w ten oto sposób ...

Faktycznie z każdego dowodu zdania `a` możemy w tym momencie zrobić dowód zdania `p`, po prostu
*ignorując* dowód zdania `a` i przytaczając dowód `dp` zdania `p`, który w tym momencie istnieje
aksjomatycznie, czyli bo tak, i jest widoczny wewnątrz ciała definicji `t3`.

W pierwszej chwili to się może wydawać dziwne, ale przecież, jeżeli na przykład *wiemy już*, że
jutro będzie sobota (i ta wiedza spełnia rolę aktualnego aksjomatu), to przyjmując obowiązującą w
logice interpretację implikacji, prawdą jest na przykład, że *jeżeli dzisiaj pada deszcz, to jutro
będzie sobota*, chociaż między dzisiejszym deszczem a jutrzejszym dniem tygodnia nie ma związku. *W
tej sytuacji* (czyli w tym *kontekście*) prawdą jest, że *jeżeli dzisiaj pada deszcz, to jutro
będzie sobota*, po prostu dlatego, że ... jutro będzie sobota (i to jest część rozważanej sytuacji
albo kontekstu). Rozpoznajemy tu podobny sam schemat rozumowania jak w przypadku dowodu twierdzenia
`t3`.
