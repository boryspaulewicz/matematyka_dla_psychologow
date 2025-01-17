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

## Wolne konstrukcje

Popatrzmy sobie teraz na *najprostszą możliwą* abstrakcyjną (czyli nie rozważamy żadnej jej
interpretacji) kategorię zawierającą strzałkę `f : X -> Y`. Jeżeli to ma być kategoria, punkty `X` i
`Y` *muszą* mieć swoje *unikalne i charakterystyczne* endostrzałki identycznościowe. A więc musimy
*sami dodać* te strzałki. Te trzy strzałki to jedno, a operacja składania to co innego. Musimy więc
jeszcze *sami zdefiniować* tą operację w taki sposób, żeby aksjomaty kategorii były spełnione. W tym
wypadku aksjomaty kategorii *nie pozostawiają nam wyboru* i musi być tak, że `Id f = f = f Id`, ale
poza tym nie ma tu żadnych innych możliwych złożeń. Tak oto uzyskujemy *jedyną możliwą najprostszą*
kategorię *"wyrastającą naturalnie" z samej strzałki* `f`.

Dodaliśmy to, co było konieczne, żeby uzyskać kategorię i tylko to, co było konieczne, a więc to
jest najprostsza albo najmniejsza tego rodzaju kategoria, chociaż to, że jest najprostsza albo
najmniejsza możemy (na razie) powiedzieć tylko nieformalnie, bo nie zdefiniowaliśmy żadnej miary
złożoności ani wielkości kategorii. Możemy też powiedzieć, że to jest *najlepsza* albo doskonała
kategoria tego rodzaju, *o ile* przyjmiemy, że to, co jest prostsze albo mniejsze jest też lepsze,
bo te dwa słowa mają akurat charakter *ocenny*, a możemy tak przyjąć, bo taki sposób mówienia i
myślenia ma intuicyjny sens i nikt nam tego przecież nie zabroni.

Nie jest prawdą, że strzałka `f` jest endostrzałką i przyda się nam odtąd nazwa na takie strzałki,
żeby mówić o tym prościej, dlatego będę czasem nazywał takie strzałki *egzostrzałkami*. Egzostrzałką
będzie więc taka strzałka, że jej źródło i cel to inne *punkty*, które nie będą musiały co prawda
*oznaczać* innych obiektów, ale to *nie będzie miało znaczenia*, kiedy będziemy się skupiać na tej
własności strzałek. 

Struktury matematyczne (takie jak kategoria), które powstają w taki wymuszony przez ich definicje
sposób (który tutaj polega na dodaniu identyczności i składania tak, żeby aksjomaty kategorii były
spełnione) z części czy obiektów, które same jeszcze nie muszą być tego rodzaju strukturami (a sama
strzałka nie jest jeszcze kategorią), nazywamy *wolnymi*. Wolne konstrukcje są więc takimi jakby
dopełnieniami, albo dopowiedzeniami struktury określonego rodzaju. W tym wypadku to jest *wolna
kategoria generowana przez jedną egzostrzałkę*.

## icśonlaud adasaZ

Jeżeli teraz czysto formalnie odwrócimy strzałkę `f` i zapiszemy ją jako `X <- Y`, to z takiej
egzostrzałki też będziemy mogli w ten sam sposób wygenerować unikalną wolną kategorię i to będzie
*taka sama kategoria*, bo zmienią się *tylko nazwy* części jej struktury. 

A gdyby punktem wyjścia był (statyczny, jak to graf) graf `A <- B -> C`, gdzie strzałkę `A <- B`
moglibyśmy oznaczyć arbitralnie jako `f`, a strzałkę `B -> C` jako `g`? Wtedy też musielibyśmy tylko
dodać identyczności i zdefiniować wyniki składania `f` lub `g` z identycznościami na ich obu końcach
jako `f` i `g` odpowiednio i uzyskalibyśmy wolną kategorię nad tym grafem. 

Gdybyśmy jednak odwrócili strzałki na tym grafie, uzyskując w ten sposób graf `A -> B <- C`, to
wolna kategoria generowana przez ten nowy graf nie byłaby już taka sama w przyjętym (niejawnie)
znaczeniu. Z drugiej strony, *w pewnym sensie* wolne kategorie generowane przez obydwa grafy
*byłyby* takie same, bo *jako kategorie wyrażałyby właściwie to samo*, tylko to coś byłoby *inaczej
zapisane*. Zastanawiasz się pewnie, o co mi teraz chodzi? Żeby to lepiej objaśnić, może skorzystam z
innego przykładu: *Moglibyśmy* przyjąć *konwencję* interpretowania wyrażeń o postaci `n < m` jako
oznaczających, że `n` jest *większe* niż `m` i gdybyśmy stosowali tą konwencję *konsekwentnie*, to
*sens* tego, co byśmy mówili nie uległby zmianie, zmieniłby się *tylko* sposób zapisu. Tylko *czemu
by to mogło służyć*? Otóż temu:

**Sugestia**: Przepisz teraz proszę definicję *obiektu początkowego* (albo krócej i mniej oficjalnie
*początku*), ale w taki sposób, żeby wszystkie strzałki, które się tam pojawiają, były odwrócone, a
więc trzeba będzie odwrócić też wszystkie złożenia, których akurat w tej definicji nie ma, a więc
pod tym względem nic nie będzie trzeba robić. Nie nazywaj jednak tego, co ta definicja będzie
charakteryzować, jako obiekt początkowy, bo w ten sposób uzyskasz definicję obiektu *końcowego*,
którego szczególnym przypadkiem jest każdy singleton w kategorii `Set`. 

Jak widać na tym przykładzie, z każdego pojęcia kategoryjnego uzyskujemy automatycznie dwa, dlatego
właśnie mówimy o zasadzie *dualności* w teorii kategorii. Ta druga wersja defincji jest tak zwaną
*dualną postacią* albo wersją tej pierwszej i to drugie pojęcie (albo konstrukcja) jest dualne
względem tego pierwszego. I odwrotnie, to pierwsze pojęcie (albo konstrukcja) jest dualne względem
drugiego, bo *operacja odwracania wszystkich strzałek i złożeń jest odwracalna*. Przyszło Ci teraz
do głowy pojęcie izomorfizmu? Jeżeli tak, to wspaniale, ale zwróć proszę uwagę, że dualne struktury
nie są jednak w ogólnym przypadku izomorficzne w technicznym znaczeniu tego słowa. Na przykład,
wolna kategoria nad grafem `A <- B -> C` jest zdecydowanie *nie całkiem* taka sama jak wolna
kategoria nad grafem `A -> B <- C`.

Jeżeli odwrócisz wszystkie strzałki i złożenia w definicji *produktu*, to uzyskasz definicję
*koproduktu*: Koproduktem obiektów `X` i `Y` nazywamy taki obiekt, który możemy oznaczyć jako `X +
Y`, że istnieją strzałki `i1` i `i2`, nazywane *injekcjami*, *z* `X` *do* `X + Y` i *z* `Y` *do*
`X + Y` odpowiednio (odwrócenie strzałek występujących w definicji produktu) takie, że dla każdej
pary strzałek `f` i `g` *z* `X` i `Y` *do* jakiegoś `Z` odpowiednio (kolejne odwrócenie strzałek)
istnieje unikalna strzałka `f+g` (bardzo różnie się to zapisuje) *z* `X + Y` *do* `Z` (kolejne
odwrócenie) taka, że `f+g i1 = f` i `f+g i2 = g` (odwrócenie wszystkich złożeń wymuszone przez
odwrócenie wszystkich strzałek).

W kategorii `Set` koprodukty to dokładnie znane Ci już sumy rozłączne zbiorów. Żeby się o tym
przekonać, wystarczy popatrzeć na rysunek struktury wewnętrznej dowolnej sumy rozłącznej dwóch
zbiorów skończonych, na którym widać też strukturę wewnętrzną injekcji. Ponieważ suma rozłączna
zawiera tylko wierne kopie zbiorów, nazwijmy je znowu `X` i `Y`, będących jej członami, zakodowne w
taki sposób, żeby żadne dwa elementy z obydwu zbiorów nie były trafione przez wewnętrzne strzałki
obydwu injekcji, to gdy tylko określimy, dla dowolnego zbioru `Z`, do jakich elementów tego zbioru
mają być posłane przez funkcje `f` i `g` elementy zbioru `X` i zbioru `Y` odpowiednio, to, do czego
ma być posłana każda kopia, żeby powstająca w ten sposób funkcja składała się z injekcjami w funkcje
`f` i `g`, będzie wymuszone.

Można też powiedzieć, że symbol `+`, za pomocą którego oznaczamy czasem w języku teorii kategorii
operację tworzenia koproduktów, reprezentuje jakby drugą stronę albo "wywiniętą na drugą stronę"
wersję tego, co oznaczamy w teorii kategorii za pomocą symbolu `x`, czyli drugą stronę operacji
tworzenia produktów. A w kategorii `FinSet` (zbiorów skończonych) te operacje odpowiadają, jak wiesz
z jednego z poprzednich rozdziałów, dodawaniu i mnożeniu liczb naturalnych, zrealizowanemu w
zbiorach skończonych z punktu widzenia teorii kategorii dualnych operacji tworzenia sum rozłącznych
i iloczynów kartezjańskich. W ten oto sposób, posługując się graficznym językiem teorii kategorii,
możemy *zobaczyć* - całkiem dosłownie, gdybyśmy przedstawili to za pomocą diagramów - głęboki
związek między dodawaniem i mnożeniem i tym samym dostrzec, że te dwie operacje są w pewnym
technicznym i abstrakcyjnym sensie *dwiema stronami tej samej operacji*.

