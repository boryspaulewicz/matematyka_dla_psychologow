Zacznijmy może jeszcze raz od początku. Skoro `f` i `g` to dwie składane funkcje, to wyrażenie `g ∘
f` również oznacza pewną funkcję, a skoro funkcja `g ∘ f` jest składalna z funkcją `h` (wiesz
dlaczego, prawda? chodzi o dziedziny i przeciwdziedziny), to `h ∘ (g ∘ f)` też oznacza pewną
funkcję, bo to znowu jest złożenie *dwóch* (składalnych) funkcji (z których ta druga jest zapisana
jako złożenie dwóch funkcji).

Żeby udowodnić, że `h ∘ (g ∘ f) = (h ∘ g) ∘ f`, czyli, że lewa i prawa strona tej równości to ta(ka)
sama funkcja, musimy udowodnić, że `∀ x ∈ X, (h ∘ (g ∘ f))(x) = ((h ∘ g) ∘ f)(x)`. Zakładamy więc
najpierw, że mamy *jakiś* `x ∈ X`, bo udowodnić coś dla *jakiegoś*, czyli *bliżej nieokreślonego*,
czyli *arbitralnego* `x`, czyli `x`, o którym zakładamy *tylko* tyle, że `x ∈ C`, znaczy dokładnie
to samo, co udowodnić coś *dla każdego* `x` (należącego do `X`). W końcu jeżeli dowód działa dla `x
∈ X`, o którym *nic poza tym nie założyliśmy*, to znaczy, że działa *dla każdego* `x ∈ X`. Zapisując
na kartce, że mamy jakiś `x ∈ X`, *wprowadzamy* więc `x ∈ X` *do* (własnego) *kontekstu* i
*zaczynamy tworzyć półformalną λ-abstrakcję twierdzenia*, którą będziemy mogli potem sami (często
niejawnie) aplikować i (rzadziej) ewaluować.

Musimy teraz tylko rozwinąć definicję składania (nie ma tu żadnej innej definicji do rozwinięcia)
tyle razy, ile będzie trzeba, przekształcając lewą stronę równania (będącą wielokrotną aplikacją
dwuargumentowej[^1] funkcji składania) do postaci ...

`(h ∘ (g ∘ f))(x) = h((g ∘ f)(x)) = h(g(f(x))`

... i prawą stronę równania do postaci ...

`((h ∘ g) ∘ f)(x) = (h ∘ g)(f(x)) = h(g(f(x)))`


Zwróć proszę uwagę, że najpierw rozwinąłem definicję składania funkcji `(g ∘ f)` z funkcją `h`, a to
dlatego, że w wyrażeniu `(h ∘ (g ∘ f))` właśnie to złożenie, a nie złożenie `(g ∘ f)`, jest "na
wierzchu" (albo "na zewnątrz" \{albo "na górze"\}). Nie da się tu rozwinąć najpierw złożenia
"wewnętrznego", czyli w pierwszym przypadku `g ∘ f`, ponieważ z tym złożeniem nie sąsiaduje lista
argumentów, czyli tutaj`(x)`, a definicja złożenia funkcji "działa w oparciu o" tego rodzaju
sąsiedztwo wyrażeń. To nieintuicyjne ograniczenie zniknie gdy będziemy konstruować analogiczny dowód
w Leanie, dokładnie dzięki temu, że w teorii typów mamy funkcje anonimowe.

Samo rozwinięcie definicji wszystkich stałych pozwoliło nam zobaczyć, że obie funkcje dają ten sam
wynik `∀ x ∈ X`, a więc:

`h ∘ (g ∘ f) = (h ∘ g) ∘ f`

**Sugestia**: Jeżeli jeszcze Ci się to nie udało, to może spróbuj teraz zrobić sama coś podobnego na
kartce, jak najmniej tu zaglądając?

Zwróć też proszę uwagę, że poza tym, że wspomniałem o możliwości definiowania funkcji za pomocą
rysunku, nie korzystaliśmy w tym rozdziale z założenia, że zbiory są skończone, bo poza wspomnianym
kontekstem ani raz nie powiedziałem niczego w rodzaju "Ponieważ zbiór `X` jest skończony, to ...". A
to znaczy, że *wszystkie* wymienione w tym rozdziale własności mają rownież funkcje między
*dowolnymi* zbiorami, a więc także *nie*skończonymi.

Czy widzisz na tym przykładzie, że dowodząc różnych zdań warto *wiedzieć, z jakich dokładnie założeń
się korzysta*?  Dzięki temu możemy poprawnie *ocenić, w jakich sytuacjach obowiązuje udowodnione
zdanie*, czyli *kiedy możemy używać tego zdania jako twierdzenia*. Gdy konstruowaliśmy dowody w
języku teorii typów, w zasadzie nie dało się nie mieć tej świadomości, ponieważ wtedy było widać jak
na dłoni, z których założeń korzystaliśmy, bo te występowały wszystkie jawnie, albo jako parametry
każdego dowodu, albo w kodzie dowodu jako funkcji (jako algorytmu). To jest kolejna zaleta pełnej
formalizacji. Gdy konstruujemy dowody w bardziej nieformalny sposób, tak dobrze tego nie widać,
dlatego warto wtedy zachować czujność.

Gdybyśmy się teraz skupili na samych funkcjach i na tym, o czym mówiliśmy dotąd w tym rozdziale, to
można by to wszystko podsumować - stosując mam nadzieję w tym momencie już dla Ciebie oczywiste
skróty myślowe - jednym podwójnym równaniem i jednym pojedynczym:

1. `Id ∘ f = f = f ∘ Id`

2. `h ∘ (g ∘ f) = (h ∘ g) ∘ f`

## Pora na *prawdziwy* [odlot](https://pl.wikipedia.org/wiki/Odlot_(film_2009))

A teraz proszę wyobraź sobie, że zbiory to okręgi, z przeróżnymi, rozrzuconymi przypadkowo w środku
tych okręgów elementami, podobne do tych, które rysowałaś czytając poprzedni rozdział, a każda
funkcja to taki *strumień złożony ze strzałek*, płynący z jednego zbioru do drugiego. I wyobraź
sobie, że te zbiory i funkcje są narysowane na nieskończenie dużej kartce papieru, a Ty oddalasz się
coraz szybciej w górę, aż docierasz tak wysoko, że nie jesteś w stanie rozróżnić nic poza *punktami
zbiorów* i *strzałkami strumieni*.

Z tej abstrakcyjnej perspektywy mogłabyś zobaczyć wiele regularności, ale nie wszystkie, ponieważ
nie widziałabyś czegoś, czego nie da się dobrze narysować nie ujawniając wewnętrznej struktury
funkcji i zbiorów. Byłoby wtedy widać, że *da się zdefiniować* działanie składanie funkcji, bo
wszędzie tam, gdzie byłaby ścieżka z dwóch strzałek, byłaby też pojedyncza strzałka na
skróty. Czymś, czego nie mogłabyś wtedy zobaczyć, byłoby to, co sprawia, że przestrzeń zbiorów
*żyje*, to jest nie widziałabyś *jak działa* działanie składania.

