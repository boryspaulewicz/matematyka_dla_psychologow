## O co chodzi

To ma być krótkie wprowadzenie do tego, jak w logice działa *kwantyfikator egyzstencjalny* `∃`,
nazywany również *małym*. Pomijając spójnik `↔`, który oznacza koniunkcję dwóch implikacji, i
relacje, które pojawią się wkrótce i które są uogólnieniami predykatów, to już ostatni potrzebny nam
element logiki konstruktywnej. A to znaczy, że niebawem opanujesz podstawy *kontruktywnej logiki
wyższego rzędu* (to jest logika wyższego rzędu, bo używamy predykatów maksymalnie swobodnie, to
znaczy pozwalamy, aby dotyczyły termów dowolnego typu, w tym również termów będących dowolnymi
typami).

<hr>

# ∃

Będziemy przez chwilę znowu mówić o żniwiarzach, ...

```lean
axiom Zniwiarz : Type

-- Tych dwóch predykatów ...
axiom Ponury : Zniwiarz → Prop
axiom Pogodny : Zniwiarz → Prop

-- ... będziemy używać zgodnie z następującą zasadą (aksjomatem, czyli konwencją):
-- Jeżeli jakiś żniwiarz jest ponury, to nie jest pogodny.
axiom pon_npog : ∀ z : Zniwiarz, Ponury z → ¬ Pogodny z
-- Nazwa `pon_npog` to skrót od `ponury_nie_pogodny`.

-- Będziemy sobie również znowu wyobrażać (aksjomatycznie) ponurego (aksjomatycznego) żniwiarza Krystiana.
axiom Krystian : Zniwiarz
axiom pk : Ponury Krystian

-- Jeżeli teraz zastosujemy aksjomat `pon_npog` do Krystiana, to uzyskamy dowód, że jeżeli Krystian
-- jest ponury, to nie jest pogodny ...
#check pon_npog Krystian -- `pon_npog Krystian : Ponury Krystian → ¬ Pogodny Krystian`
-- ... a ponieważ zdecydowaliśmy, że `Krystian` jest ponury, to możemy udowodnić również zdanie:
#check pon_npog Krystian pk -- `pon_npog Krystian pk : ¬ Pogodny Krystian`
```

## Jeżeli `α : Type`, `P : α → Prop`, i `x : α`, to co jest predykatem w zdaniu `¬ P x`?

Przypuszczam, że właściwy sposób czytania zdania `¬ Pogodny Krystian` jest dla Ciebie oczywisty, ale
czy wiesz, co w tym zdaniu jest predykatem? Skoro `¬ Pogodny Krystian` to formalnie zapisane zdanie
*Nieprawda, że Krystian jest pogodny*, czyli zdanie *Krystian nie jest pogodny*, to predykatem musi
być formalny odpowiednik nieformalnego predykatu *nie jest pogodny*. Jednak wyrażenie `¬ Pogodny`
*nie* jest predykatem ...

```lean
-- To jest (aksjomatycznie) poprawny predykat (dotyczący żniwiarzy), czyli pewna funkcja zwracająca
-- zdania ...
#check Pogodny -- Pogodny : Zniwiarz → Prop

-- .. ale `¬ Pogodny` nie jest predykatem.
#check (¬ Pogodny) -- Lean sygnalizuje tutaj błąd, ...
-- ... co znaczy, że wyrażenie `¬ Pogodny` nie jest typowalne, czyli nie jest poprawnie skonstruowane,
-- a więc nie jest też predykatem.
```

Jak już wiesz, symbol `¬` to inaczej zapisana funkcja `Not`, która wymaga argumentu będącego
*zdaniem*, a nie *predykatem*. Dlatego wyrażenie `¬ Pogodny` nie jest (poprawnym) termem, czyli nie
jest typowalne.

Term złożony `¬ Pogodny Krystian` to dla Leana `¬ (Pogodny Krystian)`, a nie `(¬ Pogodny)
Krystian`. `Krystian` jest `Zniwiarz`-em, paredykat `Pogodny` dotyczy `Zniwiarz`-y, a więc `Pogodny
Krystian` jest poprawnym zdaniem, wobec czego można do termu złożonego `Pogodny Krystian` zastosować
funkcję `Not` (albo `¬`), uzyskując w ten sposób poprawne zdanie.

