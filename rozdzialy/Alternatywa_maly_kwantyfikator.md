# ∨ ~ ∃

Zacznę od ogólnego wstępu, ale jeżeli ten wstęp wyda Ci się początkowo trudny do zrozumienia, możesz
śmiało przejść do części dotyczącej praktyki dowodzenia za pomocą alternatywy i potem tu
wrócić. Moim zdaniem, co już kilka razy podkreślałem, *czytając o złożonych kwestiach technicznych
nie warto próbować zrozumieć wszystko po kolei*.

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
`False`, i nie chodzi tylko o to, że pojawiają się tutaj *dwa* sposoby tworzenia termów
definiowanego typu. Ta definicja jest bardziej złożona przede wszystkim dlatego, że jest
jednocześnie *parametryczna* i *rekurencyjna*.

**Czytamy to**: Definiuję indukcyjnie (`inductive`) parametryczny (bo ta definicja ma \{tutaj dwa\}
parametry) *typ danych* (bo istnieje nieskończenie wiele zdań tego rodzaju) `Or` typu `Prop` o
parametrach `a` i `b` typu `Prop` (`Or (a b : Prop)`) jako typ takich termów, że (`where`) te termy
powstają *albo* jako (`|`) *same, nieredukowalne aplikacje* o postaci `Or.inl (h a)` typu `Or a b`,
albo jako (`|`) aplikacje `Or.inr (h : b)` typu `Or a b`.

Zapisując tą definicję jako definicję indukcyjną rozstrzygamy o tym, że *wszystkie takie* i *tylko
takie* termy są termami (parametrycznego) typu `Or`. Ponadto zdania o postaci `Or a b`, które nie
powstają z tych samych zdań, są *różnymi* zdaniami. Dowody będące aplikacjami *różnych*
konstruktorów (tutaj konstruktorami są `Or.inl` i `Or.inr`) *nie* są jednak różne, ale *tylko* z
powodu zasady *proof irrelevance*. Na tym polega *indukcyjność* tej definicji. Definicje `True` i
`False` są w takim samym znaczeniu indukcyjne, ale te dwie definicje nie są parametryczne i `False`
nie ma konstruktora, a `True` ma tylko konstruktor `True.intro`.

Ta definicja jest również [*rekurencyjna*](https://en.wikipedia.org/wiki/Recursive_definition)
(inaczej *rekursywna*), bo jest *przepisem jak można tworzyć* (pewnego rodzaju) *zdania ze zdań*,
czyli pewnego rodzaju obiekty czy struktury z obiektów czy struktur *tego samego
rodzaju*. Rekurencyjność tej definicji jest czymś w rodzaju niegroźnej
["kołowatości"](https://en.wikipedia.org/wiki/Circular_definition)[^1].

*Jeżeli* `a` *i* `b` *to zdania, to* `Or a b` *jest zdaniem*.

Jednocześnie to jest też przepis na tworzenie *dowodów* (mających postać alternatywy) *zdań z dowodów zdań*:

*Jeżeli* `a` *i* `b` *to zdania, to jeżeli* `h` *jest dowodem* `a`, *to* `Or.inl h` *jest dowodem
zdania* `Or a b`.

*Jeżeli* `a` *i* `b` *to zdania, to jeżeli* `h` *jest dowodem* `b`, *to* `Or.inr h` *jest dowodem*
`Or a b`.

Mówiąc krótko, jeżeli `a` i `b` to zdania, to dowodem zdania `Or a b`, które to zdanie zapisujemy
zwykle jako `a \or b`, jest *albo* oznaczony jako `Or.inl` dowód zdania `a`, *albo* oznaczony jako
`Or.inr` dowód zdania `b`. A więc jeżeli `a` i `b` to zdania, to `Or a b` jest trochę jak zbiór
będący sumą rozłączną zbiorów (z powodu zasady nieważności dowodów jednoelementowych), którego
elementami są dokładnie dowody `a` oznaczone tak, żeby nie mogły być równe żadnemu dowodowi `b` i
dowody `b` oznaczone tak, żeby nie mogły być równe żadnemu dowodowi `a`. Widzimy więc, że
alternatywa logiczna to szczególny przypadek koproduktu, czyli (z perspektywy kategoryjnej)
"wywrócona na drugą stronę" koniunkcja i że nie bez powodu może się kojarzyć z sumą rozłączną
zbiorów.

Tą dualność widać zarówno w sposobie, w jaki dowodzimy koniunkcji i alternatywy - czyli w regułach
wprowadzenia tego rodzaju zdań - jak i w sposobie, w jaki ich używamy, czyli w regułach
eliminacji. W dodatku reguły eliminacji są dualne do reguł wprowadzania!

Niech `p`, `q` i `r` będą jakimiś zdaniami. Żeby *udowodnić* zdanie `p \and q`, czyli je
*wprowadzić*, być może jako ostatni krok (czyli cel), *w konstruowanym dowodzie*, trzeba dysponować
*jednocześnie* dwoma dowodami, jednym dla zdania `p` *i* jednym dla zdania `q`. Żeby udowodnić `r`
*dysponując* tylko dowodem zdania `p and q`, czyli żeby *wykorzystać* w dowodzie tą koniunkcję do
udowodnienia `r`, trzeba wykazać, że `r` wynika z `p` *lub* z `q` (lub z obydwu tych zdań
zakładanych jednocześnie, bo *lub*, tak jak rozumiemy to słowo w logice, dopuszcza też taką
możliwość). A więc w regule wprowadzania koniunkcji pojawia się pojęcie koniunkcji, a w regule
eliminacji koniunkcji pojawia się pojęcie alternatywy.

Żeby *wprowadzić* zdanie `p \or q`, trzeba dysponować dowodem `p` *lub* dowodem `q`. Żeby
*wykorzystać* `p \or q` do udowodnienia `r`, trzeba udowodnić, że `r` wynika *zarówno z* `p` *jak i
z* `q`, ponieważ stąd, że mamy *jakiś* dowód `p \or q`, nie da się jeszcze wywnioskować, *która* z
tych alternatyw jest prawdziwa. A więc w wprowadzania alternatywy pojawia się pojęcie alternatywy, a
w regule eliminacji alternatywy pojawia się pojęce koniunkcji. Wydaje mi się, że zauważanie tej
dualności ułatwia zapamiętanie obydwu rodzajów reguł dla koniunkcji i alternatywy. Dzięki
zrozumieniu jej wystarczy w zasadzie zapamiętać *tylko* reguły dedukcji dla koniunkcji (albo dla
alternatywy). I w ten sposób dualność pozwala nam "zmniejszyć liczbę problemów o połowę".

No to teraz może spędzimy trochę więcej czasu przyglądając się dowodom w Leanie?

```lean
variable (p q r : Prop)

xexample : p → p ∨ q := 
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
