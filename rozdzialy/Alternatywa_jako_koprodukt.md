# p ∨ q ~ p + q

Zacznę od ogólnego wstępu, ale jeżeli ten wstęp wyda Ci się początkowo trudny do zrozumienia, możesz
śmiało przejść do części dotyczącej praktyki dowodzenia za pomocą alternatywy i potem tu
wrócić. Moim zdaniem, co już kilka razy podkreślałem, *czytając o złożonych kwestiach technicznych
nie warto próbować zrozumieć wszystkiego po kolei za wszelką cenę*.

W Leanie `∨` to tylko lukier składniowy pod którym kryje się stała `Or`, oznaczająca indukcyjny typ
danych zdefiniowany w taki oto sposób:

```lean
inductive Or (a b : Prop) : Prop where
  -- `Or.inl` to "lewa injekcja" w (koprodukt i jednocześnie typ) `Or`. Jeżeli `h : a`, to `Or.inl h : a ∨ b`.
  | inl (h : a) : Or a b
  -- `Or.inr` to "prawa injekcja" w `Or`. Jeżeli `h : b`, to `Or.inr h : a ∨ b`.
  | inr (h : b) : Or a b
```

Komentarze są tutaj moimi tłumaczeniami tego, co można znaleźć w pliku
[Prelude.lean](https://github.com/leanprover/lean4/blob/master/src/Init/Prelude.lean). Ta definicja
jest bardziej skomplikowana niż omawiane w poprzednim rozdziale definicje indukcyjne zdań `True` i
`False` nie tylko dlatego, że pojawiają się tutaj *dwa* sposoby tworzenia termów definiowanego
typu. Ta definicja jest bardziej skomplikowana przede wszystkim dlatego, że jest jednocześnie
*parametryczna* i *rekurencyjna*.

**Czytamy to**: Definiuję indukcyjnie (`inductive`) parametryczny (bo ta definicja ma \{tutaj dwa\}
parametry) *typ danych* `Or` typu `Prop` o parametrach `a` i `b` typu `Prop` (`Or (a b : Prop)`)
jako typ takich termów, że (`where`) każdy taki term można skonstruować *albo* jako (`|`) *samą,
nieredukowalną aplikację* o postaci `Or.inl (h a)` typu `Or a b`, albo jako (`|`) nieredukowalną
aplikację `Or.inr (h : b)` typu `Or a b`. 

## Krótko o definicjach indukcyjnych, definicjach rekurencyjnych i schematach aksjomatów.

Stąd, że aksjomaty to dokładnie definicje pozbawione ciała, czyli definicje nierozwijalne, czyli
arbitralne konwencje językowe albo pojęciowe, wynika, że to, że aplikacje `Or.inl` i `Or.inr` są
(ostatecznie, bo ich argumenty mogą być przecież redukowalne) nieredukowalne oznacza, że ta
definicja, jak każda *parametryczna* definicja indukcyjna, jest [*schematem
aksjomatu*](https://pl.wikipedia.org/wiki/Schemat_aksjomatu)[^2], czyli *przepisem*
charakteryzującym pewien - być może nieskończony - *zbiór aksjomatów*.

Zapisując tą definicję jako definicję indukcyjną rozstrzygamy o tym, że *wszystkie takie* i *tylko
takie* termy są termami (parametrycznego) typu `Or`. Ponadto zdania o postaci `Or a b`, które nie
powstają z tych samych uporządkowanych par zdań, są *różnymi* zdaniami. Dowody będące aplikacjami
różnych *konstruktorów* (tutaj konstruktorami są `Or.inl` i `Or.inr`) są więc *różnymi termami*,
jednak w tym przypadku te dowody są *wymienialne*, czyli *traktowane jako takie same*, ponieważ w
Leanie obowiązuje zasada nieważności struktury dowodu. 

Właśnie na tym, że to są *wszystkie* sposoby konstruowania termów tego typu i że *różne* sposoby
konstrukcji dają *różne* termy polega *indukcyjność* tej definicji. Definicje `True` i `False` są w
takim samym znaczeniu indukcyjne, ale te dwie definicje nie są parametryczne, a więc nie są
schematami aksjomatu, a poza tym typ/zdanie `False` nie ma konstruktora, a `True` ma tylko
konstruktor `True.intro`.

Definicja parametrycznego (czyli zależnego) typu `Or` jest również
[*rekurencyjna*](https://en.wikipedia.org/wiki/Recursive_definition) (inaczej *rekursywna*), bo jest
*przepisem jak można tworzyć* (pewnego rodzaju) *zdania ze zdań*, czyli pewnego rodzaju obiekty czy
struktury z obiektów czy struktur *tego samego rodzaju*. Rekurencyjność tej definicji może budzić
wątpliwości, ale, wbrew obiegowej opinii, nie każda ["kołowatość"
definicji](https://en.wikipedia.org/wiki/Circular_definition)[^1] jest problematyczna i ta akurat
nie jest.

<hr>

Zmienię teraz konwencję i zacznę oznaczać bliżej nieokreślone zdania dużymi literami, żeby
zasygnalizować, że mogą być dowolnie złożone.

*Jeżeli* `P` *i* `Q` *to zdania, to* `Or P Q` *jest zdaniem*.

A więc to jest przepis na tworzenie pewnego rodzaju zdań ze zdań. Jednocześnie to jest też przepis
na tworzenie dowodów pewnego rodzaju zdań z dowodów zdań:

*Jeżeli* `P` *i* `Q` *to zdania, to jeżeli* `h` *jest dowodem* `P`, *to* `Or.inl h` *jest dowodem
zdania* `Or P Q`.

*Jeżeli* `P` *i* `Q` *to zdania, to jeżeli* `h` *jest dowodem* `Q`, *to* `Or.inr h` *jest dowodem*
`Or P Q`.

Mówiąc krótko, jeżeli `P` i `Q` to zdania, to dowodem zdania `Or P Q`, które to zdanie zapisujemy
zwykle - posługując się lukrem składniowym - jako `P ∨ Q`, jest *albo* oznaczony jako `Or.inl` dowód
zdania `P`, *albo* oznaczony jako `Or.inr` dowód zdania `Q`. A więc `Or P Q` przypomina zbiór będący
sumą rozłączną zbiorów, którego elementami są dokładnie dowody `P` oznaczone tak, żeby nie mogły być
równe żadnemu dowodowi `Q` i dowody `Q` oznaczone tak, żeby nie mogły być równe żadnemu dowodowi
`P`. Widzimy znowu, że alternatywa to szczególny przypadek koproduktu, czyli (z perspektywy
kategoryjnej) "wywrócona na drugą stronę" koniunkcja.

## Koniunkcja i alternatywa z perspektywy kategoryjnej

Tą dualność widać zarówno w sposobie, w jaki *dowodzimy* koniunkcji i alternatywy - czyli w regułach
*wprowadzenia* tego rodzaju zdań - jak i w sposobie, w jaki ich *używamy*, czyli w regułach
*eliminacji*.

Niech `P`, `Q` i `R` będą jakimiś zdaniami. Żeby *udowodnić* zdanie `P ∧ Q` trzeba dysponować
*jednocześnie dwoma dowodami*, jednym dla zdania `P` *i* jednym dla zdania `Q`.

Żeby udowodnić `R` *dysponując* tylko dowodem zdania `P ∧ Q`, czyli żeby *wykorzystać* w dowodzie tą
koniunkcję do udowodnienia `R`, trzeba wykazać, że `R` wynika z `P` *lub* z `Q` lub z obydwu tych
zdań jednocześnie, bo *lub*, tak jak rozumiemy to słowo w logice, dopuszcza też taką możliwość. A
więc w regule wprowadzania koniunkcji pojawia się pojęcie koniunkcji, a w regule eliminacji
koniunkcji pojawia się pojęcie alternatywy.

Każdy dowód koniunkcji będzie wymagał zastosowania jakiś dostępnych lokalnie hipotez, albo nie. Na
przykład, jeżeli koniunkcja będzie miała postać `(p \to p) \and q`, to dowód lewego członu będziemy
mogli skonstruować "z niczego", konstruując funkcję identycznościową na zdaniach i to będzie
jednocześnie dowód implikacji `True \to (p \to p)`. A dysponując lokalnie, jako założeniem albo
udowodnionym wcześniej zdaniem, na przykład hipotezą `p \to q \and p`, będziemy mogli udowodnić
zdanie `q`.

Zawsze, gdy możemy udowodnić w danym kontekście jakieś dwa zdania `P` i `Q`, w tym samym kontekście
możemy też udowodnić pewne zdanie `H`, z którego *jednocześnie* wynikają te dwa zdania, czyli zawsze
wtedy możemy udowodnić implikacje `H \to P` i `H \to Q` dla pewnego zdania `H`. W ostatnim
przykładzie takim zdaniem `H` jest zdanie `True \and (p \to q \and p)`, albo po prostu `p \to q \and
p`. A więc z perspektywy kategoryjnej będą wtedy istniały współźródłowe strzałki do punktów `P` i
`Q`. Z tej perspektywy, ponieważ kategoria dowiedlności zdań jest cienka, reguła wprowadzania dla
koniunkcji odpowiada "produktowości" koniunkcji, bo mówi, że *istnieje* wtedy strzałka z tego samego
źródła do `P \and Q` i taka strzałka musi być *unikalna*, ponieważ ta kategoria jest cienka.

Reguła eliminacji dla koniunkcji dotyczy z kolei strzałek *z* koniunkcji. Ponieważ każda koniunkcja
to pewna specjalna para współźródłowych strzałek `P \l P \x Q \to Q`, to z koniunkcji wynikają te i
tylko te zdania, które wynikają z `P` - bo wtedy wynikają z `P \and Q` z powodu składalności
strzałek / przechodniości relacji dowiedlności - *lub* z `Q` *lub* z `P \and Q`. Widzimy więc, że
reguły eliminacji są tak w ogóle dualne do reguł wprowadzania i w regułach eliminacji dla koniunkcji
pojawia się - ale w *metajęzyku*, a nie jako spójnik logiczny występujący w jakimś zdaniu o którym
mówią te reguły - obiekt dualny do koniunkcji.

Żeby *wprowadzić* zdanie `P ∨ Q`, trzeba dysponować dowodem `P` *lub* dowodem `Q`. Żeby
*wykorzystać* `P ∨ Q` do udowodnienia `R`, trzeba udowodnić, że `R` wynika *zarówno z* `P` *jak i z*
`Q`, ponieważ z samego faktu, że mamy *jakiś* dowód `P ∨ Q`, nie da się wywnioskować, *która* z tych
alternatyw jest prawdziwa. A więc we wprowadzaniu alternatywy, które dotyczy strzałek *do*
alternatywy jako koproduktu, pojawia się pojęcie alternatywy, a w regule eliminacji alternatywy,
która dotyczy strzałek *z* alternatywy jako koproduktu, pojawia się dualne pojęcie koniunkcji.

Jak się pewnie domyślasz, można to wszystko wyrazić w języku teorii kategorii posługując się
diagramami, jednym diagramem, bo mamy tutaj do czynienia z dualnością koniunkcji do alternatywy i
dualnością reguł wprowadzania do reguł eliminacji. Wydaje mi się, że oswojenie się z tymi
dualnościami ułatwia zapamiętanie reguł redukcji dla koniunkcji i alternatywy.

## Koniunkcja i alternatywa ze strzałek, ale inaczej

Przypominam "strzałkową" definicję koniunkcji:

```lean
def and (p q : Prop) : Prop := ∀ r : Prop, (p → q → r) → r
```

Ta definicja jest "zrobiona ze strzałek" w innym znaczeniu niż definicje kategoryjne, ale oczywiście
da się ją "skategoryfikować". Jeden z moich ulubionych sposobów myślenia o tej definicji polega na
tym, że interpretujemy `p → q → r` jako typ *funkcji dwuparametrowych*, które zwracają dowody zdań
dające się skonstruować z par dowodów będących argumentami ich aplikacji. 

Z tego punktu widzenia ta definicja wyraża po prostu fakt, że dowód koniunkcji zdań `p` i `q` to
taki dowód, za pomocą którego można udowodnić każde zdanie wynikające z łącznej prawdziwości zdań
`p` i `q`. Stąd można łatwo wyprowadzić jedyną regułę wprowadzania i obydwie reguły eliminacji dla
koniunkcji:

```lean
-- Dla uproszczenia pomijam tutaj typowanie, którego Lean może się sam domyślić.

-- Żeby udowodnić koniunkcję zdań trzeba mieć dowody członów tej koniunkcji:
def and_in1 (p q : Prop) (hp : p) (hq : q) : and p q :=
    fun (r : Prop) => fun (h : p → q → r) => h hp hq

-- Z dowodu p \and q zawsze można zrobić dowód p:
def and_el1 (p q : Prop) (h : and p q) : p :=
    h p (fun hp => fun _ => hp)

-- Z dowodu p \and q zawsze można zrobić dowód q:
def and_el2 (p q : Prop) (h : and p q) : q :=
    h q (fun _ => fun hq => hq)
```

Ponieważ te dwie ostatnie definicje są funkcjami, które przekształcają dowody każdej koniunkcji o
postaci `p \and q` w dowody zdań `p` i `q` odpowiednio, to te funkcje są "generatorami" (w innym niż
wcześniej wprowadzone znaczeniu tego słowa) strzałek-projekcji z koniunkcji jako produktu.

W tym samym znaczeniu strzałkową definicję alternatywy można natomiast skonstruować tak:

```lean
def or (p q : Prop) : Prop := ∀ r : Prop, (p → r) → (q → r) → r

-- Zastosowałem bardziej deskryptywne nazwy parametrów, żeby łatwiej można było zrozumieć o co chodzi
-- w tych definicjach.
def or_in1 (p q : Prop) (hp : p) : or p q :=
  fun _ => fun hp_to_r => fun _ => hp_to_r hp

def or_in2 (p q : Prop) (hq : q) : or p q :=
  fun _ => fun _ => fun hq_to_r => hq_to_r hq

-- Sama definicja alternatywy jest tutaj tym samym co jedyna reguła eliminacji dla alternatywy.
```

To, że koniunkcja ma jedną regułę wprowadzania i dwie reguły eliminacji, a alternatywa ma dwie
reguły wprowadzania i jedną regułę eliminacji, też jest manifestacją tego, że to są pojęcia
dualne.

Ta strzałkowa definicja alternatywy wyraża wprost zasadę, zgodnie z którą alternatywa to takie
zdanie, że jeżeli wiemy, że to zdanie jest prawdziwe, to wiemy jednocześnie, że prawdziwe jest każde
zdanie, które wynika *jednocześnie* z *samego* zdania `p` i z *samego* zdania `q`. To jest
trudniejszy do spełnienia, a więc bardziej wymagający albo mocniejszy warunek niż wynikanie z
łącznej prawdziwości zdań `p` i `q`. Koniunkcja zdań jest więc mocniejszym założeniem niż
alternatywa złożona z tych samych zdań, *co znaczy*, że `p \and q` wynika `p \or q`, ale nie
odwrotnie, czyli *na ogół* więcej można wywnioskować z koniunkcji niż z alternatyw.

To co, może już wylądujemy na ziemi i pobawimy się trochę dowodami zdań, w których występują
alternatywy?

## Alternatywa w praktyce dowodzenia

```lean
variable (p q r : Prop)

example : p → p ∨ q := 
  fun (hp : p) => Or.inl hp

example : q → p ∨ q := 
  fun (hq : q) => Or.inr hq

example : p ∧ q → p ∨ q := 
  fun h => Or.inl h.left

example : p ∧ q → p ∨ q := 
  fun h => Or.inr h.right

example : p ∧ q → p ∨ q := 
  fun ⟨hp, _⟩ => Or.inl hp

example : p ∧ q → p ∨ q := 
  fun ⟨_, hq⟩ => Or.inr hq

example : p ∧ q → p ∨ q := by
  intro ⟨_, hq⟩
  exact Or.inr hq

example : p → p ∨ q := by
  intro hp
  exact Or.inl hp

example : p ∨ p → p :=
  fun (h : p ∨ p) => 
    h.elim
      (fun (hp : p) => hp)
      (fun (hp : p) => hp)

example : p ∨ p → p := fun h => h.elim (fun h => h) (fun h => h)

def ID (a : Prop) : a → a := fun (h : a) => h
example : p ∨ p → p :=
  fun (h : p ∨ p) => h.elim (ID p) (ID p)

example : p ∨ q → q ∨ p :=
  fun (h : p ∨ q) =>
    h.elim 
      (fun (hp : p) => Or.inr hp)
      (fun (hq : q) => Or.inl hq)

example : p ∨ q → q ∨ p := by
  intro h
  cases h with
  |inl hp => exact Or.inr hp
  |inr hq => exact Or.inl hq

example : p ∨ q → q ∨ p := by
  intro h
  cases h
  case inl hp => exact Or.inr hp
  case inr hq => exact Or.inl hq

example : p ∨ q → q ∨ p := by
  intro h
  cases h -- konflikt nazw ze względu na h
  apply Or.inr
  assumption
  apply Or.inl
  assumption

example : p ∨ q → q ∨ p := by
  intro h
  cases h
  rename_i hp
  exact Or.inr hp
  rename_i hq
  exact Or.inl hq
```

TODO Że definicja indukcyjnego typu danych to axiom schema.

### Przypisy

[^1]: [Polska wersja](https://pl.wikipedia.org/wiki/B%C5%82%C4%99dne_ko%C5%82o_w_definiowaniu) tego
    artykułu (strony Wikipedii nazywamy oficialnie artykułami) jest niestety dosyć słaba.

[^2]: Również w tym przypadku polska wersja tego artykułu jest znacznie gorsza od [wersji
    angielskiej](https://en.wikipedia.org/wiki/Axiom_schema).
