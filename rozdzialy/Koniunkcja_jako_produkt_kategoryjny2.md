Zacznijmy może jeszcze raz od początku. Skoro `f` i `g` to dwie składane funkcje, to wyrażenie `g o
f` również oznacza pewną funkcję, a skoro funkcja `g o f` jest składalna z funkcją `h` (wiesz
dlaczego, prawda?), to `h o (g o f)` też oznacza pewną funkcję, bo to znowu jest *złożenie dwóch
składalnych funkcji*. 

Żeby udowodnić, że `h o (g o f) = (h o g) o f`, czyli, że lewa i prawa strona tej równości to ta(ka)
sama funkcja, musimy udowodnić, że `∀ x ∈ X, (h o (g o f))(x) = ((h o g) o f)(x)`. Zakładamy więc
najpierw, że mamy *jakiś* `x ∈ X`, bo udowodnić coś dla *jakiegoś*, czyli *bliżej nieokreślonego*,
czyli *arbitralnego* `x` znaczy dokładnie to samo, co udowodnić coś *dla każdego* `x`. Przecież
jeżeli dowód "działa" dla `x ∈ X`, o którym *nic poza tym nie założyliśmy*, to znaczy, że działa
*dla każdego* `x ∈ X`. Zapisując na kartce, że mamy jakiś `x ∈ X`, *wprowadzamy* więc `x ∈ X` *do
kontekstu* i *zaczynamy tworzyć półformalną λ-abstrakcję twierdzenia*, którą będziemy mogli potem
sami aplikować i ewaluować.

Musimy teraz tylko rozwinąć definicję składania (bo nie ma tu żadnej innej definicji, którą
moglibyśmy rozwinąć) tyle razy, ile będzie trzeba, przekształcając lewą stronę równania (będącą
wielokrotną aplikacją dwuargumentowej[^1] funkcji składania) do postaci ...

`(h o (g o f))(x) = h((g o f)(x)) = h(g(f(x))`

... i prawą stronę równania do postaci ...

`((h o g) o f)(x) = (h o g)(f(x)) = h(g(f(x)))`

... żeby zobaczyć, że obie funkcje dają ten sam wynik dla każdego `x ∈ X`, a więc:

`h o (g o f) = (h o g) o f`

**Sugestia**: Jeżeli jeszcze Ci się to nie udało, to może spróbuj teraz zrobić sama coś podobnego na
kartce, jak najmniej tu zaglądając?

Zwróć też proszę uwagę, że poza tym, że wspomniałem o możliwości definiowania funkcji za pomocą
rysunku, nie korzystaliśmy w tym rozdziale z założenia, że zbiory są skończone, bo poza wspomnianym
kontekstem ani raz nie powiedziałem niczego w rodzaju "Ponieważ zbiór `X` jest skończony, to ...". A
to znaczy, że *wszystkie* wymienione w tym rozdziale własności mają rownież funkcje między
*dowolnymi* zbiorami, a więc także *nie*skończonymi.

Czy widzisz na tym przykładzie, że warto *wiedzieć, z jakich założeń się korzysta*?  Dzięki temu
możemy poprawnie *ocenić, w jakich sytuacjach obowiązuje udowodnione zdanie*, czyli *kiedy możemy
używać tego zdania jako twierdzenia*. Gdy konstruowaliśmy dowody w języku teorii typów, w zasadzie
nie dało się nie mieć tej świadomości, ponieważ wtedy było widać jak na dłoni, z których założeń
korzystaliśmy, bo te występowały wszystkie jawnie, albo jako parametry każdego dowodu, albo w kodzie
dowodu jako funkcji. To jest kolejna ogromna zaleta pełnej formalizacji. Gdy jednak konstruujemy
dowody w bardziej nieformalny sposób, tak dobrze tego nie widać, dlatego warto wtedy zachować
czujność.

Gdybyśmy się teraz skupili na samych funkcjach i na tym, o czym mówiliśmy dotąd w tym rozdziale, to
można by to wszystko podsumować - stosując mam nadzieję w tym momencie już dla Ciebie oczywiste
skróty myślowe - jednym podwójnym równaniem i jednym pojedynczym:

1. `Id o f = f = f o Id`

2. `h o (g o f) = (h o g) o f`

## Pora na [odlot](https://pl.wikipedia.org/wiki/Odlot_(film_2009))

A teraz proszę wyobraź sobie, że zbiory to okręgi, z przeróżnymi, rozrzuconymi przypadkowo w środku
tych okręgów elementami, podobne do tych, które rysowałaś czytając poprzedni rozdział, a każda
funkcja to taki *strumień złożony ze strzałek*, płynący z jednego zbioru do drugiego. I wyobraź
sobie, że te zbiory i funkcje są narysowane na nieskończenie dużej kartce papieru, a Ty oddalasz się
coraz szybciej w górę, aż docierasz tak wysoko, że nie jesteś w stanie rozróżnić nic poza *punktami
zbiorów* i *strzałkami strumieni*.

Z tej abstrakcyjnej perspektywy mogłabyś zobaczyć wiele regularności, ale nie wszystkie, ponieważ
nie widziałabyś czegoś, czego nie da się dobrze narysować nie ujawniając wewnętrznej struktury
funkcji i zbiorów. Tym czymś, czego nie mogłabyś wtedy wyraźnie zobaczyć, byłoby to, co sprawia, że
przestrzeń zbiorów *żyje*, to jest nie widziałabyś *jak działa działanie składania*. 

