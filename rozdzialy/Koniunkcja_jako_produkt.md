Jeżeli ...

`X = {1, 2}` i `Y = {a, b}`

... to zbiór ... 

`Z := {(1, a), (2, a), (1, b), (2, b)}` 

... jest iloczynem kartezjańskim zbiorów `X` i `Y`, a więc ...

`Z = X × Y`

Ale czym *naprawdę* jest iloczyn kartezjański zbiorów?

Na przykład, zbiór `V = {1, 2, 3, 4}` co prawda *nie wygląda* jak `X × Y`, ale jest do tego iloczynu
*podobny pod tym względem*, że *ma tyle samo elementów*. A to znaczy, że między tymi dwoma zbiorami
istnieje co najmniej jeden *izomorfizm*. Zrobię teraz bez rysowania coś, co robiłaś wcześniej
rysując strzałki wychodzące od poszczególnych elementów, to jest zdefiniuję pewną funkcję z `V` do
`X × Y` i nazwę ją `f`:

`f(1) := (1, a)`

`f(2) := (2, a)`

`f(3) := (1, b)`

`f(4) := (2, b)`

Może nie od razu to widać, ale ta funkcja *przypomina identyczność*. Identyczność paruje *ze sobą*
wszystkie elementy swojej dziedziny i jednocześnie przeciwdziedziny w taki sposób, że 1. każdy
element jest sparowany z jakimś elementem dla niego *charakterystycznym* (czyli żaden inny element
nie jest z sparowany z tym elementem) i 2. żaden element przeciwdziedziny nie zostaje na lodzie, a
więc identyczność to szczególny przypadek funkcji *injektywnej* i zarazem *surjektywnej*, czyli
*bijektywnej*, czyli funkcji izomorficznej, czyli szczególny przypadek izomorfizmu.

Ta tutaj funkcja `f` również 1. paruje każdy element `V` z jakimś elementem charakterystycznym
i 2. nie zostawia żadnego elementu przeciwdziedziny na lodzie, *ale* w przypadku funkcji `f`
dziedzina i przeciwdziedzina nie są tym samym zbiorem. Funkcja izomorficzna to zatem pewne
*uogólnienie identyczności*, albo taka - potencjalnie, bo identyczność też jest izomorfizmem -
"nonszalancka identyczność".

Możemy wykazać mechanicznie, czyli udowodnić, że `f` jest izomorfizmem, podając przykład takiej
funkcji `g` z `X × Y` do `V`, że `∀ v ∈ V, g(f(v)) = v` i `∀ x ∈ X × Y, f(g(x)) = x`. Oto *jedyna
możliwa* taka funkcja:

`g((1, a)) := 1`

`g((2, a)) := 2`

`g((1, b)) := 3`

`g((2, b)) := 4`

Jak łatwo sprawdzić `g = f⁻¹`. Tutaj trzeba sprawdzić `4 * 2` równości, bo tyle jest elementów i
tyle jest kierunków. 

Izomorfizmy zawsze występują w *parach*, dlatego często mówimy, że istnieje izomorfizm *między*
jakimiś zbiorami, nie wskazując z którego zbioru do którego i dlatego mówimy też często, że jakieś
dwa zbiory *są izomorficzne*, mając na myśli, że istnieje między nimi co najmniej jeden izomorfizm w
dowolnym kierunku. Mówiąc, że dwa zbiory są izomorficzne, mówimy więc, że są takie same, ale w
znaczeniu słabszym niż tego wymaga identyczność. Jeśli tylko mamy ochotę, możemy to wyrazić
pół-formalnie na przykład tak:

`1 ~ (1, a)`

`2 ~ (2, a)`

`3 ~ (1, b)`

`4 ~ (2, b)`

gdzie `~` możemy rozumieć jako zastępowalność w słabszym sensie niż tego wymaga równość czy
identyczność. Gdy chcemy oznaczyć jako izomorficzne dwa zbiory `U` i `W`, piszemy zwykle `U ≅
W`. Ten symbol przypomina identyczność, ale ma jeszcze dodaną na górze falkę, którą nazywamy
[*tyldą*](https://pl.wikipedia.org/wiki/Tylda) i która sugeruje, że mamy *niekoniecznie* (bo to w
ogólnym przypadku *może* być też identyczność) do czynienia ze "ściśłą" identycznością.

