<br/>

<div align="right">*Jeżeli drzewo marnieje choćby w najgorszej glebie, to tylko dlatego, że nie dość
głęboko zapuszcza korzenie. Cała ziemia jest jego*. - Fryderyk Hebbel</div>

<br/> 
<br/> 
<br/>

# Pierwszy spacer po Leanie, wersja pierwsza

Ponieważ są tak ważne, treści, o których będziesz się uczyła w tym rozdziale, omówię jeszcze raz,
tylko inaczej, w rozdziale następnym. Dzięki temu mam nadzieję ułatwić Ci aktywne powtarzanie
materiału. Gdy więc czytając ten rozdział i wykonując polecenia poczujesz, że utknęłaś, być może
znajdziesz poprawne rozwiązanie, albo zaczniesz lepiej rozumieć, jak je znaleźć, w trakcie czytania
tej następnej części.

Mówiąc ogólnie, w przypadku utknięcia sugeruję pozbyć się ambicji i czytać bez wstydu, albo zrobić
sobie przerwę i spróbować później, albo wrócić do wcześniejszych wyjaśnień. A gdyby i to zawiodło,
zawsze możesz zadać mi pytanie mailem (boryslaw.paulewicz@uj.edu.pl). Na pewno się ucieszę i jeśli
tylko nie odłożę odpowiedzi z powodu braku czasu, przez co później o niej zapomnę (co mi się
niestety zdaża), to spróbuję pomóc. Gdybym nie odpowiedział w ciągu kilku dni, to się wcale nie
obrażę, gdy napiszesz znowu.

Zależy mi na tym, żeby zwłaszcza te pierwsze rozdziały były dopasowane do możliwości większości
studentów, dlatego będę wdzięczny za informacje o pojawiających się trudnościach. Tylko proszę nie
zwracaj się wtedy do mnie per Panie Doktorze. Wiem, że studenci tak robią z dobrej woli i że
pracownicy uczelni czasem tego oczekują, ale moim zdaniem, zwłaszcza w dyscyplinach takich jak
psychologia, te tytuły są śmieszne i mogą utrudniać przyjęcie krytycznej postawy przez rozmówcę albo
czytelnika. Albo może tak: Jeżeli do mnie napiszesz i będę miał powody sądzić, że czytałaś już ten
fragment, to Pana Doktora potraktuję jako żart. I to też będzie ok.

**Polecenie**: Korzystając z dowolnej przeglądarki wejdź na stronę:

https://live.lean-lang.org

Rozpoczniesz w ten sposób interaktywną sesję z asystentem dowodzenia Lean. Nie przejmuj się, jeżeli
widzisz to okno po raz pierwszy i wydaje Ci się obce, bo to minie. Będziesz pisać w panelu po lewej
i czasem zaglądać do panelu po prawej.

