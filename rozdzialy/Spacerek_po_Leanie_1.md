# Spacerek po Leanie, wersja pierwsza

**(De)Motywator**: Gdy w miarę dobrze zrozumiesz ogólną strukturę i sposób działania funkcji w Leanie,
pokażę Ci, że będziesz już właściwie wiedzieć, czym jest *duży kwantyfikator* (chodzi o spójnik
logiczny ∀, który czytamy *dla każdego*) i niewiele będzie trzeba, żebyś zrozumiała, jak w logice
konstruktywnej działa *implikacja* (chodzi o symbol →, który czytamy *jeżeli, to*), bo ta jest w
logice konstruktywnej tylko szczególnym rodzajem funkcji. Pozostałe standardowe *spójniki logiczne*
(∧, ∨ i ∃), za wyjątkiem *negacji* (¬), można również zdefiniować za pomocą implikacji.

Ponieważ predykaty (takie jak *jest dziwne* w zdaniu *Życie jest dziwne*) to to też funkcje, ucząc
się w ten sposób jednocześnie - zarazem na skróty i od podstaw - matematyki i programowania,
stosunkowo szybko opanujesz elementy logiki predykatów. To narzędzie pozwoli Ci prześlwietlać
logiczną strukturę nie tylko dowodów, ale również wielu rozumowań zapisanych w języku naturalnym, na
przykład (rzekomych) uzasadnień głównych wniosków w artykułach empirycznych. Będziesz mogła wtedy z
nieosiągalną inaczej precyzją wskazywać, gdzie dokładnie w tych rozumowaniach znajdują się dziury, o
ile oczywiście jakieś będą. Interesujący, mam nadzieję, że zabawny, i specjalnie niedokończony
przykład takiej analizy znajdziesz [tutaj](./Predykaty_dowod_Anzelma.md).

Ponieważ są tak ważne, treści, o których będziesz się uczyła w tym rozdziale, będę omawiał jeszcze
raz, tylko inaczej, w rozdziale następnym. Dzięki temu mam nadzieję ułatwić Ci aktywne powtarzanie
materiału. To oznacza też, że jeżeli czytając ten rozdział i wykonując polecenia poczujesz, że
utknęłaś, być może znajdziesz poprawne rozwiązanie, albo zaczniesz lepiej rozumieć, jak je znaleźć,
czytając część następną.

Mówiąc ogólnie, w przypadku utknięcia sugeruję pozbyć się ambicji i czytać dalej, albo zrobić sobie
przerwę i spróbować później, albo wrócić do moich wcześniejszych wyjaśnień. A gdyby i to zawiodło,
zawsze możesz zadać mi pytanie mailem. Na pewno się ucieszę i jeśli tylko nie odłożę odpowiedzi z
powodu braku czasu, przez co później o niej zapomnę (co mi się niestety zdaża), to spróbuję
pomóc. Gdybym nie odpowiedział w ciągu kilku dni, to się wcale nie obrażę, gdy napiszesz znowu.

Zależy mi na tym, żeby zwłaszcza te pierwsze rozdziały były dopasowane do możliwości większości
studentów, dlatego będę wdzięczny za wszelkie informacje o pojawiających się trudnościach. Tylko
proszę nie zwracaj się wtedy do mnie per Panie Doktorze. Wiem, że studenci tak robią z dobrej woli i
że moje koleżanki i koledzy czasem tego oczekują, ale moim zdaniem, zwłaszcza w dyscyplinach takich
jak psychologia, te tytuły są po prostu śmieszne i mogą utrudniać przyjęcie krytycznej postawy przez
rozmówcę albo czytelnika. Albo może tak: Jeżeli napiszesz do mnie w sprawie tej książki i będę miał
powody sądzić, że czytałaś już ten fragment, to ewentualnego Pana Doktora potraktuję jako żart. I to
też będzie ok.

**Polecenie**: Korzystając z dowolnej przeglądarki wejdź na stronę:

https://live.lean-lang.org

