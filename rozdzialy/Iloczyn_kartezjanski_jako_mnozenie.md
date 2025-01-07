[Mocą zbioru](https://pl.wikipedia.org/wiki/Moc_zbioru) albo liczbą kardynalną zbioru nazywamy jego
"wielkość", która, *jeżeli ten zbiór jest skończony*, jest *liczbą jego elementów*. Moc zbioru `X`
zapisujemy zwykle jako `|X|`.

Ponieważ (właśnie po to) w tym rozdziale mówimy tylko o zbiorach skończonych, to `|| : FinSet →
ℕ`[^1], to znaczy, dla każdego zbioru `X`, moc `X` jest pewną własnością `X` (a więc `||` to pewna
*funkcja*, zdefiniowana na przestrzeni zbiorów skończonych) i jednocześnie liczbą naturalną.

Jest mam nadzieję dla Ciebie oczywiste, że `|∅| = 0`. Rozumiesz też chyba dlaczego, dla każdego `x`,
czymkolwiek nie byłby ten `x`, o ile tylko może być elementem jakiegoś zbioru (a więc nie może być
na przykład pogodą *jako taką*, tylko co najwyżej symbolem, jakąś strukturą danych, lub innym
obiektem matematycznym oznaczającym pogodę), `|{x}| = 1`. Zbiór `{x}` jest przecież
*jednoelementowy*.

W szczególności, `|{∅}| = 1`. Ten ostatni przykład jest trochę podchwytliwy, bo zbiór `{∅}` może się
*kojarzyć* ze zbiorem pustym, ale ten zbiór *nie* jest pusty - zawiera przecież co najmniej jeden
element, a dokładnie zawiera dokładnie jeden element i tym elementem jest ... zbiór pusty.

Wobec tego, jeżeli tylko `X : FinSet` i `Y : FinSet`, to `|X × Y| = |X| × |Y|`, a ponadto, dla
każdej `n ∈ ℕ` (liczby naturalnej `n`), istnieje (co najmniej jeden) `Z : FinSet` taki, że `|Z| =
n`. Czyli, *o ile* ograniczymy się do zbiorów *skończonych*, istnieje pewien rodzaj *ścisłej
odpowiedniości* (ale nie izomorfizm) między *zbiorami* i *iloczynem kartezjańskim zbiorów* z jednej
strony i *liczbami naturalnymi* i *operacją mnożenia* tych liczb z drugiej.

**Sugestia**: Spróbuj proszę zrobić sobie z tego fragmentu jakiekolwiek notatki. Być może później
nam się przydadzą.

### Przypisy

[^1]: Wprowadziłem tu symbol `FinSet` w nadziei, że od razu domyślisz się, o co mi chodzi. Ten
    symbol oznacza typ albo kategorię zbiorów skończonych, od angielskiego *Finite Set*.
