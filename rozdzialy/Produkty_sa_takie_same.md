## O czym teraz będzie

W tym rozdziale pokażę Ci, że struktura wewnętrzna iloczynu kartezjańskiego zbiorów nie ma znaczenia
w tym sensie, że każdy izomorficzny zbiór może spełniać dokładnie tą samą rolę, nawet, gdy jest
złożony z zupełnie innych elemntów. Wprowadzę też najogólniejszą znaną definicję
izomorfizmu. Posługując się tą definicją i definicją produktu kategoryjnego będziesz mogła razem ze
mną udowodnić, że wszystkie możliwe produkty, a więc nie tylko iloczyny kartezjańskie zbiorów, są
określone tylko z dokładnością do kanonicznych izomorfizmów i że są - w interesującym, ogólniejszym
znaczeniu niż na to pozwala równość - zastępowalne.

Treści zawarte w tym rozdziale będą technicznie stosunkowo proste, to znaczy, bezmyślne
konstruowanie dowodów będzie się niemal robiło samo, co jest zresztą cechą charakterystyczną i
zarazem wielką zaletą wielu dowodów kategoryjnych, ale jednocześnie, z powodu ekstremalnego poziomu
abstrakcji, połączonego z bliskością narzucającego się przykładu konkretnej kategorii zbiorów i
funkcji, trudności w dopatrzeniu się w tym wszystkim sensu będą prawdopodobnie spore. Dlatego
uprzedzam, że użyteczność kategoryjnego punktu widzenia, z którym próbuję Cię oswoić już od pewnego
czasu, być może nieprędko stanie się dla Ciebie oczywista.

Będzie chyba najlepiej, jeśli czytając ten rozdział nie będziesz się nigdzie spieszyć i być może
trzeba będzie też czasem wrócić do poprzedniego rozdziału, a zwłaszcza do rysunku będącego definicją
produktu kategoryjnego. Przyda się też, nomen omen, anielska cierpliwość.

# X ← '∘ → Y ≅! X ← ∘' → Y, albo wszystkie produkty tych samych obiektów są praktycznie tym samym produktem, bo są kanonicznie takie same

## Najpierw krótko i bez sensu

Ten fragment jest tylko po to, żeby Ci pokazać, że można prawie wszystko, o czym będę mówił w tym
rozdziale, powiedzieć znacznie krócej. Być może ten fragment przyda Ci się od pewnego momentu jako
przykład skrótowej notatki, ale wtedy należałoby go uzupełnić o diagramy.

Kategoryjnym izomorfizmem nazywamy taką strzałkę `f : X → Y`, że istnieje taka strzałka `g : Y → X`,
że `f g = Id` i `g f = Id`. Strzałkę `g` nazywamy wtedy odwrotnością strzałki `f`, a strzałkę `f`
nazywamy odwrotnością `g`.

Każda strzałka ma co najwyżej jedną odwrotność, ponieważ jeżeli `g` i `g'` są odwrotnościami `f`,
to:

`g = g Id = g (f g') = (g f) g' = Id g' = g'`.

A więc dla każdej strzałki `f`, jej odwrotność, o ile istnieje, możemy oznaczyć jako `f⁻¹`.

Załóżmy, że `P` jest kategoryjnym produktem, którego projekcjami są strzałki `π₁ : P → X` i `π₂ : P
→ Y`. Wtedy z definicji (produktu kategoryjnego), dla każdego punktu `A` i pary strzałek `f : A → X`
i `g : A → Y` istnieje unikalna strzałka `h : A → P` taka, że `π₁ h = f` i `π₂ h = g`. Ponieważ `h`
jest unikalną taką strzałką, możemy ją oznaczyć jako `<f,g>`. 

Ponieważ każdy produkt sam dostarcza, będącą jego projekcjami `π₁` i `π₂`, parę takich strzałek, to
dla każdego takiego produktu istnieje unikalna strzałka `<π₁,π₂>` taka, że `π₁ <π₁, π₂> = π₁` i `π₂
<π₁,π₂> = π₂`. A ponieważ `Id : P → P` również spełnia te dwa warunki, bo `π₁ Id = π₁` i `π₂ Id =
π₂`, to z unikalności takiej strzałki wynika, że `Id = <π₁,π₂>`.

Dla każdych dwóch produktów `P` i `P'` tych samych punktów `X` i `Y` istnieją strzałki `<π₁,π₂> : P
→ P'` i `<π₁',π₂'> : P' → P`, spełniające warunki `π₁ <π₁',π₂'> = π₁'`, `π₂ <π₁',π₂'> = π₂'`, `π₁'
<π₁,π₂> = π₁` i `π₂' <π₁,π₂> = π₂`. Dla wygody oznaczymy te strzałki jako `f := <π₁,π₂>` i `g :=
<π₁',π₂'>`. Strzałki `f` i `g` są składalne na dwa sposoby, to jest `f g` i `g f`. O strzałce
będącej złożeniem `f g` wiemy, że:

`π₁' (f g) = (π₁' f) g = (π₁' <π₁,π₂>) g = π₁ g = π₁ <π₁',π₂'> = π₁'`

`π₂' (f g) = (π₂' f) g = (π₂' <π₁,π₂>) g = π₂ g = π₂ <π₁',π₂'> = π₂'`

