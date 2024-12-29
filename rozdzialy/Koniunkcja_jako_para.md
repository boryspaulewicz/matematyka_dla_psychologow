## O czym teraz będzie

Wszystko w tym rozdziale można zrozumieć korzystając tylko z informacji podanych w rozdziałach
wcześniejszych. Jeżeli to jest na razie zbyt trudne, to oparte na innych punktach widzenia,
szczegółowe wyjaśnienia znajdziesz również w następnych dwóch rozdziałach. Wydaje mi się jednak, że
będzie lepiej, jeżeli Twój pierwszy kontakt z koniunkcją będzie oparty na omawianej tu
implementacji, ponieważ odpowiadający jej punkt widzenia nie tylko pozwala szybko przejść do
praktyki, ale jest też dzięki swojej "konkretności" dość intuicyjny. Jeżeli tylko ucząc się treści
zawartych w tym rozdziale przyjmiesz postawę aktywną, przekonasz się niebawem, że używanie
koniunkcji w dowodach nie będzie Ci sprawiać szczególnych trudności.

W następnym rozdziale spełnię (po raz kolejny) obietnicę złożoną w jednym z rozdziałów
wprowadzających, zgodnie z którą wszystko w matematyce będziemy konstruować ze *strzałek*, a
dokładnie z *funkcji*.

# ∧ 1

```lean
-- Jeżeli p i q to jakieś zdania ...
variable (p q : Prop)

--- ... to p ∧ q jest zdaniem o treści p i q.
#check p ∧ q -- p ∧ q : Prop
```

Podobnie jak implikacja i negacja, koniunkcja jest *zdaniem złożonym*, bo powstaje przez
zastosowanie *spójnika logicznego*, w tym wypadku spójnika `∧`, który uzyskasz wpisując `\and`.

W Leanie dowodem zdania `p ∧ q` jest *uporządkowana para* dowodów złożona z dowodu zdania `p` i
dowodu zdania `q`, w tej kolejności. A mówiąc krócej, dowód `p ∧ q` to tak naprawdę dwa dowody,
dowód `p` i dowód `q`. Ze względu na to, jak koniunkcja jest zaimplementowana w Leanie, dowód zdania
`p ∧ q` można stworzyć *tylko w jeden sposób* - jawnie lub niejawnie (o czym później) aplikując
funkcję `And.intro` do dowodu `p` i dowodu `q`:

```lean
-- Jeżeli mamy jakieś dowody zdań p i q ...
variable (hp : p) (hq : q)

--- ... to możemy stworzyć dowód zdania p ∧ q stosując funkcję And.intro:
#check And.intro hp hq -- ⟨hp, hq⟩ : p ∧ q
```

Gdy Lean pokazuje typ aplikacji `And.intro hp hq`, robi to posługując się symbolami, o których
jeszcze nie mówiłem, to jest `⟨` i `⟩`. Wyrażenie `⟨hp, hq⟩` to tylko standardowy zapis oznaczający
parę uporządkowaną, w tym wypadku parę uporządkowaną składającą się z dowodu `hq` zdania `q` i
dowodu `hp` zdania `p`. Żeby uzyskać symbol `⟨` wpisz `\<`, a żeby uzyskać symbol `⟩` wpisz `\>`.

Muszę teraz wyjaśnić, w jaki sposób w Leanie używamy tego rodzaju struktur. Pojęcie pary
uporządkowanej jeszcze nam się przyda, ponieważ odgrywa bardzo ważną rolę w różnych matematycznych
teoriach. Być może zresztą przypominasz sobie, że wspominałem o nim już wcześniej gdy mówiłem o
układzie kartezjańskim.

## Typ par uporządkowanych

Jeżeli `A` i `B` to jakieś typy, to `A × B` jest typem *par uporządkowanych złożonych z termu typu
`A` i termu typu `B`*, w tej kolejności. Żeby uzyskać symbol `×` wpisz `\x`.

