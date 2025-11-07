<br>

**Moim zdaniem, najważniejsze wskazówki na temat tego, w jaki sposób warto czytać tą książkę, są
[tutaj](./Wujek_dobra_rada.md).**

<hr>

## O czym teraz będzie

Skorzystamy z tego, co już wiesz, żeby przejść możliwie płynnie ze "zwykłego" programowania do
dowodzenia twierdzeń (jako programowania!). Poprzednie rozdziały napisałem tłumacząc kilka razy na
różne sposoby poruszane tam kwestie i omawiając krok po kroku proces ewaluacji, ponieważ próbowałem
do pewnego stopnia wyręczyć Cię w roli kogoś, kto uczy się przyswajanych treści *aktywnie*. Odtąd
jednak będę to robił rzadziej, bo nadal wyręczając Cię w tej roli utrudniłbym Ci zmianę postawy na
taką, która moim zdaniem nie tylko później Ci się przyda, ale która mogłaby Ci też dostarczyć sporo
satysfakcji. Ale bez obaw, będę się nadal nieustannie starał, żeby ten proces przebiegał (względnie)
bezboleśnie.

<hr>

# Konstruowanie termów w trybie interaktywnym

Przypominam znaną Ci już uogólnioną `identycznosc` (ilustracja):

```lean
def identycznosc (typ : Type) (argument : typ) := argument
```

Ta funkcja jest prostym programem komputerowym, który dla dowolnego typu i argumentu o tym typie
zwraca ten argument. Jak wiesz, widoczny wyżej, wygodny sposób zapisywania parametrów tak naprawdę
skrywa *dwie* λ-abstrakcje:

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

-- To są takie same funkcje, albo to jest jedna i ta sama funkcja (jako funkcja). W szczególności,
-- te trzy funkcje mają ten sam typ ...
#check @identycznosc   -- identycznosc   : (typ : Type) → typ → typ
#check @identycznosc'  -- identycznosc'  : (typ : Type) → typ → typ
#check @identycznosc'' -- identycznosc'' : (typ : Type) → typ → typ

-- ... i zwracają te same wartości dla tych samych argumentów, na przykład:
#eval identycznosc   Nat 1 -- 1
#eval identycznosc'  Nat 1 -- 1
#eval identycznosc'' Nat 1 -- 1

-- Możemy też formalnie udowodnić, że to jest jedna i ta sama funkcja, ale do tego celu musimy
-- wykorzystać elementy języka Lean, które wprowadzę znacznie później, dlatego to na razie tylko
-- ilustracja. Zwracam przy okazji uwagę, że również w pełni sformalizowane dowody mogą być krótkie
-- i proste.
example : identycznosc  = identycznosc'  := by rfl
example : identycznosc' = identycznosc'' := by rfl
-- Ponieważ Lean nie zgłasza błędu, wiemy, że te dowody są poprawne, a ponieważ relacja równości
-- jest przechodnia (jeżeli A = B i B = C to A = C), to identycznosc = identycznosc''.
```

Do tej pory tworzyliśmy definicje pisząc wprost odpowiedni kod w języku teorii typów, albo "w
kodzie". Teraz będziemy tworzyć definicje termów *o z góry określonych typach* w trybie
*interaktywnym*. W tym celu najpierw *określamy typ* konstruowanego termu, a następnie w miejscu, w
którym mamy skonstruować ten term, czyli poprawne wyrażenie określonego wcześniej typu, wpisujemy
słowo kluczowe `by` (czyli *za pomocą* albo *na sposób*). Słowo kluczowe `by` nie należy do języka
teorii typów, tylko do dostępnego w Leanie rozszerzenia tego języka, służącego do konstruowania
termów za pomocą tak zwanych *taktyk*. Taktyki to metody służące przede wszystkim (ale nie tylko) do
konstruowania termów będących *dowodami*, a więc do konstruowania termów typów zdaniowych (o czym za
chwilę).

Wrócimy teraz do prostszej identyczności, która działa tylko dla liczb naturalnych, i poznamy dwie
ważne taktyki - `intro` i `exact`. Okaże się, że te taktyki służą do czegoś, co umiesz już wyrazić w
kodzie bez nich.

Taktyka `intro` tworzy (w tle) sam *początek* λ-abstrakcji, to jest samą część `fun
(<jakis_parametr> : <jakis_typ>) =>`. Jeżeli skopiujesz poniższy fragment kodu ...

```lean
def nic_nie_robie : Nat → Nat := by
    -- ... i umieścisz kursor w następnej linii ...