A więc `f g = Id`. W ten sam sposób można wykazać, że `g f = Id`. A więc `g = f⁻¹`, skąd wynika, że
każde dwa produkty tych samych punktów są kanonicznie izomorficzne w tym znaczeniu, że istnieje
między nimi para izomorfizmów powstających w jedyny możliwy sposób z ich projekcji. Jak każdy
izomorfizm, tak i te izomorfizmy pozwalają zamienić jeden produkt w drugi, w tym wypadku dzięki
temu, że `π₁ g = π₁'`, `π₂ g = π₂'`, `π₁' f = π₁`, `π₂' f = π₂`.

Ponieważ dodatkowo każda strzałka `h : A → P` odpowiada unikalnej parze strzałek z `A` do `X` i `Y`
będących złożeniami `π₁ h` i `π₂ h`, to każdy taki produkt jest izomorfizmem między strzałkami `A →
P` i uporządkowanymi parami strzałek `A → X` i `A → Y`. Ten izomorfizm nie jest jednak izomorfizmem
w tej samej kategorii, bo nie jest strzałką w tej kategorii, a tego wymaga kategoryjna definicja
izomorfizmu.

## A teraz długo, powtarzając się, czasem z sensem i korzystając z nieocenionej pomocy diagramów

Jeżeli ...

`X = {1, 2}` i `Y = {a, b}`

... to zbiór ... 

`Z := {(1, a), (2, a), (1, b), (2, b)}` 

... jest iloczynem kartezjańskim zbiorów `X` i `Y`, a więc ...

`Z = X × Y`

Ale czym *tak naprawdę* jest iloczyn kartezjański zbiorów?

Na przykład, zbiór `V = {1, 2, 3, 4}` co prawda *nie wygląda* jak `X × Y`, ale jest do tego iloczynu
*podobny pod tym względem*, że *ma tyle samo elementów*. A to znaczy, że między tymi dwoma zbiorami
istnieje co najmniej jeden *izomorfizm*, ponieważ na tym właśnie, to jest na *samej równoliczności*,
polega izomorfizm *zbiorów*.

Zrobię teraz bez rysowania coś, co robiłaś wcześniej rysując strzałki wychodzące od poszczególnych
elementów, to jest zdefiniuję pewną funkcję z `V` do `X × Y` i nazwę ją `f`:

`f(1) := (1, a)`

`f(2) := (2, a)`

`f(3) := (1, b)`

`f(4) := (2, b)`

Może nie od razu to widać, ale ta funkcja *przypomina identyczność*. Identyczność paruje *ze sobą*
wszystkie elementy swojej dziedziny i jednocześnie przeciwdziedziny w taki sposób, że:

1. Każdy element jest sparowany z jakimś elementem dla niego *charakterystycznym* (czyli żaden inny
element nie jest z sparowany z tym elementem).

2. Żaden element przeciwdziedziny nie zostaje na lodzie.

A więc identyczność to szczególny przypadek funkcji zarazem *injektywnej* (1) i *surjektywnej* (2),
czyli *bijektywnej*, czyli funkcji izomorficznej, czyli szczególny przypadek izomorfizmu.

Ta tutaj funkcja `f` również 1. paruje każdy element `V` z jakimś elementem charakterystycznym
i 2. nie zostawia żadnego elementu przeciwdziedziny na lodzie, a więc `f` jest izomorfizmem, ale w
przypadku funkcji `f` dziedzina i przeciwdziedzina *nie* są tym samym zbiorem. Funkcja izomorficzna
to zatem pewne *uogólnienie identyczności*, albo taka - potencjalnie, bo identyczność też jest
izomorfizmem - "nonszalancka identyczność".

Możemy wykazać mechanicznie, czyli formalnie udowodnić, że `f` jest izomorfizmem, podając przykład
takiej funkcji `g` z `X × Y` do `V`, że `∀ v ∈ V, g(f(v)) = v` i `∀ x ∈ X × Y, f(g(x)) = x`. Oto
jedyna możliwa taka funkcja:

`g((1, a)) := 1`

`g((2, a)) := 2`

`g((1, b)) := 3`

`g((2, b)) := 4`

Jak łatwo sprawdzić, `g = f⁻¹`. Tutaj trzeba sprawdzić `4 * 2` równości, bo tyle jest elementów i
tyle jest kierunków, ale nie warto tego robić, bo widać je gołym okiem.

Izomorfizmy zawsze występują w *parach*, dlatego często mówimy, że istnieje izomorfizm *między*
jakimiś zbiorami, nie wskazując z którego zbioru do którego i dlatego mówimy też często, że jakieś
dwa zbiory *są izomorficzne*, mając na myśli, że istnieje między nimi co najmniej jeden izomorfizm w
dowolnym kierunku. Mówiąc, że dwa zbiory są izomorficzne, mówimy więc, że są takie same, ale w
znaczeniu słabszym niż tego wymaga identyczność. To nie znaczy, że *nie* są identyczne, tylko że
mówiąc jedynie, że są izomorficzne, jeszcze tego nie przesądzamy.

Gdy tylko mamy ochotę, możemy to wyrazić pół-formalnie na przykład tak:

`1 ~ (1, a)`

`2 ~ (2, a)`

`3 ~ (1, b)`

`4 ~ (2, b)`

gdzie `~` możemy rozumieć jako zastępowalność w słabszym sensie niż tego wymaga równość czy
identyczność. Gdy chcemy oznaczyć jako izomorficzne dwa zbiory `U` i `W`, piszemy zwykle:

`U ≅ W` 

Symbol `≅` przypomina symbol `=`, ale ma jeszcze dodaną na górze falkę, którą nazywamy
[*tyldą*](https://pl.wikipedia.org/wiki/Tylda) i która sugeruje, że mamy *niekoniecznie* (bo to w
ogólnym przypadku *może* być też identyczność) do czynienia ze ścisłą identycznością.

