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

Nie wszystkie relacje dają się w ten sposób reprezentować jako kategorie. Możemy tak zrobić z
relacją *mniejsze lub równe*, określoną na dowolnym zbiorze `X` zawierającym jakieś liczby. Wtedy
każda liczba może być osobnym punktem i dla każdych dwóch, niekoniecznie różnych liczb `x` i `y`
należących do `X` fakt `x ≤ y` może być reprezentowany przez strzałkę. Ponieważ taka relacja jest
*zwrotna* - `∀ x ∈ X, x ≤ x` - to mamy strzałki identycznościowe, a ponieważ taka relacja jest
*przechodnia* - `∀ x, y, z ∈ X, x ≤ y → y ≤ z → x ≤ z` - to dla każdej pary składalnych strzałek
istnieje ich złożenie. Pozostaje tylko ustalić, czy ...

1. `f Id = f = Id f`

2. `(h g) f = h (g f)`

... ale ponieważ *nie ma tutaj strzałek równoległych*, to składanie "nie ma żadnego wyboru", bo
zawsze istnieje dokładnie jedna strzałka kompatybilna (przypominam, że to jest mój prywatny
termin). Na przykład, jeżeli `f : X -> Y` i `Id : X -> X`, to złożenie `f Id` może być tylko
strzałką `f`, bo nie może istnieć inna strzałka z `X` do `Y`, a więc prawostronna neutralność
strzałki `Id` jest automatycznie spełniona i tak samo spełniona jest lewostronna neutralność każdej
endostrzałki. A gdy mamy jakieś strzałki `f : X -> Y`, `g : Y -> Z` i `h : Z -> V`, to nie ma
znaczenia, czy najpierw uzyskamy jako złożenie `h g` jedyną strzałkę z `Y` do `V` jaka istnieje, a
potem złożymy ją ze strzałką `f` uzyskując jedyną strzałkę z `X` do `V` jaka istnieje, czy najpierw
uzyskamy jako złożenie `g f` jedyną strzałkę z `X` do `Z` jaka istnieje, a potem dołożymy do niej
strzałkę `h` uzyskując jedyną strzałkę z `X` do `V` jaka istnieje, bo na końcu uzyskujemy ... jedyną
strzałkę z `X` do `V` jaka istnieje, a więc za każdym razem uzyskujemy tą samą strzałkę, a więc
łączność składania zachodzi automatycznie. 

**Rysunek 1**: Może domyślasz się już, jak narysować te wszystkie własności? W przypadku łączności
składania diagram jest co prawda bardziej złożony, ale sposób, w jaki dobrze jest go narysować w
zasadzie narzuca się sam. `Narysuj` w szeregu w odstępach o krok od siebie punkty `X`, `Y`, `Z` i
`V`. Dodaj strzałki `f`, `g` i `h`. `Narysuj` złożenia `h g` i `g f` jako strzałki wygięte w dół, a
na koniec dodaj strzałkę z `X` do `V` i oznacz ją jako `(h g) f = h (g f)`. 

Diagramatycznie każde złożenie jest przemiennym "trójkątem skierowanym", bo odpowiada jednej
konkretnej strzałce, która jest wynikiem składania jednej konkretnej pary składalnych strzałek. W
przypadku tego diagramu mamy dwa trójkąty - każdy z jednym kątem wewnętrznym 180 stopni i wygiętymi
bokami, ale i tak możemy je nazywać trójkątami - które na siebie zachodzą, dlatego naniesienie
ptaszków wyrażających przemienności wszystkich równoległych ścieżek w taki sposób, żeby było widać,
o które złożenia chodzi, może wymagać chwili namysłu, ale poza tym ten diagram nie różni się
specjalnie od tych, które rysowałaś wcześniej.

**Rysunek 2**: Diagram wyrażający neutralność strzałek identycznościowych wymaga innego
podejścia. Gdybyś narysowała strzałkę `f` z pętlami identyczności u źródła i u celu, to nie dałoby
się wyrazić na takim diagramie podwójnego równania `Id f = f = f Id` za pomocą ptaszków, bo nie
byłoby na nim ani żadnych trójkątów, ani żadnych innych obszarów otoczonych ścieżkami równoległymi,
w których takie ptaszki dałoby się zamknąć. Możemy jednak skorzystać z tego, że *punkty i strzałki
to jedno, a ich nazwy to co innego*, rysując diagram zawierający *kopie*.

`Narysuj (Punkt X)`, a potem `Narysuj (Punkt Y) (SE X)`. O krok pod pierwszą kopią `Punkt X` również
`Narysuj (Punkt X)` i połącz te dwie kopie skierowaną w dół strzałką o nazwie `Id`. Następnie
`Narysuj (Strzalka X Y)` i oznacz ją jako `f`. Dodaj jeszcze lustrzane odbicia tych dwóch strzałek,
traktując wyimaginowaną linię przebiegającą przez punkty `X` i `Y` prawie jak oś symetrii. Wiesz, o
co mi chodzi, prawda? Oznacz kopię punktu `Y`, kopię strzałki `f` i niebędącą kopią (chociaż
niekoniecznie oznaczającą inną identyczność!) strzałkę `Id : Y -> Y` odpowiednimi literami, a na
koniec oznacz ten diagram jako przemienny. W ten sposób można wyrazić *pojedyncze* równanie `Id f =
f Id`. Jeżeli chcesz, żeby na tym diagramie było widać też równania `Id f = f` i `f = f Id`, możesz
dodać kopię strzałki `f` przecinającą ten diagram na pół.

