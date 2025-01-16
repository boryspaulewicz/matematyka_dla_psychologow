Na pewien czas oddaliliśmy się od zdań, spójników logicznych i dowodów. Teraz wrócimy do tego
znanego Ci już kontekstu i popatrzymy na logikę inaczej.

Niech:

1. Punkty będą zdaniami.

2. Dla każdego punktu `P` i `Q`, strzałka z punktu `P` do punktu `Q` oznacza dowód implikacji `P → Q`.

3. Dla każdego punktu `P`, pętla identycznościowa oznacza dowód tautologii `P → P`.

4. Składanie strzałek będzie składniem dowodów.

Możemy łatwo udowodnić, że w ten sposób uzyskujemy kategorię zdań i dowodów:

```lean
-- Ta definicja różni się od poprzedniej tylko tym, że zamiast typu Type występuje tutaj typ Prop.
def ID (P : Prop) : P → P := fun (hp : P) => hp

-- Poza tym, że skróciłem nazwę stałej i zamiast Zlozenie jest tutaj Z, to jedyna różnica między
-- tą definicją a wcześniej skonstruowaną definicją złożenia jest taka, że zamiast typu Type mamy
-- tutaj typ Prop.
def Z {P Q R : Prop} (f : P → Q) (g: Q → R) : (P → R) := 
  fun (hp : P) => g (f hp)

-- Dowody własności, których wymagamy od strzałek identycznościowych, też różnią się tylko typem,
-- ...
example (P Q : Prop) (f : P → Q) : Z f (ID Q) = f := by rfl
example (P Q : Prop) (f : P → Q) : Z (ID P) f = f := by rfl

-- ... podobnie jak dowód łączności składania dowodów.
example (P Q R S : Prop) (f : P → Q) (g : Q → R) (h : R → S) : 
  -- (h ∘ g) ∘ f = h ∘ (g ∘ f)
  Z f (Z g h) = Z (Z f g) h := by rfl
```

Przy okazji widzimy, że dowody anonimowe, które konstruujemy za pomocą słowa kluczowego `example`,
mogą mieć parametry tak samo jak twierdzenia. A więc `example` to tylko niemalże alternatywny sposób
konstruowania funkcji anonimowej. Możemy stosować to słowo kluczowe do konstruowania dowolnych
prawie funkcji anonimowych ...

```lean
example (n m : Nat) : Nat := n + m
```

... ale to *nie* będą funkcje anonimowe, bo nie da się ani sprawdzić typu takich wyrażeń, ani ich
aplikować:

```lean
-- Tutaj pojawia się błąd ...
#eval (example (n m : Nat) : Nat := n + m) 2 2

-- ... i tutaj też pojawia się błąd:
#check (example (n m : Nat) : Nat := n + m) 2 2
```

Takie fragmenty kodu służą więc tylko do sprawdzania, czy jakaś funkcja, która może, ale nie musi
być dowodem jakiegoś zdania, może być w pewien sposób skonstruowana.

Dla każdego zdania `P`, dowód tautologii `P → P` jest elementem neutralnym ze względu na operację
składania dowodów, bo jest funkcją identycznościową przekształcającą każdy dowód swojego zdania w
niego samego. A ponieważ dowody są dla nas funkcjami jak każde inne, z tą tylko różnicą, że mają typ
będący termem typu `Prop`, to składanie dowodów, co właśnie udowodniliśmy, jest łączne. Skoro
ustaliliśmy właśnie, że mamy do czynienia z kategorią, od tego momentu możemy o tych dowodach
zapomnieć.

W kategorii zbiorów i funkcji występują strzałki, które są zarazem równoległe i różne. Na przykład,
jeżeli `X` to jakiś singleton a `Y` to jakiś zbiór dwuelementowy, to istnieją dokładnie dwie funkcje
z `X` do `Y`, a więc w kategorii `Set` istnieją dokładnie dwie strzałki równoległe z punktu
odpowiadającego zbiorowi `X` do punktu odpowiadającego zbiorowi `Y`. 

Czy widzisz, że ten ostrożny sposób mówienia staje się już trochę uciążliwy i zbędny? Zamiast ...

*W kategorii* `Set` *istnieją dokładnie dwie strzałki równoległe z punktu odpowiadającego zbiorowi*
`X` *do punktu odpowiadającego zbiorowi* `Y`.

... moglibyśmy powiedzieć krócej ...

*W kategorii zbiorów istnieją dokładnie dwie funkcje równoległe ze zbioru* `X` *do zbioru* `Y`.

... i wiedzielibyśmy, że chodzi tak naprawdę o punkty i strzałki, tylko w pewien sposób zdefiniowane
albo zinterpretowane (w tym wypadku jako zbiory i funkcje). Dlatego będę odtąd coraz częściej mówił
właśnie w ten sposób o różnych kategoriach.

W kategorii punktów jako zdań i strzałek jako dowodów, której się teraz przyglądamy, istnieje
strzałka z punktu `P` do punktu `Q` wtedy i tylko wtedy, gdy zakładając `P` można udowodnić `Q`. W
tej kategorii nie ma nigdy dwóch różnych strzałek równoległych, bo zgodnie z zasadą proof
irrelevance wszystkie dowody tego samego zdania są równe.

Mamy zatem kategorię, w której dla każdej pary punktów `P` i `Q`, istnieje *co najwyżej jedna*
strzałka z `P` do `Q`. Tego rodzaju kategorie opisują pewnego rodzaju *relacje binarne*, bo między
dwoma elementami jakaś relacja albo zachodzi, albo nie; z powodu tego, jak relacje są rozumiane w
matematyce, stwierdzenie, że jakaś relacja zachodzi między dwoma elementami na więcej niż jeden
sposób po prostu nie ma sensu. W przypadku kategorii, którą teraz badamy, strzałka nie oznacza więc
tak naprawdę konkretnego dowodu, tylko pewien *fakt*; w tym wypadku to jest zawsze fakt polegający
na zachodzeniu *relacji dowiedlności*. Ta kategoria ma więc wyraźnie inny charakter niż kategoria
zbiorów i funkcji.

Zanim przejdziemy dalej, przypomnę Ci niektóre wprowadzone już wcześniej definicje kategoryjne.