I to też jest pewien izomorfizm między zbiorami `V` i `X × Y`, ale inny niż `f`:

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
czteroelementowymi. A więc musi istnieć dokładnie tyle izomorfizmów również w drugą stronę. Ponieważ
te pary są - jako wzajemne odwrotności - nierozłączone, bo każdy izomorfizm ma swoją
charakterystyczną odwrotność, możemy powiedzieć, że dwa zbiory czteroelementowe są izomorficzne na
*24* różne sposoby.

## Metodę tłumaczenia trzeba zwykle *wskazać*

Skoro zbiory `V` i `X × Y` są izomorficzne, to *zamiast mówić o elementach* `X × Y`, *możemy równie
dobrze mówić o elementach* `V`, *o ile* wcześniej *wskażemy* jakiś *izomorfizm*. Gdybyśmy żadnego
nie wybrali, nie byłoby wiadomo, o którym elemencie `x ∈ X × Y` byśmy mówili, gdybyśmy mówili na
przykład o `1 ∈ V`. Ale jeżeli tylko *wskażemy* na przykład `f` jako *konwencję nazywania inaczej
elementów* `X × Y`, to `1` będzie dla nas oznaczało `(1, a)`, `2` będzie oznaczało `(2, a)`, i tak
dalej. Wtedy:

1. Nie będzie wątpliwości, o *który* element `X × Y` nam chodzi.

2. Będziemy mogli tak mówić o *wszystkich* elementach `X × Y`. 

To będzie więc takie wierne tłumaczenie w obie strony; od momentu, gdy wybierzemy dowolnego wiernego
tłumacza, możemy się dowolnie przełączać między dwoma sposobami mówienia o tym samym.

Jak bardzo ten wybór konkretnego izomorfizmu pozwala traktować zbiór `V` jakby był *takim samym*
zbiorem jak `X × Y`? Niemal całkowicie, a dokładniej, możemy traktować te dwa zbiory jakby *jedyną*
różnicą między nimi było to, *jakie elementy do nich należą*. Ale przecież *to i tylko to decyduje o
tożsamości zbioru*, a więc jak to "niemal całkowicie"?

Doskonałe pytanie. To faktycznie decyduje o *tożsamości* zbioru, ale to *nie* decyduje o jego
*roli*, to jest o *możliwych sposobach użycia zbioru*. Zbiory, tak samo jak *wszystkie inne
konstrukcje matematyczne czy formalne*, to *nasze* (formalno-językowe i pojęciowe)
*narzędzia*. Podobnie to, co konkretnie kupimy na prezent *nie* decyduje o tym, *że* to będzie
prezent, czyli że to coś będzie *spełniało rolę prezentu*, to decyduje tylko o tym, *jaki*
konkretnie to będzie prezent.

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
symbole*, które mają *służyć nam* do jakich tylko chcemy *dobrze określonych celów*. Czy widzisz, że
mimo tego, że `V` nie zawiera żadnych par, to możemy w ten sposób uzyskać dwie "pełnowartościowe"
projekcje ze zbioru `V` do zbiorów `X` i `Y` dzięki temu, że `f` jest izomorfizmem z `V` do `X × Y`?

Jeśli skorzystamy z tej możliwości, to będzie tak, jakbyśmy "zrobili" za pomocą izomorfizmu elementy
iloczynu kartezjańskiego z elementów innego zbioru. Żeby skorzystać z tego rodzaju "wymienialności
implementacji" albo "realizacji" iloczynu kartezjańskiego, musimy jedynie *wskazać jakikolwiek
konkretny izomorfizm między tymi zbiorami, wszystko jedno w którą stronę* i *ogłosić*, jeżeli
*mówimy do kogoś innego*, albo tylko *pamiętać*, jeżeli *mówimy do siebie*, że *przyjęliśmy taką
konwencję*. A kiedy mamy ochotę snuć *ogólne* rozważania o *jakichkolwiek* iloczynach, możemy
przyjąć, że wtedy jakiś Ktoś mówi o nich do jakiegoś, być może tego samego Kogoś. Jak się zaraz
przekonamy, to wszystko wynika z definicji produktu kategoryjnego.

## Pierwszy przelot

Teraz musimy uważać, bo *zmieniamy język*, a więc zmieniamy również punkt widzenia i rozważamy odtąd
*dowolną* kategorię, to jest *jakąkolwiek kolekcję strzałek spełniającą wymagania* (zapisane
maksymalnie skrótowo, bo bez symbolu składania) *kategoryjnego składania* :

1. `Id f = f = f Id`

2. `h (g f) = (h g) f`

Będzie się być może wydawało, że mówimy nadal o tym samym, tylko trochę inaczej, bo w tle mamy tylko
przykład zbiorów i funkcji, ale to jest *radykalna* zmiana punktu widzenia, a więc też radykalna
zmiana sposobu myślenia.

Warto wiedzieć, że warunki 1 i 2 to coś, co trzeba *tylko raz sprawdzić*, gdy chcemy się upewnić,
czy jakieś konkretne obiekty można postrzegać abstrakcyjnie jako pewną kategorię. Jeżeli tylko te
dwa warunki będą spełnione dla wszystkich obiektów, które chcemy oznaczyć strzałkami, a więc również
dla wszystkich obiektów, które chcemy traktować jako punkty zaczepienia strzałek i dla operacji,
którą chcemy traktować jako operację składania strzałeka, to będziemy mieli kategorię.

