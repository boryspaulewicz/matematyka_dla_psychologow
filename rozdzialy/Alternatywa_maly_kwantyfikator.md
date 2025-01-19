# ∨ ~ ∃
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
`False` i nie chodzi tylko o to, że pojawiają się tutaj *dwa* sposoby tworzenia termów definiowanego
typu. Ta akurat definicja jest *parametryczna* i *rekurencyjna*.

**Czytamy to**: Definiuję indukcyjnie (`inductive`) parametryczny typ danych `Or` typu `Prop` o
dwóch parametrach `a` i `b` typu `Prop` (`Or (a b : Prop)`) jako typ takich termów, że (`where`) te
termy powstają albo jako (`|`) *same, nieredukowalne aplikacje* o postaci `Or.inl (h a)` typu `Or a
b`, albo jako (`|`) aplikacje `Or.inr (h : b)` typu `Or a b`. 

Zapisując tą definicję jako definicję indukcyjną rozstrzygamy o tym, że *wszystkie takie* i *tylko
takie* termy są termami typu `Or a b` i termy, które powstają z dowodów *różnych* zdań lub są
aplikacją *różnych* konstruktorów (tutaj konstruktorami są `Or.inl` i `Or.inr`) są *różne*. Na tym
polega *indukcyjność* tej definicji. Definicje `True` i `False` są w takim samym znaczeniu
indukcyjne, ale te dwie definicje nie są parametryczne i `False` nie ma żadnego konstruktora, a
`True` ma tylko jeden.

Ta definicja jest również [*rekurencyjna*](https://en.wikipedia.org/wiki/Recursive_definition)
(inaczej *rekursywna*), bo jest przepisem tworzenia (pewnego rodzaju) *zdań ze zdań*:

*Jeżeli* `a` *i* `b` *to zdania, to* `Or a b` *jest zdaniem*.

Jednocześnie to jest też przepis na tworzenie *dowodów* (pewnego rodzaju) *zdań z dowodów zdań*:

*Jeżeli* `a` *i* `b` *to zdania, to jeżeli* `h` *jest dowodem* `a`, *to* `Or.inl h` *jest dowodem
zdania* `Or a b`.

*Jeżeli* `a` *i* `b` *to zdania, to jeżeli* `h` *jest dowodem* `b`, *to* `Or.inr h` *jest dowodem*
`Or a b`.

Mówiąc krótko, jeżeli `a` i `b` to zdania, to dowodem zdania `Or a b`, które zapisujemy zwykle jako
`a \or b`, jest albo oznaczony jako `Or.inl` dowód zdania `a`, albo oznaczony jako `Or.inr` dowód
zdania `b`. A więc jeżeli `a` i `b` to zdania, to `Or a b` jest trochę jak zbiór będący sumą
rozłączną zbiorów, którego elementami są dokładnie dowody `a` oznaczone tak, żeby nie mogły być
równe żadnemu dowodowi `b` i dowody `b` oznaczone tak, żeby nie mogły być równe żadnemu dowodowi
`a`. Widzimy więc, że alternatywa logiczna to szczególny przypadek koproduktu.


TODO Objaśnienie tej definicji. Napisać też coś o tym, że tu są parametry w konstruktorach i co z
tego wynika.

TODO O tym dlaczego mówimy czasem indukcyjny typ danych.