Żeby skonstruować "negatywny" predykat, będący formalnym odpowiednikiem nieformalnego predykatu *nie
jest pogodny*, musimy *stworzyć funkcję* (z typu `Zniwiarz` do typu `Prop`), która będzie używała w
swoim ciele negacji i predykatu `Pogodny`:

```lean
-- To jest (anonimowa) funkcja, która z termów oznaczających żniwiarzy tworzy zdania, a więc
-- to jest predykat.
#check (fun z : Zniwiarz => ¬ Pogodny z) -- `(fun z : Zniwiarz => ¬ Pogodny z) : Zniwiarz → Prop`

-- Przy okazji, to też pewien predykat (tym razem dotyczący liczb naturalnych):
#check (fun n : Nat => n < 1) -- `fun n => n < 1 : Nat → Prop`

-- Dwa ostatnie predykaty są *skonstruowane* w kodzie, natomiast ...
#check Pogodny -- ... `Pogodny : Zniwiarz → Prop` to jak wiesz predykat *aksjomatyczny*.
-- Predykaty aksjomatyczne, takie jak `Pogodny`, możemy aplikować do termów wymaganego typu uzyskując
-- w ten sposób zdania, ale nie możemy redukować takich- aplikacji, bo pod stałą `Pogodny` nie kryje się
-- żaden kod.

-- Ponieważ poniższa aplikacja redukuje się do (a więc nim jest) zdania `¬ Pogodny Krystian`, ...
example : (fun z : Zniwiarz => ¬ Pogodny z) Krystian = ¬ Pogodny Krystian := by rfl
-- ... to term złożony `pon_npog Krystian pk` ma jednocześnie typ dany przez term złożony
-- `¬ Pogodny Krystian`, ...
#check (pon_npog Krystian pk : ¬ Pogodny Krystian) -- nie ma błędu, a więc typowanie jest poprawne
-- ... jak i typ dany przez term złożony `(fun z : Zniwiarz => ¬ Pogodny z) Krystian`:
#check (pon_npog Krystian pk : (fun z : Zniwiarz => ¬ Pogodny z) Krystian) -- to typowanie też jest poprawne
```

Jeżeli to opakowanie w λ-abstrakcję czegoś (tutaj `¬ Pogodny`), co wygląda jak predykat, ale nim nie
jest, żeby uzyskać coś, co faktycznie jest predykatem, jest dla Ciebie nadal nieco dezorientujące,
to być może ten fragment tylko pogorszy sprawę:

Jeżeli `P` jest predykatem dotyczącym termów typu `α` ...

```lean
variable (α : Type) (P : α → Prop)
```

... to ponieważ dwie (również teoriotypowe) funkcje tego samego typu (czyli z tego samego typu do
tego samego typu) są równe (czyli są wymienialne jako funkcje, czyli są takie same jako funkcje,
czyli są tą samą funkcją) wtedy i tylko wtedy, gdy dla każdego możliwego argumentu zwracają ten sam
rezultat (a więc takie funkcje nie muszą być tak samo zapisane czy skonstruowane, wystarczy, że *tak
samo działają*), to ...

```lean
--- ... następujące
def zdanie : Prop := P = (fun a : α => P a)
```

... jest prawdziwe z definicji:

```lean
example : zdanie α P := rfl
```

**Parametry są trochę jak aksjomaty**: Każdy parametr to taki jakby aksjomat, bo to przecież symbol,
który ma określony typ i który z perspektywy kodu wewnątrz definicji, której jest parametrem, jest
tylko *jakimś, bliżej nieokreślonym* termem danego typu, tak jak term aksjomatyczny jest jakimś
termem określonego typu. Można więc powiedzieć, że każda aksjomatyczna teoria matematyczna jest
jedną wielką funkcją albo strukturą danych, zawierającą rozmaite przypisane do lokalnych względem
tej teorii stałych konstrukcje, takie jak na przykład twierdzenia, a parametrami tej
struktury-teorii są aksjomaty.

**Jak działa instrukcja `variable`**: `P` jest więc tutaj takim jakby predykatem aksjomatycznym, ale
nie całkiem, bo użyliśmy instrukcji `variable`, która nie służy do wprowadzania aksjomatów, tylko do
deklarowania, że jakaś *zmienna* (stąd nazwa *variable*) ma być *parametrem* (czyli jakby
"wirtualnym aksjomatem") tam, gdzie jest używana. Ponieważ tak się składa, że w ciele definicji
stałej `zdanie` używamy symboli `P` i `α`, które były wcześniej wprowadzone za pomocą instrukcji
`variable`, to stała `zdanie` ma typ:

