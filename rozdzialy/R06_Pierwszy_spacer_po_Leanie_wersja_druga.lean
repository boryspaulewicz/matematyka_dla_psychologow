-- `n` jest tutaj *parametrem*. Nie kopiuj tego kodu, jeżeli wprowadziłaś już definicję tej funkcji.
def nic_nie_robie (n : Nat) : Nat :=
    -- To jest *ciało* tej funkcji, tylko zapisane w następnej linijce. Mamy tu *zmienną* `n`,
    -- będącą jednocześnie *parametrem* tej funkcji:
    n

-- Tutaj `1` jest *argumentem* (aplikacji funkcji `nic_nie_robie`). To jest *tylko* aplikacja, bo
-- sprawdzając typ nie wymuszamy ewaluacji. Dlatego wszystkie obliczenia, które muszą zajść, żeby
-- *ustalić typ* tej aplikacji, rozgrywają się tylko *po stronie typu*:
#check nic_nie_robie 1

-- Gdy wymuszamy *ewaluację*, otrzymujemy *rezultat* tej aplikacji, czyli najprostszą postać termu,
-- (tak zwaną postać normalną), do której to wyrażenie da się zredukować:
#eval nic_nie_robie 1 -- 1

----------------------------------------------------------------------------------------------------

#check @nic_nie_robie  -- `nic_nie_robie : Nat → Nat`

-- Przed chwilą było `Nat → Nat`, a na skutek (zapisanej przez nas) aplikacji pojawia się już tylko
-- samo `Nat`. To też można traktować jako pewnego rodzaju obliczenie (które nie zaszłoby bez
-- naszego udziału).
#check nic_nie_robie 1 -- `nic_nie_robie 1 : Nat`

----------------------------------------------------------------------------------------------------

-- Ponieważ argumenty są w *postaci normalnej*, to jest maksymalnie zredukowanej (tutaj właściwie
-- udajemy, że są), w tym momencie następuje rozpakowanie definicji stałej `suma`:

#check (typ : Type) → (a : typ) → typ -- (typ : Type) → (a : typ) → typ : Type 1

def suma (n m : Nat) := n + m
#eval suma (Nat.succ 2) 3 -- 6
