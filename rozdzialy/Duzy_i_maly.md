# \forall ~ \exists

## Krótko i praktycznie o dowodzeniu zdań o postaci `∃ x : α, P x`

Będziemy znowu mówić o żniwiarzach, ...

```lean
axiom Zniwiarz : Type

-- ... którzy bywają ponurzy, ale nie wszyscy; zdarzają się również żniwiarze pogodni.
axiom Ponury : Zniwiarz → Prop
axiom Pogodny : Zniwiarz → Prop

-- Tych dwóch predykatów będziemy używać zgodnie z następującą zasadą: jeżeli jakiś żniwiarz jest ponury,
-- to nie jest pogodny.
axiom pon_npog : ∀ z : Zniwiarz, Ponury z → ¬ Pogodny z

-- Umawiamy się znowu, że będziemy mówić o jakimś Krystianie, który jest żniwiarzem i jest ponury.
axiom Krystian : Zniwiarz
axiom pk : Ponury Krystian

-- Jeżeli teraz zastosujemy aksjomat pon_npog do Krystiana, to uzyskamy dowód, że jeżeli Krystian jest
-- ponury, to nie jest pogodny.
#check pon_npog Krystian -- Ponury Krystian → ¬ Pogodny Krystian

-- To zdanie oznacza, że istnieje jakiś żniwiarz, który nie jest pogodny.
example : ∃ z : Zniwiarz, ¬ Pogodny z :=
  -- Ponieważ `z` jest tutaj symbolem związanym przez kwantyfikator egzystencjalny, inaczej mały, to ten
  -- symbol pełni tutaj rolę zaimka.
  --
  -- Żeby udowodnić zdanie o postaci `Istnieje taki x, że P x` w logice konstruktywnej musimy dostarczyć
  -- taki x, że P x, czyli musimy dostarczyć *dwie* rzeczy (parę uporządkowaną): term odpowiedniego typu,
  -- to jest takiego, który pasuje do predykatu P (którego dotyczy P), i dowód, że ten właśnie term spełnia
  -- dany predykat.
  ⟨Krystian, pon_npog Krystian pk⟩
```

Zwracam uwagę na widoczną już teraz analogię między alternatywą i małym kwantyfikatorem. Żeby
udowodnić zdanie o postaci alternatywy trzeba dostarczyć dowód jednego z członów tej
alternatywy. Zdanie `∃ z : Zniwiarz, ¬ Pogodny z` to *parametryczna* alternatywa - różnych zdań o
postaci `¬ Pogodny z` jest tyle, ile jest żniwiarzy. Gdyby żniwiarzy było dokładnie dwóch, na
przykład gdyby `Krystian` i `Kamil` byli jedynymi żniwiarzami, to `∃ z : Zniwiarz, ¬ Pogodny z`
znaczyłoby w zasadzie to samo, co `¬ Pogodny Krystian \or ¬ Pogodny Kamil`, chociaż dowód tego
ostatniego zdania składałby się tylko z termu będącego dowodem zdania `¬ Pogodny Krystian` lub termu
będącego dowodem zdania `¬ Pogodny Kamil`.

```lean
-- To teraz jeszcze raz to samo, ale w trybie interaktywnym i używając taktyki apply.
example : ∃ z : Zniwiarz, ¬ Pogodny z := by
  -- Żeby udowodnić zdanie o postaci `Istnieje taki x, że P x` musimy jawnie lub (jak przed chwilą) niejawnie
  -- zastosować regułę wprowadzania dla kwantyfikatora egzystencjalnego `Exists.intro`, która wymaga termu
  -- odpowiedniego (czyli pasującego do danego predykatu) typu i dowodu, że ten term spełnia dany predykat.

  -- Stosując w ten sposób w trybie interaktywnym taktykę apply mówimy Leanowi: Konstruuję dowód celu używając
  -- funkcji `Exist.intro` z pierwszym argumentem `Krystian`, a całą resztę (czyli w tym wypadku drugi i ostatni
  -- argument) zaraz Ci dostarczę. Ta brakująca reszta, to jest dowód zdania ¬Pogodny Krystian, staje się odtąd
  -- nowym celem.
  apply Exists.intro Krystian -- ⊢ ¬Pogodny Krystian

  -- Ponieważ rezultat/wniosek aksjomatu pon_npog - ∀ z : Zniwiarz, Ponury z → ¬ Pogodny z - zgadza się z aktualnym
  -- celem z dokładnością do wartości zmiennej `z`, to gdy zastosujemy ten aksjomat do celu ¬ Pogodny Krystian ...
  apply pon_npog -- ... pozostanie nam już tylko zrealizować cel ⊢ Ponury Krystian ...
  exact pk       -- ... a do tego wystarczy nam aksjomat pk.
```