Żeby zobaczyć *to*, trzeba mieć oczy anioła. Ja akurat nie mam i zgaduję, że Ty również nie
posiadasz (wybacz). Jeżeli nie jest się chwilowo w posiadaniu oczu anioła, w ostateczności można
nabyć ich protezę i próbować wypatrzyć, co tylko się da, to znaczy próbować *wyprowadzać
dedukcyjnie* rozmaite wnioski posługując się *językiem teorii kategorii*.

## Tak się składa

**Rysunek 1**: `Narysuj` proszę trzy, tworzące poziomy szereg punkty i oznacz je od dołu literami
`X`, `Y` i `Z`. Dodaj `Strzalka X Y` i oznacz ją literą `f` i `Strzalka Y Z` i oznacz ją literą
`g`. Ponieważ jesteś tak wysoko, nie jesteś w stanie zobaczyć strzałek wychodzących z poszczególnych
elementów, ale widzisz funkcje - jako *pojedyncze* strzałki między punktowymi zbiorami - a ponieważ
masz protezę genialności, widzisz też *czasami* (bo to tylko proteza), które strzałki składają się w
które i które strzałki można złożyć z których strzałek.

Strzałki `f` i `g` są `Skladalne`, a więc musi istnieć ich unikalne `Zlozenie`, to jest taka funkcja
`h`, która jest funkcją `(g ∘ f)`, czyli dla której spełniony jest warunek `∀ x ∈ X, h(x) = (g ∘
f)(x) = g(f(x))`. Tego nie musisz próbować *zobaczyć*, bo to możesz *wywnioskować* z definicji
funkcji. Dorysuj więc od dołu `Strzalka X Z`, taką wygiętą w łuk, i oznacz ją literą `h`, a potem
umieść w środku uzyskanego w ten sposób diagramu ptaszka.

