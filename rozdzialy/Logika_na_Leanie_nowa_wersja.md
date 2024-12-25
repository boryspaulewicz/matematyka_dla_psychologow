## O czym teraz będzie

W tym rozdziale skorzystamy z tego, co już wiesz, żeby przejść możliwie płynnie z programowania do
dowodzenia twierdzeń. Rozdziały *R6* i *R7* napisałem w taki a nie inny sposób, to jest tłumacząc
każde kolejne zagadnienie więcej niż raz i omawiając szczegółowo proces ewaluacji wyrażeń, ponieważ
próbowałem zastąpić Cię w roli kogoś, kto aktywnie powtarza przyswajany materiał. Odtąd jednak będę
już pisał inaczej, ponieważ wyręczając Cię do pewnego stopnia w roli kogoś, kto sam stara się
aktywnie uczyć, utrudniłem Ci zmianę postawy, a wydaje mi się, że zmiana postawy z relatywnie
biernej na bardziej aktywną później Ci się przyda.

<hr>

# Konstruowanie termów w trybie interaktywnym

Przypominam znaną Ci już funkcję `identycznosc` (ilustracja):

```lean
def identycznosc (typ : Type) (argument : typ) := argument
```

Funkcja `identycznosc` jest prostym programem komputerowym, który dla dowolnego typu i argumentu o
tym typie zwraca ten argument. Jak wiesz, widoczny wyżej wygodny sposób zapisywania parametrów tej
funkcji tak naprawdę skrywa dwie λ-abstrakcje:

```lean
--- To ...
def identycznosc (typ : Type) (argument : typ) : typ :=
    argument

--- ... jest tym samym, co to ...
def identycznosc' (typ : Type) : typ → typ :=
    fun (argument : typ) => argument

-- ... i tym samym, co to ...
def identycznosc'' : (typ : Type) → typ → typ :=
    fun (typ : Type) =>
        fun (argument : typ) => argument

-- To są wszystko te same funkcje (albo to jest jedna i ta sama funkcja).
#check @identycznosc   -- identycznosc   : (typ : Type) → typ → typ
#check @identycznosc'  -- identycznosc'  : (typ : Type) → typ → typ
#check @identycznosc'' -- identycznosc'' : (typ : Type) → typ → typ

#eval identycznosc   Nat 1 -- 1
#eval identycznosc'  Nat 1 -- 1
#eval identycznosc'' Nat 1 -- 1
```

Żeby utworzyć definicję dowolnego termu o z góry określonym typie w trybie interaktywnym, w miejscu,
w którym ma powstać ten term wpisujemy słowo kluczowe `by` (czyli *za pomocą* albo *na sposób*). W
trybie interaktywnym i tylko w tym trybie możemy korzystać z tak zwanych *taktyk*. Wrócimy teraz do
prostszej identyczności, która działa tylko dla liczb naturalnych i poznamy dwie ważne taktyki -
`intro` i `exact`.

Taktyka `intro` tworzy (w tle) sam *początek* λ-abstrakcji, czyli samą część `fun (jakis_parametr :
jakis_typ) =>`. Jeżeli skopiujesz poniższy fragment kodu i umieścisz kursor w linii zaznaczonej za
pomocą komentarza ...

```lean
def nic_nie_robie : Nat → Nat := by
    -- Umieść kursor w następnej linii.
```

... to po prawej, pod zakładaką *Tactic state*, zobaczysz aktualny stan procesu konstrukcji termu w
trybie interaktywnym ...

```lean
1 goal
⊢ Nat → Nat
```

... a `by` będzie podkreślone czerwoną falką i zobaczysz też czerwoną falkę pod linią z komentarzem,
bo definicja nie jest jeszcze zakończona. Można więc powiedzieć, że to nie jest błąd, tylko sygnał,
że masz coś do zrobienia.

**Czytamy to**: Pozostał jeden cel do zrealizowania (`1 goal`). Tym celem jest (`⊢`) stworzenie
termu typu `Nat → Nat`. Powyżej symbolu derywacji `⊢` a poniżej komunikatu `1 goal` widać aktualny
*kontekst*. W tym momencie jeszcze nic tam nie ma.

Jak wiesz, `fun (n : Nat) => n` jest przykładem termu typu `Nat → Nat`, ponieważ jest (w tym wypadku
trywialną, bo identycznościową) funkcją posyłającą liczby naturalne w liczby naturalne. Wpisując
teraz poniżej komentarza `intro n` i nasikając klawisz Enter sprawisz, że zmieni się kontekst z
pustego na taki, w którym masz do dyspozycji jakąś (czyli arbitralną) liczbę naturalną o nazwie `n`,
czyli `n : Nat`. To daje taki sam efekt jak dołożenie parametru `(n : Nat)` do definiowanej
funkcji - gdy definiowana funkcja ma taki parametr, wewnątrz jej ciała widać `n : Nat` właśnie jako
element kontekstu, czyli jedną z dostępnych lokalnie deklaracji zmiennych.

