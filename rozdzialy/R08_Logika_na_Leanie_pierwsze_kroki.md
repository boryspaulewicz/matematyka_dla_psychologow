<br>

**Moim zdaniem, najważniejsze wskazówki na temat tego, w jaki sposób warto czytać tą książkę, są
[tutaj](./Wujek_dobra_rada.md).**

<hr>

## O czym teraz będzie

W tym rozdziale skorzystamy z tego, co już wiesz, żeby przejść możliwie płynnie ze "zwykłego"
programowania do dowodzenia twierdzeń (jako programowania). Poprzednie rozdziały napisałem tłumacząc
kilka razy na różne sposoby wszystkie ważne kwestie i omawiając krok po kroku proces ewaluacji,
ponieważ próbowałem do pewnego stopnia zastąpić Cię w roli kogoś, kto uczy się aktywnie
przyswajanych treści. Odtąd jednak będę to robił rzadziej, ponieważ nadal wyręczając Cię w tej roli
utrudniłbym Ci zmianę postawy na taką, która moim zdaniem później Ci się przyda. Ale bez obaw,
lektura powinna przebiegać nadal bezboleśnie.

<hr>

# Konstruowanie termów w trybie interaktywnym

Przypominam znaną Ci już funkcję `identycznosc` (ilustracja):

```lean
def identycznosc (typ : Type) (argument : typ) := argument
```

Ta funkcja jest prostym programem komputerowym, który dla dowolnego typu i argumentu o tym typie
zwraca ten argument. Jak wiesz, widoczny wyżej wygodny sposób zapisywania parametrów tak naprawdę
skrywa dwie λ-abstrakcje:

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

-- To są wszystko te same funkcje, albo to jest jedna i ta sama funkcja (jako funkcja), albo te funkcje
-- są wszystkie takie same. Te trzy funkcje mają ten sam typ ...
#check @identycznosc   -- identycznosc   : (typ : Type) → typ → typ
#check @identycznosc'  -- identycznosc'  : (typ : Type) → typ → typ
#check @identycznosc'' -- identycznosc'' : (typ : Type) → typ → typ

-- ... i zwracają te same wartości dla tych samych argumentów, na przykład:
#eval identycznosc   Nat 1 -- 1
#eval identycznosc'  Nat 1 -- 1
#eval identycznosc'' Nat 1 -- 1

-- Możemy nawet formalnie udowodnić, że to jest jedna i ta sama funkcja, ale do tego celu musimy
-- wykorzystać elementy języka Lean, które wprowadzę znacznie później, dlatego to na razie tylko
-- ilustracja. Zwracam przy okazji uwagę, że również w pełni sformalizowane dowody mogą być krótkie
-- i proste.
example : identycznosc = identycznosc' := by rfl
example : identycznosc' = identycznosc'' := by rfl
-- Ponieważ Lean nie zgłasza tu żadnego błędu, wiemy, że obydwa dowody są poprawne, a ponieważ
-- relacja równości jest przechodnia (jeżeli A = B i B = C to A = C), to identycznosc = identycznosc''.
```

Do tej pory tworzyliśmy definicje pisząc wprost odpowiedni kod w języku teorii typów, albo po prostu
"w kodzie". Żeby stworzyć definicję termu o jakimś z góry określonym typie w trybie *interaktywnym*,
w miejscu, w którym mamy skonstruować ten term, czyli poprawne wyrażenie danego typu w języku teorii
typów, wpisujemy słowo kluczowe `by` (czyli *za pomocą* albo *na sposób*). Słowo kluczowe `by` nie
należy już do języka teorii typów, tylko do specjalnego języka dostępnego w Leanie, służącego do
konstruowania termów za pomocą tak zwanych *taktyk*. Taktyki to pewne algorytmy czy metody służące
przede wszystkim (ale nie tylko!) do konstruowania termów będących *dowodami*, a więc do
konstruowania termów typów zdaniowych.

Wrócimy teraz do prostszej identyczności, która działa tylko dla liczb naturalnych i poznamy dwie
ważne taktyki - `intro` i `exact`. Okaże się, że służą one do czegoś, co umiesz już zrobić bez ich
pomocy.

Taktyka `intro` tworzy (w tle) sam *początek* λ-abstrakcji, czyli samą część `fun (<jakis_parametr> :
<jakis_typ>) =>`. Jeżeli skopiujesz poniższy fragment kodu ...

```lean
def nic_nie_robie : Nat → Nat := by
    -- ... i umieścisz kursor w następnej linii ...
