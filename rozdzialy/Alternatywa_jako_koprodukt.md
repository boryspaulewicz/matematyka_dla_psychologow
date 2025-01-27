# p ∨ q ~ p + q

Pierwsza wersja tego rozdziału zaczynała się od rozważań o charakterze ogólnym, ale postanowiłem to
zmienić, bo otrzymałem informacje zwrotne, z których wynikało, że to nie był najlepszy
pomysł. Dlatego ta wersja zaczyna się od podrozdziału dotyczącego używania alternatywy logicznej w
praktyce dowodzenia.

## Alternatywa w praktyce dowodzenia

Jeżeli `P` i `Q` to jakieś zdania, to dowodem zdania `P ∨ Q`, które **czytamy jako** `P` lub `Q`,
jest *albo* dowód zdania `P`, *albo* dowód zdania `Q`. To są dwie reguły wprowadzenia
alternatywy. Co ciekawe, dowodem alternatywy `P ∨ Q` nie może nim być dowód zdania `P` i zdania `Q`
*jednocześnie*, chyba, że to są te same zdania.

Jeżeli mamy jakiś dowód zdania `P ∨ Q`, to żeby korzystając z niego udowodnić jakieś zdanie `R`
trzeba mieć lub skonstruować dowód, że `R` wynika z `P` jak również, że `R` wynika z `Q`. Chodzi w
tym o to, że mają sam dowód zdania `P ∨ Q` wiemy tylko tyle, że (co najmniej) *jedno* z tych dwóch
zdań jest prawdziwe, ale nie wiemy które. To jest jedyna reguła eliminacji dla alternatywy.

**Sugestia**: Można potraktować poniższe przykłady dowodów jako inspirację do wymyślania własnych
zadań, albo po prostu spróbować udowodnić niektóre lub wszystkie pojawiające się tutaj zdania na
tyle różnych sposobów, na ile tylko ma się ochotę, zaglądając tu tak często, jak się uzna za
stosowne. Moim zdaniem, jeżeli nikogo nie krzywdzimy, możemy w ogóle robić, mówić i myśleć co tylko
chcemy. A czasem bywa i tak, że skrzywdzenie kogoś z rozwagą, na przykład wypowiadając publicznie
kilka gorzkich albo obraźliwych słów, jest jedynym etycznie akceptowalnym rozwiązaniem.

```lean
variable (p q r : Prop)

-- Jeżeli p, to oczywiście również p lub q. To jest pierwsza reguła wprowadzania alternatywy w
-- dedukcji naturalnej. Można by ją nazwać regułą wprowadzania alternatywy "z lewej". Ponieważ alternatywa
-- to w Leanie zdefiniowany indukcyjnie koprodukt, konstruujemy dowody alternatyw używając albo pierwszej
-- (inaczej lewej) albo drugiej (inaczej prawej) injekcji. Pierwsza/lewa nazywa się Or.inl, a druga/prawa
-- nazywa się Or.inr.
example : p → p ∨ q := 
  fun (hp : p) => Or.inl hp

-- A to druga reguła wprowadzania alternatywy:
example : q → p ∨ q := 
  fun (hq : q) => Or.inr hq
```

Teraz wiesz już wszystko, co musisz wiedzieć na temat konstruowania dowodów alternatyw w Leanie. A w
ten sposób możesz korzystać z alternatywy jako przesłanki konstruując dowody innych zdań:

```lean
-- Mogłem napisać też Or.elim h ..., ale wolę tak, bo tak jest krócej. Żeby skorzystać z dowodu alternatywy
-- p ∨ q dowodząc jakiegokolwiek zdania r trzeba dysponować dowodami zdań p → r i q → r. W tym 
-- przypadku to oznacza, że trzeba dysponować (dwa razy tym samym) dowodem zdania p → p, który to dowód
-- możemy skonstruować w każdym kontekście, bo to jest przecież funkcja identycznościowa.
example : p ∨ p → p :=
  fun (h : p ∨ p) => 
    -- Tym razem zapisałem tą aplikację w trzech liniach, żeby było lepiej widać, co się tutaj dzieje.
    h.elim
      (fun (hp : p) => hp)
      (fun (hp : p) => hp)

-- To samo co wyżej, ale bez łamania kodu na linie i bez typowania parametrów.
example : p ∨ p → p := fun h => h.elim (fun h => h) (fun h => h)

-- Skoro matematyka to programowanie, to matematyka to programowanie. A więc jeszcze raz to samo,
-- ale tym razem za pomocą funkcji konstruującej dowody tautologii a → a dla dowolnego zdania a.
def ID (a : Prop) : a → a := fun h => h
example : p ∨ p → p := fun h => h.elim (ID p) (ID p)

-- A tak możemy odwrócić kolejność członów alternatywy:
example : p ∨ q → q ∨ p :=
  fun (h : p ∨ q) =>
    h.elim 
      (fun (hp : p) => Or.inr hp)
      (fun (hq : q) => Or.inl hq)
```

Dla przypomnienia popatrzymy jeszcze na kilka przykładów dowodów, w których występuje jednocześnie
alternatywa i koniunkcja.

```lean
-- Pominąłem typowanie argumentu w funkcji anonimowej, ale poza tym ten dowód nie jest już dla Ciebie
-- szczególnie trudny do zrozumienia, prawda? Pamiętasz, że jeśli h to dowód koniunkcji, to h.left
-- jest dowodem pierwszego albo lewego członu koniunkcji, a h.right drugiego albo prawego?
example : p ∧ q → p ∨ q := 
         fun h => Or.inl h.left

-- Jak wyżej, tylko inaczej, bo korzystając z dowodu tego poprzednika można udowodnić alternatywę
-- będącą następnikiem na dwa różne sposoby.
example : p ∧ q → p ∨ q := 
         fun h => Or.inr h.right

-- Tak też można, korzystając z dopasowania wzorca w parametrze i zastępując jedną z wartości symbolem _,
-- żeby Lean nie narzekał, że występują tu nieużywane nazwy parametrów.
example : p ∧ q → p ∨ q := 
     fun ⟨hp, _⟩ => Or.inl hp

example : p ∧ q → p ∨ q := 
     fun ⟨_, hq⟩ => Or.inr hq

-- W trybie interaktywnym:
example : p → p ∨ q := by
  intro hp
  exact Or.inl hp

-- Dopasowanie wzorca można stosować również zapisując argument taktyki intro:
example : p ∧ q → p ∨ q := by
  intro ⟨_, hq⟩
  exact Or.inr hq
```

### Kilka nowych taktyk

Gdy mamy jakiś dowód alternatywy i chcemy z niego skorzystać, zastosowanie taktyki `cases` może być
pomocne, ponieważ ułatwia skupienie się na "obsłużeniu" każdego z dwóch możliwych sposobów
*konstruowania dowodu alternatywy, z którego chcemy skorzystać*. Jako argument podajemy wtedy nazwę
dowodu tej alternatywy. Taktyka `cases` pozwala więc *użyć* dowodu alternatywy poprzez obsłużenie
wszystkich możliwych sposobów *wprowadzania* takiego dowodu.