Jeszcze raz ten sam dowód na dwa sposoby, ale już bez komentarzy:

```lean
-- To tylko dwa różne sposoby zapisania tego samego dowodu:
example : ∃ z : Zniwiarz, ¬ Pogodny z := ⟨Krystian, pon_npog Krystian pk⟩
example : ∃ z : Zniwiarz, ¬ Pogodny z := Exists.intro Krystian (pon_npog Krystian pk)
```

To tyle jeżeli chodzi o (jedyną) regułę wprowadzania dowodu zdania o takiej postaci. Może jeszcze
jeden przykład dla utrwalenia:

```lean
-- Żeby skontruować dowód tego zdania, trzeba dostarczyć konkretny term typu `Nat`, czyli konkretną liczbę naturalną,
-- która spełnia warunek: dodanie 1 do tej liczby daje liczbę równą 2. Przypominam, że nawiasy trójkątne uzyskasz w
-- Leanie pisząc \< i \>. W tym przypadku druga część dowodu będzie trywialna, bo jedyny term, który spełnia ten
-- warunek, spełnia go *z definicji*, a dowody równości definicyjnych umiesz już konstruować za pomocą jednej krótkiej
-- instrukcji (tylko może nie pamiętasz już jej nazwy - przypominam więc, że to tylko trzy litery).
example : ∃ n : Nat, n + 1 = 2 :=
```

## Do tego fragmentu, dotyczącego implementacji reguły wprowadzania dla kwantyfikatora egzystencjalnego, można wrócić później albo wcale