```

... to po prawej, pod zakładaką *Tactic state*, zobaczysz ...

```lean
---  ... aktualny stan procesu konstrukcji termu w trybie interaktywnym, ...
1 goal
⊢ Nat → Nat
```

... a słowo `by` będzie podkreślone na czerwono. Zobaczysz też czerwoną falkę pod linią z
komentarzem, bo ta definicja nie jest jeszcze zakończona. Można więc powiedzieć, że to właściwie nie
jest błąd, tylko sygnał, że jest jeszcze coś do zrobienia.

**Czytamy to**: Pozostał jeden cel do zrealizowania (`1 goal`). Tym celem jest (`⊢`) stworzenie
jakiegokolwiek termu *typu* `Nat → Nat`. Powyżej symbolu derywacji `⊢`, a poniżej komunikatu `1
goal` widać aktualny *kontekst* (w teorii typów to słowo jest terminem technicznym), w którym w tym
momencie jeszcze nic nie ma.

Jak wiesz, między innymi funkcja anonimowa `fun (n : Nat) => n` jest przykładem termu typu `Nat →
Nat`, ponieważ jest (w tym wypadku trywialną, bo identycznościową) funkcją posyłającą liczby
naturalne w liczby naturalne. Wpisując teraz poniżej komentarza `intro n` i nasikając klawisz Enter
sprawisz, że kontekst zmieni się z pustego na taki, w którym masz do dyspozycji jakąś (czyli
arbitralną) liczbę naturalną o nazwie `n`, czyli `n : Nat`. To daje taki sam efekt jak dołożenie
parametru `(n : Nat)` do definiowanej funkcji - gdy definiowana funkcja ma taki parametr, wewnątrz
jej ciała widać `n : Nat` właśnie jako element kontekstu, to jest jako jedną z dostępnych *lokalnie*
(bo w ciele funkcji) deklaracji zmiennych.

Zastosowanie taktyki `intro` z argumentem `n` jest więc tutaj tym samym, co rozpoczęcie tworzenia
kodu funkcji anonimowej `fun (n : Nat) => ...`. Rezultat zastosowania w ten sposób taktyki `intro`
można również opisać tak: Niech `n` będzie termem typu `Nat`, albo krócej - niech `n : Nat`. Albo
tak: Wprowadzam (`intro` to skrót od *introduction*) do kontekstu `n` typu `Nat`, bo taki (to jest
`Nat`) jest "typ początkowy" w typie-celu `Nat → Nat`. Właśnie dlatego, że przed zastosowaniem
`intro` cel to `Nat → Nat`, wystarczy, że powiemy taktyce `intro`, żeby wprowadziła do kontekstu
zmienną `n`, bez podawania jej typu, bo to w tym momencie to musi być zmienna o typie `Nat`.

Ponieważ część termu, który miałaś skonstruować, już powstała, cel uległ zmianie. Teraz po prawej
widać, że celem jest skonstruowanie prostszego termu typu `Nat`, a nie jak wcześniej `Nat →
Nat`. Jak już teraz wiesz, ta zmiana celu nastąpiła, ponieważ stosując taktykę `intro` tak jakby
oderwałaś początkową część typu `Nat → Nat` i wprowadziłaś ją do kontekstu, czyli nadałaś jej status
(określenia typu) parametru konstruowanej funkcji.

W tym momencie możesz skorzystać z taktyki `exact`, która służy do *konstrukcji* termu o docelowym
typie *wprost*, poprzez podanie odpowiedniego wyrażenia w języku teorii typów. Żeby użyć tej
taktyki, jako jej argument musisz podać (prosty lub złożony) term, który ma *typ będący
celem*. W tym momencie dysponujesz właśnie takim termem - jest nim przecież `n : Nat`, który masz w
kontekście. Wystarczy więc napisać w następnej linii poniżej `intro n` komendę `exact n` i nacisnąć
Enter.

Nie ma już żadnych celów do zrealizowania, co można rozpoznać po tym, że gdy kursor znajduje się za
komendą `exact n`, to po prawej widać stan `No goals`. A więc proces interaktywnej konstrukcji termu
o podanym typie (tutaj `Nat → Nat`) zakończył się sukcesem.

To wszystko może się w tym momencie wydawać niepotrzebnie skomplikowane, skoro równie dobrze można
było napisać ...

```laen
def nic_nie_robie (n : Nat) := n
```

... ale później ten sposób konstruowania termów okaże się czasami bardzo pomocny. Można powiedzieć,
że tryb interaktywny to pewien wygodny sposób odciążenia Twojej [*pamięci
operacyjnej*](https://pl.wikipedia.org/wiki/Pami%C4%99%C4%87_operacyjna), ponieważ w tym trybie Lean
dostarcza Ci *w trakcie* konstrukcji termu (tutaj w trakcie konstrukcji funkcji albo programu, a
później w trakcie konstrukcji dowodu) jednoznaczne informacje na temat tego, co jeszcze zostało do
skonstruowania i czym w danym miejscu w kodzie dysponujesz. W przypadku definiowania prostych
funkcji takich jak `nic_nie_robie` to się może wydawać rozpraszające i zbędne, ale w przypadku
konstruowania termów bardziej złożonych, szczególnie zaś nie całkiem trywialnych dowodów, taka pomoc
bardzo się przydaje, a poza tym sprawia, że uprawianie matematyki - również teoretycznej! - jeszcze
bardziej przypomina *grę*.

**Polecenie**: Stosując taki sam ogólny schemat postępowania spróbuj stworzyć w trybie interaktywnym
definicję *uogólnionej* identyczności uzupełniając poniższy kod. Zwróć uwagę, że ponieważ ta
definicja ma dwa parametry - `(typ : Type)` i `(argument : typ)` - i oba są zapisane *przed* głównym
drukropkiem, to oba są od razu widoczne w kontekście, to jest powyżej symbolu derywacji `⊢`, jako
coś, co masz i czego nie musisz nazywać i wprowadzać do kontekstu za pomocą taktyki `intro`. Twoim
celem jest w tym momencie stworzenie jakiegokolwiek termu typu `typ`, a ponieważ masz już taki term,
wystarczy zastosować taktykę `exact` z odpowiednim argumentem i nacisnąć Enter. Wtedy zobaczysz, że
nie ma już więcej celów, a więc konstrukcja definicji tej funkcji zakończyła się sukcesem.

```lean
def identycznosc (typ : Type) (argument : typ) : typ := by
    -- Umieść kursor w następnej linii.