```lean
example : p ∨ q → q ∨ p := by
  -- Wprowadzamy do kontekstu przesłankę/poprzednik/hipotetyczny dowód zdania p ∨ q jako zmienną h.
  intro h
  -- *Ten* dowód (a nie dowód celu) mógł powstać tylko na dwa sposoby - albo na skutek zastosowania
  -- konstruktora Or.inl, albo konstruktora Or.inr. Taktyka cases pozwala wygodnie obsłużyć obydwie
  -- możliwości.
  cases h with
  -- W tym miejscu zapisujemy nazwę konstruktora bez poprzedzania jej nazwą przestrzeni nazw Or.
  |inl hp => -- Uzupełnij brakujący kod, zwracając uwagę na stan dowodu, lub wyciągając wnioski z komentarza
  -- poniżej. Pozostaje zastosować tutaj taktykę exact z aplikacją konstruktora Or.inr do odpowiedniego argumentu.
  -- Gdy już skontruujesz w tym miejscu dowód implikacji p → q ∨ p, to gdy kursor będzie w następnej linii,
  -- zobaczysz, że masz do dyspozycji dowód hq zdania q. Będziesz już wtedy wiedziała, co należy zrobić.
  |inr hq => -- Uzupełnij brakujący kod.

example : p ∨ q → q ∨ p := by
  intro h
  -- To tylko inny sposób zapisania tego samego dowodu.
  cases h -- Gdy kursor jest tutaj, dostępna w kontekście zmienna h ma inny kolor niż pozostałe. To dlatego,
  -- że tą nazwę Lean wygenerował *automatycznie*, a to znaczy, że przyszła implementacja Leana może to zrobić
  -- inaczej, a wtedy dowód opierający się na tym, jaka to jest nazwa, przestałby działać.
  case inl hp => -- Gdy kursor jest tutaj, widoczna w konkteście nazwa dowodu p to hp. Uzupełnij brakujący kod.
  case inr hq => -- Uzupełnij brakujący kod.

example : p ∨ q → q ∨ p := by
  intro h
  cases h -- W tym miejscu widoczna w kontekście zmienna h ma znowu inny kolor. Nie musimy jednak ani
  -- odnosić się do tej zmiennej jawnie, ani jak wcześniej nadawać nazwy hipotetycznym dowodom członów tej
  -- alternatywy. Zamiast tego możemy zastosować taktykę apply. W tym miejscu da się skonstruować dowód p ∨ q
  -- za pomocą konstruktora Or.inr, bo w kontekście jest (tylko) dowód zdania p, które jest *prawym* członem
  -- alternatywy będącej celem.
  --
  -- Zastosowanie taktyki apply <argument> powoduje, że Lean próbuje dopasować *wniosek* albo ogólniej *rezultat*
  -- tego, co jest podane jako argument, do aktualnego celu. Jeśli mu się uda, tworzy nowy cel lub cele, które
  -- muszą być zrealizowane, żeby zastosowanie tego czegoś, co jest arugmentem, zakończyło się sukcesem.
  -- Czyli pojawiają się wtedy nowe cele, będące przesłankami albo prerekwizytami, które trzeba udowodnić albo
  -- mówiąc ogólnie skontruować, żeby zastosowanie argumentu taktyki apply rozwiązało oryginalny cel. W tym
  -- przypadku jako nowy cel pojawi się więc zdanie p, ponieważ skonstruowanie dowodu oryginalnego celu za pomocą
  -- konstruktora Or.inr wymaga uzupełnienia właśnie o dowód zdania p, które jest prawym członem alternatywy
  -- będącej oryginalnym celem.
  apply Or.inr
  -- Taktyka assumption sama szuka w kontekście termu o takim samym typie jak aktualny cel i w tym
  -- wypadku go znajduje. Dzięki temu nie musimy odwoływać się do nazwy dowodu p. Gdy kursor znajduje
  -- się w tej samej linii co assumption, widać, że kontekst odpowiada drugiemu możliwemu sposobowi
  -- udowodnienia *przesłanki* p ∨ q, to jest h : q.
  assumption
  -- Dokończ dowód podobnie, jak to zrobiłem powyżej, czyli zaczynając od zastosowania taktyki apply z
  -- odpowiednim konstruktorem dowodu alternatywy.

example : p ∨ q → q ∨ p := by
  intro h
  cases h
  -- Taktyka rename_i pozwala nadać jawnie nową nazwę zmiennej w kontekście, która została nazwana przez
  -- Leana automatycznie, dzięki czemu można się potem posługiwać tą nazwą w konstrukcji dowodu.
  rename_i hp
  exact Or.inr hp
  -- Dokończ dowód, zaczynając od nadania jawnej nazwy widocznemu w tym momencie w kontekście dowodowi zdania q.
```

## Alternatywa logiczna jako koprodukt w kategorii zdań i relacji dowiedlności

Jeżeli ten podrozdział wyda Ci się na razie zbyt trudny, możesz go pominąć bez szkody dla
zrozumienia kolejnych rozdziałów i wrócić tu, kiedy poczujesz, że może coś Ci się rozjaśni.

W Leanie `∨` to tylko lukier składniowy, pod którym kryje się stała `Or`, oznaczająca pewien
*indukcyjny typ danych*, zdefiniowany w taki oto sposób (zaraz to objaśnię):

