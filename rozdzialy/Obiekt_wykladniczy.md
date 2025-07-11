## Obiekt wykładniczy

Jak wiesz, currying polega na konstruowaniu funkcji działających jak funkcje wieloargumentowe za
pomocą samych funkcji jednoargumentowych. To rozwiązanie może byc na początku trudne do zrozumienia,
ale ma też niewątpliwe zalety. Dzięki curryingowi na poziomie ogólnej teorii możemy ograniczyć się
do jednego rozumienia pojęcia funkcji, które odpowiada temu, jak zwykle rozumie się funkcje w
matematyce i uzyskujemy też funkcjonalność funkcji (hm) polegającą na tym, że częściowe aplikacje
funkcji (praktycznie) wieloargumentowych, takie jak `suma 2`, są również funkcjami, co też się
czasem przydaje.

Zauważyłaś już niejednokrotnie, że istnieje głębokie podobieństwo między typami i funkcjami
teoriotypowymi, czyli typami danych i programami zapisanymi w języku teorii typów z jednej strony, a
zbiorami i funkcjami teoriomnogościowymi z drugiej. To podobieństwo jest tak duże, że czasem łatwo o
nim zapomnieć i zresztą czasem warto o nim zapomnieć.

Kiedy definiujemy funkcję w Leanie, *tworzymy nowy, zewnętrzny mechanizm*, który działa tak, że
*fizyczne* podanie określonego rodzaju wartości na wejściu powoduje, jako *fizyczny skutek*
ewaluacji aplikacji, pojawienie się określonych wartości na wyjściu. Dokładnie tym jest przecież
*programowanie komputera*. Ponieważ komputery są najbardziej uniwersalnymi fizycznymi narzędziami
jakimi dysponujemy, ponieważ możemy je kontrolować za pomocą najbardziej uniwersalnego interfejsu,
jaki znamy, to jest za pomocą języka i dzięki temu możemy *stwarzać nowe mechanizmy* tylko
*opisując* sposób, w jaki mają działać, bez żadnej przesady można powiedzieć, że programowanie
komputerów jest najbliższym fizycznym albo przyczynowym odpowiednikiem czarowania poprzez rzucanie
zaklęć.

Z drugiej strony, kiedy definiujemy funkcję *teoriomnogościową*, robimy coś podobnego, ale jednak
innego. *Składamy* wtedy *społeczną deklarację* - nawet jeśli to jest tylko *deklaracja wobec
siebie* - dotyczącą tego, co *my* będziemy mogli *stwierdzić* na temat tej funkcji *sami* o niej
*konsekwentnie pisząc lub mówiąc*. Starając się robić to konsekwentnie oczywiście tylko
*przybliżamy* sposób, w jaki mógłby to zrobić *hipotetyczny idealny komputer*, bo jesteśmy
zwierzętami. A komputery stworzyliśmy *na obraz i podobieństwo siebie* w taki sposób, żeby były od
nas pod pewnymi względami (znacznie) lepsze i pod pewnymi względami takie są, na przykład jako
narzędzia formalnej weryfikacji poprawności definicji i dowodów matematycznych biją nawet
najlepszych matematyków na głowę. Uprawiając matematykę za pomocą siebie samych uprawiamy ją w
tradycyjny sposób, to jest *do pewnego stopnia programując przyszłe wersje siebie* i być może
zapisując coś na temat tego się-programowania, żeby *ktoś inny* mógł zaprogramować się wystarczająco
skutecznie w *analogiczny funkcjonalnie* (ale w innym rozumieniu słowa "funkcja") sposób i dzięki
temu dojść do tych samych wniosków.

Ale miało być o curryingu. Pokażę Ci teraz prawie to samo, ale na dwa różne sposoby, więc jeżeli
pierwszy sposób wyda Ci się na początku zbyt skomplikowany, to może dobrym pomysłem będzie zapoznać
się z nim tylko pobieżnie i skupić się raczej na drugim.

Jeżeli zdefiniujemy funkcję dodającą dwie liczby naturalne i nadamy jej generyczną nazwę `f`, żeby
zasygnalizować, że to tylko *przykład* ilustrujący coś ogólniejszego ...

```lean
def f : Nat → (Nat → Nat) := fun a => (fun b => a + b)
```

... to proces ewaluacji "pełnej" aplikacji tej funkcji, takiej jak na przykład ta ...

```lean
#eval f 1 2
```

... będzie jak wiesz polegał na przekształceniu termu `f 1 2` w *dwóch* podstawowych
krokach. Najpierw nastąpi ewaluacja termu `f 1`, polegająca na przekształceniu termu `1` w *funkcję*
dodającą `1` do swojego parametru. Natomiast term `2`, będący początkowo *drugim* argumentem, będzie
na tym etapie *zachowany bez zmian* i stanie się *pierwszym* argumentem *nowej* aplikacji. Ta nowa
aplikacja będzie aplikacją funkcji będącej rezultatem aplikacji `f 1` do zachowanego bez zmian termu
`2`. A więc drugi i ostatni krok ewaluacji będzie polegał na ewaluacji aplikacji do termu `2`
funkcji będącej rezultatem aplikacji `f 1`. 