Na przykład, wiemy już, że oznaczając zbiory jako pozbawione wewnętrznej struktury punkty, funkcje
jako pozbawione wewnętrznej struktury strzałki i operację składania funkcji jako abstrakcyjne
składanie strzałek uzyskujemy kategorię. Nawiasem mówiąc, ta kategoria nosi oficjalnie nazwę
[`Set`](https://en.wikipedia.org/wiki/Category_of_sets). Gdy tylko ustalimy, że warunki 1 i 2 są
spełnione ze względu na przyjątą interpretację punktów, strzałek i składania, możemy o tych
warunkach od razu zapomnieć, bo od tego momentu te warunki będą nam służyły - na ogół w tle -
*tylko* do traktowania pewnych strzałek jako elementów neutralnych i do pomijania nawiasów gdy
zapisujemy złożenia.

No więc jeżeli `X` i `Y` to (tylko!) *punkty* w *jakiejkolwiek* kategorii, to ze względu na jego
związek z iloczynem zbiorów produkt kategoryjny `X` i `Y` zapisujemy co prawda również jako ...

`X × Y`

... ale to jest dla nas *tylko punkt zaczepienia strzałek* i *interpretujemy* ten zapis jako wygodny
sposób *wskazywania dwóch współźródłowych strzałek* ...

`π₁ : X × Y → X`  
`π₂ : X × Y → Y`

... spełniających warunek:

`∀ Z : Punkt, ∀ f : Z → X, ∀ g : Z → Y, ∃¹ h : Z → X × Y, (π₁ h = f) ∧ (π₂ h = g)`

Zacznę może od objaśnienia symbolu `∃¹`. Ten symbol **czytamy jako**: *Istnieje dokładnie jedno coś
takie, że ...*. Ponieważ mamy tutaj aż trzy duże kwantyfikatory, to dobra okazja, żeby zacząć się
uczyć o możliwości elastycznego czytania takich części formalnych zdań. Moglibyśmy odczytać początek
tego zdania na przykład tak: *Dla każdego punktu `Z` i dla każdych funkcji `f` i `g` takich, że
...*. 

To, że duże kwantyfikatory występują tu jeden po drugim, pozwala nam jednak odczytać to w innej
kolejności i dzięki temu, przynajmniej moim zdaniem, bardziej zrozumiale: *Dla dowolnych dwóch
współźródłowych strzałek do punktów `X` i `Y` ...*. Korzystamy w ten sposób z faktu, że duży
kwantyfikator to (między innymi) parametr, a więc zmienne związane dużymi kwantyfikatorami, takie
jak `Z`, `f` i `g` w tym formalnym zdaniu, pełnią rolę zaimków. To samo zresztą dotyczy symbolu `h`,
ale ponieważ jeszcze nie mówiliśmy o kwantyfikatorze egzystencjalnym, to może nie być takie
oczywiste.

Być może łatwiej jest zapamiętać definicję produktu kategoryjnego myślać o niej w kategoriach czegoś
przypominającego *dzielenie liczb*: Jeżeli `A` jest kategoryjnym produktem zbiorów `X` i `Y`, to
istnieją strzałki `π₁ : A → X` i `π₂ : A → Y` takie, że dla każdej pary strzałek `f : Z → Y` i `g :
Z → X` istnieje jedna i tylko jedna strzałka `h`, przez którą "dzielą się projekcyjnie" strzałki `f`
i `g`, to jest która spełnia warunek `f = π₁ h` i `g = π₂ h`. Czy widzisz, że to wygląda tak, jakby
`h` było jedynym "`π`-dzielnikiem" `f` i `g`?

Dlatego właśnie, że taka strzałka jakby "wynika" w ten sposob z `f` i `g`, możemy ją zapisać jako
`⟨f,g⟩`, albo stwierdzić, że `h = ⟨f,g⟩`. To będzie *jedyna* własność produktu, z której będziemy
korzystać w tym rozdziale. Będziemy więc czasem szukać dwóch strzałek `h` i `h'` takich, że obie
`π`-dzielą tą samą parę współźródłowych strzałek `f` i `g` i na tej podstawie będziemy wyprowadzać
wniosek, że `h = h'`, albo, bardziej pośrednio, że `h = ⟨f,g⟩` i `h' = ⟨f,g⟩`, a więc `h = h'`. Jak
widzisz, zgodnie z tym, co zapowiedziałem na początku, algebraicznie wszystko będzie w tym rozdziale
dosyć proste.

Skorzystamy teraz z dopiero co wprowadzonej definicji produktu kategoryjnego, żeby ustalić coś na
temat *wszystkich możliwych implementacji produktu*, a więc między innymi również na temat iloczynów
kartezjańskich zbiorów. Przyjmiemy, że mamy jakieś (a więc to będzie dowód zdania zaczynającego się
od *Dla każdego*) dwa, niekoniecznie różne produkty jakiś punktów `X` i `Y` i - żeby uprościc
notację, jak również podkreślić, że całkowicie ignorujemy ewentualną wewnętrzną strukturę tego, co
mogłyby oznaczać punkty i strzałki - oznaczymy je jako `P` i `P'` (bo to będą *p*rodukty).

Jak już wiesz, gdy nazywamy jakieś punkty produktami, nie chodzi nam tak naprawdę o te punkty, tylko
o pewne specjalne pary współźródłowych strzałek, które ze względu na operację składania zachowują
się tak samo jak projekcje iloczynu kartezjańskiego. Zgodnie z przyjętą właśnie (niejawnie)
konwencją, polegającą na dodawaniu apostrofu żeby oznaczyć drugi (potencjalnie ten sam) produkt,
będziemy tak samo oznaczać kategoryjne strzałki-projekcje:

To są projekcje produktu `P` ... 

`π₁ : P → X` i `π₂ : P → Y`

... a to są (niekoniecznie inne) projekcje (niekoniecznie różnego od `P`) produktu `P'`

`π₁' : P' → X` i `π₂' : P' → Y`.

**Rysunek 1**: `Narysuj` proszę `Punkt P`, a o dobry krok pod nim `Narysuj (Punkt P')`. Na wysokości
gdzieś pomiędzy tymi punktami `Narysuj` po lewej `Punkt X` a po prawej `Punkt Y` i dodaj, jako
strzałki oznaczone odpowiednimi nazwami, wszystkie cztery projekcje, uważając, żeby apostrofy
pojawiły się tam, gdzie trzeba, czyli tylko w dolnej części tego rysunku, ale nie przy literach `X`
i `Y`. Dodaj też proszę pętle strzałek identycznościowych przy `P` i `P'` i oznacz je
obie jako `Id`. Co prawda nie *musimy* nigdy rysować takich strzałek, bo *wiemy*, że każdy
kategoryjny punkt ma taką strzałkę, ale tym razem to się do czegoś przyda.

Założyliśmy, że te dwie pary poziomych strzałek są w naszej bliżej nieokreślonej kategorii
produktami tych samych dwóch punktów `X` i `Y`. Zgodnie z definicją produktu kategoryjnego, dla
każdej pary współźródłowych strzałek do `X` i `Y` istnieje unikalna strzałka do `P'`, z której można
zrekonstruować te dwie strzałki składając ją z projekcjami `P'`. Czy widzisz na swoim rysunku, że
już w tym momencie *mamy* dwie współźródłowe strzałki do `X` i `Y`, które nie są projekcjami `P'`?
So nimi przecież projekcie produktu `P`!

Z definicji produktu kategoryjnego wynika, że istnieje w tej sytuacji *co najmniej jedna* strzałka
`f`, o której wiesz (jeżeli to jeszcze pamiętasz), że `π₁' f = π₁` i `π₂' f = π₂`. A ponieważ
definicja produktu mówi również, że istnieje *co najwyżej jedna* taka strzałka, to strzałka `f` jest
*funkcją* (albo *własnością*) uporządkowanej pary współźródłowych strzałek `π₁` i `π₂`, wobec czego
możemy ją oznaczyć również jako `⟨π₁,π₂⟩`. Dlatego `Narysuj` proszę tą strzałkę, ale tak, żeby była
wygięta w łuk w lewą (czyli patrząc z góry w prawą) stronę, bo będzie trzeba tam zmieścić jeszcze
jedną analogiczną strzałkę w drugą stronę. Następnie oznacz proszę tą strzałkę z lewej jako `f =
⟨π₁,π₂⟩`. *My* będziemy nazywać takie strzałki *produktami strzałek*, ale powinnaś wiedzieć, że
oficjalnie nazywa "się" je [*produktami
morfizmów*](https://pl.wikipedia.org/wiki/Produkt_(teoria_kategorii)).

Czy widzisz, że istnieje również analogiczna unikalna strzałka w drugą stronę? Narysuj ją proszę w
podobny sposób, tylko tak, żeby tworzyła łuk wygięty w drugą stronę i oznacz ją z prawej jako `g =
⟨π₁',π₂'⟩`. Oto wszystko, co na razie wiemy - zakładając tylko aksjomaty kategorii i stosując
definicję produktu - o tych dwóch strzałkach:

1. `π₁' f = π₁' ⟨π₁,π₂⟩ = π₁` i `π₂' f = π₂' ⟨π₁,π₂⟩ = π₂`

2. `π₁ g = π₁ ⟨π₁',π₂'⟩ = π₁'` i `π₂ g = π₂ ⟨π₁',π₂'⟩ = π₂'`

Jeżeli to dla Ciebie w tym momencie trochę za wiele symboli na raz, to pamiętaj, że zawsze możesz
próbować sobie uprościć zapis algebraiczny stosując tymczasowe oznaczenia, które możesz rozpakować
dopiero wtedy, gdy to będzie do czegoś potrzebne:

1. `π₁' f = π₁` i `π₂' f = π₂`

2. `π₁ g = π₁'` i `π₂ g = π₂'`

Domyślam się, że to może być dezorientujące, bo posługujemy się tutaj algebrą i diagramem
maksymalnie abstrakcyjnie, w oderwaniu od jakichkolwiek konkretnych przykładów (implementacji
jakiejś) kategorii. Niestety, w tym momencie nie mogę Ci pomóc inaczej niż sugerując, żebyś znowu
potraktowała to, co teraz robimy jak *grę*, która nie musi *w tym momencie* mieć *jakiegokolwiek
sensu*. Jeśli tylko uda Ci się tak do tego podejść, to będziesz mogła się skupić na czysto
mechanicznych operacjach, które będą tylko trochę bardziej skomplikowane niż te, które wykonywałaś
dowodząc twierdzenie Bayesa.

Założę odtąd, że albo już wiesz, albo dowiesz się w końcu, powtarzając treści z tego rozdziału, że
strzałki `f` i `g` muszą istnieć i muszą być unikalnymi strzałkami spełniającymi wymienione wyżej
wymagania. Teraz możemy zadać pytanie o to, jak te dwie strzałki *mają się do siebie
nawzajem*.

Na Twoim diagramie od razu widać, że te dwie strzałki są składalne na dwa sposoby, to jest jako
złożenia `f g` i `g f`. Kategoryjne diagramy pozwalają łatwo *zobaczyć*, które strzałki można
składać z którymi. Czy widzisz, że dzięki temu takie diagramy mogą być bardzo pomocne w
rozwiązywaniu problemów algebraicznych? Gdybyś nie miała przed oczami tego diagramu i napisałbym, że
dopuszczalne są *tylko* złożenia `f g`, `g f`, `π₁' f`, `π₂' f`, `π₁ g` i `π₂ g`, to trudno byłoby
Ci to zapamiętać, prawda? A tak możesz to zawsze łatwo zobaczyć na diagramie.

Wiesz, że dwa *iloczyny kartezjańskie tych samych zbiorów* są izomorficzne. To może da się jakoś
wykazać, że strzałki `f` i `g` też są, a nawet muszą być, izomorfizmami, które w dodatku są swoimi
odwrotnościami, a więc dwa kategoryjne produkty tych samych punktów są zawsze izomorficzne? Żeby to
wykazać, musimy najpierw wprowadzić jeszcze jedną definicję kategoryjną.

## Kategoryjny izomorfizm

**Kategoryjna definicja izomorfizmu**: Izomorfizmem (kategoryjnym) nazywamy taką strzałkę `f`, że
istnieje strzałka `g` spełniająca warunki `g f = Id` i `f g = Id`.

Czyli kategoryjny izomorfizm to strzałka, która ma strzałkę obustronnie odwrotną. I tyle, to jest
cała kategoryjna definicja izomorfizmu. Zwróć proszę uwagę, że ta definicja nie mówi nic na temat
wewnętrznej struktury tego, co mogłyby reprezentować punkty i strzałki, jest więc "czysto
złożeniowa", a dzięki temu maksymalnie ogólna.

Udowodnimy teraz na kilka sposobów, że dla dowolnej strzałki `f`, istnieje co najwyżej jedna
obustronnie odwrotna strzałka `g`. Jeżeli jakaś strzałka `h` również spełnia te same dwa warunki, co
`g`, czyli jeżeli również `h f = Id` i `f h = Id`, to ...

`h = Id h = (g f) h = g (f h) = g Id = g`  
(zawsze można dołożyć `Id` do złożenia nie zmieniając go, `Id = (g f)` z założenia, `(g f) h = g (f
h)` bo łączność, `(f h) = Id` z założenia, `Id` jest elementem neutralnym)

... albo prościej, chociaż może nieco mniej czytelnie, korzystając z tego, że z powodu łączności
 składania nawiasy są tu niepotrzebne ...

`h = Id h = g f h = g Id = g`

Zauważyłaś, że ten ostatni dowód wymaga, żeby zobaczyć wyrażenie `g f h` na dwa sposoby, raz jako
`(g f) h`, które jest z założenia równe `Id h`, a raz jako `g (f h)`, które jest z (innego)
założenia równe `g Id`? Dlatego mam wątpliwości, czy ta wersja dowodu jest faktycznie prostsza.

Można ten dowód zapisać jeszcze krócej, korzystając niejawnie również z założenia, że `g f = Id` i
`f h = Id` ...

`h = g f h = g`

... ale z drugiej strony w ten sposób jeszcze bardziej obciążamy pamięć operacyjną czytelniczki albo
czytelnika.

Możemy to udowodnić w Leanie dla funkcji teoriotypowych na przykład tak:

```lean
-- Uwaga: Ten dowód jest celowo nieco przegadany i może być w tym momencie dla Ciebie trochę zbyt trudny,
-- ale moim zdaniem już na tym etapie warto się nim trochę pobawić.

-- To jest znana Ci już funkcja tworząca dla dowolnego typu jego "pętlę identyczności":
def ID (X : Type) : X → X := fun (x : X) => x

-- g i h to będą zaraz dwie funkcje, które spełniają warunek bycia odwrotnościami f.
variable (X Y : Type) (f : X → Y) (g h : Y → X)

-- Ten warunek mówi, że g jest odwrotnością f, ...
variable (h1 : g ∘ f = (ID X)) (h2 : f ∘ g = (ID Y)) 
-- ... a ten warunek mówi, że h jest również odwrotnością f.
variable (h3 : h ∘ f = (ID X)) (h4 : f ∘ h = (ID Y))

-- Lean nie zgłasza tutaj błędu, a więc dowód jest poprawny, co znaczy, że h i g to ta sama funkcja.
example : h = g := by
  -- Słowo kluczowe have służy do dodawania termów do kontekstu. W tym wypadku konstruujemy najpierw
  -- dowód hipotezy hcel, która jest taką hipotezą, że będziemy mogli do niej zastosować dostępne
  -- założenia, żeby ją stopniowo przekształcić w cel, czyli w zdanie h = g.
  --
  -- Używając instrukcji have tworzymy dowód wewnątrz dowodu i nadajemy udowodnionemu zdaniu nazwę
  -- (w tym wypadku nazwę hcel).
  have hcel : g ∘ (f ∘ h) = g ∘ (ID Y) := by rw [h4] -- Tutaj (lokalnym) celem jest zdanie hcel.

  -- Łączność składania funkcji teoriotypowych wynika z definicji tej operacji, a więc wystarcza
  -- taktyka rfl.
  have h5 : g ∘ (f ∘ h) = (g ∘ f) ∘ h := by rfl

  -- Od tego momentu zaczynamy przekształcać hipotezę hcel, której dowód mamy już w kontekście.
  -- Argument at <nazwa> mówi taktyce rw, żeby dokonała przekstałcenia termu o nazwie nazwa, a nie
  -- przekształcenia celu.
  rw [h5] at hcel                       -- hcel : (g ∘ f) ∘ h = g ∘ ID Y
  rw [h1] at hcel                       -- hcel : ID X ∘ h = g ∘ ID Y
  have h6 : (ID X) ∘ h = h := by rfl    -- z definicji
  have h7 : g ∘ (ID Y) = g := by rfl    -- z definicji
  rw [h6] at hcel                       -- hcel : h = g ∘ ID Y
  rw [h7] at hcel                       -- hcel : h = g
  exact hcel
```

Zwracam uwagę, że ten mocno przegadany dowód polega w istocie tylko na "rozwinięciu" prawdziwego na mocy
założenia `f h = Id` zdania ...

`g (f h) = g Id`

... jakby w obie strony:

`h = Id h = (g f) h = g (f h) = g Id = g`

Można to zrobić w Leanie na (nieskończenie) wiele innych sposobów, w tym również (znacznie)
prościej, ale chciałem Ci pokazać kilka nowych sztuczek. Instrukcja `rw [h5] at hcel` sprawia tutaj,
że - występująca w już udowodnionej w momencie zastosowania tej instrukcji hipotezie `hcel` - lewa
strona równości, będącej udowodnioną już wtedy hipotezą `h5`, czyli `g ∘ (f ∘ h)`, zostaje
zastąpiona *wewnątrz zdania* `hcel` (to własnie powoduje dodatkowy argument `at hcel`) przez prawą
stronę `h5`, czyli przez `(g ∘ f) ∘ h`. To pozwala potem w analogiczny sposób zastąpić w zmienionej
wersji `hcel` term `(g ∘ f)` przez term `(ID X)`. Wszystkie kroki tego dowodu możesz prześledzić
przeklejając ten fragment kodu do Leana i patrząc, jak zmienia się stan dowodu, kiedy
przesuwasz kursor za kolejne instrukcje.

Skoro poznałaś już najogólniejszą definicję izomorfizmu i wiesz, że kategoryjne odwrotności są
unikalne (a stąd od razu wynika, że wszystkie tego rodzaju odwrotności, a więc również te
teoriotypowe i teoriomnogościowe, są unikalne), możemy wrócić do narysowanych już przez Ciebie dwóch
produktów kategoryjnych połączonych wygiętymi strzałkami.

## Wszystkie pary produktów tych samych punktów są kanonicznie izomorficzne

**Rysunek 2**: Pod ostatnim rysunkiem `Narysuj` proszę tak samo jeden nad drugim dwa produkty, ale
tym razem niech to będą *te same* dwa produkty `P` i `P`, z *tymi samymi* projekcjami (nazywanymi
oficjalnie raczej *rzutami kanonicznymi*, ale nie lubię tej nazwy) `π₁` i `π₂`. Skoro mamy tutaj
parę współźródłowych strzałek z górnego `P` do `X` i `Y`, są nimi przecież górne kopie projekcji
`π₁` i `π₂`, to musi istnieć unikalna (`∃¹`) strzałka `f` z górnego `P` do dolnego `P` taka, że ...

`π₁ f = π₁` i `π₂ f = π₂`

... a skoro każdy punkt jest wyposażony w swoją identyczność i identyczność `P` spełnia (z definicji
identyczności) oba te wymagania, to jest `π₁ Id = π₁` i `π₂ Id = π₂`, to skoro `f` jest *unikalną*
taką strzałką i `Id` też jest taką strzałką, to `f = Id`! A więc:

Dla każdego produktu `P`, `Id : P → P = ⟨π₁,π₂⟩`, gdzie `π₁` i `π₂` to projekcje `P`.

**Pisanie dowodów palcem po kartce**: Pokażę Ci teraz coś moim zdaniem interesującego. `Narysuj`
najpierw proszę, wygięte w łuk tak, żeby na siebie nie nachodziły, dwie strzałki z górnego `P` do
dolnego `P` i oznacz je jako `Id` i `f`. W środku lewego i prawego skrzydła tego diagramu dodaj
ptaszki, zaznaczając w ten sposób, że te części diagramu są przemienne na mocy definicji
identyczności i produktu strzałek. Dodatkowo, w środku między dwiema wygiętymi w łuk, skierowanymi w
dół strzałkami, dopisz jeszcze `∃¹`, żeby wyrazić w ten sposób, że serce tego diagramu jest też jest
przemienne.

A teraz połóż proszę koniec palca wskazującego na górnym `P` i przesuwając palec po kartce prześledź
płynnie i niezbyt wolno dwie ścieżki - z górnego `P` przez `Id` i `π₁` do `X`, a potem znowu z
górnego `P` przez zewnętrzną strzałkę `π₁` do `X`. W ten sposób przywołasz równość strzałki `π₁` i
złożenia `π₁ ∘ Id`. Tak samo udowodnij, że `π₂ Id = π₂`. Te dwa pisane palcem po kartce dowody są
razem dowodem, że `Id = f`. Następnie, przesuwając palec po diagramie udowodnij tak samo, że `f =
<π₁,π₂>`. Na koniec, wracając za każdym razem najpierw do górnego `P`, prześledź jeszcze palcem
rysunki strzałek `Id` i `f`. [Quod erat incantandum](https://en.wikipedia.org/wiki/Q.E.D.).

Możemy teraz wrócić do poprzedniego diagramu. Masz tam dwa (potencjalnie takie same) produkty tych
samych punktów, to jest `P` i `P'`, złożone z dwóch par (potencjalnie takich samych) projekcji. I
masz tam dwie strzałki, `f` i `g`, spełniające warunki ...

`h1`. `π₁' f = π₁` i `π₂' f = π₂`

`h2`. `π₁ g = π₁'` i `π₂ g = π₂'`

... i wiesz, że obie strzałki są unikalnymi strzałkami spełniającymi dotyczące tych strzałek
warunki. Czy domyślasz się już, co się teraz stanie? Te dwie strzałki są składalne na dwa
sposoby. Złożenie `g f` ma taką własność, że ...

`π₁ (g f) = π₁' f = π₁`  
(bo łączność składania, `h2` i `h1`)

... i ...

`π₂ (g f) = π₂' f = π₂`  
(bo łączność składania, `h2` i `h1`)

... i tak samo złożenie `f g` ma taką własność, że `π₁' g f = π₁'` i `π₂' g f = π₂'`, co jak sądzę
po pewnym czasie i być może kilku mniej udanych początkowych próbach będziesz mogła udowodnić sama,
korzystając z ostatniego dowodu jako wzorca. Spróbuj więc proszę wykonać ten dowód jako
zaklęcie. Ale bądź ostrożna, bo to będzie wymagało między innymi wodzenia palcem po czterech
pętlach, to jest po pętli `f g`, `g f` i po dwóch pętlach identycznościowych.

Co z tego wszystkiego wynika?

Projekcje złożenia `(g f) : P → P` są takie same jak projekcje `Id : P → P`, a skoro taka strzałka
jest zgodnie z definicją produktu unikalna, to `g f = Id`. Tak samo projekcje złożenia `(f g) : P' →
P'` są takie same jak projekcje `Id' : P' → P'`, a skoro taka strzałka jest unikalna, to `f g =
Id`. A więc `g` jest (kategoryjną) odwrotnością `f`, czyli `g = f⁻¹`, a więc to są izomorfizmy. Tym
samym widzimy, że:

*Każda para kategoryjnych produktów tych samych punktów jest izomorficzna i w każdą stronę istnieje
kanoniczny izomorfizm, który zamienia jeden z tych produktów w drugi*.

Każdy z tych izomorfizmów nazywamy
[*kanonicznym*](https://sjp.pwn.pl/doroszewski/kanoniczny-I;5437673.html), bo każdy z nich jest w
pewnym sensie "narzucający się", albo "wzorcowy", albo "charakterystyczny", albo "podstawowy". W
końcu `f` uzyskaliśmy *w jedyny możliwy sposób korzystając z samych projekcji produktu* `P` i tak
samo `g` uzyskaliśmy w jedyny możliwy sposób korzystając z samych projekcji produktu `P'`. Na koniec
zerwiemy jeszcze z tego drzewa poznania tego co dobre i uniwersalne soczysty, nisko rosnący owoc.

**Kanoniczna izomorficzność jako uogólnienie równości**: Skoro każda para produktów tych samych
punktów (inaczej: obiektów) jest wyposażona w *kanoniczną*, albo taką jakby "własną" metodę wymiany
jednego z nich na drugi bez żadnej utraty "funkcjonalności" (pun intended), to takie produkty są
*zastępowalne* w ogólniejszym znaczeniu niż obiekty, które są po prostu *równe*. Równe obiekty
możemy wymieniać bez zmiany treści zdań czy konstrukcji nie stosując żadnych dodatkowych operacji,
ale kanonicznie izomorficzne obiekty też możemy wymieniać *w pewnym sensie* bez żadanych dodatkowych
operacji, ponieważ co prawda to wymaga na przykład przekształcenia projekcji wymienianego na inny
produktu, ale wtedy *nie musimy wskazywać* metody transmutacji, ponieważ istnieje dokładanie jedna
taka (kanoniczna) metoda w każdą stronę.

**Potencjalnie dezorientujący fragment**: Załóżmy, że mamy parę strzałek `a : P → X` i `b : P →
Y`. Wtedy istnieje unikalna strzałka `⟨a,b⟩` taka, że `π₁ ⟨a,b⟩ = a` i `π₂ ⟨a,b⟩ = b`. A czy `π₁' g`
i `π₂' g` zachowują się jak `π₁` i `π₂`?  Już wiesz, że tak, bo wiesz, że to są te same strzałki:
`π₁' g = π₁' ⟨π₁,π₂⟩ = π₁` i tak samo dla `π₂' g`.

A czy zauważyłaś, że *sam produkt* jest pewnym izomorfizmem? Produkt punktów `X` i `Y` każdej parze
współźródłowych strzałek `f` i `g` do `X` i `Y` odpowiednio przyporządkowywuje dokładnie jedną
strzałkę `h` taką, że `π₁ h = f` i `π₂ h = g`. I odwrotnie, każda strzałka `h` z tego samego źródła
co dowolne takie strzałki `f` i `g` odpowiada dokładnie jednej parze strzałek do `X` i `Y`, będących
złożeniami `π₁ h` i `π₂ h`, bo przecież złożenia są z definicji unikalne. A więc produkt to również
taki wymieniacz takich strzałek do produktu i uporządkowanych par strzałek do jego "punktów
końcowych", że wszystkie te strzałki mają to samo źródło. Ten izomorfizm nie jest jednak
izomorfizmem w tej samej kategorii, bo nie jest strzałką w tej kategorii, a tego wymaga kategoryjna
definicja izomorfizmu.