Żeby zobaczyć *to*, trzeba mieć oczy anioła. Ja akurat nie mam i zgaduję, że Ty również nie
posiadasz (wybacz). Jeżeli nie jest się chwilowo w posiadaniu oczu anioła, w ostateczności można
nabyć ich protezę i próbować wypatrzyć, co tylko się da, to znaczy próbować *wyprowadzać
dedukcyjnie* rozmaite *wnioski posługując się językiem teorii kategorii*.

## Tak się składa

**Rysunek 1**: `Narysuj` proszę trzy, tworzące poziomy szereg punkty i oznacz je od dołu literami
`X`, `Y` i `Z`. Dodaj `Strzalka X Y` i oznacz ją literą `f` i `Strzalka Y Z` i oznacz ją literą
`g`. Ponieważ jesteś tak wysoko, nie jesteś w stanie zobaczyć strzałek wychodzących z poszczególnych
elementów, ale widzisz funkcje - jako *pojedyncze* strzałki między punktowymi zbiorami - a ponieważ
masz protezę genialności, widzisz też *czasami* (bo to tylko proteza), które strzałki składają się w
które i które strzałki można złożyć z których strzałek.

Strzałki `f` i `g` są `Skladalne`, a więc musi istnieć ich unikalne `Zlozenie`, to jest taka funkcja
`h`, która jest funkcją `(g ∘ f)`, czyli dla której spełniony jest warunek `∀ x ∈ X, h(x) = (g ∘
f)(x)`. Tego nie musisz próbować *zobaczyć*, bo to możesz *wywnioskować* z definicji
funkcji. Dorysuj więc od dołu `Strzalka X Z`, ale taką wygiętą w łuk, i oznacz ją literą `h`, a
potem umieść w środku uzyskanego w ten sposób diagramu ptaszka.