Rozpoczniesz w ten sposób interaktywną sesję z asystentem dowodzenia Lean. Nie przejmuj się, jeżeli
widzisz to okno po raz pierwszy i wydaje Ci się niepokojąco obce. Będziesz pisać w panelu po lewej i
czasem zaglądać do panelu po prawej.

Błędy będą się pojawiać, ponieważ jesteś (zgaduję) człowiekiem. Gdy pojawi się błąd, Lean Cię o tym
powiadomi podkreślając go czerwoną falką. Przypuszczam, że najczęściej to będzie jakaś drobna
literówka. Czasem samo miejsce, w którym pojawi się czerwona falka, będzie wystarczającą wskazówką,
co należy zmienić, ale nie zawsze. Gdybyś potrzebowała więcej informacji, przeczytaj komunikat o
błędzie, który pojawi się w panelu po prawej i spróbuj ustalić w czym problem.

Zgodnie z tym, co wcześniej napisałem, uważam, że warto, żebyś przed przed czytaniem bardziej
szczegółowych wyjaśnień spróbowała wykonać od razu kilka zadań. Oto pierwsze z nich:

**Polecenie**: Wklej do Leana poniższy fragment kodu. Możesz od razu wkleić go do schowka klikając
na dwa małe kwadraty, które widać po prawej stronie. Widać je tutaj w tekście, poniżej po prawej,
nie w Leanie.

```lean
def dziesiec : Nat := 10
```

Wkleiłaś właśnie *definicję* (poznajemy to po słowie kluczowym `def` i symbolu definiowania `:=`)
*stałej* `dziesiec` o *typie* `Nat` (to właśnie znaczy `: Nat`), czyli stałej typu *liczba
naturalna*, której *ciało*, czyli wartość albo treść, to liczba (a właściwie *term*) `10`.

**Polecenie**: Zapisz w Leanie analogiczną definicję stałej o nazwie `trzy`. Musisz tylko skorzystać
z `dziesiec` jako z przykładu, zamieniając dwa elementy tej definicji - nazwę stałej i jej
wartość. Jeżeli napiszesz coś niezgodnie z wymaganiami Leana, zobaczysz fragment podkreślony
czerwoną falką. Wiesz, co wtedy trzeba robić.

**Polecenie**: Zmień swoją poprawną definicję stałej `trzy` na *błędną* zastępując liczbę `3` przez
słowo `tszy`. Ta definicja będzie błędna nie dlatego, że to słowo pisze się inaczej. Umieść kursor
na nieznanej Leanowi w tym momencie nazwie `tszy` i odczytaj komunikat o błędzie widoczny po
prawej. Powinnaś wtedy zobaczyć *unknown identifier 'tszy'*. Ten komunikat oznacza, że Lean nie wie,
co znaczy `tszy`. Jak widzisz, błędy to nie powód do paniki, tylko okazja, żeby Lean mógł się
wykazać.

W Leanie można tworzyć stałe różnych typów, nie tylko liczbowe. Poniższy kod tworzy stałą o typie
tekstowym (`String`) i wartości, która ma ten typ. Zwróć uwagę, że wartości zmiennych tekstowych
muszą być otoczone cudzysłowami.

**Polecenie**: Skopiuj do Leana lub przepisz z pamięci:

```lean
def gwiazda_wieczorna : String := "Rihanna"
```

Żeby zobaczyć wartość zdefiniowanej wcześniej stałej trzeba użyć komendy `#eval` (to skrót od
*evaluation*), na przykład w ten sposób:

```lean
#eval dziesiec
```

**Polecenie**: Napisz teraz w nowej linijce `#eval gwia`, tylko tyle. Zobaczysz wtedy, że Lean
próbuje się domyślić, co chcesz napisać i oferuje Ci możliwość szybkiego wpisania pełnej nazwy. Żeby
z tego skorzystać, naciśnij klawisz Tab kiedy Lean podświetla właściwą kontynuację lub wskaż tą
właściwą wybierając ją za pomocą myszki lub klawiszy strzałek. Ponieważ kursor będzie wtedy w
linijce, która zaczyna się od komendy `#eval`, po prawej zobaczysz wartość wpisywanej stałej.