To też pewien izomorfizm między zbiorami `V` i `X × Y`, ale inny niż `f`:

`1 ~ (1, a)`

`2 ~ (1, b)`

`3 ~ (2, a)`

`4 ~ (2, b)`

Czy widzisz, że izomorfizmów w jedną stronę jest tutaj dokładnie tyle, na ile sposobów można
wymienić po kolei jakiekolwiek cztery elementy? Jako pierwszy możemy wymienić którykolwiek z
czterech elementów `X × Y`, ale gdy już jakiś wybierzemy, zostaną nam do wyboru tylko trzy, a gdy
wybierzemy, który ma być wymieniony jako drugi, zostaną nam tylko dwa, a gdy wybierzemy, który ma
być wymieniony jako trzeci, nie będziemy już mieli wyboru, bo zostanie tylko jeden: `4 * 3 * 2 * 1 =
24 = 4!`. A więc istnieje właśnie tyle izomorfizmów w jedną stronę między każdymi dwoma zbiorami
czteroelementowymi. A więc musi istnieć dokładnie tyle izomorfizmów w drugą stronę. Ponieważ te pary
są jakby nierozłączone (każdy izomorfizm ma swoją charakterystyczną odwrotność), możemy powiedzieć,
że dwa zbiory czteroelementowe są izomorficzne na *24* różne sposoby.

Skoro te zbiory są izomorficzne, to *zamiast mówić o elementach* `X × Y`, *możemy równie dobrze
mówić o elementach* `V`, *o ile* wcześniej *wskażemy* jakiś *izomorfizm*. Gdybyśmy żadnego nie
wybrali, nie byłoby wiadomo, o którym elemencie `x ∈ X × Y` byśmy mówili, gdybyśmy mówili na
przykład o `1 ∈ V`. Ale jeżeli tylko *wskażemy* na przykład `f` jako *konwencję nazywania inaczej
elementów* `X × Y`, to `1` będzie dla nas oznaczało `(1, a)`, `2` będzie oznaczało `(2, a)`, i tak
dalej i 1. nie będzie wątpliwości, o *który* element `X × Y` nam chodzi i 2. będziemy mogli tak
mówić o *wszystkich* elementach `X × Y`. To będzie więc takie wierne tłumaczenie w obie strony; gdy
tylko wybierzemy dowolnego wiernego tłumacza, będziemy się mogli dowolnie przełączać między dwoma
sposobami mówienia o tym samym.

Jak bardzo ten wybór konkretnego izomorfizmu pozwala traktować zbiór `V`, jakby był takim samym
zbiorem jak `X × Y`? Niemal całkowicie, a dokładniej, możemy traktować te dwa zbiory jakby *jedyną*
różnicą między nimi było to, *jakie elementy do nich należą*. Ale przecież *to i tylko to decyduje o
tożsamości zbioru*, a więc jak to "niemal całkowicie"? Doskonałe pytanie. To faktycznie decyduje o
*tożsamości* zbioru, ale to *nie* decyduje o jego *roli*, to jest o *możliwych sposobach użycia
zbioru*. Zbiory, tak samo jak *wszystkie inne konstrukcje matematyczne czy formalne*, to *nasze*
(formalno-językowe i pojęciowe) *narzędzia*. Podobnie to, co konkretnie kupimy na prezent *nie*
decyduje o tym, *że* to będzie prezent, czyli że to coś będzie *spełniało rolę prezentu*, to
decyduje tylko o tym, *jaki* (konkretnie) to będzie prezent.

Wystarczy teraz, że *wskażemy* jako *nasze projekcje* funkcje `π₁ ∘ f` i `π₂ ∘ f` i natychmiast
każdy element `V` będzie miał *pierwszy element* i *drugi element* i będzie *unikalnie
scharakteryzowany* przez te dwie własności:

`(π₁ ∘ f)(1) = 1`, `(π₂ ∘ f)(1) = a`, a więc dzięki wybraniu `f` element `1` jest jak `(1, a)`

`(π₁ ∘ f)(2) = 2`, `(π₂ ∘ f)(2) = a`, a więc dzięki wybraniu `f` element `2` jest jak `(2, a)`

`(π₁ ∘ f)(3) = 1`, `(π₂ ∘ f)(3) = b`, a więc dzięki wybraniu `f` element `3` jest jak `(1, b)`

`(π₁ ∘ f)(4) = 2`, `(π₂ ∘ f)(4) = b`, a więc dzięki wybraniu `f` element `4` jest jak `(2, b)`

Wtedy natychmiast każdy element zbioru `V` *stanie się dla nas parą uporządkowaną elementów* `X` i
`Y`, ponieważ *wszystkich elementów* `V` *będziemy mogli używać tak samo, jak wszystkich elementów*
`X × Y`. Nie będzie też nic dziwnego w korzystaniu z tej możliwości, bo przecież to są *tylko
symbole*, które mają *służyć nam* do jakich tylko chcemy *dobrze określonych celów*. 

Jeśli skorzystamy z tej możliwości, to będzie tak, jakbyśmy "zrobili" (za pomocą izomorfizmu)
elementy iloczynu kartezjańskiego z elementów innego (izomorficznego) zbioru. Żeby skorzystać z tego
rodzaju "wymienialności implementacji" iloczynu kartezjańskiego, musimy jedynie *wskazać jakikolwiek
konkretny izomorfizm między tymi zbiorami, wszystko jedno w którą stronę* i *ogłosić*, jeżeli
*mówimy do kogoś innego*, albo tylko *pamiętać*, jeżeli *mówimy do siebie*, że *przyjęliśmy taką
konwencję*. A kiedy mamy ochotę snuć *ogólne* rozważania o *jakichkolwiek* iloczynach, możemy
przyjąć, że wtedy jakiś Ktoś mówi o nich do jakiegoś, być może tego samego Kogoś. Jak się zaraz
przekonamy, to wszystko wynika naturalnie z definicji produktu kategoryjnego.

Teraz musimy uważać, bo *zmienimy język*, a więc również punkt widzenia i rozważamy *dowolną*
kategorię, to jest *jakąkolwiek kolekcję strzałek spełniającą wymagania kategoryjnego składania*
(zapisane tym razem maksymalnie skrótowo, bo bez symbolu składania):

1. `Id f = f = f Id`

2. `h (g f) = (h g) f`

Będzie się być może wydawało, że mówimy nadal o tym samym, tylko trochę inaczej, bo w tle mamy tylko
przykład zbiorów i funkcji, ale to jest *radykalna* zmiana punktu widzenia (a więc też sposobu
myślenia). 

Warto wiedzieć, że warunki 1 i 2 to coś, co trzeba *tylko raz sprawdzić*. Jeżeli tylko te dwa
warunki będą spełnione dla wszystkich strzałek, a więc również dla ich punktów zaczepienia i dla
operacji składania tych strzałek, które w jakiś sposób zinterpretowaliśmy albo zdefiniowaliśmy (na
przykład jako teoriomnogościowe funkcje między zbiorami i teoriomnogościowe składanie funkcji) w
nadziei, że wyjdzie nam z tego jakaś kategoria, to będziemy mieli kategorię. Gdy tylko ustalimy, że
warunki 1 i 2 są spełnione, możemy o nim od razu zapomnieć, bo od tego momentu te warunki będą nam
służył - na ogół w tle - *tylko* do traktowania pewnych strzałek jako elementów neutralnych i do
pomijania nawiasów gdy zapisujemy złożenia.

No więc jeżeli `X` i `Y` to (tylko!) *punkty* w *jakiejkolwiek* kategorii, to ze względu na jego
związek z iloczynem zbiorów produkt kategoryjny `X` i `Y` zapisujemy co prawda również jako ...

`X × Y`

... ale to jest dla nas *tylko punkt zaczepienia strzałek* i *rozumiemy* ten zapis jako wygodny
sposób *wskazywania dwóch współźródłowych strzałek* ...

