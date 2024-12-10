# Funkcje i implikacje w Lean

`--` oznacza w Lean początek komentarza. Lean ignoruje komentarze.

Tak można zdefiniować funkcję dodającą dwie liczby naturalne i zwracającą ich sumę:

```lean
def suma (n : Nat) (m : Nat) : Nat := n + m
```

Intuicyjnie, nazwy parametrów nie mają znaczenia. To jest ta sama funkcja (inaczej nazwana, bo w
Lean definicje są ostateczne):

```lean
def suma' (Adam : Nat) (Ewa : Nat) : Nat := Adam + Ewa
```

Tak można stworzyć *anonimową* funkcję robiącą to samo (wpisanie *tylko* tego kodu do Lean'a sprawi,
że Lean się poskarży):

```lean
fun (n : Nat) (m : Nat) => n + m
```

To jest *ewaluacja aplikacji* funkcji `suma` do termów `10` i `20` (gdy kursor jest nad `#eval` to w
oknie po prawej widać wynik):

```lean
#eval suma 10 20
```

A to jest *ewaluacja aplikacji* anonimowej wersji tej samej funkcji, działająca w ten sam sposób jak
kod powyżej (pomijając konieczność rozpakowania definicji stałej `suma`):

```lean
#eval (fun (n : Nat) (m : Nat) => n + m) 10 20
```

**Currying**: Wszystkie funkcje w Lean są jednoargumentowe. Tak naprawdę `suma` to funkcja *jednej*
liczby naturalnej (`n`), zwracająca funkcję jednej liczby naturalnej (`m`), która zwraca liczbę
naturalną (rezultat ewaluacji `n + m`). Zatem `suma 1 2` to wyrażenie typu liczba naturalna, ale
`suma 1` to (wyrażenie typu) *funkcja*, w tym wypadku jest to funkcja dodająca `1` do swojego
jedynego argumentu (`#check @wyrażenie` pokazuje typ wyrażenia):

```lean
#check @suma -- suma : Nat → Nat → Nat

#check @suma 1 -- suma 1 : Nat → Nat

#check @suma 1 2 -- suma 1 1 : Nat

#eval (suma 1) 2 -- Currying sprawia, że to ma sens
```

Równie dobrze moglibyśmy zdefiniować tą funkcję tak (każda definiowana poniżej funkcja jest
jednoargumentowa):

```lean
def suma' (n : Nat) : Nat → Nat := fun (m : Nat) => n + m
```

Wyszłoby na to samo:

```lean
#eval suma' 10 20 -- 30

#check @suma' -- suma' : Nat → Nat → Nat

#check @suma' 1 -- suma' 1 : Nat → Nat

#check @suma' 1 2 -- suma' 1 1 : Nat
```

**Trochę o hierarchii typów**: Liczba `2` to term, który można by nazwać "elementarnym", albo
"konkretnym", bo nie może istnieć term, którego typem jest `2`. W Lean istnieją też termy innego
rodzaju (mówimy raczej *sortu*). Na przykład, `2` jest termem typu `Nat`, gdzie `Nat` jest typem i
jednocześnie termem (ogólniejszego albo wyższego) typu `Type`:

```lean
#check Nat -- Nat : Type
```

A więc w Lean każdy typ jest też termem (jakiegoś ogólniejszego albo wyższego typu), ale nie każdy
term jest typem. Na przykład (`Type 1` to typ rzędu wyższego o 1 niż rząd typu `Type`):

```lean
#check Type -- Type : Type 1
```

**Izomorfizm Curry'ego-Howarda**: Lean ma "wbudowany" typ `Prop`. Termy typu `Prop` można
konsekwentnie interpretować jako *zdania*. 

Odtąd będę często mówił "jest" zamiast "może być konsekwentnie interpretowane jako".

Jeżeli `p` jest termem typu `Prop`, to `p` jest zarazem zdaniem i *typem*, a *termy typu `p`* są
*dowodami zdania `p`*.

Na przykład, jeżeli `a` jest zdaniem, to `a → a` też jest zdaniem, a konkretnie implikacją *Jeżeli
`a`, to `a`*, i zarazem typem, którego termy są *jednocześnie funkcjami* typu `a → a` i *dowodami*
zdania-implikacji `a → a`.