Żeby zmniejszyć Twój ewentualny lęk przed czytaniem dokumentacji Leana i kodu źrodłowego, który jest
przez Leana ładowany automatycznie zaraz po uruchomieniu (na przykład
[tego](https://github.com/leanprover/lean4/blob/master/src/Init/Prelude.lean) kodu), spróbuję teraz
objaśnić sygnaturę typu stałej `Exists.intro`. Nie musisz tego dobrze rozumieć, ale moim zdaniem
jest wskazane, żebyś na tym etapie miała z tego rodzaju sprawami jakiś kontakt.

Gdybyśmy chcieli zrobić to sami, moglibyśmy zdefiniować konstruktor (funkcję konstruującą) dowodów
zdań o postaci `∃ x : Typ, P x` tak (`inex` to tutaj tylko wybrany przeze mnie skrót od *intro
exists*):

```lean
def inex (Typ : Type) (P : Typ → Prop) (x : Typ) (h : P x) : ∃ x : Typ, P x :=
  ⟨x, h⟩
```

Na razie oszukuję, bo to jest konstruktor używający niejawnie istniejącego już konstruktora tego
rodzaju zdań, ponieważ znając typ parametrów i rezultatu Lean traktuje tutaj `⟨x, h⟩` jako inny
sposób zapisania `Exists.intro ...`. Pomijając jednak ten drugorzędny w tym momencie wątek, zwracam
uwagę, że musielibyśmy używając `inex` za każdym razem jawnie, jako pierwsze dwa argumenty, podawać
typ termu i predykat, który dotyczy tego typu, a przecież Lean może wywnioskować typ termu i
predykat z podanego termu i albo z dowodu, że ten term spełnia dany predykat, albo z podanego jawnie
zdania do udowodnienia, w którym ten predykat występuje. Wygodniej byłoby więc zdefiniować
konstruktor dowodów takich zdań korzystając z *niejawnych* parametrów (które oznaczamy w definicjach
otaczając je nawiasami klamrowymi):

```lean
-- W ten sposób mówimy: sam się domyśl, o jaki typ Typ i jaki predykat Typ → Prop tutaj chodzi.
def inex' {Typ : Type} {P : Typ → Prop} (x : Typ) (h : P x) : ∃ x : Typ, P x :=
  ⟨x, h⟩
```

Wtedy na przykład aplikacja `inex' 1 rfl` (czyli `inex' 1`
*automatyczny-dowód-polegający-na-rozwijaniu-definicji*) będzie poprawnym dowodem zdania `∃ n : Nat,
n = 1`:

```lean
-- Lean nie zgłasza błędu, a więc ta aplikacja jest dowodem tego zdania (a mówiąc ogólnie ten term
-- ma ten typ)
#check (inex' 1 rfl : ∃ n : Nat, n = 1)
```

Wydaje mi się, że ten ostatni dowód jest bardziej czytelny niż poniższy, w którym musimy podać
jawnie predykat dotyczący liczb naturalnych, który o dowolnej liczbie naturalnej mówi, że jest równa
`1`, i ten krótszy dowód nie wymaga wcale szczególnej domyślności, bo przecież od razu widać, o jaki
typ i jaki predykat chodzi:

```lean
-- Podawanie jawnie wszystkich informacji koniecznych do pełnej formalizacji bywa uciążliwe i nie zawsze
-- służy lepszemu zrozumieniu, o co chodzi. Ja na przykład zdecydowanie bardziej wolę poprzednią, zwięzłą
-- i równie jednoznaczną wersję.
#check (inex Nat (fun n : Nat => n = 1) 1 rfl : ∃ n : Nat, n = 1)
```

Nawiasem mówiąc, ponieważ w Leanie `1` oznacza domyślnie liczbę naturalną `1` (a nie na przykład
stałą `1` interpretowaną jako liczba całkowita), to możemy napisać również tak:

```lean
-- Istnieje pewien term `n` który spełnia predykat `n = 1` i jest nim z definicji (`rfl`) `1` ...
#check (inex' 1 rfl : ∃ n, n = 1)
-- Symbol `n` jest tutaj parametrem predykatu, czyli pewnej funkcji zwracającej zdania, w tym wypadku
-- funkcji `fun n : Nat => n = 1`.
```

Konstruktor `inex'` wydaje się być dobrym rozwiązaniem, ale w pewnych sytuacjach będzie
niewystarczający, ponieważ *nie działa dla dowolnego typu*. Przypominam, że (z dosyć nudnych powodów
technicznych) typy w Leanie tworzą nieskończoną *hierarchię*, wobec czego ograniczając się do
predykatów typu `Typ → Prop`, gdzie `Typ : Type`, uniemożliwiamy sobie operowanie predykatami
dotyczącymi termów *wyższych* typów, na przykład typu `Type 665`, albo typu znajdującego się o jeden
poziom ponad nim w hierarchii typów. 

To ograniczenie możemy usunąć traktując *poziom* w hierarchii typów jako (najlepiej niejawny)
*parametr*. Stosujemy wtedy specjalną składnię, to znaczy zapisujemy parametryczny poziom (nazywany
w Leanie *uniwersum*) w nawiasach klamrowych zaraz po kropce występującej na końcu nazwy
definiowanej stałej:

```lean
def inex''.{u} {Typ : Type u} {P : Typ → Prop} (x : Typ) (h : P x) : ∃ x : Typ, P x :=
  ⟨x, h⟩
  
#check (inex'' 1 rfl : ∃ n, n = 1) -- to też działa
```

Takie rozwiązanie będzie *niemal* maksymalnie ogólne, ale nie całkiem, ponieważ `Type i` to to samo,
co `Sort i + 1` ale `Prop` to `Sort 0`, a nie ma czegoś takiego jak `Type -1`, co oznacza, że
używając `inex''` nie możemy korzystać z predykatów dotyczących termów typu `Prop`, czyli nie możemy
korzystać z predykatów dotyczących zdań. Żeby usunąć to ostatnie ograniczenie, musimy użyć
najogólniejszego sposobu zapisu typu (żeby to podkreślić, zmieniłem nazwę na `inexu`):

```lean
def inexu.{u} {Typ : Sort u} {P : Typ → Prop} (x : Typ) (h : P x) : ∃ x : Typ, P x :=
  ⟨x, h⟩
  
#check (inexu 1 rfl : ∃ n, n = 1) -- to też działa
```

Teraz będzie już mam nadzieję jasne, czemu konstruktor `Exists.intro` ma takie a nie inne parametry ...

```lean
#check Exists.intro -- Exists.intro.{u} {α : Sort u} {p : α → Prop} (w : α) (h : p w) : Exists p
```

... ale o co chodzi z typem rezultatu zapisanym jako term `Exists p`? W szczególności, gdzie się
podział odpowiednik symbolu `x`, którego używaliśmy na oznaczenie *czegoś* w zdaniu *Istnieje takie
coś, co spełnia predykat `P`*? Otóż dopóki mówimy o *samym zdaniu*, nie ma potrzeby dodawania
takiego symbolu, ponieważ z każdego, dotyczącego termów jakiegokolwiek typu `α` predykatu `P` można
zrobić dokładnie jedno zdanie o postaci `∃ x : α, P x`, to będzie to samo zdanie co na przykład
zdanie `∃ z : α, P z`, ponieważ symbole `x` i `z` pełnią tu tylko role zaimków i każde takie zdanie
będzie odpowiadało dokładnie jednemu predykatowi dotyczącemu termów danego typu. Te zdania są więc
*własnościami samych predykatów*. To samo dotyczy zresztą zdań zbudowanych za pomocą dużego
kwantyfikatora.

Popatrzmy jeszcze na zapisaną
[tutaj](https://github.com/leanprover/lean4/blob/master/src/Init/Core.lean) definicję indukcyjną
tych mówiących o istnieniu co najmniej jednego termu spełniającego arbitralne predykaty zdań (z
której usunąłem komentarze):

```lean
inductive Exists {α : Sort u} (p : α → Prop) : Prop where
  | intro (w : α) (h : p w) : Exists p
```

**Czytamy to**: Indukcyjnie definiuję typ zdań `Exists p`, gdzie `p` to predykat dotyczący jakiegoś
typu `α`. Termy tego typu, czyli dowody tych zdań, to dokładnie nieredukowalne aplikacje
konstruktora `intro` (czyli `Exists.intro`, bo jesteśmy wewnątrz definicji indukcyjnej) do termu
typu `α` i dowodu, że ten term spełnia predykat `p`. 

Widzimy znowu, że dowód zdania o postaci `∃ x : Jakis_typ, Jakis_predykat x` to nic innego jak para
złożona z termu typu `Jakis_typ` i dowodu, że ten term spełnia dany predykat, oznaczona etykietą
`Exists.intro`, żeby można było odróżnić takie pary od par innego typu. Ponieważ jego aplikacje są
nieredukowalne, tym właśnie jest konstruktor `Exists.intro` - pewnym nadającym tożsamość
*oznaczeniem* pary spełniającej określone wymagania.

Żeby dodatkowo zachęcić Cię do zaglądania w przyszłości do dokumentacji i kodu źródłowego Leana
wkleję tutaj fragment dokumentacji dotyczącej typu `Exists`:

```lean
/--
Existential quantification. If `p : α → Prop` is a predicate, then `∃ x : α, p x`
asserts that there is some `x` of type `α` such that `p x` holds.
To create an existential proof, use the `exists` tactic,
or the anonymous constructor notation `⟨x, h⟩`.
...
--/
```

Dowiadujemy się z tego fragmentu, że istnieje coś takiego jak taktyka `exists` ...

```lean
example : ∃ n : Nat, n = 1 := by exists 1
```

... ale z tą taktyką zapoznamy się może kiedy indziej.

Wiesz już, jak możesz *wprowadzić* (do dowodu - czyli udowodnić - zdanie zawierające) kwatyfikator
egzystancjalny; to teraz pokażę Ci, jak możesz takich zdań *używać*. Używanie zdań o postaci `∃ x :
Jakis_typ, Jakis_predykat x`, gdzie `Jakis_predykat` ma typ `Jakis_typ → Prop`, do udowodnienia
innych zdań (jakiegoś zdania `Jakies_zdanie`) polega na czymś podobnym do używania zdań o postaci
alternatywy:

Żeby udodwodnić `Jakies_zdanie` korzystając z dowodu zdania `P \or Q` trzeba udowodnić, że
`Jakies_zdanie` wynika *zarówno* ze zdania `P` jak i ze zdania `Q`, czyli z każdej z tych dwóch
jakby możliwości, bo mając dowód zdania `P \or Q` wiemy tylko tyle, że *któreś* z tych zdań jest
prawdziwe, ale nie wiemy które.

Żeby udodwodnić `Jakies_zdanie` korzystając z dowodu zdania `∃ x : Jakis_typ, Jakis_predykat x`
trzeba udowodnić, że `Jakies_zdanie` wynika z każdej możliwej (danej przez jakąś konkretną wartość
zmiennej `x`) wersji zdania parametrycznego `Jakis_predykat x`, bo wiedząc, że `∃ x : Jakis_typ,
Jakis_predykat x` wiemy tylko tyle, że co najmniej jedno takie zdanie jest prawdziwe, ale nie wiemy
które.

Inaczej mówiąc, żeby udowodnić zdanie o postaci `∃ x : Jakis_typ, Jakis_predykat x → Jakies_zdanie`
trzeba udowodnić, że `Jakies_zdanie` jest prawdziwe jeżeli *jakiś, bliżej nieokreślony* `x` spełnia
predykat `Jakis_predykat`, czyli *niezależnie od tego, jaki `x`* spełnia ten predykat. Krótko
mówiąc, trzeba udowodnić, że `Jakies_zdanie` wynika ze zdania `Jakis_predykat x` *dla każdego `x`*:

```lean
```

## Dłużej i teoretycznie

Jak wiesz, duży kwantyfikator to tylko inny sposób zapisania parametru funkcji. Na przykład, dowód
przemienności dodawania liczb naturalnych możemy zapisać tak, ...

```lean
def add_comm_nat (m n : Nat) : m + n = n + m :=
    Nat.add_comm m n
```

... albo tak, ...

```lean
def add_comm_nat : \forall m : Nat, \forall n : Nat, m + n = n + m :=
    fun m => fun n => Nat.add_comm m n
```

... na jedno wyjdzie. Dużego kwantyfikatora używamy raczej wtedy, gdy zmienna związana występuje
później w jakimś *zdaniu*, ale Lean nie wymusza takiej konwencji:

```lean
-- Tutaj zmienna m związana dużym kwantyfikatorem nie występuje później w żadnym zdaniu.
-- W specyfikacji typu stałej suma - `∀ m : Nat, ∀ n : Nat, Nat` - po ostatnim przecinku mamy
-- typ rezultatu Nat nie będący zdaniem tylko typem rezultatu dodawania, które zachodzi w
-- ciele tej funkcji.
def suma : ∀ m : Nat, ∀ n : Nat, Nat :=
    fun m => fun n => m + n
```

Nie będziemy stosować dużego kwantyfikatora w ten dziwny sposób i skupimy się tylko na standardowej
interpretacji tego symbolu jako spójnika logicznego. Nie będziemy też raczej rozważać patologicznych
przykładów konkretnych formuł logicznych, w których zmienne związane kwantyfikatorami nigdzie
później nie występują, takich jak ten wywołujący ostrzeżenie o stylu ale nadal poprawny fragment
kodu:

```lean
-- Jeżeli p to jakieś zdanie, to dla każdej liczby naturalej n, jeżeli p, to p.
example (p : Prop) : ∀ n : Nat, p → p := fun _ => fun hp => hp
```

Kwantyfikatory są bowiem po to, żeby można było używając ich mówić coś za pomocą predykatów i
relacji na temat arbitralnych termów takiego lub innego typu, jak w tym przykładzie:

```lean
-- `ge` to tutaj skrót od greater or equal
def nat_ge_zero : Prop := ∀ n : Nat, 0 ≤ n
```

Być może nie od razu to widać, ale wyrażenie `0 ≤ n` jest tutaj *predykatem*, ponieważ jest *zdaniem
parametrycznym*, które przekształca *arbitralną* liczbę naturalną `n` w zdanie. Żeby to
zaakcentować, możemy zapisać zdanie o tej samej treści tak:

```lean
-- To jest predykat ...
def ge_zero : Nat → Prop := fun n => 0 ≤ n

-- ... a to jest zdanie, w którym stosujemy ten predykat do zmiennej związanej dużym kwantyfikatorem:
def nat_ge_zero' : Prop := ∀ n : Nat, ge_zero n
```

Duży kwantyfikator to nic innego jak *parametryczne uogólnienie koniunkcji*. Na przykład, zdanie ...

```lean
\forall n : Nat, 0 \le n` 
```

... znaczy to samo, co zdanie o postaci ...

```lean
0 \le 0 \and 0 \le 1 \and 0 \le 2 \and 0 \le 3 ...
```

... gdzie dla uproszczenia pominąłem nawiasy, które są zresztą zbędne, bo koniunkcja jest łączna.

Konstruując dowód tego zdania nie dostarczamy nieskończenie wielu osobnych dowodów, bo tego nie
dałoby się przecież zapisać. Zamiast tego dostarczamy *funkcję*, będącą *metodą konstruowania*
nieskończenie wielu dowodów zdania parametrycznego `0 \le n` dla *arbitralnej* liczby naturalnej
`n`. Już wiesz, jak konstruujemy takie dowody - trzeba zacząć od konstruowania λ-abstrakcji `fun n :
Nat => ...` lub, w trybie interaktywnym, `intro n`, a potem użyć w jakiś sposób parametru `n`,
będącego zmienną związaną przez duży kwantyfikator.

Domyślasz się już pewnie, że skoro duży kwantyfikator jest parametrycznym uogólnieniem koniunkcji,
to istnieje też analogiczne, dualne parametryczne uogólnienie alternatywy. Ten kwantyfikator
nazywamy *egzystancjalnym* albo *małym*, zapisujemy za pomocą symbolu `∃`, a zdania, które zaczynają
się od tego symbolu **czytamy jako** *istnieje* (*takie coś, że ...*). Zanim przejdziemy do rozważań
o charakterze ogólnym, pokażę Ci na kilku przykładach, jak konstruujemy dowody zdań z tym
kwantyfikatorem i jak ich używamy. Żeby skonstruować dowód zdania o postaci ogólnej `∃ x : X, P x`,
gdzie `X` to jakiś typ a `P` to jakiś predykat dotyczący termów tego typu, musimy dostarczyć dwie
rzeczy: 1. konkretny przykład termu `y` typu `X` i 2. dowód zdania `P y`, czyli dowód, że `y`
*spełnia* predykat `P`.

TODO

```lean
-- Istnieje zdanie prawdziwe i jest nim zdanie True ...
example : ∃ p : Prop, p := Exists.intro True True.intro

-- ... jak również zdanie ∀ n : Nat, n + 1 = n + 1 ...
example : ∃ p : Prop, p := Exists.intro
  -- Nawiasy są tutaj konieczne, bo bez nich Lean dzieli ten kod inaczej, niż chcemy.
  (∀ n : Nat, n + 1 = n + 1)
  fun n  => rfl
-- ... i oczywiście nieskończenie wiele innych zdań.

-- Dowody zdań dotyczących istnienia pewnych termów można zapisać prościej jako pary uporząkowane
-- złożone z konkretnego przykładu termu, który spełnia dany warunek i dowodu, że go spełnia:
example : ∃ p : Prop, p := ⟨True, True.intro⟩

example : ∃ p : Prop, p := ⟨(∀ n : Nat, n + 1 = n + 1), fun n  => rfl⟩

example : ∃ n : Nat, n = 0 := Exists.intro 0 rfl

example : ∃ n : Nat, n = 0 := ⟨0, rfl⟩

example : ∃ p : Prop, ∀ q : Prop, p → q :=
  ⟨False, fun (q : Prop) => fun (hf : False) => hf.elim⟩
```

TODO Link do Core.lean

Definicję kwantyfikatora egzystencjalnego, która obowiązuje w Leanie, można znaleźć w pliku
Core.lean:

```lean
inductive Exists {α : Sort u} (p : α → Prop) : Prop where
  -- Wprowadzenie kwantyfikatora egzystencjalnego. Dla dowolnego typu `α`, jeśli `a : α` i `h : p a`,
  -- to `⟨a, h⟩` jest dowodem, że `∃ x : α, p x`.
  | intro (w : α) (h : p w) : Exists p
```

Opcjonalny albo domyślny parametr α jest tutaj parametrem *arbitralnego sortu*. Nie warto się tym za
bardzo przejmować, bo to wynika stąd, że w Leanie mamy nieskończoną hierarchię typów, ale to tylko
jedno z możliwych uniwersalnych rozwiązań. Na przykład, w zaproponowanej przez Nederpelta i Geuversa
wersji teorii typów o nazwie \la D są tylko "zwykłe" typy, które wszystkie zamieszkują ten sam
*rodzaj* \*, który zamieszkuje rodzaj \sq. Ta wersja teorii typów jest więc znacznie prostsza, niż
wersja, z której korzystamy w Leanie. Nie ma tam również wbudowanych typów indukcyjnych ani tak
zwanych typów sumowych i nie ma możliwości skonstruowania definicji rekurencyjnych, a mimo to
również pozwala zakodować formalnie całą matematykę! 

Ta wersja teorii typów jest o ile mi wiadomo pierwszą, w której zostało sformalizowane pojęcie
*matematycznej definicji*, dlatego właśnie ma w nazwie literę *D*. A dzięki temu, że to niezwykle
przecież ważne w matematyce pojęcie zostało przez Nederpelta i Geuversa sformalizowane, mogli
zauważyć, że *aksjomaty* są tylko *pewnego rodzaju definicjami*. Gdy już się z nią oswoiłem, ta
jedna obserwacja całkowicie zmieniła mój sposób myślenia o matematyce, ponieważ wcześniej wydawało
mi się, że aksjomaty odgrywają rolę *założeń*. Dlatego często nawiązuję do tego moim zdaniem
niezwykle ważnego meta-matematycznego odkrycia.

Gdy studiowałem filozofię, a może nawet wcześniej, zetknąłem się ze stanowiskiem filozoficznym
nazywanym realizmem wewnętrznym, które zaproponował zasłużony również dla historii psychologii i
kognitywistyki wybitny filozof [Hilaremu Putnamowi](). Mówiąc w pewnym uproszczeniu, polegającym na
pozbyciu się takich quasi-technicznych terminów filozoficznych jak epistemologia i ontologia czy
metafizyka, zgodnie z tym stanowiskiem prawda jest zawsze zależna od punktu widzenia, ale to nie
znaczy, że jest względna w tym znaczeniu, że każde zdanie może być albo jest zdaniem prawdziwym. *W
ramach* punktu widzenia prawda zależy od czegoś, co nie jest już wyborem, na przykład od
empirycznych albo matematycznych faktów. Podoba mi się ten rodzaj relatywizmu i wydaje mi się, że
pasuje do tego, jak używamy matematyki, albo w jaki sposób przeprowadzamy badania empiryczne i
interpretujemy ich wyniki.

Żeby było ciekawie, zaczniemy od takiego przykładu:

```lean
example : \exists p : Prop, \forall q : Prop, p \to q
```