Gdybyś miała wątpliwości, jaki jest typ pewnej stałej, możesz to zawsze sprawdzić używając komendy
`#check`, na przykład w ten sposób:

```lean
#check dziesiec
```

Po prawej zobaczysz wtedy komunikat, który poinformuje Cię, że stała `dziesiec` ma typ `Nat`, czyli
jest liczbą naturalną.

**Polecenie**: Za pomocą komendy `#check` sprawdź typ którejś ze zdefiniowanych dotąd stałych, ale
nie wklejaj w tym celu stąd kodu, tylko napisz go sama.

**Wbrew pozorom przydatne ćwiczenie**: Jeśli masz ochotę, stwórz własną zmienną tekstową o jakiej
tylko chcesz wartości. Nawet, jeżeli w tym momencie wydaje Ci się to zbyt proste, może warto to
zrobić, bo dzięki temu Lean nieco bardziej zadomowi się "w Twoich palcach" i następne fragmenty kodu
będziesz "bardziej czuć". To jest trochę tak, jak z robieniem jakichkolwiek notatek na temat treści,
których się słucha albo które się czyta. Sama czynność notowania mniej więcej na temat, nawet gdy
wydaje się, że nic nie wnosi, zasadniczo zmienia sposób, w jaki przetwarzamy informacje, wpływa na
to, co później pamiętamy, a przez to wpływa na sposób, w jaki postrzegamy podobne treści i jak na
nie reagujemy. A jeżeli ta czynność wydaje się tak łatwa, że aż zbędna, to w pewnym sensie tym
lepiej.

## Funkcje w Lean

Stałe, które do tej pory zdefiniowaliśmy, nie pozwalają nam zbyt wiele zrobić. Najważniejszą częścią
programów komputerowych nie są tego rodzaju stałe, tylko *funkcje*, to jest algorytmy albo efektywne
procedury obliczeniowe, które już "coś zrobić" mogą, o ile tylko dostarczymy im pasujące do ich
wymagań wartości. Żeby stworzyć w Leanie definicje funkcji będziemy jawnie podawać ich typ, tak jak
wcześniej wprost pisaliśmy, że stała `dziesiec` ma typ `Nat` (`dziesiec : Nat`).

Typ funkcyjny (inaczej typ funkcji) poznasz po tym, że ma co najmniej jedną *strzałkę*.

**Polecenie**: Żeby wpisać w Lean strzałkę napisz `\to` i ulegnij natychmiast olśnieniu. Gdy już
ochłoniesz, usuń tą strzałkę, bo sama strzałka nie jest jeszcze poprawnym fragmentem kodu.

Nawet najprostsze fragmenty kodu możemy zapisać w Leanie na wiele sposobów. Wynika to między innymi
stąd, że Lean potrafi się czasem domyślić typu stałej albo parametru na podstawie pozostałych części
złożonego wyrażenia. Lean oferuje też poza tym różne inne rodzaje zapisów skrótowych. Na razie nie
będziemy z tego korzystać, bo naszym celem jest dobre opanowanie podstaw, a nie jak najszybsze
korzystanie z udogodnień.

Będę odtąd używał *komentarzy*. W Leanie komentarzem jest każdy tekst zaczynający się od znaków
`--`. Lean ignoruje wszystko, co jest napisane po tych znakach, taki tekst ma zatem służyć tylko
Tobie.

Żeby zdefiniować funkcję, która przyjmuje argument typu `Nat` i zwraca jego wartość zwiększoną o *2*
możemy napisać tak:

```lean
-- Nat → Nat oznacza typ funkcji, które pobierają argumenty typu Nat i zwracają rezultat
-- typu Nat
def dodaj2 : Nat → Nat := 
    -- fun to słowo kluczowe i jednocześnie skrót od *function*. W Lean oznacza *funkcję
    -- anonimową*, inaczej *λ-abstrakcję*
    fun (moj_parametr : Nat) => moj_parametr + 2
```

