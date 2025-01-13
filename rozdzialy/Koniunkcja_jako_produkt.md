Jeżeli ...

`X = {1, 2}` i `Y = {a, b}`

... to zbiór ... 

`Z = {(1, a), (2, a), (1, b), (2, b)}` 

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
element jest sparowany z jakimś elementem dla niego charakterystycznym (czyli żaden inny element nie
jest z sparowany z danym elementem) i 2. żaden element przeciwdziedziny nie zostaje na lodzie, a
więc identyczność to szczególny przypadek funkcji *injektywnej* i zarazem *surjektywnej*, czyli
*bijektywnej*, czyli funkcji izomorficznej, czyli izomorfizmu. 

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
dowolnym kierunku. Mówiąc, że dwa zbiory są izomorficzne mówimy więc, że są takie same, ale w
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
ogólnym przypadku *może* być też identyczność) do czynienia ze "ściśłą identycznością".

To też jest izomorfizm między zbiorami `V` i `X × Y`, ale inny niż `f`:

`1 ~ (1, a)`

`2 ~ (1, b)`

`3 ~ (2, a)`

`4 ~ (2, b)`

Czy widzisz, że izomorfizmów w tą stronę jest dokładnie tyle, na ile sposobów można wymienić po
kolei jakiekolwiek cztery elementy? Jako pierwszy możemy wymienić którykolwiek z czterech elementów
`X × Y`, ale gdy już jakiś wybierzemy, zostaną nam do wyboru tylko trzy, a gdy wybierzemy, który ma
być wymieniony jako drugi, zostaną nam tylko dwa, a gdy wybierzemy, który ma być wymieniony jako
trzeci, nie będziemy już mieli wyboru, bo zostanie tylko jeden: `4 * 3 * 2 * 1 = 24 = 4!`. A więc
istnieje właśnie tyle izomorfizmów w jedną stronę między każdymi dwoma zbiorami
czteroelementowymi. A więc musi istnieć dokładnie tyle izomorfizmów w drugą stronę. Ponieważ te pary
są jakby nierozłączone (każdy izomorfizm ma swoją charakterystyczną odwrotność), mówimy, że dwa
zbiory czteroelementowe są izomorficzne na *24* różne sposoby.

Skoro te zbiory są izomorficzne, to *zamiast mówić o elementach* `X × Y`, *możemy równie dobrze
mówić o elementach* `Z`, *o ile* tylko wcześniej *wybierzemy izomorfizm*. Gdybyśmy żadnego nie
wybrali, nie byłoby wiadomo, o którym elemencie `x ∈ X × Y` byśmy mówili, gdybyśmy mówili na
przykład o `1 ∈ V`. Ale jeżeli tylko *wskażemy* na przykład `f` jako *konwencję nazywania inaczej
elementów* `X × Y`, to `1` będzie dla nas oznaczało `(1, a)`, `2` będzie oznaczało `(2, a)`, i tak
dalej i 1. nie będzie wątpliwości, o *który* element `X × Y` nam chodzi i 2. będziemy mogli tak
mówić o *wszystkich* elementach `X × Y`. To będzie więc takie wierne tłumaczenie w obie strony.

Jak bardzo ten wybór konkretnego izomorfizmu pozwala traktować tak `V`, jakby był takim samym
zbiorem jak `X × Y`? Niemal całkowicie, a dokładniej, możemy traktować te dwa zbiory jakby *jedyną*
różnicą między nimi było to, jakie elementy do nich należą. Ale przecież *to i tylko to decyduje o
tożsamości zbioru*, a więc jak to "niemal całkowicie"? Doskonałe pytanie. To faktycznie decyduje o
*tożsamości* zbioru, ale to *nie* decyduje o jego *roli*, to jest o *możliwych sposobach użycia
zbioru*. Zbiory, tak samo jak *wszystkie bez wyjątku konstrukcje matematyczne czy formalne*, to
*nasze* (formalno-językowe i pojęciowe) *narzędzia*. Podobnie to, co konkretnie kupimy na prezent
*nie* decyduje o tym, *że* to będzie prezent, czyli że to coś będzie *spełniało rolę prezentu*,
tylko o tym, *jaki* (konkretnie) to będzie prezent.

Wystarczy, że *wskażemy* jako *nasze projekcje* funkcje `π₁ ∘ f` i `π₂ ∘ f` i natychmiast każdy
element `V` będzie miał *pierwszy element* i *drugi element* i będzie *unikalnie scharakteryzowany*,
czyli całkowicie opisany, przez te dwie własności:

`(π₁ ∘ f)(1) = 1`, `(π₂ ∘ f)(1) = a`, a więc dzięki wybraniu `f` element `1` jest jak `(1, a)`

`(π₁ ∘ f)(2) = 2`, `(π₂ ∘ f)(2) = a`, a więc dzięki wybraniu `f` element `2` jest jak `(2, a)`

`(π₁ ∘ f)(3) = 1`, `(π₂ ∘ f)(3) = b`, a więc dzięki wybraniu `f` element `3` jest jak `(1, b)`

`(π₁ ∘ f)(4) = 2`, `(π₂ ∘ f)(4) = b`, a więc dzięki wybraniu `f` element `4` jest jak `(2, b)`

Wtedy natychmiast każdy element zbioru `V` *stanie się dla nas parą uporządkowaną elementów* `X` i
`Y`, ponieważ *wszystkich* elementów `V` *będziemy mogli używać tak samo, jak wszystkich elementów*
`X × Y`. Nie będzie nic dziwnego w korzystaniu z tej możliwości, bo przecież to są *tylko symbole*,
które mają *służyć nam* do jakich tylko chcemy *dobrze określonych celów*. Jeśli z tego skorzystamy,
to będzie tak, jakbyśmy "zrobili" (za pomocą izomorfizmu) elementy iloczynu kartezjańskiego z
elementów innego (izomorficznego) zbioru. Żeby skorzystać z tego rodzaju "wymienialności
implementacji" iloczynu kartezjańskiego, musimy jedynie *wskazać jakikolwiek konkretny izomorfizm
między tymi zbiorami, wszystko jedno w którą stronę* i *ogłosić*, jeżeli *mówimy do kogoś innego*,
albo tylko *pamiętać*, jeżeli *mówimy do siebie*, że *przyjęliśmy taką konwencję*. A kiedy mamy
ochotę snuć ogólne rozważania o jakichkolwiek iloczynach, możemy przyjąć, że wtedy jakiś Ktoś mógłby
mówić o nich do jakiegoś Kogoś.

To wszystko wynika naturalnie z definicji produktu kategoryjnego. Uwaga, *zmieniamy język*, a więc
również punkt widzenia i rozważamy *dowolną* kategorię, to jest *jakąkolwiek kolekcję strzałek
spełniającą wymagania kategoryjnego składania* (zapisane tym razem maksymalnie skrótowo):

1. `Id f = f = f Id`

2. `h (g f) = (h g) f`

Jeżeli `X` i `Y` to punkty w danej kategorii, to ze względu na jego związek z iloczynem zbiorów
produkt kategoryjny zapisujemy co prawda również jako ... 

`X × Y`

... ale to jest teraz tylko *punkt zaczepienia strzałek* i *rozumiemy* ten zapis jako wygodny sposób
oznaczenia *dwóch współźródłowych strzałek* ...

```lean
π₁ : X × Y → X
π₂ : X × Y → Y
```

... spełniających warunek:

```lean
∀ Z : Punkt, ∀ f : Z → X, ∀ g : Z → Y, ∃¹ h : Z → X × Y, (π₁ h = f) ∧ (π₂ h = g)
```
