# \forall ~ \exists

Jak wiesz, duży kwantyfikator to tylko inny sposób zapisania parametru funkcji. Na przykład, dowód
przemienności dodawania liczb naturalnych możemy zapisać tak ...

```lean
def add_comm_nat (m n : Nat) : m + n = n + m :=
    Nat.add_comm m n
```

... albo tak:

```lean
def add_comm_nat : \forall m : Nat, \forall n : Nat, m + n = n + m :=
    fun m => fun n => Nat.add_comm m n
```

Co prawda dużego kwantyfikatora używamy raczej wtedy, gdy zmienna związana tym kwatyfikatorem
występuje później w jakimś zdaniu, ale Lean nie wymusza tej konwencji:

```lean
def suma : ∀ m : Nat, ∀ n : Nat, Nat :=
    fun m => fun n => m + n
```

Nie będziemy jednak stosować dużego kwantyfikatora w ten nietypowy sposób i skupimy się tylko na
węższej interpretacji tego symbolu jako spójnika logicznego. Nie będziemy też rozważać
patologicznych przykładów formuł logicznych, w których zmienne związane kwantyfikatorami nigdzie
później nie występują, takich jak ten poprawny, nawet jeśli wywołujący ostrzeżenie o stylu fragment
kodu:

```lean
example (p : Prop) : ∀ n : Nat, p → p := fun _ => fun hp => hp
```

Kwantyfikatory są bowiem po to, żeby można było używając ich mówić coś za pomocą predykatów i
relacji na temat arbitralnych termów takiego lub innego typu. Na przykład, żeby można było
skontruować takie zdanie:

```lean
def every_nat_is_ge_than_zero : Prop := ∀ n : Nat, 0 ≤ n
```

Być może nie od razu to widać, ale wyrażenie `0 ≤ n` jest tutaj predykatem, ponieważ przekształca
liczby naturalne `n` w zdania. Żeby ujawnić charakter tego wyrażenia, możemy zapisać zdanie o tej
samej treści tak:

```lean
def Ge_zero : Nat → Prop := fun n => 0 ≤ n
def every_nat_is_ge_than_zero' : Prop := ∀ n : Nat, Ge_zero n
```

Duży kwantyfikator to nic innego jak pewne uogólnienie koniunkcji. Na przykład, zdanie ...

```lean
\forall n : Nat, 0 \le n` 
```

... znaczy to samo, co nieskończone połączenie koniunkcji o postaci ...

```lean
0 \le 0 \and 0 \le 1 \and 0 \le 2 \and 0 \le 3 ...
```

... gdzie dla uproszczenia pominąłem nawiasy. Konstruując dowód tego zdania nie dostarczamy
nieskończenie wielu osobnych dowodów, bo tego nie dałoby się zapisać. Zamiast tego dostarczamy
*metodę konstruowania dowodów* zdania parametrycznego `0 \le n` *dla arbitralnej liczby naturalnej*
`n`. Już wiesz, jak konstruujemy takie dowody - trzeba zacząć od konstruowania \la-abstrakcji, a
potem w kodzie dowodu być może użyć w jakiś sposób parametru, będącego jednocześnie zmienną związaną
przez duży kwantyfikator.

Domyślasz się już pewnie, że skoro duży kwantyfikator jest parametrycznym uogólnieniem koniunkcji,
to istnieje też analogiczne, dualne parametryczne uogólnienie alternatywy. Ten kwantyfikator
nazywamy *egzystancjalnym* albo *małym* i **czytamy jako** *istnieje* (*takie coś, że
...*). Definicję Leana można znaleźć w pliku Core.lean:

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
mi się, że aksjomaty odgrywają rolę *założeń*, dlatego często nawiązuję do tego moim zdaniem
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