Zastosowanie taktyki `intro` jest więc tym samym, co rozpoczęcie tworzenia kodu funkcji anonimowej
`fun (n : Nat) => ...` i umieszczenie kursora w miejscu trzech kropek, to jest w miejscu, w którym
należy stworzyć ciało tej funkcji. Rezultat zastosowania w ten sposób taktyki `intro` można również
opisać tak: Niech `n` będzie termem typu `Nat`, albo krócej - niech `n : Nat`. Albo tak: Wprowadzam
(`intro` to skrót od *introduction*) do kontekstu `n` (typu `Nat`, bo taki jest "typ początkowy" w
typie-celu).

Ponieważ część termu, który miałaś skonstruować, już powstała, cel uległ zmianie. Teraz po prawej
widać, że celem jest skonstruowanie prostszego termu typu `Nat`, a nie jak wcześniej `Nat →
Nat`. Jak się być może domyślasz, ta zmiana celu nastąpiła, ponieważ stosując taktykę `intro` tak
jakby oderwałaś początkową część typu `Nat → Nat` i wprowadziłaś ją do kontekstu, czyli nadałaś jej
status parametru konstruowanej funkcji.

W tym momencie możesz skorzystać z taktyki `exact`, która służy do *konstrukcji* termu o docelowym
typie *wprost*. Żeby użyć tej taktyki, jako jej argument musisz podać (prosty lub złożony) term,
który ma taki sam typ, jak cel. W tym momencie dysponujesz właśnie takim termem - jest nim przecież
`n : Nat`, który masz w kontekście. Wystarczy więc napisać w następnej linijce poniżej `intro n`
komendę `exact n` i nacisnąć Enter.

Teraz już nie ma żadnych celów do zrealizowania, co można rozpoznać po tym, że gdy kursor znajduje
się w następnej linijce za komendą `exact n`, to po prawej widać stan `No goals`. A więc proces
interaktywnej konstrukcji termu o podanym typie (`Nat → Nat`) zakończył się sukcesem. 

To wszystko może się w tym momencie wydawać niepotrzebnie skomplikowane, ale później okaże się
przydatne. Zwróć proszę uwagę, że w trybie interaktywnym Lean dostarcza Ci *w trakcie* konstrukcji
termu (na przykład funkcji albo programu, a później dowodu) informacje na temat tego, co jeszcze
zostało do skonstruowania i czym w danym miejscu w kodzie dysponujesz. W przypadku definiowania
prostych funkcji to się może wydawać rozpraszające i zbędne, ale w przypadku konstruowania termów
bardziej złożonych, na przykład nie całkiem trywialnych dowodów, taka pomoc bardzo się przydaje, a
poza tym sprawia, że uprawianie matematyki jeszcze bardziej przypomina grę.

**Polecenie**: Próbując zastosować taki sam ogólny schemat postępowania jak ten, który własnie
opisałem, spróbuj stworzyć w trybie interaktywnym definicję uogólnionej identyczności uzupełniając
poniższy kod. Zwróć uwagę, że ponieważ ta definicja ma już dwa parametry - `(typ : Type)` i
`(argument : typ)` - to obydwa są widoczne w kontekście, to jest powyżej symbolu derywacji `⊢`, jako
coś, co od razu masz. Twoim celem jest w tym momencie stworzenie jakiegokolwiek termu typu `typ`, a
ponieważ masz już taki term, wystarczy zastosować taktykę `exact` z odpowiednim argumentem i
nacisnąć Enter. Wtedy zobaczysz, że nie ma już więcej celów, a więc konstrukcja definicji tej
funkcji zakończyła się sukcesem.

```lean
def identycznosc (typ : Type) (argument : typ) : typ := by
    -- Umieść kursor w następnej linii.
```

Teraz skonstruujemy taką samą funkcję, ale będzie miała o jeden argument mniej, bo przestawimy
główny dwukropek o jedno miejsce w lewo. Trzeba więc będzie samodzielnie stworzyć jedną λ-abstrakcję
za pomocą taktyki `intro` z odpowiednim argumentem i trzeba będzie jeszcze zrealizować jedyny cel,
który później pozostanie do zrealizowania.

**Polecenie**: Dokończ poniższą definicję w trybie interaktywnym podobnie opierając się na
wyjaśnieniach, które podałem wcześniej:

```lean
def identycznosc' (typ : Type) : (argument : typ) → typ := by
```