```

Teraz skonstruujemy taką samą (a więc też tą samą) funkcję, ale przestawimy główny dwukropek o jedno
miejsce w lewo. Trzeba więc będzie najpierw stworzyć jedną λ-abstrakcję używając taktyki `intro` z
odpowiednim argumentem, a następnie zrealizować jedyny cel, który będzie wtedy do zrealizowania.

**Polecenie**: Opierając się na moich wcześniejszych wyjaśnieniach na temat roli parametrów
zapisanych przed głównym dwukropkiem (wyręczają Cię w konstruowaniu λ-abstrakcji, pamiętasz?),
dokończ w trybie interaktywnym następującą definicję ...

```lean
--- ... uogólnionej identyczności:
def identycznosc' (typ : Type) : (argument : typ) → typ := by
```

Argument taktyki `intro`, czyli nazwa parametru konstruowanej λ-abstrakcji, mógł Ci się wydawać
zbędny, skoro ta nazwa jest już jawnie podana w specyfikacji typu konstruowanego termu jako
`(argument : typ)` *po* głównym dwukropku. Niestety, samo wpisanie taktyki `intro`, bez podania
żadnego argumentu, w tym przypadku nie wystarczy. Mogłaś jednak wybrać inną nazwę dla parametru
konstruowanej funkcji, na przykład jakąś nazwę krótszą niż ta, która występuje w specyfikacji typu,
ponieważ nazwy parametrów nie mają znaczenia, a nie mają, bo parametry pełnią tylko rolę zaimków.

Jeżeli masz ochotę, usuń kod kończący definicję i zastosuj najpierw taktykę `intro` z innym
argumentem, po czym zastosuj taktykę `exact` z jedynym argumentem, który - biorąc pod uwagę, co
będziesz mieć wtedy w kontekście - zakończy konstrukcję definicji. Przekonasz się w ten sposób, że
nie musisz używać dla parametru tej samej nazwy, która występuje w specyfikacji typu (albo: w
*sygnaturze*). A nie musisz, ponieważ nazwa parametru jest własnością *samej λ-abstrakcji*.

**Polecenie**: Dokończ poniższą definicję w trybie interaktywnym używając kombinacji taktyk `intro`
i `exact`. **Nie bój się eksperymentować!** Każdej próbie będą przecież towarzyszyły informacje
zwrotne w panelu po prawej, z których zawsze możesz korzystać jako ze wskazówek na temat tego, co
powodują wprowadzane fragmenty kodu. Zwracaj uwagę na aktualny cel i pamiętaj, że `intro` z
odpowiednim argumentem jakby "odrywa i wrzuca na górę" początkową część celu, gdy cel ma typ
funkcyjny (strzałkowy).

```lean
def identycznosc'' : (typ : Type) → (argument : typ) → typ := by
    -- Umieść kursor w następnej linii.
```

**Polecenie**: Używając trybu interaktywnego dokończ poniższą definicję. Zwróć uwagę, że Twoim celem
jest tym razem skontruowanie termu typu `Nat`, a nie termu typu funkcyjnego, nie masz więc tworzyć
"od podstaw" λ-abstrakcji. Być może jedyna trudność, jaka może się pojawić w tym zadaniu, to
przywiązanie do określonego sposobu stosowania taktyki `exact`. Ta taktyka jest dość elastyczna w
tym znaczeniu, że jej argumentem nie musi być pojedyncza stała - to może być również dowolny term
*złożony*, o ile tylko typ tego termu zgadza się z celem.

```lean
-- Używając taktyki `exact` dokończ definicję w trybie interaktywnym tak, żeby funkcja `dodaj2`
-- dodawała do swojego jedynego parametru liczbę `2`.
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
-- Dokończ definicję w trybie interaktywnym. Ponieważ tym razem trzeba samodzielnie stworzyć λ-abstrakcję,
-- konieczne będzie zastosowanie taktyki `intro`.
def suma' (n : Nat) : Nat → Nat := by
```

```lean
-- Dokończ definicję w trybie interaktywnym. Możesz zastosować dwukrotnie taktykę `intro`, albo możesz użyć
-- jej tylko raz, podając *dwie* nazwy dla parametrów konstruowanej λ-abstrakcji.
def suma'' : Nat → Nat → Nat := by
```

## Hierarchia typów w Leanie

W wersji teorii typów, której używamy w Leanie, *każdy typ*, na przykład typy `Nat` i `Type`, *jest
również termem*, ale *typu ogólniejszego* inaczej *wyższego*, na przykład typ `Type` ma typ `Type
1`, a więc `Type` jest nie tylko typem, ale również termem (wyższego) typu `Type 1`, tak samo `Type
1` jest typem, ale również termem, który ma typ `Type 2`, i tak w nieskończoność[^1]:

```lean
-- `2` to tylko "zwykły" term, to jest taki, który nie jest typem. Czasami myślę o takich termach, że 
-- są "na dnie", albo że są "zwarte" lub "konkretne":
#check 2 -- 2 : Nat

-- `Nat` to typ i jednocześnie term ogólniejszego typu, który nazywa się `Type`. Chciałoby się zapisać:
-- `2 : Nat : Type`
-- ale Lean nie pozwala na taką notację. `Type` to tak naprawdę `Type 0`, ale ponieważ typ `Type 0` bardzo
-- często się pojawia, Lean pozwala zapisać go w ten skrótowy sposób i tak też go wyświetla.
#check Nat -- Nat : Type, a tak naprawdę Nat : Type 0

-- `Type` (czyli `Type 0`) to typ i jednocześnie term ogólniejszego albo wyższego typu `Type 1`
#check Type   -- Type   : Type 1
#check Type 1 -- Type 1 : Type 2
#check Type 2 -- Type 2 : Type 3
-- I tak dalej ...