Możemy to wszystko wyrazić w kodzie posługując się typem par uporządkowanych. Najpierw na nowo
zdefiniujemy stałą `f` jako funkcję *dwuargumentową*:

```lean
def f : Nat × Nat → Nat := fun (par : Nat × Nat) => par.fst + par.snd
```

Wyrazimy teraz w kodzie zarówno currying rozumiany jako przekształcenie funkcji dwuargumentowej w
funkcję jednoaragumentową jak i ewaluację curringowanej w ten sposób funkcji dwuargumentowej, ale
zrobimy to tak, żeby można było niemal dokładnie to samo zapisać w języku teorii mnogości. Dlatego
będziemy się nadal posługiwać typami par uporządkowanych, bo te odpowiadają iloczynom kartezjańskim
zbiorów, z których zawsze możemy korzystać w kategorii `Set`.

```lean
-- To jest curryingowana wersja oryginalnej funkcji dwuargumentowej. Zwróć uwagę, że traktujemy tutaj
-- funkcję f jak by była *jakąś* dwuargumentową operacją na liczbach naturalnych. Λf jest funkcją,
-- która z jednego argumentu a, który odpowiada pierwszemu argumentowi funkcji f, robi anonimową
-- funkcję "a-stosującą" f do swojego jedynego argumentu (tutaj b).
def Λf (a : Nat) : (Nat → Nat) := fun b : Nat => f ⟨a, b⟩

-- Ta identyczność przyda nam się z powodów, o których powiem później.
def ID (n : Nat) : Nat := n

-- To jest funkcja, która *równolegle* stosuje do elementów pary uporządkowanej funkcje Λf i ID i
-- zwraca parę uporządkowaną złożoną z rezultatu aplikacji Λf do pierwszego elementu i rezultatu
-- aplikacji ID do drugiego elementu. Wynikiem jest więc para uporządkowana złożona z funkcji typu
-- Nat → Nat i z termu typu Nat. Zwracam uwagę, że Λf par.fst jest tutaj częściową aplikacją.
def Λf_x_ID (par : Nat × Nat) : (Nat → Nat) × Nat := ⟨Λf par.fst, ID par.snd⟩

-- A ta funkcja stosuje pierwszy element pary będącej jej argumentem, czyli funkcję z Nat do Nat,
-- do drugiego elementu pary, będącego termem typu Nat.
def apply (par : (Nat → Nat) × Nat) : Nat := par.fst par.snd

#eval apply (Λf_x_ID ⟨1, 2⟩) -- 3

-- Ta ostatnia ewaulacja przebiega następująco (kolejność rozwijania definicji i ewaluacji wyrażeń
-- składowych nie ma znaczenia dla wyniku końcowego):
--
-- Rozwinięcie definicji Λf_x_ID:
apply ((fun (par : Nat × Nat) => ⟨Λf par.fst, ID par.snd⟩) ⟨1, 2⟩)

-- Aplikacja anonimowej funkcji do pary uporządkowanej:
apply ⟨Λf 1, ID 2⟩

-- Rozwinięcie definicji Λf:
apply ⟨(fun (a : Nat) => fun b : Nat => f ⟨a, b⟩) 1, ID 2⟩

-- Aplikacja funkcji anonimowej i (bez rozpisywania) funkcji ID:
apply ⟨fun b : Nat => f ⟨1, b⟩, 2⟩

-- Rozwinięcie definicji apply:
(fun (par : (Nat → Nat) × Nat) => par.fst par.snd) ⟨fun b : Nat => f ⟨1, b⟩, 2⟩

-- Ewaluacja aplikacji:
(fun b : Nat => f ⟨1, b⟩) 2

-- Ewaluacja aplikacji:
f ⟨1, 2⟩
```

Currying rozumiany jako przekształcenie tej funkcji w robiącą to samo wersję jednoargumentową
będziemy mogli wtedy wyrazić w kodzie tak:

```lean

```


Istnieje sposób, żeby wyrazić *istotę* curryingu takiego jak właśnie opisany w języku teorii
mnogości. W przypadku operacji dodawania liczb naturalnych, punktem wyjścia tego opisu będzie coś w
rodzaju (nieunikalnej, bo dodawanie można rozumieć rozmaicie) "istoty" dodawania liczb naturalnych,
którą to "istotę" można wyrazić jako spełniający określone warunki sposób przypisywania każdej parze
uporządkowanej liczb naturalnych pewnej liczby naturalnej (będącej ich suma - to są te
warunki). Możemy więc zapisać operację dodawania liczb naturalnych jako pewną funkcję
*dwuargumentową* `f` przekształcającą elementy zbioru `\N \x \N`, czyli elementy będące parami
uporządkowanymi liczb naturalnych, w elementy zbioru `\N`.