```

... to w panelu po prawej pod zakładaką *Tactic state* zobaczysz ...

```lean
---  ... krótki opis tego, co zostało do skonstruowania, ...
1 goal
⊢ Nat → Nat
```

... a słowo `by` będzie podkreślone na czerwono. Zobaczysz też czerwoną falkę pod linią z
komentarzem, bo ta definicja nie jest jeszcze zakończona. Można więc powiedzieć, że to nie błąd,
tylko sygnał, że masz coś do zrobienia.

**Czytamy to**: Pozostał jeden cel do zrealizowania (`1 goal`). Tym celem jest (`⊢`) stworzenie
(jakiegokolwiek) termu typu `Nat → Nat`. Powyżej symbolu derywacji (albo wnioskowania, albo
konstrukcji, albo wyprowadzania) `⊢`, a poniżej komunikatu `1 goal` widać aktualny *kontekst* (w
teorii typów to słowo jest terminem technicznym), w którym w tym momencie jeszcze nic nie ma,
dlatego widzisz tylko te dwie linie.

Jak wiesz, funkcja anonimowa `fun (n : Nat) => n` jest termem typu `Nat → Nat`, ponieważ jest
(trywialną, bo identycznościową) funkcją posyłającą liczby naturalne w liczby naturalne. Wpisując
teraz poniżej komentarza instrukcję `intro n` i naciskając klawisz Enter sprawisz, że kontekst
zmieni się z pustego na taki, w którym masz do dyspozycji jakąś (czyli arbitralną albo bliżej
nieokreśloną) liczbę naturalną o nazwie `n`, czyli `n : Nat`. To daje taki sam efekt jak dołożenie
parametru `(n : Nat)` do definiowanej funkcji - gdy definiowana funkcja ma taki parametr, *wewnątrz
jej ciała* widać `n : Nat` właśnie jako element kontekstu, to jest jako jedną z dostępnych
*lokalnie*, bo *tylko* w ciele funkcji, deklaracji zmiennych. Można też powiedzieć (i myśleć), że
kontekst to wszystkie widoczne w danym miejscu w kodzie (typowane) "wejścia wirtualnych przewodów".

Zastosowanie taktyki `intro` z argumentem `n` jest więc tym samym, co rozpoczęcie tworzenia kodu
funkcji anonimowej `fun (n : Nat) => ...`. Rezultat zastosowania w ten sposób taktyki `intro` można
również opisać tak: Niech `n` będzie termem typu `Nat`, albo krócej - niech `n : Nat`. Albo tak:
Wprowadzam (`intro` to skrót od *introduction*) do kontekstu `n` typu `Nat`, bo taki (to jest `Nat`)
jest "typ początkowy" w typie-celu `Nat → Nat` (to już nie jest część sposobu czytania tej
instrukcji, tylko powód jej użycia). Właśnie dlatego, że przed zastosowaniem `intro` cel to `Nat →
Nat`, wystarczy, że powiemy taktyce `intro`, żeby wprowadziła do kontekstu zmienną `n`. Nie musimy
wtedy podawać jej typu, bo skoro taktyka `intro` "odrywa" źrodło typu strzałkowego będącego celem,
to Lean może się domyślić, że `n` musi być zmienną o typie `Nat`.

Ponieważ (niesamodzielna, bo samo `fun (n : Nat) =>` to jeszcze nie poprawny term, ale nic nie
szkodzi, zaraz to zmienimy) część termu, który miałaś skonstruować, już powstała, to cel uległ
zmianie. W panelu po prawej widać teraz, że (nowym) celem jest skonstruowanie prostszego termu typu
`Nat`, a nie jak wcześniej `Nat → Nat`. Jak już wiesz, ta zmiana celu nastąpiła, ponieważ stosując
taktykę `intro` tak jakby oderwałaś początkową część typu `Nat → Nat` i wprowadziłaś ją do
kontekstu, czyli nadałaś jej status (określenia typu) parametru konstruowanej funkcji. Albo
stworzyłaś "wejście wirtualnego przewodu" (typu `Nat`) i pozostało Ci już tylko skonstruowanie termu
mającego typ wyjścia, czyli termu typu `Nat`.

W tym momencie możesz skorzystać z taktyki `exact`, która służy do *konstrukcji* termu o docelowym
typie *wprost*, poprzez podanie termu, który ma ten typ. Żeby użyć tej taktyki, jako jej argument
musisz podać - wszystko jedno, czy prosty, czy złożony - term, który ma *typ będący celem*. W tym
momencie dysponujesz właśnie takim termem, jest nim przecież term `n : Nat`, który masz w
kontekście. A mówiąc inaczej, masz już taki "wirtualny przewód". Nie jest to żaden *konkretny* term
typu `Nat`, taki jak na przykład `333`, tylko (lokalny) *sposób konstrukcji* termu tego typu (z
dowolnego argumentu aplikacji tej funkcji). Wystarczy więc napisać w następnej linii poniżej `intro
n` instrukcję `exact n` i nacisnąć Enter.

Nie ma już żadnych celów do zrealizowania, co można rozpoznać po tym, że gdy kursor znajduje się za
komendą `exact n`, w panelu po prawej widać stan `No goals`. A więc proces interaktywnej konstrukcji
termu o z góry podanym typie (tutaj `Nat → Nat`) zakończył się sukcesem.

To wszystko może się w tym momencie wydawać niepotrzebnie skomplikowane, skoro równie dobrze można
było napisać ...

```laen
def nic_nie_robie (n : Nat) := n
```

... ale później interaktywne konstruowanie termów okaże się bardzo pomocne. Można powiedzieć, że
tryb interaktywny to wygodny sposób odciążenia Twojej [*pamięci
operacyjnej*](https://pl.wikipedia.org/wiki/Pami%C4%99%C4%87_operacyjna), ponieważ Lean dostarcza Ci
wtedy, *w trakcie procesu konstruowania* termu jednoznaczne informacje na temat tego, co jeszcze
zostało do skonstruowania i czym w danym momencie dysponujesz. W przypadku definiowania prostych
funkcji, takich jak `nic_nie_robie`, to jest zbędne, ale w przypadku konstruowania termów bardziej
złożonych, szczególnie zaś bardziej złożonych *dowodów*, taka pomoc bardzo się przydaje, a poza tym
sprawia, że uprawianie matematyki - również teoretycznej - jeszcze bardziej przypomina *grę*, którą
zresztą w pewnym sensie jest.

**Polecenie**: Spróbuj stworzyć w trybie interaktywnym definicję *uogólnionej* identyczności
uzupełniając poniższy kod. Zwróć uwagę, że ponieważ ta definicja ma dwa parametry - `(typ : Type)` i
`(argument : typ)` - i oba są zapisane *przed* głównym drukropkiem, to oba są od razu widoczne w
kontekście, to jest powyżej symbolu derywacji `⊢`, jako coś, co ("wirtualnie", bo to tylko wejścia,
które "czekają" na odpowiednie argumenty) masz, a więc czego nie musisz nazywać i wprowadzać do
kontekstu za pomocą `intro`. W tym momencie Twoim celem jest stworzenie jakiegokolwiek termu typu
`typ`, a ponieważ w tym akurat miejscu w kodzie masz już taki ("wirtualny") term, wystarczy
zastosować taktykę `exact` z odpowiednim argumentem i nacisnąć Enter. Wtedy zobaczysz, że nie ma już
celów, co będzie znaczyło, że proces interaktywnej konstrukcji definicji tej funkcji został
zakończony.

```lean
def identycznosc (typ : Type) (argument : typ) : typ := by
    -- Umieść kursor w następnej linii.
```

Teraz skonstruujemy taką samą, bo tak samo działającą (a więc też *tą samą*, bo o tożsamości funkcji
decyduje jej sposób działania) funkcję, ale przestawimy główny dwukropek o jedno miejsce w lewo.
Czyli tylko inaczej ją zapiszemy. Tym razem trzeba będzie za pomocą `intro` z odpowiednim argumentem
stworzyć *jedną* λ-abstrakcję i zrealizować jeden cel.

**Polecenie**: Opierając się na wcześniejszych wyjaśnieniach na temat roli parametrów zapisanych
przed głównym dwukropkiem (wyręczają Cię w konstruowaniu λ-abstrakcji, pamiętasz?), dokończ w trybie
interaktywnym następującą definicję ...

```lean
--- ... uogólnionej identyczności:
def identycznosc' (typ : Type) : (argument : typ) → typ := by
```

Gdy wykonywałaś to polecenie argument taktyki `intro`, czyli nazwa parametru konstruowanej
λ-abstrakcji, mógł Ci się wydawać zbędny, skoro ta nazwa (`argument`) jest już jawnie podana w
specyfikacji typu konstruowanego termu jako `(argument : typ)` *po* głównym dwukropku. Niestety,
samo wpisanie taktyki `intro`, bez podania nazwy (jako *jej* argumentu), w tym przypadku nie
wystarczy. Możesz jednak wybrać *inną* niż `argument` nazwę dla parametru konstruowanej funkcji, na
przykład jakąś krótszą, ponieważ *nazwy parametrów nie mają znaczenia*, a nie mają, bo parametry
pełnią tylko rolę zaimków (albo "wirtualnych wejść" \{a *zmienne* to lokalne wystąpienia tych samych
nazw pełniące rolę podłączonych do tych wejść "portów"\}).

Jeśli masz ochotę, usuń kod kończący definicję i zastosuj najpierw taktykę `intro` z inną nazwą, po
czym zastosuj taktykę `exact` z jedynym argumentem, który - biorąc pod uwagę, co będziesz mieć wtedy
w kontekście - zakończy konstrukcję definicji. Przekonasz się w ten sposób, że nie musisz używać dla
parametru tej samej nazwy, która występuje w specyfikacji typu (inaczej w sygnaturze funkcji). A nie
musisz, ponieważ nazwa parametru jest własnością *samej λ-abstrakcji*. Dlatego to również jest
poprawna definicja:

```lean
def identycznosc (typ : Type) : (argument : typ) → typ :=
  fun (nazwa_jak_kazda_inna_tylko_troche_dluga : typ) =>
    nazwa_jak_kazda_inna_tylko_troche_dluga
