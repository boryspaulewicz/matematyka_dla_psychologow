<br/>

<div align="right"><em>Jeżeli drzewo marnieje choćby w najgorszej glebie, to tylko dlatego, że nie
dość głęboko zapuszcza korzenie. Cała ziemia jest jego</em>.<br/>Fryderyk Hebbel</div>

<br/> 
<br/> 
<br/>

## O czym teraz będzie

W tym i następnym rozdziale pokażę Ci - w nieco innej kolejności, akcentując trochę inne rzeczy i
wprowadzając czasami inne tematy - w jaki sposób w Leanie *definiujemy stałe* i zapisujemy *funkcje
anonimowe*. Zwrócę Twoją uwagę na *naturalność i prostotę składni* tego języka, a także powiem
trochę o roli, jaką w w Leanie odgrywają *typy*. Wreszcie omówię krok po kroku proces *ewaluacji*, a
dokładnie *ewaluacji aplikacji*. Mam nadzieję, że kilkukrotne i szczegółowe omówienie tego, jak ten
proces przebiega, pozwoli Ci lepiej zrozumieć *mechanikę* działania teorii typów, a dzięki temu czuć
się bardziej pewnie, gdy będziemy później na niej polegać udowadniając twierdzenia i definiując nowe
rodzaje struktur. To wszystko będziesz mogła zrozumieć jak sądzę bez większych trudności między
innymi dzięki temu, że będę się *do znudzenia* powtarzał.

Ponieważ najtrudniejszymi częściami obydwu rozdziałów są fragmenty dotyczące *curryingu*, to jest
sposobu, w jaki funkcje *jednoargumentowe* mogą udawać funkcje *wieloargumentowe*, to żeby
wprowadzić ten temat w możliwie bezbolesny sposób szczegółowo omówię kilka relatywnie prostych
przykładów funkcji i zaproponuję Ci wykonanie niezbyt skomplikowanych i moim zdaniem wskazanych na
tym etapie zadań.

Jedną z ważniejszych rzeczy, kiedy uczymy się czegoś nowego, jest moim zdaniem przyzwyczajenie się
do znaczeń terminów technicznych. Dzięki temu będzie Ci łatwiej zrozumieć, o czym mówię. Z
niektórymi z tych terminów zapoznasz się tak zwaną (przeze mnie od dzisiaj) metodą mimowolnego
oswojenia, bo nie będę ich od razu objaśniał, tylko pokażę Ci, jak się ich używa.

<hr>

# Pierwszy spacer po Leanie, wersja pierwsza

Ponieważ są tak ważne, treści, o których będziesz się uczyła w tym rozdziale, omówię jeszcze raz,
tylko inaczej, w rozdziale następnym. Dzięki temu mam nadzieję ułatwić Ci aktywne powtarzanie
materiału. Gdy więc czytając ten rozdział i wykonując polecenia poczujesz, że utknęłaś, być może
znajdziesz poprawne rozwiązanie, albo zaczniesz lepiej rozumieć, jak je znaleźć, w trakcie czytania
tej następnej części.

Mówiąc ogólnie, w przypadku utknięcia sugeruję chwilowo *pozbyć się ambicji i czytać bez wstydu*,
albo zrobić sobie *przerwę* i spróbować później, albo *wrócić* do wcześniejszych wyjaśnień. A gdyby
i to zawiodło, zawsze możesz zadać mi pytanie mailem (boryslaw.paulewicz@uj.edu.pl). Na pewno się
ucieszę i jeśli tylko nie odłożę odpowiedzi z powodu braku czasu, przez co później o niej zapomnę
(co mi się niestety zdaża), to spróbuję pomóc. Gdybym nie odpowiedział w ciągu kilku dni, to się nie
obrażę, gdy napiszesz znowu.

Zależy mi na tym, żeby zwłaszcza te pierwsze rozdziały były dopasowane do możliwości większości
studentów a nawet uczniów liceum, dlatego będę bardzo wdzięczny za informacje o pojawiających się
trudnościach. Tylko proszę nie zwracaj się wtedy do mnie per Panie Doktorze. Wiem, że studenci tak
robią z dobrej woli i że pracownicy uczelni czasem tego oczekują, ale moim zdaniem, zwłaszcza w
dyscyplinach takich jak psychologia, takie tytuły są nie tylko dosyć śmieszne, ale w dodatku mogą
utrudniać przyjęcie krytycznej postawy przez rozmówcę albo czytelnika. Dlatego między innymi piszę
tą książkę niemal "na żywo". Dzięki temu możesz się sama przekonać, jak pisząc ją sam się pewnych
rzeczy uczę i jak całość wyłania się stopniowo właściwie niemal z niczego. Z tego samego powodu
próbuję też tą książkę pisać tak, jakbym z Tobą *rozmawiał*, bo to przecież *powinna* być rozmowa.