```lean
#check zdanie -- zdanie (α : Type) (P : α → Prop) : Prop
```

W ten sposób instrukcja `variable` sprawia, że Lean automatycznie uzupełnia tworzone przez nas
definicje i umożliwia pisanie bardziej zwięzłego i czytelnego kodu. Anonimowe twierdzenie `zdanie α
P` nie może więc być zapisane jako sama stała `zdanie`, bo stała `zdanie` nie ma typu `Prop`. Czemu
nie jednak napisałem po prostu ...

```lean
example (α : Type) (P : α → Prop) : P = (fun x => P x) := rfl
-- ... tylko przypisałem tą konstrukcję do stałej `zdanie`?
```

Szczerze mówiąc nie wiem. Przede wszystkim chciałem zilustrować definicyjną równość `f = (fun x => f
x)` dla każdej funkcji `f` (a predykaty to funkcje). Możemy już wrócić do kwantyfikatora
egzystencjalnego (inaczej małego).

## Dowodzenie zdań `∃ x, P x`

Zdanie `∃ z : Zniwiarz, ¬ Pogodny z` mówi, że *istnieje co najmniej jeden* żniwiarz, który nie jest
pogodny. Żeby udowodnić zdanie o postaci `Istnieje taki x, że P x` musimy dostarczyć taki `x`, że `P
x`, czyli musimy dostarczyć *dwie* rzeczy (parę uporządkowaną): term odpowiedniego typu, to jest
takiego, którego dotyczy `P` (tutaj term `Krystian`), i dowód, że ten właśnie term spełnia ten
predykat (tutaj takim dowodem jest term złożony `pon_npog Krystian pk`):

```lean
-- Lean nie sygnalizuje błędu, a więc dowód jest poprawny
example : ∃ z : Zniwiarz, ¬ Pogodny z := ⟨Krystian, pon_npog Krystian pk⟩
```

Zwracam uwagę na mam nadzieję zrozumiałą już w tym momencie analogię między (binarną) alternatywą i
kwantyfikatorem egzystencjalnym: Żeby udowodnić zdanie o postaci *alternatywy* trzeba dostarczyć
dowód jednego z *dwóch* członów tej alternatywy. Zdanie `∃ z : Zniwiarz, ¬ Pogodny z` to też pewnego
rodzaju alternatywa, tyle że *parametryczna* - różnych zdań o postaci `¬ Pogodny z` jest tyle, ilu
jest żniwiarzy, czyli ile jest możliwych wartości parametru `z : Zniwiarz`. Podobnie `∃ n : Nat, n <
3` to prawie to samo zdanie co `(0 < 3) ∨ (1 < 3) ∨ (2 < 3) ∨ (3 < 3) ∨ (4 < 3) ...`.

Gdyby żniwiarzy było tylko dwóch, na przykład gdyby `Krystian` i `Kamil` byli jedynymi żniwiarzami,
to zdanie `∃ z : Zniwiarz, ¬ Pogodny z` znaczyłoby w zasadzie to samo, co `¬ Pogodny Krystian ∨ ¬
Pogodny Kamil`, ale dowód tego ostatniego zdania składałby się albo tylko z pojedynczego termu
będącego dowodem zdania `¬ Pogodny Krystian`, albo z pojedynczego termu będącego dowodem zdania `¬
Pogodny Kamil`, a nie z pary uporządkowanej złożonej z termu i dowodu, że ten term spełnia predykat
`¬ Pogodny` (a tak naprawdę predykat `fun z => ¬ Pogodny z`).

To teraz jeszcze raz to samo, ale w trybie interaktywnym i używając taktyki `apply`. Żeby udowodnić
zdanie o postaci `∃ x, P x` musimy jawnie lub niejawnie zastosować funkcję / konstruktor / regułę
wprowadzania kwantyfikatora egzystencjalnego `Exists.intro`, która wymaga termu odpowiedniego (czyli
pasującego do danego predykatu) typu i dowodu, że ten term spełnia dany predykat. Taki dowód możemy
więc skonstruować albo pisząc `⟨jakis_term, dowod_ze_ten_term_spelnia_predykat_P⟩`, bo w odpowiednim
kontekście Lean potraktuje taki term jako inaczej zapisaną aplikację `Exists.intro`, albo pisząc
`Exists.intro jakis_term dowod_ze_ten_term_spelnia_predykat_P`.

