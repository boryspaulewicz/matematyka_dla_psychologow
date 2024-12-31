To nie jest rozdział, tylko moje robocze notatki.

Tak *zrobimy* teorię mnogości.

```lean
-- Typ "nadzbioru"
def set := Type

variable {U : Type}

-- Lukier składniowy służący do oznaczania predykatów
def pred (S : set) := S → Prop

-- Zbiór potęgowy. Zbiory to zawsze *podzbiory* i jednocześnie predykaty.
def ps (U : set) := pred U

def is_element x (S : ps U) := S x
notation:65 lhs:65 " ∈ " rhs:66 => is_element lhs rhs

def is_subset (X Y : ps U) := ∀ u, u ∈ X → u ∈ Y
notation:67 lhs:67 " ⊆ " rhs:68 => is_subset lhs rhs

def is_equal (X Y : ps U) := X ⊆ Y ∧ Y ⊆ X
axiom eq_subst {X Y : ps U} (h : is_equal X Y) : X = Y

def set_union (X Y : ps U) := fun u => u ∈ X ∨ u ∈ Y
notation:68 lhs:68 " ∪ " rhs:69 => set_union lhs rhs

def set_intersection (X Y : ps U) := fun u => u ∈ X ∧ u ∈ Y
notation:68 lhs:68 " ∩ " rhs:69 => set_intersection lhs rhs

def set_difference (X Y : ps U) := fun u => u ∈ X ∧ ¬ u ∈ Y
notation:68 lhs:68 " \\ " rhs:69 => set_difference lhs rhs

def set_complement (X : ps U) := fun u => ¬ u ∈ X
postfix:max "^" => set_complement

def empty := fun _ : U => False 

def full := fun _ : U => True

section
  variable {S T : set} (F : S → T)
    section
      variable (V : ps S)
      def image : ps T := fun t : T => ∃ s : S, s ∈ V ∧ t = F s
    end
    section
      variable (W : ps T)
      def origin : ps S := fun s : S => F s ∈ W
    end
end

def EU (S : Type) (P : pred S) : Prop := (∃ x : S, P x) ∧ (∀ x y : S, P x → P y → x = y)

axiom ι {S : Type} (P : pred S) {h : EU S P} : S

-- Ograniczenie relacji do podzbioru: {u v : U | u ∈ V → v ∈ V → R u v}
def rel := U → U → Prop

-- Własności relacji
def refl (R : rel) := ∀ x : U, R x x
def trans (R : rel) := ∀ {x y z : U}, R x y → R y z → R x z
def symm (R : rel) := ∀ {x y : U}, R x y → R y x
def antisymm (R : rel) := ∀ {x y : U}, R x y → R y x → x = y
def equiv (R : @rel U) := refl R ∧ (trans R ∧ symm R)
def preorder (R : @rel U) := refl R ∧ trans R
def poset (R : @rel U) := preorder R ∧ antisymm R

def Least (R : rel) (u : U) := ∀ v, R u v

-- Klasa równoważności
def ecl (R : @rel U) (_ : equiv R) (c : U) := R c
-- notation:1024 "[" lhs:1024 "]" rhs:1024 => ecl rhs lhs

-- Podstawowe własności funkcji
def inj {S T : Type} (f : S → T) := ∀ x y : S, f x = f y → x = y
def sur {S T : Type} (f : S → T) := ∀ y : T, ∃ x : S, f x = y
def bij {S T : Type} (f : S → T) := inj f ∧ sur f

----------------------------------------------------------------------------------------------------
-- Twierdzenia i inne konstrukcje

-- Aby używać odwrotności funkcji musimy mieć w zasięgu dowód, że jest bijektywna
noncomputable 
def inv {S T : Type} (f : S → T) {h : bij f} (t : T) : S := 
  let h2 := h.left     
  let h3 := h.right
  let h1 : ∃ s : S, f s = t := by
    simp [sur] at h3
    let h5 := h3 t
    exact h5
  let h6 : ∀ x y : S, f x = t → f y = t → x = y := by
    simp [inj] at h2
    intro x y h7 h8
    let h9 := h7.trans (h8.symm)
    exact h2 x y h9
  let P := fun s => f s = t
  let u := ⟨h1, h6⟩
  @ι S P u

-- X = Y → is_equal X Y
theorem subst_eq (h : X = Y) : is_equal X Y := by
  let h1 : X ⊆ Y := fun x => fun h2 : x ∈ X => h.subst (motive := fun S => x ∈ S) h2
  let h2 : Y ⊆ X := fun y => fun h2 : y ∈ Y => (h.symm).subst (motive := fun S => y ∈ S) h2
  exact ⟨h1, h2⟩

theorem antisymm_least_u (R : rel) (hr : antisymm R) (x y : U) (hx : Least R x) (hy : Least R y) : x = y := by
  let h1 : R x y := hx y
  let h2 : R y x := hy x
  exact hr h1 h2
  -- simp [antisymm] at hr
  -- simp [Least] at hx hy
  -- apply hr
  -- exact hx y
  -- exact hy x

-- Dwie klasy równoważności mają element wspólny wtw są wymienialne
theorem ecl_subst_common_el (R : rel) (h : equiv R) (x y : U) : 
  ((ecl R h x) = (ecl R h y)) → ∃ u, u ∈ (ecl R h x) ∧ u ∈ (ecl R h y) :=
  fun h1 => 
    let h2 : (ecl R h y) = (ecl R h x) := h1.symm
    let h3 : y ∈ (ecl R h y) := h.left y
    let h4 : y ∈ (ecl R h x) := (subst_eq h2).left y h3
    ⟨y, ⟨h4, h3⟩⟩

theorem ecl_common_el_subst (R : rel) (h : equiv R) (x y : U) : 
  (∃ u, (u ∈ (ecl R h x)) ∧ (u ∈ (ecl R h y))) → ((ecl R h x) = (ecl R h y)) :=
  fun ⟨u, ⟨(hx : R x u), (hy : R y u)⟩⟩ =>
    let htrans : trans R := (h.right).left
    let hsymm : symm R := (h.right).right
    -- let h1 : R u x := hsymm hx
    let h2 : R u y := hsymm hy
    let h3 : R x y := htrans hx h2
    let h4 : R y x := hsymm h3
    let h5 : (ecl R h x) ⊆ (ecl R h y) :=
      fun v => fun (h6 : R x v) => show R y v from htrans h4 h6
    let h7 : (ecl R h y) ⊆ (ecl R h x) :=
      fun v => fun (h8 : R y v) => show R x v from htrans h3 h8
    eq_subst ⟨h5, h7⟩

theorem empty_in_every (V : ps U) : empty ⊆ V := fun _ => fun he => he.elim

theorem no_el_empty {X : ps U} : (∀ x, ¬ x ∈ X) → X = empty :=
  fun h =>
    let h1 : empty ⊆ X := empty_in_every X
    let h2 : X ⊆ empty := fun x => fun h2 : x ∈ X => h x h2
    eq_subst ⟨h2, h1⟩

----------------------------------------------------------------------------------------------------
-- Przykłady

example (V : ps U) : empty ⊆ V := fun _ => fun he => he.elim
example (V : ps U) : empty ⊆ V := by
  simp [is_subset]
  intro x h
  exact h.elim -- (h (x ∈ V))

-- ∀ V, V ⊆ full
example (V : ps U) : V ⊆ full := 
  fun u => fun _ : u ∈ V => by -- True nie działa
  simp [is_element, full]
example (V : ps U) : V ⊆ full := by
  intro x
  intro _
  simp [is_element, full]

example (V W : ps U) : V ⊆ W^ → V \ W = V :=
  fun h => 
    let h1 : V \ W ⊆ V := fun _ => fun h2 => h2.left
    let h2 : V ⊆ V \ W := fun u => fun h3 : u ∈ V => show u ∈ V \ W from
      ⟨h3, h u h3⟩
    eq_subst ⟨h1, h2⟩
example (V W : ps U) : V ⊆ W^ → V \ W = V := by
  rw [is_subset] at *
  simp [is_element,set_complement]
  intro h
  apply eq_subst
  simp [is_equal, is_subset, is_element, set_difference]
  apply And.intro
  intro u h1 _
  assumption
  --
  intro u h1
  apply And.intro
  exact h1
  exact h u h1

-- Dwie klasy równoważności, które mają wspólny element, są równe
example (R : rel) (h : equiv R) (a b c : U) (ha : c ∈ (ecl R h a)) (hb : c ∈ (ecl R h b)) : (ecl R h a) = (ecl R h b) := 
  let ha : R a c := ha
  let hb : R b c := hb
  let htrans : trans R := (h.right).left
  let hsymm : symm R := (h.right).right
  let hab : R a b := htrans ha (hsymm hb)
  let h1 : (ecl R h a) ⊆ (ecl R h b) := fun x => fun h : R a x => 
    show R b x from hsymm ((htrans ((hsymm h) : R x a) hab) : R x b)
  let h2 : (ecl R h b) ⊆ (ecl R h a) := fun x => fun h : R b x =>
    show R a x from hsymm ((htrans ((hsymm h) : R x b) (hsymm hab)) : R x a)
  eq_subst ⟨h1, h2⟩
example (R : rel) (h : equiv R) (a b c : U) (ha : c ∈ (ecl R h a)) (hb : c ∈ (ecl R h b)) : (ecl R h a) = (ecl R h b) := by
  apply eq_subst
  simp [is_equal, is_subset]
  apply And.intro
  case h.left =>
    intro x h1
    simp [is_element, ecl] at h1 ha hb
    simp [is_element, ecl]
    simp [equiv] at h
    let h2 := h.right
    exact h2.left (h2.left hb (h2.right ha)) h1
  case h.right =>
    simp [equiv] at h
    let h1 := h.right
    simp [is_element, ecl] at ha hb
    intro x
    simp [is_element, ecl]
    intro h2
    exact h1.left (h1.left ha (h1.right hb)) h2

----------------------------------------------------------------------------------------------------
-- Niektóre własności klas równoważności

-- Nie istnieją puste klasy równoważności
example (R : @rel U) (h : equiv R) : ∀ x, (ecl R h x) ≠ empty := 
  fun x => fun h1 : (ecl R h x) = empty =>
    let h2 : ∀ y, R x y → y ∈ empty := (subst_eq h1).left
    ((h2 x (h.left x)) : x ∈ empty)
example (R : @rel U) (h : equiv R) : ∀ x, (ecl R h x) ≠ empty := by
  simp [equiv] at h
  intro x h1
  let h2 := h.left (x := x)
  simp [ecl] at h1
  let h3 := subst_eq h1
  simp [is_equal] at h3
  let h4 := h3.left
  simp [is_subset] at h4
  let h5 := h4 x h2
  exact h5

-- Dwie klasy równoważności są albo równe, albo rozłączne
example (R : rel) (h : equiv R) (x y : U) : (ecl R h x) = (ecl R h y) ∨ (ecl R h x) ∩ (ecl R h y) = empty := 
  let hxa := Classical.em (x ∈ (ecl R h y))
  let h1 := fun h2 : x ∈ (ecl R h y) => show (ecl R h x) = (ecl R h y) from 
    (ecl_common_el_subst R h y x ⟨x, ⟨h2, h.left x⟩⟩).symm
  let h3 := fun h1 : ¬ (x ∈ (ecl R h y)) => show ∀ u, ¬ u ∈ (ecl R h x) ∩ (ecl R h y) from
    fun _ => fun ⟨hx, hy⟩ => 
      let h4 : R y x := (h.right).left hy ((h.right).right hx)
      show False from h1 h4
  hxa.elim 
    (fun xiny => Or.inl (h1 xiny)) 
    (fun xniny => Or.inr (no_el_empty (h3 xniny)))

example (R : rel) (h : equiv R) (x y : U) : (ecl R h x) = (ecl R h y) ∨ (ecl R h x) ∩ (ecl R h y) = empty := 
  by
  let h1 := Classical.em (x ∈ (ecl R h y))
  simp [equiv] at h
  cases h1 with
  |inl h2 =>
    simp [is_element, ecl] at h2
    apply Or.inl
    apply eq_subst
    simp [is_equal, ecl, is_subset]
    apply And.intro
    intro x2
    simp [is_element]
    intro h3
    exact (h.right).left h2 h3
    --
    intro x2
    simp [is_element]
    intro h3
    exact (h.right).left ((h.right).right h2) h3
  |inr hr =>
    apply Or.inr
    simp [ecl]
    simp [is_element, ecl] at hr
    apply eq_subst
    simp [is_equal, is_subset, is_element, set_intersection]
    apply And.intro
    intro x2 h2 h3
    let h5 := (h.right).left h3 ((h.right).right h2)
    exact hr h5
    --
    intro x2 h2
    exact h2.elim
   
-- ∀ y ∃ x, y ∈ [x]
example (R : rel) (h : equiv R) (y : U) : ∃ x : U, y ∈ (ecl R h x) := ⟨y, h.left y⟩
example (R : rel) (h : equiv R) (y : U) : ∃ x : U, y ∈ (ecl R h x) := by
  let h1 : y ∈ (ecl R h y) := by
    rw [is_element, ecl, equiv] at *
    exact h.left y
  exact ⟨y, h1⟩
  
----------------------------------------------------------------------------------------------------
-- Funkcje

-- Można je zdefiniować na podzbiorach, ale wygodniej jest korzystać z wbudowanych typów funkcyjnych.

-- Unikalność wartości funkcji dla danego argumentu jest wbudowana w język
example (S T : set) (f : S → T) (x : S) (y z : T) : f x = y → f x = z → y = z := by
  intro h1 h2
  let h3 := h1.symm
  exact h3.trans h2

-- V ⊆ origin F (image F V)
example (S T : set) (F : S → T) (V : ps S) : V ⊆ origin F (image F V) := by
  simp [is_subset, is_element, origin, image]
  rw [ps, pred] at *
  intro u h
  exact ⟨u, ⟨h, Eq.refl (F u)⟩⟩

----------------------------------------------------------------------------------------------------
-- Aksjomaty Peano

axiom nat : Type
axiom O : nat
axiom s : nat → nat
axiom nat1 : ∀ x : nat, s x ≠ O
axiom nat2 : ∀ x y : nat, s x = s y → x = y
axiom nat3 : ∀ P : nat → Prop, P O → (∀ x : nat, P x → P (s x)) → ∀ x : nat, P x

-- Nie ma "zdziczałych" termów zamieszkujących typ nat w tym znaczeniu, że każda liczba naturalna to 
-- albo O, albo następnik jakiejś liczby naturalnej:
theorem no_rogue_nats  : ∀ n : nat, (n = O) ∨ (∃ m, n = s m) :=
  let P := (fun n : nat => (n = O) ∨ (∃ m, n = s m))
  let h1 : P O := Or.inl (Eq.refl O)
  let h2 := fun n : nat => fun _ : P n => -- Exceptionally, we do not use the premise here
    let h3 : s n = s n := Eq.refl (s n)
    Or.inr ⟨n, h3⟩
  nat3 P h1 h2
```