Lean wie, że te dwie (a licząc z komentarzem cztery) linijki to definicja tej samej funkcji, bo bez
fragmentu zaczynającego się od `fun` kod byłby niekompletny. Nie trzeba zapisywać tej definicji w
dwóch linijkach; ja tak zrobiłem, bo ten sposób wydawał mi się bardziej czytelny, ale to tylko
kwestia stylu. YMMV.

**Czytamy to**: Definiuję (`def`) stałą `dodaj2` typu funkcja przekształcająca liczby naturalne w
liczby naturalne (`: Nat → Nat`) jako (`:=`) funkcję (`fun`), która jakikolwiek `moj_parametr` typu
`Nat` (`(moj_parametr : Nat)`) przekształca (`=>`) w `moj_parametr + 2`. Nie wiem, czy to tutaj
dobrze widać, ale `moj_parametr` pełni rolę czegoś w rodzaju zaimka. Gdyby ta funkcja umiała mówić,
co robi, powiedziałaby tak: *Do tego co mi dasz, a co musi być typu `Nat`, dodaję `2`*.

**Polecenie**: Podaj Leanowi powyższą definicję funkcji `dodaj2`, ale nie *kopiując* tego kodu,
tylko wpisując go *z pamięci*, bez przepisywania komentarzy. Jestem pewien, że prędzej czy później
sobie z tym poradzisz. To nie będzie szczególnie trudne, a dzięki temu prostemu ćwiczeniu ogólna
struktura tego rodzaju definicji lepiej Ci się utrwali. Możesz oczywiście wracać do tego fragmentu
książki ile razy tylko będzie trzeba, albo żeby lepiej zapamiętać strukturę definicji, albo żeby
sprawdzić, gdzie dokładnie pojawił się ewentualny błąd.

**Polecenie**: Funkcję `dodaj2` można zastosować do dowolnej liczby naturalnej, w tym również do
stałej `dziesiec`, bo ta stała ma taki sam typ, jak parametr funkcji `dodaj2`. Żeby to zrobić i
jednocześnie obliczyć wynik napisz Leanowi z pamięci, być może przyspieszając pisanie i jednocześnie
zmniejszając ryzyko literówki za pomocą Taba:

```lean
#eval dodaj2 dziesiec
```

**Definicja aplikacji**: Samo *zestawienie* obok siebie funkcji i jakiegokolwiek wyrażenia, również
takie *błędne* zestawienie, bez żadnego obliczania wyniku, nazywamy *aplikacją*. Oddzielanie
aplikacji od ewaluacji może się wydawać zbędne, ale okaże się potrzebne między innymi podczas
dowodzenia twierdzeń. Na przykład, `dodaj2 dziesiec` jest aplikacją, w dodatku poprawną, bo `dodaj2`
wymaga jako argumentu dowolnego termu typu `Nat`, a stała `dziesiec`, zgodnie z definicją, jest
właśnie takim termem.

Zdefiniujemy teraz funkcję, która będzie dodawała *dwie* dowolne liczby naturalne. Zrobimy to w
sposób, który pozwoli zobaczyć, że takie funkcje w Leanie są tak naprawdę
*jedno*argumentowe. Uprzedzam, *to będzie najtrudniejsza część tego rozdziału*. Dlatego spróbuję
wyjaśnić jak to działa na kilka różnych sposobów.

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
#eval dodaj2 2

-- Żeby ewaluować tą aplikację, Lean ewaluuje, czyli redukuje do najprostszej postaci,
-- argument aplikacji. Cyfra 2 może być zredukowana do czegoś bardziej podstawowego,
-- ale o tym powiem później. Na razie będziemy udawać, że pod cyfrą 2 nie kryje się nic 
-- więcej.