Żeby mówić o curryingu w języku teorii mnogości musimy skorzystać z teoriomnogościowego odpowiednika
*przetwarzania równoległego*. Wyrazimy jednak tą ideę od razu w języku torii kategorii. Jeżeli
istnieją produkty `A₁ × A₂` i `B₁ × B₂`, to każdej parze strzałek `f : A₁ → B₁` i `g : A₂ → B₂`
odowiada strzałka `⟨f π₁, g π₂⟩ : A₁ × A₂ → B₁ × B₂`. W końcu złożenia `f π₁` i `g π₂` to tutaj para
współźródłowych strzałek z punktu `A₁ × A₂` do punktów `B₁` i `B₂` odpowiednio, a więc z definicji
produktu wynika, że istnieje unikalna strzałka `⟨f π₁, g π₂⟩`, która składa się projekcjami do tych
dwóch strzałek.

Czym są tego rodzaju strzałki w kategorii `Set`? Dla każdego *kategoryjnego* elementu `a : T → A₁ ×
A₂`, gdzie `T` to dowolny obiekt końcowy, czyli w przypadku kategorii `Set` jakiś singleton:

```lean
⟨f π₁, g π₂⟩ a = ⟨f π₁, g π₂⟩ (a₁, a₂) = (f a₁, g a₂)
```

Widzimy, że zdefiniowane w ten sposób strzałki z jednego produktu do drugiego produktu są
kategoryjnym uogólnieniem teoriomnogościowego przetwarzania równoległego. Na przykład, jeżeli `A₁ =
A₂ = B₁ = B₂ = ℕ`, `f(n) = n + 1` i `g(n) = n - 1`, to na przykład `⟨f π₁, g π₂⟩ (1, 1) = (f(1),
g(1)) = (2, 0)`. Ponieważ takie funkcje są ściśle związane z pojęciem produktu, oznaczamy je zwykle
jako `f × g`, chociaż może na przykład sugerujący równoległość zapis `f || g` byłby bardziej
intuicyjny. A więc w języku teorii kategorii przyjmujemy również i taką definicję: `f × g := ⟨f π₁,
g π₂⟩`, którą oczywiście możemy stosować zawsze wtedy i tylko wtedy, gdy istnieją produkty źródeł i
produkty celów strzałek `f` i `g`. 

Nazewnictwo może być tutaj niestety mylące, bo strzałkę `⟨f, g⟩` nazywamy *produktem morfizmów* `f`
i `g`, natomiast strzałkę `f × g` nazywamy *produktem kartezjańskim morfizmów* `f` i `g`. Przykro
mi, ale tak "się" mówi. Gdyby to ode mnie zależało, strzałkę o postaci `⟨f, g⟩` nazywalibyśmy czasem
może "sparowaniem" strzałek `f` i `g`, a strzałkę zapisywaną jako `f || g` nazywalibyśmy czasem może
"paralelizacją" strzałek `f` i `g`. Tak czy inaczej, jeżeli jeszcze tego nie zrobiłaś, uważam, że
powinnaś chociaż spróbować narysować diagram odpowiadający produktowi kartezjańskiemu strzałek. To
będzie prostokąt, którego górnym bokiem będzie projekcyjne "rozwidlenie" produktu `A₁ × A₂`, dolnym
bokiem będzie analogiczne "rozwidlenie" produktu `B₁ × B₂`, lewym i prawym bokiem będą strzałki `f`
i `g` odpowiedno, a przez środek będzie przebiegała odpowiednio oznaczona unikalna strzałka
uprzemienniająca (tak też się czasem mówi) ten diagram.