Jest tam teraz ptaszek, bo mocą naszej *decyzji* (a więc to jest *założenie*) dotyczącej tego, co
oznacza `h`, ten diagram jest *przemienny*, co możemy zapisać algebraicznie również jako `Zlozenie f
g = h`. Ten ptaszek i odpowiadające mu równania w dwóch różnych językach (`Zlozenie f g = h` będzie
niebawem poprawnym termem w języku teorii typów), to przykład czegoś, czego nie da się zobaczyć na
samym [*grafie*](https://pl.wikipedia.org/wiki/Graf_(matematyka)) reprezentującym zbiory i funkcje
między nimi, ponieważ grafy, choć czasem mogą się kojarzyć z rozmaitymi procesami, są jednak
strukturami *statycznymi*, a składanie strzałek jest (w pewien sposób) dynamicznym (wybrednym)
*działaniem*. Dlatego z wysokości, na której się aktualnie znajdujesz, nie zobaczysz tego nawet
patrząc przez magiczne okulary, a więc wszystkie informacje na temat (ro)\{z/s\}kładania się
funkcji, poza uniwersalnymi włanościami tego działania, musisz odtąd albo *założyć* albo
*wywnioskować*.

Tego, że każdy zbiór ma jedną identyczność, nie musisz próbować zobaczyć (ani nawet zakładać), bo
*wiesz* (to jest jedna z tych uniwersalnych własności), że dla każdego zbioru `X` można zdefiniować
taką funkcję `Id_X`, że `∀ x ∈ X, Id_X(x) = x` i wiesz, że dla każdego zbioru istnieje dokładnie
jedna taka funkcja. Nie musisz też nigdy próbować zobaczyć (ani zakładać), że różne zbiory mają
różne identyczności, bo *wiesz* (z definicji), że o tożsamości funkcji decyduje między innymi jej
dziedzina i przeciwdziedzina. 

Nie musisz więc wytężać wzroku (ani się dłużej zastanawiać), żeby się przekonać, że każdy punkt ma
swoją *unikalną* i *charakterystyczną* endostrzałkę identycznościową. A to znaczy, że istnieje
izomorfizm między zbiorami i identycznościami, a to z kolei znaczy, że zamiast mówić o zbiorach
możemy równie dobrze mówić o identycznościach. Zresztą kto wie, może jeszcze z tego skorzystamy.

Wiesz jeszcze dwie ważne rzeczy. Po pierwsze, dla każdej strzałki `f` jest zawsze prawdą, że `Id ∘ f
= f = f ∘ Id`. W przypadku zbiorów i funkcji ten warunek, odpowiadający koniunkcji zdań `Id ∘ f = f`
i `f = f ∘ Id` (a więc moglibyśmy go zapisać również jako `Id ∘ f = f ∧ f = f ∘ Id`, jednak wtedy
trochę schowałaby się nam sugestia, że na mocy przemienności równości również `Id ∘ f = f ∘ Id`),
gdzie pozwoliłem sobie na skrót myślowy i nie zaznaczyłem, że pierwsza i ostatnia identyczność są
przyczepione do *potencjalnie* różnych punktów, jest spełniony, ponieważ gdybyś zmniejszyła swoją
wysokość, (jak już wiesz z poprzedniego rozdziału) zobaczyłabyś, że:

`∀ x ∈ X, (Id ∘ f)(x) = Id(f(x)) = f(x) = f(Id(x)) = (f ∘ Id)(x)`

A więc `Id ∘ f = f = f ∘ Id`.

To jest (nawiasem mówiąc) kolejny dowód przedstawiony nieco nonszalancko w postaci *jednego
wielokrotnie złożonego zdania*, w ramach którego akurat rozwijamy, a następnie zwijamy (a może
raczej "owijamy"?) definicje identyczności i składania. 

A po drugie, jeżeli `f : X → Y`, `g : Y → Z` i `h : Z → V`, to jeżeli `x ∈ X`, to ...

`(h ∘ (g ∘ f))(x) = h((g ∘ f)(x)) = h(g(f(x))) = (h ∘ (g(f(x)))) = ((h ∘ g) ∘ f)(x)`

A więc gdy punkty są zbiorami i strzałki są funkcjami między tymi zbiorami, to o ile złożenia, które
pojawiają się poniżej są możliwe, jest zawsze prawdą, że:

1. `Id ∘ f = f = f ∘ Id`

2. `h ∘ (g ∘ f) = (h ∘ g) ∘ f`

Dowód "złożeniowej neutralności" identyczności jest łatwy, a poza tym ta "neutralność" jest jak
sądzę już dla Ciebie oczywista. Zgaduję jednak, że ten ostatni dowód mógł być dla Ciebie trochę
trudny, ale tylko z powodu licznych, rozmaicie pozagnieżdżanych nawiasów, które trzeba zapisać, żeby
w nim poprawnie operować operacją (ech) składania funkcji. Można jednak uprościć ten zapis
wprowadzając dodatkowe definicje, w podobny sposób, w jaki będziemy to robić od pewnego momentu
dowodząc bardziej skomplikowanych twierdzeń w Leanie.

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

Podoba mi się ten ostatni sposób, a Tobie?. Chociaż przyznam, że nie jest dla mnie jasne, czy
cokolwiek tu upraszcza, To może jeszcze zrobimy coś podobnego, tylko w Leanie? W tym celu
zastosujemy taktykę `rfl`, o której jeszcze nie mówiłem. Ta taktyka automatycznie konstruuje między
innymi dowody, które polegają na wykazywaniu, że dwa wyrażenia są równe po zredukowaniu, czyli z
definicji (liczba mnoga). Zaczniemy od ilustracji:

```lean
-- Używamy tutaj parametrów opcjonalnych, które wprowadzamy do definicji funkcji otaczając je nawiasami
-- klamrowymi. *Możemy* tak zrobić, ponieważ Lean może je wywnioskować z pozostałych argumentów 
-- aplikacji tej funkcji. *Chcemy*, żeby były opcjonalne, bo dzięki temu będziemy mogli później (znacznie)
-- mniej pisać i kod będzie (znacznie) bardziej czytelny.
def Zlozenie {X Y Z : Type} (f : X → Y) (g : Y → Z) : X → Z := 
  -- Tak wiem, ta zmiana kolejności jest irytująca.
  fun (x : X) => g (f x)

-- Dla dowolnych *typów* X, Y, Z i V ...
variable (X Y Z V : Type)

-- ... i funkcji f, g, h, które są na mocy samej takosamości niektórych występujących w ich specyfikacjach
-- typów, to jest typów Y i Z, kolejno parami składalne (wiesz o co mi chodzi, prawda?) ...
variable (f : X → Y) (g : Y → Z) (h : Z → V) -- tak też można

-- ... to ...
Zlozenie f (Zlozenie g h)

-- ... redukuje się do tego ...
fun (x : X) => (Zlozenie g h) (f x)

-- .. a tamto do tego ...
fun (x : X) => (fun (y : Y) => h (g y)) (f x)

-- .. a tamto do tego (tam jest jedna aplikacja, zauważyłaś?):
fun (x : X) => h (g (f x)))

-- Natomiast to ...
Zlozenie (Zlozenie f g)  h

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
variable (X Y Z V : Type) (f : X → Y) (g : Y → Z) (h : Z → V) -- tak też można

-- Trzeba było tak od razu, prawda?
Zlozenie f (Zlozenie g h) = Zlozenie (Zlozenie f g) h := by rfl

-- W ten sam sposób możemy udowodnić przemienność wbudowanej w Leana operacji składania funkcji
-- teoriotypowych. Symbol składania uzyskasz w Leanie wpisując \o
example : h ∘ (g ∘ f) = (h ∘ g) ∘ f := by rfl

-- To może jeszcze (podwójny) dowód, że identyczności zachowują się jak elementy neutralne ze względu
-- na operację składania funkcji? Proszę bardzo:
example : (fun (y : Y) => y) ∘ f = f := by rfl 
example : f ∘ (fun (x : X) => x) = f := by rfl 

-- To było mało czytelnie? No to dodamy odrobinę lukru składniowego. Funkcja ID dla podanego typu tworzy 
-- funkcję identycznościową z tego typu do niego samego.
def ID (typ : Type) : typ → typ := fun (a : typ) => a

example : (ID Y) ∘ f = f := by rfl
example : f ∘ (ID X) = f := by rfl

-- Przy okazji odkryliśmy więc, że wewnątrz teorii typów przez cały ten czas ukrywała się co najmniej jedna
-- *kategoria*, a konkretnie kategoria typów typu Type i funkcji między tymi typami. Ale o tym, czy jest 
-- (każda) kategoria, powiemy sobie nieco później.
```

Pomijając chwilowy powrót do Leana, z oddalenia widzimy więc (a tak naprawdę wiemy z definicji
\{liczba mnoga\})), że teoriomnogościowe identyczności są *elementami neutralnymi ze względu na
operację składania funkcji*. Można powiedzieć, że ze względu na operację składania istnieje tutaj
nieskończenie wiele - bo dokładnie tyle, ile jest zbiorów - *zer* albo *jedynek*, zależnie od wyboru
analogii między składaniem i operacjami dodawania lub mnożenia. To po pierwsze.