```


**Polecenie**: Dokończ poniższą definicję w trybie interaktywnym używając kombinacji taktyk `intro`
i `exact`. Przede wszystkim **nie bój się eksperymentować**. Każdej próbie będą przecież
towarzyszyły informacje zwrotne w panelu po prawej, z których zawsze możesz korzystać jako ze
wskazówek na temat tego, co powodują wprowadzane fragmenty kodu. Zwracaj uwagę na aktualny cel i
pamiętaj, że `intro` z odpowiednim argumentem jakby "odrywa i wrzuca na górę" początkową część celu,
gdy cel ma typ funkcyjny (czyli strzałkowy).

```lean
def identycznosc'' : (typ : Type) → (argument : typ) → typ := by
    -- Umieść kursor w następnej linii.
```

**Polecenie**: Dokończ definicję używając trybu interaktywnego. Zwróć uwagę, że Twoim celem jest tym
razem skontruowanie termu typu `Nat`, a nie termu typu funkcyjnego, nie masz więc tworzyć od podstaw
λ-abstrakcji. Być może jedyna trudność, jaka może się pojawić w tym zadaniu, to przywiązanie do
określonego sposobu stosowania taktyki `exact`. Argumentem tej taktyki, tak jak zresztą każdej
innej, nie musi być pojedyncza stała, to może być również dowolny term *złożony*. Nawiasem mówiąc,
taktyki to też programy/funkcje, ale nie *funkcyjne*, czyli "czysto matematyczne", tylko
*imperatywne*, bo *wpływają na stan czegoś "na zewnątrz"* (stan dowodu).

```lean
-- Używając taktyki `exact` dokończ definicję w trybie interaktywnym tak, żeby funkcja `dodaj2`
-- dodawała do swojego jedynego parametru liczbę `2`.
def dodaj2 (n : Nat) : Nat := by
```

**Polecenie**: A teraz dokończ definicję tej samej funkcji, ale nie korzystając z tego, że podanie
parametru przed głównym dwukropkiem wyręcza Cię w konstruowaniu λ-abstrakcji:

```lean
-- Dokończ definicję w trybie interaktywnym. Trzeba będzie zastosować taktykę `exact` do termu złożonego.
def dodaj2' : Nat → Nat := by
```

**Polecenie**: Teraz będziesz robić to samo, ale konstruowana funkcja będzie *dwu*argumentowa.

```lean
-- Dokończ definicję w trybie interaktywnym.
def suma (n : Nat) (m : Nat) : Nat := by
```

```lean
-- Dokończ definicję w trybie interaktywnym. Ponieważ tym razem trzeba samodzielnie stworzyć λ-abstrakcję,
-- konieczne będzie zastosowanie taktyki `intro`.
def suma' (n : Nat) : Nat → Nat := by
```

```lean
-- Dokończ definicję w trybie interaktywnym. Możesz zastosować dwukrotnie taktykę `intro`, albo możesz użyć
-- jej tylko *raz*, podając od razu *dwie* nazwy dla parametrów konstruowanej λ-abstrakcji.
def suma'' : Nat → Nat → Nat := by
```

## Hierarchia typów w Leanie

Co prawda [można](https://doi.org/10.1017/CBO9781139567725) się bez tego obejść, ale tak się składa,
że w wersji teorii typów, której używamy w Leanie i innych podobnych asystentach dowodzenia *każdy
typ*, na przykład typy `Nat` i `Type`, *jest również termem*, ale *typu ogólniejszego*, inaczej
*wyższego o jeden stopień*. Na przykład, typ `Type` ma typ `Type 1`, a więc `Type` jest nie tylko
typem, ale również termem wyższego od niego typu `Type 1`, i tak samo `Type 1` jest typem, ale
również termem, który ma typ `Type 2`, i tak w nieskończoność[^1]:

```lean
-- `2` to tylko "zwykły" term, to jest taki, który nie jest typem. Czasami myślę o takich termach, że 
-- są "na dnie", albo że są "zwarte", "konkretne", lub "materialne":
#check 2 -- `2 : Nat`

-- `Nat` to typ i jednocześnie term ogólniejszego typu, który nazywa się `Type`. Chciałoby się zapisać:
-- `2 : Nat : Type`
-- ale Lean nie pozwala na taką notację. `Type` to tak naprawdę `Type 0`, ale ponieważ typ `Type 0` pojawia
-- się bardzo często, Lean pozwala zapisywać go w taki skrótowy sposób i tak też go wyświetla.
#check Nat -- `Nat : Type`, a "tak naprawdę" `Nat : Type 0`

-- `Type` (czyli `Type 0`) to typ i jednocześnie term ogólniejszego albo wyższego typu `Type 1`:
#check Type     -- `Type   : Type 1`
-- I tak dalej ...
#check Type 1   -- `Type 1 : Type 2`
#check Type 2   -- `Type 2 : Type 3`
-- ...
#check Type 665 -- Nigdy nie umieszczaj kursora na tej linii! I nie pij tej wody!!

-- A pisząc w sposób, którego Lean nie akceptuje:
-- `2 : Nat : Type : Type 1 : Type 2 : Type 3 : Type 4`, i tak dalej ...
```

Jedyne, co potrzebujesz w tym momencie wiedzieć o typach wyższego rzędu, to że po prostu gdzieś tam
*są*. A przy okazji, ...

```lean
-- ... w ten sposób możemy zapytać: Czy dobrze mi się wydaje, że term `Type 1` ma typ `Type 2`?
#check (Type 1 : Type 2)
-- Odpowiedź Leana - `Type 1 : Type 2` - czytamy: Term `Type 1` ma typ `Type 2`.

-- A czy `2` ma typ `String`?
#check (2 : String) -- pojawia się czerwona falka, a więc `2` nie ma typu `String`.
-- Lean podkreśla `2` na czerwono i podaje długi i trudny do zrozumienia komunikat o błędzie.

-- Relacja bycia-termem-typu *nie* jest przechodnia:
#check (Type 1 : Type 3) -- to typowanie jest błędne
```

Typy wyższych rzędów są potrzebne *tylko* z pewnych nudnawych powodów technicznych i rzadko, o ile w
ogóle, będą nas interesować. Może słyszałaś o paradoksie albo [antynomii
Russella](https://pl.wikipedia.org/wiki/Antynomia_Russella)? Fryzjer, który goli tych i tylko tych
mieszkańców, którzy akurat stoją na jednej nodze, ale niekoniecznie swojej, dlatego musi być tym
bardziej ostrożny, gdy używa brzytwy, bo jak ich goli, to... Może lepiej pomińmy szczegóły.

## Zdania jako typy (zdaniowe), termy typów zdaniowych jako dowody tych zdań

Lean ma również wbudowany typ `Prop`, który będzie odtąd dla nas ważny. To jest typ wyższego rzędu,
podobnie jak na przykład `Type 1`, co znaczy, że *termy* typu `Prop` same *są typami*, ale typ
`Prop` zachowuje się inaczej niż wszystkie typy `Type n` (gdzie `n` to dowolna liczba naturalna).
Napjpierw pokażę Ci, że typ `Prop` jest odgałęzieniem hierarchii typów Leana:

```lean
#check Prop -- `Prop : Type`

-- Komenda `variable` służy do deklarowania, że mamy ("skądś") *jakiś* (a więc bliżej nieokreślony) term 
-- danego typu. Można to czytać tak: *Gdybyśmy* mieli jakiś term `cos_pod_typem_Prop` typu `Prop`. Ale ja
-- wolę o tym myśleć jako o *tworzeniu "wirtualnego przewodu" albo "wirtualnego wejścia"*.
variable (cos_pod_typem_Prop : Prop)

-- `cos_pod_typem_Prop` jest (w tym *kontekście* {na mocy deklaracji `variable`}) zarazem termem
-- (typu `Prop`) i typem, dlatego możemy zapisać również taką deklarację:
variable (jakis_term : cos_pod_typem_Prop)

