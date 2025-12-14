<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie

Wszystko w tym rozdziale można zrozumieć korzystając tylko z informacji podanych w rozdziałach
wcześniejszych. Jeżeli to będzie zbyt trudne, to oparte na innych punktach widzenia, szczegółowe
wyjaśnienia znajdziesz również w następnych dwóch rozdziałach. Wydaje mi się jednak, że będzie
lepiej, jeżeli Twój pierwszy kontakt z koniunkcją będzie oparty właśnie na omawianej tu
implementacji, ponieważ odpowiadający jej punkt widzenia nie tylko pozwala szybko przejść do
praktyki, ale jest też dzięki swojej "konkretności" dość intuicyjny. Jeżeli tylko ucząc się treści
zawartych w tym rozdziale przyjmiesz postawę aktywną, przekonasz się niebawem, że używanie
koniunkcji w dowodach nie będzie Ci sprawiać większych trudności.

A w następnym rozdziale spełnię po raz kolejny obietnicę, zgodnie z którą wszystko w matematyce
będziemy konstruować ze *strzałek*, a dokładnie z *funkcji*.

<hr>

# p ∧ q ~ p × q

```lean
-- Jeżeli `p` i `q` to jakieś zdania, ...
variable (p q : Prop)

--- ... to `p ∧ q` jest zdaniem o treści p i q.
#check p ∧ q -- `p ∧ q : Prop`
```

Podobnie jak implikacja i negacja, koniunkcja zdań jest *zdaniem złożonym*, bo powstaje przez
zastosowanie *spójnika logicznego*, w tym wypadku oznaczanego zwykle symbolem `∧`, który uzyskasz
wpisując `\and`.

W Leanie *dowodem* zdania `p ∧ q` jest *uporządkowana para* dowodów, złożona z dowodu zdania `p` i
dowodu zdania `q`, w tej kolejności. Dowód `p ∧ q` to zatem tak naprawdę *dwa* dowody, dowód `p` i
dowód `q`, spakowane do jednej struktury danych. Ze względu na to, jak koniunkcja jest
zaimplementowana w Leanie, dowód zdania `p ∧ q` można stworzyć *tylko w jeden sposób*, to jest
jawnie lub niejawnie (o czym później) aplikując funkcję `And.intro` do dwóch argumentów - dowodu `p`
i dowodu `q`:

```lean
-- Jeżeli mamy dowody zdań `p` i `q`, ...
variable (hp : p) (hq : q)

--- ... to możemy stworzyć dowód zdania `p ∧ q` stosując funkcję `And.intro`:
#check And.intro hp hq -- `⟨hp, hq⟩ : p ∧ q`
```

Gdy Lean pokazuje typ aplikacji `And.intro hp hq`, robi to posługując się symbolami `⟨` i `⟩`, o
których jeszcze nie mówiłem. Wyrażenie `⟨term1, term2⟩` to zapis oznaczający właśnie parę
uporządkowaną - w tym wypadku uzyskaliśmy parę uporządkowaną składającą się z dowodu `hq` zdania `q`
i dowodu `hp` zdania `p`. Żeby uzyskać symbol `⟨` wpisz `\<`, a żeby uzyskać symbol `⟩` wpisz `\>`.

Wyjaśnię teraz, w jaki sposób w Leanie używamy tego rodzaju struktur, bo pojęcie pary uporządkowanej
odgrywa ważną rolę w różnych matematycznych teoriach i jeszcze wiele razy nam się przyda. Być może
zresztą pamiętasz, że to pojęcie już pojawiło się już wcześniej, gdy mówiłem o układzie
kartezjańskim.

## Typ par uporządkowanych

Jeżeli `A` i `B` to typy, to `A × B` jest typem *par uporządkowanych złożonych z termu typu `A` i
termu typu `B`*, w tej kolejności. Żeby uzyskać symbol `×` wpisz `\x`.