A po drugie, podobnie jak dodawanie i mnożenie liczb, bez zaglądania do struktury wewnętrznej
funkcji wiemy, że *składanie funkcji jest łączne*, co znaczy, że zapisując złożenie więcej niż dwóch
funkcji *można* w ogóle *nie stosować nawiasów* i *nie ma znaczenia*, w jakiej *kolejności* będziemy
*stosować operację składania* (nadal jednak w ogólnym przypadku *ma* oczywiście znaczenie, *w jakiej
kolejności podamy argumenty* tej operacji).

"Podsumowując dotychczasowe rozważania" (co?!), z wysokości, na której się teraz znajdujemy i z
której nie widać ani wewnętrznej struktury zbiorów, ani wewnętrznej struktury teoriomnogościowych
funkcji, widzimy / wiemy między innymi, że:

1. Istnieją *punkty* (zbiorów), które dla nas są tylko *punktami zaczepienia strzałek*.

2. Istnieją *strzałki*, w których nie jesteśmy w stanie z tej wysokości zobaczyć żadnej
   *wewnętrznej* struktury.

3. Istnieje wybredna w znany Ci już sposób *operacja składania strzałek*.

4. Każdy punkt ma swoją *unikalną* i *charakterystyczną (endo)strzałkę (czyli pętlę)
   identycznościową*.

5. Identyczności są elementami neutralnymi ze względu na operację składania: `Id ∘ f = f = f ∘ Id`.

6. Składanie jest łączne: `h ∘ (g ∘ f) = (h ∘ g) ∘ f = h g f`.

W ostatnim punkcie pozwoliłem sobie skorzystać z możliwości pozbycia się nawiasów - bo składanie
jest łączne - i z uproszczenia polegającego na pozbyciu się również symbolu `∘`. W praktyce zwykle
używamy właśnie tej notacji, bo składanie jest w teorii kategorii operacją podstawową i nie lubimy
niepotrzebnie dużo pisać.