-- Typ `Nat` jest termem typu `Type` tak samo jak typ `Prop` ...
#check Nat -- `Nat : Type`
-- ... ale zachowuje się inaczej, bo termy typu `Nat` ...
#check 2   -- `2 : Nat`
-- ... nie są typami: Lean sygnalizuje niżej błąd, ponieważ `2` nie jest typem, to *tylko* term. Widzimy więc,
-- że chociaż `Prop : Type` i `Nat : Type`, to `Prop` i `Nat` "działają" inaczej.
variable (cos_pod_2 : 2)

-- Tutaj również pojawia się błąd, bo term typu, który sam ma typ `Prop`, nie jest już typem ("mieszka na dnie").
variable (nizszy_term : jakis_term)
```

<hr>

### Komenda `variable`

O komendzie `variable` można myśleć, że służy do tworzenia "luźnych przewodów" (albo "automatycznych
parametrów"). To pozwala na pisanie (czasem znacznie) krótszego i (czasem znacznie) bardziej
czytelnego kodu. Na przykład, pisząc `variable (n : Nat)` mówimy Leanowi, że jeśli odtąd pojawi się
nazwa `n` i między tą deklaracją `variable (n : Nat)` a tym wystąpieniem nazwy `n` nie będzie innego
fragmentu kodu, który określałby, co ma w tym miejscu oznaczać `n`, to `n` będzie parametrem typu
`Nat`. Dlatego:

```lean
variable (n : Nat)

-- Idąc w górę od tego miejsca w kodzie pierwsza informacja, czym może być `n`, mówi, że parametrem
-- (bo zmienną, ang. variable), dlatego `dodaj3` musi być funkcją o parametrze typu `Nat`.
def dodaj3 := n + 3
#check dodaj3 -- `dodaj3 (n : Nat) : Nat`
-- Stała `dodaj3` musi oznaczać funkcję, bo w ciele definicji tej stałej występuje zmienna, dlatego
-- Lean domyślił się o co chodziło w zapisanej wyżej zwięzłej definicji.

-- To jest błąd, bo funkcja dodawania nie akceptuje wartości tekstowych, ...
def dodaj4 (n : String) := n + 4
variable (n : String)
-- ... ale mimo deklaracji, że `n` ma być zmienną typu `String`, poniższa definicja jest poprawna, bo
-- idąc od wyrażenia `n + 5` w górę (a właściwie na początku w lewo) Lean znajduje informację, że `n`
-- jest zmienną typu `Nat` i przez to nie uwzględnia już wcześniejszej deklaracji.
def dodaj5 (n : Nat) := n + 5

-- Definicja `dodaj3` jest z pewnością krótsza, niż definicja `dodaj4`, chociaż w tym wypadku nie jest jasne,
-- czy jest też bardziej czytelna.
```

Instrukcję `variable (n : Nat)` **czytamy** więc **jako**: Jeżeli odtąd użyję do czegoś nazwy `n` i
w międzyczasie nie napiszę nic nowego, co określałoby rolę tej nazwy, to będzie mi chodziło o to, że
`n` ma być zmienną, a więc również parametrem otaczającej funkcji.

<hr>

Jak się właśnie przekonałaś, "zaraz pod" typem `Type` (czyli `Type 0`) mamy typ `Nat` i wiele
innych, ale "zaraz pod" typem `Nat` mamy już tylko termy, które *nie* są typami. Chociaż typ `Prop`
też jest bezpośrednio pod *tym samym* typem (`Type`) co `Nat`, to jednak "ma pod sobą" *typy* (czyli
termy będące typami). Oficjalnie mówimy też, że typ `Prop` *zamieszkują* typy (a typu `Nat` *nie*
zamieszkują typy).

Nazwa typu `Prop` jest skrótem od angielskiego słowa *Proposition* oznaczającego *zdanie*,
*stwierdzenie*, albo *sąd*. Typ `Prop` będzie dla nas ważny, ponieważ tak jak dowolne pary liczb
rzeczywistych można dzięki układowi współrzędnych konsekwentnie interpretować jako punkty na
płaszczyźnie, tak dzięki odpowiedniości Curry'ego-Howarda (będące typami) termy typu `Prop` można
konsekwentnie interpretować jako formalne lub abstrakcyjne zdania:

*Termy typu `Prop` to typy, które można konsekwentnie interpretować jako zdania*.

Dlatego termy typu `Prop` będę odtąd często nazywał po prostu zdaniami. Ponieważ `Prop` jest typem
wyższego rzędu, w teorii typów *zdania są typami*, dlatego zdania będę nazywał też czasem *typami
zdaniowymi*, a typ `Prop` będę nazywał czasem *typem zdań*. Będziesz się również stopniowo
przyzwyczała do tego, że:

*Termy danego typu zdaniowego można konsekwentnie interpretować jako dowody tego typu zdaniowego,
czyli jako dowody tego zdania*.

Można powiedzieć, że *w języku teorii typów teorie zapisujemy w typach* (w tym również, jak później
zobaczymy, w samodzielnie zdefiniowanych *typach danych*). Dowody, które są termami (typów
zdaniowych), będą nam służyły tylko do tego, żeby upewnić się, jakie zdania w języku konstruowanych
teorii albo teorii wbudowanej w Leana faktycznie wynikają z aksjomatów. Być może będzie Ci
najłatwiej przyzwyczaić się do tego stopniowo, wielokrotnie grając w grę polegającą na dowodzeniu
twierdzeń.

## Pierwsze twierdzenie jako funkcja

**Polecenie**: Dokończ definicję w trybie interaktywnym używając tak jak wcześniej taktyk `intro` i
`exact`. Jedyna trudność, jaka może się tutaj pojawić, to fakt, że pierwszy raz używasz typu `Prop`.
Jednak w tym przypadku liczy się tylko to, że `Prop` to pewien typ (a `zdanie` jest pewnym
parametrem funkcji `twierdzenie`).

```lean
def twierdzenie (zdanie : Prop) : zdanie → zdanie := by
```

**Polecenie**: Dokończ tą samą definicję jeszcze raz, ale tym razem nie używając trybu
interaktywnego. Trzeba będzie usunąć kod, który przed chwilą napisałaś, i trzeba będzie usunać też
słowo kluczowe `by`. Albo napisz tą definicję od nowa, ale używając innej nazwy dla definiowanej
stałej. Potraktuj `Prop` jakby to był typ jak każdy inny, i dokończ definicję tak, jakby to była
funkcja identycznościowa (ale działająca tylko dla termów typu `Prop`). Bo to jest funkcja
identycznościowa (dla typu `Prop`). I to jest też *dowód pewnego twierdzenia*. Przypuszczam, że
*wykonanie* tego zadania będzie dla Ciebie w tym momencie łatwe, nawet jeśli *zrozumienie podanej
interpretacji*, czy może raczej *pogodzenie się z nią*, będzie (jeszcze) niemożliwe.

Jeżeli udało Ci się wykonać ostatnie polecenie, to właśnie na dwa sposoby *całkowicie formalnie
udowodniłaś twierdzenie matematyczne*! Mówiąc dokładniej, udowodniłaś (w dodatku od razu
*parametryczną*) tautologię *Jeżeli A, to A*, gdzie *A* to jakieś zdanie (czyli dla każdego zdania
*A* - to jest ta parametryczność).

Ponieważ każde zdanie jest typem (typu `Prop`), a każdy term typu zdaniowego jest dowodem tego
zdania, to ten sam dowód można jednocześnie skonstruować i sprawdzić również tak (ale nie przejmuj
się, jeżeli na przykład symbol `∀` budzi Twój niepokój, bo jeszcze do tego wrócimy):
 
```lean
-- Lean nie zgłasza błędu, a więc term `(fun (A : Prop) => (fun (dowod : A) => dowod)` ma podany tutaj 
-- jawnie typ `∀ A : Prop, A → A`, czyli ten term jest dowodem tego zdania, ...
#check ((fun (A : Prop) => (fun (dowod : A) => dowod) : (∀ A : Prop, A → A)))