Często, ale nie zawsze, bo to czasem źle brzmi, konstrukcje dualne do pewnych konstrukcji, które
wydają się bardziej podstawowe albo są częściej używane, nazywamy w teorii kategorii tym samym
określeniem, ale dodając przedrostek *ko* (a po angielsku *co*, jak w pytaniu *co to ma
być?*). Produkty pojawiają się w matematyce znacznie częściej niż koprodukty, dlatego właśnie
produkty noszą nazwę bez tego przedrostka.

Zasada dualności dotyczy zresztą nie tylko dowolnych konstrukcji z obiektów, ale również dowolnych
konstrukcji opartych na złożeniach, czyli w ogóle *wszystkich definicji i zdań w języku teorii
kategorii*. A to znaczy, że wymyślając jeden rodzaj konstrukcji kategoryjnej, automatycznie
wymyślamy dwa rodzaje i udowadniając dowolne zdanie wyrażone w języku teorii kategorii automatycznie
udowadniamy dwa takie zdania!

## Początek, koniec, produkt i koprodukt w logice zdań.

Gdy tylko uda nam się zdefiniować na poziomie opisu pewnego rodzaju struktur coś ważnego w języku
teorii kategorii, możemy zacząć szukać odpowiedników tych konstrukcji czy pojęć w dowolnych innych
kategoriach.

Czym jest obiekt początkowy w opisanej już wcześniej kategorii, w której punkty są zdaniami a
strzałki reprezentują relację dowiedlności? To przecież *zdanie fałszywe*, które akurat w Leanie
jest zdefiniowane tak:

```lean
inductive False : Prop
```

To jest *cała* definicja zdania `False`. **Czytamy to** w ten sposób: Definiuję indukcyjnie
(`inductive`), czyli przez *wymienienie wszystkich możliwych sposobów konstruowania termów
definiowanego typu*, zdanie `False` (`False : Prop`) jako typ, którego termów *nie da się w żaden
sposób skonstruować*. Zdanie / typ `False` jest więc ewidentnie obiektem analogicznym do zbioru
pustego w kategorii `Set` i tak samo jak zbiór pusty, spełnia wszystkie warunki kategoryjnej
definicji obiektu początkowego: dla każdego zdania `P`, czyli dla każdego punktu w rozpatrywanej
teraz kategorii dowiedlności zdań ze zdań, można udowodnić zdanie `False -> P`, czyli istnieje
*jakaś* strzałka z punktu `False` do punktu `P` i istnieje *co najwyżej jedna* taka strzałka, bo w
tej kategorii nie ma nigdy dwóch różnych równoległych strzałek.

Obiektem dualnym do zdania fałszywego jest *zdanie prawdziwe*, które w Leanie jest zdefiniowane tak:

```lean
inductive True : Prop where
  | intro : True
```

**Czytamy to** w ten sposób: Definiuję indukcyjnie zdanie `True` jako takie, że ('where') term /
dowód można skonstruować w dokładnie jeden sposób (bo w ciele tej definicji jest tylko jedna pozioma
kreska `|`) z niczego (bo wyrażenie za tą kreską nie ma parametrów) jako term `intro` typu
`True`. Tworząc definicje indukcyjne automatycznie tworzymy też przestrzenie nazw dla ciał tych
definicji, dlatego normalnie zapisujemy ten jedyny term/dowód typu/zdania `True` jako
`True.intro`. I to zdanie spełnia wymagania obiektu końcowego:

```lean
example (P : Prop) : P → True := True.intro
```

A więc z perspektywy kategoryjnej zdanie prawdziwe albo prawda i zdanie fałszywe albo fałsz są
obiektami dualnymi, a więc w pewnym sensie są tym samym obiektem, tylko każdy z nich jest "wywróconą
na drugą stronę" wersją drugiego. Widzimy też, że istnieje oczywiste podobieństwo między
typem/zdaniem `True` i każdym możliwym singletonem.

Produkty w tej kategorii to *koniunkcje zdań*: Dla każdego zdania `P` i zdań `Q` i `R`, jeżeli z `P`
wynika `Q` i z `P` wynika `R`, czyli jeżeli w naszej kategorii istnieją strzałki `P -> Q` i `P ->
R`, to istnieje unikalna strzałka z `P` do `Q \x R`, czyli ("pod spodem") dowód implikacji `P -> Q
\and R`, która (w kategorii) składa się z projekcjami `Q x R -> Q` i `Q x R -> R` (czyli z dowodami
zdań `Q \and R -> Q` i `Q and R -> R`) dając wyjściowe strzałki `P -> Q` i `P -> R` odpowiednio, bo
te złożenia nie mogą dawać innych strzałek, bo nie ma tutaj żadnych par różnych równoległych
strzałek.