#check Type 665 -- Nie umieszczaj nigdy kursora na tej linii! I nie pij tej wody!!

-- A więc pisząc w sposób, którego Lean nie lubi:
-- 2 : Nat : Type : Type 1 : Type 2 : Type 3 : Type 4 : i tak dalej ...
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
```

Typy wyższych rzędów są potrzebne *tylko* z pewnych nudnawych powodów technicznych i rzadko, o ile w
ogóle, będą nas interesować. Może słyszałaś o paradoksie albo [antynomii
Russella](https://pl.wikipedia.org/wiki/Antynomia_Russella)? Fryzjer, który goli tych i tylko tych
mieszkańców, którzy akurat stoją na jednej nodze, ale niekoniecznie swojej, dlatego musi być tym
bardziej ostrożny, gdy używa brzytwy, bo jak ich goli, to... Może pomińmy szczegóły. Chodzi w każdym
razie o coś zbliżonego. Jeżeli nie słyszałaś, To zazdroszczę.

## Zdania jako typy (zdaniowe), termy typów zdaniowych jako dowody tych zdań

Lean ma również wbudowany typ `Prop`, który będzie odtąd dla nas ważny. To jest typ wyższego rzędu,
podobnie jak na przykład `Type 1`, co znaczy, że *termy* typu `Prop` same *są typami*, ale typ
`Prop` zachowuje się inaczej niż typy `Type n` (gdzie `n` to dowolna liczba naturalna). Pokażę Ci
teraz, że typ `Prop` jest jakby odnogą albo odgałęzieniem hierarchii typów Leana:

```lean
#check Prop -- Prop : Type

-- Komenda variable służy do deklarowania, że mamy ("skądś") *jakiś* (a więc bliżej nieokreślony) term 
-- danego typu. Można to czytać tak: *Gdybyśmy* mieli jakiś term `cos_pod_typem_Prop` typu `Prop` ...
variable (cos_pod_typem_Prop : Prop)

-- `cos_pod_typem_Prop` jest jednocześnie termem (typu `Prop`) i typem, dlatego możemy zapisać również
-- taką deklarację:
variable (jakis_term : cos_pod_typem_Prop)

-- Typ `Nat` jest również termem typu `Type` ...
#check Nat -- Nat : Type
-- ... ale zachowuje się inaczej, bo termy tego typu ...
#check 2   -- 2 : Nat
-- ... nie są typami: Lean sygnalizuje poniżej błąd, ponieważ `2` nie jest typem, to tylko term. Nie istnieją
-- termy typu `2`. Widzimy oto, że chociaż `Prop : Type` i `Nat : Type`, to `Prop` i `Nat` "zachowują się"
-- inaczej.
variable (cos_pod_2 : 2)