-- ... bo też typ `∀ A : Prop, A → A` jest termem typu `Prop`, a więc zdaniem:
#check ∀ A : Prop, A → A -- `∀ (A : Prop), A → A : Prop`

-- Typ (i jednocześnie zdanie) `(∀ A : Prop, A → A)` *czytamy jako*:
--
-- Dla każdego zdania `A`, z (prawdziwości) `A` wynika (prawdziwość) `A`.
--
-- Co w logice konstruktywnej znaczy:
--
-- Dla każdego zdania `A`, z każdego dowodu `A` można zrobić dowód `A`.
--
-- Podany wyżej term jest właśnie (konstruktywnym) dowodem, że tak jest, bo ten term jest *funkcją*,
-- która coś takiego *robi*, to jest będąc poprawną konstrukcją podanego typu "pokazuje swoim istnieniem",
-- że to można zrobić.
```

# Pojęciowy zawrót głowy

Pamiętasz moje uwagi na temat układu kartezjańskiego i innych izomorfizmów? Tego rodzaju izomorfizmy
mogą się na początku wydawać obce, ale przełączając się przez pewien czas regularnie między punktami
widzenia, które odpowiadają ich stronom, możemy zacząć postrzegać pewne rzeczy w nowy sposób, a
później mogą się nawet pojawić trudności w oddzieleniu odpowiadających tym stronom punktów widzenia.
Dzięki temu możemy zacząć w nowy sposób myśleć, a z kolei dzięki temu czasem lepiej sobie radzić z
rozwiązywaniem pewnego rodzaju problemów, bo przecież co dwa punkty widzenia to nie jeden, zwłaszcza
gdy te punkty widzenia przywołują inne skojarzenia i są dobrze dopasowane.

Żeby "zanurzyć się" w izomorfizmie Curry'ego-Howarda trzeba *stopniowo* opanować sztukę *w miarę*
konsekwentnego *odróżniania*:

1. Dowolnych zdań *jako takich*, a więc niekoniecznie prawdziwych, od...

2. *Prawdziwości lub fałszywości* zdań, a tego z kolei od...

3. Ewentualnego *faktu*, że jakieś zdanie (albo jego negacja) *ma dowód*, wreszcie...

4. *Założenia*, że jakieś zdanie ma *jakiś* dowód, od *konkretnego kodu* albo *konstrukcji* dowodu.

*Zdanie* może być *prawdziwe* lub *fałszywe*. Jeżeli jest prawdziwe, to może, ale nie musi *istnieć
dowód* tej prawdziwości. Jeżeli istnieje, to możemy, ale nie musimy go *znać* (albo mieć). A więc
posiadanie lub znajomość dowodu jakiegoś zdania to jakby najmocniejszy rodzaj prawdziwości, sam fakt
istnienia dowodu to jakby słabszy rodzaj prawdziwości, a samo założenie, że jakieś zdanie jest
prawdziwe, to jakby najsłabszy rodzaj prawdziwości.

W szczególności, w dopiero co udowodnionym przez Ciebie twierdzeniu `twierdzenie : (zdanie : Prop) →
zdanie → zdanie` parametr `zdanie` reprezentuje *jakieś*, czyli bliżej nieokreślone zdanie, a typ
`zdanie → zdanie` to typ termów typu zdaniowego (bo jeżeli `zdanie` ma typ `Prop`, czyli jest jakimś
zdaniem, to `zdanie → zdanie` jest również zdaniem/ma typ `Prop`). Ciało definicji stałej
`twierdzenie` jest termem typu `zdanie → zdanie`, a więc jest dowodem tego (parametrycznego)
zdania. Ponieważ Lean nie zasygnalizował błędu, wiemy, że 1. to jest poprawne (składniowo) zdanie,
2. skonstruowany kod jest poprawnym kodem, który w dodatku 3. jest dowodem tego zdania, bo jest
termem tego typu zdaniowego, i że wobec tego to zdanie jest prawdziwe (w takim jakby najmocniejszym
tego słowa znaczeniu.

W tym momencie to, że to nie są te same rzeczy, może Ci się wydawać zrozumiałe a może nawet nie
warte objaśniania, ale przypuszczam, że te fundamentalne rozróżnienia będą Ci na początku sprawiały
trudności nawet w stosunkowo prostych sytuacjach. Dlatego przypominam jeszcze raz - oswojenie się z
tym wszystkim jest przede wszystkim kwestią *czasu* (i przerw! \{i kontrolowania frustracji,
zmęczenia i nudy\}).

Oswajanie się z nieznanymi wcześniej fragmentami matematyki może przypominać ... wykształcanie się
[skrzel](https://pl.wikipedia.org/wiki/Skrzela_(anatomia)). Na początku czujemy, że zanurzamy się w
nowym, obcym (pojęciowym) środowisku, w którym nie jesteśmy w stanie przebywać zbyt długo i w którym
szybko się męczymy. To jest więc trochę tak, jakbyśmy się znaleźli pod powierzchnią wody. Wtedy nie
umieramy co prawda od razu, ale nie jesteśmy też w stanie tak długo wytrzymać. Jednak z czasem,
jeżeli tylko będziemy nadal wracać do tego początkowo nowego dla nas środowiska, po przerwach - w
których możemy normalnie oddychać, odzyskujemy siły i nabywamy jakiś adaptacji - będzie się ono dla
nas stawało coraz bardziej znajome i naturalne. Aż w końcu wykształcimy coś w rodzaju mentalnego
organu, którego wcześniej nie było, a dzięki któremu będziemy w stanie coraz dłużej oddychać w
nieprzyjaznej atmosferze ekstremalnej, wieloaspektowej i wielorako splątanej abstrakcji. W ten
sposób uczymy się nowych wyspecjalizowanych języków, a wraz z nimi nowych, uniwersalnych sposobów
swobodnego i konsekwentnego myślenia niemal o czymkolwiek, które oferuje współczesna matematyka.

To wyjątkowo długi rozdział, a to miejsce jest blisko jego środka, dlatego przypominam o przerwach!

## Implikacje jako funkcje

Implikacja jest najważniejszym spójnikiem w logice. Mówiąc luźno, implikacjami nazywamy zdania o
postaci *Jeżeli A, to B*, gdzie *A* i *B* to *dowolne* zdania, proste lub złożone (i tylko same
zdania, a nie ich prawdziwość czy fałszywość, albo fakt bycia dowiedzionym, albo ich dowody).
Implikacje zapisujemy formalnie za pomocą strzałki skierowanej w prawo: *→* (w literaturze często
spotykamy też między innymi symbol *⇒*). Wygląda znajomo?

Jeżeli *A* i *B* to zdania - i tylko wtedy - to formalnie, czyli w "oficjalnym" języku matematyki,
implikację *Jeżeli A, to B* zapisujemy zwykle jako *A → B*. Nic? Żadnych skojarzeń?

<hr>

**Terminologia logiczna**: Mówiąc krótko, jeżeli *A* i *B* to zdania, to *A → B* to zdanie, które
czytamy jako *Jeżeli A, to B*. A mówiąc trochę dłużej: Zawsze, gdy mamy jakieś dwa, niekoniecznie
różne zdania *A* i *B*, możemy napisać *A → B* i to będzie [*formuła
logiczna*](https://pl.wikipedia.org/wiki/Formu%C5%82a_logiczna), którą interpretujemy jako
niekoniecznie prawdziwe, ani tym bardziej udowodnione zdanie *Jeżeli A, to B*. Mówimy też, że *→* to
pewna *dwuargumentowa operacja* albo *działanie*, tyle, że na zdaniach, które z dwóch *zdań jako
takich* (niekoniecznie udowodnionych czy prawdziwych) *A* i *B* "robi" jedno (niekoniecznie
udowodnione czy prawdziwe) unikalne zdanie złożone, dające się konsekwentnie interpretować jako
*Jeżeli A, to B*.

Ze słowem "robi" (albo "tworzy", albo "daje") użytym w ten sposób jest pewien problem. Na mocy
przyjętych konwencji, jeżeli *A* to (coś, co oznacza) zdanie i *B* to (coś, co oznacza) zdanie, to
*wyrażenie powstające przez zapisanie* A, *potem symbolu* →, *a na końcu* B *jest* parametrycznym
*zdaniem*. To wyrażenie oznacza jakieś zdanie będące implikacją, której poprzednikiem jest zdanie
(oznaczone jako) *A*, a następnikiem jest zdanie (oznaczone jako) *B*. A więc strzałka jest w pewnym
sensie oznaczeniem *operacji* tworzenia implikacji, ale *ta operacja nic nie robi*, bo istnieje
tylko jako pewne *abstrakcyjne przyporządkowanie* pewnych zdań (o postaci implikacji) dowolnym
uporządkowanym parom zdań. Ta operacja jest zatem tylko funkcją w znaczeniu matematycznym, a nie na
przykład teoriotypowym. Dlatego słowo "operacja" też jest tu problematyczne.

Właściwie "operacyjność" czy "działaniowość" zachodzi tu na dokładnie dwa sposoby. Po pierwsze,
rozważane przez nas implikacje zwykle skądś się biorą, na przykład, ta tutaj parametryczna
implikacja została stworzona przeze mnie, jest więc rezultatem albo skutkiem pewnego procesu, w
którym brałem udział. A po drugie, fakt, że zapis tej sekwencji symboli jest implikacją polega na
tym, że my, czytelnicy tego tekstu zachowujemy się w pewien sposób wobec tego zapisu, to jest
traktujemy go jako implikację, i to też jest pewien proces i sposób działania. Operacyjność czy
działaniowość nie polega tu jednak na tym, że symbol *→* oznacza jakiś działający niezależnie od nas
mechanizm, który może przetwarzać zdania i produkuje zdania.

<hr>

Może przyda Ci się wyobrazić sobie, że zdanie w logice to coś płaskiego i półprzezroczystego, a
dowód to skarb, którego barwę można czasami zobaczyć pod powierzchnią zdania, o ile ten dowód
istnieje i umiemy popatrzeć tak, żeby go dostrzec. Ja tak czasem o tym myślę.

**Analogia między implikacjami i typami funkcyjnymi**:

Jeżeli `A` i `B` to *typy*, to `A → B` jest *typem funkcyjnym*.

Jeżeli *A* i *B* to *zdania*, to *A → B* jest *implikacją*.

Ponieważ zdania to w teorii typów tylko specjalne typy, drugie zdanie jest szczególnym przypadkiem
pierwszego.

Analogia, a raczej doskonałe dopasowanie jakie występuje między zdaniami i (pewnymi) typami może
wyglądać jak wieloznaczność i w pewnym sensie nią jest. Jednak wieloznaczności występują w języku
naturalnym powszechnie i jakoś sobie z nimi radzimy. To byłaby wieloznaczność *problematyczna*,
gdybyśmy sprawili, że nie wiadomo, *którą* interpretację stosujemy i gdyby *jednocześnie* ta różnica
w dopuszczalnych interpretacjach miała znaczenie dla *poprawności wniosków*. Używając układu
współrzędnych też korzystałaś z podwójnej interpretacji, a więc z pewnego rodzaju wieloznaczności
(na przykład, słowo "punkt" możesz rozumieć jako nazwę na punkt na płaszczyźnie albo uporządkowaną
parę liczb) i wyszło Ci to na dobre, prawda?

<hr>

### Terminologia ugólna: "unikalność"

W matematyce słowo "unikalne" nie znaczy "jedyne" ani "wyjątkowe", tylko "dokładnie jedno danego
rodzaju". Wszędzie, gdzie pojawia się to słowo, można je zastąpić właśnie przez "dokładnie jedno
danego rodzaju".

I tak, w przypadku implikacji otrzymujemy unikalne zdanie powstające w taki a nie inny sposób z
każdej określonej pary zdań: Jeżeli *A* i *B* to zdania, to *A → B* jest unikalną implikacją
*powstającą z tych dwóch zdań w tej kolejności*, czyli jest unikalnym obiektem *tego
rodzaju*. Chodzi po prostu o to, że jak już mamy jakieś dwa określone zdania *A* i *B*, to możemy z
nich zrobić *tylko jedną* implikację o postaci *A → B*. Podobnie dodawanie to operacja na liczbach,
która z dwóch dowolnych, niekoniecznie różnych liczb, na przykład *2* i *2*, "robi" unikalną liczbę,
w tym wypadku *4*. Ten wynik jest w przyjętym znaczeniu unikalny, chociaż dodawanie nieskończenie
wielu innych par liczb (na przykład całkowitych) daje taki sam rezultat. 

Mówimy też, że zdania w postaci implikacji są *funkcją* uporządkowanych par zdań. Uporządkowanych,
bo ma znaczenie, które zdanie traktujemy jako poprzednik, a które jako następnik
implikacji. Powiedzieć w matematyce, że coś jest unikalne i że coś jest jakąś funkcją czegoś to
jedno i to samo, ponieważ słowo "funkcja" oznacza w matematyce przyporządkowanie dokładnie jednego
czegoś do każdego czegoś należącego do jakiegoś zbioru. Na przykład, implikacje to wartości pewnej
funkcji (jako abstrakcyjnego przyporządkowania) określonej na zbiorze uporządkowanych par zdań.

<hr>

**Zalety maksymalnej formalności**: Wiem, że często piszę długie zdania. Tym razem jednak chociaż
przez chwilę robiłem to celowo. Chciałem w ten sposób zilustrować coś ważnego: Dzięki temu, że
posługujemy się prostymi symbolami na oznaczenie dowolnie złożonych zdań, możemy lepiej zapanować
nad strukturą rozumowań w sytuacjach, w których bez takiego skrótowego zapisu moglibyśmy się łatwo
pogubić. Logika pozwala nam *w kontrolowany sposób ignorować treść*, *bez szkody dla
poprawności*. To też, to jest pewnego rodzaju "beztreściowość", mamy na myśli mówiąc o "formalności"
zapisu matematycznego. Wreszcie, formalny zapis ułatwia robienie czegoś, co jest ogromną siłą
matematyki - ułatwia a właściwie umożliwia rozwiązywanie zarówno prostych jak i złożonych problemów
*mechanicznie*, jakbyśmy układali puzzle albo grali w jakąś inną grę. Wydaje mi się wręcz, że mówiąc
o matematyce można by zastąpić słowo "formalne" słowem "mechaniczne" bez utraty treści.

Coś takiego będziemy właśnie robić, a właściwie już dawno zaczęliśmy robić. To znaczy, będziemy
dalej grać w grę polegającą na konstruowaniu dowodów *całkowicie* formalizując przy tym każdy
problem. Będziemy więc używać matematyki w sposób *bardziej* formalny, a więc również bardziej
*niezawodny*, niż ma to zwykle miejsce nawet w zaawansowanych podręcznikach do
matematyki. Matematycy raczej tak *nie* postępują, bo im się nie chce i (zwykle) nie muszą; zamiast
tego polegają na domyślności kompetentnego odbiorcy i przekonaniu, że pisząc skrótowo i
pół-formalnie nie popełniają błędów (co oczywiście *nie może* zawsze być prawdą).

My nie chcemy się musieć niczego domyślać, bo nie jesteśmy tak kompetentni jak zawodowi
matematycy. A poza tym, jako psychologowie wiemy, że nawet najwybitniejszym ekspertom, gdy robią
coś, w czym są ekspertami, nie można całkiem ufać. Poza tym stąd, że jesteśmy psychologami, wynika,
że zarówno sami matematycy, jak i wszystko, co zrobili, zrobią, lub co mogliby, albo nie mogliby
zrobić *należy do przedmiotu naszych badań*.

Pełna formalizacja wymaga dodatkowego wysiłku, ale dzięki niej będzie nam często *łatwiej*. Przede
wszystkim zaś wszystko, co napiszemy, będzie *sprawdzone przez algorytm, który zawsze da nam
odpowiedź, czy to, co napisaliśmy, jest poprawne*. Będziemy więc w pewnym sensie "zawsze bezpieczni"
w swoich matematycznych eksperymentach.

Koszt, który musimy ponieść, żeby to osiągnąć, to częściowe oswojenie się z co prawda mniej złożonym
niż język polski, ale obcym, sztucznym i *nieludzko* sztywnym językiem, jakim jest formalny język (a
raczej *języki*) matematyki. Tak samo jak to ma miejsce w przypadku nauki każdego nowego języka,
trzeba się (tylko!) uzbroić w cierpliwość (jeszcze chyba wspomnę o tej cierpliwości później).

Jest jak sądzę wiele prawdy w stwierdzeniu, którego autorem jest genialny polski matematyk [Jerzy
von Neumann](https://en.wikipedia.org/wiki/John_von_Neumann), że często (co nie znaczy, że zawsze)
matematykę się nie tyle *rozumie*, ile raczej się do niej stopniowo *przyzwyczaja*. Dodam do tego od
siebie, że gdy się już trochę do niej przyzwyczai (co wymaga przede wszystkim *czasu*), to
zadziwiająco często okazuje się, że jej pojęcia, twierdzenia i teorie wyrażają coś, co rozumiało się
nieźle już wcześniej, tylko nie umiało się o tym dostatecznie konsekwetnie albo spójnie mówić, a
więc również dostatecznie jasno i skutecznie myśleć.

Bo matematyka jest między innymi właśnie obcym i sztucznym językiem, a właściwie stale rosnącą
kolekcją wyspecjalizowanych i sztucznych języków, i żeby zrozumieć to, o czym i w jaki sposób w tych
obcych i sztucznych językach można mówić i myśleć, trzeba *przyzwyczaić się* do najbardziej
podstawowych zasad dotyczących tego, jak się ich używa, to jest do *reguł składniowych*. A to wymaga
sporo czasu, tak samo jak sporo czasu wymaga opanowanie gramatyki na przykład języka polskiego. Ale
chyba już wystarczająco wiele razy powtórzyłem, co na ten temat myślę, może więc przejdźmy do
następnego wątku.

## Pojęcie prawdy w logice konstruktywnej

Na koniec tego rozdziału powiem jeszcze coś na temat dwóch najważniejszych dla nas na tym etapie
logik, to jest logiki *konstruktywnej* i *klasycznej*. Być może miałaś już do czynienia z elementami
logiki zdań i słyszałaś na przykład o koniunkcji albo o implikacji. Jeżeli tak, to może to być teraz
do pewnego stopnia *przeszkodą*, ponieważ logika zdań jest najczęściej wykładana w wersji tak zwanej
*klasycznej*, w której prawdą jest, że:

*Każde zdanie jest albo prawdziwe, albo fałszywe.*  
(zdanie prawdziwe w logice klasycznej)

Jak również:

*Dla każdego zdania P, jeżeli nieprawda, że nieprawda, że P, to P*.  
(inne zdanie prawdziwe w logice klasycznej)

Zwracam uwagę, że te zdania są *parametryczne* i mówiąc coś o *wszystkich możliwych* (poprawnych
składniowo) zdaniach. W pierwszej chwili może się wydawać, że oba są w oczywisty sposób prawdziwe,
ale po chwili zastanowienia zaczną Ci pewnie przychodzić do głowy problematyczne przykłady. Choćby
taki: czy faktycznie albo jest prawdą, że "ludzie są dobrzy", albo "nieprawda, że ludzie są dobrzy"?

W Leanie domyślnie (można to łatwo zmienić, ale nie będziemy tego teraz robić) używamy logiki
konstruktywnej, inaczej *intuicjonistycznej*, a nie klasycznej. Ta logika jest "ostrożniejsza" w tym
znaczeniu, że wszystko, co jest prawdą w logice konstruktywnej, jest też prawdą w logice klasycznej,
ale nie odwrotnie. O ostrożniejszych założeniach lub teoriach i o ogólniejszych pojęciach mówimy, że
są *słabsze*, w znaczeniu mniej *zobowiązujące*, albo - czasami - mniej
[*spekulatywne*](https://pl.wiktionary.org/wiki/spekulatywny). W logice konstruktywnej można
przyjąć, że:

*Zdanie prawdziwe to to samo, co zdanie, które ma dowód.*  
(dopuszczalna interpretacja prawdy w logice konstruktywnej)

"Które ma dowód" a nie "udowodnione", bo to ostatnie słowo (które tu było długo zamiast "ma dowód")
przynajmniej sugeruje, że chodzi o fakt wskazania przez kogoś dowodu. A na czym, w ogólnym
przypadku, polega różnica między "prawdziwe" i "posiadające dowód"? Jeżeli postanowimy intepretować
słowo "prawdziwe" jako równoznaczne z "udowodnione" (już wiedząc, że nie całkiem nam o to chodzi,
ale będziemy tak mówić, bo tak jest wygodniej), to *nie możemy* zaakceptować jako prawdziwego zdania
*Każde zdanie jest albo prawdziwe, albo fałszywe* (nazywanego m.in. [zasadą wyłączonego
środka](https://en.wikipedia.org/wiki/Law_of_excluded_middle)), ponieważ wiemy (istnieje
twierdzenie, które o tym mówi), że w matematyce da się skonstruować takie poprawne zdania, że *nie
da się* udowodnić ani tych zdań, ani ich negacji. W logice konstruktywnej nie możemy też
zaakceptować zasady podwójnej negacji (jeżeli nieprawda, że nieprawda, że *P*, to *P*), bo zasada
wyłączonego środka z niej wynika (i vice versa). Jeżeli Cię to niepokoi, to zapewniam, że logika
klasyczna nieprędko będzie dla nas ważna, a gdy to nastąpi, będziesz już na to gotowa.

Żeby udowodnić w logice konstruktywnej implikację *A → B*, gdzie *A* i *B* to dowolne zdania, trzeba
*skontruować językową procedurę* (czyli napisać program, albo stworzyć funkcję), która dowolny dowód
zdania *A* przekształca w dowód zdania *B*.

Oto *reguła dedukcji* która mówi, jak można *udowodnić implikację* (zaraz wyjaśnię, co oznacza ten
zapis):

Jeżeli *A* i *B* to zdania, to:

*A*  
.  
.  
.  
<ins><em>B</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</ins>  
*A → B*

Reguły dedukcji zapisujemy zwykle w taki właśnie sposób. Reguły dedukcji to reguły, które mówią,
jakie zdania możemy *wprowadzić do dowodu* w jakich warunkach. O regułach dedukcji można również
myśleć jako o regułach mówiących o *dopuszczalnych* (niezależnie od treści, bo formalnie)
*przejściach między "stanami epistemicznymi"*. Ta akurat reguła mówi nam, że zawsze, gdy "doszliśmy
logicznie" w jakiś sposób do jakiegoś zdania *B* taką "trasą", że wcześniej (jako założenie albo
jako wniosek, a więc wtedy jako zdanie udowodnione) pojawiło się zdanie *A*, to możemy też dojść do
(stanu wiedzy, na który składa się zdanie) *A → B*.

Albo tak: Ta akurat reguła (reguła *wprowadzenia* implikacji) mówi, że jeżeli zakładając *A* (i być
może przyjmując wcześniej inne założenia) da się wyprowadzić w jakikolwiek sposób (to właśnie
oznaczają te zapisane pionowo kropki) *B*, to można wprowadzić albo zaakceptować albo uznać za
prawdziwe (na mocy wszystkich wcześniejszych założeń i wyprowadzonych wniosków) zdanie *A →
B*. Mówiąc krótko: Jeżeli w danym kontekście z *A* da się wyprowadzić *B*, to można w tym kontekście
zaapceptować zdanie *A → B*. Mówiąc najkrócej: Jeżeli z *A* wynika *B*, to *A → B*.

Ponieważ w logice konstruktywnej "prawdziwe" znaczy to samo, co "ma (jakiś) dowód", ta reguła
dedukcji ma w tej konstruktywnej następującą *interpretację*:

*Jeżeli z dowodu A można zrobić (w danym kontekście) dowód B, to ten sposób przekształcania
dowolnych dowodów A w dowody B jest dowodem A → B*.

Albo krócej: Dowód *A → B* to sposób uzyskania dowodu *B* z dowolnego dowodu *A*.

Czy widzisz, że to jest ciągle ta sama reguła dedukcji, ale wydaje się zmieniać, bo zmieniamy
sposób, w jaki *my* o niej mówimy i w jaki jej używamy, to jest w jaki interpretujemy pojęcie prawdy
(albo akceptacji zdania w dowodzie)?

Jeżeli `A` jest zdaniem, czyli typem i zarazem termem typu `Prop`, to term typu `A` jest dowodem
(prawdziwości) zdania `A`. Wobec tego ...

```lean
def tautologia (A : Prop) : A → A := fun (h : A) => h
```

... jest dowodem (parametrycznej) tautologii *A → A* (jeżeli *A*, to *A*), dla każdego zdania *A*
(to jest ta parametryczność).

Sam fakt, że da się skonstruować funkcję o typie `(A : Prop) → A → A` oznacza, że wiedząc *tylko
tyle*, że *A* jest jakimś zdaniem, można z dowolnego dowodu *A* zrobić dowód *A*. Jeżeli *A* to
zdanie, to *Jeżeli* A *, to* A. Nic prostszego, prawda?

O ile tylko będziesz cierpliwa, to przyjdzie taki moment, w którym moje próby przyzwyczajenia Cię do
interpretacji typów jako zdań i termów tych typów jako ich dowodów staną się irytujące, ponieważ to
wszystko będzie dla Ciebie dosyć oczywiste i naturalne. Będziesz wtedy nawet wolała się nad tym za
bardzo *nie* zastanawiać, podobnie jak ktoś, kto nauczył się w miarę płynnie grać utwór na pianinie
woli nie myśleć o nazwach kolejno granych akordów czy nut.

Jeszcze jedna uwaga na temat często stosowanych, ale rzadko objaśnianych konwencji: Gdy matematycy
nagle zmieniają notację i wydaje się, że bez powodu na oznaczenie tego samego zamiast małych liter
używają dużych, często chcą w ten sposób zasugerować, że mają na myśli również dowolnie *złożone*,
albo bardziej złożone niż wcześniej, albo w pewnym sensie większe obiekty danego rodzaju. Tutaj
zacząłem w pewnem momencie oznaczać zdania dużymi literami właśnie w tym celu, to jest żeby
zaznaczyć, że chodzi o wszystkie możliwe zdania, a więc nie tylko atomowe, ale również dowolnie
złożone.

Przypominam na koniec fragment prozy matematycznej, który pojawił się w trzecim rozdziale:

> Jeżeli *n* i *m* to liczby naturalne, to *n + m = m + n*.

Czy widzisz, że *dokładnie to samo* możemy zapisać w dosyć *naturalny, zwięzły i czytelny* sposób w
(częściowo już) naszym języku jako (ilustracja) ...

```lean
def przemiennosc_dodawania (n : Nat) (m : Nat) : n + m = m + n := ...
```

... gdzie `n + m = m + n` to *zdanie parametryczne* a wielokropek oznacza brakujący dowód? W Leanie
to zdefiniowane już twierdzenie jest dostępne jako wartość stałej `Nat.add_comm`, gdzie *comm* to
skrót od angielskiego *commutativity*, oznaczającego przemienność (tutaj akurat operacji dodawania).

Ponieważ matematyka to dla nas programowanie, a twierdzenia to dla nas funkcje, możemy *stosować
twierdzenia w taki sam sposób w jaki stosujemy wszystkie inne funkcje jako programy*:

```lean
-- `Nad.add_comm` to twierdzenie i jednocześnie funkcja dwuargumentowa, która z podanych argumentów 
-- odpowiedniego typu tworzy dowód szczególnej wersji zdania `n + m = m + n`, gdzie `n` i `m` to parametry.
#check Nat.add_comm -- Nat.add_comm (n m : Nat) : n + m = m + n