Błędy będą się pojawiać, ponieważ jesteś (zgaduję)
[człowiekiem](https://www.youtube.com/watch?v=UVL186zzOXo). Gdy pojawi się błąd, Lean Cię o tym
powiadomi podkreślając go czerwoną falką. Przypuszczam, że najczęściej to będzie literówka. Czasami
samo miejsce, w którym pojawi się czerwona falka, powie Ci, co należy zmienić, ale nie zawsze. W
razie wątpliwości przeczytaj komunikat o błędzie, który pojawi się w panelu po prawej i spróbuj
ustalić w czym problem.

Zgodnie z tym, co wcześniej napisałem o potrzebie sensu, uważam, że warto, żebyś przed czytaniem
szczegółowych wyjaśnień spróbowała wykonać od razu kilka zadań. Tym razem jednak spróbuję najpierw
czegoś trochę innego.

**Uczenie się poprzez wcielenie się w rolę**: Wyobraź sobie, że Twoim zadaniem jest zaprojektowanie
nowego języka, który pozwalałby w jednoznaczny, zwięzły i zarazem możliwie czytelny sposób zapisywać
różne definicje. Wydaje się, że zależałoby Ci wtedy na zapisaniu w jakiś sposób informacji, która
pozwalałaby jednoznacznie określić, jakie operacje z użyciem definiowanych stałych mają sens. Byłoby
też wskazane, żeby nie używać do tego symbolu równości (*=*), bo ten mógłby się jeszcze później
przydać do całkiem innych celów.

Przydałoby się zatem jakieś krótkie i łatwe do zapamiętania *słowo kluczowe*, na przykład `def`, bo
takie kojarzy się od razu ze słowem *definicja*. Nie byłoby też wcale źle, gdyby zapis informujący o
operacjach, które można wykonywać z użyciem danej stałej kojarzył się z naklejeniem na coś w sklepie
etykietki. A najlepiej, żeby symbol oznaczający bycie treścią albo ciałem definicji przypominał
taki, którego często używa się w tym celu w matematyce albo w informatyce.

**Polecenie**: Wklej do Leana poniższy fragment kodu. Możesz wkleić go do schowka klikając na dwa
małe kwadraty, które widać po prawej stronie.

```lean
def dziesiec : Nat := 10
```

To jest *definicja*, co poznajemy po słowie `def` i po symbolu `:=`. Symbol `:=` można czytać jako
*niech będzie* (*już na zawsze*). Każda definicja jest definicją jakiejś *stałej*, w tym wypadku to
stała `dziesiec`. Każda stała ma jakiś *typ*. Stała dziesięć ma typ `Nat` (`: Nat`), czyli jest
*liczbą naturalną*. *Ciało* tej definicji, czyli jej wartość albo treść, to liczba (a właściwie
*term*) `10`.

Będę czasem pisał tak, jakby fragment kodu taki jak `dziesiec : Nat` pełnił rolę *rzeczownika* - na
przykład "stała `dziesiec : Nat` jest ..." to będzie inny sposób, żeby powiedzieć "stała `dziesiec`
o typie `Nat` jest ..." - albo *zdania*, na przykład "Jeżeli `dziesiec : Nat` ..."  to będzie inny
sposób, żeby powiedzieć "Jeżeli stała `dziesiec` ma typ `Nat`...". W obydwu przypadkach właściwa
interpretacja będzie wynikała z kontekstu.

**Polecenie**: Napisz w Leanie analogiczną definicję stałej o nazwie `trzy`. Musisz tylko skorzystać
z `dziesiec` jako przykładu, zamieniając dwa elementy tej definicji, to jest nazwę stałej i jej
wartość. Jeżeli napiszesz coś niezgodnie z wymaganiami Leana, zobaczysz fragment podkreślony
czerwoną falką. Wiesz, co wtedy robić.

**Polecenie**: Zmień swoją poprawną definicję stałej `trzy` na *błędną* zastępując `3` przez słowo
`tszy` (bez cudzysłowów). Ta definicja będzie błędna nie dlatego, że to słowo zawiera błąd
ortograficzny. Umieść kursor na słowie `tszy` i odczytaj komunikat o błędzie widoczny po
prawej. Powinnaś wtedy zobaczyć *unknown identifier 'tszy'*, co oznacza, że Lean nie wie, czym jest
`tszy`. Jak widzisz, błędy to tylko okazja, żeby Lean mógł się wykazać.

W Leanie można definiować stałe wielu różnych typów, nie tylko liczbowych. Poniższy kod definiuje
stałą o typie tekstowym (`String`). Zwróć uwagę, że wartości zmiennych tekstowych muszą być otoczone
cudzysłowami.

**Polecenie**: Skopiuj do Leana lub przepisz z pamięci:

```lean
def gwiazda_wieczorna : String := "Rihanna"
```

Żeby zobaczyć wartość stałej trzeba użyć komendy `#eval` (od *evaluation*):

```lean
#eval dziesiec
```

**Polecenie**: Napisz teraz w nowej linijce `#eval gwia`, tylko tyle. Zobaczysz, że Lean zaoferuje
Ci możliwość szybkiego wpisania pełnej nazwy. Żeby z tego skorzystać, naciśnij klawisz Tab, kiedy
Lean podświetla właściwą kontynuację, lub wskaż ją za pomocą myszki lub klawiszy strzałek. Ponieważ
kursor będzie się wtedy znajdował w linijce, która zaczyna się od komendy `#eval`, po prawej
zobaczysz wartość wpisywanej stałej.

Gdybyś miała wątpliwości, jaki jest typ pewnej stałej, możesz to sprawdzić używając komendy
`#check`:

```lean
#check dziesiec
```

Po prawej zobaczysz wtedy komunikat, że stała `dziesiec` ma typ `Nat` (jest liczbą naturalną).

**Polecenie**: Za pomocą komendy `#check` sprawdź typ którejś ze zdefiniowanych dotąd stałych.

**Wbrew pozorom przydatne ćwiczenie**: Jeśli masz ochotę, stwórz własną zmienną tekstową, o jakiej
tylko chcesz wartości. Nawet, jeżeli wydaje Ci się to zbyt proste, może warto to zrobić, bo dzięki
temu Lean zadomowi się bardziej "w Twoich palcach" i następne fragmenty kodu będziesz lepiej
"czuć". To jest trochę tak, jak z robieniem notatek. Sama czynność notowania mniej więcej na temat,
nawet gdy wydaje się, że nic nie wnosi, zmienia sposób, w jaki przetwarzamy informacje, wpływa na
to, co później pamiętamy, a przez to wpływa na to, jak postrzegamy podobne treści i jak na nie
reagujemy. A jeżeli ta czynność wydaje się taka łatwa, że aż zbędna, to być może nawet lepiej.

## Funkcje w Leanie

Stałe, które do tej pory zdefiniowaliśmy, nie pozwalają nam za wiele zrobić. Najważniejszą częścią
programów komputerowych nie są tego rodzaju stałe, tylko *funkcje*, to jest algorytmy albo efektywne
procedury obliczeniowe, które już "coś zrobić" mogą. Żeby stworzyć definicje funkcji będziemy jawnie
podawać ich typ (inaczej jawnie typować), tak jak wcześniej wprost napisaliśmy, że stała `dziesiec`
ma typ `Nat` (`dziesiec : Nat`).

**Uczenie się przez wcielenie się w rolę**: Wyobraź sobie teraz, że masz zaprojektować również
składnię, która pozwalałaby jednoznacznie, zwięźle i czytelnie zapisywać *strukturę funkcji*
rozumianych jako efektywne procedury obliczeniowe albo po prostu programy. Skoro definicje
zapisujemy za pomocą słowa kluczowego `def`, to w tym wypadku wypadałoby chyba użyć słowa kluczowego
`fun`. Funkcje rozumiane jako programy mają być, cóż, jak programy, ale chcemy również, żeby
przypominały funkcje rozumiane tak, jak się je rozumie w matematyce. 

"Funkcje matematyczne" są często rozumiane jako "obiekty", które każdemu elementowi zbioru
nazywanego *dziedziną funkcji* przyporządkowują dokładnie jeden element zbioru nazywanego jej
*przeciwdziedziną*. Na przykład, (matematyczna) funkcja kwadratowa ze zbioru liczb rzeczywistych
(będącego jej dziedziną ...) do zbioru liczb rzeczywistych (... jak również jej przeciwdziedziną)
każdej liczbie *x* przyporządkowuje (dokładnie jedną) wartość daną przez wyrażenie *x \* x*.

Ponieważ to ma być jednak funkcja rozumiana jako program, chciałabyś też pewnie, żeby sposób jej
zapisu kojarzył się łatwo z *procesem przekształcania* i chciałabyś też może, żeby dało się w tym
zapisie wyrazić (odpowiadający pojęciu dziedziny) wymagany typ jej argumentu. No to co byś wtedy
powiedziała na to? (bo ja byłbym skłonny nawet stwierdzić, że nie da się tego zrobić lepiej):

```lean
-- Funkcja kwadratowa ograniczona do liczb naturalnych jako program komputerowy:
fun (n : Nat) => n * n
```

Pozostaje jeszcze kwestia sposobu zapisywania typów tego rodzaju wyrażeń. Zgodzisz się chyba, że
naturalnie byłoby oznaczać takie typy w sposób, który mówi o tym, jaki jest typ argumentu i o tym,
jaki jest typ rezultatu, a przy tym kojarzy się łatwo z pojęciami przekształcania i
przyporządkowywania.

**Polecenie**: Żeby wpisać w Leanie strzałkę napisz `\to` i ulegnij olśnieniu. Gdy już ochłoniesz,
usuń tą strzałkę, bo sama strzałka nie jest jeszcze poprawnym fragmentem kodu.

Nawet najprostsze fragmenty kodu możemy zapisać w Leanie na wiele sposobów, w tym również skrótowo,
pomijając informacje, których Lean może się sam domyślić. Ta elastyczność ma służyć użytkownikowi,
ale na razie nie będziemy z niej korzystać, bo naszym celem jest dobre opanowanie podstaw, a nie jak
najszybsze korzystanie z udogodnień.

Będę odtąd używał *komentarzy*. Komentarzem jest tekst zaczynający się od znaków `--`. Lean ignoruje
wszystko, co jest napisane po tych znakach, taki tekst ma zatem służyć tylko Tobie.

Tak możemy zdefiniować funkcję, która przyjmuje argument typu `Nat` i zwraca jego wartość zwiększoną o *2*:

```lean
-- Nat → Nat oznacza typ funkcji, które pobierają argumenty typu Nat i zwracają rezultat typu Nat
def dodaj2 : Nat → Nat := 
    -- fun to słowo kluczowe i jednocześnie skrót od *function*. W Lean oznacza *funkcję anonimową*, inaczej 
    -- *λ-abstrakcję*
    fun (moj_parametr : Nat) => moj_parametr + 2
```

Lean wie, że te dwie (a licząc z komentarzem cztery) linijki to definicja jednej i tej samej
funkcji, bo bez fragmentu zaczynającego się od `fun` ten kod byłby niekompletny. Nie trzeba
zapisywać tej definicji w dwóch linijkach; zrobiłem tak tylko z powodów estetycznych.

**Czytamy to**: Definiuję (`def`) stałą `dodaj2` typu funkcja przekształcająca liczby naturalne w
liczby naturalne (`: Nat → Nat`) jako (`:=`) funkcję (`fun`), która jakikolwiek `moj_parametr` typu
`Nat` (`(moj_parametr : Nat)`) przekształca (`=>`) w `moj_parametr + 2`. Nie wiem, czy to dobrze
widać, ale parametry pełnią rolę zaimków - gdyby ta funkcja umiała mówić, co robi, mogłaby to
powiedzieć tak: *Do tego co mi dasz, a co musi być typu `Nat`, dodaję `2`*.

**Polecenie**: Podaj Leanowi powyższą definicję funkcji `dodaj2`, ale nie *kopiując* tego kodu,
tylko wpisując go *z pamięci*, bez przepisywania komentarzy. Jestem pewien, że prędzej czy później
sobie z tym poradzisz. Dzięki temu ćwiczeniu ogólna struktura tego rodzaju definicji lepiej Ci się
utrwali. Możesz oczywiście wracać do tego fragmentu książki ile razy tylko będzie trzeba, albo żeby
lepiej zapamiętać strukturę definicji, albo żeby sprawdzić, gdzie dokładnie pojawił się ewentualny
błąd.

**Polecenie**: Funkcję `dodaj2` można zastosować do dowolnej liczby naturalnej, w tym również do
stałej `dziesiec`, bo ta stała ma taki sam typ, jak parametr funkcji `dodaj2`. Żeby to zrobić i
jednocześnie obliczyć wynik napisz Leanowi z pamięci, być może przyspieszając pisanie i jednocześnie
zmniejszając ryzyko literówki za pomocą Taba:

```lean
#eval dodaj2 dziesiec
```

**Definicja aplikacji**: Samo *zestawienie* obok siebie funkcji i jakiegokolwiek wyrażenia, również
takie *błędne* zestawienie, bez obliczania wyniku, nazywamy *aplikacją*. Oddzielanie aplikacji od
ewaluacji może się wydawać zbędne, ale okaże się potrzebne między innymi podczas dowodzenia
twierdzeń. Na przykład, `dodaj2 dziesiec` jest aplikacją, w dodatku poprawną, bo `dodaj2` wymaga
jako argumentu dowolnego termu typu `Nat`, a stała `dziesiec` jest właśnie takim termem.

Zdefiniujemy teraz funkcję, która będzie dodawała *dwie* dowolne liczby naturalne. Zrobimy to w
sposób, który pozwoli Ci zobaczyć, że takie funkcje w Leanie są tak naprawdę
*jedno*argumentowe. Ponieważ to będzie najtrudniejsza część tego rozdziału, spróbuję wyjaśnić jak to
działa na kilka sposobów.

```lean
def plus : Nat → (Nat → Nat) := 
    fun (pierwsza : Nat) =>
        fun (druga : Nat) => pierwsza + druga
```

Zamiast od razu tłumaczyć, czemu ten kod ma tak pozornie niepotrzebnie złożoną strukturę, powiem Ci
najpierw, w jaki sposób Lean ewaluuje (czyli "oblicza") aplikację funkcji `dodaj2` do termu `2`, a
potem powiem Ci, jak ewaluuje aplikację funkcji `plus` do termów `1` i `2`. Nie kopiuj poniższego
kodu, to tylko ilustracja.

```lean
-- Żeby ewaluować tą aplikację, Lean ewaluuje, czyli redukuje do najprostszej postaci, argument aplikacji. 
-- Cyfra 2 może być zredukowana do czegoś bardziej podstawowego, ale o tym powiem innym razem. Na razie będziemy
-- udawać, że pod cyfrą 2 nie kryje się nic więcej.
#eval dodaj2 2

-- Lean rozpakowuje również definicję stałej funkcyjnej, czyli tutaj stałej dodaj2. W ten sposób w miejscu dodaj2
-- mamy tak zwaną *funkcję anonimową*, bo już bez nazwy "dodaj2", to jest 
-- fun (moj_parametr : Nat) => moj_parametr + 2
-- Otoczyłem tą funkcję nawiasami, żeby zapis był jednoznaczny.
(fun (moj_parametr : Nat) => moj_parametr + 2) 2

-- Lean odczepia część przed symbolem =>, zostawiając tylko ciało tej (anonimowej) funkcji:
moj_parametr + 2
-- i jednocześnie podstawia zredukowaną wersję argumentu pod parametr funkcji w ciele funkcji, czyli w tym 
-- wypadku podstawia 2 pod zmienną moj_parametr:
2 + 2

-- Czy widzisz, że warto tutaj użyć innej nazwy - "parametr" - na to, co pojawia się po słowie fun
-- (czyli na moj_parametr) i innej - "argument" - na to, co pojawia się jako drugi term w tej aplikacji 
-- (czyli na 2)? Bez nazywania tych dwóch rzeczy za pomocą innych słów byłoby trudno o tym mówić w sposób 
-- zrozumiały.

-- + to także funkcja, tylko taka, której apliację możemy zapisać w *notacji infiksowej*, czyli w stylu 
-- argument1 funkcja argument2
-- Lean na to pozwala, jeśli mu wytłumaczymy, co to znaczy. W przypadku funkcji + wie to z góry.

-- W końcu Lean rozpakowuje definicję funkcji + i stosuje ją do obydwu argumentów. Ten proces trwa aż do momentu,
-- gdy nie da się nic więcej zredukować. W ten sposób powstaje wynik dodawania i właśnie ten wynik pojawia się
-- jako rezultat, gdy wymuszamy ewaluację aplikacji dodaj2 2:
#eval dodaj2 2 -- Kiedy kursor jest w tej linijce, po prawej widać liczbę 4
```

Przypuszczam, że tego właśnie się mniej więcej spodziewałaś, tylko może sens tej operacji nie jest
jeszcze dla Ciebie całkiem oczywisty, bo częściowo przysłaniają go moje rozwlekłe objaśnienia. Teraz
pokażę Ci, jak przebiega ewaluacja bardziej skomplikowanej funkcji `plus` do argumentów `1` i
`2`. Ten kod to również tylko ilustracja:

```lean
#eval plus 1 2

-- Pierwszy krok ewaluacji to rozpakowanie definicji stałej plus:
(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 1 2

-- Drugi krok ewaluacji to odczepienie ciała:
(fun (druga : Nat) => pierwsza + druga) 
-- i jednocześnie podstawianie argumentu 1 pod zmienną pierwsza, będącą parametrem ewaluowanej w tym kroku 
-- aplikacji. W ten sposób *funkcja plus tworzy nową funkcję* (anonimową) za każdym razem, gdy dostaje pierwszy 
-- argument (typu Nat).
(fun (druga : Nat) => 1 + druga) 2

-- Trzeci krok to też ewaluacja aplikacji, a więc kolejne odczepienie ciała:
1 + druga
-- i jednocześnie podstawienie, tym razem argumentu 2 pod zmienną druga, będącą parametrem ewaluowanej w tym kroku
-- aplikacji:
1 + 2

-- Ewaluacja postępuje w ten sam sposób do momentu, aż nie będzie nic więcej do zredukowania.
```

Jeszcze raz to samo, ale tym razem bez komentarzy i bez zapisywania w osobnej linijce odczepianego
ciała:

```lean
-- Ewaluacja aplikacji plus 1 2 w zarysie
#eval plus 1 2

(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 1 2

(fun (druga : Nat) => 1 + druga) 2

1 + 2

3
```

Czy widzisz, jak kolejne argumenty "wskakują" na właściwe miejsca w ciele funkcji? Mogę chyba już
teraz wyjaśnić, że `1 + 2` jest rozpakowywane do aplikacji `Nat.add 1 2`, bo w tym kontekście `+` to
tylko inny sposób zapisania od razu dostępnej w Leanie funkcji `Nat.add`, która obsługuje dodawanie
liczb naturalnych.

Pokażę Ci jeszcze raz to samo, ale używając notacji, którą chętnie stosują matematycy. Dla
uproszczenia pominę przy tym typy parametrów.

Anonimowe funkcje, takie jak `fun (moj_parametr : Nat) => moj_parametr + 2`, nazywamy również
*λ-abstrakcjami*. Lean wie o tej konwencji i pozwala zamiast `fun` napisać `λ`. Jeżeli chcesz używać
tej konwencji, możesz uzyskać tą grecką literę pisząc `\la`.

Jeżeli zastosujemy uproszczoną (bo bez typów) notację matematyczną, gdzie zamiast `fun` będziemy
pisać λ, a zamiast `=>` będziemy pisać kropkę, to zobaczymy, że ewaluacja aplikacji anonimowej
wersji (bo bez nazwy "dodaj2") funkcji `dodaj2`:

*(λ x . x + 2) 2*

polega w pierwszym kroku na odczepeniu ciała (części po kropce):

*x + 2*

i podstawieniu argumentu pod zmienną *x*, będącą parametrem tej λ-abstrakcji:

*2 + 2*

Ewaluacja aplikacji anonimowej wersji funkcji `plus` do liczb *1* i *2*:

*(λ x . (λ y . x + y)) 1 2*

też polega na takim samym odczepieniu ciała:

*(λ y . x + y)*

i podstawieniu argumentu pod zmienną *x*, będącą parametrem zewnętrznej λ-abstrakcji. W ten sposób z
ciała zewnętrznej λ-abstrakcji powstaje nowa wersja funkcji *(λ y . x + y)*, w której zamiast *x*
jest *1* i cała początkowa aplikacja zostaje zredukowana do postaci:

*(λ y . 1 + y) 2*

Ewaluacja jeszcze nie jest zakończona, bo jest co do czego aplikować. Matematycy mówią w takiej
sytuacji, że jest tu jeszcze jakiś *redex* (to skrót od *reducible expression*). A więc znowu
odczepiamy ciało:

*1 + y* 

i jednocześnie podstawiamy za zmienną *y* argument *2*:

*2 + 2*

Rozumiesz już, że możemy w ten sposób definiować funkcje, które zachowują się jak funkcje
dwuargumentowe, posługując się tylko funkcjami jednoargumentowymi? Ten sposób to tak zwany
*Currying*, od nazwiska wybitnego matematyka [Haskella
Curry'ego](https://en.wikipedia.org/wiki/Haskell_Curry), który go wymyślił, którego imię lub
nazwisko jest - na jego cześć - nazwą aż trzech różnych języków programowania i którego jeszcze
niebawem spotkamy.

Pozostaje mi objaśnić *zapis typu* tej funkcji. Funkcja `plus` dobrze udaje zwyklą funkcję
dwuargumentową dzięki temu, że ciało funkcji "wewnętrznej" jest przez "zewnętrzną" funkcję `plus`
konstruowane z tego, co ta dostaje jako argument. To znowu tylko ilustracja:

```lean
def plus : Nat → (Nat → Nat) := 
    -- Funkcja "zewnętrzna"
    fun (pierwsza : Nat) =>
        -- Funkcja "wewnętrzna", której ciało zmienia się na skutek podstawiania pod zmienną pierwsza, gdy 
        -- ewaluujemy aplikację funkcji plus do pierwszego argumentu
        fun (druga : Nat) => pierwsza + druga
```

Mam nadzieję, że jest dla Ciebie jasne, że *wewnętrzna* funkcja ma typ `Nat → Nat`, pobiera przecież
jeden term typu `Nat` i zwraca term typu `Nat` (będący rezultatem dodawania). *Zewnętrzna* funkcja
pobiera jeden term typu `Nat`, ale zwraca tamtą *funkcję*, a dokładniej jej odpowiednią wersję,
dlatego właśnie typ stałej `plus` to `Nat → (Nat → Nat)`.

Nawiasy w `Nat → (Nat → Nat)` nie są konieczne, bo w Leanie *strzałka wiąże z prawej*: Gdyby nie
konwencja, którą stosuje Lean, zapis `Nat → Nat → Nat` byłby problematycznie wieloznaczny, ponieważ
nie byłoby wiadomo, czy chodzi o `(Nat → Nat) → Nat` czy o `Nat → (Nat → Nat)`, a to *nie jest to
samo*: `(Nat → Nat) → Nat` to typ (jakichkolwiek) funkcji, które przekształcają *funkcje* typu `Nat
→ Nat` w liczby naturalne, a `Nat → (Nat → Nat)` to typ (jakichkolwiek) funkcji, które
przekształcają *liczby naturalne* w funkcje typu `(Nat → Nat)`.

Mówiąc ogólnie, to, że w Leanie strzałka wiąże z prawej oznacza, że dla dowolnych typów `A`, `B` i
`C`, `A → B → C` Lean interpretuje jako `A → (B → C)`, a więc `Nat → Nat → Nat` interpretuje jako
`Nat → (Nat → Nat)`. Zapisałem to wprost, nie polegając na tej konwencji i zamiast tego używając
nawiasów, żebyś nie musiała się tego od razu domyślać.

Lean pozwala na zapis skrótowy między innymi w takim oto stylu:

```lean
-- Nie kopiuj tego kodu do Leana, jeżeli nie usunęłaś wcześniej definicji funkcji plus. Lean nie pozwala 
-- definiować dwa razy tej samej stałej w tym samym kontekście, dlatego właśnie stałe nazywamy stałymi.
def plus (pierwsza : Nat) (druga : Nat) : Nat := pierwsza + druga
```

albo w takim:

```lean
-- Tego też nie kopiuj, jeżeli nie usunęłąś wcześniej definicji stałej plus. Tutaj nie podajemy jawnie typu
-- rezultatu (nie ma fragmentu : Nat przed symbolem :=), co nie jest błędem, bo Lean może sam wywnioskować, 
-- że rezultat musi mieć typ Nat, skoro jest sumą dwóch liczb naturalnych.
def plus (pierwsza : Nat) (druga : Nat) := pierwsza + druga
```

a nawet w takim:

```lean
-- Skoro parametr druga ma typ Nat i jest dodawany do parametru pierwsza, to parametr pierwsza musi mieć typ Nat,
-- a skoro musi, to Lean się tego sam domyśla
def plus (pierwsza) (druga : Nat) := pierwsza + druga
```

albo w takim:

```lean
def plus (pierwsza : Nat) (druga) := pierwsza + druga
```

ale w takim już *nie*, bo symbol `+` ma w pewnym sensie wiele definicji (dla różnych typów
liczbowych, takich jak liczby naturalne, całkowite, wymierne i rzeczywiste) i widoczna poniżej, zbyt
skrótowa wersja nie pozwala Leanowi wywnioskować, którą definicję wybrać:

```lean
-- Ta definicja jest zapisana zbyt skrótowo i błędna, bo nie pozwala Leanowi automatycznie wywnioskować typu
-- parametrów jak i rezultatu, a przez to nie pozwala wywnioskować, jakiej wersji dodawania (na przykład, dla 
-- liczb naturalnych czy może wymiernych) ma tu użyć:
def plus (pierwsza) (druga) := pierwsza + druga
```

Skrótowy zapis jest bardzo wygodny i często właśnie takiego zapisu będziemy używać, ale na tym
etapie jest ważne, żebyś wiedziała, co takie skróty oznaczają. Nie musisz sobie o tym przypominać za
każdym razem, gdy definiujesz stałe albo ich używasz, ale w pewnych sytuacjach ta wiedza będzie Ci
potrzebna.

Pokażę Ci jeszcze w jaki sposób Lean interpretuje podawanie parametrów funkcji przed typem jej
rezultatu, czyli przed "głównym" drukropkiem. Na prywatny użytek nazywam to "przestawialnością
dwukropka" w definicjach funkcji (ilustracja):

```lean
-- Ta definicja:
def plus (pierwsza : Nat) (druga : Nat) : Nat := pierwsza + druga
-- znaczy to samo, co ta:
def plus (pierwsza : Nat) : Nat → Nat := fun (druga : Nat) => pierwsza + druga
-- i to samo, co ta:
def plus : Nat → (Nat → Nat) := fun (pierwsza : Nat) => (fun (druga : Nat) => pierwsza + druga)
-- To tylko trzy różne sposoby zapisania tej samej definicji.
```

**Polecenie**: Stosując wygodny *skrótowy* zapis definicji funkcji, zdefiniuj funkcję `plusplus`,
pobierającą *trzy* argumenty typu `Nat` - każdy o innej nazwie (muszą mieć inne nazwy) - i dodającą
je do siebie. Sprawdź typ zdefiniowanej w ten sposób stałej `plusplus` za pomocą komendy
`#check`. Zobaczysz wtedy po prawej jeszcze bardziej skrótowy sposób zapisu parametrów. Można tu
użyć tego jeszcze bardziej skrótowego zapisu, bo sąsiadujące parametry funkcji `plusplus` mają ten
sam typ i Lean może wywnioskować, o co chodzi, gdy tak to zapiszemy. Usuń więc definicję, którą
właśnie napisałaś i napisz ją jeszcze raz, ale tym razem stosując ten nowy, jeszcze bardziej
skrótowy zapis parametrów. Na koniec ewaluuj aplikację funkcji `plusplus` do dowolnych trzech liczb
naturalnych.

## Częściowe aplikacje

Ponieważ funkcja `plus` to tak naprawdę funkcja, która zwraca (tworzoną przez siebie) funkcję,
możemy ją aplikować do *jednego* argumentu, na przykład do termu `3`. Uzyskamy w ten sposób nie
liczbę naturalną, tylko funkcję jednoargumentową, która do dowolnej liczby naturalnej dodaje `3`
(ilustracja):

```lean
-- To:
plus 3
-- zgodnie z definicją stałej plus jest tym samym co:
(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 3
-- a plus 3 redukuje się (a więc też dla Leana *tym jest*) do:
(fun (druga : Nat) => 3 + druga)
-- a więc do pewnej (anonimowej) funkcji.
```

Nie możemy *ewaluować* takiej częściowej aplikacji, bo Lean nie potrafi bez naszej pomocy
*wyświetlić* funkcji, która w ten sposób powstaje. Możemy jednak *zapisać* tą funkcję / rezultat
częściowej aplikacji jako ciało definicji stałej, na przykład o nazwie `dodaj3`. Ta stała będzie
miała typ `Nat → Nat` (już wiesz, dlaczego ta stała musi mieć ten typ, prawda?):

```lean
-- Ten kod możesz skopiować, bo jest poprawny, zakładając, że stała plus jest zdefiniowana zgodnie z wcześniejszym 
-- poleceniem. W ten sposób dodaj3 staje się funkcją, która powstaje z aplikacji funkcji plus do liczby 3.
-- Ponieważ funkcja plus jest dwuargumentowa, aplikacja plus 3 "czeka" na drugi argument. Mówiąc ściślej,
-- ta aplikacja jest funkcją powstającą przez podstawienie liczby 3 pod zmienną pierwsza w "wewnętrznej" funkcji:
-- fun (druga : Nat) => pierwsza + druga
-- czyli jest funkcją:
-- fun (druga : Nat) => 3 + druga
def dodaj3 : Nat → Nat := plus 3

-- Funkcję dodaj3 możemy zastosować tak, jak każdą inną:
#eval dodaj3 3 -- 6
#check dodaj3 -- dodaj3 : Nat → Nat
```

**Polecenie dla ambitnych**: Jeżeli już na typ etapie czujesz, że możesz sobie z tym poradzić,
spróbuj zrobić coś podobnego jak to, co zrobiłem z częściową aplikacja funkcji `plus`, ale użyj do
tego zdefiniowanej wcześniej przez siebie funkcji `plusplus`. Można to zrobić na wiele różnych
sposobów, więc nie szukaj jakiegoś *jedynego* dobrego rozwiązania, bo takiego nie ma. Gdyby pojawił
się błąd, przeczytaj komunikat i sprawdź, czy nie dostarcza Ci wskazówki, dzięki której mogłabyś ten
błąd usunąć. Jeżeli to polecenie okażę się za trudne, nie przejmuj się, po pewnym czasie stanie się
dziecinnie łatwe.

**Polecenie dla nadmiernie ambitnych**: Zdefiniuj i zastosuj funkcję, która pobiera dwa argumenty:

1. *Funkcję* typu `Nat → Nat`, na przykład dodającą `2` do swojego parametru, albo jakąkolwiek inną
tego typu

2. Term typu `Nat`

Definiowana przez Ciebie funkcja ma w swoim ciele stosować swój pierwszy parametr, to jest dowolną
funkcję odpowiedniego typu, do drugiego parametru, to jest do dowolnego termu typu `Nat`. Sprawdź
typ zdefiniowanej w ten sposób funkcji i oblicz rezultat zastosowania jej do jakiejś zapisanej przez
siebie (w nawiasach) funkcji anonimowej lub jakiejś wcześniej już zdefiniowanej (na przykład
`dodaj2`) funkcji typu `Nat → Nat` jako pierwszego argumentu i jakiejś liczby naturalnej jako
drugiego. W ten sposób skorzystasz z faktu, że Lean pozwala nie tylko na definiowanie funkcji, które
tworzą funkcje, czyli *programów, które tworzą programy*, ale również na definiowanie funkcji, które
stosują do czegoś funkcje podane jako argumenty aplikacji, czyli *programów, które przetwarzają inne
programy*.