Jest tam teraz ptaszek, bo mocą naszej *decyzji* dotyczącej tego, co oznacza `h`, ten diagram jest
*przemienny*, co możemy zapisać algebraicznie również jako `Zlozenie f g = h`. Ten ptaszek i
odpowiadające mu równania w dwóch różnych językach (`Zlozenie f g = h` będzie niebawem poprawnym
termem w języku teorii typów), to przykład czegoś, czego nie da się zobaczyć na samym
[*grafie*](https://pl.wikipedia.org/wiki/Graf_(matematyka)) reprezentującym zbiory i funkcje między
nimi, ponieważ grafy, choć czasem mogą się kojarzyć z rozmaitymi procesami, są jednak strukturami
*statycznymi*, a składanie strzałek jest (w pewien sposób) dynamicznym (wybrednym)
*działaniem*. Dlatego z wysokości, na której się aktualnie znajdujesz, nie zobaczysz tego nawet
patrząc przez magiczne okulary, a więc wszystkie informacje na temat (ro)\{z/s\}kładania się
funkcji, poza uniwersalnymi włanościami tego działania, *musisz* odtąd albo *założyć*, albo
*wywnioskować*.

Tego, że każdy zbiór ma jedną identyczność, nie musisz próbować zobaczyć (ani nawet zakładać), bo
*wiesz* (to jest jedna z tych uniwersalnych własności), że dla każdego zbioru `X` można zdefiniować
taką funkcję `Id`, że `∀ x ∈ X, Id(x) = x` i wiesz, że dla każdego zbioru istnieje dokładnie
jedna taka funkcja. Nie musisz też nigdy próbować zobaczyć (ani zakładać), że różne zbiory mają
różne identyczności, bo *wiesz* (z definicji), że o tożsamości funkcji decyduje między innymi jej
dziedzina i przeciwdziedzina. 

Nie musisz więc wytężać wzroku (ani się dłużej zastanawiać), żeby się przekonać, że każdy punkt ma
swoją *unikalną* i *charakterystyczną* endostrzałkę identycznościową. A to znaczy, że istnieje
izomorfizm między zbiorami i identycznościami, a to z kolei znaczy, że zamiast mówić o zbiorach,
możemy równie dobrze mówić o identycznościach. Kto wie, może jeszcze z tego skorzystamy.

Wiesz jeszcze dwie ważne rzeczy. Po pierwsze, dla każdej strzałki `f`, `Id ∘ f = f = f ∘ Id`. W
przypadku zbiorów i funkcji ten warunek, odpowiadający koniunkcji zdań `Id ∘ f = f` i `f = f ∘ Id`
(który moglibyśmy zapisać również używając języka logiki jako `Id ∘ f = f ∧ f = f ∘ Id`, jednak
wtedy trochę schowałaby się nam sugestia, że na mocy przemienności równości również `Id ∘ f = f ∘
Id`), gdzie pozwoliłem sobie na skrót myślowy i nie zaznaczyłem, że pierwsza i ostatnia identyczność
są przyczepione do *potencjalnie* różnych punktów, jest spełniony, ponieważ gdybyś zmniejszyła swoją
wysokość, (jak już wiesz z poprzedniego rozdziału) zobaczyłabyś, że:

`∀ x ∈ X, (Id ∘ f)(x) = Id(f(x)) = f(x) = f(Id(x)) = (f ∘ Id)(x)`

A więc `Id ∘ f = f = f ∘ Id`.

To jest (nawiasem mówiąc) kolejny dowód przedstawiony nieco nonszalancko w postaci *jednego
wielokrotnie złożonego zdania*, w ramach którego akurat rozwijamy, a następnie zwijamy (a może
raczej "owijamy"?) definicje identyczności i składania. 

A po drugie, jeżeli `f : X → Y`, `g : Y → Z` i `h : Z → V`, to jeżeli `x ∈ X`, to ...

`(h ∘ (g ∘ f))(x) = h((g ∘ f)(x)) = h(g(f(x))) = (h ∘ g)(f(x))) = ((h ∘ g) ∘ f)(x)`

A więc *gdy pod punktami skrywają się zbiory a pod strzałkami skrywają się funkcje między tymi
zbiorami*, to o ile złożenia, które pojawiają się poniżej, są możliwe, jest prawdą dla każdych
trzech *strzałek* `f`, `g` i `h`, że:

1. `Id ∘ f = f = f ∘ Id`

2. `h ∘ (g ∘ f) = (h ∘ g) ∘ f`

Dowód "złożeniowej neutralności" identyczności jest łatwy i ta "neutralność" jest jak sądzę już dla
Ciebie oczywista. Zgaduję jednak, że ostatni dowód mógł być dla Ciebie trochę trudny, ale tylko z
powodu licznych, czasami zagnieżdżonych nawiasów, które trzeba zapisać, żeby w nim poprawnie
operować operacją (ech) składania funkcji. Można jednak uprościć ten zapis, wprowadzając dodatkowe
definicje, w podobny sposób, w jaki będziemy to robić od pewnego momentu dowodząc bardziej
skomplikowanych twierdzeń w Leanie.

Jeżeli oznaczymy dwa tutaj jakby podstawowe złożenia w ten sposób ...

`i := g ∘ f`

`j := h ∘ g`

... to zdanie `∀ x ∈ X, (h ∘ (g ∘ f))(x) = ((h ∘ g) ∘ f)(x)` będziemy mogli zapisać prościej tak:

`∀ x ∈ X, (h ∘ i)(x) = (j ∘ f)(x)`

Przyjmujemy więc znowu, że mamy jakiś `x ∈ X` i dwukrotnie (raz z lewej a raz z prawej) rozwijając
definicję `∘` uzyskujemy zdanie:

`h(i(x)) = j(f(x))`

Pozostaje nam rozwinąć tymczasowe definicje stałych `i` i `j` ...

`h((g ∘ f)(x)) = (h ∘ g)(f(x))`

... żeby przekonać się, znowu dwukrotnie rozwijając definicję `∘`, że równość faktycznie zachodzi:

`h(g(f(x))) = h(g(f(x))`

Podoba mi się ten ostatni sposób, a Tobie? Chociaż przyznam, że nie jest dla mnie jasne, czy
cokolwiek tu upraszcza, To może jeszcze zrobimy coś podobnego, tylko w Leanie? 

W tym celu zastosujemy taktykę `rfl`, o której jeszcze nie mówiłem. Ta taktyka automatycznie
konstruuje między innymi dowody, które polegają na wykazywaniu, że dwa wyrażenia są równe po
zredukowaniu, czyli *z definicji* (liczba mnoga). Zaczniemy od ilustracji, która może być dla Ciebie
teraz jeszcze trochę trudna, ale której też wcale nie musisz w tym momencie dobrze rozumieć:

```lean
-- Używamy tutaj parametrów opcjonalnych, które wprowadzamy do definicji funkcji otaczając je nawiasami
-- klamrowymi. *Możemy* tak zrobić, ponieważ Lean może wywnioskować te wartości z pozostałych argumentów 
-- aplikacji tej funkcji. *Chcemy*, żeby te parametry były opcjonalne, bo dzięki temu będziemy mogli
-- później (znacznie) mniej pisać i kod będzie (znacznie) bardziej czytelny.
def Zlozenie {X Y Z : Type} (f : X → Y) (g : Y → Z) : X → Z := 
  -- Tak wiem, ta zmiana kolejności bywa irytująca.
  fun (x : X) => g (f x)

-- Dla dowolnych *typów* (a nie *zbiorów*, ale dowód *działa* tak samo) `X`, `Y`, `Z` i `V` ...
variable (X Y Z V : Type)

-- ... i funkcji `f`, `g`, `h`, które są na mocy samej takosamości niektórych występujących w ich specyfikacjach
-- typów, to jest typów `Y` i `Z`, kolejno parami składalne (wiesz o co mi chodzi, prawda?) ...
variable (f : X → Y) (g : Y → Z) (h : Z → V) -- tak też można używać instrukcji `variable`

-- ... to (przypominam, że to *ilustracja*, a nie poprawny kod Leana) ...
Zlozenie f (Zlozenie g h)

-- ... redukuje się do tego ...
fun (x : X) => (Zlozenie g h) (f x)

-- .. a tamto do tego ...
fun (x : X) => (fun (y : Y) => h (g y)) (f x)

-- .. a tamto do tego (tam jest jedna aplikacja, zauważyłaś?):
fun (x : X) => h (g (f x)))

-- Natomiast to ...
Zlozenie (Zlozenie f g) h

-- .. redukuje się do tego ...
Zlozenie (fun (x : X) => g (f x)) h

-- ... a tamto do tego ...
fun (x : X) => h ((fun (x : X) => g (f x)) x)

-- .. a tamto do tego (bo tam też jest jedna aplikacja):
fun (x : X) => h (g (f x))
```

A więc te dwie podwójne aplikacje w różnej kolejności, czyli w tym wypadku dwa podwójne złożenia
funkcji w różnej kolejności, redukują się do tego samego, czyli są równe. Udowodnienie tego za
pomocą taktyki `rfl` jest dziecinnie proste:

```lean
-- Instrukcji `variable` można używać również tak:
variable (X Y Z V : Type) (f : X → Y) (g : Y → Z) (h : Z → V)

-- Trzeba było tak od razu, prawda?
example : Zlozenie f (Zlozenie g h) = Zlozenie (Zlozenie f g) h := by rfl

-- W ten sam sposób możemy udowodnić łączność wbudowanej w Leana operacji składania funkcji. Symbol
-- składania uzyskasz w Leanie wpisując \o.  Ten symbol jest rozwijany do stałej o nazwie `Function.comp`
-- (czyli po polsku "Funkcja.skład").
example : h ∘ (g ∘ f) = (h ∘ g) ∘ f := by rfl

-- To może jeszcze (podwójny) dowód, że identyczności zachowują się jak elementy neutralne ze względu
-- na operację składania funkcji?
example : (fun (y : Y) => y) ∘ f = f := by rfl 
example : f ∘ (fun (x : X) => x) = f := by rfl 

-- To było mało czytelnie? No to dodamy odrobinę lukru składniowego. Funkcja `ID` dla podanego *typu*
-- tworzy *funkcję* identycznościową z tego typu do niego samego. Myślę, że jesteś już w stanie zrozumieć
-- tą definicję.
def ID (typ : Type) : typ → typ := fun (a : typ) => a

example : (ID Y) ∘ f = f := by rfl
example : f ∘ (ID X) = f := by rfl

-- Przy okazji odkryliśmy więc, że wewnątrz teorii typów przez cały ten czas ukrywała się co najmniej jedna
-- *kategoria*, a konkretnie kategoria typów typu Type i funkcji między tymi typami. A o tym, czym dokładnie
-- jest (każda) kategoria, powiemy sobie już za chwilę.
```

Pomijając chwilowy powrót do Leana, z oddalenia widzimy więc, a tak naprawdę wiemy z definicji
(liczba mnoga), że teoriomnogościowe identyczności są *elementami neutralnymi ze względu na operację
składania funkcji*. Można powiedzieć, że ze względu na operację składania istnieje tutaj
nieskończenie wiele - bo dokładnie tyle, ile jest zbiorów - *zer* albo *jedynek*, zależnie od wyboru
analogii między składaniem i (akurat niewybrednymi) operacjami dodawania lub mnożenia. To po
pierwsze.

A po drugie, podobnie jak dodawanie i mnożenie liczb, bez zaglądania do struktury wewnętrznej
konkretnych funkcji wiemy, że (wybredne) *składanie funkcji jest łączne*, co znaczy, że zapisując
złożenie więcej niż dwóch funkcji *można* w ogóle *nie stosować nawiasów* i *nie ma znaczenia*, w
jakiej *kolejności* będziemy *stosować operację składania*. Nadal jednak w ogólnym przypadku *ma*
oczywiście znaczenie, *w jakiej kolejności podamy argumenty* tej operacji.

"Podsumowując dotychczasowe rozważania" (Borek, jak Ty się zwracasz do Pani?!), z wysokości, na
której się teraz znajdujemy, a z której nie widać ani wewnętrznej struktury zbiorów, ani wewnętrznej
struktury teoriomnogościowych funkcji, widzimy/wiemy między innymi, że:

## Sześć aksjomatów kategorii (które za chwilę uprościmy do jednej prostej kwestii)

1. Istnieją *punkty* (zbiorów), które dla nas są tylko *punktami zaczepienia strzałek*.

2. Istnieją *strzałki*, w których nie jesteśmy w stanie z tej wysokości zobaczyć żadnej
   *wewnętrznej* struktury.

3. Istnieje wybredna w znany Ci już sposób *operacja składania strzałek*.

4. Każdy punkt ma swoją *unikalną* i *charakterystyczną endostrzałkę* (czyli *pętlę*)
   *identycznościową*.

5. Identyczności są *elementami neutralnymi* ze względu na operację składania: `Id ∘ f = f = f ∘ Id`.

6. Składanie jest *łączne*: `h ∘ (g ∘ f) = (h ∘ g) ∘ f = h g f`.

W ostatnim punkcie pozwoliłem sobie skorzystać z możliwości pozbycia się nawiasów - bo składanie
jest łączne - i z uproszczenia polegającego na pozbyciu się również symbolu `∘`. W praktyce zwykle
używamy właśnie tej notacji, bo składanie jest w teorii kategorii operacją podstawową i nie lubimy
niepotrzebnie dużo pisać.

I w ten oto sposób, zmierzając razem ze mną powoli okrężną drogą do pojęcia [*logicznej
alternatywy*](https://pl.wikipedia.org/wiki/Alternatywa),
[poznałaś](https://atkinsbookshelf.wordpress.com/tag/what-does-it-mean-to-miyagi-someone/) [sześć
*aksjomatów kategorii*](https://pl.wikipedia.org/wiki/Teoria_kategorii). Przy okazji powiem Ci
jeszcze, że "przyjmuje się" (czytaj: wiele osób tak uważa), że teorię kategorii odkryli albo
stworzyli na początku lat 40tych dwaj matematycy, [Samuel
Eilenberg](https://pl.wikipedia.org/wiki/Samuel_Eilenberg) i [Saunders Mac
Lane](https://pl.wikipedia.org/wiki/Saunders_Mac_Lane), z których pierwszy urodził się w Polsce i w
Polsce studiował matematykę, chociaż inny wybitny polski matematyk, [Stanisław
Ulam](https://pl.wikipedia.org/wiki/Stanis%C5%82aw_Ulam), podobnie jak kilku sympatyzujących z nim
autorów, twierdził, że tego rodzaju teoria "krążyła po Polsce" już w latach 30tych.

## Centralna zasada teorii kategorii

Ponieważ z perspektywy teorii kategorii ...

1. ... *punkty* są tylko po to, żeby strzałki miały z czego wychodzić i do czego wchodzić, ...

2. ... *identyczności* są zwykle oczywiste i często można o nich prawie w ogóle nie myśleć, ...

3. ... a to, w jaki sposób składanie strzałek jest *wybredne* jest często prawie tak oczywiste, jak
identyczności, bo zwykle jest jasne, które złożenia mają, a które nie mają sensu ...

... to za najważniejszą część definicji kategorii wypada uznać *łączność*, ...

`h ∘ (g ∘ f) = (h ∘ g) ∘ f`

... a *funkcjonalnie*, to jest w praktyce stosowania, łączność sprowadza się do tego, że:

**Działanie binarne, które dla potrzeb stosowania do niego języka teorii kategorii postanowiliśmy
nazywać chwilowo kategoryjnym składaniem, można zapisać nie używając nawiasów**.

Czyli, że:

**Rezultat wielokrotnego zastosowania tego działania można zapisać jako rezultat sekwencji
działań**.

I co, nie miałem racji twierdząc, że wszystko nam się uprości?

## Acha, fajnie, ale *dlaczego*? Czyli w tym [wypadku](https://sjp.pwn.pl/sjp/wypadek;2540057.html) *po co*?

Zgaduję, że jesteś zawiedziona tym ostatnim uproszczeniem. Nie wiesz przecież, po czym można poznać
takie działania i dlaczego warto uczyć się teori tego rodzaju działań, czyli teorii
kategorii. Jeżeli masz takie wątpliwości, to na razie powiem tylko tyle, że nie jesteś sama.
Rozumienie *tego* rozwija się powoli.

Zaczynasz się oswajać z *formalnym językiem* teorii kategorii, ale jeszcze nie ze *wspomaganym
językiem teorii kategorii sposobem myślenia*. Przyszedł więc czas, żeby zacząć tego języka coraz
swobodniej *używać*. Zgaduję, że w tym momencie aksjomaty kategorii kojarzą Ci się bardzo z
konkretnymi przykładami zbiorów i funkcji, bo przecież od tego przykładu zaczęliśmy. Będziesz się
odrywać od tego przykładu w dwóch krokach, a właściwie w dwóch
[przelotach](https://pl.wikipedia.org/wiki/Przelot).

Pokażę Ci, że pewne znane Ci już, ważne obiekty, konstrukcje i własności *teoriomnogościowe*, takie
jak element zbioru (sic!), tożsamość, izomorficzność, injektywność i surjektywność funkcji,
podzbiór, podział zbioru (na niepuste, wyczerpujące i rozłączne *pod*zbiory), zbiór pusty,
singleton, iloczyn kartezjański i suma rozłączna zbiorów, można jakby na nowo rozpoznać "z zewnątrz"
jako kategoryjne *struktury strzałkowe*, i że to jest w pewnym sensie *lepszy*, bo jednocześnie
*uniwersalny* i lepiej *dopasowany do ich roli* sposób mówienia o tych obiektach, konstrukcjach i
własnościach. Niejako przy okazji zaczniesz też stopniowo w bardziej elastyczny sposób myśleć o
"takosamości" matematycznych obiektów. A potem skorzystamy z kilku spośród tych alternatywnych,
uniwersalnych kategoryjnych definicji, żeby w nowy sposób popatrzeć na *logikę*.

**Element zbioru jako pojęcie strzałkowe**: Wybieramy najpierw dowolny konkretny zbiór
jednoelementowy, czyli singleton, na przykład `{∅}`. Dla każdego zbioru `X`, istnieje oczywisty
*izomorfizm* między funkcjami z tego singletona do `X` i *elementami* należącymi do `X`. Każda taka
funkcja wskazuje przecież dokładnie jeden element `x` zbioru `X` i odwrotnie, każdy taki element
odpowiada dokładnie jednej takiej funkcji. *Wszystko*, co tylko da się powiedzieć o elementach
zbiorów, można więc równie dobrze powiedzieć o takich funkcjach i vice versa. *Nie ma oznaczeń bez
oznaczania, ani oznaczania bez oznaczeń*, pamiętasz?

I tak, jeżeli `x ∈ X`, to istnieje *funkcja*, a więc również pewna *strzałka* w naszej *kategorii*
(zbiorów, funkcji i ich złożeń), którą możemy również oznaczyć jako `x`, taka, że `x : {∅} → X` i
`x(∅) = x`. Nazwanie tej funkcji również literą `x` jest co prawda może (znowu, wiem) trochę
nonszalanckie, ale *nie musi być* błędem, bo ta *decyzja* ma charakter *metajązykowy* i mimo
pojawiającej się z tego powodu dwuznaczności - i "dwutypowości"! - symbolu `x`, *kontekst użycia*
pozwoli nam zawsze *jednoznacznie stwierdzić*, czy `x` oznacza element, czy funkcję. Niestety, w
niektórych sytuacjach to może być jednak zbyt mylące. Na przykład, gdyby chodziło o element będący
liczbą `1`, to zapis `1(∅) = 1` mógłby sugerować, że mamy do czynienia z mnożeniem, bo mnożenie
dwóch elementów zapisujemy czasem zestawiając je ze sobą, a gdyby chodziło o wskazanie za pomocą
funkcji z singletona elementu będącego zbiorem pustym, uzyskalibyśmy dezorientujące zdanie `∅(∅) =
∅`. Należy więc zachwać czujność.

Celowe wprowadzanie tego rodzaju dwuznaczności nazywamy w informatyce, i w matematyce czasem zresztą
też, [*przeciążaniem*](https://pl.wikipedia.org/wiki/Przeci%C4%85%C5%BCanie_funkcji). Co prawda
"oficialnie" ten termin dotyczy tylko przeciążania *nazw funkcji* albo *nazw metod* (metody to też
pewne funkcje *jako programy*, tyle, że określonego rodzaju), ale jest jasne, że ten sam manewr
można zastosować, z tego samego powodu, a dokładniej w tym samym *celu* - to jest aby podkreślić
jakieś głębsze podobieństwo albo bliski związek - do *dowolnych* stałych. A chcemy podkreślić ścisły
związek między elementami zbioru `X` i tego rodzaju funkcjami, ponieważ chcemy, żeby różnica między
tymi dwoma rodzajami obiektów stawała się coraz *mniej* widoczna. To jest więc kolejny przykład
*celowej wieloznaczności* albo *wieloznaczności pod kontrolą*. Spróbuj sama odgadnąć, jak w tym
kontekście można rozebrać na elementy składowe zdanie `x(∅) = x` i pamiętaj proszę, że nigdzie się
nie spieszymy. Na wypadek, gdybyś potrzebowała dodatkowych wyjaśnień, znajdziesz je
[tutaj](R22__Element_x_jako_funkcja_z_singletona.md).

**Singleton z perspektywy kategoryjnej**: Każdy zbiór jednoelementowy `T` (dlaczego akurat duża
litera `T` wyjaśnię za chwilę) ma własność strzałkową (czyli *w tym wypadku* "funkcjo-złożeniową")
polegającą na tym, że dla każdego zbioru `X`, istnieje dokładnie jedna funkcja (czyli również
dokładnie jedna kategoryjna strzałka) *z* `X` *do* `T`. I odwrotnie, jeżeli zbiór `Y` ma taką
własność, że dla każdego zbioru `Z` istnieje dokładnie jedna funkcja z `Z` do `Y` (czyli dokładnie
jedna taka kategoryjna strzałka), to `Y` musi być zbiorem jednoelementowym. Tego rodzaju kategoryjne
punkty nazywamy obiektami końcowymi i oznaczamy czasem literą `T` od angielskiego słowa *terminal*,
a czasem, ze względu na ich charakter w kategorii zbiorów i na to, jak się w pewnych sytuacjach
zachowują, jako `1`.

**Zbiór pusty z perspektywy kategoryjnej**: Każdy zbiór pusty `I` (dlaczego akurat `I` wyjaśnię za
chwilę) ma własność strzałkową polegającą na tym, że dla każdego zbioru `X`, istnieje dokładnie
jedna funkcja (czyli dokładnie jedna kategoryjna strzałka) *z* `I` *do* `X`. I odwrotnie, jeżeli
zbiór `Y` ma taką własność, że dla każdego zbioru `Z`, istnieje dokładnie jedna funkcja (czyli
również strzałka) z `Y` do `Z`, to `Y` musi być zbiorem pustym. Tak się akurat składa, że istnieje
dokładnie jeden zbiór pusty, ale to nie sprawia, że dwa ostatnie zdania, które mówią o *dowolnych*
takich zbiorach, są fałszywe. Tego rodzaju kategoryjne punkty nazywamy *obiektami początkowymi* i
oznaczamy zwykle albo jako `I`, od angielskiego słowa *initital*, albo jako `0`, z powodów
analogicznych do tych, dla których obiekty końcowe oznaczamy często jako `1`.

**Iloczyn kartezjański zbiorów z perspektywy kategoryjnej**: Niech `X = {1, 2}` i `Y = {a,
b}`. Wtedy *każdy* element zbioru `X × Y`, taki jak na przykład `(2, a)`, można równie dobrze opisać
jako *taki element, którego pierwszym elementem jest* `2` *a drugim* `a`. A to są przecież dwie
*własności*, a więc pewne *funkcje*. Czy widzisz, że na przykład element ...

`(2, a)`

... mówi do Ciebie *Jestem* `2` *i* `a`, *w tej kolejności, i niczym więcej*? Skoro tak, to równie
dobrze możemy opisać każdy taki element *za pomocą projekcji*: Każdy taki element ma tą *własność*,
że *wszystkie* jego *własności* można wyrazić w kategoriach tych dwóch *własności* (tak, wiem, ale
musiałem). I do tego w zasadzie sprowadza się definicja produktu kategoryjnego, a mimo to ta
definicja może być początkowo trudna do zrozumienia.

Pisałaś o tego rodzaju funkcjach, tak samo nazywając je zresztą *projekcjami*, w komentarzu pod
jednym z naszych rysunków z poprzedniego rozdziału. Jesteśmy już bliżej kategoryjnego odpowiednika
iloczynu zbiorów, ale jeszcze nie uchwyciliśmy "istoty" tego pojęcia za pomocą samych kategoryjnych
strzałek, a tak naprawdę samej operacji kategoryjnego składania. Niestety, nie potrafię zaproponować
rozumowania, które prowadziłoby prostą drogą do tej niezbyt prostej definicji, dlatego muszę ją
przedstawić jako rezultat *wglądu*, to jest jako coś, co zostało częściowo przypadkowo przez kogoś
kiedyś *odkryte*.

**Rysunek 1**: `Narysuj` iloczyn kartezjański `X × Y`, gdzie `X = {1, 2}` i `Y = {a, b}`, jako okrąg
z odpowiednio oznaczonymi elementami, a po lewej od niego narysuj zbiór `{∅}`, również jako okrąg,
zawierający jako swój jedyny element zbiór pusty, czyli `∅`. Następnie `Narysuj Strzalka ∅ v`, gdzie
`v` będzie dowolnym wybranym przez Ciebie elementem wewnątrz okręgu zbioru `X × Y`, czyli strzałkę z
*elementu* `∅` do jakiegoś *elementu* `v ∈ X × Y`, wyrażając w ten sposób strukturę wewnętrzną
pewnej funkcji, i oznacz ją symbolem `v`. W ten sposób jednocześnie wskażesz ten element, nazwiesz
go, i stwierdzisz, że jest elementem iloczynu `X × Y`. Czy widzisz, że niezależnie od tego, jaki
element byś w ten sposób wskazała, ten element będzie zawsze *jednoznacznie* określony przez dwie
własności, to jest przez to, jaki ma pierwszy i jaki ma drugi element (będące elementami tego
elementu jako pewnej pary uporządkowanej \{nie wiem, czy musiałem, ale mogłem\})?

To teraz `Narysuj` jeszcze proszę dwie *projekcje* tego iloczynu. Żeby to zrobić, musisz albo nad i
pod, albo po bokach od scharakteryzowanego już za pomocą rysunku zbioru `X × Y` dorysować zbiory `X`
i `Y`. Gdy to zrobisz, `Narysuj` proszę funkcję `π₁ : X × Y → X` (`π` bo πrojekcja, jak li w słowie
"likarstwo"[^4]), to jest `Narysuj` jej wewnętrzną strukturę, dodając strzałki od każdego elementu
`(x, y) ∈ X × Y` do `x ∈ X`. W ten sam sposób `Narysuj` πrojekcję `π₂ : X × Y → Y`.

Czy widzisz, że niezależnie od tego, który element `v ∈ X × Y` byś wskazała za pomocą funkcji z
singletona `{∅}` do zbioru `X × Y`, takie wskazanie *zawsze* będzie odpowiadało *dokładnie jednej*
uporządkowanej *parze wskazań* elementów `X` i `Y`, danej przez `π₁ ∘ v` i `π₂ ∘ v`? A czy widzisz,
że każda taka uporządkowana (uporządkowana "automatycznie", bo projekcje są tutaj indeksowane
liczbami, a są nimi indeksowane, bo jeden z argumentów operacji `×` jest *pierwszy*, a drugi jest
... *drugi*) para wskazań odpowiada dokładnie jednemu wskazaniu elementu zbioru `X × Y`?

Mam nadzieję, że w tym momencie widzimy oboje, że mamy tu pewne narzucające się *izomorfizmy* między:

1. *elementami* znajdującymi się *wewnątrz* zbioru `X × Y`,

2. znajdującymi się *na zewnątrz* tego zbioru *pojedynczymi funkcjami* z singletona do `X × Y`,

3. i znajdującymi się również *na zewnątrz*, *parami funkcji* z singletona `{∅}` do zbiorów `X` i
`Y` odpowiednio.

A właściwie nic tu nie jest *tylko* "na zewnątrz", bo wszystko jest "pomiędzy" czymś a czymś, a
raczej "od do". I to wszystko sprowadza się właściwie do wyrażonego za pomocą strzałek stwierdzenia:
*Elementy `X × Y` oznaczają pary elementów `X` i `Y`*.

Teraz, gdy skończyłem pisać ten akapit, zaczęło mi się wydawać, że może jednak da się przedstawić
kategoryjny iloczyn (który nazywamy raczej kategoryjnym *produktem*) jako *wniosek z pewnego
rozumowania*. Może powinienem też wyjaśnić, dlaczego tak mi zależało, żeby w ten właśnie sposób
zobaczyć kategoryjny produkt. O ile uda się znaleźć jakiś *naturalny* albo *logiczny* sposób, w jaki
powstaje jakaś ważna matematyczna konstrukcja, to można próbować ten sposób *uogólnić*, w nadziei,
że znajdzie się dzięki temu *inne* podobne konstrukcje.

Po raz kolejny przekonałem się w ten sposób, że *najwięcej uczy się czegoś ten, kto sam próbuje
kogoś czegoś nauczyć* i jednocześnie, że *najbardziej pogłębia swoje zrozumienie czegoś ten, kto
próbuje to coś komuś jasno wytłumaczyć*. Wydaje mi się, że to jest dlatego tak niezwykle skuteczny
sposób uczenia się i pogłębiania rozumienia dosłownie czegokolwiek, że próby wytłumaczenia czegoś
względnie *jasno* polegają zawsze na wielokrotnym dokonywaniu (autor-)refleksji na *metapoziomie*
(bo tylko na tym poziomie da się *kontrolować jasność wypowiedzi*). A tak w ogóle, to na pewnym
poziomie abstrakcji nie ma chyba *żadnej* różnicy między uczeniem (się) i pogłębianiem zrozumienia
czegoś. Dlatego jeszcze raz dziękuję, za to, że jesteś i za to, że czytasz. Dziękuję Ci, ponieważ
czuję autentyczną wdzięczność, a czuję ją chyba głównie dzięki temu, że dopiero niedawno wreszcie
zrozumiałem trochę lepiej coś[^3], co zdarzało mi się wcześniej powtarzać nieco ironicznie.

I mam też taką nieśmiałą propozycję, żebyśmy przy okazji podziękowali za coś wspólnie. "Ja" Temu,
który bez *nas* by nie istniał i który dzięki temu, że *my* jesteśmy i działamy jest i którego w
"moim" formalnym języku mogę wskazać jako kierunek współdziałania wspólnoty wszystkich ludzi, a "Ty"
komu tam uznasz za stosowne. Za to, że wśród współczesnych naukowców, którzy w zdecydowanej
większości prawie w ogóle niczego się systematycznie nie uczą i często nawet niczego nie próbują
zanotować, gdy uczesniczą w dyskusjach albo słuchają wystąpień, wielu jest nadal na szczęście
*zmuszonych*, w czasie wolnym od produkowania kolejnych "naukowych" publikacji - które zresztą
często nie przynoszą im chyba ani szczególnej radości, ani satysfakcji - prowadzić zajęcia dla
jakiś okropnych, namolnych studentów. No więc może podziękujmy właśnie za to, tylko krócej.

Na koniec podpisz jeszcze proszę ten rysunek, korzystając w ten sposób z efektywności zapisu za
pomocą znanych Ci już w miarę dobrze terminów technicznych, następującym zwięzłym komentarzem:
*Istnieje naturalny izomorfizm między elementami iloczynu kartezjańskiego i parami funkcji z
dowolnego singletona do przeciwdziedzin projekcji tego iloczynu (i między funkcjami z dowolnego
singletona do dowolnego iloczynu i elementami tego iloczynu)*.

Z naszych dotychczasowych rozważań (zbiory, elementy i funkcje jako trzy aspekty swobodnego i
konsekwentnego oznaczania + izomorfizm między strzałkami do iloczynu kartezjańskiego i
uporządkowanymi parami strzałek do jego członów) wynika, że wszystko, co możemy powiedzieć na temat
elementów należących do dowolnego iloczynu kartezjańskiego, a więc po prostu wszystko, co możemy
powiedzieć na temat iloczynu kartezjańskiego, możemy powiedzieć *pomijając wewnętrzną strukturę*
tego rodzaju zbioru, zamiast tego mówiąć o *funkcjach* z jakiegoś singletona do tego iloczynu. No to
już prawie [witamy się z
gąską](https://pl.wiktionary.org/wiki/ju%C5%BC_by%C4%87_w_ogr%C3%B3dku,_ju%C5%BC_wita%C4%87_si%C4%99_z_g%C4%85sk%C4%85)
produktu kategoryjnego.

## Kategoryjny produkt

**Rysunek 2**: Ponieważ ten rysunek będzie bardziej skomplikowany, muszę wprowadzić bardziej
skomplikowany język. Jeżeli, dla jakiegoś `Punkt X`, napiszę `Narysuj (Punkt Y) (<położenie> X)`
(będę dodawał w ten sposób nawiasy, żeby uniknąć nieporozumień), gdzie `<położenie>` będzie jednym z
termów `N`, `E`, `S`, `W`, `NE`, `SE`, `SW`, `NW`, oznaczających odpowiednio *na północ*, *na
wschód*, *na południe*, *na zachód*, *na północny wschód*, *na południowy wschód*, *na południowy
zachód* i *na północny zachód*, to będzie znaczyło, że proszę Cię o narysowanie punktu `Y` właśnie w
tym położeniu względem punktu `X`.

No więc na początek `Narysuj (Punkt X x Y)` i oznacz go z dołu jako `X x Y`, czyli po prostu oznacz
go z dołu. Następnie `Narysuj (Punkt X) (SW (X x Y))` (czyli na południowy zachód od punktu `X × Y`)
i oznacz go z dołu. Potem `Narysuj (Punkt Y) (SE (X x Y))` i oznacz go z dołu. `Narysuj (Strzalka (X
x Y) X)` i oznacz ją z góry jako `π₁` i w ten sam sposób `Narysuj` strzałkę `π₂ : X x Y → Y`, tylko
tą oznacz sama już wiesz jak. `Narysuj (Punkt Z) (N (X x Y))` i - jako łuki wygięte na zewnątrz,
tak, jakby to były skrzydła anioła - `Narysuj (Strzalka Z X)` i `Strzalka Z Y`, a potem oznacz je
odpowiednio literami `f` i `g`, zapisując te nazwy po zewnętrznych stronach tych skrzydeł albo
strzałek. Wreszcie linią *przerywaną* `Narysuj (Strzalka Z (X x Y))` i po lewej albo po prawej, jak
chcesz, oznacz ją jako `⟨f, g⟩`. Na koniec wewnątrz każdego ze skrzydeł nanieś ptaszka, bo ten
*diagram* ma być *z definicji przemienny*.

Co? Tak, wiem, ale nie przejmuj się, to minie (*wszystko* przecież mija[^2]). Już wyjaśniam:

Niezależnie od tego, jaki byśmy wybrali zbiór `Z` ...  
albo: *czym byśmy oznaczali*

... i niezależnie od tego, jakie byśmy wybrali funkcje `f : Z → X` i `g : Z → Y` ...  
albo: *jak byśmy oznaczyli `X`-y i `Y`-ki*`

... będzie *istniała* taka funkcja `h : Z → X × Y`, że `f = π₁ ∘ h` i `g = π₂ ∘ h`.  
albo: *oznaczymy w ten sposób jednoczesne oznaczenia `X`-ów i `Y`-ków*.

Skąd to wiemy? Stąd, że umiemy czytać ze zrozumieniem objaśnienia oparte na interpretacji zbiorów,
elementów i funkcji jako trzech aspektów oznaczania, jak również stąd, że umiemy udowodnić
odpowiednie twierdzenie, które mówi to samo w języku dedykowanym: Dla dowolnego `z ∈ Z`, istnieje
dokładnie jedna para `(x, y)` taka, że `f(z) = π₁((x, y))` i *jednocześnie* `g(z) = π₂((x,
y))`. Widzisz, że to musi być para uporządkowana `(f(z), g(z))`, i że para o takich wartościach
projekcji istnieje dla każdego `z ∈ Z`?  A więc tego rodzaju funkcja `h` *istnieje*. Co więcej, w
ten sposób scharakteryzowana funkcja *nie ma wyboru*, ponieważ, jak nakazują ptaszki na skrzydłach
tego anioła, dla każdego `z ∈ Z`, taka funkcja *musi* wybrać taką parę uporządkowaną `v ∈ X × Y`, że
`π₁(v) = f(z)` i jednocześnie `π₂(v) = g(z)`, a tylko jedna para, to jest `(f(z), g(z))`, spełnia
ten warunek. A zatem dla każdej pary funkcji `f : Z → X`, `g : Z → X`, funkcja `h : Z → X × Y`, dla
której ten diagram jest przemienny, czyli dla której `π₁ ∘ h = f` i `π₂ ∘ h = g`, *istnieje* i jest
zarazem *unikalna*, a więc *ta funkcja jest funkcją pary funkcji* `f` *i* `g`. Właśnie dlatego
możemy ją zapisać jako `⟨f, g⟩`.

Widzimy w ten sposób, że każda *para funkcji* `f` i `g` z dowolnego zbioru `Z` do członów dowolnego
iloczynu kartezjańskiego odpowiada *dokładnie jednej funkcji* `h` ze zbioru `Z` do tego iloczynu,
która "dzieli" te funkcje (to analogia do mnożenia), to jest która spełnia podwójny warunek `f = π₁
∘ h` i warunek `g = π₂ ∘ h`. I odwrotnie, każda funkcja `h` z dowolnego zbioru do iloczynu
kartezjańskiego odpowiada *unikalnej parze uporządkowanej* funkcji z tego zbioru do członów tego
iloczynu, pozwalającej narysować oba ptaszki; jest to po prostu para złożeńq `π₁ ∘ h` i `π₂ ∘ h`.

<hr>

**Filozofując**: Spróbujmy zobaczyć wyraźnie, a dzięki temu lepiej zrozumieć, co się właśnie stało.

Punktem wyjścia było pojęcie pary uporządkowanej *elementów* dwóch (dowolnych) zbiorów: `(x,
y)`. "Istotę" bycia taką parą uporządkowaną elementów można wyrazić warunkiem: `(x, y) = (x', y')`
wtedy i tylko wtedy, gdy `x = x` i `y = y'`. Takie pary były dla nas najpierw (dokładnie wszystkimi)
elementami *wewnątrz* pewnego specjalnego zbioru, który oznaczyliśmy jako `X × Y`.

Idąc tropem interpretacji zbioru jako *struktury służącej do swobodnego wyróżniania czy oznaczania
elementów*, a zatem również elementów jako arbitralnych oznaczeń, możemy popatrzeć na każdą parę
uporządkowaną `(x, y)` jako na niezależne oznaczenie czy wyróżnienie pary elementów, (wymienionego
jako) *pierwszego* należącego do zbioru `X` i (wymienionego jako) *drugiego* do zbioru `Y`. Czym
innym mogłoby być w tym kontekście `(x, y)`? 

Zwracam uwagę, że dokonaliśmy oto moim zdaniem *psychologicznie* ważnej zmiany sposobu myślenia.
Zamiast traktować pary uprządkowane jako *obce, zimne, abstrakcyjne byty, istniejące nie wiadomo
gdzie i jak*, które trzeba poznawać powoli i z wysiłkiem za pomocą trudnej matematyki, rozpoznaliśmy
w nich co prawda "zmechanizowane", a przez to może trochę mniej "ludzkie", ale jednak *nasze własne,
proste językowe narzędzie*, nadające się świetnie do bezmyślnie sprawdzalnego myślenia o pewnych
bardzo (hm) elementarnych sprawach.

A mówiąc dokładniej, korzystając z dopasowania między ...

1. sformalizowanym pojęciem elementu zbioru

2. *funkcjonalnym*, w znaczeniu *określonym przez rolę*, "istniejącym" na poziomie *interpretacji*
   albo dotyczącym *sposobu użycia* pojęciem swobodnego wyróżnienia/oznaczenia/wskazania

3. i "ucieleśniającą" albo "implementującą" w mechanicznym języku formalnym to ostatnie pojęcie
   konstrukcją funkcji z singletona

... widzimy, że arbitralna para uporządkowana elementów zbiorów `X` i `Y` to *funkcjonalnie* (nie
mylić z *funkcyjnie*) to samo, co arbitralna uporządkowana para funkcji z singletona do zbiorów `X`
i `Y` odpowiednio. W ten sposób zrealizowaliśmy w kodzie/wyraziliśmy w formalnym języku zbiorów i
funkcji *funkcjonalny* punkt widzenia na zbiór par uporządkowanych.

Ta fundamentalna zmiana była możliwa dzięki temu, że po drodze *zrezygnowaliśmy z pojęcia elementu
jako czegoś wewnątrz zbioru*, zamiast tego charakteryzując wszystko w "kategoriach kategoryjnych",
to jest w kategoriach zbiorów rozumianych jako punkty o bliżej nieokreślonej, a raczej *chwilowo
nieważnej* (bo przecież ją pamiętamy i traktowaliśmy ją jako ważny punkt wyjścia) strukturze
wewnętrznej. I tak oto, za sprawą przyjęcia i wyrażenia w kodzie tej nowej perspektywy, zbiory stały
się tylko jakimiś swobodnymi oznaczeniami, zatarła się różnica między pojęciami zbioru i funkcji, i
wszystko zostało scharakteryzowane funkcjonalnie, przez co mechanika formalnego języka zbliżyła się
do nieformalnego języka ról albo celów, albo do może abstrakcyjnie rozumianego, ale intuicyjnego
**zadania** *swobodnego oznaczania/wyróżniania*.

Ostatnim krokiem było uogólnienie tej charakteryzacji przez zastąpienie par funkcji z *singletona*
parami funkcji z *dowolnego* (tego samego) zbioru. Żeby dostrzec zasadność tego kroku wystarczy
zaobserwować, że pojęcie singletona jest co prawda ważne, ale nie do wszystkiego się nadaje. W
szczególności, to pojęcie nie jest konieczne, gdy chcemy scharakteryzować jakiś rodzaj zbioru w
kategoriach struktury relacji między tym zbiorem a wszystkimi innymi zbiorami. Wtedy potrzebne i
wystarczające okazuje się pojęcie *arbitralnej* funkcji, to jest arbitralnego *jednoczesnego*,
niekoniecznie jednoelementowego oznaczenia.

Zamiast tego:

```lean
X × Y := {(x, y) | x ∈ X ∧ y ∈ Y}

(x, y) = (x', y') ↔ x = x' ∧ y = y'
```

mamy teraz to:

```lean
π₁ : X × Y → X, π₂ : X × Y → Y

∀ f : Z → X, g : Z → Y

 ∃ ⟨f, g⟩ : Z → X × Y, (π₁ ⟨f, g⟩ = f) ∧ (π₂ ⟨f, g⟩ = g)

 (π₁ h = f) ∧ (π₂ h = g) → h = ⟨f, g⟩
```

Chociaż dla wygody albo z przyzwyczajenia nadal oznaczamy go w ten sam sposób - jako `X × Y`, a więc
jako pewien szczególny kategoryjny *punkt* - to teoriomnogościowy iloczyn kartezjański zastąpiliśmy
tak naprawdę scharakteryzowaną funkcjonalnie (a nie funkcyjnie) *parą współźródłowych strzałek*, to
jest parą projekcji, czyli - *gdy akurat punktami są zbiory a strzałkami są funkcje* - jednoczesnym
niezależnym podwójnym swobodnym oznaczaniem/wyróżnianiem.

To, *do czego używamy*, albo *w jakim celu* wprowadziliśmy formalną konstrukcję typu `(x, y)` *stało
się formalną strukturą*. Inaczej mówiąc *treść stała się formą*. Tak oto *tworząc matematykę
uzewnętrzniamy w postaci językowych mechanizmów nasze własne sposoby myślenia*.

<hr>

*Diagram*, który właśnie narysowałaś, możemy teraz *zinterpretować* jako konstrukcję *czysto
kategoryjną*. Wystarczy, że przyjmiemy alternatywną interpretację teoriomnogościowego symbolu
oznaczającego operację tworzenia iloczynów kartezjańskich zbiorów `×`. Możemy to zrobić, bo
dopuszczamy, o ile to można zrozumieć jednoznacznie ze względu na kontekst, przeciążania stałych, a
`×` to pewna stała (oznaczająca pewną operację). Wtedy na tym diagramie nie będzie już *żadnych*
symboli teoriomnogościowych, a więc zostanie sam język teorii kategorii, to jest tylko punkty
zaczepienia jako *jakieś* punkty, strzałki jako *jakieś* strzałki i własności dotyczące *jakiejś*,
spełniającej wymagania kategoryjnego składania strzałek, operacji.

Przyjmujemy więc definicję, zgodnie z którą *produktem kategoryjnym*, albo po prostu *produktem*,
będziemy nazywać każdy *punkt* (oficialnie: obiekt) wyposażony w *dwie* wychodzące z niego
*strzałki* (czyli tak naprawdę produktem będziemy nazywać pewne *pary strzałek o tym samym źródle*)
takie, że te strzałki zachowują się w opisany wyżej sposób, czyli jak *projekcje*, które są w
opisany wyżej sposób "narzędziem wiernego tłumaczenia" między strzałkami do produktu i parami
strzałek o tym samym źródle do punktów "na końcach" produktu. W ten sposób uzyskujemy *uniwersalną
definicję produktu*, której szczególnym przypadkiem jest każdy iloczyn kartezjański i która, jak się
później okaże, odpowiada między innymi pojęciu *koniunkcji w logice*.

**Sugestia**: To była jak sądzę najtrudniejsza część tego rozdziału, dlatego nie będę Ci sugerował,
jak podpisać ostatni rysunek, bo przypuszczam, że ta notatka będzie i tak ewoluowała w miarę Twoich
postępów w nauce. Niemniej zachęcam do stworzenia takiej notatki, być może posługując się przy tym
swobodnie elementami graficznymi i zapisując (co polecam) pytania, wątpliwości, czy jakiekolwiek
spostrzeżenia lub pomysły. I nie przejmuj się, jeżeli na razie niewiele rozumiesz z definicji
produktu kategoryjnego. Przekonasz się, że w pewnym technicznym sensie *musi* być trudno zrozumieć
tą definicję, nawet, a może nawet (hm) *zwłaszcza* znając różne przykłady konstrukcji, które do niej
pasują. A poza tym jeszcze przecież nie zaczęliśmy tej definicji do niczego *używać*.

### Przypisy

[^1]: A w pewnym sensie więcej niż dwuargumentową, bo ta funkcja, gdyby była zaimplementowana,
    musiałaby korzystać również z informacji o dziedzinach i przeciwdziedzinach funkcji, jak również
    z ich składalności, którą można akurat wyrazić odpowiednio określając typy parametrów (na
    przykład jako `(f : X → Y) (g : Y → Z)`, tak jak to zrobiliśmy definiując stałą `Zlozenie`).

[^2]: सबे सङ्खारा अनिच्चा ति, यदा पञ्ञाया पस्सति, अथा निब्बिन्दती दुखे – एष मगो विसुद्धियā
    ([Dhammapada](https://en.wikipedia.org/wiki/Dhammapada), wers 277).

[^3]: τῷ γὰρ ἔχοντι παντὶ δοθήσεται καὶ περισσευθήσεται· τοῦ δὲ μὴ ἔχοντος καὶ ὃ ἔχει ἀρθήσεται ἀπ'
    αὐτοῦ.  (Ewangelia według świętego Mateusza, 25:29). Chociaż wolę chyba wersję buddyjską - *To
    darczyńca powinien być wdzięczny*. Tylko niestety nie jestem w stanie `{∅} → Zrodlo` tego
    `cytat`-u, które spełniałoby (w "mojej" *ocenie*) predykat `Dobre`.

[^4]: Det är en referens till Pippi Långstrump