Znanym Ci doskonale przykładem relacji, której nie można w ten sposób opisać jako kategorii bez
różnych strzałek równoległych jest - zwykle oznaczana symbolem `<` - relacja *mniejsze niż* na
jakimś zbiorze liczb, ponieważ ta relacja nie jest zwrotna. Jest wręcz przeciwnie, bo jest
[*przeciwzwrotna*](https://pl.wikipedia.org/wiki/Relacja_zwrotna) (musiałem), to znaczy, *żadna*
liczba nie jest w tej relacji sama ze sobą (dokładnie to oznacza przeciwzrotność relacji), bo żadna
liczba nie jest mniejsza sama od siebie. A więc ta relacja nie dostarcza strzałek
identycznościowych.

Z drugiej strony, relacja *mniejsze niż* jest mimo wszystko przechodnia, bo przecież dla każdych
trzech liczb `m`, `n` i `o` zachodzi `m < n -> n < o -> m < o`, a więc gdybyśmy ją reprezentowali za
pomocą strzałek, wymaganie *istnienia* wyniku składania składalnych par strzałek byłoby spełnione, a
wymaganie łączności składania byłoby spełnione automatycznie dzięki temu, że dla każdej pary
składalnych strzałek istniałaby zawsze dokładnie jedna strzałka kompatybilna z tą parą. 

Moglibyśmy wtedy *dodać identyczności*, które *niczego by nie oznaczały* i *przyjąć konwencję*, że
te są elementami neutralnymi i też uzyskalibyśmy pewną kategorię. Możemy przecież stworzyć kategorię
jaką tylko chcemy, z czego tylko chcemy i według jakich tylko chcemy zasad, o ile tylko będzie
spełniała aksjomaty kategorii (jeżeli chcemy być konsekwentni). W końcu jesteśmy wolni i nigdzie nie
doświadczymy takiej wolności jak w sferze fantazji. Ostatecznie liczy się *tylko* to, czy uda nam
się z taką kategorią zrobić coś pouczającego, interesującego, albo nawet tylko zabawnego.

Gdyby było tak, że dla niektórych, ale nie wszystkich liczb zachodzi zwrotność, czyli gdyby istniała
co najmniej jedna liczba taka, że byłaby mniejsza od samej siebie, ale istniałaby też liczba, która
nie jest mniejsza od samej siebie, to byłby problem, bo wtedy niektóre nasze strzałki
identycznościowe odpowiadałyby liczbom, a niektóre nie odpowiadałyby niczemu i nie byłoby zgodności
między kategorią i opisywaną przez nią strukturą. No ale w przypadku relacji `<` *żadna* liczba nie
wchodzi ze sobą w tą relację, a więc taka "kategoryfikacja" nie wprowadzałaby zniekształceń, tylko
polegała na *zmianie konwencji opisywania tej samej struktury*. Wystarczyłoby wtedy pamiętać albo
zapisać, że pętle identyczności są "puste" i służą tylko jako konieczne uzupełnienia pozwalające
uzyskać kategorię.

Zanim przejdziemy dalej, przypomnę Ci niektóre wprowadzone wcześniej definicje kategoryjne, tylko
tym razem dwie z nich nazwę tak, jak przyjęło się je nazywać i jednocześnie dwie z nich wprowadzę z
innego punktu widzenia.

*Obiektem początkowym* w jakiejś kategorii nazywamy taki obiekt (czyli w naszej terminologii punkt)
`I` (od angielskiego *initial*), że dla każdego obiektu `X` istnieje dokładnie jedna strzałka `I ->
X`. 

Znanym Ci już przykładem obiektu początkowego jest zbiór pusty w kategorii `Set`, czyli w kategorii
zbiorów i funkcji, ponieważ istnieje dokładnie jedna funkcja ze zbioru pustego do każdego zbioru.

*Produktem* obiektów `X` i `Y` nazywamy taki obiekt `X x Y`, że istnieją strzałki `pi1 : X -> X` i
`pi2 : X -> Y` takie, że dla każdego obiektu `Z` i pary strzałek `f : Z -> X` i `g : Z -> Y`
istnieje unikalna strzałka `<f,g>` spełniająca warunek `pi1 <f,g> = f` i `pi2 <f,g> = g`. 

Oficjalnie nazywamy te strzałki raczej rzutami kanonicznymi, ale ja wolę nazywać je projekcjami. Jak
już wiesz, produkty w kategorii `Set` to ("pod spodem") dokładnie iloczyny kartezjańskie
zbiorów. Poza tym wiesz również, że produkt to tak naprawdę para współźródłowych strzałek,
spełniająca wymienione w definicji wymagania, ale często wygodniej jest mówić o produktach jako o
obiektach, czyli w naszej terminologii punktach.

## [Icśonlaud adasaz](https://pl.wikipedia.org/wiki/Zasada_dualno%C5%9Bci_w_teorii_kategorii)