```lean
-- Na przykład, tak zapisujemy *typ*: para uporządkowana złożona z termu typu Nat i termu typu Nat ...
#check Nat × Nat -- Nat × Nat : Type

-- ... a tak możemy zdefiniować przykładową stałą o typie Nat × Nat:
def para12 : Nat × Nat := ⟨1, 2⟩
#check para12 -- para12 : Nat × Nat

-- Możemy tworzyć pary złożone z elementów dowolnych dwóch typów. Na przykład, tak zapisujemy *typ*: para 
-- uporządkowana złożona z termu typu Nat i termu typu String, w tej kolejności ...
#check Nat × String -- Nat × String : Type

-- ... a tak możemy zdefiniować przykładową stałą o tym typie:
def para1jeden : Nat × String := ⟨1, "jeden"⟩
#check para1jeden -- para1jeden : Nat × String
```

Skoro już wiesz, jak możesz zapisywać takie typy i tworzyć termy takich typów, to teraz pokażę Ci, w
jaki sposób możesz wydobywać z par ich elementy.

```lean
-- Tak uzyskujemy dostęp do pierwszego elementu pary uporządkowanej (fst to skrót od first) ...
#eval para12.fst     -- 1
#eval para1jeden.fst -- 1

-- ... a tak do drugiego (snd to skrót od second):
#eval para12.snd     -- 2
#eval para1jeden.snd -- "jeden"
```

Teraz, gdy już wiesz, w jaki sposób możesz uzyskać dostęp do elementów dowolnych par
uporządkowanych, myślę, że bez trudu zrozumiesz, jak działa ta funkcja (o bardzo chwytliwej nazwie):

```lean
def dodaje_do_siebie_elementy_pary_uporzadkowanej_liczb_naturalnych : Nat × Nat → Nat :=
    fun (para : Nat × Nat) => para.fst + para.snd

#eval dodaje_do_siebie_elementy_pary_uporzadkowanej_liczb_naturalnych para12 -- 3
```

