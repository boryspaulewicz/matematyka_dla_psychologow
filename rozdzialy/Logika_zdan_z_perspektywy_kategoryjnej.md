Na pewien czas oddaliliśmy się od zdań, spójników logicznych i dowodów. Teraz wrócimy do tego
znanego Ci już kontekstu i popatrzymy na logikę inaczej.

Niech:

1. Punkty będą zdaniami.

2. Dla każdego punktu `p` i `q`, strzałka z punktu `p` do punktu `q` oznacza dowód implikacji `p -> q`.

3. Dla każdego punktu `p`, pętla identycznościowa oznacza dowód tautologii `p -> p`.

4. Składanie strzałek będzie składniem dowodów.

Możemy łatwo udowodnić, że w ten sposób uzyskujemy kategorię zdań i dowodów:

```lean
-- Ta definicja różni się od poprzedniej tylko tym, że zamiast typu Type występuje tutaj typ Prop.
def ID (p : Prop) : p → p := fun (hp : p) => hp

-- Poza tym, że skróciłem nazwę stałej i zamiast Zlozenie jest tutaj Z, to jedyna różnica między
-- tą definicją a wcześniej skonstruowaną definicją złożenia jest taka, że zamiast typu Type mamy
-- tutaj typ Prop.
def Z {p q r : Prop} (f : p → q) (g: q → r) : (p → r) := 
  fun (hp : p) => g (f hp)

-- Dowody własności, których wymagamy od strzałek identycznościowych, też różnią się tylko typem,
-- ...
example (p q : Prop) (f : p → q) : Z f (ID q) = f := by rfl
example (p q : Prop) (f : p → q) : Z (ID p) f = f := by rfl

-- ... podobnie jak dowód łączności składania dowodów.
example (p q r s : Prop) (f : p → q) (g : q → r) (h : r → s) : 
  Z (Z f g) h = Z f (Z g h) := by rfl
```

Przy okazji możesz tutaj zobaczyć, że dowody anonimowe, które konstruujemy za pomocą słowa
kluczowego `example`, mogą mieć parametry tak samo jak twierdzenia. A więc `example` to tylko taki
alternatywny sposób konstruowania funkcji anonimowej. Możemy stosować to słowo kluczowe do
konstruowania dowolnych funkcji anonimowych ...

```lean
example (n m : Nat) : Nat := n + m
```

... ale to *nie* jest funkcja anonimowa, bo nie da się ani sprawdzić typu tego wyrażenia, ani go
aplikować. Takie konstrukcje służą więc tylko do sprawdzania, czy jakaś funkcja anonimowa, która
może, ale nie musi być dowodem jakiegoś zdania, jest poprawnie skontruowana.

Dla każdego zdania `p`, dowód tautologii `p -> p` jest elementem neutralnym ze względu na operację
składania dowodów, bo jest funkcją identycznościową przekształcającą każdy dowód swojego zdania w
niego samego. A ponieważ dowody są dla nas funkcjami jak każde inne, z tą tylko różnicą, że mają typ
będący termem typu `Prop`, to składanie dowodów, co właśnie udowodniliśmy, jest łączne. Skoro
ustaliliśmy właśnie, że mamy do czynienia z kategorią, od tego momentu możemy o tych dowodach
zapomnieć.

W kategorii zbiorów i funkcji występują strzałki, które są zarazem równoległe i różne. Na przykład,
jeżeli `X` to jakiś singleton a `Y` to jakiś zbiór dwuelementowy, to istnieją dokładnie dwie funkcje
z `X` do `Y`, a więc w kategorii zbiorów istnieją dokładnie dwie strzałki równoległe z punktu
odpowiadającego zbiorowi `X` do punktu odpowiadającego zbiorowi `Y`.

W kategorii punktów jako zdań i strzałek jako dowodów, której się teraz przyglądamy, istnieje
strzałka z punktu `p` do punktu `q` wtedy i tylko wtedy, gdy zakładając `p` można udowodnić `q`. W
tej kategorii nie ma nigdy dwóch różnych strzałek równoległych, bo zgodnie z zasadą proof
irrelevance wszystkie dowody są traktowane jako równe:

```lean
theorem t1 (p : Prop) : p → p := fun (hp : p) => hp

-- Dowód tego twierdzenia jest niepotrzebnie skomplikowany tylko po to, żeby miał inną
-- strukturę niż dowód twierdzenia t1. Zamiast po prostu zwrócić wartość parametru, tworzymy
-- tutaj aplikację identycznościowej funkcji anonimowej (z Prop do Prop) do wartości parametru hp.
theorem t2 (p : Prop) : p → p := fun (hp : p) => (fun hp' : p => hp') hp

-- Te dwa dowody są z definicji (czyli aksjomatycznie, czyli bo tak) równe, czyli są tym samym termem,
-- czyli są wzajemnie zastępowalne:
example : t1 = t2 := by rfl
```

Mamy tu zatem kategorię, w której dla każdej pary punktów `p` i `q`, istnieje *co najwyżej jedna*
strzałka z `p` do `q`. Tego rodzaju kategorie opisują *relacje binarne*, bo między dwoma elementami
jakaś relacja albo zachodzi, albo nie; z powodu tego, jak relacje są rozumiane w matematyce,
stwierdzenie, że jakaś relacja zachodzi między dwoma elementami na więcej niż jeden sposób po prostu
nie ma sensu. W przypadku kategorii, którą teraz badamy, strzałki nie oznaczają więc dowodów, tylko
*relację dowiedlności*.

Zanim przejdziemy dalej, przypomnę Ci niektóre wprowadzone już wcześniej definicje kategoryjne.