```lean
example : ∃ z : Zniwiarz, ¬ Pogodny z := by
  apply Exists.intro Krystian
  -- Stosując w ten sposób w trybie interaktywnym taktykę `apply` mówimy Leanowi: Konstruuję dowód celu używając
  -- funkcji `Exist.intro` z pierwszym argumentem `Krystian`, a całą resztę (czyli w tym wypadku drugi i ostatni
  -- argument) dostarczę później. Ta brakująca reszta, to jest wymagany w tym miejscu dowód zdania 
  -- `¬Pogodny Krystian`, staje się odtąd nowym celem: `⊢ ¬Pogodny Krystian`
  
  -- Ponieważ rezultat/wniosek aksjomatu `pon_npog - ∀ z : Zniwiarz, Ponury z → ¬ Pogodny z` zgadza się z aktualnym
  -- celem (z dokładnością do wartości zmiennej `z`), to gdy zastosujemy ten aksjomat do celu `⊢ ¬Pogodny Krystian`
  -- ...
  apply pon_npog -- ... pozostanie nam już tylko zrealizować cel `⊢ Ponury Krystian` ...
  exact pk       -- ... a do tego wystarczy aksjomat `pk`.
```

Jeszcze raz ten sam dowód zapisany na dwa sposoby, ale już bez tak wielu komentarzy:

```lean
-- To tylko dwa sposoby zapisania tego samego dowodu (`⟨,⟩` to tylko lukier składniowy dla `Exists.intro`):
example : ∃ z : Zniwiarz, ¬ Pogodny z := ⟨Krystian, pon_npog Krystian pk⟩
example : ∃ z : Zniwiarz, ¬ Pogodny z := Exists.intro Krystian (pon_npog Krystian pk)
```

I jeszcze jeden przykład, tym razem z bardziej skomplikowanym predykatem `n + 1 = 2` (a właściwie
`fun n => n + 1 = 2`, jednak `n + 1 = 2` pisze się i czyta wygodniej, i mogę już chyba polegać w
tego typu sytuacjach na Twojej domyślności, prawda?):

```lean
-- Żeby skontruować dowód zdania `∃ n : Nat, n + 1 = 2`, trzeba dostarczyć jakiś term typu `Nat`, czyli
-- liczbę naturalną i dowód, że ta liczba spełnia warunek: dodanie 1 do tej liczby daje liczbę równą 2.
-- Przypominam, że nawiasy trójkątne uzyskasz w Leanie pisząc \< i \>. Również w tym przypadku druga część
-- dowodu będzie trywialna, bo jedyny term (`1`), który spełnia ten warunek, spełnia go *z definicji*.
-- Nawet bez wchodzenia w tryb interaktywny za pomocą instrukcji `by`, konstruując dowód tego zdania jako
-- parę, możesz podać taktykę służącą do dowodzenia równości definicyjnej (zaczyna się na literę `r`, pamiętasz?)
-- jako drugi element pary.
example : ∃ n : Nat, n + 1 = 2 :=
```

## Jak to jest zrobione