-- Lean rozpakowuje również definicję stałej funkcyjnej, czyli tutaj stałej dodaj2. W ten 
-- sposób w miejscu dodaj2 mamy tak zwaną *funkcję anonimową*, bo już bez nazwy "dodaj2",
-- to jest fun (moj_parametr : Nat) => moj_parametr + 2. Otoczyłem tą funkcję nawiasami, żeby
-- zapis był jednoznaczny.
(fun (moj_parametr : Nat) => moj_parametr + 2) 2

-- Lean odczepia część przed symbolem =>, zostawiając tylko ciało tej anonimowej funkcji:
moj_parametr + 2
-- i jednocześnie podstawia zredukowaną wersję argumentu pod parametr funkcji w ciele funkcji,
-- czyli w tym wypadku podstawia 2 pod *zmienną* moj_parametr:
2 + 2

-- Przy okazji, czy widzisz, że warto tutaj użyć innej nazwy - "parametr" - na to, co pojawia się 
-- po słowie fun (czyli moj_parametr) i innej - "argument" - na to, co pojawia się jako drugi term 
-- w tej aplikacji (czyli 2)? Bez nazywania tych dwóch rzeczy za pomocą innych słów byłoby trudno
-- o tym mówić w sposób zrozumiały.

-- + to też funkcja, tylko taka, której apliację możemy zapisać w *notacji infiksowej*, 
-- czyli w stylu argument1 funkcja argument2. Lean na to pozwala, jeśli mu wytłumaczymy,
-- co to znaczy, a w przypadku funkcji + wie z góry, co to znaczy.

-- W końcu Lean rozpakowuje definicję funkcji + i stosuje ją do obydwu argumentów. W ten sposób
-- powstaje wynik dodawania i właśnie ten wynik pojawia się jako rezultat, gdy wymuszamy ewaluację
-- aplikacji dodaj2 2:
#eval dodaj2 2 -- Kiedy kursor jest w tej linijce, po prawej widać liczbę 4
```

Przypuszczam, że tego właśnie się mniej więcej spodziewałaś, tylko może sens tej operacji nie jest
jeszcze dla Ciebie całkiem oczywisty bo częściowo przysłaniają go moje rozwlekłe objaśnienia. Teraz
pokażę Ci, jak przebiega ewaluacja bardziej skomplikowanej funkcji `plus` do argumentów `1` i
`2`. Tego kodu też nie kopiuj, to również tylko ilustracja:

```lean
#eval plus 1 2