Teraz pokażę Ci coś, co bardzo ułatwia zapisywanie niektórych funkcji, w tym również niektórych
dowodów. Ponieważ istnieje *tylko jeden* sposób skonstruowania dowodu koniunkcji (a ogólnie termu
będącego taką a nie inną parą uporządkowaną), gdy parametr ma typ taka-a-taka-para-uporządkowana,
możemy *przechwycić w miejscu parametru* pierwszy i drugi element korzystając z [*dopasowania do
wzorca*](https://pl.wikipedia.org/wiki/Dopasowanie_do_wzorca). Wybrałem tutaj krótszą nazwę dla
definiowanej funkcji, ponieważ wbrew pozorom jestem dość rozsądny.

```lean
def dodaje_elementy_pary : Nat × Nat → Nat :=
    -- Ponieważ Lean może wywnioskować typ parametru z pozostałych informacji, dla uproszczenia nie stosuję tu 
    -- jawnego typowania w miejscu parametru i również Tobie to odradzam, za dużo zbędnego pisania.
    -- Ponieważ istnieje tylko jeden sposób skonstruowania termu typu Nat × Nat, argument można 
    -- "zdekonstruować w parametrze". Polega to na tym, że zmienne pierwszy i drugi "przechwytują" elementy 
    -- uporządkowanej pary, bez konieczności wybodywania ich za pomocą funkcji fst i snd. Trzeba tylko
    -- w miejscu parametru zapisać parę uporządkowaną, której elementami są nazwy pełniące rolę *zmiennych*.
    fun (⟨pierwszy, drugi⟩) => pierwszy + drugi

#eval dodaje_elementy_pary para12 -- 3
```

I to tyle, na razie to wszystko, co musisz wiedzieć o parach uporządkowanych. Być może w przyszłości
nadarzy się okazja, żeby zapoznać się z parami *zależnymi*, to jest takimi, że *typ* drugiego
elementu *zależy* od pierwszego *elementu*, ale na razie nie ma takiej potrzeby.

Ponieważ koniunkcja w Leanie jest zaimplementowana po prostu jako uporządkowana para, a dokładniej
dowód koniunkcji to uporządkowana para dowodów zdań będących członami tej koniunkcji, to wiesz już
wszystko, co potrzebujesz wiedzieć, żeby dowodzić twierdzeń, w których pojawiają się koniunkcje.

## Koniunkcja w praktyce dowodzenia

Najpierw pokażę Ci przykłady dowodów prostych twierdzeń w których występują koniunkcje, a potem
spróbuję Ci wyjaśnić, krok po kroku, jak takie dowody powstają. Sugeruję, żebyś najpierw spróbowała
zauważyć poniżej pewne wzorce czy regularności, nie przejmując się za bardzo tym, czy lub w jakim
stopniu je rozumiesz. Chodzi jedynie o wstępne oswojenie się z ogólną strukturą tego rodzaju dowodów
i z najważniejszymi konwencjami dotyczącymi zapisywania podstawowych operacji na koniunkcjach.

```lean
-- Można tak ...
theorem t1 (p q : Prop) : p → q → p ∧ q :=
    fun (hp : p) => fun (hq : q) => And.intro hp hq

--- ... i tak, na jedno wychodzi.
theorem t1' (p q : Prop) : p → q → p ∧ q :=
    fun (hp : p) => fun (hq : q) => ⟨hp, hq⟩

-- Można tak ...
theorem t2fst (p q : Prop) : p ∧ q → p :=
    fun (h : p ∧ q) => And.left h

--- ... i tak ...
theorem t2fst' (p q : Prop) : p ∧ q → p :=
    fun (h : p ∧ q) => h.left

--- ... i tak, na jedno wychodzi (przypominam, że to, że w oknie Leana hq wyświetla się na szaro nie 
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
koniunkcji w logice konstruktywnej. Za tym kodem (na całe szczęście) nie kryje się żadna głębsza
prawda; jeżeli widzisz występujące tu regularności i dostrzegasz, jaką rolę odgrywają widoczne tutaj
trzy, stosunkowo proste operacje na uporządkowanych parach (tutaj akurat dowodów), to już w zasadzie
wiesz, czym w logice konstruktywnej jest koniunkcja.

Teraz omówię niektóre z tych dowodów. Zaczniemy od tego:

```lean
theorem t1 (p q : Prop) : p → q → p ∧ q :=
    fun (hp : p) => fun (hq : q) => And.intro hp hq
```

Jak wiesz, zgodnie z konwencją dotyczącą nawiasów i strzałek, `p → q → p ∧ q` to tak naprawdę `p →
(q → p ∧ q)`. Treścią (czyli typem) twierdzenia `t1` jest więc implikacja, której następnikiem jest
implikacja, której następnikiem jest koniunkcja. Gdybyśmy konstruowali ten dowód w trybie
interaktywnym, mógłby on wyglądać tak (ilustracja):

```lean
theorem t1 (p q : Prop) : p → (q → p ∧ q) := by
    intro hp              -- fun (hp : p) => ...
    intro hq              --     fun (hq : q) => ...
    exact And.intro hp hq --                     ⟨hp, hq⟩
```

Wiedząc tylko, że `p` i `q` to jakieś zdania, zawsze z dowolnego dowodu `hp` zdania `p` możemy
skonstruować dowód zdania `(q → p ∧ q)`, ponieważ dysponując już dowodem `hp` z dowolnego dowodu
`hq` zdania `q` możemy zawsze skonstruować dowód zdania `p ∧ q`, tworząc za pomocą funkcji
`And.intro` parę uporządkowaną dowodów `hp` i `hq`, to jest `⟨hp, hq⟩`, która jest dowodem zdania `p
∧ q`.

**Polecenie**: Starając się możliwie rzadko zaglądać do tego rozdziału, a może nawet w ogóle do
niego nie zaglądając, udowodnij twierdzenie `t1` w trybie interaktywnym i pisząc kod wprost. Zrób to
raz stosując funkcję `And.intro`, a raz zapisując wprost parę uporządkowną dowodów za pomocą symboli
`⟨` i `⟩`. Pamiętaj, że między elementami pary zapisanej w ten sposób musi być przecinek. Jeżeli na
początku to będzie się wydawać trudne, nie bój się eksperymentować i korzystaj z informacji
widocznych w trybie interaktywnym.

```lean
theorem t1 (p q : Prop) : p → (q → p ∧ q) :=
```

Teraz prześledzimy jak dokładnie działa dowód prostej implikacji, w której koniunkcja odgrywa rolę
*poprzednika*:

```lean
theorem t2 (p q : Prop) : p ∧ q → p :=
    fun (h : p ∧ q) => And.left h
```

Treścią tego twierdzenia jest zdanie o postaci implikacji, której poprzednikiem jest koniunkcja. Jak
wiesz, żeby udowodnić implikację trzeba stworzyć funkcję, która dowolny dowód poprzednika
przekształca w jakiś sposób w dowód następnika. Wobec tego w tym wypadku trzeba zrobić coś z dowodem
zdania `p ∧ q`, a ponieważ taki dowód to "tak naprawdę" nic innego jak para uporządkowana dowodów
zdań `p` i `q`, z której to pary należy w jakiś sposób zrobić dowód zdania `p`, to nie pozostaje nic
innego, jak wydobyć pierwszy element tej pary.

Można to zrobić na dwa sposoby. Pierwszy to dopisanie do termu oznaczającego dowód koniunkcji kropki
i stałej `left`, bez spacji, a drugi to zastosowanie do tego dowodu funkcji `And.left`. Te dwa
sposoby różnią się tylko zapisem. Jeżeli zastanawiasz się, czemu nie można zastosować tutaj stałej
`fst`, która powinna przecież działać dla każej pary uporządkowanej, to nie wiem, co Ci
odpowiedzieć, poza tym, że tak to akurat w Leanie działa.

**Polecenie**: Starając się jak najrzadziej zaglądać do tego rozdziału, udowodnij obydwa twierdzenia
w trybie interaktywnym i pisząc kod wprost. Jeżeli tylko masz ochotę zrobić to stosując obydwa
sposoby użycia funkcji `left` (a później `right`), to się nie krępuj. Dowód drugiego twierdzenia
różni się tylko tym, że trzeba wydobyć drugi element pary, a nie pierwszy, a więc należy zastosować
funkcję `And.right`, być może dopisując tylko słowo `right` po kropce.

```lean
theorem t2 (p q : Prop) : p ∧ q → p :=

theorem t2' (p q : Prop) : p ∧ q → q :=
```

Teraz już wiesz, jak możesz używać koniunkcji w dowodach. Żeby utrwalić te umiejętności i zacząć
sobie lepiej radzić z bardziej skomplikowanymi dowodami, proponuję udowodnić tyle spośród
rozpoczętych poniżej dowodów i w taki sposób, w jaki tylko masz ochotę.

```lean
-- Tutaj przyda się funkcja absurd.
theorem t3 (p q : Prop) : p ∧ ¬ p → q :=

-- Fakt, że pojawiają się tu predykaty, nie odgrywa prawie żadnej roli w tym dowodzie, poza tym,
-- że trzeba jakoś obsłużyć (później nieużywaną, a więc wyświetli się na szero) zmienną n.
theorem t4 (P Q : Nat → Prop) : ∀ n : Nat, P n → Q n → P n ∧ Q n :=

-- Niech żyje absurd i fałsz!
theorem t5 (P Q : Nat → Prop) : ∀ n : Nat, ¬ P n ∧ P n → Q n :=

-- Nie ma powodów do paniki. ∀ n : Nat, P n to tutaj tylko jakieś zdanie, którego struktura nie odgrywa
-- żadnej roli w tym dowodzie.
theorem t6 (P : Nat → Prop) (q : Prop) : q ∧ ¬ q → ∀ n : Nat, P n :=
```