Argument taktyki `intro`, czyli nazwa parametru konstruowanej λ-abstrakcji, mogła Ci się wydawać
zbędna, skoro ta nazwa jest podana w specyfikacji typu konstruowanego termu. Niestety, samo wpisanie
taktyki `intro`, bez podania jakiegokolwiek argumentu, nie byłoby w tym przypadku
wystarczające. Mogłaś jednak wybrać inną nazwę dla parametru konstruowanej funkcji, na przykład
jakąś nazwę krótszą niż ta, która pojawia się w specyfikacji typu. Jeżeli masz ochotę, usuń kod
kończący definicję i zastosuj najpierw taktykę `intro` z innym argumentem, po czym zastosuj taktykę
`exact` z jedynym argumentem, który biorąc pod uwagę, co będziesz mieć wtedy w kontekście, zakończy
konstrukcję definicji.

**Polecenie**: Dokończ poniższą definicję w trybie interaktywnym używając kombinacji taktyk `intro`
i `exact`. Nie bój się eksperymentować; każdej takiej próbie będą towarzyszyły informacje zwrotne w
panelu po prawej. Zwracaj uwagę na aktualny cel i pamiętaj, że `intro` z odpowiednim argumentem
jakby "odrywa i wrzuca na górę" początkową część celu, gdy ten ma typ funkcyjny (strzałkowy).

```lean
def identycznosc'' : (typ : Type) → (argument : typ) → typ := by
    -- Umieść kursor w następnej linii.
```

**Polecenie**: Używając trybu interaktywnego dokończ poniższą definicję. Zwróć uwagę, że Twoim celem
jest skontruowanie termu typu `Nat`, a nie termu typu funkcyjnego, nie masz więc tworzyć
λ-abstrakcji. Jedyna trudność, jaka może się pojawić u Ciebie w tym zadaniu, to przywiązanie do
określonego sposobu stosowania taktyki `exact`. Ta taktyka jest dość elastyczna w tym znaczeniu, że
jej argumentem nie musi być pojedyncza stała - to może być dowolne złożone wyrażenie, o ile typ tego
wyrażenia zgadza się z celem.

```lean
-- Dokończ definicję w trybie interaktywnym.
def dodaj2 (n : Nat) : Nat := by
```

**Polecenie**: A teraz dokończ definicję tej samej funkcji, ale nie korzystając z udogodnienia
wynikającego z tego, że podanie parametru przed głównym dwukropkiem wyręcza Cię w konstruowaniu
λ-abstrakcji:

```lean
-- Dokończ definicję w trybie interaktywnym.
def dodaj2' : Nat → Nat := by
```

**Polecenie**: Teraz będziesz robić to samo, ale konstruowana funkcja będzie dwuargumentowa.

```lean
-- Dokończ definicję w trybie interaktywnym.
def suma (n : Nat) (m : Nat) : Nat := by
```

```lean
-- Dokończ definicję w trybie interaktywnym. Ponieważ w tym wypadku trzeba samodzielnie stworzyć λ-abstrakcję,
-- konieczne będzie zastosowanie taktyki intro.
def suma' (n : Nat) : Nat → Nat := by
```

```lean
-- Dokończ definicję w trybie interaktywnym.
def suma'' : Nat → Nat → Nat := by
```

W tym momencie muszę Ci wytłumaczyć na czym w Leanie polega *hierarchia typów*.

## Hierarchia typów w Leanie

W teorii typów, której używamy w Leanie, *każdy typ*, na przykład typy `Nat` i `Type`, *jest również
termem*, ale *typu ogólniejszego* inaczej *wyższego*, na przykład typ `Type` ma typ `Type 1`, `Type
1` jest typem, ale również termem, który ma typ `Type 2`, i tak w nieskończoność[^1]:

```lean
-- 2 to tylko "zwykły" term, to jest taki, który nie jest typem. Czasami myślę o takich termach, że "są na dnie",
-- albo że są "zwarte" czy "konkretne":
#check 2 -- 2 : Nat

-- Nat to typ i jednocześnie term ogólniejszego typu, który nazywa się Type. Chciałoby się zapisać:
--  2 : Nat : Type
-- ale Lean nie pozwala na taką notację. Type to tak naprawdę Type 0, ale ponieważ typ Type 0 bardzo często
-- się pojawia, to Lean pozwala zapisać go w ten skrótowy sposób i tak też go wyświetla.
#check Nat -- Nat : Type, a tak naprawdę Nat : Type 0

-- Type (czyli Type 0) to typ i jednocześnie term ogólniejszego albo wyższego typu Type 1
#check Type -- Type : Type 1
#check Type 1 -- Type 1 : Type 2
#check Type 2 -- Type 2 : Type 3
-- I tak dalej ...

#check Type 665 -- Nie umieszczaj nigdy kursora na tej linii! I nie pij tej wody!!

-- A więc pisząc w sposób, którego Lean nie lubi:
-- 2 : Nat : Type 1 : Type 2 : Type 3 : Type 4 : i tak dalej ...
```

