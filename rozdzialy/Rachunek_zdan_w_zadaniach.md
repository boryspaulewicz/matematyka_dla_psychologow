## O czym teraz będzie

W tym rozdziale kończymy, a może raczej na dobre zaczynamy, uczyć się podstaw rachunku zdań.

<hr>

# Rachunek zdań w zadaniach

[Rachunek zdań](https://pl.wikipedia.org/wiki/Rachunek_zda%C5%84) to pewien wymyślony dla
określonych celów *język*. *Reguły syntaktyczne* (inaczej składniowe) języka mówią, jaką strukturę
mają poprawne wyrażenia tego języka. Podstawową kategorią syntaktyczną rachunku zdań jest kategoria
*zdania logicznego* w tym znaczeniu, że język rachunku zdań to w pewien sposób zdefiniowany zbiór
zdań. Elementy należące do tego zbioru (albo typu) nazywamy też *formułami logicznymi*, ale to
ostatnie pojęcie jest ogólniejsze, bo formułami logicznymi nazywamy poprawne wyrażenia w systemach
logicznych w ogóle, formułami logicznymi są na przykład poprawne zdania w rachunku kwantyfikatorów.

Już wiesz, czym są zdania w rachunku zdań:

1. Zmienne zdaniowe, takie jak `p`, `q`, `r`, `p₀`, `p₁`, i tak dalej, są, albo mogą być,
(poprawnymi) zdaniami logicznymi, albo krótko zdaniami. Takie zdania (inaczej formuły) nazywamy
zdaniami *atomowymi*, ponieważ nie mają wewnętrznej struktury (ewentualne indeksy dolne służą tu
tylko do odróżnienia zmiennych zdaniowych).

2. Jeżeli `P` jest (być może złożonym) zdaniem, to `¬P` też jest zdaniem.

3. Jeżeli `P` i `Q` są (niekoniecznie różnymi i być może złożonymi) zdaniami, to `P → Q` też jest
   zdaniem.

4. Jeżeli `P` i `Q` są zdaniami, to `P ↔ Q` też jest zdaniem.

5. Jeżeli `P` i `Q` są zdaniami, to `P ∧ Q` też jest zdaniem.

6. Jeżeli `P` i `Q` są zdaniami, to `P ∨ Q` też jest zdaniem.

To jest *definicja indukcyjna* zdań, a więc zdaniami są wszystkie te i tylko te wyrażenia, które
powstają przez stosowanie tych reguł. Zwracam uwagę, że mamy tu do czynienia tylko ze składnią, w
szczególności, te 6 reguł nie mówi *nic* na temat tego, w jaki posób prawdziwość pewnego rodzaju
zdań zależy od prawdziwości innych zdań. Tego rodzaju definicje syntaktyczne zapisujemy czasem w tak
zwanej [notacji Backusa-Naura](https://pl.wikipedia.org/wiki/Notacja_BNF) (*BNF*), z której chętnie
korzystają informatycy (i trudno im się dziwić):

```
-- Definicja zbioru zdań w notacji BNF
Z ::= V|¬Z|Z → Z|Z ↔ Z|Z ∧ Z|Z ∨ Z 
```

gdzie `Z` to definiowany zbiór zdań, a `V` to jakiś wcześniej zdefiniowany zbiór zmiennych
zdaniowych, na przykład `\{a, b, c, ..., a₀, a₁, a₂, ..., b₀, b₁, b₂, ...\}`. Symbol `::=` oznacza w
notacji BNF definiowanie, a `|` czytamy jako *lub*. To jest więc zwięźle zapisana *indukcyjna
definicja rekurencyjna*: zdaniem jest każda zmienna (`V`) lub (`|`) wyrażenie `Z → Z`, gdzie *każde
wystąpienie* litery `Z` można zastąpić przez cokolwiek, co ze względu na przyjęte reguły konstrukcji
zdań jest zdaniem (rekurencja), i tak dalej.

Zwracam też uwagę, że spójniki logiczne są tu operacjami *aksjomatycznymi* (negacja jest operacją
jednoargumentową, pozostałe spójniki to operacje dwuargumentowe); biorąc pod uwagę te 6 reguł
jedyne, co możemy zrobić z tymi operacjami, to aplikować je do argumentów zdaniowych. Co więcej,
zdefiniowany w ten sposób zbiór zdań to właściwie nie jest zbiór zdań, tylko zbiór elementów,
których można będzie używać jak zdań, *o ile* dodamy do tych reguł jakieś reguły semantyczne.

W naszym (teoriotypowym) języku bycie zdaniem to dokładnie zamieszkiwanie typu `Prop`. Dzięki typom
zależnym możemy *zdefiniować* w języku teorii typów wszystkie spójniki, za wyjątkiem wbudowanej w
język teorii typów implikacji. To jest oczywiście przyjemne (albo nie, rzecz gustu), jednak ta
ekspresyjność teorii typów nie ma większego znaczenia gdy używamy *samej* logiki.

*Reguły semantyczne* języka dotyczą *znaczenia* (poprawnych składniowo) wyrażeń tego języka. U nas
semantyka języka rachunku zdań sprowadzała się do tej pory do reguł tworzenia i przekształcania
termów typów zdaniowych, które były pewnymi *obiektami* (albo metodami) *obliczeniowymi,
interpretowalnymi jako dowody*. A więc nasza semantyka sprowadzała się do specyficznie modelowanych
(jako programy i struktury danych) *reguł dowodzenia*, ponieważ jedyną wersją prawdziwości, którą
się do tej pory zajmowaliśmy, była prawdziwość rozumiana jako dowiedlność, a dowiedlność oznaczała
istnienie poprawnego termu, czyli kodu, danego typu zdaniowego. Nie wiem, czy rzuciło Ci się to już
wcześniej w oczy, ale jak dotąd nasze reguły składniowe i semantyczne były ze sobą nierozerwalnie
związane. Na przykład, definiując typ zdań o postaci koniunkcji od razu określiliśmy, w jaki sposób
można konstruować dowody takich zdań (tworząc pary uporządkowane) i rozstrzygnęliśmy jednocześnie, w
jaki sposób można ich używać do dowodzenia innych zdań (używając projekcji z par).

## *Klasyka*

W tym rozdziale dodamy nowy aksjomat, przez co uogólnimy pojęcie prawdziwości zdań i otrzymamy w ten
sposób wersję klasyczną rachunku zdań (*KRZ*). Można powiedzieć, że logika *klasyczna* od
konstruktywnej różni się tylko jednym dodatkowym aksjomatem (który akurat w Leanie jest
*twierdzeniem* wyprowadzonym z innych aksjomatów, patrz [twierdzenie
Diaconescu](https://en.wikipedia.org/wiki/Diaconescu%27s_theorem)), nazywanym zasadą albo prawem
[wyłączonego środka](https://pl.wikipedia.org/wiki/Prawo_wy%C5%82%C4%85czonego_%C5%9Brodka)
(ang. *excluded middle* albo *excluded third*, łac. *tertium non datur*). Zgodnie z tym aksjomatem
*każde* zdanie jest albo prawdziwe albo fałszywe (czyli prawdziwa jest jego negacja). Dostępną w
Leanie implementację tej zasady znajdziemy w przestrzeni nazw `Classical` (`em` to właśnie skrót od
*excluded middle*):

```lean
#check Classical.em -- `Classical.em (p : Prop) : p ∨ ¬p` 
```

W logice *konstruktywnej* jeżeli `p` to zdanie, to o zdaniu `p ∨ ¬p` możemy stwierdzić, że jest
prawdziwe wtedy i tylko wtedy, gdy albo mamy dowód zdania `p`, albo mamy dowód zdania `¬p`, a więc w
logice konstruktywnej zdania o takiej strukturze nie są prawdziwe *automatycznie*; w logice
konstruktywnej *nie* zakładamy, że *wszystkie* (poprawne składniowo) zdania są albo prawdziwe, albo
fałszywe.

Dla nas zasada wyłączonego środka będzie aksjomatem, a nie twierdzeniem (chociaż równie dobrze
moglibyśmy używać implementacji Leana):

```lean
axiom em (p : Prop) : p ∨ ¬p
```

Korzystając z aksjomatu `em` możemy udowodnić zasadę podwójnej negacji (ang. *double negation*):

```lean
theorem dneg (p : Prop) : ¬¬p → p :=
  -- Nazwa parametru `nnp` ułatwia zapamiętanie, że to jest dowód zdania `¬¬p`
  fun nnp =>
    -- `em p` to dowód alternatywy `p ∨ ¬p`, której używamy do uzyskania dowodu `p` wykazując, że w
    -- tym kontekście `p` wynika z dowodu obydwu członów tej alternatywy, to jest zarówno ze zdania
    -- `p` jak i ze zdania `¬p`.
    (em p).elim
     (fun hp => hp)
     (fun np => (nnp np).elim)
```

Czasem stosuję takie właśnie formatowanie kiedy używam w nieinteraktywnych dowodach reguły
eliminacji alternatywy: Kiedy używam dowodu `p ∨ q` do udowodnienia `r`, dowody implikacji `p → r` i
`q → r` zapisuję w kolejnych liniach, przesunięte w prawo względem linii, w której pojawia się na
końcu stała `elim`. Może byłoby nawet lepiej pisać w stylu ...

```lean
 ...
 Or.elim (em p)
   (fun hp => hp)
   (fun np => (nnp np).elim)
```

... bo wtedy można by szybciej zauważyć, że chodzi o regułę eliminacji dla altarnatywy, a nie na
przykład dla koniunkcji? Kto wie, może? A poza tym, jeżeli człony alternatywy to `p` i `q`, to
parametry tych dowodów-funkcji nazywam `hp` i `hq`, i dzięki temu, że trzymam się tej konwencji dość
konsekwentnie, zacząłem się do niej przyzwyczajać i widzę, że ułatwia mi pisanie dowodów.

## Przepraszam, ale nie przepraszam

Często używam też w tego typu sytuacjach słowa kluczowego `sorry`, które mówi Leanowi, że dany
fragment kodu będzie uzupełniony później i ma się tym miejscem na razie nie przejmować. Na przykład,
ten ostatni dowód napisałem tak:

```lean
-- To nam się odtąd przyda.
variable (p q r : Prop)

-- Najpierw w miejscu argumentów dla eliminacji alternatywy `p ∨ ¬p` napisałem coś takiego, ...
example : ¬¬p → p :=
  fun nnp => (em p).elim () sorry

-- ... bo w ten sposób na czerwono podkreślony jest tylko (jeszcze nie skonstruowany) pierwszy
-- argument. Gdydym zaczął od konstruowania dowodu zdania `p → p`, bez dopisania zaraz obok nawiasów
-- słowa `sorry`, Lean podkreśliłby cały kod na prawo od `=>` na czerwono, ...
example : ¬¬p → p :=
  fun nnp => (em p).elim (fun hp => hp)

-- ... i nie zobaczyłbym potwierdzenia, że argument `(fun hp => hp)` jest poprawny. Potem napisałem
-- dowód `p → p`, ...
example : ¬¬p → p :=
  fun nnp => (em p).elim (fun hp => hp) sorry

-- ... potem zastąpiłem słowo `sorry` dowodem `¬p → p`, ...
example : ¬¬p → p :=
  fun nnp => (em p).elim (fun hp => hp) (fun np => (nnp np).elim)

-- ... i zmieniłem formatowanie na bardziej czytelne:
example : ¬¬p → p :=
  fun nnp => 
   (em p).elim 
    (fun hp => hp)
    (fun np => (nnp np).elim)
```

Skoro w ostatnim rozdziale omówiłem zdefiniowaną w Leanie, uniwersowo uniwersalną identyczność `id`,
to pokażę Ci przy okazji, jak można jej użyć w tym dowodzie:

```lean
example : ¬¬p → p :=
  fun nnp => 
   (em p).elim
    -- Poprzedzenie stałej `id` znakiem `@` sprawia, że parametry implictne stają się jawne, dzięki
    -- czemu nie musimy pisać `id (α := p)`. Aplikacja `@id p` jest częściowa, ponieważ funkcja `id` ma
    -- dwa parametry (a razem z poziomem sortu trzy), i ta częściowa aplikacja oznacza
    -- wyspecjalizowaną identyczność dotyczącą typu `p`, czyli dowód `p → p`.
    (@id p)
    (fun np => (nnp np).elim)
```

**Sugestia**: Jeżeli nie jest dla Ciebie jasne, w jaki sposób w tym ostatnim dowodzie stosujemy
zasadę wyłączonego środka, być może będzie Ci łatwiej to zrozumieć konstruując dowód podwójnej
negacji w trybie interaktywnym. Jak zawsze, możesz prześledzić, co się dzieje w dowodzie poniżej,
przesuwając kursor na koniec kolejnych linii i patrząc, jak zmienia się stan dowodu. Warto moim
zdaniem spróbować skonstruować taki sam lub podobny dowód samodzielnie, najlepiej przynajmniej raz w
trybie interaktywnym i przynajmniej raz pisząc kod wprost.

```lean
example : ¬¬p → p := by
  intro nnp           -- Wprowadzamy do kontekstu poprzednik `¬¬p → p` jako hipotezę `nnp : ¬¬p`
  have h := em p      -- Dodajemy do kontekstu skonstruowany w kodzie za pomocą aksjomatu `em` dowód
                      -- `h : p ∨ ¬p`.
  cases h             -- Najpierw używamy hipotetycznego dowodu `h : p`.
  assumption          -- Dowód celu jest w kontekście, więc można użyć taktyki `assumption`.
                      -- Teraz używamy hipotetycznego dowodu `h : ¬p`.
  rename_i np         -- Zmieniamy automatycznie ustaloną i dlatego wyświetlaną innym kolorem nazwę
                      -- `h` na `np`, żeby móc się nią posługiwać w kodzie dowodu.
  exact absurd np nnp -- ex falso quodlibet (quod erat demonstrandum)
```

Implikacja w drugą stronę nie wymaga zasady wyłączonego środka:

```lean
example : p → ¬¬p :=
  -- Ponieważ `¬q` to `q → False`, to `p → ¬¬p` jest zdaniem
  -- `p →      ¬p →  False`.
 fun hp => fun np => np hp
 
-- Można też tak, jeśli się chce:
example : p → ¬¬p :=
  fun hp => 
    show ¬p → False from 
      fun np => show False from np hp
```

Możemy więc udowodnić *równoważność* `p ↔ ¬¬p`. Ponieważ równoważność to koniunkcja dwóch
implikacji - z lewej do prawej (tutaj `p → ¬¬p`) i z prawej do lewej (tutaj `¬¬p → p`) - to, żeby
było mi później łatwiej tworzyć parę uporządkowaną, napisałem najpierw to:

```lean
example : p ↔ ¬¬p :=
  ⟨sorry,
   sorry⟩

-- Potem zastąpiłem pierwsze przeprosiny dowodem `p → ¬¬p`, ...
example : p ↔ ¬¬p :=
  ⟨fun hp => fun np => np hp, 
   sorry⟩

-- ... i dodałem dowód implikacji w drugą stronę. Dowód implikacji z prawej do lewej napisałem w
-- nowej linii, bo tak lubię formatować dowody równoważności. Najpierw napisałem to, ...
example : p ↔ ¬¬p :=
  ⟨fun hp => fun np => np hp,
   fun nnp => (em p).elim () sorry⟩

-- ... a potem skonstruowałem pierwszy ...
example : p ↔ ¬¬p :=
  ⟨fun hp => fun np => np hp,
   fun nnp => (em p).elim (fun hp => hp) sorry⟩

-- ... i drugi argument eliminacji alternatywy `p ∨ ¬p`:
example : p ↔ ¬¬p :=
  ⟨fun hp => fun np => np hp,
   fun nnp => (em p).elim (fun hp => hp) (fun np => (nnp np).elim)⟩
```

Poniżej znajdziesz serię zadań. Do niektórych z nich dodałem niezobowiązujące wskazówki, ale byłoby
moim zdaniem najlepiej, gdybyś podeszła do nich, tak jak zresztą do całej matematyki, *po
swojemu*. Pamiętaj tylko proszę, żeby przynajmniej na razie raczej unikać frustracji, a gdy jakieś
zadanie okaże się zbyt trudne, to może albo zrób sobie przerwę, albo przez pewien czas, mniej lub
bardziej aktywnie (ale wcale nie musi być jakoś szczególnie aktywnie, ma być przede wszystkim w
miarę bezboleśnie!), spróbuj w sposób *rozłożony w czasie* powtarzać jakieś prerekwizyty do tego
zadania. To wszystko może stać się całkiem satysfakcjonujące, jeżeli tylko ma się dość cierpliwości
i nie próbuje się za bardzo przyspieszać tego procesu (z tym właśnie, to jest z pogodzeniem się z
koniecznością częstego zmniejszania tempa, czasem do tempa wręcz ślimaczego, mam chyba wciąż
największy problem).

Niektóre z tych zadań będą dla Ciebie w tym momencie zbyt proste i takie zadania warto pewnie robić
"w głowie", ale z drugiej strony czasem wykonanie jednego czy dwóch zadań rutynowych działa,
przynajmniej na mnie, jak coś w rodzaju umysłowej rozgrzewki, i może pomóc w rozwiązaniu zadań
bardziej skomplikowanych. Moim zdaniem wracanie do tych zadań jest znakomitym sposobem utrwalania
wiedzy i pogłębiania rozumienia logiki, a warto dobrze poznać podstawy logiki, bo logika (zwłaszcza
tak ekspresyjna jak teoria typów) jest przecież uniwersalnym "standardem matematyczności" i jednym z
ważniejszych narzędzi myślenia, jakimi dysponujemy.

Żeby nauczyć się używać logiki w dowolnym pozwalającym na to kontekście trzeba nabyć trwałe, dobrze
ustrukturyzowane i łatwo dostępne reprezentacje wzorców wnioskowania logicznego. Dlatego gdy
zaczynałem się uczyć Leana, w pewnym momencie, na podstawie między innymi [tej znakomitej
książki](https://lean-lang.org/theorem_proving_in_lean4/title_page.html), która zresztą powinna być
już dla Ciebie przystępna, stworzyłem sobie plik z zadaniami "na czysto". Przez pewien czas, każdego
dnia kopiowałem te zadania do nowego pliku, i tam je rozwiązywałem (używając trybu dla Leana w
Emacsie, ale Ty zdaje się już od dawna używasz Leana w VS Code, prawda?). Od pewnego momentu
większość z tych zadań wydawała mi się zbyt prosta i przez to nudna, ale robiłem to nadal, ponieważ
wiedziałem, że w ten sposób będę w tym coraz lepszy i że będzie mi łatwiej dzięki temu dostrzegać
logiczne wzorce również tam, gdzie trudniej jest je rozpoznać. Zadania, które znajdziesz tutaj, są
pewną wersją tego właśnie pliku.

Bez pewnej praktyki nie jest łatwo zauważyć, kiedy to jest konieczne, dlatego wszędzie tam, gdzie
dowód wymaga zastosowania logiki klasycznej, zaznaczyłem, że tak jest. W rachunku *zdań* to będą
pewne zdania, w których występuje negacja i alternatywa (w rachunku predykatów to będą również
między innymi pewne zdania z kwantyfikatorem egzystencjalnym, który jak wiesz jest uogólnioną
alternatywą).

## Implikacja

```lean
example : p → p := sorry

example : (p → q) → p → q := sorry
```

## Prawda i fałsz

```lean
example : p → True := fun _ => sorry

example : False → p := fun hF => sorry

example : False → True := sorry
```

## Koniunkcja

Gdy dowód koniunkcji jest parametrem funkcji, czyli gdy koniunkcja jest poprzednikiem implikacji do
udowodnienia, zwykle korzystam z dopasowania wzorca w parametrze, bo mam wyraźnie, że w ten sposób
wyraźnie widać mechanikę działania takiego dowodu. Ty oczywiście zrobisz ten dowód jak zechcesz
(albo go nie zrobisz).

```lean
example : (p ∧ q) → p := sorry

-- Być może w tym przypadku użycie funkcji `And.left` i `And.right` albo sufiksów `.left` i `.right`
-- daje bardziej czytelny dowód niż dopasowanie wzorca w parametrze.
example : p ∧ q ↔ q ∧ p := 
  ⟨fun hpaq => sorry, 
   sorry⟩

-- A w tym przypadku wolę wersję z dopasowaniem wzorca. Uwaga - dowodami są tutaj pary dowodów, z
-- których jednen jest również parą dowodów, czyli takie zagnieżdżone pary dowodów.
example : p ∧ (q ∧ r) ↔ (p ∧ q) ∧ r := 
  ⟨fun ⟨hp, ⟨hq, hr⟩⟩ => sorry, 
   sorry⟩

-- Parametr odpowiadający poprzednikowi implikacji w prawą stronę, czyli zdaniu `r → (p ∧ q)`,
-- nazwałbym tutaj na przykład `h`, bo to zdanie nie jest atomowe, ani nie jest negacją zdania
-- atomowego (dowód `¬p` nazywam często `np`), ani nie jest implikacją z atomowymi poprzednikiem i
-- następnikiem (dowód `p → q` czasem nazywam `hpq` albo `hptoq`, albo `ptoq`), ani alternatywą z
-- atomowymi członami (dowód `p ∨ q` nazywam czasem `hporq` albo `porq`). Następnikiem implikacji w
-- prawo jest tutaj koniunkcja, trzeba więc albo użyć `And.intro`, albo stworzyć parę uporządkowaną
-- dowodów. Konstruując dowód implikacji w lewo warto chyba skorzystać z dopasowania wzorca w
-- parametrze (i nazwać czytelnie dowody członów koniunkcji).
example : (r → (p ∧ q)) ↔ ((r → p) ∧ (r → q)) := sorry

example : ((p ∧ q) → r) ↔ (p → (q → r)) := sorry
```

## Alternatywa

```lean
example : p → p ∨ q := sorry

example : q → p ∨ q := sorry

example : p ∨ q ↔ q ∨ p := sorry

-- Ten dowód jest stosunkowo uciążliwy i łatwo się w nim pogubić, niezależnie od tego, czy korzysta
-- się z trybu interaktywnego i taktyk, czy nie. Głównym źródłem trudności jest tutaj fakt, że
-- trzeba użyć eliminacji alternatywy wewnątrz eliminacji alternatywy. Z drugiej strony nikt nie
-- powiedział, że dowód, który się zaczęło, trzeba koniecznie skończyć tego samego dnia, albo w tym
-- samym miesiącu.
example : (p ∨ (q ∨ r)) ↔ ((p ∨ q) ∨ r) := sorry

example : ((p ∨ q) → r) ↔ ((p → r) ∧ (q → r)) := sorry
```

## Koniunkcja i alternatywa

```lean
-- Znowu może się przydać przechwytywanie dowodów członów koniunkcji za pomocą dopasowania wzorca w
-- parametrze, również w dowodach będących argumentami eliminacji alternatywy (której trzeba użyć
-- dowodząc implikacji w lewo).
example : (p ∧ (q ∨ r)) ↔ ((p ∧ q) ∨ (p ∧ r)) := sorry

-- To jest kolejne zadanie, które za pierwszym, drugim, a nawet za trzecim razem może być uciążliwe,
-- ale które z czasem staje się bardzo łatwe i zaczyna przypominać relaksujące układanie puzzli.
example : (p ∨ (q ∧ r)) ↔ ((p ∨ q) ∧ (p ∨ r)) := sorry
```

## Implikacja i negacja

```lean
example : (p → q) → (¬q → ¬p) := sorry

example : ¬p → (p → q) := sorry

example : p ↔ ¬¬p := sorry

example : ¬(¬p ↔ p) := sorry
```

## Koniunkcja, alternatywa, negacja, prawda i fałsz

```lean
example : ¬(p ∧ q) ↔ (¬p ∨ ¬q) :=
  ⟨sorry, -- W tą stronę trzeba użyć logiki klasycznej ...
   sorry⟩ -- ... a w tą nie.

example : ¬(p ∨ q) ↔ (¬p ∧ ¬q) := sorry

example : (p ∧ ¬p) → r := sorry

example : (p ∧ ¬q) → ¬(p → q) := sorry

example : (p → q) ↔ (¬p ∨ q) :=
  ⟨sorry, -- W tą stronę trzeba użyć logiki klasycznej, ...
   sorry⟩ -- ... a w tą nie.

example : (p ∧ q) ↔ ¬(¬p ∨ ¬q) :=
  ⟨sorry,
   sorry⟩ -- W tą stronę trzeba użyć logiki klasycznej.

example : (p ∨ q) ↔ ¬(¬p ∧ ¬q) :=
  ⟨sorry, 
   sorry⟩ -- W tą stronę trzeba użyć logiki klasycznej.
```

## Koniunkcja, alternatywa, prawda i fałsz

```lean
example : (p ∨ True) ↔ True := sorry

example : (p ∧ True) ↔ p := sorry

example : p ∨ False ↔ p := sorry

example : p ∧ False ↔ False := sorry
```
