## Obiekt wykładniczy

Jak już wiesz, currying polega na konstruowaniu funkcji wieloargumentowych za pomocą samych funkcji
jednoargumentowych. To rozwiązanie może sprawiać na początku pewne trudności, ale bardzo się
przydaje, ponieważ dzięki temu na poziomie ogólnej teorii możemy ograniczyć się do tylko jednego
typu funkcji, które odpowiadają temu, jak zwykle rozumie się funkcje w matematyce, a poza tym to,
jak currying działa w praktyce, daje nam elastyczność polegającą na tym, że częściowe aplikacje
funkcji wieloartumentowych są również funkcjami, co też się czasem przydaje.

Zauważyłaś już niejednokrotnie, że istnieje duże podobieństwo między typami i funkcjami
teoriotypowymi z jednej strony a zbiorami i funkcjami teoriomnogościowymi z drugiej. Istnieje
również teoriomnogościowy odpowiednik curryingu. Żeby objaśnić czym jest ten odpowiednik,
przypomnimy sobie najpierw dwuargumentową funkcję `suma`, ale nazwiemy ją mniej deskryptywnie i
zapiszemy jej definicję tak, żeby było widać currying:

```lean
def f : Nat → Nat → Nat := fun a => fun b => a + b
```

Proces ewaluacji "pełnej" aplikacji tej funkcji, takiej jak na przykład ta ...

```lean
#eval f 1 2
```

.. można opisać również w taki oto sposób: Funkcja `f` na podstawie wartości pierwszego parametru
(`a`) wybiera spośród wszystkich możliwych funkcji typu `Nat → Nat` taką funkcję `g`, że `g b = a +
b`.

Zamiast korzystać z curryingu, moglibyśmy zdefiniować tą funkcję jako zwykłą funkcję
jednoargumentową korzystając z tego, że Lean ma wbudowany typ par uporządkowanych:

```lean
def f' : Nat × Nat → Nat := fun ⟨a, b⟩ => a + b
```

O ile ograniczymy się do dwuargumentowej operacji dodawania, funkcje `f` i `f'` będą równie dobre i
wszystko, co będzie można zrobić za pomocą jednej z nich, będzie można zrobić za pomocą
drugiej. Jednak z funkcją `f` możemy zrobić pewne rzeczy, których nie da się równie wygodnie zrobić
z funkcją `f'`.

W kategorii `Set` mamy nie tylko, jako iloczyny kartezjańskie, teoriomnogościowe odpowiedniki typów
par uporządkowanych, ale mamy też konstrukcje, które odpowiadają curryingowi. Ponieważ elementami
zbiorów mogą być również *funkcje*, dla każdej pary zbiorów `A` i `B`, istnieje zbiór, oznaczany
zwykle jako `Bᴬ`, którego *elementami* są dokładnie wszystkie *funkcje* z `A` do `B`. Oznaczamy ten
zbiór w ten sposób co najmniej z dwóch powodów. Po pierwsze, umieszczając nazwę dziedziny
sugerujemy, że ta jest w pewnym sensie "pierwsza", a poza tym to się może kojarzyć, zgodnie z ogólną
postacią funkcji należących do takiego zbioru, ze "spływaniem" czegoś z góry na dół. Po drugie,
jeżeli oba zbiory są skończone to istnieje dokładnie `|B|^|A|` różnych funkcji o postaci `f : A →
B`, gdzie `^` oznacza operację [*potęgowania*](https://pl.wikipedia.org/wiki/Pot%C4%99gowanie), bo
Unikod nie pozwala zapisywać takich fragmentów tekstu jak `|A|` jako indeksów górnych.