```lean
-- Na przykład, tak zapisujemy *typ*: para uporządkowana złożona z termu typu `Nat` i termu typu `Nat` ...
#check Nat × Nat -- `Nat × Nat : Type`

-- ... a tak możemy zdefiniować przykładową stałą o typie `Nat × Nat`:
def para12 : Nat × Nat := ⟨1, 2⟩
#check para12 -- `para12 : Nat × Nat`

-- Możemy tworzyć pary złożone z elementów dowolnych dwóch typów. Na przykład, tak zapisujemy *typ*: para 
-- uporządkowana złożona z termu typu `Nat` i termu typu `String`, w tej kolejności ...
#check Nat × String -- `Nat × String : Type`

-- ... a tak możemy zdefiniować przykładową stałą o tym typie:
def para1jeden : Nat × String := ⟨1, "jeden"⟩
#check para1jeden -- `para1jeden : Nat × String`

-- Nie możemy niestety używać wymiennie notacji `p ∧ q` i `p × q`, ponieważ typ `Prop` nie jest
-- jednym ze "zwykłych" typów `Type i`, a tylko z takich typów możemy tworzyć typy par
-- uporządkowanych za pomocą symbolu `×`:
variable (p q : Prop) (hp : p) (hq : q)

-- Lean sygnalizuje tutaj błąd, bo typ dowodu koniunkcji, który jest parą uporządkowaną dowodów, nie
-- jest "zwykłą" uporządkowaną parą typów.
#check (⟨hp, hq⟩ : p × q)
```

Skoro już wiesz, jak możesz zapisywać takie typy i tworzyć termy takich typów, to pokażę Ci, jak
*wydobywać* elementy par.

```lean
-- Tak uzyskujemy dostęp do pierwszego elementu pary uporządkowanej (`fst` to skrót od first), ...
#eval para12.fst      -- `1`
#eval para1jeden.fst  -- `1`
-- To tylko alternatywny zapis:
#eval Prod.fst para12 -- `1`

-- ... a tak do drugiego (`snd` to skrót od second):
#eval para12.snd      -- `2`
#eval para1jeden.snd  -- `"jeden"`
#eval Prod.snd para12 -- `2`
```

Skoro już wiesz, jak uzyskać dostęp do elementów par uporządkowanych, to myślę, że niebawem
zrozumiesz, jak działa ta funkcja (o bardzo chwytliwej nazwie):

```lean
def dodaje_do_siebie_elementy_pary_uporzadkowanej_liczb_naturalnych : Nat × Nat → Nat :=
    fun (para : Nat × Nat) => para.fst + para.snd

#eval dodaje_do_siebie_elementy_pary_uporzadkowanej_liczb_naturalnych para12 -- `3`
```