Udowodnić zdanie `a → a` to to samo, co znaleźć term typu `a → a`, czyli znaleźć taki `x`, że `x : a
→ a`. Dzięki odpowiedniości między zdaniami i typami z jednej strony i dodowami i termami typów
zdaniowych z drugiej, dowodzenie zdań i pisanie programów można traktować jako jedno i to samo.

Z perspektywy izomorfizmu Curry'ego-Howarda i logiki konstruktywnej, oto są różne sposoby
powiedzenia tego samego: Dla każdego zdania `a`, zdanie `a → a` ma dowód, czyli istnieje term typu
`a → a`. Ten term jest (trywialną) funkcją, która pobiera dowód zdania `a` i go zwraca. Z dowodu
zdania `a` można zrobić dowód zdania `a`. Jeżeli mam dowód zdania `a`, to mam dowód zdania
`a`. Jeżeli `a` jest prawdziwe, to `a` jest prawdziwe. Jeżeli `a`, to `a`. Z perspektywy teorii
typów zależnych, izomorfizmu Curry'ego-Howarda, i logiki konstruktywnej, to jest wszystko to samo,
tylko inaczej interpretowane przez każdego z nas, to jest przez użytkownika lub obserwatora.

Oto nazwany (`t1`) dowód zdania (`a → a`), czyli twierdzenie:

```lean
theorem t1 (a : Prop) : a → a := fun (h : a) => h
```

Poza punktem widzenia i sposobem zapisu, nie ma różnicy między twierdzeniem `t1` a poniższą
funkcją. Dowodzenie jest programowaniem:

```lean
def f1 (a : Prop) : a → a := fun (h : a) => h
```

*Przyjąć coś aksjomatycznie* znaczy tyle, co *ogłosić*, że będzie się odtąd *mówiło jakby* to coś
istniało albo było zdaniem prawdziwym. Nikt nikogo nie zmusza do przyjęcia aksjomatu "na wiarę",
aksjomaty opisują *hipotetyczne* obiekty lub sytuacje.

Przyjmijmy aksjomatycznie, że `p` jest jakimś zdaniem (czytaj: będę odtąd mówił, jakby `p` było
zdaniem). Wtedy aplikacja twierdzenia `t1` lub funkcji `f1` do zdania `p` jest (złożonym) termem o
typie `p → p`, a ponieważ `p` jest zdaniem, to `p → p` jest zdaniem, a konkretnie implikacją, i
każda z tych aplikacji jest dowodem implikacji `p → p`. Dowodzenie jest programowaniem:

```lean
axiom p : Prop

#check t1 p -- t1 p : p → p 

#check f1 p -- f1 p : p → p 
```

**Naturalność formalizacji w języku teorii typów zależnych**: Matematyk mógłby *powiedzieć w języku
naturalnym*: 

> Dla każdych dwóch liczb naturalnych *n* i *m*, zachodzi przemienność dodawania, to jest *n + m =
> m + n*.

Rozumiemy wtedy, że możemy podstawić pod *n* dowolną konkretną liczbę naturalną, na przykład *2*,
lub dowolne wyrażenie, które oznacza liczbę naturalną, na przykład zmienną *a*, jeżeli tylko
wcześniej ogłosiliśmy, że to jest liczba naturalna. Musimy jednak *podstawiać konsekwentnie*,
zastępując każde *n* tym samym wyrażeniem. To samo dotyczy drugiego "parametru" tego tekstu - *m*.

Rozpoznajemy, że taka pół-formalna wypowiedź jest *funkcją dwóch zmiennych - n i m - o typie liczba
naturalna*. Możemy napisać to samo w języku Lean i możemy też to zdanie udowodnić i nazwać, tworząc
w ten sposób twierdzenie o przemienności dodawania (tutaj niemal "oszukujemy", bo korzystamy z
twierdzenia `Nat.add_comm` o tej samej treści, zdefiniowanego w biblitece Lean'a):

```lean
theorem przemiennosc_dodawania (n : Nat) (m : Nat) : n + m = n + m := Nat.add_comm n m
```

Widzimy, że formalizacja matematyki w języku teorii typów zależnych może być w przynajmniej jednym
przypadku naturalna i wiernie oddawać strukturę i sens pół-formalnego tekstu. Domyślamy się, że to
nie jest wyjątek.