-- Tutaj również pojawia się błąd, bo term typu, który ma typ `Prop`, nie jest już typem ("mieszka na dnie").
variable (nizszy_term : jakis_term)
```

A więc "zaraz pod" typem `Type` (a tak naprawdę `Type 0`) mamy na przykład typ `Nat` (i wiele
innych), ale "zaraz pod" typem `Nat` mamy już tylko termy, które same nie są typami. Chociaż typ
`Prop` też jest bezpośrednio pod tym samym typem `Type` co `Nat`, to jednak "ma pod sobą" również
*typy*. Oficjalnie mówimy, że typ `Prop` *zamieszkują* typy.

Nazwa typu `Prop` jest skrótem od angielskiego słowa *Proposition* oznaczającego *zdanie* albo
*sąd*. Typ `Prop` będzie dla nas ważny, ponieważ tak jak dowolne pary liczb rzeczywistych można
dzięki układowi współrzędnych konsekwentnie interpretować jako punkty na płaszczyźnie, tak dzięki
izomorfizmowi Curry'ego-Howarda *termy typu `Prop`* można konsekwentnie interpretować jako
(formalne) *zdania*:

*Termy typu `Prop` można konsekwentnie interpretować jako zdania*.

Dlatego takie termy będę odtąd często nazywał po prostu zdaniami. Ponieważ `Prop` jest typem
wyższego rzędu, *zdania są typami*, dlatego zdania będę nazywał też czasem *typami zdaniowymi* (a
typ `Prop` *typem zdań*). Będziesz się również stopniowo przyzwyczajać do tego, że:

*Termy typu zdaniowego można konsekwentnie interpretować jako dowody tego zdania (czyli tego typu
zdaniowego)*.

Wydaje mi się, że najlepiej jest się do tego przyzwyczajać grając w grę polegającą na dowodzeniu
twierdzeń.

## Pierwsze twierdzenie jako funkcja

**Polecenie**: Dokończ poniższą definicję w trybie interaktywnym tak, jak to robiłaś wcześniej,
używając taktyk `intro` i `exact`. Jedyna trudność, jaka może się tutaj pojawić, to fakt, że
pierwszy raz używasz typu `Prop`. W tym przypadku jedyne, co się liczy, to fakt, że to jest pewien
typ (a `zdanie` jest pewnym parametrem funkcji `twierdzenie`):

```lean
def twierdzenie (zdanie : Prop) : zdanie → zdanie := by
```

**Polecenie**: Dokończ tą samą definicję jeszcze raz, ale tym razem nie używając trybu
interaktywnego. Trzeba będzie usunąć kod, który przed chwilą napisałaś i trzeba będzie usunać też
słowo kluczowe `by`; albo możesz napisać tą definicję od nowa, używając innej nazwy dla definiowanej
stałej. Potraktuj `Prop` jak jakiś typ, taki jak inne i dokończ definicję tak, jakby to była funkcja
identycznościowa (działająca tylko dla termów typu `Prop`). Przypuszczam, że to będzie dla Ciebie w
tym momencie łatwe.

Jeżeli udało Ci się wykonać ostatnie polecenie, to właśnie na dwa sposoby *całkowicie formalnie
udowodniłaś* pewne *twierdzenie matematyczne*! Mówiąc dokładniej, udowodniłaś (parametryczną)
tautologię *Jeżeli A, to A*, gdzie *A* to jakieś zdanie.

# Pojęciowy zawrót głowy

Pamiętasz moje uwagi na temat układu kartezjańskiego i innych izomorfizmów? Tego rodzaju izomorfizmy
mogą się na początku wydawać obce, ale przełączając się przez pewien czas regularnie między punktami
widzenia, które odpowiadają ich "stronom", możemy zacząć postrzegać pewne rzeczy w nowy
sposób. Dzięki temu możemy zacząć w całkiem nowy sposób myśleć, a dzięki temu czasem lepiej sobie
radzić z rozwiązywaniem pewnego rodzaju problemów, bo przecież co dwa punkty widzenia to nie jeden,
zwłaszcza gdy te dwa punkty widzenia są zarazem *różne* i *idealnie dopasowane*.

Żeby "zanurzyć się" w izomorfizmie Curry'ego-Howarda trzeba *stopniowo* opanować sztukę *w miarę*
konsekwentnego *odróżniania*:

1. Dowolnych zdań *jako takich*, a więc niekoniecznie prawdziwych, od...

2. *Prawdziwości lub fałszywości* zdań, a tego z kolei od...

3. Ewentualnego *faktu*, że jakieś zdanie (albo jego negacja) *ma dowód*, wreszcie...

4. *Założenia*, że jakieś zdanie ma *jakiś* dowód, od *konkretnego kodu* albo *konstrukcji* dowodu.

Na przykład, w dopiero co udowodnionym przez Ciebie twierdzeniu `twierdzenie : (zdanie : Prop) →
zdanie → zdanie` parametr `zdanie` reprezentuje *jakieś*, czyli bliżej nieokreślone zdanie, a typ
`zdanie → zdanie` to typ termów typu zdaniowego (bo jeżeli `zdanie` ma typ `Prop`, czyli jest jakimś
zdaniem, to `zdanie → zdanie` jest również zdaniem). Ciało definicji stałej `twierdzenie` jest
termem typu `zdanie → zdanie`, a więc jest dowodem tego (parametrycznego) zdania. Ponieważ Lean nie
zasygnalizował błędu, wiemy, że to jest poprawne (składniowo) zdanie, że skonstruowany kod jest
poprawnym kodem, który w dodatku jest dowodem tego zdania, i że wobec tego to zdanie jest prawdziwe.

W tym momencie to, że to nie są te same rzeczy, może Ci się wydawać zrozumiałe i może wręcz nie
warte objaśniania, ale możliwe, że te fundamentalne rozróżnienia będą Ci na początku sprawiały
trudności nawet w stosunkowo prostych sytuacjach. Dlatego przypominam jeszcze raz - oswojenie się z
tym wszystkim jest przede wszystkim kwestią *czasu* (i przerw!).

Oswajanie się z nieznanymi wcześniej fragmentami matematyki może przypominać ... wykształcanie się
[skrzel](https://pl.wikipedia.org/wiki/Skrzela_(anatomia)). Na początku czujemy, że zanurzamy się w
nowym, obcym (pojęciowym) środowisku, w którym nie jesteśmy w stanie przebywać zbyt długo i szybko
się męczymy; to jest więc trochę tak, jakbyśmy się znaleźli pod powierzchnią wody. Jednak z czasem,
jeżeli tylko będziemy nadal wracać do tego początkowo nowego dla nas środowiska, po przerwach, w
których możemy normalnie oddychać, odzyskujemy siły i nabywamy jakiś adaptacji, będzie się ono dla
nas stawało coraz bardziej znajome i przez to coraz bardziej naturalne. Aż w końcu wykształcimy coś
w rodzaju mentalnego organu, którego wcześniej nie było. W ten sposób możemy uczyć się nowych
wyspecjalizowanych języków, a wraz z nimi *nowych uniwersalnych sposobów konsekwentnego myślenia*,
które oferuje współczesna matematyka.

## Implikacje jako funkcje

Implikacja jest być może najważniejszym spójnikiem w logice. Mówiąc luźno, implikacjami nazywamy
zdania o postaci *Jeżeli A, to B*, gdzie *A* i *B* to *dowolne* zdania, proste lub złożone (i tylko
same zdania, a nie ich prawdziwość czy fałszywość, albo fakt bycia dowiedzionym, albo ich
dowody). Implikacje zapisujemy formalnie za pomocą strzałki skierowanej w prawo: *→* (w literaturze
często spotykamy też symbol *⇒*). Wygląda znajomo?

Jeżeli *A* i *B* to zdania - i tylko wtedy - to formalnie, czyli w "oficjalnym" języku matematyki,
implikację *Jeżeli A, to B* zapisujemy zwykle jako *A → B*. Nic? Żadnych skojarzeń?

**Terminologia logiczna**: Mówiąc krótko, jeżeli *A* i *B* to zdania, to *A → B* to zdanie, które
czytamy jako *Jeżeli A, to B*. A mówiąc trochę dłużej: Zawsze, gdy mamy jakieś dwa, niekoniecznie
różne zdania *A* i *B*, możemy napisać *A → B* i to będzie [*formuła
logiczna*](https://pl.wikipedia.org/wiki/Formu%C5%82a_logiczna), którą interpretujemy jako
(niekoniecznie prawdziwe, ani tym bardziej udowodnione) zdanie *Jeżeli A, to B*. Mówimy też, że *→*
to w logice pewna *dwuargumentowa operacja* albo *działanie*, tyle że na zdaniach, które to
działanie z dwóch *zdań jako takich* (niekoniecznie udowodnionych czy prawdziwych) robi jedno
(niekoniecznie udowodnione czy prawdziwe) unikalne zdanie złożone, dające się konsekwentnie
interpretować jako *Jeżeli A, to B*.

Może przyda Ci się wyobrazić sobie, że zdanie w logice to coś płaskiego i niemal przezroczystego, a
jego dowód to jakiś barwny skarb, który prześwituje przez powierzchnię zdania, o ile ten dowód
istnieje i umiemy na to zdanie popatrzeć tak, żeby ten prześwit zobaczyć. Ja tak czasem o tym myślę.

**Analogia między implikacjami i typami funkcyjnymi**:

Jeżeli *A* i *B* to *zdania*, to *A → B* jest *implikacją*.

Jeżeli `A` i `B` to *typy*, to `A → B` jest *typem funkcyjnym*.

Analogia, a raczej doskonałe dopasowanie jakie występuje między zdaniami i (pewnymi) typami może
wyglądać jak wieloznaczność i w pewnym sensie nią jest. Jednak to byłaby wieloznaczność
problematyczna tylko gdybyśmy sprawili, że nie jest całkiem jasne, którą interpretację stosujemy i
gdyby *jednocześnie* ta różnica w dopuszczalnych interpretacjach miała znaczenie dla poprawności
wniosków. Używając układu współrzędnych też korzystałaś z pewnej podwójności interpretacji, a więc
pewnej wieloznaczności, i wyszło Ci to, jak sądzę, na dobre, prawda?

**Terminologia ogólna**: W matematyce *unikalne* znaczy *dokładnie jedno danego rodzaju*. I tak, w
przypadku implikacji otrzymujemy unikalne zdanie powstające w taki a nie inny sposób z każdej
określonej pary zdań: Jeżeli *A* i *B* to zdania, to *A → B* jest unikalną implikacją *powstającą z
tych dwóch zdań w tej kolejności*, czyli jest unikalnym obiektem *tego rodzaju*. Chodzi po prostu o
to, że jak już mamy jakieś dwa określone zdania *A* i *B*, to możemy z nich zrobić *tylko jedną*
implikację o postaci *A → B*. Podobnie dodawanie to operacja na liczbach, która z dwóch dowolnych,
niekoniecznie różnych liczb, na przykład *2* i *2*, "robi" unikalną liczbę, w tym wypadku *4*. Ten
wynik jest w przyjętym znaczeniu unikalny, chociaż dodawanie nieskończenie wielu innych par liczb
(na przykład całkowitych) daje taki sam rezultat. Mówimy też, że zdania w postaci implikacji są
*funkcją* uporządkowanych par zdań. Uporządkowanych, bo ma znaczenie, które zdanie traktujemy jako
poprzednik, a które jako następnik implikacji.

**Zalety maksymalnej formalności**: Wiem, że często piszę długie zdania. Tym razem jednak chociaż
przez chwilę robiłem to celowo. Chciałem w ten sposób zilustrować coś ważnego: Dzięki temu, że
posługujemy się prostymi symbolami na oznaczenie dowolnie złożonych zdań, możemy lepiej zapanować
nad strukturą rozumowania w sytuacjach, w których bez takiego skrótowego zapisu moglibyśmy się łatwo
pogubić. Logika pozwala nam *w kontrolowany sposób ignorować treść*, *bez szkody dla
poprawności*. To też, to jest pewnego rodzaju "beztreściowość", mamy na myśli mówiąc o "formalności"
zapisu matematycznego. Wreszcie, formalny zapis ułatwia robienie czegoś, co jest ogromną siłą
matematyki - ułatwia a właściwie umożliwia rozwiązywanie zarówno prostych jak i złożonych problemów
*mechanicznie*, jakbyśmy układali puzzle albo grali w jakąś inną grę.

Coś takiego będziemy właśnie robić, a właściwie już dawno zaczęliśmy to robić. To znaczy, będziemy
dalej grać w grę polegającą na konstruowaniu dowodów *całkowicie* formalizując przy tym każdy
problem. Będziemy więc używać matematyki w sposób *bardziej* formalny niż ma to zwykle miejsce nawet
w zaawansowanych podręcznikach do matematyki. Matematycy tak zwykle *nie* postępują, bo im się nie
chce i (zwykle) nie muszą; zamiast tego polegają na domyślności kompetentnego odbiorcy. My nie
chcemy się musieć niczego domyślać, bo nie jesteśmy tak kompetentni jak zawodowi
matematycy. Jesteśmy za to *psychologami*, a więc zarówno sami matematycy, jak i wszystko, co
zrobili lub zrobią, *należy do przedmiotu naszych badań*!

Pełna formalizacja wymaga dodatkowego wysiłku, ale dzięki niej będzie nam często *łatwiej*. Przede
wszystkim zaś wszystko, co napiszemy, będzie *sprawdzone przez algorytm, który zawsze da nam
odpowiedź, czy to, co napisaliśmy, jest poprawne*. Będziemy więc w pewnym sensie "zawsze bezpieczni"
w swoich matematycznych eksperymentach.

Koszt, który musimy ponieść, żeby to osiągnąć, to częściowe oswojenie się z co prawda mniej złożonym
niż język polski, ale obcym, sztucznym, i bezlitośnie sztywnym językiem, jakim jest formalny język
(a raczej *języki*) matematyki. Tak samo jak to ma miejsce w przypadku nauki każdego nowego języka,
trzeba się uzbroić w cierpliwość (jeszcze chyba wspomnę o tej cierpliwości później).

Jest jak sądzę wiele prawdy w stwierdzeniu, którego autorem jest genialny polski matematyk [Jerzy
von Neumann](https://en.wikipedia.org/wiki/John_von_Neumann), że często (co nie znaczy, że zawsze)
matematykę się nie tyle *rozumie*, ile raczej się do niej stopniowo *przyzwyczaja*. Dodam do tego od
siebie, że gdy się już trochę do niej przyzwyczai (co wymaga przede wszystkim *czasu*), to
zadziwiająco często okazuje się, że jej pojęcia, twierdzenia i teorie wyrażają coś, co rozumiało się
nieźle już wcześniej, tylko nie umiało się o tym dostatecznie *konsekwetnie* albo *spójnie mówić*, a
więc również dostatecznie *jasno myśleć*. Bo matematyka jest między innymi *obcym* i *sztucznym
językiem*, a właściwie stale rosnącą kolekcją takich wyspecjalizowanych języków, i żeby zrozumieć
to, o czym w takich obcych i sztucznych językach można mówić, trzeba *przyzwyczaić się* do
najbardziej podstawowych zasad dotyczących tego, jak się tych języków używa, to jest do *reguł
składniowych*, a to wymaga czasu, tak samo jak czasu wymaga opanowanie gramatyki na przykład języka
polskiego.

## Pojęcie prawdy w logice konstruktywnej

Na koniec tego rozdziału powiem jeszcze coś na temat dwóch najważniejszych dla nas logik, to jest
logiki *konstruktywnej* i *klasycznej*. Być może miałaś już do czynienia z elementami logiki zdań i
słyszałaś już na przykład o koniunkcji albo o implikacji. Jeżeli tak, to może to być teraz do
pewnego stopnia *przeszkodą*, ponieważ logika zdań jest najczęściej wykładana w wersji tak zwanej
*klasycznej*, w której prawdą jest, że:

*Każde zdanie jest albo prawdziwe, albo fałszywe.*<br/>(zdanie prawdziwe w logice klasycznej)

Jak również:

*Dla każdego zdania P, jeżeli nieprawda, że nieprawda, że P, to P*. <br/>(inne zdanie prawdziwe w
logice klasycznej)

W Leanie domyślnie (można to łatwo zmienić, ale nie będziemy tego teraz robić) używamy logiki
konstruktywnej, inaczej *intuicjonistycznej*, a nie klasycznej. Ta logika jest "ostrożniejsza" w tym
znaczeniu, że wszystko, co jest prawdą w logice konstruktywnej, jest też prawdą w logice klasycznej,
ale nie odwrotnie. O ostrożniejszych założeniach lub teoriach i o ogólniejszych pojęciach mówimy, że
są *słabsze*, w znaczeniu mniej *zobowiązujące*, albo - czasami - mniej *spekulatywne*. W logice
konstruktywnej można przyjąć, że:

*Zdanie prawdziwe to to samo, co zdanie udowodnione.*<br/>(dopuszczalna interpretacja prawdy w
logice konstruktywnej)

Co za różnica? Jeżeli postanowimy intepretować słowo "prawdziwe" jako równoznaczne z "udowodnione",
to *nie możemy* zaakceptować jako prawdziwego zdania *Każde zdanie jest albo prawdziwe, albo
fałszywe* (nazywanego m.in. [zasadą wyłączonego
środka](https://en.wikipedia.org/wiki/Law_of_excluded_middle)), ponieważ wiemy (istnieje
twierdzenie, które o tym mówi), że w matematyce da się skonstruować takie poprawne zdania, że *nie
da się* udowodnić ani tych zdań, ani ich negacji. W logice konstruktywnej nie możemy więc również
zaakceptować zasady podwójnej negacji (jeżeli nieprawda, że nieprawda, że *p*, to *p*), bo zasada
wyłączonego środka z niej wynika (i vice versa). Jeżeli Cię to niepokoi, to zapewniam, że logika
klasyczna nieprędko będzie dla nas ważna, a gdy to nastąpi, będziesz na to gotowa.

Żeby udowodnić w logice konstruktywnej implikację *A → B*, gdzie *A* i *B* to dowolne zdania, trzeba
*skontruować językową procedurę* (czyli napisać program, albo stworzyć funkcję), która dowolny dowód
zdania *A* przekształca w dowód zdania *B*.

Oto *reguła dedukcji* mówiąca o tym, w jaki sposób można *udowodnić implikację* (zaraz wyjaśnię, co
oznacza ten zapis):

Jeżeli *A* i *B* to zdania, to:

*A*  
.  
.  
.  
<ins><em>B</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</ins>  
*A → B*

W taki sposób zwykle zapisujemy reguły dedukcji. Reguły dedukcji mówią, jakie nowe kroki (zdania)
możemy wprowadzić do naszego dowodu w jakich warunkach. Ta akurat reguła (reguła *wprowadzenia*
implikacji) mówi, że jeżeli zakładając *A* (i być może przyjmując wcześniej inne założenia) da się
wyprowadzić w jakikolwiek sposób (to właśnie oznaczają te zapisane pionowo kropki) *B*, to można
wprowadzić albo zaakceptować albo uznać za prawdziwe (na mocy wszystkich wcześniejszych założeń i
wyprowadzonych wniosków) zdanie *A → B*. Mówiąc krótko: Jeżeli z *A* da się wyprowadzić *B*, to
można zaapceptować zdanie *A → B*. Albo najkrócej: Jeżeli z *A* wynika *B*, to *A → B*.

W logice konstruktywnej *prawdziwe* znaczy to samo, co *ma (jakiś) dowód*. Dlatego ta reguła
dedukcji ma w tej logice taką a nie inną *interpretację*: *Jeżeli z dowodu A można zrobić (w danym
kontekście) dowód B, to ten sposób przekształcania dowodów A w dowody B jest dowodem A → B*.

Albo: Dowód *A → B* to każdy sposób uzyskania dowodu *B* z *dowolnego* dowodu *A*.

Czy widzisz, że to jest ciągle ta sama reguła dedukcji, ale wydaje się zmieniać, bo zmieniamy
sposób, w jaki *my* o niej mówimy, to jest w jaki interpretujemy pojęcie prawdy (albo akceptacji
zdania w dowodzie)?

A przecież: Jeżeli `A` jest zdaniem, czyli termem typu `Prop`, to term typu `A` jest dowodem tego
zdania.

Wobec tego ...

```lean
def tautologia (A : Prop) : A → A := fun (h : A) => h
```

... jest dowodem tautologii *A → A* (jeżeli *A*, to *A*) dla każdego zdania *A*.

Sam fakt, że da się skonstruować funkcję o typie `(A : Prop) → A → A` oznacza, że wiedząc *tylko
tyle*, że *A* jest jakimś zdaniem, można z dowolnego dowodu *A* zrobić dowód *A*. Jeżeli *A* to
zdanie, to *Jeżeli* A *, to* A. Nic prostszego, prawda?

O ile tylko będziesz cierpliwa, to przyjdzie taki moment, w którym moje próby przyzwyczajenia Cię do
interpretacji typów jako zdań i termów tych typów jako ich dowodów staną się irytujące, ponieważ to
wszystko będzie prawie natychmiast oczywiste. Będziesz wtedy nawet wolała się nad tym za bardzo nie
zastanawiać, podobnie jak ktoś, kto nauczył się w miarę płynnie grać utwór na pianinie woli nie
myśleć o nazwach kolejno granych akordów czy nut.

Jeszcze jedna uwaga na temat często stosowanych, ale rzadko objaśnianych konwencji: Gdy matematycy
nagle zmieniają notację i wydaje się, że bez wyraźnego powodu na to samo zamiast małych liter
używają dużych, często chcą w ten sposób zasugerować, że mają na myśli również dowolnie *złożone*,
albo bardziej złożone niż wcześniej, albo w pewnym sensie większe obiekty danego rodzaju. Tutaj
zacząłem w pewnem momencie oznaczać arbitralne zdania dużymi literami właśnie w tym celu - żeby
zasygnalizować, że chodzi o zdania dowolnie złożone.

Przypominam na koniec fragment prozy matematycznej, który pojawił się w trzecim rozdziale:

> Jeżeli *n* i *m* to liczby naturalne, to *n + m = m + n*.

Czy widzisz, że *dokładnie to samo* możemy zapisać w dosyć *naturalny, zwięzły i czytelny* sposób w
naszym języku jako (ilustracja) ...

```lean
def przemiennosc_dodawania (n : Nat) (m : Nat) : n + m = m + n := ...
```

... gdzie `n + m = m + n` to *zdanie parametryczne*? W Leanie to zdefiniowane już twierdzenie jest
dostępne jako wartość stałej `Nat.add_comm`, gdzie *comm* to skrót od angielskiego *commutativity*,
oznaczającego przemienność (tutaj akurat operacji dodawania).

Ponieważ matematyka to dla nas programowanie, a twierdzenia to dla nas funkcje, możemy *stosować
twierdzenia* w taki sam sposób w jaki stosujemy wszystkie inne funkcje:

```lean
-- `Nad.add_comm` to twierdzenie i jednocześnie funkcja dwuargumentowa, która z podanych argumentów 
-- odpowiedniego typu tworzy dowód szczególnej wersji zdania `n + m = m + n`, gdzie `n` i `m` to parametry.
#check Nat.add_comm -- Nat.add_comm (n m : Nat) : n + m = m + n

