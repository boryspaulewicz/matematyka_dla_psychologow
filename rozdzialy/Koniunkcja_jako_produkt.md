Jeżeli `X = {1, 2}` i `Y = {a, b}`, to zbiór `Z = {(1, a), (2, a), (1, b), (2, b)}` jest iloczynem
kartezjańskim zbiorów `X` i `Y`, a więc `Z = X × Y`. Ale czym *naprawdę* jest iloczyn kartezjański
zbiorów?

Na przykład, zbiór `V = {1, 2, 3, 4}` co prawda *nie wygląda* jak `X × Y`, ale jest do tego iloczynu
*podobny* pod *tym względem*, że *ma tyle samo elementów*. A to znaczy, że między tymi dwoma
zbiorami istnieje co najmniej jeden izomorfizm. Zrobię teraz posługując się symbolem definiowania
coś, co robiłaś wcześniej rysując strzałki wychodzące od poszczególnych elementów, to jest
zdefiniuję pewną funkcję z `V` do `X × Y` i nazwę ją `f`:

`f(1) := (1, a)`

`f(2) := (2, a)`

`f(3) := (1, b)`

`f(4) := (2, b)`

Czy widzisz, że ta funkcja *przypomina* trochę identyczność? Identyczność paruje *ze sobą* wszystkie
elementy swojej dziedziny i jednocześnie przeciwdziedziny w taki sposób, że każdy element jest
sparowany z jakimś elementem charakterystycznym (czyli żaden inny element nie jest z sparowany z
danym elementem) i żaden element przeciwdziedziny nie zostaje na lodzie, a więc identyczność to
szczególny przypadek funkcji injektywnej i surjektywnej, czyli bijektywnej, czyli izomorfizmu. Ta
tutaj funkcja `f` również paruje każdy element `V` z jakimś charakterystycznym elementem i nie
zostawia żadnego elementu przeciwdziedziny na lodzie, ale w przypadku funkcji `f` dziedzina i
przeciwdziedzina nie są tym samym zbiorem. Funkcja izomorficzna to zatem pewne uogólnienie
identyczności, albo taka - potencjalnie, bo identyczność też jest izomorfizmem - nonszalancka
identyczność.

Możemy wykazać mechanicznie, czyli udowodnić, że `f` jest izomorfizmem, podając przykład takiej
funkcji `g` z `X × Y` do `V`, że `∀ v ∈ V, g(f(v)) = v` i `∀ x ∈ X × Y, f(g(x)) = x`. Oto
jedyna możliwa taka funkcja:

`g((1, a)) := 1`

`g((2, a)) := 2`

`g((1, b)) := 3`

`g((2, b)) := 4`

A więc `g = f⁻¹`. Izomorfizmy zawsze występują w parach, dlatego często mówimy, że istnieje
izomorfizm *między* jakimiś zbiorami, nie wskazując z którego zbioru do którego i dlatego mówimy też
często, że jakieś dwa zbiory *są izomorficzne*, mając na myśli, że istnieje między nimi co najmniej
jeden izomorfizm (w dowolnym kierunku). Zbiory izomorficzne są więc takie same, ale w znaczeniu
słabszym niż tego wymaga identyczność. Jeśli tylko mamy ochotę, możemy to wyrazić pół-formalnie tak:

`1 ~ (1, a)`

`2 ~ (2, a)`

`3 ~ (1, b)`

`4 ~ (2, b)`

gdzie `~` możemy rozumieć jako wymienialność w słabszym sensie niż tego wymaga równość czy
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
`X × Y`, ale gdy już jakiś wybierzemy, zostaną nam tylko trzy, a gdy wybierzemy, który ma być
wymieniony jako drugi, zostaną nam tylko dwa, a gdy wybierzemy, który ma być wymieniony jako trzeci,
nie będziemy już mieli wyboru, bo zostanie tylko jeden: `4 * 3 * 2 * 1 = 24 = 4!`. A więc istnieje
właśnie tyle izomorfizmów w jedną stronę między każdymi dwoma zbiorami czteroelementowymi.

Widzimy, że ponieważ oba zbiory są czteroelementowe, to są *izomorficzne na 24 różne sposoby*. A
skoro te zbiory są izomorficzne, to *zamiast mówić o elementach* `X × Y`, *możemy równie dobrze
mówić o elementach* `Z`, *o ile* tylko wcześniej *wybierzemy jakiś izomorfizm*. Gdybyśmy żadnego nie
wybrali, nie byłoby wiadomo, o którym elemencie `X × Y` mówimy, gdy mówimy na przykład o `1 ∈
V`. Ale jeżeli tylko *wybierzemy* albo *wskarzemy* na przykład `f` jako *konwencję nazywania inaczej
elementów* `X × Y`, to `1` będzie dla nas oznaczało `(1, a)`, `2` będzie oznaczało `(2, a)`, i tak
dalej i nie będzie żadnych wątpliwości, o który element `X × Y` nam chodzi. To będzie więc takie
wierne tłumaczenie w obie strony.