Żeby znaleźć kategoryjne uogólnienie curryingu musimy jeszcze tylko wprowadzić pojęcie [*przestrzeni
funkcyjnej*](https://pl.wikipedia.org/wiki/Przestrze%C5%84_funkcyjna). Jeżeli `X` i `Y` to zbiory,
to przestrzenią funkcyjną, $Y^X$, którą w Unikodzie możemy zapisać jako `Y^X` (czytaj `Y` do potęgi
`X`) jest zbiór wszystkich funkcji ze zbioru `X` do zbioru `Y`. Istnieje dobry powód, dla którego
zapisujemy ten zbiór w ten sposób. Jeżeli obydwa zbiory są skończone, to liczba elemntów takiej
przestrzeni funkcyjnej `|Y^X|` jest równa `|Y|^|X|`. Na przykład, jeżeli zbiór `Y` to singleton, to
dla każdego `X` istnieje tylko jedna funkcja z `X` do `Y`: `|Y^X| = |Y|^|X| = 1^|X| = 1`. Jeżeli
zbiór `Y` ma trzy elementy, a `X` jest singletonem, to `|Y^X| = |Y|^|X| = 3^1 = 3`. Gdyby jednak
zbiór `X` miał dwa elementy, to byłoby tyle funkcji z `X` do `Y`, na ile sposobów można niezależnie
wskazać dwa, niekoniecznie różne elementy trzyelementowego zbioru `Y`, czyli byłoby `3 \* 3` takich
funkcji i wtedy też `|Y^X| = |Y|^|X| = 3^2 = 3 \* 3`, i tak dalej.

Skoro dysponujemy już kategoryjnym pojęciem produktu kartezjańskiego strzałek, konstrukcją, która
odpowiada temu pojęciu w kategorii `Set` i teoriomnogościowym pojęciem przestrzeni funkcyjnej, mamy
wszystko, czego potrzebujemy, żeby znaleźć kategoryjne uogólnienie curryingu w teorii typów i dzięki
temu znaleźć jego odpowiednik na przykład teoriomnogościowy.

Zamiast korzystać z curryingu, moglibyśmy zdefiniować tą funkcję jako zwykłą funkcję
jednoargumentową korzystając z tego, że Lean ma wbudowany typ par uporządkowanych:

```lean
def f' : Nat × Nat → Nat := fun ⟨a, b⟩ => a + b
```

O ile ograniczymy się do dwuargumentowej operacji dodawania, funkcje `f` i `f'` będą równie dobre i
wszystko, co będzie można zrobić za pomocą jednej z nich, będzie można zrobić za pomocą
drugiej. Jednak z funkcją `f` możemy zrobić pewne rzeczy, których nie da się równie wygodnie zrobić
z funkcją `f'`. Wreszcie, możemy zdefiniować funkcję dodającą dwie liczby naturalne również w taki
sposób ...

```lean
-- ... używając do tego celu funkcji będącej implementacją w kodzie "uniwersalnego aplikatora" funkcji
-- typu Nat → Nat do argumentów typu Nat. Ta funkcja pobiera *jeden* argument, będący parą uporządkowaną,
-- złożoną z dowolnej funkcji typu Nat → Nat i dowolnego termu typu Nat i zwraca rezultat zastosowania tej
-- funkcji do tego argumentu.
def apply : (Nat → Nat) × Nat → Nat := fun ⟨f, a⟩ => f a

-- Jeżeli chcemy zdefiniować *możliwie najprościej* funkcję, która pobiera *uporządkowaną parę* liczb i dodaje
-- je do siebie używając do tego funkcji apply, nie mamy wyboru i musimy to zrobić tak:
def apply_f (par : Nat × Nat) : Nat := apply ⟨fun b => par.fst + b, par.snd⟩

#eval apply_f ⟨1, 2⟩ -- 3

-- Czy widzisz, że pierwszy element pary, do którego stosujemy funkcję apply, musi być dla tych samych argumentów
-- zwracać te same rezultaty, co funkcja będąca rezultatem aplikacji f par.fst, czyli musi być tą samą funkcją,
-- co funkcja "wewnętrzna" w ciele funkcji f, która powstałaby, gdybyśmy zastosowali f do pierwszego argumentu?
-- A to znaczy, że równie dobrze możemy zdefiniować funkcję apply_f również tak ...
def apply_f' (par : Nat × Nat) : Nat := apply ⟨f par.fst, par.snd⟩

#eval apply_f' ⟨1, 2⟩ -- 3

-- .. i możemy nawet zdefiniować "uniwersalniejszą" funkcję, która tworzy funkcje takie jak apply_f z
-- curryingowanych funkcji dwuargumentowych ...
def apply_fun (f : Nat → Nat → Nat) (par : Nat × Nat) : Nat := apply ⟨f par.fst, par.snd⟩

#eval apply_fun f ⟨1, 2⟩

-- ... albo z ich odpowiedników jednoargumentowych pobierających pary uporządkowane:
def apply_fun' (f : Nat × Nat → Nat) (par : Nat × Nat) : Nat := apply ⟨fun b => f ⟨par.fst, b⟩, par.snd⟩

#eval apply_fun' f' ⟨1, 2⟩ -- 3

-- Wreszcie, możemy uogólnić również tą ostatnią funkcję, żeby działała dla funkcji przekształcających
-- pary argumentów dowolnego typu w rezultaty dowolnego typu:
def apply_u {A R : Type} (par : (A → R) × A) : R := par.fst par.snd

def apply_ufun {A₁ A₂ R : Type} (f : A₁ × A₂ → R) (par : A₁ × A₂) : R := apply_u ⟨fun (a₂ : A₂) => f ⟨par.fst, a₂⟩, par.snd⟩
```