-- Widzimy poniżej, że aplikacja `Nad.add_comm 2 3` jest dowodem zdania `2 + 3 = 3 + 2`:
#check Nat.add_comm 2 3 -- Nat.add_comm 2 3 : 2 + 3 = 3 + 2
```

Jeżeli masz ochotę, to może zerknij znowu na [tą część rozdziału
czwartego](https://github.com/boryspaulewicz/matematyka_dla_psychologow/blob/main/rozdzialy/Pierwszy_spacerek.md#ten-tytu%C5%82-jest-tylko-po-to-%C5%BCeby-do-niego-p%C3%B3%C5%BAniej-wr%C3%B3ci%C4%87)
i zobacz, czy zmienił się sposób, w jaki teraz postrzegasz to, o czym tam pisałem.

### Przypisy

[^1]: Dawno, dawno temu byłem w Krakowie na koncercie zespołu
    [5’nizza](https://pl.wikipedia.org/wiki/5%E2%80%99nizza), na którym Serhij Babkin i Andriej
    Zaporożec wykonywali utwory z płyty [П'ятниця](https://www.youtube.com/watch?v=nnWMrmTWonI),
    której lubiłem wtedy czasami posłuchać. W pewnym momencie któryś z wykonawców sięgnął po butelką
    i wtedy usłyszałem z sali krzyk "Nie pij tej wody!". Uważam, że to było bardzo śmieszne.