`π₁ : X × Y → X`  
`π₂ : X × Y → Y`

... spełniających warunek:

`∀ Z : Punkt, ∀ f : Z → X, ∀ g : Z → Y, ∃¹ h : Z → X × Y, (π₁ h = f) ∧ (π₂ h = g)`

Zacznę może od objaśnienia symbolu `∃¹`. Ten symbol **czytamy jako**: *Istnieje dokładnie jedno coś
takie, że ...*. Ponieważ mamy tu aż trzy duże kwantyfikatory, to dobra okazja, żeby zacząć się uczyć
o możliwości elastycznego czytania takich części formalnych zdań. Moglibyśmy odczytać początek tego
zdania na przykład tak: *Dla każdego punktu `Z` i dla każdych funkcji `f` i `g` takich, że ...*. To,
że duże kwantyfikatory występują tu jeden po drugim pozwala nam jednak odczytać to w innej
kolejności i dzięki temu, przynajmniej moim zdaniem, bardziej zrozumiale: *Dla dowolnych dwóch
współźródłowych strzałek do punktów `X` i `Y` ...*. Korzystamy w ten sposób z faktu, że duży
kwantyfikator to (między innymi) parametr, a więc zmienne związane dużymi kwantyfikatorami, takie
jak `Z`, `f` i `g` w tym formalnym zdaniu, pełnią rolę zaimków. To samo zresztą dotyczy symbolu `h`,
ale ponieważ jeszcze nie mówiliśmy o kwantyfikatorze egzystancjalnym, to może nie być takie
oczywiste.

Skorzystamy teraz z dopiero co wprowadzonej definicji produktu kategoryjnego, żeby ustalić coś na
temat *wszystkich możliwych implementacji produktu*, a więc między innymi również na temat iloczynów
kartezjańskich zbiorów. Przyjmiemy, że mamy jakieś (a więc to będzie dowód zdania zaczynającego się
od *Dla każdego*) dwa, niekoniecznie różne produkty jakiś punktów `X` i `Y` i - żeby uprościc
notację jak również podkreślić, że całkowicie ignorujemy ewentualną wewnętrzną strukturę punktów i
strzałek - oznaczmy je jako `A` i `A'`. 

Jak już wiesz, gdy nazywamy jakieś punkty produktami, nie chodzi nam tak naprawdę o te punkty, tylko
o pewne specjalne pary współźródłowych strzałek, które ze względu na operację składania samych
strzałek zachowują się jak projekcje iloczynu kartezjańskiego. Zgodnie z przyjętą właśnie
(niejawnie) konwencją, polegającą na dodawaniu apostrofu żeby oznaczyć drugi, potencjalnie ten sam
produkt, będziemy mówić odpowiednio o kategoryjnych strzałkach-projekcjach:

`π₁ : A → X` i `π₂ : A → Y`

`π₁' : A' → X` i `π₂' : A' → Y`.

**Rysunek 1**: `Narysuj` proszę `Punkt A`, a o dobry krok pod nim `Narysuj (Punkt A')`. Na wysokości
gdzieś pomiędzy punktami `A` i `A'` `Narysuj` po lewej `Punkt X` a po prawej `Punkt Y` i dodaj, jako
strzałki oznaczone odpowiednimi nazwami, wszystkie cztery projekcje, uważając, żeby apostrofy
pojawiły się tam gdzie trzeba, czyli tylko w dolnej części tego rysunku i nie przy literach `X` i
`Y`.

Założyliśmy, że te dwie pary strzałek są w naszej bliżej nieokreślonej kategorii produktami tych
samych dwóch punktów `X` i `Y`. Zgodnie z definicją produktu kategoryjnego, dla każdej pary
współźródłowych strzałek do `X` i `Y` istnieje dokładnie jedna strzałka do `A'`, z której można
zrekonstruować te dwie strzałki składając ją z projekcjami `A'`. Czy widzisz na swoim rysunku, że
już w tym momencie *mamy* dwie współźródłowe strzałki do `X` i `Y`, które nie są projekcjami `A'`?