-- Jak widać, sama aplikacja `Nad.add_comm 2 3` jest dowodem zdania `2 + 3 = 3 + 2`:
#check Nat.add_comm 2 3 -- Nat.add_comm 2 3 : 2 + 3 = 3 + 2
```

Jeżeli masz ochotę, to może zerknij znowu na [tą część rozdziału
czwartego](https://github.com/boryspaulewicz/matematyka_dla_psychologow/blob/main/rozdzialy/R04_Kilka_trywialnych_mechanicznych_operacji.md#ten-tytu%C5%82-jest-tylko-po-to-%C5%BCeby-do-niego-p%C3%B3%C5%BAniej-wr%C3%B3ci%C4%87)
i zobacz, czy zmienił się sposób, w jaki teraz postrzegasz i rozumiesz to, o czym tam pisałem.

### Przypisy

[^1]: Dawno, dawno temu byłem w Krakowie na koncercie zespołu
    [5’nizza](https://pl.wikipedia.org/wiki/5%E2%80%99nizza), na którym Serhij Babkin i Andriej
    Zaporożec wykonywali utwory z płyty [П'ятниця](https://www.youtube.com/watch?v=nnWMrmTWonI),
    której lubiłem wtedy słuchać. W pewnym momencie któryś z wykonawców sięgnął po butelką i wtedy
    usłyszałem z sali krzyk "Nie pij tej wody!". Uważam, że to było bardzo śmieszne.