I w ten oto sposób, zmierzając razem ze mną powoli okrężną drogą do pojęcia [*logicznej
alternatywy*](https://pl.wikipedia.org/wiki/Alternatywa),
[poznałaś](https://atkinsbookshelf.wordpress.com/tag/what-does-it-mean-to-miyagi-someone/) [sześć
*aksjomatów kategorii*](https://pl.wikipedia.org/wiki/Teoria_kategorii).

## Acha, fajnie, ale *dlaczego*? Czyli w tym [wypadku](https://sjp.pwn.pl/sjp/wypadek;2540057.html) *po co*?

Skoro zaczęłaś się już trochę oswajać z kategoryjnym punktem widzenia, przyszedł czas, żeby z tego
skorzystać. Zgaduję, że w tym momencie aksjomaty kategorii kojarzą Ci się bardzo z konkretnymi
przykładami zbiorów i funkcji, bo przecież od takich przykładów zaczęliśmy. Będziesz się odrywać od
tego znajomego kontekstu w dwóch krokach, a właściwie w dwóch
[przelotach](https://pl.wikipedia.org/wiki/Przelot).

Pokażę Ci, że pewne znane Ci już, ważne obiekty, konstrukcje i własności *teoriomnogościowe*, takie
jak element zbioru (sic!), tożsamość funkcji, izomorficzność, injektywność i surjektywność funkcji,
podzbiór, podział zbioru (na wyczerpujące i rozłączne *pod*zbiory), zbiór pusty, singleton, iloczyn
kartezjański i suma rozłączna zbiorów, można jakby na nowo rozpoznać jako kategoryjne *struktury
strzałkowe* i że to jest w pewnym sensie *lepszy*, bo bardziej *uniwersalny* sposób mówienia o tych
obiektach, konstrukcjach i własnościach. Niejako przy okazji zaczniesz też stopniowo w bardziej
elastyczny sposób myśleć o "takosamości" matematycznych struktur. W międzyczasie (swoją drogą, co za
tajemnicze słowo), skorzystamy z kilku sposród tych alternatywnych, uniwersalnych kategoryjnych
definicji, żeby w nowy sposób popatrzeć na *logikę*.

**Element zbioru jako pojęcie strzałkowe**: Dla każdego zbioru `X`, istnieje oczywisty *izomorfizm*
między funkcjami z dowolnego singletona, na przykład ze zbioru `{∅}`, do `X` i *elementami*
należącymi do `X`. Każda taka funkcja wskazuje przecież dokładnie jeden element `x` zbioru `X` i
odwrotnie, każdy taki element odpowiada dokładnie jednej takiej funkcji. *Wszystko*, co tylko da się
powiedzieć o elementach zbiorów, można więc powiedzieć o takich funkcjach i vice versa.

Na przykład, jeżeli `x ∈ X`, to istnieje *funkcja* `x`, a więc również strzałka w naszej kategorii,
taka, że `x : {∅} → X` i `x(∅) = x`. Nazwanie tej funkcji również literą `x` jest co prawda może
trochę nonszalanckie, ale *nie* jest poważnym błędem, bo ta *decyzja* ma charakter *metajązykowy* i
mimo pojawiającej się z tego powodu dwuznaczności - i "dwutypowości"! - symbolu `x`, sposób użycia
pozwoli nam zawsze jednoznacznie stwierdzić, czy chodzi o element zbioru, czy o funkcję. Niestety, w
niektórych sytuacjach to może być jednak zbyt mylące. Na przykład, gdyby chodziło o element będący
liczbą `1`, to zapis `1(∅) = 1` mógłby sugerować, że mamy do czynienia z mnożeniem, a gdyby chodziło
o wskazanie za pomocą funkcji z singletona elementu będącego zbiorem pustym, uzyskalibyśmy wyjątkowo
dezorientujące zdanie ``∅(∅) = ∅``. Dlatego najlepiej korzystać z tej konwencji oznaczając elementy
zbiorów zmiennymi, takimi jak `x`.

Celowe wprowadzanie tego rodzaju dwuznaczności nazywamy w informatyce (i w matematyce zresztą też)
[*przeciążaniem*](https://pl.wikipedia.org/wiki/Przeci%C4%85%C5%BCanie_funkcji). Co prawda
oficialnie ten termin dotyczy tylko przeciążania *nazw funkcji* albo *nazw metod* (metody to też
pewne funkcje jako programy, tyle, że określonego rodzaju), ale jest przecież oczywiste, że ten sam
manewr można zastosować, z tego samego powodu (a dokładniej w tym samym celu) - to jest aby
podkreślić jakieś głębsze podobieństwo albo bliski związek - do dowolnych stałych. A chcemy
podkreślić ścisły związek między elementami zbioru `X` i tego rodzaju funkcjami, ponieważ -
przynajmniej na tym etapie - chcemy, żeby różnica między tymi dwoma rodzajami obiektów stała się
*mniej* widoczna. To jest więc kolejny przykład *celowej wieloznaczności* albo *wieloznaczności pod
kontrolą*. Spróbuj sama odgadnąć, co w tym kontekście znaczy zdanie `x(∅) = x` i pamiętaj proszę, że
nigdzie się nie spieszymy. Na wypadek, gdybyś potrzebowała dodatkowych wyjaśnień, znajdziesz je
[tutaj](Koniunkcja_jako_produkt_kategoryjny_element_x_jako_funkcja.md).

**Singleton z perspektywy kategoryjnej**: Każdy zbiór jednoelementowy `T` (dlaczego akurat `T`
wyjaśnię później) ma własność strzałkową polegającą na tym, że dla każdego zbioru `X` istnieje
dokładnie jedna funkcja (czyli w tym momencie kategoryjna strzałka) z `X` do `T`. I odwrotnie,
jeżeli zbiór `Y` ma taką własność, że dla każdego zbioru `X` istnieje dokładnie jedna funkcja z `X`
do `Y` to `Y` musi być zbiorem jednoelementowym.

**Zbiór pusty z perspektywy kategoryjnej**: Każdy zbiór pusty `I` (dlaczego akurat `I` wyjaśnię
później) ma własność strzałkową polegającą na tym, że dla każdego zbioru `X` istnieje dokładnie
jedna funkcja (czyli w tym momencie kategoryjna strzałka) z `I` do `X`. I odwrotnie, jeżeli zbiór
`Y` ma taką własność, że dla każdego zbioru `X` istnieje dokładnie jedna funkcja z `Y` do `X`, to
`Y` musi być zbiorem pustym. Tak się akurat składa, że istnieje dokładnie jeden zbiór pusty, ale to
nie sprawia, że dwa ostatnie zdania są fałszywe.

**Iloczyn kartezjański zbiorów z perspektywy kategoryjnej**: Niech `X = {1, 2}` i `Y = {a,
b}`. Wtedy każdy element zbioru `X Y`, taki jak na przykład `(2, a)`, można równie dobrze opisać
jako taki *element, którego pierwszym elementem jest* `2` *a drugim* `a`. Napisałem celowo "element"
zamiast "para uporządkowana". Żeby można było mówić w ten sposób o parach uporządkowanych musimy
wprowadzić pojęcia elementu pierwszego i elementu drugiego pary. A to są przecież pewne funkcje
surjektywne ze zbioru `X x Y` do zbiorów `X` i`Y` odpowiednio. Pisałaś o tego rodzaju funkcjach,
nazywając je *projekcjami*, w komentarzu pod jednym z rysunków z poprzedniego rozdziału. Jesteśmy
już bliżej kategoryjnego odpowiednika iloczynu zbiorów, ale jeszcze nie uchwyciliśmy "istoty" tego
pojęcia za pomocą samych kategoryjnych strzałek (i operacji składania). Niestety nie potrafię opisać
prostego rozumowania, które prowadziłoby do tej definicji, dlatego muszę ją przedstawić jako
rezultat *wglądu*, to jest jako coś, co zostało częściowo przypadkowo przez kogoś kiedyś *odkryte*.

**Rysunek**: `Narysuj` proszę punkt `X x Y` i strzałki `pi1 : X x Y -> X` i `pi2 : X x Y -> Y`, ale
tak, żeby `pi1` była skierowana w lewo a `pi2` w prawo. Nad tymi dwoma ramionami, powyżej punktu `X
x Y`, narysuj punkt `Z` i dodaj jeszcze strzałki `f : Z -> X` i `g : Z -> Y` i może niech będą lekko
wygięte w taki sposób, żeby powstało coś przypominającego spiczastą czapkę. Wreszcie linią przerywaną
`Narysuj` strzałkę z punktu `Z` do punktu `X x Y`, a obok niej zapisz `E^1`.

wychodzącą z punktu `X x Y` w lewą stronę i
wskazującą na punkt `X` i strzałkę `pi2` wychodzącą z tego samego punktu co `pi`, ale w prawo i
wskazującą punkt `Y`.

STARE

Do każdego punktu musi być również przyczepiona unikalna
[*pętla*](https://pl.wikipedia.org/wiki/P%C4%99tla_(teoria_graf%C3%B3w)) reprezentująca
*identyczność*. Ponieważ te funkcje odgrywają szczególną rolę, jeżeli możesz, oznacz je proszę przy
każdym punkcie albo liniami przerywanymi, albo innym kolorem.

Na to, co wcześniej nazywałem kategoryjnymi punktami, zwykle używa się nazwy *obiekt*, jednak
zależało mi, żebyś pamiętała, że *w teorii kategorii* obiekty to *tylko punkty zaczepienia
strzałek*. Strzałki w tej teorii nazywamy często *morfizmami* albo *odwzorowaniami*, ale również i
te nazwy, podobnie jak słowo *obiekt*, oddają dobrze *genezę* teorii kategorii, za to *nie* oddają
dobrze *uniwersalności jej zastosowań* i sposobu, w jaki jej zwykle *używamy*.

Wiedząc już o mylącym charakterze tych słów, pod rysunkiem napisz komentarz: *W teorii kategorii
każdy obiekt jest wyposażony w endomorfizm identycznościowy*. *Można też powiedzieć tak: Każdy punkt
kategoryjny ma identycznościową endostrzałkę, a właściwie każdy punkt można utożsamić z tego rodzaju
strzałką, bo każdemu punktowi odpowiada dokładnie jedna, "przyczepiona" do niego identycznościowa
endostrzałka, a każdej takiej strzałce odpowiada dokładnie jeden punkt, do którego ta strzałka jest
przyczepiona*.

Można więc powiedzieć, że kategorie to takie struktury, w których może występować *wiele różnych
zer* - jeżeli popatrzymy na składanie strzałek jako na operację podobną do dodawania - albo
*jedynek* - jeśli popatrzymy na składanie strzałek jako na operację podobną do mnożenia. Trzeba
jednak pamiętać, że dodawanie i mnożenie są operacjami niewybrednymi, a składanie może być wybredne
i zwykle zresztą jest. Skoro zapisałaś już komentarz (być może po swojemu, to była przecież tylko
sugestia) i już wiesz, że używamy słowa *punkt* w sposób *niestandardowy*, będę tak nadal mówił, bo
mam wrażenie, że tak Ci będzie łatwiej o tym konsekwentnie myśleć; sam zresztą odkryłem dopiero
niedawno, że mi to pomaga.

Morfizmy w teorii kategorii (czyli kategoryjne strzałki) nazywamy *endomorfizmami* (od
starogreckiego [ἔνδον](https://en.wiktionary.org/wiki/%E1%BC%94%CE%BD%CE%B4%CE%BF%CE%BD)
oznaczającego *w* albo *wewnątrz* \{i wtedy raczej nie nazywamy ich "endostrzałkami", bo to chyba
nie brzmi dobrze, ale ja to nawet lubię\}) *wtedy i tylko wtedy*, gdy są właśnie takimi "zawijasami"
jak identyczności (ale istnieją też inne endomorfizmy, które nie są identycznościami), to znaczy,
gdy mają *to samo źródło i cel*.

Żeby coś, co nie jest opisane czy scharakteryzowane jawnie jako kategoria zasługiwało (z pewnego
punktu widzenia!) na nazwę kategoria, musi istnieć *opis struktury tego czegoś w języku punktów i
składalnych w pewien określony sposób strzałek*. Podkreślam, że nie trzeba panikować, bo znowu będę
się powtarzał i omówię później szczegółowo kilka prostych przykładów. Żeby rozpoznać w jakiejś
strukturze pewną kategorię, czyli poprawnie opisać tą strukturę jako kategorię, ten opis musi
spełniać następujące wymagania:

1. Wszystkie części określonego rodzaju traktujemy jako punkty ...

2. ... i wszystkie części określonego rodzaju traktujemy jako strzałki, w ten sposób, że ...

3. ... każdy punkt ma swoją endostrzałkę identycznościową i ...

4. .. istnieje operacja na obiektach źrodłowych (to jest będących częściami struktury tego czegoś,
   co opisujemy jako kategorię), która odpowiada *składaniu strzałek* i którą oznaczamy czasem
   (podobnie jak w języku teorii mnogości) za pomocą symbolu `∘`, taka, że dla dowolnych (a więc też
   potencjalnie równych, to jest zastępowalnych parami) strzałek `f`, `g` i `h` (uwaga, będą skróty
   myślowe):

    4-1. `Id ∘ f = f = f ∘ Id`
    
    4-2. `h ∘ (g ∘ f) = (h ∘ g) ∘ f`

Zacząłem tutaj stosować skróty myślowe polegające na tym, że nie zaznaczyłem, że strzałki, o
złożeniach których coś mówimy, muszą być składalne. A mówiąc dokładaniej, (celowo) pominąłem
*konieczny* warunek *Jeżeli `f`, `g` i `h` to takie strzałki, że* `Skladalne f g` *i* `Skladalne g
h`, *to ...*. Nie oznaczyłem też nazw punktów, do których muszą być "przymocowane" wszystkie
strzałki identycznościowe, a więc symbol `Id` oznacza tutaj strzałkę przyczepioną do *dwóch,
potencjalnie różnych obiektów źródłowych* i jednocześnie *dwa, potencjalnie różne punkty* (bo każda
identyczność jest przyczepiona do dokładnie jednego punktu i każdy punkt ma dokładnie jedną
identyczność).

Dlaczego potencjalnie różne punkty? Jeżeli źródło strzałki `f` wymienionej w punkcie 4-1 jest różne
od jej celu (co nie znaczy, że obiekty, które te punkty w danej sytuacji oznaczają, są na pewno
różne), to pierwsza z lewej identyczność musi być "zaczepiona" o inny punkt niż pierwsza z prawej. A
zastosowałem te skróty myślowe, bo już wiesz, że w teorii kategorii, tak samo jak w teorii mnogości,
operacja składania jest wybredna i często będzie nam obojgu wygodniej tylko o tym *pamiętać*,
zamiast uwzględniać to jawnie w zapisie. Tak jak Lean, tego rodzaju informacje będziesz przecież
mogła wywnioskować z kontekstu.

Ponieważ składanie jest w teorii kategorii nie tylko operacją podstawową, ale również pojęciem
centralnym, wygodnie jest jeszcze bardziej skrócić zapis i zamiast `g ∘ f` pisać `g f`, albo nawet -
gdy nie ma wątpliwości, co oznacza taki zapis - `gf`.

Mamy teraz wszystkie narzędzia, żeby w dopiero co omawianej przestrzeni zbiorów skończonych i
funkcji między zbiorami skończonymi rozpoznać pewną kategorię.

Jeżeli:

1. Każdy zbiór oznaczymy jako kategoryjny punkt.

2. Każdą funkcję oznaczymy jako kategoryjną strzałkę, w taki sposób, że źródło tej strzałki to
   dziedzina tej funkcji, a cel tej strzałki to przeciwdzidzina tej funkcji.

3. Różne zbiory będą odpowiadały różnym punktom.

4. Różne funkcje będą odpowiadały różnym strzałkom.

5. *Funkcje* identycznościowe, czyli funkcje $i$ takie, że $i$ jest funkcją z pewnego zbioru $X$ do
tego samego zbioru i $i(x) = x$, będą odpowiadały strzałkom identycznościowym.

6. Składanie *funkcji* będzie odpowiadało składaniu *strzałek*

7. I nie będzie innych punktów ani strzałek.

... to uzyskamy w ten sposób kategorię, a dokładnie *kategorię zbiorów skończonych* o nazwie
[`FinSet`](https://en.wikipedia.org/wiki/FinSet). Wszystkie te przyporządkowania możemy traktować
jako *tymczasowe definicje kategoryjnych punktów i strzałek traktowanych jako stałe*.

Upewnimy się teraz, czy wszystkie wymagania kategorii są spełnione:

1. Każdy punkt ma swoją identyczność.

2. Dla każdej strzałki `f`, warunek `Id ∘ f = f = f ∘ Id` jest spełniony w oczywisty sposób, bo
   kategoryjne składanie odpowiada teraz składaniu funkcji teoriomnogościowych i kategoryjne
   identyczności odpowiadają identycznościom teoriomnogościowym, a więc rozpakowując definicje
   symboli `Id`, `f` i `∘` moglibyśmy się łatwo przekonać, że ze względu na te definicje zdanie `Id
   ∘ f = f = f ∘ Id` jest prawdziwe.

3. Z tego samego powodu dla każdej trójki niekoniecznie różnych i składalnych w ten sposób strzałek
   zachodzi `h ∘ (g ∘ f) = (h ∘ g) ∘ f`.

Uzyskaliśmy więc pewną *wierną* (w znaczeniu zachowującą różnice między symbolami) *implementacją
kategorii, zrealizowaną za pomocą zbiorów skończonych i funkcji między tymi zbiorami*.

TODO Że mogłem proces konstruowania tego opisu opisać w drugą stronę, to jest od kategorii, ale
wydaje mi się, że tak jest na początku lepiej o tym myśleć.

Być może przyszło Ci do głowy, że to wszystko było niepotrzebne, bo przecież to jest jakby *kopia*
przestrzeni zbiorów skończonych i funkcji między nimi, zmieniliśmy tylko język na taki jakby
bardziej graficzny (a mówiąc dokładniej na język [*grafów
skierowanych*](https://pl.wikipedia.org/wiki/Graf_skierowany) uzupełniony o operację składania
(zawsze skierowanych i tylko tych składalnych)
[*krawędzi*](https://pl.wikipedia.org/wiki/Kraw%C4%99d%C5%BA_grafu)). *I tak i nie*.

Otóż w ten sposób *całkowicie pomijamy* **wewnętrzną** *strukturę zbiorów i funkcji*, bo przecież
każdy zbiór zredukowaliśmy do jakiegoś punktu zaczepienia a każdą funkcję do jakiejś całkowicie
pozbawionej wewnętrznej struktury strzałki. A więc *odarliśmy przestrzeń zbiorów skończonych i
funkcji ze wszystkiego za wyjątkiem samej operacji składania funkcji*. 

TODO Fragment teorii typów jako kategoria.


I w tym momencie nieuchronnie pojawia się pytanie - *po co?*



GDZIE INDZIEJ Na przykład, Jeżeli zbiór jednoelementowy `{∅}` oznaczyliśmy jako `X`, a zbiór `{1, 2}` jako `Y`,
   
Zwróć uwagę, że to jest *izomorfizm*, ponieważ każdemu zbiorowi odpowiada pewien punkt, różnym
zbiorom odpowiadają różne punkty, każdej funkcji odpowiada pewna strzałka, różnym funkcjom
odpowiadają różne strzałki, i te nasze punkty i strzałki to *tylko* takie punkty i strzałki, których
używamy do mówienia w pewien sposób o zbiorach i funkcjach. Ponieważ to jest (patrz punkt 6)
izomorfizm *respektujący strukturę*, a dokładniej respektujący własności operacji składania (zarówno
funkcji jak i strzałek, bo izomorfizm *działa w obie strony*, pamiętasz?), to *może się wydawać*, że
poza terminologią nic się nie zmieniło.

To jest, nawiasem mówiąc, cecha wszystkich izomorfizmów, tylko nie zawsze tak bardzo rzuca się w
oczy. Można powiedzieć, że zmieniając opis na opis izomorficzny (czyli "równokształtny", pamiętasz?)
mówimy ("strukturalnie") dokładnie to samo, tylko w inny sposób. Coś się jednak zmieniło, ale trochę
mi zajmie, zanim będę Ci mógł pokazać co.

Patrząc w ten sposób na przestrzeń zbiorów skończonych i funkcji jako na kategorię *ignorujemy
strukturę zbiorów i funkcji* i *skupiamy się* na samej *operacji składania*, a dzięki temu skupiamy
się na tym, jaką *rolę* odgrywają zbiory w przestrzeni zbiorów skończonych. Zgaduję, że nie możesz
się doczekać przykładów. Będę teraz pisał używając dwóch różnych czcionek. Gdy będę pisał w języku
teorii mnogości, będzie to wyglądało na przykład tak: $X, f(x)$. Gdy będę pisał w języku teorii
kategorii będzie to wyglądało na przykład tak: `X, f`.

Dla każdego zbioru jednoelementowego $T$ i każdego zbioru $S$ (łącznie z $T$!), istnieje dokładnie
jedna funkcja $f : S → T$, bo każda taka funkcja "*nie ma żadnego wyboru*", musi przecież gdzieś
posłać każdy element swojej dziedziny (bo jest funkcją), a przeciwdziedzina ma tylko jeden
element. I odwrotnie, jeżeli zbiór $T$ ma taką własność, że dla każdego zbioru $S$ istnieje
dokładnie jedna funkcja $f : S → T$, to zbiór $T$ musi być zbiorem jednoelementowym, bo gdyby $T$
był zbiorem pustym, to na przykład $f : \set{1, 2, 3} → T$ nie mogłoby istnieć, a gdyby $T$ miało
więcej niż jeden element, to dla każdego niepustego zbioru $S$ istniałyby różne funkcje posyłające
$S$ w $T$.

A to oznacza, że zbiory jednoelementowe to *dokładnie* takie *punkty*, do których wchodzi dokładnie
jedna strzałka od każdego punktu.

Teraz $f$ i $g$ oznaczają (niekoniecznie różne) *funkcje* (a więc posługujemy się językiem zbiorów i
funkcji, dlatego zmieniłem czcionkę): *Teoriomnogościowym* złożeniem $f$ i $g$ nazywamy funkcję,
którą oznaczamy jako $g ∘ f$ (a oznaczamy ją tak, bo jest *wynikiem teoriomnogościowego składania*
tych dwóch funkcji), taką, że że $(g ∘ f)(x) := g(f(x))$.  
(Zwracam uwagę, że znowu zastosowałem skrót myślowy, polegający na tym, że nie wspomniałem o
wymaganiu składalności, a to wymaganie obowiązuje również w teorii mnogości).

Teraz `f`, `g` i `h` oznaczają strzałki w *kategorii zbiorów skończonych* (czyli są kategoryjnymi
strzałkami, ale jednocześnie mają już dla nas objaśnioną wcześniej interpretację teoriomnogościową):

Kategoryjne złożenie `h (g f)` oznacza teraz teoriomnogościowe złożenie $h ∘ (g ∘ f)$, a to z
(teoriomnogościowej) definicji oznacza taką funkcję (powiedzmy) $i$, że (rozwijamy definicję
złożenia po raz pierwszy) $i(x) = h ∘ g(f(x)))$, a to oznacza (rozwijamy definicję złożenia po raz
drugi) $h(g(f(x))). 

Kategoryjne złożenie `(h g) f` oznacza teoriomnogościowe złożenie $(h ∘ g) ∘ f$, a to z kolei
oznacza funkcję (powiedzmy) $j$, taką, że (rozwijamy definicję złożenia po raz pierwszy) $j(x) = (h
∘ g)(f(x))$, a to oznacza (rozwijamy definicję złożenia po raz drugi) $h(g(f(x)))$.

Widzimy, że $i$ i $j$ są tą samą funkcją, bo każdemu elementowi swojej (w tym wypadku z konieczności
tej samej) dziedziny (którą możemy oznaczyć dla wygody jako $X$) przyporządkowują ten sam element
(również z konieczności tej samej) przeciwdziedziny, to jest $∀ x ∈ X, i(x) = h(g(f(x))) = j(x)$. A
więc dla wszystkich (składalnych w ten sposób) strzałek `f`, `g` i `h`, ponieważ nasz opis
przestrzeni zbiorów skończonych jest *izomorfizmem*, a więc nasze strzałki są tylko *innym sposobem
oznaczania* zbiorów skończonych, widzimy, że `h (g f) = (h g) f`.

### Przypisy

[^1]: A właściwie więcej niż dwuargumentową, bo ta funkcja, gdyby była zaimplementowana, musiałaby
    korzystać również z informacji o dziedzinach i przeciwdziedzinach funkcji, jak również,
    niejawnie, z ich składalności, którą można wyrazić odpowiednio określając typy parametrów.