Teraz pokażę Ci coś, co czasem bardzo ułatwia konstruowanie funkcji i dowodów. Ponieważ istnieje
*tylko jeden* sposób skonstruowania dowodu koniunkcji, a ogólnie termu będącego taką a nie inną parą
uporządkowaną, to gdy parametr ma typ taka-a-taka-para-uporządkowana, Lean wie, że wartość tego
parametru musiała zostać skonstruowana z dwóch wartości odpowiednich typów i te (być może tylko
hipotetyczne, ale to teraz nie ma znaczenia) wartości zawsze można znaleźć. Dlatego możemy
*przechwycić w miejscu parametru* elementy pary korzystając z czegoś, czego często półformalnie
używają matematycy, a co formalnie stosują informatycy, to jest z [*dopasowania do
wzorca*](https://pl.wikipedia.org/wiki/Dopasowanie_do_wzorca). Tym razem wybrałem krótszą nazwę dla
definiowanej funkcji, ponieważ wbrew pozorom jestem dosyć rozsądny.

```lean
def dodaje_elementy_pary : Nat × Nat → Nat :=
    -- Ponieważ Lean może wywnioskować typ parametru z pozostałych informacji, dla uproszczenia nie
    -- stosuję tu jawnego typowania w miejscu parametru i również Tobie to odradzam, za dużo
    -- zbędnego pisania. Ponieważ istnieje tylko jeden sposób skonstruowania termu typu `Nat × Nat`,
    -- argument można "zdekonstruować w parametrze". W tym przypadku zmienne `pierwszy` i `drugi`
    -- "przechwytują" elementy uporządkowanej pary, dzięki czemu nie musimy ich później wybodywać za
    -- pomocą funkcji `fst` i `snd`. Trzeba tylko w miejscu parametru zapisać taką jakby wirtualną
    -- parę uporządkowaną, bo elementami tej pary nie są stałe ani termy skonstruowane ze stałych,
    -- tylko nazwy pełniące rolę *zmiennych*.
    fun (⟨pierwszy, drugi⟩) => pierwszy + drugi

#eval dodaje_elementy_pary para12 -- `3`
```

I to jest na razie to wszystko, co musisz wiedzieć o parach uporządkowanych. Być może w przyszłości
nadarzy się okazja, żeby zapoznać się z parami *zależnymi*, to jest takimi, że *typ* drugiego
elementu *zależy* od pierwszego *elementu*, ale w tym momencie nie ma takiej potrzeby.

Ponieważ koniunkcja w Leanie jest zaimplementowana jako (nie całkiem "zwyczajna") uporządkowana
para, a dokładniej dowód koniunkcji to uporządkowana para dowodów zdań będących członami tej
koniunkcji, to wiesz już wszystko, co potrzebujesz wiedzieć, żeby posługiwać się koniunkcją w
dowodach: 

*Wprowadzanie (dowodu) koniunkcji polega na dostarczaniu dowodów jej członów, a korzystanie z
(dowodu) koniunkcji polega na wydobydwaniu z niej dowodów jej członów.*

## Koniunkcja w praktyce dowodzenia

Najpierw pokażę Ci przykłady dowodów twierdzeń w których występują koniunkcje, a potem spróbuję Ci
wyjaśnić krok po kroku, jak takie dowody powstają. Sugeruję, żebyś na początku spróbowała zauważyć
powtarzające się regularności, nie przejmując się za bardzo tym, jak dobrze je rozumiesz. Chodzi mi
o wstępne oswojenie się z ogólną strukturą tego rodzaju dowodów i z konwencjami dotyczącymi
zapisywania podstawowych operacji na koniunkcjach.

```lean
-- Można tak ...
theorem t1 (p q : Prop) : p → q → p ∧ q :=
    fun (hp : p) => fun (hq : q) => And.intro hp hq

--- ... i tak, na jedno wychodzi.
theorem t1' (p q : Prop) : p → q → p ∧ q :=
    fun (hp : p) => fun (hq : q) => ⟨hp, hq⟩

-- Można tak (funkcja wydobywająca pierwszy element dowodu koniunkcji nazywa się `left`, a nie
-- `fst`, jak w przypadku "zwykłych" par) ...
theorem t2fst (p q : Prop) : p ∧ q → p :=
    fun (h : p ∧ q) => And.left h

--- ... i tak ...
theorem t2fst' (p q : Prop) : p ∧ q → p :=
    fun (h : p ∧ q) => h.left

--- ... i tak, na jedno wychodzi (przypominam, że to, że w oknie Leana `hq` wyświetla się na szaro nie 
-- oznacza błędu):
theorem t2fst'' (p q : Prop) : p ∧ q → p :=
    fun (⟨hp, hq⟩) => hp

theorem t2snd (p q : Prop) : p ∧ q → q :=
    fun (h : p ∧ q) => And.right h

theorem t2snd' (p q : Prop) : p ∧ q → q :=
    fun (h : p ∧ q) => h.right

theorem t2snd'' (p q : Prop) : p ∧ q → q :=
    fun (⟨hp, hq⟩) => hq
```

Można powiedzieć, że ten kod wyraża (w pewien sposób, ale to nie jest jedyny możliwy sposób) *sens*
koniunkcji w logice konstruktywnej. Nie kryje się za nim żadna głębsza prawda; jeżeli widzisz
występujące tu regularności i dostrzegasz, jaką rolę odgrywają tu trzy podstawowe operacje na parach
uporządkowanych (tutaj akurat dowodów), to w pewnym sensie już wiesz, czym w logice konstruktywnej
jest koniunkcja.

To może jeszcze omówię niektóre z tych dowodów. Zaczniemy od tego:

```lean
theorem t1 (p q : Prop) : p → q → p ∧ q :=
    fun (hp : p) => fun (hq : q) => And.intro hp hq
```

Jak wiesz, zgodnie z konwencją dotyczącą nawiasów i strzałek `p → q → p ∧ q` to tak naprawdę `p → (q
→ (p ∧ q))`. Treścią (czyli typem) twierdzenia `t1` jest więc implikacja, której następnikiem jest
implikacja, której następnikiem jest koniunkcja. Gdybyśmy konstruowali ten dowód w trybie
interaktywnym, mógłby on wyglądać tak (ilustracja):

```lean
theorem t1 (p q : Prop) : p → q → p ∧ q := by
    intro hp              -- `fun (hp : p) => ...`
    intro hq              --     `fun (hq : q) => ...`
    exact And.intro hp hq --                     `⟨hp, hq⟩`
```

Wiedząc tylko, że `p` i `q` to jakieś zdania, zawsze z dowolnego dowodu `hp` zdania `p` możemy
skonstruować dowód zdania `(q → p ∧ q)`, ponieważ dysponując już dowodem `hp` z dowolnego dowodu
`hq` zdania `q` możemy wtedy skonstruować dowód zdania `p ∧ q`, tworząc za pomocą funkcji
`And.intro` parę uporządkowaną dowodów `hp` i `hq`, to jest `⟨hp, hq⟩`, która jest dowodem zdania `p
∧ q`. A mówiąc najprościej, jeżeli mamy dowód `p`, to jeżeli mamy dowód `q`, to możemy skonstruować
parę dowodów składającą się z dowodu `p` i dowodu `q`.

**Polecenie**: Starając się możliwie rzadko zaglądać do tego rozdziału, a może nawet w ogóle do
niego nie zaglądając, ...

```lean
-- ... udowodnij twierdzenie `t1` w trybie interaktywnym i pisząc kod wprost. Zrób to raz stosując
-- funkcję `And.intro`, a raz konstruując parę uporządkowną dowodów za pomocą symboli `⟨`, `⟩` i
-- przecinka. Jeżeli na początku to będzie się wydawać trudne, nie bój się eksperymentować i
-- korzystaj z informacji widocznych w trybie interaktywnym.
theorem t1 (p q : Prop) : p → (q → p ∧ q) :=
```

Teraz prześledzimy, jak dokładnie działa dowód prostej implikacji, w której koniunkcja odgrywa rolę
*poprzednika*:

```lean
theorem t2 (p q : Prop) : p ∧ q → p :=
    fun (h : p ∧ q) => And.left h
```

Treścią (i zarazem typem) tego twierdzenia jest zdanie o postaci implikacji, której poprzednikiem
jest koniunkcja. Jak wiesz, żeby udowodnić implikację trzeba stworzyć funkcję, która mając dowolny
dowód poprzednika konstruuje w jakiś sposób dowód następnika. Wobec tego w tym wypadku trzeba zrobić
coś z dowodem zdania `p ∧ q`, a ponieważ taki dowód to para uporządkowana dowodów zdań `p` i `q`, to
wystarczy wydobyć pierwszy element.

Można to zrobić na dwa sposoby, które różnią się tylko zapisem. Pierwszy to dopisanie do termu
oznaczającego dowód koniunkcji kropki i stałej `left`, bez spacji, a drugi to zastosowanie do tego
dowodu funkcji `And.left`. Jeżeli zastanawiasz się, czemu nie można zastosować tutaj stałej `fst`,
która powinna przecież działać dla każej pary uporządkowanej, to przypominam, że ostatecznym powodem
jest tylko pewna konwencja.

**Polecenie**: Starając się jak najrzadziej zaglądać do tego rozdziału, ... 

```lean
-- ... udowodnij obydwa twierdzenia w trybie interaktywnym i pisząc kod wprost. Jeżeli tylko masz
-- ochotę zrobić to stosując obydwa sposoby użycia funkcji `left` (a później `right`), to się nie
-- krępuj. Dowód drugiego twierdzenia różni się tylko tym, że trzeba wydobyć drugi element pary, a
-- nie pierwszy, a więc należy zastosować funkcję `And.right`, być może dopisując tylko słowo
-- `right` po kropce.
theorem t2l (p q : Prop) : p ∧ q → p :=

theorem t2r (p q : Prop) : p ∧ q → q :=
```

No i już wiesz, jak możesz używać koniunkcji w dowodach. Żeby utrwalić te umiejętności i zacząć
sobie lepiej radzić z bardziej skomplikowanymi dowodami, proponuję udowodnić tyle spośród
rozpoczętych poniżej dowodów i w taki sposób, w jaki tylko masz ochotę.

```lean
-- Tutaj przyda się funkcja `absurd`.
theorem t3 (p q : Prop) : p ∧ ¬ p → q :=

-- Fakt, że pojawiają się tu predykaty, nie ma większego znaczenia, poza tym, że trzeba jakoś
-- obsłużyć (później nieużywaną, a więc wyświetli się na szero) zmienną `n`.
theorem t4 (P Q : Nat → Prop) : ∀ n : Nat, P n → Q n → P n ∧ Q n :=

-- Niech żyje absurd i fałsz!
theorem t5 (P Q : Nat → Prop) : ∀ n : Nat, ¬ P n ∧ P n → Q n :=

-- Nie ma powodów do paniki. `∀ n : Nat, P n` to tutaj tylko jakieś zdanie, którego struktura nie odgrywa
-- w tym dowodzie ważnej roli.
theorem t6 (P : Nat → Prop) (q : Prop) : q ∧ ¬ q → ∀ n : Nat, P n :=
```