Jedyne, co potrzebujesz w tym momencie wiedzieć o typach wyższego rzędu to że po prostu gdzieś tam
sobie *są*. A przy okazji:

```lean
-- W ten sposób możemy zapytać - czy dobrze mi się wydaje, że term Type 1 ma typ Type 2?
#check (Type 1 : Type 2) -- Odpowiedź Leana - Type 1 : Type 2 - czytamy: Tak, dobrze Ci się wydaje.
```

Typy wyższych rzędów są potrzebne *tylko* z pewnych nudnawych powodów technicznych i rzadko, o ile w
ogóle, będą nas interesować. Może słyszałaś o paradoksie albo [antynomii
Russella](https://pl.wikipedia.org/wiki/Antynomia_Russella)? Fryzjer, który goli tych i tylko tych
mieszkańców, którzy akurat stoją na jednej nodze, ale niekoniecznie swojej, dlatego musi być tym
bardziej ostrożny, gdy używa brzytwy, bo jak ich goli, to... Może pomińmy szczegóły. Chodzi w każdym
razie o coś zbliżonego. Nie słyszałaś? To zazdroszczę.

## Zdania jako typy (zdaniowe), termy typów zdaniowych jako dowody tych zdań

Lean ma również wbudowany typ `Prop`, który będzie odtąd dla nas ważny. To jest typ wyższego rzędu,
podobnie jak na przykład `Type 1`, co znaczy, że termy typu `Prop` same są typami, ale typ `Prop`
zachowuje się trochę inaczej niż typy `Type n` (gdzie `n` to dowolna liczba naturalna). Pokażę Ci
teraz, że typ `Prop` jest jakby odnogą albo odgałęzieniem hierarchii typów:

```lean
#check Prop -- Prop : Type

-- Komenda variable służy do deklarowania, że mamy ("skądś") jakiś term danego typu.
variable (cos_pod_typem_Prop : Prop)

-- cos_pod_typem_Prop jest jednocześnie termem (typu Prop) i typem, dlatego możemy napisać taką deklarację:
variable (jakis_term : cos_pod_typem_Prop)

#check Nat -- Nat : Type

-- 2 nie jest typem, to tylko term. Nie istnieją termy typu 2.
#check 2 -- 2 : Nat
```

A więc "zaraz pod" typem `Type` (a tak naprawdę `Type 0`) mamy na przykład typ `Nat` (i wiele
innych), a "pod" typem `Nat` mamy już tylko termy. Chociaż typ `Prop` też jest pod tym samym typem
`Type`, to jednak "ma pod sobą" również typy (zamieszkują go typy). Piszę o tym już teraz, ale to
nie będzie na razie takie ważne.

Nazwa typu `Prop` jest skrótem od angielskiego *Proposition* oznaczającego *zdanie* albo *sąd*. Oto,
dlaczego ten typ będzie dla nas odtąd ważny - tak jak dowolne pary liczb rzeczywistych można dzięki
układowi współrzędnych konsekwentnie interpretować jako punkty na płaszczyźnie, tak też dzięki
izomorfizmowi Curry'ego-Howarda termy typu `Prop` można konsekwentnie interpretować jako
*zdania*:

*Termy typu `Prop` można konsekwentnie interpretować jako zdania*.

Dlatego takie termy będę odtąd często nazywał po prostu zdaniami. Ponieważ `Prop` jest typem
wyższego rzędu, to w naszym języku *zdania są typami*, dlatego zdania będziemy nazywać też czasem
*typami zdaniowymi*. Będziesz się również stopniowo przyzwyczajać do tego, że:

*Termy typu zdaniowego można konsekwentnie interpretować jako dowody tego zdania (tego typu
zdaniowego)*.

Wydaje mi się, że będzie może najlepiej, jeżeli będziesz się do tego przyzwyczajać grając w grę
polegającą na dowodzeniu twierdzeń.

## Pierwsze twierdzenie jako zwykła funkcja

**Polecenie**: Dokończ poniższą definicję w trybie interaktywnym tak jak to robiłaś wcześniej,
używając taktyk `intro` i `exact`. Jedyna trudność, jaka może się tutaj pojawić, to fakt, że
pierwszy raz używasz typu `Prop`. W tym przypadku jedyne, co się liczy, to fakt, że to jest pewien
typ (a `zdanie` jest pewnym parametrem funkcji `twierdzenie`):

```lean
def twierdzenie (zdanie : Prop) : zdanie → zdanie := by
```

**Polecenie**: Dokończ tą samą definicję jeszcze raz, ale tym razem nie używając trybu
interaktywnego. Trzeba będzie usunąć kod, który przed chwilą napisałaś i trzeba będzie usunać też
słowo kluczowe `by`. Potraktuj `Prop` jak jakiś typ, taki jak inne i dokończ definicję tak, jakby to
była funkcja identycznościowa (działająca tylko dla termów typu `Prop`). Przypuszczam, że to będzie
dla Ciebie w tym momencie łatwe.

Jeżeli Ci się udało wykonać ostatnie polecenie, to właśnie na dwa sposoby udowodniłaś pewne
twierdzenie matematyczne, a dokładniej tautologię o postaci *Jeżeli A, to A*, gdzie *A* to jakieś
zdanie.

# Pojęciowy zawrót głowy

Pamiętasz moje uwagi na temat układu kartezjańskiego i innych izomorfizmów? Tego rodzaju izomorfizmy
mogą się na spoczątku wydawać obce, ale przełączając się przez pewien czas się regularnie między
punktami widzenia, które odpowiadają ich "stronom", możemy zacząć postrzegać pewne rzeczy w nowy
sposób. Dzięki temu możemy zacząć w całkiem nowy sposób myśleć, a dzięki temu czasem lepiej sobie
radzić z rozwiązywaniem pewnego rodzaju problemów.

Żeby "zanurzyć się" w izomorfizmie Curry'ego-Howarda trzeba *stopniowo* opanować sztukę *w miarę*
konsekwentnego *odróżniania*:

1. Dowolnych zdań *jako takich*, a więc niekoniecznie prawdziwych, od...

2. *Prawdziwości lub fałszywości* dowolnych zdań, a tego z kolei od...

3. Ewentualnego *faktu*, że jakieś zdanie (albo jego negacja) *ma dowód*, wreszcie...

4. *Założenia, że* zdanie ma *jakiś* dowód, od *konkretnego kodu* albo *konstrukcji* takiego dowodu.

W tym momencie samo to, że to nie są te same rzeczy czy fakty, może Ci się wydawać zrozumiałe i może
wręcz nie warte objaśniania, ale możliwe, że te fundamentalne rozróżnienia będą Ci na początku
sprawiały trudności nawet w stosunkowo prostych sytuacjach. Dlatego przypominam jeszcze raz -
cierpliwości. 

Oswajanie się z nieznanymi wcześniej fragmentami matematyki może przypominać ... wykształcanie się
[skrzel](https://pl.wikipedia.org/wiki/Skrzela_(anatomia)). Na początku czujemy, że zanurzamy się w
nowym, obcym (pojęciowym) środowisku, w którym nie jesteśmy w stanie przebywać zbyt długo i szybko
się męczymy; to jest więc trochę tak, jakbyśmy się znaleźli pod powierzchnią wody. Jednak z czasem,
jeżeli tylko będziemy nadal wracać do tego początkowo nowego dla nas środowiska, będzie się ono dla
nas stawało coraz bardziej znajome i przez to naturalne, aż w końcu wykształcimy coś w rodzaju
mentalnego organu, którego wcześniej nie było. W ten sposób opanowujemy nowe wyspecjalizowane języki
a wraz z nimi nowe sposoby myślenia, które oferuje współczesna matematyka.

## Implikacje jako funkcje

Implikacja jest być może najważniejszym spójnikiem w logice. Mówiąc luźno, implikacjami nazywamy
zdania o postaci *Jeżeli A, to B*, gdzie *A* i *B* to *dowolne* zdania, proste lub złożone (i tylko
same zdania, a nie ich prawdziwość czy fałszywość, albo fakt bycia dowiedzionym, albo ich
dowody). Implikacje zapisujemy formalnie za pomocą strzałki skierowanej w prawo: *→*. Wygląda
znajomo?

Jeżeli *A* i *B* to zdania - i tylko wtedy - to formalnie, czyli w "oficjalnym" języku matematyki,
implikację *Jeżeli A, to B* zapisujemy zwykle jako *A → B*. Nic? Żadnych skojarzeń?

**Terminologia logiczna**: Mówiąc krótko, jeżeli *A* i *B* to zdania, to *A → B* to zdanie, które
czytamy jako *Jeżeli A, to B*. A mówiąc trochę dłużej: Zawsze, gdy mamy jakieś dwa, niekoniecznie
różne zdania *A* i *B*, możemy napisać *A → B* i to będzie [*formuła
logiczna*](https://pl.wikipedia.org/wiki/Formu%C5%82a_logiczna), którą interpretujemy jako
(niekoniecznie prawdziwe, a tym bardziej udowodnione) zdanie *Jeżeli A, to B*. Mówimy też, że *→* to
w logice pewna *dwuargumentowa operacja* albo *działanie*, tyle że na zdaniach, które to działanie z
dwóch *zdań jako takich* (niekoniecznie udowodnionych czy prawdziwych) robi jedno (niekoniecznie
udowodnione czy prawdziwe) unikalne zdanie złożone, dające się konsekwentnie interpretować jako
*Jeżeli A, to B*. Mówiąc najkrócej, implikacja to operacja binarna na zdaniach.

Może przyda Ci się wyobrazić sobie, że zdanie w logice to coś płaskiego i niemal przezroczystego, a
jego dowód to jakiś barwny skarb, który prześwituje przez powierzchnię zdania, jeśli ten dowód
istnieje i umiemy na to zdanie popatrzeć tak, żeby ten prześwit zobaczyć. Ja tak czasem o tym myślę.

**Analogia między implikacjami i typami funkcyjnymi**:

Jeżeli *A* i *B* to *zdania*, to *A → B* jest *implikacją*.

Jeżeli `A` i `B` to *typy*, to `A → B` jest *typem funkcyjnym*.

Analogia, a raczej doskonałe dopasowanie jakie występuje między zdaniami i (pewnymi) typami może
wyglądać jak wieloznaczność i w pewnym sensie nią jest. Jednak to byłaby wieloznaczność
problematyczna tylko gdybyśmy sprawili, że nie jest całkiem jasne, którą interpretację stosujemy i
gdyby *jednocześnie* ta różnica w dopuszczalnych interpretacjach miała znaczenie dla poprawności
wniosków. Używając układu współrzędnych też korzystałaś z pewnej podwójności interpretacji, a więc
pewnej wieloznaczności i wyszło Ci to, jak sądzę, na dobre, prawda?

**Terminologia ogólna**: W matematyce *unikalne* znaczy zwykle *dokładnie jedno danego rodzaju*. I
tak, w przypadku implikacji otrzymujemy unikalne zdanie powstające w taki a nie inny sposób z każdej
określonej pary zdań: Jeżeli *A* i *B* to zdania, to *A → B* jest unikalną implikacją *powstającą z
tych dwóch zdań w tej kolejności*, czyli jest unikalnym obiektem *tego rodzaju*. Chodzi po prostu o
to, że jak już mamy jakieś dwa określone zdania *A* i *B*, to możemy z nich zrobić tylko jedną
implikację o postaci *A → B*. Podobnie dodawanie (*+*) to operacja na liczbach, która z dwóch
dowolnych, niekoniecznie różnych liczb, na przykład *2* i *2*, robi unikalną liczbę, w tym wypadku
*4*. Ten wynik jest w przyjętym znaczeniu unikalny, chociaż dodawanie nieskończenie wielu innych par
liczb (na przykład całkowitych) daje taki sam rezultat. Możemy też powiedzieć, że zdanie w postaci
implikacji jest *funkcją* uporządkowanej pary zdań. Uporządkowanej, bo liczy się, które zdanie
będzie traktowane jako poprzednik, a które jako następnik implikacji.

**Zalety maksymalnej formalności**: Wiem, że często piszę długie zdania. Tym razem jednak chociaż
przez chwilę robiłem to celowo. Chciałem w ten sposób zilustrować coś ważnego: Dzięki temu, że
posługujemy się prostymi symbolami na oznaczenie dowolnie złożonych zdań, możemy łatwiej zapanować
nad strukturą rozumowania w sytuacjach, w których bez takiego skrótowego zapisu moglibyśmy się łatwo
pogubić. Logika pozwala nam w ten sposób *w kontrolowany sposób ignorować treść*, *bez szkody dla
poprawności*. To też, to jest pewnego rodzaju "beztreściowość", mamy na myśli mówiąc o "formalności"
zapisu matematycznego. Wreszcie, formalny zapis ułatwia robienie czegoś, co jest ogromną siłą
matematyki - ułatwia a właściwie umożliwia rozwiązywanie zarówno prostych jak i złożonych problemów
*mechanicznie*, jakbyśmy układali puzzle albo grali w jakąś inną grę.

Coś takiego będziemy właśnie robić, w właściwie już zaczęliśmy to robić. Będziemy odtąd grać w grę
polegającą na konstruowaniu dowodów, bo będziemy *całkowicie* formalizować każdy problem. Będziemy
więc używać matematyki w sposób *bardziej* formalny niż ma to zwykle miejsce nawet w najbardziej
zaawansowanych podręcznikach do matematyki. Matematycy tak zwykle *nie* postępują, bo im się nie
chce i (zwykle) nie muszą; zamiast tego polegają na domyślności kompetentnego odbiorcy. My nie
chcemy się musieć niczego domyślać, bo nie jesteśmy tak kompetentni jak zawodowi
matematycy. Jesteśmy za to psychologami, a więc zarówno sami matematycy jak i wszystko, co robią,
należy do *przedmiotu naszych badań*.

Pełna formalizacja wymaga dodatkowego wysiłku, ale dzięki niej będzie nam często *łatwiej*. Przede
wszystkim zaś wszystko, co napiszemy, będzie *sprawdzone przez algorytm, który zawsze da nam
odpowiedź, czy to, co napisaliśmy, jest matematycznie poprawne*. Będziemy więc w pewnym sensie
"zawsze bezpieczni" w swoich sformalizowanych rozumowaniach i innych matematycznych eksperymentach.

Koszt, który musimy ponieść, żeby to osiągnąć, to częściowe oswojenie się z co prawda mniej złożonym
niż język polski, ale obcym, sztucznym, i bezlitośnie sztywnym językiem, jakim jest formalny język
matematyki. Tak jak to ma miejsce w przypadku nauki każdego nowego języka, trzeba się uzbroić w
cierpliwość (jeszcze chyba wspomnę o tej cierpliwości później).

Jest jak sądzę wiele prawdy w stwierdzeniu, którego autorem jest genialny polski matematyk [Jerzy
von Neumann](https://en.wikipedia.org/wiki/John_von_Neumann), że często matematykę się nie tyle
rozumie, ile raczej się do niej stopniowo *przyzwyczaja*. Dodam od siebie, że gdy się już trochę do
niej przyzwyczai (co wymaga czasu), to zadziwiająco często okazuje się, że jej pojęcia, twierdzenia
i teorie wyrażają coś, co rozumiało się dobrze już wcześniej, tylko nie umiało się o tym
dostatecznie *konsekwetnie* albo *spójnie mówić*, a więc również dostatecznie *jasno myśleć*.

## Pojęcie prawdy w logice konstruktywnej

Na koniec tego rozdziału wyjaśnię Ci jeszcze coś na temat dwóch najważniejszych dla nas logik, to
jest logiki konstruktywnej i klasycznej. Być może miałaś już do czynienia z elementami logiki
zdań. Jeżeli tak, to może to być teraz do pewnego stopnia *przeszkodą*, ponieważ logika zdań jest
najczęściej wykładana w wersji tak zwanej *klasycznej*, w której prawdą jest, że:

*Każde zdanie jest albo prawdziwe, albo fałszywe.*<br/>(zdanie prawdziwe w logice klasycznej)

Jak również:

*Dla każdego zdania P, jeżeli nieprawda, że nieprawda, że P, to P*. <br/>(inne zdanie prawdziwe w
logice klasycznej)

W Leanie domyślnie (można to łatwo zmienić, ale nie będziemy tego teraz robić) używamy logiki
*konstruktywnej*, inaczej *intuicjonistycznej*, a nie klasycznej. Ta logika jest "ostrożniejsza" w
tym znaczeniu, że wszystko, co jest prawdą w logice konstruktywnej, jest też prawdą w logice
klasycznej (o ostrożniejszych założeniach lub teoriach i o ogólniejszych pojęciach mówimy, że są
*słabsze*), ale nie odwrotnie. W logice konstruktywnej można przyjąć, że:

*Zdanie prawdziwe to to samo co zdanie udowodnione.*<br/>(dopuszczalna interpretacja prawdy w logice
konstruktywnej)

Co za różnica? Jeżeli postanowimy intepretować słowo "prawdziwe" jako równoznaczne z "udowodnione",
to *nie możemy* zaakceptować jako prawdziwego zdania *Każde zdanie jest albo prawdziwe, albo
fałszywe* (nazywanego m.in. [zasadą wyłączonego
środka](https://en.wikipedia.org/wiki/Law_of_excluded_middle)). Wiemy (istnieje twierdzenie, które o
tym mówi), że w matematyce da się skonstruować zdania prawdziwe, których nie da się udowodnić. Nie
możemy więc też zaakceptować zasady podwójnej negacji (jeżeli nieprawda, że nieprawda, że *p*, to
*p*), bo zasada wyłączonego środka z niej wynika (i vice versa). Jeżeli Cię to niepokoi, to
zapewniam, że logika klasyczna nieprędko będzie dla nas ważna, a gdy się taka stanie, będziesz na to
gotowa.

Żeby udowodnić w logice konstruktywnej implikację *A → B*, gdzie *A* i *B* to dowolne zdania, trzeba
*skontruować procedurę* (napisać program, albo stworzyć funkcję), która dowolny dowód zdania *A*
przekształca w dowód zdania *B*. 

Oto ogólna reguła dedukcji mówiąca o tym, w jaki sposób można *udowodnić implikację*:

Jeżeli *A* i *B* to zdania, to:

*A*
.  
.  
.  
<ins><em>B</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</ins>  
*A → B*

**Czytamy to**: W taki właśnie sposób często zapisujemy reguły dedukcji. Reguły dedukcji mówią,
jakie nowe kroki możemy wprowadzić do naszego dowodu w jakich warunkach. Ta reguła (wprowadzenia
implikacji) mówi, że jeżeli zakładając *A* (i być może przyjmując wcześniej inne założenia) uda Ci
się wyprowawadzić w jakikolwiek sposób (to oznaczają te kropki jedna pod drugą) *B*, to możesz
wprowadzić albo zaakceptować albo uznać za prawdziwe (na mocy wszystkich wcześniejszych założeń)
zdanie *A → B*. Mówiąc krótko: Jeżeli z *A* da się wyprowadzić *B*, to można zaapceptować zdanie *A
→ B*. Albo najkrócej po polsku: Jeżeli z *A* wynika *B*, to *A → B*.

W logice konstruktywnej *prawdziwe* znaczy to samo, co *ma (jakiś) dowód*. Dlatego ta reguła
dedukcji ma w tej logice taką a nie inną *interpretację*: *Jeżeli z dowod A można zrobić (w danym
kontekście) dowód B, to ten sposób jest dowodem A → B*.

Albo: Dowód *A → B* to dowolny sposób uzyskania dowodu *B* z dowolnego dowodu *A*.

Czy widzisz, że to jest ciągle ta sama reguła dedukcji, ale wydaje się zmieniać, bo zmieniamy
sposób, w jaki interpretujemy pojęcie prawdy (albo akceptacji zdania w dowodzie)?

Jeszcze raz: Dowód *A → B* to dowolny sposób uzyskania dowodu *B* z dowolnego dowodu *A*.

A przecież: Jeżeli `A` jest zdaniem, czyli termem typu `Prop`, to term typu `A` jest dowodem tego
zdania.

Wobec tego ...

```lean
def tautologia (A : Prop) : A → A := fun (h : A) => h
```

... jest dowodem tautologii *A → A* (jeżeli *A*, to *A*) dla każdego zdania *A*.

Jeszcze jedna uwaga na temat częstych, ale rzadko objaśnianych konwencji: Gdy matematycy nagle
zmieniają notację i wydaje się, że na to samo zamiast małych liter używają dużych, często chcą w ten
sposób zasugerować, że mają na myśli dowolnie złożone obiekty danego rodzaju. Tutaj zacząłem w
pewnem momencie oznaczać arbitralne zdania dużymi literami właśnie w tym celu - żeby zasygnalizować,
że może chodzić o jakieś zdania dowolnie złożone.

Przypominam na koniec fragment prozy matematycznej, który pojawił się w trzecim rozdziale:

> Jeżeli *n* i *m* to liczby naturalne, to *n + m = m + n*.

Czy widzisz, to samo można by zapisać w dosyć naturalny i czytelny sposób tak? (ilustracja) ...

```lean
def przemiennosc_dodawania (n : Nat) (m : Nat) : n + m = m + n := ...
```

... gdzie `n + m = m + n` to *zdanie parametryczne*? W Leanie to zdefiniowane już twierdzenie jest
dostępne jako wartość stałej `Nat.add_comm` (*comm* to skrót od angielskiego *commutativity*
oznaczającego przemienność).

Ponieważ matematyka to dla nas programowanie, to twierdzenia to funkcje, które możemy stosować tak
samo jak wszystkie inne funkcje:

```lean
-- Nad.add_comm to twierdzenie i jednocześnie funkcja dwuargumentowa, która z podanych argumentów tworzy dowód
-- szczególnej wersji zdania n + m = m + n, gdzie n i m to parametry. Widzimy poniżej, że aplikacja
-- Nad.add_comm 2 3 jest dowodem zdania 2 + 3 = 3 + 2:
#check Nat.add_comm 2 3 -- Nat.add_comm 2 3 : 2 + 3 = 3 + 2
```

### Przypisy

[^1]: Dawno, dawno temu byłem w Krakowie na koncercie zespołu
    [5’nizza](https://pl.wikipedia.org/wiki/5%E2%80%99nizza), na którym Serhij Babkin i Andriej
    Zaporożec wykonywali utwory z płyty [П'ятниця](https://www.youtube.com/watch?v=nnWMrmTWonI),
    której wtedy lubiłem czasem posłuchać. W pewnym momencie któryś z wykonawców wziął butelką i
    wtedy usłyszałem z sali krzyk "Nie pij tej wody!". Uważam, że to było bardzo śmieszne.