Żeby zachęcić Cię do czytania dokumentacji i kodu źrodłowego, który Lean ładuje automatycznie zaraz
po uruchomieniu (na przykład [tego
kodu](https://github.com/leanprover/lean4/blob/master/src/Init/Prelude.lean)), spróbuję teraz
objaśnić sygnaturę typu stałej `Exists.intro`. Nie musisz dobrze rozumieć tego fragmentu, ale moim
zdaniem jest wskazane, żebyś na tym etapie miała już kontakt z tego rodzaju sprawami.

Gdybyśmy chcieli sami zdefiniować konstruktor dowodów zdań o postaci `∃ x : Typ, P x`, moglibyśmy
zrobić to tak (`inex` to skrót od *intro exists*):

```lean
def inex (Typ : Type) (P : Typ → Prop) (x : Typ) (h : P x) : ∃ x : Typ, P x :=
  ⟨x, h⟩
```

Na razie oszukuję, bo znając typ parametrów i rezultatu Lean traktuje tutaj parę `⟨x, h⟩` jako inny
sposób zapisania `Exists.intro ...`, a więc `inex` to konstruktor używający istniejącego już
konstruktora tego rodzaju zdań. Poza tym, że `inex` jest próbą rozwiązania problemu, który jest już
rozwiązany, używając `inex` musielibyśmy za każdym razem jawnie podawać typ termu i predykat, który
dotyczy tego typu, ...

```lean
-- Tak możemy udowodnić zdanie `∃ n : Nat, n = 1` używając funkcji `inex`:
#check (inex Nat (fun n : Nat => n = 1) 1 rfl : ∃ n : Nat, n = 1)
-- Jak widać, podawanie jawnie wszystkich informacji koniecznych do pełnej formalizacji bywa uciążliwe
-- i nie zawsze służy lepszemu zrozumieniu, o co chodzi.
```

... a przecież Lean może wywnioskować typ termu (tutaj `Nat`) i predykat (tutaj `fun n : Nat => n =
1`) z pozostałych argumentów, albo z podanego tutaj jawnie zdania do udowodnienia (skoro mówimy
Leanowi, że to ma być dowód zdania `∃ n : Nat, n = 1`, to musi chodzić o predykat `fun n => n =
1`). Wygodniej byłoby więc zdefiniować konstruktor dowodów takich zdań korzystając z *niejawnych*
parametrów (które oznaczamy w definicjach otaczając je nawiasami klamrowymi):

```lean
-- W ten sposób mówimy: sam się domyśl na podstawie argumentów, o jaki `Typ` i jaki `P`-redykat chodzi.
def inex' {Typ : Type} {P : Typ → Prop} (x : Typ) (h : P x) : ∃ x : Typ, P x :=
  ⟨x, h⟩
```

Wtedy na przykład aplikacja `inex' 1 rfl` (czyli `inex' 1`
*automatyczny-dowód-polegający-na-rozwijaniu-definicji*) będzie poprawnym dowodem zdania `∃ n : Nat,
n = 1`:

```lean
#check (inex' 1 rfl : ∃ n : Nat, n = 1)
-- Lean nie zgłasza błędu, a więc typowanie jest poprawne, a więc `inex' 1 rfl` jest termem typu 
-- `∃ n : Nat, n = 1`, a ponieważ ten typ to zdanie, to `inex' 1 rfl` jest dowodem tego zdania.
```

Wydaje mi się, że ten ostatni dowód jest bardziej czytelny niż poprzedni, w którym trzeba było podać
jawnie typ i predykat, i ten krótszy dowód nie wymaga wcale szczególnej domyślności, bo przecież od
razu widać, o jaki typ i jaki predykat chodzi. Nawiasem mówiąc, ponieważ w Leanie `1` oznacza
domyślnie liczbę naturalną `1`, a nie na przykład stałą `1` interpretowaną jako liczba całkowita, to
możemy napisać również tak (pomijając jawne typowanie `n`):

```lean
#check (inex' 1 rfl : ∃ n, n = 1)
```

Konstruktor `inex'` wydaje się być dobrym rozwiązaniem, ale w pewnych sytuacjach będzie
niewystarczający, ponieważ nie działa dla *dowolnego* typu. Przypominam, że (z dosyć nudnych powodów
technicznych) typy w Leanie tworzą nieskończoną *hierarchię*, wobec czego ograniczając się do
predykatów typu `Typ → Prop`, gdzie `Typ : Type`, czyli `Typ : Type 0`, uniemożliwiamy sobie
operowanie predykatami dotyczącymi termów *wyższych* typów, na przykład typu `Type 665`.

To ograniczenie możemy usunąć traktując *poziom* w hierarchii typów jako (najlepiej niejawny)
parametr. Stosujemy w tym celu specjalną składnię, to znaczy zapisujemy parametryczny poziom
(nazywany w Leanie *uniwersum*) w nawiasach klamrowych zaraz po kropce występującej na końcu nazwy
definiowanej stałej. W poniższej definicji taką rolę parametru oznaczającego uniwersum odgrywa
zmienna `u`:

```lean
def inex''.{u} {Typ : Type u} {P : Typ → Prop} (x : Typ) (h : P x) : ∃ x : Typ, P x :=
  ⟨x, h⟩
  
#check (inex'' 1 rfl : ∃ n, n = 1)
```

Takie rozwiązanie będzie *niemal* uniwersalne, ale nie całkiem, ponieważ `Type i` to to samo, co
`Sort i + 1` ale `Prop` to `Sort 0`, a nie ma czegoś takiego jak `Type -1`, ...

```lean
#check Type -1 -- Lean sygnalizuje tutaj błąd, ...
#check Sort 0  -- ... a tu nie. Lean mówi `Prop : Type`, ponieważ `Sort 0` to `Prop`.
#check Sort 1  -- Lean mówi `Type : Type 1`, ponieważ `Sort 1` to `Type 0`, a `Type 0` to `Type`.
```

... co oznacza, że używając `inex''` nie możemy korzystać z predykatów dotyczących termów typu
`Prop`, czyli nie możemy korzystać z *predykatów dotyczących zdań*. Żeby usunąć to ostatnie
ograniczenie, musimy użyć najogólniejszego sposobu zapisu typu jako arbitralnego *sortu* (żeby
podkreślić uzyskaną w ten sposób uniwersalność zmieniłem nazwę na `inexu`):

```lean
def inexu.{u} {Typ : Sort u} {P : Typ → Prop} (x : Typ) (h : P x) : ∃ x : Typ, P x :=
  ⟨x, h⟩

-- Przy okazji przypominam, że to są dwa równoważne sposoby sprawdzania dowodu bez wprowadzania
-- nowej definicji (twierdzenia): `example` pozwala konstruować twierdzenia anonimowe, ...
example : ∃ n, n = 1 := inexu 1 rfl
-- ... a w ten sposób, to jest sprawdzając poprawność jawnego typowania, możemy sprawdzać poprawność
-- dowodu za pomocą komendy `#check`:
#check (inexu 1 rfl : ∃ n, n = 1)
```

Teraz będzie już mam nadzieję jasne, czemu konstruktor `Exists.intro` ma takie a nie inne parametry:

```lean
#check Exists.intro -- Exists.intro.{u} {α : Sort u} {p : α → Prop} (w : α) (h : p w) : Exists p
```

Być może jednak nadal masz wątpliwości na temat typu rezultatu zapisanego jako term `Exists p`.
Może na przykład zastanawiasz się, gdzie się podział odpowiednik symbolu `x`, którego używaliśmy na
oznaczenie *czegoś* w zdaniu *Istnieje takie coś, co spełnia predykat `P`*? Otóż dopóki mówimy o
*samym zdaniu*, nie ma potrzeby dodawania takiego symbolu, ponieważ z każdego, dotyczącego termów
jakiegokolwiek typu `α` predykatu `P` można zrobić dokładnie jedno zdanie o postaci `∃ x : α, P x`,
to będzie to samo zdanie co na przykład zdanie `∃ z : α, P z`, i każde takie zdanie będzie
odpowiadało dokładnie jednemu predykatowi dotyczącemu termów danego typu. Te zdania są więc
*własnościami* albo *funkcjami samych predykatów*. Żeby zapisać formalnie zdanie, że dany predykat
jest spełniony przez co najmniej jeden term, wystarczy w jakiś niewykorzystany wcześniej sposób
oznaczyć ten predykat (tutaj robimy to poprzedzając predykat stałą `Exists`).

Popatrzmy jeszcze na zapisaną
[tutaj](https://github.com/leanprover/lean4/blob/master/src/Init/Core.lean) definicję indukcyjną
tego rodzaju zdań (tym razem usunąłem komentarze):

```lean
inductive Exists {α : Sort u} (p : α → Prop) : Prop where
  | intro (w : α) (h : p w) : Exists p
```

**Czytamy to**: Indukcyjnie definiuję typ zdań `Exists p`, gdzie `p` to predykat dotyczący jakiegoś
typu `α` (dowolnego sortu). Termy takich typów, czyli dowody takich zdań, można stworzyć tylko w
jeden sposób - są to dokładnie nieredukowalne aplikacje konstruktora `intro` do termu typu `α` i
dowodu, że ten term spełnia predykat `p`. Przy okazji przypominam, że pełna nazwa `intro` to
`Exists.intro`, bo każda definica indukcyjna tworzy przestrzeń nazw o nazwie takiej jak definiowana
stała.

Każda aplikacja funkcji dwuargumentowej do dwóch argumentów jest pewną (oznaczoną nazwą aplikowanej
funkcji) parą uporządkowaną (złożoną z tych argumentów). Dowód zdania o postaci `∃ x : α, P x` to
nic innego jak para złożona z termu typu `α` i dowodu, że ten term spełnia predykat `P`, tyle, że
taka para jest dodatkowo oznaczona etykietą `Exists.intro`. Stała `Exists.intro` pełni tu *tylko*
rolę oznaczenia pary spełniającej określone wymagania, ponieważ takie aplikacje są nieredukowalne
(pod stałą `Exists.intro` nic się nie kryje).

Żeby dodatkowo zachęcić Cię do zaglądania w przyszłości do dokumentacji i kodu źródłowego Leana,
wkleję tu jeszcze zapisany jako komentarz w kodzie źródłowym fragment dokumentacji dotyczącej typu
`Exists`:

```lean
/--
Existential quantification. If `p : α → Prop` is a predicate, then `∃ x : α, p x`
asserts that there is some `x` of type `α` such that `p x` holds.
To create an existential proof, use the `exists` tactic,
or the anonymous constructor notation `⟨x, h⟩`.
...
--/
```

Dowiadujemy się z tego fragmentu, że istnieje coś takiego jak ...

```lean
-- ... taktyka `exists`, której możemy używać na przykład tak:
example : ∃ n : Nat, n = 1 := by exists 1
```

... ale z tą taktyką zapoznamy się może innym razem.

Wiesz już, jak możesz udowodnić zdanie zawierające kwatyfikator egzystancjalny. Teraz pokażę Ci, jak
możesz takich zdań *używać*. Ponieważ takie zdania są parametrycznymi alternatywami, używanie zdań o
postaci `∃ x : α, P x` do udowodnienia innych zdań (jakiegoś zdania `R`) polega na czymś podobnym do
używania (dowodów) zdań o postaci ("zwykłej") alternatywy:

Jak już wiesz, żeby udodwodnić `r` korzystając z założenia/dowodu `p ∨ q` trzeba udowodnić, że `r`
wynika *zarówno* z `p` jak i z `q`, czyli z każdej z tych dwóch jakby możliwości, bo mając dowód
zdania `p ∨ q` wiemy tylko tyle, że *któreś* z tych zdań jest prawdziwe, ale nie wiemy które.

Żeby udodwodnić `R` korzystając z założenia/dowodu `∃ x : α, P x` trzeba udowodnić, że `R` wynika *z
każdej możliwej wersji* zdania parametrycznego `P x`, czyli, że *wynika ze zdania `P x` dla każdego
`x`*, bo wiedząc, że `∃ x : α, P x` wiemy tylko tyle, że co najmniej jedno zdanie o postaci `P x`
jest prawdziwe, ale nie wiemy które. Właśnie dlatego stała `Exists.elim`, której możemy używać do
eliminacji/używania takich zdań, ma taki a nie inny typ:

```lean
#check Exists.elim
-- Exists.elim.{u} {α : Sort u} {p : α → Prop} {b : Prop} (h₁ : ∃ x, p x) (h₂ : ∀ (a : α), p a → b) : b
```

Zgodnie z tym typem, Lean ma się sam domyślić (dowolnego) typu `α`, predykatu `p` i zdania `b`,
które ma być udowodnione przy założeniu `h₁ : ∃ x, p x`. Żeby udowodnić `b` korzystając z dowodu
`h₁` musimy dostarczyć dowód, że `b` wynika z dowodu każdej możliwej wersji zdania `p x`, czyli
musimy dostarczyć term typu/dowód `∀ (a : α), p a → b`. Aplikując `Exists.elim` do tych wszystkich
argumentów uzyskamy dowód zdania `b`. Zaczniemy od mojego ulubionego przykładu:

```lean
example : (∃ x, P x) → ¬ ∀ x, ¬ P x := fun h => h.elim (b := False)
```

Zastanawiasz się może, co tu się stało? Jeżeli, zamiast polegać na domyślności Leana i pozostałych
argumentach (których tu nie ma), sami podamy wartość parametru `b` pisząc `(b := False)` (tak
właśnie podaje się jawnie wartości niejawnych parametrów), to, zgodnie z typem `Exists.elim`
(przypominam, że `h.elim` to tylko inaczej zapisana aplikacja `Exists.elim h`), ...

```lean
Exists.elim.{u} {α : Sort u} {p : α → Prop} {b : Prop} (h₁ : ∃ x, p x) (h₂ : ∀ (a : α), p a → b) : b

-- ... ponieważ `h : ∃ x, P x`, to `Exists.elim h` ma typ (Lean odgaduje, że `α` to nasze `α` i `p` to
-- nasze `P`) ...
Exists.elim h {b : Prop} (h₁ : ∃ x, P x) (h₂ : ∀ (a : α), P a → b) : b
-- ... czyli `Exists.elim h` ma typ (przestawialność dwukropka!):
Exists.elim h {b : Prop} : (∃ x, P x) → (∀ (a : α), P a → b) → b
-- A więc (podstawiamy `False` pod `b` w specyfikacji tego typu zależnego):
Exists.elim h (b := False) : (∃ x, P x) → (∀ (a : α), P a → False) → False
-- Co - zgodnie z definicją negacji - znaczy to samo co:
Exists.elim h (b := False) : (∃ x, P x) → ¬ (∀ (a : α), ¬ P a)
```

To mój ulubiony przykład między innymi dlatego, że dowód zdania `(∃ x, P x) → ¬ ∀ x, ¬ P x` pojawia
się w książce [*Type theory and formal
proof*](https://www.cambridge.org/core/books/type-theory-and-formal-proof/0472640AAD34E045C7F140B46A57A67C),
jednak podany tam dowód jest bardziej skomplikowany. Gdy zauważyłem, że można to zdanie udowodnić
prościej, zapytałem Roba Nederpelta, czemu pojawia się tam ten prostszy dowód, na co Rob
odpowiedział, że dla wielu czytelników ten prostszy dowód może być mniej oczywisty. 

Zastanawiasz się może, jak mógłby wyglądać bardziej skomplikowany dowód tego samego twierdzenia?
To może najpierw w trybie interaktywnym:

```lean
-- Jeżeli istnieje taki `x`, że `P x`, to oczywiście nieprawda, że dla każdego `x`, nieprawda, że `P x`
example : (∃ x, P x) → ¬ ∀ x, ¬ P x := by
  -- `(∃ x, P x) → ¬ ∀ x, ¬ P x` to to samo co `(∃ x, P x) → (∀ x, ¬ P x) → False`, a więc zaczynamy od:
  intro h1 h2                -- `h1 : ∃ x, P x`; `h2 : ∀ x, ¬ P x`
  apply h1.elim (b := False) -- Zmiana celu na `⊢ ∀ (a : α), P a → False`, bo musimy dostarczyć dowód tego
                             -- zdania, żeby użyć `h1` do udowodnienia `False`.
  intro a hPa                -- `a : α`; `hPa : P a`; `⊢ False`
  exact (h2 a) hPa           -- `h2 a : ¬ P a`, czyli `h2 a : P a → False`; `hPa : P a`

-- Można też tak (tym razem dodałem jawne typowanie parametrów, żeby dowód był bardziej czytelny):
example : (∃ x, P x) → ¬ ∀ x, ¬ P x := 
  fun h1 : ∃ x, P x =>
    fun h2 : ∀ x, ¬ P x => 
      show False from -- `show <zdanie> from <term>` to tylko jawna deklaracja mówiąca, że `term` jest
                      -- dowodem zdania `zdanie`. W ten sposób można ułatwić (również przyszłej wersji
                      -- siebie) czytanie dowodu.
        h1.elim (fun x => fun hPx => h2 x hPx)

-- Można też tak:
example : (∃ x, P x) → ¬ ∀ x, ¬ P x := by
  -- Wprowadzanie do kontekstu z tego rodzaju wykorzystaniem dopasowania wzorców jest tutaj dopuszczalne, 
  -- bo dowód `∃ x, P x` mógł powstać tylko w taki sposób.
  intro ⟨x, hPx⟩
  -- Mamy udowodnić negację, czyli implikację, a więc wprowadzamy jej poprzednik
  intro h -- `h : ∀ (x : α), ¬P x`
  -- Teraz już łato zauważyć, z jakich dostępnych w kontekście elementów możemy zrobić dowód fałszu
  exact (h x) hPx
```

Może spróbuj teraz udowodnić w Leanie na co najmniej dwa sposoby zdanie `(∃ x, P x) → ¬ ∀ x, ¬ P x`
bez zaglądania do tego rozdziału, albo zaglądając tylko wtedy, gdy utkniesz.