```lean
inductive Or (a b : Prop) : Prop where
  -- `Or.inl` to "lewa injekcja" w (koprodukt i jednocześnie typ) `Or`. Jeżeli `h : a`, to `Or.inl h : a ∨ b`.
  | inl (h : a) : Or a b
  -- `Or.inr` to "prawa injekcja" w `Or`. Jeżeli `h : b`, to `Or.inr h : a ∨ b`.
  | inr (h : b) : Or a b
```

Komentarze są tutaj moimi tłumaczeniami tego, co można znaleźć w pliku
[Prelude.lean](https://github.com/leanprover/lean4/blob/master/src/Init/Prelude.lean). Ta definicja
indukcyjnego typu danych jest bardziej skomplikowana niż omawiane w poprzednim rozdziale definicje
indukcyjne zdań `True` i `False` nie tylko dlatego, że pojawiają się tutaj *dwa* sposoby tworzenia
termów definiowanego typu. Ta definicja jest bardziej skomplikowana przede wszystkim dlatego, że
jest jednocześnie *parametryczna* i *rekurencyjna*.

**Czytamy to**: Definiuję indukcyjnie (`inductive`) parametryczny (bo ta definicja ma \{tutaj dwa\}
parametry) *typ danych* `Or` typu `Prop` o parametrach `a` i `b` typu `Prop` (`Or (a b : Prop)`)
jako typ takich termów, że (`where`) każdy taki term można skonstruować *albo* jako (`|`) *samą,
nieredukowalną aplikację* o postaci `Or.inl (h : a)` będącą dowodem zdania `Or a b`, albo jako (`|`)
nieredukowalną aplikację `Or.inr (h : b)` będącą dowodem zdania `Or a b`.

### Krótko o definicjach indukcyjnych, definicjach rekurencyjnych i schematach aksjomatów.

Jak już wiesz, aksjomaty to dokładnie definicje pozbawione ciała, czyli definicje nierozwijalne,
czyli arbitralne konwencje językowe albo pojęciowe, czyli pewne *wybory* dotyczące tego, *o czym ma
być mowa*. Na przykład, ...

```lean
axiom Pada_deszcz : Prop
axiom d : Pada_deszcz
```

to dwa aksjomaty, na mocy krótych `Pada_deszcz` jest zdaniem, a `d` jest dowodem tego zdania. To
*nie* są *założenia*, tylko szczególnego rodzaju *definicje*, które pozwalają używać tych dwóch
(odtąd) stałych, czyli *mówić* o tych dwóch "rzeczach" mimo, że w pierwszym przypadku nie
skonstruowaliśmy żadnego termu typu `Prop`, a w drugim nie skonstruowaliśmy żadnego dowodu
zdania. Jak widzisz, aksjomaty to definicje pozbawione ciała, a więc definicje nierozwilajne,
inaczej nieredukowalne.

A w takim razie to, że aplikacje `Or.inl` i `Or.inr` są (ostatecznie, bo ich argumenty mogą być
przecież redukowalne) nieredukowalne, oznacza, że ta typu `Or`, jak każda *parametryczna* definicja
*indukcyjnego typu danych*, jest tak zwanym [*schematem
aksjomatu*](https://pl.wikipedia.org/wiki/Schemat_aksjomatu)[^1], czyli *przepisem* generującym
pewien - być może nieskończony - *zbiór aksjomatów*.

Zapisując tą definicję jako definicję indukcyjną rozstrzygamy o tym, że *wszystkie takie* i *tylko
takie* termy są termami (parametrycznego) typu `Or`. Ponadto, zdania o postaci `Or a b`, które nie
powstają z tych samych uporządkowanych par zdań, są na mocy tej definicji *różnymi* zdaniami i tak
samo dowody alternatyw będące aplikacjami różnych *konstruktorów* (tutaj konstruktorami są `Or.inl`
i `Or.inr`) są *różnymi termami*. Jednak w tym przypadku te *różne* termy będące dowodami są
*wymienialne*, ale tylko dlatego, że są *traktowane* jako takie same, zgodnie z obowiązującą w
Leanie zasadą nieważności struktury dowodów.

Właśnie na tym, że to są *wszystkie* sposoby konstruowania termów tego typu i że *różne* sposoby
konstrukcji dają *różne* termy polega *indukcyjność* tej definicji. Definicje `True` i `False` są w
takim samym znaczeniu indukcyjne, ale te dwie definicje nie są parametryczne, a więc nie są
schematami aksjomatu, a poza tym typ/zdanie `False` nie ma żadnego konstruktora, a `True` ma tylko
jeden konstruktor `True.intro`.

Definicja parametrycznego (czyli zależnego) typu `Or` jest również
[*rekurencyjna*](https://en.wikipedia.org/wiki/Recursive_definition) (inaczej *rekursywna*), bo jest
*przepisem, jak można tworzyć* (pewnego rodzaju) *zdania ze zdań*, czyli pewnego rodzaju obiekty czy
struktury z obiektów czy struktur *tego samego rodzaju*. Ale uwaga, ta aksjomatyczna definicja jest
rekurencyjna w tym znaczeniu, że jest przepisem mówiącym, że pewnego rodzaju zdania istnieją jako
konstrukcje z innych zdań, ale *nie* w tym znaczeniu, że alternatywy istnieją (tylko) jako
konstrukcje z alternatyw. To jest więc *część* rekurencyjnej definicji *zdań*, a dokładniej [*formuł
logicznych*](https://pl.wikipedia.org/wiki/Formu%C5%82a_logiczna). Ta rekurencyjność może budzić
wątpliwości, ale - wbrew obiegowej opinii - nie każda ["kołowatość"
definicji](https://en.wikipedia.org/wiki/Circular_definition)[^2] jest problematyczna. Ta na
przykład nie jest.

<hr>

Znowu zmienię teraz konwencję i zacznę oznaczać bliżej nieokreślone zdania dużymi literami, żeby
zasygnalizować, że mogą być dowolnie złożone.

*Jeżeli* `P` *i* `Q` *to zdania, to* `Or P Q` (inaczej `P ∨ Q`) *jest zdaniem*.

A więc to jest aksjomatyczny przepis na tworzenie pewnego rodzaju zdań ze zdań. Jednocześnie to jest
też aksjomatyczny przepis na tworzenie dowodów pewnego rodzaju zdań z dowodów zdań:

*Jeżeli* `P` *i* `Q` *to zdania, to jeżeli* `h` *jest dowodem* `P`, *to* `Or.inl h` *jest dowodem*
`Or P Q`.

*Jeżeli* `P` *i* `Q` *to zdania, to jeżeli* `h` *jest dowodem* `Q`, *to* `Or.inr h` *jest dowodem*
`Or P Q`.

Mówiąc krótko, jeżeli `P` i `Q` to zdania, to dowodem zdania `Or P Q` jest *albo* oznaczony jako
`Or.inl` dowód zdania `P`, *albo* oznaczony jako `Or.inr` dowód zdania `Q`. A więc `Or P Q`
przypomina zbiór będący sumą rozłączną zbiorów, którego elementami są dokładnie dowody `P` oznaczone
tak, żeby nie mogły być równe żadnemu dowodowi `Q` i dowody `Q` oznaczone tak, żeby nie mogły być
równe żadnemu dowodowi `P`. Widzimy oto znowu, że alternatywa to szczególny przypadek koproduktu,
czyli (z perspektywy kategoryjnej) "wywrócona na drugą stronę" koniunkcja.

## Koniunkcja i alternatywa z perspektywy kategoryjnej

Tą dualność widać zarówno w sposobie, w jaki *dowodzimy* koniunkcji i alternatywy - czyli w regułach
*wprowadzenia* tego rodzaju zdań - jak i w sposobie, w jaki ich *używamy*, czyli w regułach ich
*eliminacji*.

Niech `P`, `Q` i `R` będą jakimiś zdaniami. Żeby *udowodnić* zdanie `P ∧ Q`, trzeba dysponować
*jednocześnie dwoma dowodami*, jednym dla zdania `P` *i* jednym dla zdania `Q`.

Żeby udowodnić `R` *dysponując* tylko dowodem zdania `P ∧ Q`, czyli żeby *wykorzystać* w dowodzie tą
koniunkcję do udowodnienia `R`, wystarczy wykazać, że `R` wynika z `P`, *lub* wykazać, że wynika z
`Q`, lub z obydwu tych zdań jednocześnie, bo "lub" (albo "albo"), tak jak domyślnie rozumiemy to
słowo w logice, dopuszcza też taką możliwość. A więc w regule wprowadzania koniunkcji pojawia się
pojęcie koniunkcji, a w regule eliminacji koniunkcji pojawia się dualne pojęcie alternatywy.

Wydaje mi się, że nie jest wcale oczywiste, że mamy tutaj do czynienia ze współźródłowymi strzałkami
do produktu i jego członów. Każdy dowód koniunkcji albo będzie wymagał zastosowania jakiś dostępnych
lokalnie hipotez, albo nie. Na przykład, jeżeli koniunkcja do udowodnienia będzie miała postać `(p →
p) ∧ q`, to dowód lewego członu będziemy mogli skonstruować "z niczego", konstruując funkcję
identycznościową na zdaniach i to będzie jednocześnie *prawie* dowód implikacji `True → (p → p)`, bo
taki dowód musiałby ignorować swój argument, będący dowodem zdania `True` i zwrócić identyczność. A
dysponując lokalnie, jako założeniem albo udowodnionym wcześniej zdaniem, na przykład hipotezą `(p →
q) ∧ p`, będziemy mogli udowodnić zdanie `q`.

Zawsze, gdy możemy udowodnić w danym kontekście jakieś dwa zdania `P` i `Q`, w tym samym kontekście
możemy też udowodnić pewne zdanie `H`, z którego *jednocześnie* wynikają te dwa zdania, czyli zawsze
wtedy możemy udowodnić implikacje `H → P` i `H → Q` dla pewnego zdania `H`. W ostatnim przykładzie
takim zdaniem jest zdanie `True ∧ ((p → q) ∧ p)`, albo po prostu `(p → q) ∧ p`. A więc z perspektywy
kategoryjnej będą wtedy istniały współźródłowe strzałki do punktów `P` i `Q`. Z tej perspektywy,
ponieważ kategoria dowiedlności zdań jest cienka, reguła wprowadzania dla koniunkcji odpowiada
"produktowości" koniunkcji, bo mówi, że *istnieje* wtedy strzałka z tego samego źródła do `P ∧ Q` i
taka strzałka musi być *unikalna*, ponieważ ta kategoria jest cienka.

Reguła *eliminacji* dla koniunkcji dotyczy z kolei strzałek *z* koniunkcji. Ponieważ każda
koniunkcja to pewna specjalna para współźródłowych strzałek `P ← P × Q → Q`, to z koniunkcji
wynikają te i tylko te zdania, które wynikają z `P` - bo wtedy wynikają z `P ∧ Q` z powodu
składalności strzałek - *lub* z `Q`, *lub* z `P ∧ Q`. Być może tym razem to były dla Ciebie zbyt
niespodziewane, gwałtowne i niejawne zmiany języka i pespektywy, ale może już nie?

Widzimy więc, że reguły eliminacji są w pewien sposób dualne do reguł wprowadzania i że w regułach
eliminacji dla koniunkcji pojawia się - ale w *metajęzyku* jako *słowo lub*, a nie jako spójnik
logiczny występujący w jakimś zapisanym formalnie zdaniu, o którym mówią te reguły - obiekt dualny
do koniunkcji, to jest alternatywa.

Żeby *wprowadzić* zdanie `P ∨ Q`, czyli zdanie `Or P Q`, trzeba dysponować dowodem `P` *lub* dowodem
`Q`. Żeby *wykorzystać* `P ∨ Q` do udowodnienia `R`, trzeba udowodnić, że `R` wynika *zarówno z* `P`
*jak i, niezależnie, z* `Q`, ponieważ z samego faktu, że mamy *jakiś* dowód `P ∨ Q`, nie da się
wywnioskować, *która* z tych alternatyw jest prawdziwa. A więc we wprowadzaniu alternatywy, które
dotyczy strzałek *do* alternatywy jako koproduktu, pojawia się pojęcie alternatywy, a w regule
eliminacji alternatywy, która dotyczy strzałek *z* alternatywy jako koproduktu, pojawia się (w
metajęzyku) dualne pojęcie koniunkcji. Wydaje mi się, że oswojenie się z tymi dualnościami ułatwia
zapamiętanie reguł dedukcji - czyli reguł wprowadzania i eliminacji - dla koniunkcji i alternatywy.

Mam nadzieję, że zaczęłaś się już zastanawiać, czy można to wszystko wyrazić w języku teorii
kategorii, posługując się w tym celu diagramami, a może nawet jednym diagramem, bo przecież mamy
tutaj do czynienia z dualnością koniunkcji do alternatywy i dualnością reguł wprowadzania do reguł
eliminacji. Nie sugeruję, żebyś to zrobiła, bo to nie jest łatwe do narysowania - tak tylko o tym
wspominam.

## Koniunkcja i alternatywa ze strzałek, ale inaczej

Ten podrozdział jest jeszcze bardziej opcjonalny niż poprzedni. 

Przypominam "strzałkową" definicję *koniunkcji*:

```lean
def and (p q : Prop) : Prop := ∀ r : Prop, (p → q → r) → r
```

Ta definicja jest "zrobiona ze strzałek" w innym znaczeniu niż definicje kategoryjne, ale oczywiście
da się ją "skategoryfikować". Jeden z moich ulubionych sposobów myślenia o tej definicji polega na
tym, że interpretujemy `p → q → r` jako typ *funkcji dwuparametrowych*, które zwracają dowody zdań
dające się skonstruować z par dowodów będących argumentami ich aplikacji.

Z tego punktu widzenia ta definicja wyraża po prostu fakt, że dowód koniunkcji zdań `p` i `q` to
taki dowód, za pomocą którego można udowodnić każde zdanie wynikające z łącznej prawdziwości zdań
`p` i `q`. Przyjmując tą definicję można łatwo zdefiniować jedyną regułę wprowadzania i obydwie
reguły eliminacji dla koniunkcji:

```lean
-- Dla uproszczenia pominąłem tutaj typowanie, którego Lean może się sam domyślić i zastąpiłem nazwy
-- nieużywanych parametrów symbolem _.

-- Żeby udowodnić koniunkcję zdań trzeba mieć dowody członów tej koniunkcji:
def and_in1 (p q : Prop) (hp : p) (hq : q) : and p q :=
    -- W ten sposób w kontekście parametrów tej funkcji możemy skonstruować term typu:
    -- ∀ r : Prop,            (p → q → r) →  r
    -- czyli dowód zdania and p q
    fun (r : Prop) => fun (h : p → q → r) => h hp hq

-- To jest definicja pierwszej albo lewej reguły eliminacji dla koniunkcji. Z dowodu p ∧ q zawsze
-- można zrobić dowód p:
def and_el1 (p q : Prop) (h : and p q) : p :=
    h p (fun hp => fun _ => hp)

-- Z dowodu p ∧ q zawsze można zrobić dowód q:
def and_el2 (p q : Prop) (h : and p q) : q :=
    h q (fun _ => fun hq => hq)
```

Ponieważ te dwie ostatnie definicje są funkcjami, które przekształcają dowody każdej koniunkcji o
postaci `p ∧ q` w dowody zdań `p` i `q` odpowiednio, to te funkcje są "generatorami" (w innym niż
wcześniej wprowadzone znaczeniu tego słowa) strzałek-projekcji z koniunkcji jako produktu. O tym też
wspominam tylko dlatego, że wydaje mi się to ciekawe.

W tym samym znaczeniu strzałkową definicję *alternatywy* można natomiast skonstruować tak:

```lean
def or (p q : Prop) : Prop := ∀ r : Prop, (p → r) → (q → r) → r

-- Zastosowałem tutaj dłuższe nazwy parametrów, żeby łatwiej można było zrozumieć o co chodzi w tych
-- definicjach i znowu pominąłem zbędne typowanie i nieużywane nazwy parametrów.
def or_in1 (p q : Prop) (hp : p) : or p q :=
-- ∀ r : Prop, (p → r) →      (q → r) → r
   fun _ =>    fun hp_to_r => fun _ =>  hp_to_r hp

def or_in2 (p q : Prop) (hq : q) : or p q :=
  fun _ => fun _ => fun hq_to_r => hq_to_r hq

-- Definicja alternatywy jest tutaj tym samym, co jedyna reguła eliminacji dla alternatywy.
```

To, że koniunkcja ma jedną regułę wprowadzania i dwie reguły eliminacji, a alternatywa ma dwie
reguły wprowadzania i jedną regułę eliminacji, też jest manifestacją dualności tych pojęć.

Strzałkowa definicja alternatywy wyraża wprost zasadę, zgodnie z którą alternatywa to takie zdanie,
że jeżeli wiemy, że to zdanie jest prawdziwe, to wiemy jednocześnie, że prawdziwe jest każde zdanie,
które wynika *jednocześnie* z *samego* zdania `p` i z *samego* zdania `q`. Uwaga - teraz będę
żonglował terminami *słabszy*, *mocniejszy*, *łatwiejszy* i *trudniejszy* mówiąc o *warunkach* (do
spełnienia) i o *założeniach*: Warunek, który musimy spełnić, żeby użyć dowodu alternatywy jest
trudniejszy do spełnienia, a więc to jest bardziej wymagający albo mocniejszy *warunek* niż
wynikanie z łącznej prawdziwości zdań `p` i `q`. Koniunkcja zdań jest więc *mocniejszym założeniem*
niż alternatywa złożona z tych samych zdań, co znaczy, że z `p ∧ q` wynika `p ∨ q`, ale nie
odwrotnie. Inaczej mówiąc, z koniunkcji można wywnioskować zawsze *co najmniej* to samo co z
alternatywy złożonej z tych samych zdań, ale nie odwrotnie. Łatwo się w tym pogubić, prawda?

Możemy powiedzieć to samo, tylko najogólniej jak się da, wznosząc się znowu na wysokość, na której
słychać już trochę burczenie aniołów: Jeżeli w kategorii `ℂ` istnieje produkt `X × Y` i koprodukt
`X + Y`, to istnieją co najmniej dwie, niekoniecznie różne strzałki z `X × Y` do `X + Y`, bo są nimi
co najmniej złożenia projekcji `X ← X × Y → Y` z injekcjami `X → X + Y ← Y`. Za to nie *musi*
istnieć żadna strzałka z `X + Y` do `X × Y`. I w ten oto sposób za jednym zamachem stwierdziliśmy
coś na temat koniunkcji i alternatywy, iloczynu kartezjańskiego zbiorów i sumy rozłącznej zbiorów i
w ogóle wszystkich możliwych produktów i koproduktów.

Możemy zobaczyć z tej perspektywy, że to, jak *działa w logice* koniunkcja i alternatywa nie ma
*nic* wspólnego z tym, jak te pojęcia są zdefiniowane albo zaimplementowane na przykład w takiej
albo innej wersji teorii typów. Może się wydawać, że wyjaśniając to w ten sposób tracimy poczucie
sensu, ale jeśli mamy takie wrażenie, to jest tak *tylko* dlatego, że mamy tendencję do rozumienia
wszystkiego od strony implementacji, która wydaje się nam bardziej konkretna albo
podstawowa. Jednocześnie jednak dzięki przyjęciu perspektywy kategoryjnej zyskujemy możliwość
zrozumienia w pewnym sensie prawdziwych, a już na pewno głębszych i bardziej uniwersalnych
*powodów*, dla których produkty i koprodukty są zdefiniowane w taki a nie inny sposób w różnych
kontekstach (tutaj w kontekście teorii typów z wbudowanymi parami uporządkowanymi i definicjami
indukcyjnymi).

### Przypisy

[^1]: Polska wersja tego artykułu (strony Wikipedii nazywamy oficialnie artykułami) jest niestety
    znacznie gorsza od [angielskiej](https://en.wikipedia.org/wiki/Axiom_schema).

[^2]: [Polska wersja](https://pl.wikipedia.org/wiki/B%C5%82%C4%99dne_ko%C5%82o_w_definiowaniu)
    również tego artykułu jest niestety znacznie gorsza od angielskiej.