-- Pierwszy krok ewaluacji to rozpakowanie definicji:
(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 1 2

-- Drugi krok ewaluacji to odczepienie ciała:
(fun (druga : Nat) => pierwsza + druga) 
-- i jednocześnie podstawianie argumentu 1 pod zmienną pierwsza, będącą parametrem ewaluowanej
-- w tym kroku aplikacji. W ten sposób *funkcja plus tworzy nową funkcję* (anonimową) za każdym 
-- razem, gdy dostaje pierwszy argument (typu Nat).
(fun (druga : Nat) => 1 + druga) 2

-- Trzeci krok to też ewaluacja aplikacji, a więc kolejne odczepienie ciała. Tym razem jest to:
1 + druga
-- i jednocześnie podstawienie, tym razem argumentu 2 pod zmienną druga, będącą parametrem ewaluowanej 
-- w tym kroku aplikacji:
1 + 2

-- Ewaluacja postępuje w ten sam sposób do momentu, w którym nie zostanie nic więcej do zredukowania 
-- albo uproszczenia.
```

Jeszcze raz to samo, ale tym razem bez komentarzy i bez zapisywania w osobnej linijce samego
odczepianego ciała:

```lean
-- Ewaluacja aplikacji plus 1 2 w zarysie
#eval plus 1 2

(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 1 2

(fun (druga : Nat) => 1 + druga) 2

1 + 2

3
```

Czy widzisz, jak kolejne argumenty "wskakują" na właściwe miejsca w "najbardziej wewnętrznym" ciele
`pierwsza + druga`? Może jednak wspomnę tylko, że `1 + 2` jest rozpakowywane do aplikacji `Nat.add 1
2`, bo w tym kontekście `+` to tylko inny sposób zapisu od razu dostępnej w Leanie funkcji
`Nat.add`, która dodaje liczby naturalne.

Pokażę Ci jeszcze raz to samo, ale używając notacji, którą często stosują matematycy. Dla
uproszczenia pominę przy tym typy parametrów. Anonimowe funkcje takie jak `fun (moj_parametr : Nat)
=> moj_parametr + 2` nazywamy też *λ-abstrakcjami*. Lean wie o tej konwencji i pozwala pisać `λ`
szamiast `fun`. Jeżeli chcesz użyć tej konwencji, możesz uzyskać tą grecką literę wpisując
`\la`. 

Jeżeli zastosujemy uproszczoną (bo bez typów) notację matematyczną, gdzie zamiast `fun` będziemy
pisać λ, a zamiast `=>` będziemy pisać kropkę, to zobaczymy, że ewaluacja aplikacji anonimowej
wersji (bo bez nazwy "dodaj2") funkcji `dodaj2`:

*(λ x . x + 2) 2*

polega w pierwszym kroku na odczepeniu ciała i podstawieniu argumentu pod zmienną *x*, będącą
parametrem tej λ-abstrakcji:

*2 + 2*

Ewaluacja aplikacji anonimowej wersji funkcji `plus` do liczb *1* i *2*:

*(λ x . (λ y . x + y)) 1 2*

też polega na takim samym odczepieniu ciała i podstawieniu argumentu pod zmienną *x*, będącą
(jedynym) parametrem tej λ-abstrakcji. W ten sposób z ciała zewnętrznej λ-abstrakcji powstaje nowa
wersja funkcji *(λ y . x + y)*, w której zamiast *x* jest *1*:

*(λ y . 1 + y) 2*

Ewaluacja jeszcze nie jest zakończona, bo jest co do czego aplikować (matematycy mówią, że jest tu
jeszcze jakiś *redeks*, czyli *reducible expression*). Ten krok jest już dla Ciebie pewnie
oczywisty - odczepiamy ciało *1 + y* i podstawiamy za zmienną-parametr *y* argument *2*:

*2 + 2*

Rozumiesz już, że możemy w ten sposób definiować funkcje, które zachowują się jak funkcje
dwuargumentowe, posługując się tylko funkcjami jednoargumentowymi? Ten sposób to tak zwany
*Currying*, od nazwiska wybitnego matematyka [Haskella
Curry'ego](https://en.wikipedia.org/wiki/Haskell_Curry), który go wymyślił, którego imię jest - na
jego cześć - nazwą pewnego języka programowania i którego jeszcze niebawem spotkamy.

Pozostaje mi objaśnić *zapis typu* tej dwuargumentowej funkcji, która jak już wiesz jest tak
naprawdę pewną funkcją jednoargumentową - nazwałem ją dla wygody funkcją "zewnętrzną" - pobierającą
jako argument dowolny term typu `Nat`, która to zewnętrzna funkcja zwraca funkcję jednoargumentową -
nazwałem ją dla wygody "wewnętrzną" - pobierającą jako argument również dowolny term typu
`Nat`. Funkcja `plus` dobrze udaje funkcję dwuargumentową dzięki temu, że ciało funkcji wewnętrznej
jest konstruowane przez funkcję `plus` z tego, co dostaje jako argument. To jest znowu tylko
ilustracja:

```lean
def plus : Nat → (Nat → Nat) := 
    -- Funkcja "zewnętrzna"
    fun (pierwsza : Nat) =>
        -- Funkcja "wewnętrzna", której ciało zmienia się na skutek podstawiania pod zmienną
        -- pierwsza, gdy ewaluujemy aplikację funkcji plus do pierwszego argumentu
        fun (druga : Nat) => pierwsza + druga
```

Mam nadzieję, że jest dla Ciebie jasne, że *wewnętrzna* funkcja ma typ `Nat → Nat`, pobiera przecież
jeden term typu `Nat` i zwraca term typu `Nat` (będący rezultatem dodawania). *Zewnętrzna* funkcja
pobiera jeden term typu `Nat`, ale zwraca tamtą *funkcję*, a dokładniej jej odpowiednią wersję,
dlatego właśnie typ stałej `plus` to `Nat → (Nat → Nat)`.

Nawiasy w `Nat → (Nat → Nat)` nie są tak naprawdę potrzebne, bo w Leanie *strzałka wiąże z
prawej*. Wyjaśniam, co to znaczy: Gdyby nie konwencja, którą stosuje Lean, zapis `Nat → Nat → Nat`
byłby niejednoznaczny w problematyczny sposób, ponieważ nie byłoby wiadomo, czy chodzi o `(Nat →
Nat) → Nat` czy o `Nat → (Nat → Nat)`, a to *nie jest to samo*: `(Nat → Nat) → Nat` to typ
jakichkolwiek funkcji, które przekształcają *funkcje* typu `Nat → Nat` w liczby naturalne, a `Nat →
(Nat → Nat)` to typ jakichkolwiek funkcji, które przekształcają liczby naturalne w funkcje typu
`(Nat → Nat)`.

To, że w Leanie strzałka wiąże z prawej, znaczy, że dla dowolnych typów `A`, `B` i `C`, `A → B → C`
jest interpretowane jako `A → (B → C)`, a więc `Nat → Nat → Nat` jest interpretowane jako `Nat →
(Nat → Nat)`. Zapisałem to wprost, nie polegając na tej konwencji i zamiast tego używając nawiasów,
żebyś nie musiała się tego od razu domyślać.

Lean pozwala na zapis skrótowy między innymi w takim oto stylu:

```lean
-- Nie kopiuj tego kodu do Leana, jeżeli nie usunęłaś wcześniej definicji funkcji plus.
-- Lean nie pozwala definiować dwa razy tej samej stałej w tym samym kontekście, dlatego
-- właśnie stałe nazywamy ... stałymi.
def plus (pierwsza : Nat) (druga : Nat) : Nat := pierwsza + druga
```

albo w takim:

```lean
-- Tego też nie kopiuj, jeżeli nie usunęłąś wcześniej definicji stałej plus. Tutaj nie podajemy
-- jawnie typu rezultatu (nie ma fragmentu : Nat przed symbolem :=), co nie jest błędem, bo Lean
-- może sam wywnioskować, że rezultat musi mieć typ Nat, skoro jest sumą dwóch liczb naturalnych.
def plus (pierwsza : Nat) (druga : Nat) := pierwsza + druga
```

a nawet w takim:

```lean
-- Skoro parametr druga ma typ Nat i jest dodawany do parametru pierwsza, to parametr pierwsza musi
-- mieć typ Nat, a skoro musi, to Lean się tego sam domyśla
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
-- Ta definicja jest zapisana zbyt skrótowo i błędna, bo nie pozwala Leanowi automatycznie 
-- wywnioskować typu parametrów i rezultatu, a przez to nie pozwala mu wywnioskować, jakiej 
-- wersji dodawania (na przykład, dla liczb naturalnych czy może wymiernych) ma tu użyć:
def plus (pierwsza) (druga) := pierwsza + druga
```

Skrótowy zapis jest bardzo wygodny i zwykle właśnie takiego zapisu będziemy używać, ale ważne jest,
żebyś wiedziała, co takie skróty oznaczają. Nie musisz sobie o tym przypominać za każdym razem, gdy
definiujesz stałe albo ich używasz, ale w pewnych sytuacjach ta wiedza będzie nieodzowna.

**Polecenie**: Stosując wygodny zapis *skrótowy*, zdefiniuj funkcję `plusplus`, pobierającą *trzy*
argumenty typu `Nat`, każdy o innej nazwie (muszą mieć inne nazwy) i dodającą je do siebie. Sprawdź
typ zdefiniowanej w ten sposób stałej `plusplus` za pomocą komendy `#check`. Zobaczysz wtedy po
prawej jeszcze bardziej skrótowy sposób zapisu parametrów. Można tu użyć tego jeszcze bardziej
skrótowego zapisu, bo sąsiadujące parametry funkcji `plusplus` mają ten sam typ i Lean może
wywnioskować, o co chodzi, gdy tak to zapiszemy. Usuń zatem definicję, którą właśnie napisałaś i
napisz ją jeszcze raz, ale tym razem stosując ten nowy, jeszcze bardziej skrótowy zapis
parametrów. Następnie ewaluuj aplikację funkcji `plusplus` do dowolnych trzech liczb naturalnych.

## Częściowe aplikacje

Ponieważ funkcja `plus` to tak naprawdę funkcja, która zwraca funkcję, możemy ją aplikować do
*jednego* argumentu `3`. Uzyskamy w ten sposób funkcję jednoargumentową, która do dowolnej liczby
naturalnej dodaje `3`. To znowu tylko ilustracja:

```lean
-- To:
plus 3
-- zgodnie z definicją plus jest tym samym co:
(fun (pierwsza : Nat) => fun (druga : Nat) => pierwsza + druga) 3
-- i aplikacja plus 3 redukuje się (a więc też w pewnym sensie tym jest) do:
(fun (druga : Nat) => 3 + druga)
-- a to jest przecież również pewna (anonimowa) funkcja.
```

Nie możemy ewaluować takiej częściowej aplikacji, bo Lean nie potrafi bez naszej pomocy *wyświetlić*
funkcji, która w ten sposób powstaje. Możemy jednak zapisać tą funkcję / rezultat częściowej
aplikacji jako ciało definicji stałej `dodaj3` o typie `Nat → Nat` (już wiesz, dlaczego ta stała
musi mieć ten typ, prawda?):

```lean
-- Ten kod możesz skopiować, bo jest poprawny, zakładając, że stała plus jest
-- zdefiniowana zgodnie z wcześniejszym poleceniem. W ten sposób stała dodaj3 staje się 
-- funkcją, która powstaje z aplikacji funkcji plus do liczby 3. Ponieważ funkcja plus jest
-- dwuargumentowa, aplikacja plus 3 jakby "czeka" na drugi argument. A mówiąc ściślej,
-- ta aplikacja jest funkcją powstającą przez podstawienie liczby 3 pod zmienną 
-- pierwsza w "wewnętrznej" funkcji fun (druga : Nat) => pierwsza + druga, czyli jest
-- funkcją fun (druga : Nat) => 3 + druga
def dodaj3 : Nat → Nat := plus 3

-- Funkcję dodaj3 możemy teraz zastosować tak, jak każdą inną:
#eval dodaj3 3 -- 6

-- Typ tej funkcji już znasz, jest zresztą zapisany wprost w jej definicji, ale i tak
-- przypomnę Ci, jak możesz go zawsze sprawdzić:
#check dodaj3 -- dodaj3 : Nat → Nat, czyli dodaj3 to funkcja z typu Nat do typu Nat
```

**Polecenie dla ambitnych**: Jeżeli już na typ etapie czujesz, że możesz sobie z tym poradzić,
spróbuj zrobić coś podobnego jak to, co zrobiłem z częściową aplikacja funkcji `plus`, ale użyj do
tego zdefiniowanej wcześniej przez siebie funkcji `plusplus`. Można to zrobić na wiele różnych
sposobów, więc nie szukaj jakiegoś *jedynego* dobrego rozwiązania, bo takiego nie ma. Gdyby pojawił
się błąd, przeczytaj komunikat i sprawdź, czy nie dostarcza Ci wskazówki, z której możesz
skorzystać, żeby ten błąd usunąć. Jeżeli to polecenie okażę się za trudne, nie przejmuj się, przy
odrobinie wytrwałości w końcu stanie się dziecinnie łatwe.
