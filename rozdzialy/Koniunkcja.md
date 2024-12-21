# Koniunkcja zdań

Wszystko w tym rozdziale można zrozumieć opierając się tylko na wiedzy z wcześniejszych
rozdziałów. Jeżeli to jest na razie zbyt trudne, to oparte na różnych punktach widzenia, szczegółowe
wyjaśnienia znajdziesz w następnych dwóch rozdziałach.

```lean
-- Jeżeli p i q to jakieś zdania ...
variable (p q : Prop)

--- ... to p ∧ q jest zdaniem o treści p i q.
#check p ∧ q -- p ∧ q : Prop
```

Podobnie jak implikacja i negacja, koninunkcja jest *zdaniem złożonym*, bo powstaje przez
zastosowanie *spójnika logicznego*.

Dowodem zdania `p ∧ q` jest *uporządkowana para* dowodów złożona z dowodu zdania `p` i dowodu zdania
`q`, w tej kolejności. Dowód zdania `p ∧ q` (czyli term typu `p ∧ q`) można stworzyć *tylko w jeden
sposób* - aplikując funkcję `And.intro` do dowodu `p` i dowodu `q`:

```lean
-- Jeżeli mamy jakieś dowody zdań p i q ...
variable (hp : p) (hq : q)

--- ... to możemy stworzyć dowód zdania p ∧ q stosując funkcję And.intro:
#check And.intro hp hq -- ⟨hp, hq⟩ : p ∧ q
```

Jeżeli `T1` i `T2` to jakieś typy, to `T1 × T2` jest typem *para uporządkowana złożona z termu typu
`T1` i termu typu `T2`*, w tej kolejności.

```lean
-- Żeby uzyskać symbol × wpisz \x

-- Na przykład, tak zapisujemy typ: para uporządkowana złożona z termu typu Nat i termu typu Nat ...
#check Nat × Nat -- Nat × Nat : Type

-- ... a tak zapisujemy typ: para uporządkowana złożona z termu typu Nat i termu typu String.
#check Nat × String -- Nat × String : Type

-- Żeby uzyskać symbol ⟨ (⟩) wpisz \< (\>)

-- Tak możemy zdefiniować stałą będącą parą uporządkowaną złożoną z dwóch liczb naturalnych:
def moja_para_liczb : Nat × Nat := ⟨1, 2⟩

#check moja_para_liczb -- moja_para_liczb : Nat × Nat

-- Tak uzyskujemy dostęp do pierwszego elementu pary uporządkowanej (fst to skrót od first) ...
#eval moja_para_liczb.fst -- 1

-- ... a tak do drugiego (snd to skrót od second):
#eval moja_para_liczb.snd -- 2

def dodaje_do_siebie_elementy_pary_uporzadkowanej_liczb : Nat × Nat → Nat :=
    fun (para : Nat × Nat) => para.fst + para.snd

#eval dodaje_do_siebie_elementy_pary_uporzadkowanej_liczb moja_para_liczb -- 3
```

Ponieważ istnieje *tylko jeden* sposób skonstruowania dowodu koniunkcji (a ogólnie termu będącego
taką a nie inną parą uporządkowaną), gdy parametr ma typ taka a nie inna para uporządkowana możemy
przechwycić pierwszy i drugi element korzystając z *dopasowania wzorców*:

```lean
def dodaje_do_siebie_elementy_pary_uporzadkowanej_liczb' : Nat × Nat → Nat :=
    -- Ponieważ istnieje tylko jeden sposób skonstruowania termu typu Nat × Nat, argument może być "zdekonstruowany"
    fun (⟨pierwszy, drugi⟩) => pierwszy + drugi

#eval dodaje_do_siebie_elementy_pary_uporzadkowanej_liczb' moja_para_liczb -- 3
```

Matematyka to programowanie.

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

--- ... i tak, na jedno wychodzi (to, że hq jest na szaro nie oznacza błędu).
theorem t2fst'' (p q : Prop) : p ∧ q → p :=
    fun (⟨hp, hq⟩) => hp

theorem t2snd (p q : Prop) : p ∧ q → q :=
    fun (h : p ∧ q) => And.right h

theorem t2snd' (p q : Prop) : p ∧ q → q :=
    fun (h : p ∧ q) => h.right

theorem t2snd'' (p q : Prop) : p ∧ q → q :=
    fun (⟨hp, hq⟩) => hq
```

Ten kod wyraża dosłownie sens koniunkcji w logice konstruktywnej, nie kryje się za nim żadna głębsza
prawda. Jeżeli widzisz i rozumiesz wszystkie te regularności, to wiesz czym w tej logice jest
koniunkcja.