**Polecenie**: Korzystając z dowolnej przeglądarki wejdź na stronę:

https://live.lean-lang.org

Rozpoczniesz w ten sposób interaktywną sesję z *asystentem dowodzenia* Lean. Nie przejmuj się,
jeżeli widzisz to okno po raz pierwszy i wydaje Ci się obce, bo to minie. Będziesz pisać w panelu po
lewej i czasami zaglądać do panelu po prawej.

Błędy będą się pojawiać, ponieważ jesteś (zgaduję)
[człowiekiem](https://www.youtube.com/watch?v=UVL186zzOXo). Gdy pojawi się błąd, Lean Cię o tym
powiadomi podkreślając go czerwoną falką. Przypuszczam, że najczęściej to będzie jakaś
literówka. Czasami samo miejsce, w którym pojawi się czerwona falka, powie Ci, co należy zmienić,
ale nie zawsze. W razie wątpliwości przeczytaj komunikat o błędzie, który pojawi się w panelu po
prawej i spróbuj ustalić w czym problem.

Zgodnie z tym, co wcześniej napisałem o potrzebie sensu, uważam, że warto, żebyś przed czytaniem
szczegółowych wyjaśnień spróbowała wykonać od razu kilka zadań. Tym razem jednak spróbuję najpierw
czegoś innego (ale w pewnym sensie bardzo zbliżonego).

**Uczenie się poprzez wcielenie się w rolę**: Wyobraź sobie, że Twoim zadaniem jest zaprojektowanie
nowego języka, który pozwalałby w jednoznaczny, zwięzły i zarazem możliwie czytelny sposób zapisywać
różne definicje. Wydaje się, że zależałoby Ci wtedy na zapisaniu informacji, która pozwalałaby
określić, jakie operacje z użyciem definiowanych stałych mają sens, a jakie go nie mają. Byłoby też
wskazane, żeby nie używać do tego symbolu równości (*=*), bo ten odgrywa a matematyce bardzo ważną
rolę i mógłby się jeszcze później przydać do całkiem innych celów (to jest do oznaczania relacji
równości, a nie relacji bycia wartością jakiejś stałej z definicji).

Przydałoby się zatem jakieś krótkie i łatwe do zapamiętania *słowo kluczowe*, na przykład `def`, bo
takie kojarzy się ze słowem *definicja*. Nie byłoby też wcale źle, gdyby zapis informujący o
operacjach, które można wykonywać z użyciem danej stałej, kojarzył się na przykład z naklejeniem na
coś etykiety. A najlepiej, żeby symbol oznaczający bycie treścią albo ciałem definicji przypominał
ten, którego używa się często w tym celu w informatyce. Co byś wtedy powiedziała na takie oto
rozwiązanie?

**Polecenie**: Skopiuj do Leana poniższy fragment kodu. Możesz wkleić go do schowka klikając na dwa
małe kwadraty widoczne po prawej.

```lean
def dziesiec : Nat := 10
```

To jest *definicja*, co poznajemy po słowie `def` i po symbolu `:=`. Symbol `:=` możemy czytać jako
*niech będzie* (*już na zawsze*). Każda definicja jest definicją jakiejś *stałej*, w tym wypadku
stałej o *nazwie* `dziesiec`. Każda stała ma jakiś *typ*. Na przykład, stała `dziesięć` ma typ `Nat`
(`: Nat`), to jest ma typ *liczba naturalna*. *Ciało* tej definicji, czyli jej wartość albo treść,
to liczba (a właściwie *term*) `10`.

Będę czasem pisał tak, jakby fragment kodu taki jak `dziesiec : Nat` pełnił rolę *rzeczownika* - na
przykład "stała `dziesiec : Nat` jest ..." to będzie inny sposób, żeby powiedzieć "stała `dziesiec`
o typie `Nat` jest ..." - albo *zdania*, na przykład "Jeżeli `dziesiec : Nat` ..."  to będzie inny
sposób, żeby powiedzieć "Jeżeli stała `dziesiec` ma typ `Nat`...". W obydwu przypadkach właściwa
interpretacja będzie wynikała z kontekstu.

**Polecenie**: Napisz w Leanie analogiczną definicję stałej o nazwie `trzy` tak, żeby oznaczała
liczbę `3`. Musisz tylko skorzystać z `dziesiec` jako przykładu, zamieniając dwa elementy
definicji - nazwę stałej i jej wartość. Jeżeli zobaczysz fragment podkreślony czerwoną falką,
spróbuj wywnioskować na czym polega problem z komunikatu o błędzie.

**Polecenie**: Zmień swoją poprawną definicję stałej `trzy` na *błędną* zastępując `3` przez słowo
`tszy` (bez cudzysłowów). Ta definicja będzie błędna nie dlatego, że to słowo zawiera błąd
ortograficzny. Umieść kursor na słowie `tszy` i odczytaj komunikat o błędzie widoczny po
prawej. Powinnaś wtedy zobaczyć komunikat *unknown identifier 'tszy'*, co oznacza, że Lean nie wie,
czym jest `tszy`. Przekonasz się w ten sposób, że błędy to tylko okazja, żeby Lean mógł się wykazać.

W Leanie można definiować stałe wielu różnych typów, nie tylko liczbowych. Poniższy kod definiuje
stałą o typie *tekstowym* (`String`), nazywanym przez informatyków typem *napisów*, *stałych
łańcuchowych* lub [*literałów
łańcuchowych*](https://pl.wikipedia.org/wiki/Litera%C5%82_%C5%82a%C5%84cuchowy) (to tylko różne
nazwy na to samo). Zwróć uwagę, że wartości zmiennych tekstowych muszą być otoczone cudzysłowami.

**Polecenie**: Skopiuj do Leana lub przepisz z pamięci:

```lean
def gwiazda_wieczorna : String := "Rihanna"
```

Żeby zobaczyć wartość stałej trzeba użyć komendy `#eval` (to skrót od agielskiego słowa
*evaluation*):

```lean
#eval dziesiec
```

**Polecenie**: Napisz teraz w nowej linii `#eval gwia`, tylko tyle. Zobaczysz, że Lean zaoferuje Ci
możliwość szybkiego wpisania pełnej nazwy. Żeby z tego skorzystać, naciśnij klawisz Tab, kiedy Lean
podświetli właściwą kontynuację, lub wskaż ją za pomocą myszki lub klawiszy strzałek. Ponieważ
kursor będzie się wtedy znajdował w linii, która zaczyna się od komendy `#eval`, po prawej zobaczysz
wartość wpisywanej stałej.

Typ każdego poprawnego wyrażenia, w tym każdej zdefiniowanej wcześniej stałej, możemy sprawdzić za
pomocą komendy `#check`:

```lean
#check dziesiec
```

Po wpisaniu powyższego kodu zobaczysz po prawej, że stała `dziesiec` ma typ `Nat` (jest liczbą
naturalną).

**Polecenie**: Za pomocą komendy `#check` sprawdź typ którejś ze zdefiniowanych dotąd stałych.

**Wbrew pozorom przydatne ćwiczenie**: Jeśli masz ochotę, stwórz własną zmienną tekstową, o jakiej
chcesz wartości. Nawet, jeżeli wydaje Ci się to zbyt proste, może warto to na tym etapie jednak
zrobić, bo dzięki temu Lean zadomowi się bardziej "w Twoich palcach" i następne fragmenty kodu
będziesz lepiej "czuć". To jest trochę tak, jak z robieniem notatek. Sama czynność notowania mniej
więcej na temat, nawet gdy wydaje się, że nic nie wnosi, zmienia sposób, w jaki przetwarzamy
informacje, wpływa na to, co później pamiętamy, a przez to wpływa na to, jak postrzegamy podobne
treści i jak na nie reagujemy. A jeżeli ta czynność wydaje się tak łatwa, że aż zbędna, to być może
nawet lepiej.

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

A "funkcje matematyczne" są często rozumiane jako "obiekty", które każdemu elementowi pewnego
*zbioru*, nazywanego *dziedziną funkcji*, przyporządkowują dokładnie jeden element pewnego
*niekoniecznie innego* zbioru, nazywanego jej *przeciwdziedziną*. Na przykład, ("matematyczna")
funkcja kwadratowa ze zbioru liczb rzeczywistych (będącego jej dziedziną ...) do zbioru liczb
rzeczywistych (... jak również jej przeciwdziedziną) *każdej* liczbie *x* należącej do tego zbioru
przyporządkowuje (dokładnie jedną) wartość daną przez wyrażenie *x \* x*.

Ponieważ to mają być jednak funkcje rozumiane jako *programy* (albo
[algorytmy](https://pl.wikipedia.org/wiki/Algorytm)), chciałabyś też pewnie, żeby sposób ich
zapisywania kojarzył się łatwo z *procesem przekształcania* i chciałabyś też może, żeby dało się w
tym zapisie wyrazić (odpowiadający pojęciu dziedziny) wymagany *typ argumentu*. No to co byś wtedy
spowiedziała na to? (bo mi się wydaje, że trudno to zrobić lepiej):

```lean
-- (anonimowa) Funkcja kwadratowa ograniczona do liczb naturalnych jako program komputerowy:
fun (n : Nat) => n * n
```

Pozostaje jeszcze kwestia sposobu zapisywania typów tego rodzaju wyrażeń (a dokładnie *termów
złożonych*). Zgodzisz się chyba, że naturalnie byłoby oznaczać je w sposób, który mówi jaki jest typ
argumentu (odpowiadający dziedzinie), jak i jaki jest typ rezultatu (odpowiadający
przeciwdziedzinie), a przy tym kojarzy się łatwo z pojęciami przekształcania i
przyporządkowywania. To może tak? (nie wklejaj tego do Leana, to tylko ilustracja)

```lean
-- Typ funkcji, które w jakiś sposób przekształcają liczby naturalne w liczby naturalne
Nat → Nat
```

**Polecenie**: Żeby wpisać w Leanie strzałkę napisz `\to` i ulegnij olśnieniu. Gdy już ochłoniesz,
usuń tą strzałkę, bo sama strzałka nie jest jeszcze poprawnym fragmentem kodu.

Nawet najprostsze fragmenty kodu możemy zapisać w Leanie na wiele sposobów, w tym również skrótowo,
to jest pomijając informacje, które da się wywnioskować z informacji podanych jawnie. Ta
elastyczność ma służyć użytkownikowi, ale na razie nie będziemy z niej korzystać, bo naszym celem
jest na razie opanowanie podstaw, a nie korzystanie z udogodnień.

Będę odtąd częściej używał *komentarzy*. Komentarzem jest tekst zaczynający się od znaków `--`. Lean
ignoruje wszystko, co jest napisane po tych znakach, taki tekst ma zatem służyć tylko Tobie.

W ten sposób możemy zdefiniować funkcję, która przyjmuje argument typu `Nat` i zwraca jego wartość
zwiększoną o *2*:

```lean
-- Nat → Nat oznacza typ funkcji, które pobierają argumenty typu Nat i zwracają rezultat typu Nat
def dodaj2 : Nat → Nat := 
    -- fun to słowo kluczowe i jednocześnie skrót od *function*. W Leanie oznacza *funkcję anonimową*,
    -- inaczej *λ-abstrakcję* (to tylko inna nazwa na to samo).
    fun (moj_parametr : Nat) => moj_parametr + 2
```


**Polecenie**: Funkcję `dodaj2` można zastosować do dowolnej liczby naturalnej, w tym również do
stałej `dziesiec`, bo ta stała ma taki sam typ, jak parametr funkcji `dodaj2`. Żeby to zrobić i
jednocześnie obliczyć wynik, być może przyspieszając pisanie i jednocześnie zmniejszając ryzyko
literówki za pomocą Taba, napisz Leanowi *z pamięci*:

```lean
#eval dodaj2 dziesiec
```

**Definicja aplikacji**: Samo *zestawienie* obok siebie funkcji i jakiegokolwiek wyrażenia, bez
obliczania wyniku, również takie *błędne* zestawienie, nazywamy *aplikacją*. Oddzielanie aplikacji
od ewaluacji może się wydawać zbędne, ale okaże się potrzebne między innymi podczas dowodzenia
twierdzeń. Na przykład, `dodaj2 dziesiec` jest aplikacją, w dodatku poprawną, bo `dodaj2` wymaga
jako argumentu dowolnego termu typu `Nat`, a stała `dziesiec` jest właśnie takim termem.

Zdefiniujemy teraz funkcję, która będzie dodawała *dwie* dowolne liczby naturalne. Zrobimy to w
sposób, który pozwoli Ci zobaczyć, że takie funkcje w Leanie są tak naprawdę
*jedno*argumentowe. Ponieważ to będzie **najtrudniejsza** część tego rozdziału, wyjaśnię jak to
działa na kilka sposobów. 

*Zalecam teraz uzbroić się w cierpliwość i czytać dalej, nawet jeżeli będziesz miała poczucie, że
"tego wszystkiego" jest na raz za dużo. "To wszystko" stanie się w miarę zrozumiałe dopiero wtedy,
gdy będziesz mogła w miarę łatwo wydobyć kluczowe "puzzle" z pamięci i dzięki temu łatwiej Ci będzie
układać je "w głowie". Dlatego trzeba się liczyć z koniecznością czytania tych samych fragmentów
więcej niż raz, być może po pewnej przerwie. Procesu poprawiania się dostępności pamięciowej nie da
się chyba za bardzo przyspieszyć, ale to tylko kwestia* **czasu**[^1].

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
-- Cyfra 2 może być zredukowana do czegoś bardziej podstawowego, ale o tym powiem innym razem. Na razie 
-- będziemy udawać, że pod cyfrą 2 nie kryje się nic więcej.
#eval dodaj2 2

-- Lean rozpakowuje również definicję stałej funkcyjnej, czyli tutaj stałej dodaj2. W rezultacie w miejscu
-- dodaj2 pojawia się *funkcja anonimowa*, bo już bez nazwy "dodaj2", to jest:
-- fun (moj_parametr : Nat) => moj_parametr + 2
-- Żeby zapis był jednoznaczny, poniżej otoczyłem tą funkcję nawiasami.
(fun (moj_parametr : Nat) => moj_parametr + 2) 2

-- Lean odczepia część przed symbolem =>, zostawiając tylko *ciało* funkcji:
moj_parametr + 2
-- i *jednocześnie podstawia* zredukowaną wersję argumentu pod parametr funkcji w ciele funkcji, czyli w tym 
-- wypadku podstawia 2 pod zmienną moj_parametr:
2 + 2
```

Czy widzisz, że warto tutaj użyć innej nazwy - *parametr* - na to, co pojawia się po słowie fun
(czyli na moj_parametr) i innej - *argument* - na to, co pojawia się jako drugi term w tej aplikacji
(czyli na 2)? Bez nazywania tych dwóch rzeczy za pomocą innych słów byłoby trudno o tym mówić w
sposób zrozumiały.

```lean
-- + to także funkcja, tylko taka, której apliację możemy zapisać w *notacji infiksowej*, czyli w stylu:
-- argument1 funkcja argument2, na przykład pisząc 2 + 3.
-- Lean na to pozwala, jeśli mu wytłumaczymy, co to znaczy. Akurat w przypadku funkcji + wie to z góry.

-- W końcu Lean rozpakowuje definicję funkcji + i stosuje ją do obydwu argumentów. Ten proces trwa aż do momentu,
-- gdy nie da się nic więcej zredukować. W ten sposób powstaje wynik dodawania i właśnie ten wynik pojawia się
-- jako rezultat, gdy wymuszamy ewaluację aplikacji dodaj2 2:
#eval dodaj2 2 -- Kiedy kursor znajduje się w tej linijce, po prawej widać liczbę 4
```

Przypuszczam, że tego właśnie się mniej więcej spodziewałaś, tylko może sens tej operacji nie jest
dla Ciebie jeszcze całkiem oczywisty, bo częściowo przysłaniają go moje (celowo!) rozwlekłe
objaśnienia. Teraz pokażę Ci, w jaki sposób przebiega ewaluacja bardziej skomplikowanej funkcji
`plus` do argumentów `1` i `2`. Ten kod to również tylko ilustracja:

```lean
#eval plus 1 2

-- Ponieważ udajemy tutaj, że w przypadku 1 i 2 nie ma nic do rozpakowania, pierwszy krok ewaluacji 
-- to rozpakowanie definicji stałej plus:
(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 1 2

-- Drugi krok ewaluacji to odczepienie ciała:
(fun (druga : Nat) => pierwsza + druga) 
-- i jednocześnie podstawianie argumentu 1 pod zmienną pierwsza, będącą parametrem ewaluowanej w tym kroku 
-- aplikacji. W ten sposób za każdym razem, gdy funkcja plus dostaje pierwszy argument (typu Nat), ta funkcja
-- tworzy nową funkcję albo nową wersję funkcji, którą można by tu nazwać wewnątrzną:
(fun (druga : Nat) => 1 + druga) 2

-- Ponieważ uzyskujemy w ten sposób pewną aplikację, trzeci krok to też ewaluacja aplikacji, a więc kolejne
-- odczepienie ciała:
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
tylko inny sposób zapisania dostępnej w Leanie funkcji `Nat.add`, która obsługuje dodawanie liczb
naturalnych.

Pokażę Ci jeszcze raz to samo, ale używając notacji, którą chętnie stosują matematycy. Dla
uproszczenia pominę jednak typy parametrów.

Anonimowe funkcje, takie jak `fun (moj_parametr : Nat) => moj_parametr + 2`, nazywamy również
*λ-abstrakcjami*. Lean wie o tej konwencji i pozwala zamiast `fun` napisać `λ`. Jeżeli chcesz używać
tej konwencji, możesz uzyskać tą grecką literę pisząc `\la`.

Jeżeli zastosujemy uproszczoną (bo bez typów) notację matematyczną, gdzie zamiast `fun` będziemy
pisać *λ*, a zamiast `=>` będziemy pisać *kropkę*, to zobaczymy, że ewaluacja aplikacji anonimowej
(bo bez nazwy "dodaj2") wersji funkcji `dodaj2`:

*(λ x . x + 2) 2*

polega w pierwszym kroku na odczepeniu ciała, czyli części po kropce:

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
sytuacji (po angielsku), że jest tu jeszcze jakiś *redex* (to skrót od *reducible expression*). A
więc znowu odczepiamy ciało:

*1 + y* 

i jednocześnie podstawiamy za zmienną *y* argument *2*:

*2 + 2*

Rozumiesz już, że możemy w ten sposób definiować funkcje, które zachowują się jak funkcje
dwuargumentowe, posługując się tylko funkcjami jednoargumentowymi? Ten sposób to tak zwany
*currying*, od nazwiska wybitnego matematyka [Haskella
Curry'ego](https://en.wikipedia.org/wiki/Haskell_Curry), który go wymyślił, którego imię lub
nazwisko jest - na jego cześć - nazwą aż trzech różnych języków programowania i którego jeszcze
niebawem spotkamy.

Pozostaje mi objaśnić *zapis typu* tej funkcji. Funkcja `plus` dobrze udaje zwykłą funkcję
dwuargumentową dzięki temu, że ciało funkcji wewnętrznej jest przez zewnętrzną funkcję `plus`
konstruowane z tego, co ta ostatnia dostaje jako argument. To znowu tylko ilustracja:

```lean
def plus : Nat → (Nat → Nat) := 
    -- Funkcja "zewnętrzna":
    fun (pierwsza : Nat) =>
        -- Funkcja "wewnętrzna", której ciało zmienia się na skutek podstawiania pod zmienną pierwsza, gdy 
        -- ewaluujemy aplikację funkcji plus do pierwszego argumentu:
        fun (druga : Nat) => pierwsza + druga
```

Mam nadzieję, że jest dla Ciebie jasne, że *wewnętrzna* funkcja ma typ `Nat → Nat`, pobiera przecież
jeden term typu `Nat` i zwraca term typu `Nat` (będący rezultatem dodawania). *Zewnętrzna* funkcja
pobiera jeden term typu `Nat`, ale zwraca tamtą *funkcję*, a dokładniej jej odpowiednią wersję,
dlatego właśnie typ stałej `plus` to `Nat → (Nat → Nat)`.

Nawiasy w `Nat → (Nat → Nat)` nie są konieczne, bo w Leanie *strzałka wiąże z prawej*: Gdyby nie
konwencja, którą stosuje Lean, zapis `Nat → Nat → Nat` byłby problematycznie wieloznaczny, ponieważ
nie byłoby wiadomo, czy chodzi o `(Nat → Nat) → Nat` czy o `Nat → (Nat → Nat)`, a to *nie jest to
samo*; `(Nat → Nat) → Nat` to typ (jakichkolwiek) funkcji, które przekształcają *funkcje* typu `Nat
→ Nat` w liczby naturalne, a `Nat → (Nat → Nat)` to typ (jakichkolwiek) funkcji, które
przekształcają *liczby naturalne* w funkcje typu `(Nat → Nat)`.

Mówiąc ogólnie, to, że w Leanie strzałka wiąże z prawej oznacza, że dla dowolnych typów `A`, `B` i
`C`, `A → B → C` Lean interpretuje jako `A → (B → C)`, a więc `Nat → Nat → Nat` interpretuje jako
`Nat → (Nat → Nat)`. Zapisałem to wprost, nie polegając na tej konwencji i zamiast tego używając
nawiasów, żebyś nie musiała się tego od razu domyślać.

Lean pozwala na zapis skrótowy między innymi w takim oto stylu (to tylko alternatywne sposoby
zapisania tej samej definicji):

```lean
-- Nie kopiuj tego kodu do Leana, jeżeli nie usunęłaś wcześniej definicji funkcji plus. Lean nie pozwala 
-- definiować dwa razy tej samej stałej w tym samym kontekście, dlatego właśnie stałe nazywamy stałymi.
def plus (pierwsza : Nat) (druga : Nat) : Nat := pierwsza + druga
```

albo w takim:

```lean
-- Tego też nie kopiuj, jeżeli nie usunęłąś wcześniej definicji stałej plus. Tutaj nie podajemy jawnie typu
-- rezultatu (nie ma fragmentu : Nat przed symbolem :=), co nie jest błędem, bo da się wywnioskować, 
-- że rezultat musi mieć typ Nat, skoro jest sumą dwóch liczb naturalnych.
def plus (pierwsza : Nat) (druga : Nat) := pierwsza + druga
```

a nawet w takim:

```lean
-- Skoro parametr druga ma typ Nat i jest dodawany do parametru pierwsza, to parametr pierwsza musi mieć typ Nat.
wdef plus (pierwsza) (druga : Nat) := pierwsza + druga
```

albo w takim:

```lean
def plus (pierwsza : Nat) (druga) := pierwsza + druga
```

ale w takim już *nie*, bo symbol `+` ma *w pewnym sensie* wiele definicji (dla różnych typów
liczbowych, takich jak liczby naturalne, całkowite, wymierne i rzeczywiste) i widoczna poniżej, zbyt
skrótowa wersja nie pozwala Leanowi wywnioskować, którą definicję wybrać:

```lean
-- Ta definicja jest zapisana zbyt skrótowo i dlatego *błędna*, bo nie pozwala Leanowi automatycznie wywnioskować
-- typu parametrów jak i rezultatu, a przez to nie pozwala wywnioskować, jakiej wersji dodawania (na przykład, dla 
-- liczb naturalnych czy może wymiernych) należy tu użyć:
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
-- Ta definicja ...
def plus (pierwsza : Nat) (druga : Nat) : Nat := pierwsza + druga

-- ... znaczy to samo, co ta ...
def plus (pierwsza : Nat) : Nat → Nat := fun (druga : Nat) => pierwsza + druga

-- ... i to samo, co ta ...
def plus : Nat → (Nat → Nat) := fun (pierwsza : Nat) => (fun (druga : Nat) => pierwsza + druga)

-- To tylko trzy różne sposoby zapisania tej samej definicji.
```

Czy widzisz, jak zapisywanie parametrów w nawiasach zaraz po nazwie definiowanej funkcji to tylko
pewien wygodny, skrótowy sposób zapisania λ-abstrakcji?

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

Ponieważ funkcja `plus` to tak naprawdę funkcja, która zwraca (w tym wypadku tworzoną przez siebie)
funkcję, możemy ją aplikować do *jednego* argumentu, na przykład do termu `3`. Uzyskamy w ten sposób
nie liczbę naturalną, tylko funkcję jednoargumentową, która do dowolnej liczby naturalnej dodaje `3`
(ilustracja):

```lean
-- To ...
plus 3

-- ... zgodnie z definicją stałej plus jest tym samym, co to ...
(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 3

-- ... a to redukuje się (a więc też *tym jest*) do tego ...
(fun (druga : Nat) => 3 + druga)

-- ... a więc do (anonimowej) funkcji, która do dowolnej liczby naturalnej dodaje 3.
```

Nie możemy *ewaluować* takiej częściowej aplikacji, bo Lean nie potrafi bez naszej pomocy
*wyświetlić* funkcji, która w ten sposób powstaje. Możemy jednak *zapisać* tą funkcję / rezultat
częściowej aplikacji jako ciało definicji stałej, na przykład o nazwie `dodaj3`. Ta stała musi mieć
wobec tego typ `Nat → Nat` (już wiesz, dlaczego ta stała musi mieć ten typ, prawda?):

```lean
-- Ten kod możesz skopiować, bo jest poprawny, zakładając, że stała plus jest zdefiniowana zgodnie z wcześniejszym 
-- poleceniem. W ten sposób dodaj3 staje się *funkcją, która powstaje z aplikacji funkcji plus do liczby 3*.
-- Ponieważ funkcja plus jest dwuargumentowa, aplikacja plus 3 "czeka" na drugi argument. Mówiąc ściślej,
-- ta aplikacja jest funkcją powstającą przez podstawienie liczby 3 pod zmienną pierwsza w "wewnętrznej" funkcji
-- fun (druga : Nat) => pierwsza + druga
-- czyli jest po prostu funkcją
-- fun (druga : Nat) => 3 + druga
def dodaj3 : Nat → Nat := plus 3

-- Funkcję dodaj3 możemy stosować tak samo, jak każdą inną:
#eval dodaj3 3 -- 6
#check dodaj3 -- dodaj3 : Nat → Nat
```

**Polecenie dla ambitnych**: Jeżeli już na typ etapie czujesz, że możesz sobie z tym poradzić,
spróbuj zrobić coś podobnego jak to, co zrobiłem z częściową aplikacja funkcji `plus`, ale użyj do
tego zdefiniowanej wcześniej funkcji `plusplus`. Można to zrobić na wiele sposobów, nie szukaj więc
jakiegoś *jedynego* dobrego rozwiązania, bo takiego nie ma. Gdyby pojawił się błąd, przeczytaj
komunikat i sprawdź, czy nie dostarcza Ci wskazówki, dzięki której mogłabyś ten błąd usunąć. Jeżeli
to polecenie okażę się za trudne, to się nie przejmuj, po pewnym czasie stanie się dziecinnie łatwe.

**Polecenie dla nadmiernie ambitnych**: Zdefiniuj i zastosuj funkcję, która pobiera dwa argumenty:

1. *Funkcję* typu `Nat → Nat`, na przykład dodającą `2` do swojego parametru, albo jakąkolwiek inną
tego typu, anonimową lub będącą wartością jakiejś stałej.

2. Term typu `Nat`.

Definiowana przez Ciebie funkcja ma w swoim ciele stosować swój pierwszy parametr, to jest dowolną
funkcję odpowiedniego typu, do drugiego parametru, to jest do dowolnego termu typu `Nat`. Sprawdź
typ zdefiniowanej w ten sposób funkcji i oblicz rezultat zastosowania jej do jakiejś zapisanej przez
siebie (w nawiasach) funkcji anonimowej lub jakiejś wcześniej już zdefiniowanej (na przykład
`dodaj2`) funkcji typu `Nat → Nat` jako pierwszego argumentu, a także jakiejś liczby naturalnej jako
drugiego. 

W ten sposób skorzystasz z faktu, że Lean pozwala nie tylko na definiowanie funkcji, które tworzą
funkcje, czyli *programów, które tworzą programy*, ale również na definiowanie funkcji, które
stosują do czegoś funkcje podane jako ich argumenty, czyli *programów, które przetwarzają inne
programy*.

### Przypisy

[^1]: Pierwszym znanym mi tak młodym, bo czternastoletnim (sic!) czytelnikiem tej książki był Szymon
    Strypling, który przyswoił sobie treści zawarte w tym rozdziale w ciągu około 30 minut, a
    jedynym miejscem, w którym poczuł się przez chwilę nieco przytłoczony nadmiarem informacji, był
    właśnie ten fragment, dotyczący funkcji `plus`. Gdy jednak Szymon doczytał trochę dalej,
    wszystko się rozjaśniło i reszta poszła mu już, o ile mi wiadomo, jak z płatka. Na Jego cześć
    dodałem więc to ostrzeżenie (i słowa zachęty).
