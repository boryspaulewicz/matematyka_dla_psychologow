## O czym teraz będzie

W tym rozdziale pokażę Ci *dowód*, że *struktura wewnętrzna* iloczynu kartezjańskiego zbiorów *nie
ma* (matematycznego) *znaczenia*, bo *każdy* zbiór *izomorficzny* z danym zbiorem, niezależnie od
tego, jakie elementy zawiera, może *pełnić tą samą kategoryjną rolę*, w tym również rolę
kategoryjnego produktu (jeśli dany zbiór jest akurat produktem). Wprowadzę też *kategoryjną*
definicję izomorfizmu. Posługując się tą definicją i definicją produktu będziesz mogła razem ze mną
udowodnić, że kategoryjne produkty są określone tylko z dokładnością do (kanonicznego) izomorfizmu,
i że są dzięki temu - w interesującym, ogólniejszym znaczeniu niż na to pozwala równość, ale
praktycznie tak samo - *zastępowalne*.

Treści zawarte w tym rozdziale będą niemal do samego końca technicznie stosunkowo proste, to znaczy,
dowody będą "się" niemal "robiły same", co jest zresztą cechą charakterystyczną i wielką zaletą
wielu dowodów kategoryjnych. Jednocześnie jednak, z powodu ekstremalnego poziomu abstrakcji,
połączonego z bliskością narzucającego się przykładu kategorii zbiorów i funkcji, trudności w
dopatrzeniu się w tym wszystkim sensu mogą być początkowo spore. Dlatego jeszcze raz uprzedzam, że
użyteczność kategoryjnego punktu widzenia, z którym próbuję Cię już od pewnego czasu oswoić, być
może nieprędko stanie się dla Ciebie oczywista.

Sugeruję więc, żebyś czytając ten rozdział nigdzie się nie spieszyła. Być może będzie Ci łatwiej,
jeśli czasem wrócisz do poprzedniego rozdziału i do rysunkowej definicji produktu kategoryjnego. Jak
zawsze przyda się też anielska (nomen omen) cierpliwość.

# X ← '∘ → Y ≅! X ← ∘' → Y

Najpierw krótko i bez sensu.

## Krótko i bez sensu

Ta część jest tylko po to, żeby pokazać Ci, że można prawie wszystko, o czym będę mówił w tym
rozdziale, powiedzieć znacznie krócej. Być może przyda Ci się to od pewnego momentu jako przykład
(wciąż o wiele za mało jak na potrzeby generatywnego powtarzania) skrótowej notatki, ale wtedy
należałoby moim zdaniem dodać diagramy.

*Izomorfizmem (kategoryjnym)* nazywamy taką strzałkę `f : X → Y`, że istnieje taka strzałka
(przeciwrównoległa) `g : Y → X`, że `f g = Id` i `g f = Id`. Strzałkę `g` nazywamy wtedy
*odwrotnością* strzałki `f`, a strzałkę `f` *odwrotnością* `g`.

Każda strzałka ma co najwyżej jedną odwrotność, ponieważ jeżeli `g` i `g'` są odwrotnościami `f`,
to[^1]:

`g = g Id = g (f g') = (g f) g' = Id g' = g'`.

Tak rozumiana odwrotność jest więc pewnego rodzaju (jednoargumentowym i wybrednym) *działaniem* na
(pewnych) strzałkach, dlatego dla każdej strzałki `f`, jej odwrotność, *o ile istnieje*, możemy
oznaczyć jako `f⁻¹`. Gdy taka odwrotność *nie* istnieje, *zapis `f⁻¹` nic nie znaczy* (bo nie jest
poprawny).

Załóżmy, że `P` jest kategoryjnym produktem z projekcjami `π₁ : P → X` i `π₂ : P → Y`. Wtedy z
definicji (produktu kategoryjnego), dla każdego punktu `A` i pary strzałek `f : A → X` i `g : A →
Y`, istnieje unikalna strzałka `h : A → P` taka, że `π₁ h = f` i `π₂ h = g`. Ponieważ `h` jest
unikalną taką strzałką, możemy ją oznaczyć jako `<f,g>` (a więc w tym kontekście `<,>` to wybredne
działanie na parach strzałek).

Ponieważ każdy produkt sam dostarcza, będącą jego projekcjami `π₁` i `π₂`, parę takich strzałek, to
dla każdego produktu istnieje unikalna strzałka `<π₁,π₂>` taka, że `π₁ <π₁, π₂> = π₁` i `π₂ <π₁,π₂>
= π₂`. A ponieważ `Id : P → P` również spełnia te dwa warunki, bo `π₁ Id = π₁` i `π₂ Id = π₂`, to z
unikalności takiej strzałki wynika, że:

`Id = <π₁,π₂>`

Dla każdych dwóch produktów `P` i `P'` tych samych punktów `X` i `Y`, istnieją strzałki `<π₁,π₂> : P
→ P'` i `<π₁',π₂'> : P' → P`, spełniające warunki `π₁ <π₁',π₂'> = π₁'`, `π₂ <π₁',π₂'> = π₂'`, `π₁'
<π₁,π₂> = π₁` i `π₂' <π₁,π₂> = π₂`. Dla wygody oznaczymy te strzałki jako `f := <π₁,π₂>` i `g :=
<π₁',π₂'>`.

Strzałki `f` i `g` są przeciwrównoległe, a więc składalne na dwa sposoby, to jest `f g` i `g f`. O
strzałce będącej złożeniem `f g` wiemy, że:

`π₁' (f g) = (π₁' f) g = (π₁' <π₁,π₂>) g = π₁ g = π₁ <π₁',π₂'> = π₁'`

`π₂' (f g) = (π₂' f) g = (π₂' <π₁,π₂>) g = π₂ g = π₂ <π₁',π₂'> = π₂'`

A więc `f g = ⟨π₁', π₂'⟩ = Id` (czy może raczej `Id'`). W ten sam sposób można wykazać, że `g f =
Id`. A więc (definicja izomorfizmu) `g = f⁻¹` (albo równoważnie `f = g⁻¹`).

Widzimy, że *produkty tych samych punktów są kanonicznie izomorficzne* w tym znaczeniu, że istnieje
między nimi para izomorfizmów powstających "naturalnie" albo "w oczywisty sposób" z ich
projekcji. Widzimy też, że izomorfizmy pozwalają wymieniać jeden produkt tych samych punktów na
drugi zachowując "funkcjonalność" polegającą na *byciu parą projekcji produktu*.

A teraz długo, powtarzając się, czasami z sensem, i korzystając z nieocenionej pomocy diagramów.

## Długo i czasami z sensem

Jeżeli ...

`X = {1, 2}` i `Y = {a, b}`

... to zbiór ... 

`Z := {(1, a), (2, a), (1, b), (2, b)}` 

... jest iloczynem kartezjańskim zbiorów `X` i `Y`. Ale czym *tak naprawdę* jest iloczyn
kartezjański zbiorów? I czy to jest w ogóle *dobrze postawione pytanie*? Przecież raczej *nie ma
jednego uniwersalnie najlepszego punktu widzenia*?

Na przykład, zbiór `V = {1, 2, 3, 4}` co prawda *nie wygląda* jak `Z` (czyli `X × Y`), ale jest do
niego *podobny pod tym względem*, że *ma tyle samo elementów*. A to znaczy, że między tymi dwoma
zbiorami istnieje co najmniej jeden *izomorfizm*, ponieważ na tym właśnie, to jest na
*równoliczności* (czyli na posiadaniu tej samej [liczby kardynalnej, inaczej
mocy](https://pl.wikipedia.org/wiki/Moc_zbioru)) polega izomorficzność *zbiorów*.

Zrobię teraz bez rysowania coś, co robiłaś wcześniej rysując strzałki wychodzące od poszczególnych
elementów, to jest zdefiniuję pewną funkcję z `V` do `X × Y` i nazwę ją `f`:

`f(1) := (1, a)`

`f(2) := (2, a)`

`f(3) := (1, b)`

`f(4) := (2, b)`

Widzisz, że to są takie "wewnętrzne strzałki" funkcji, tylko teraz są "nieco mniej rysunkowe"? Może
nie od razu to widać, ale ta funkcja *przypomina identyczność*. Identyczność paruje *ze sobą*
wszystkie elementy swojej dziedziny i jednocześnie przeciwdziedziny w taki sposób, że:

1. Każdy element jest sparowany z jakimś elementem dla niego *charakterystycznym* (czyli żaden inny
element nie jest sparowany z tym elementem).

2. Żaden element przeciwdziedziny nie zostaje na lodzie.

A więc identyczność to szczególny przypadek funkcji zarazem *injektywnej* (1) i *surjektywnej* (2),
czyli *bijektywnej*, czyli funkcji izomorficznej, czyli szczególny przypadek izomorfizmu.

Ta tutaj funkcja `f` również 1. paruje każdy element `V` z jakimś elementem charakterystycznym
i 2. nie zostawia żadnego elementu przeciwdziedziny na lodzie, a więc tak jak każda identyczność,
`f` jest izomorfizmem, ale w przypadku funkcji `f` dziedzina i przeciwdziedzina *nie* są tym samym
zbiorem. Funkcja izomorficzna to zatem pewne *uogólnienie identyczności*, albo taka - potencjalnie,
bo identyczność też jest izomorfizmem - "nonszalancka identyczność".

Możemy rozstrzygnąć mechanicznie, czyli formalnie udowodnić, że `f` jest izomorfizmem, *podając
przykład* takiej (przeciwrównoległej) funkcji `g` z `X × Y` do `V`, że `∀ v ∈ V, g(f(v)) = v` i
jednocześnie `∀ x ∈ X × Y, f(g(x)) = x`, czyli spełniającej warunki `g f = Id` i `f g = Id`. Oto
jedyna możliwa taka funkcja:

`g((1, a)) := 1`

`g((2, a)) := 2`

`g((1, b)) := 3`

`g((2, b)) := 4`

Jak łatwo sprawdzić, `g = f⁻¹`. Tutaj trzeba sprawdzić `4 * 2` równości, bo tyle jest elementów i
tyle jest kierunków, ale chyba nie warto tego robić, widać je przecież niemal "gołym okiem".

Izomorfizmy zawsze występują w *parach*, dlatego często mówimy, że istnieje izomorfizm *między*
jakimiś zbiorami, nie wskazując z którego zbioru do którego to jest izomorfizm, i dlatego mówimy też
często, że jakieś dwa zbiory *są izomorficzne*, mając na myśli, że istnieje między nimi co najmniej
jeden izomorfizm w dowolnym kierunku. Mówiąc, że dwa zbiory są izomorficzne, mówimy więc, że są
takie same, ale w znaczeniu słabszym niż tego wymaga identyczność. To nie znaczy, że *nie* są
"całkiem" identyczne, tylko że mówiąc jedynie, że są izomorficzne, nie przesądzamy jeszcze, że są
"całkiem" identyczne.

Gdy tylko mamy ochotę, możemy to wyrazić pół-formalnie na przykład tak:

`1 ~ (1, a)`

`2 ~ (2, a)`

`3 ~ (1, b)`

`4 ~ (2, b)`

gdzie, jak się później przekonamy, symbol `~` możemy rozumieć jako zastępowalność w słabszym sensie
niż tego wymaga równość czy identyczność. Gdy chcemy oznaczyć jako izomorficzne dwa zbiory `U` i
`W`, piszemy zwykle:

`U ≅ W` 

Symbol `≅` przypomina symbol `=`, ale ma jeszcze na górze falkę, którą nazywamy
[*tyldą*](https://pl.wikipedia.org/wiki/Tylda), i która sugeruje, że mamy *niekoniecznie* (bo to w
ogólnym przypadku *może* być też identyczność) do czynienia ze ścisłą identycznością.

I to też jest pewien izomorfizm między zbiorami `V` i `X × Y`, ale inny niż `f`:

`1 ~ (1, a)`

`2 ~ (1, b)`

`3 ~ (2, a)`

`4 ~ (2, b)`

Czy widzisz, że izomorfizmów w jedną stronę jest tutaj dokładnie tyle, na ile sposobów można
wymienić po kolei cztery elementy? Jako pierwszy możemy wymienić którykolwiek z czterech elementów
`X × Y`, ale gdy już jakiś wybierzemy, zostaną nam do wyboru tylko trzy, a gdy wybierzemy, który ma
być wymieniony jako drugi, zostaną nam tylko dwa, a gdy wybierzemy, który ma być wymieniony jako
trzeci, nie będziemy już mieli wyboru, bo zostanie tylko jeden: `4 * 3 * 2 * 1 = 24 = 4!`. A więc
istnieje właśnie tyle izomorfizmów w jedną stronę między każdymi dwoma zbiorami
czteroelementowymi. A więc musi istnieć dokładnie tyle izomorfizmów w drugą stronę.

Ponieważ taki *pary* są - jako wzajemne odwrotności - *nierozłączone*, bo każdy izomorfizm ma swoją
charakterystyczną odwrotność, możemy powiedzieć, że dwa zbiory czteroelementowe są izomorficzne na
24 różne sposoby, gdzie każdy *sposób* jest jedną *parą* izomorfimów, będących nawzajem swoimi
odwrotnościami.

### Żeby było wiadomo, o co chodzi, metodę tłumaczenia trzeba *wybrać*

Skoro zbiory `V` i `X × Y` są izomorficzne, to *zamiast mówić o elementach* `X × Y`, *możemy równie
dobrze mówić o elementach* `V`, *o ile* wcześniej *wskażemy* jakiś *izomorfizm*. Gdybyśmy żadnego
nie wybrali, nie byłoby wiadomo, o którym elemencie `x ∈ X × Y` byśmy mówili, gdybyśmy mówili na
przykład o `1 ∈ V`. Ale jeżeli tylko *wskażemy* na przykład `f` jako *konwencję nazywania inaczej
elementów* `X × Y` *za pomocą elementów* `V`, to `1` będzie oznaczało (to samo co) `(1, a)`, `2`
będzie oznaczało (to samo co) `(2, a)`, i tak dalej. Wtedy:

1. *Każdy* elemenet `V` będzie poprawną nazwą *jakiegoś* elementu `X × Y`.  
(bo to jest funkcja)

2. Nie będzie wątpliwości, o *który* element `X × Y` nam chodzi.  
(bo ta funkcja jest injektywna)

3. Będziemy mogli tak mówić o *wszystkich* elementach `X × Y`.  
(bo ta funkcja jest surjektywna)

To będzie więc takie wierne tłumaczenie w obie strony; od momentu, gdy wybierzemy taki mechanizm
wiernego tłumaczenia, będziemy mogli się dowolnie przełączać między tymi dwoma sposobami mówienia
zachowując sens tego, co mówimy, jaki by on nie był.

Jak bardzo ten wybór konkretnego izomorfizmu pozwala traktować zbiór `V` jakby był *takim samym*
zbiorem jak `X × Y`? Niemal całkowicie, a dokładniej, możemy traktować te dwa zbiory jakby *jedyną*
różnicą między nimi było to, *jakie konkretnie elementy do nich należą*. Ale przecież *to i tylko to
decyduje o tożsamości zbioru*, a więc jak to "niemal całkowicie"?

Doskonałe pytanie. Tożsamość elementów faktycznie decyduje o **tożsamości** zbioru, czyli o jego
*wymienialności ze względu na równość*, ale to *nie* decyduje o jego **roli**, to jest o *możliwych
saposobach użycia zbioru*. Zbiory, tak samo jak *wszystkie inne konstrukcje matematyczne czy
formalne*, to *nasze* (formalno-językowe i pojęciowe) *narzędzia*. Podobnie to, co konkretnie kupimy
na prezent *nie* decyduje o tym, *że* to będzie prezent, czyli że to coś będzie *spełniało rolę
prezentu*, to decyduje tylko o tym, *jaki konkretnie* to będzie prezent.

Wystarczy teraz, że *wskażemy* jako *nasze projekcje* funkcje `π₁ ∘ f` i `π₂ ∘ f` i natychmiast
każdy element `V` będzie "miał" *pierwszy element* i *drugi element*, i jednocześnie każdy element
`V` będzie *unikalnie scharakteryzowany* przez te dwie własności:

`(π₁ ∘ f)(1) = 1`, `(π₂ ∘ f)(1) = a`, a więc dzięki wybraniu `f` element `1` jest jak `(1, a)`

`(π₁ ∘ f)(2) = 2`, `(π₂ ∘ f)(2) = a`, a więc dzięki wybraniu `f` element `2` jest jak `(2, a)`

`(π₁ ∘ f)(3) = 1`, `(π₂ ∘ f)(3) = b`, a więc dzięki wybraniu `f` element `3` jest jak `(1, b)`

`(π₁ ∘ f)(4) = 2`, `(π₂ ∘ f)(4) = b`, a więc dzięki wybraniu `f` element `4` jest jak `(2, b)`

Wtedy każdy element zbioru `V` *stanie się dla nas parą uporządkowaną elementów* `X` i `Y`, ponieważ
*wszystkich elementów* `V` *będziemy mogli używać tak samo, jak wszystkich elementów* `X × Y`. Nie
będzie też nic dziwnego w korzystaniu z tej możliwości, bo przecież to są *tylko symbole* albo
*obiekty formalne*, które mają *służyć nam do jakich tylko chcemy dobrze określonych celów*. Czy
widzisz, że mimo tego, że `V` nie zawiera żadnych par, to możemy w ten sposób uzyskać dwie
"pełnowartościowe" projekcje ze zbioru `V` do zbiorów `X` i `Y`, a możemy je uzyskać właśnie dzięki
temu, że `f` jest *konkretnym izomorfizmem* z `V` do `X × Y`?

Jeśli skorzystamy z tej możliwości, to będzie tak, jakbyśmy "zrobili" za pomocą izomorfizmu elementy
iloczynu kartezjańskiego z elementów innego zbioru. Żeby skorzystać z tego rodzaju "wymienialności
implementacji" albo "realizacji" iloczynu kartezjańskiego musimy jedynie *wskazać jakikolwiek
konkretny izomorfizm między tymi zbiorami, wszystko jedno w którą stronę*, i *ogłosić*, jeżeli
*mówimy do kogoś innego*, albo tylko *pamiętać*, jeżeli *mówimy do siebie*, że *przyjęliśmy taką
konwencję*. A kiedy mamy ochotę snuć *ogólne* rozważania o *jakichkolwiek* iloczynach, możemy sobie
*wyobrazić*, że jakiś *Ktoś* mówi o nich do jakiegoś - być może tego samego - *Kogoś*.

### Pierwszy przelot

Teraz musimy uważać, bo *zmieniamy język*, a więc również punkt widzenia. Odtąd będziemy czasem
rozważać *dowolną* kategorię, to jest *jakąkolwiek kolekcję strzałek spełniającą wymagania*
(zapisane maksymalnie skrótowo, bo bez symbolu składania i bez jawnego oznaczania źródeł i celów)
*kategoryjnego składania strzałek*:

1. `Id f = f = f Id`

2. `h (g f) = (h g) f`

Będzie się być może wydawało, że mówimy nadal o tym samym, tylko trochę inaczej, bo w tle mamy na
razie tylko przykład zbiorów i funkcji, ale to wbrew pozorom *radykalna* zmiana punktu widzenia, a
więc też radykalna zmiana sposobu myślenia.

Warto wiedzieć, że wyrażające samo sedno bycia kategorią warunki 1 i 2 to coś, co trzeba *tylko raz
sprawdzić* gdy chcemy się upewnić, czy jakieś "byty" można postrzegać abstrakcyjnie albo badać jako
pewną kategorię. Jeżeli tylko te dwa warunki będą spełnione dla wszystkich obiektów, które zechcemy
na próbę oznaczyć strzałkami i dla wszystkich obiektów, które zechcemy spróbować traktować jako
punkty zaczepienia strzałek, a także dla operacji, którą zechcemy próbować traktować jako
kategoryjną operację składania strzałek, to będziemy mieli pewną kategorię.

Na przykład, wiemy już, że oznaczając zbiory za pomocą pozbawionych wewnętrznej struktury punktów
(czyli również *traktując* zbiory jako pozbawione wewnętrznej struktury punkty), funkcje jako
pozbawione wewnętrznej struktury strzałki, a operację składania funkcji jako abstrakcyjne składanie
strzałek, uzyskujemy pewną kategorię. Nawiasem mówiąc, ta kategoria nosi oficjalnie nazwę
[`Set`](https://en.wikipedia.org/wiki/Category_of_sets). Gdy tylko ustalimy, że warunki 1 i 2 są
spełnione ze względu na przyjątą interpretację punktów, strzałek, i składania, możemy o tych
warunkach zapomnieć, bo będą nam służyły - na ogół w tle - *tylko* do traktowania pewnych strzałek
jako elementów neutralnych i do pomijania nawiasów gdy zapisujemy złożenia.

No więc jeżeli `X` i `Y` to (tylko!) *punkty* w *jakiejkolwiek* kategorii, to ze względu na jego
związek z iloczynem zbiorów, produkt kategoryjny `X` i `Y` zapisujemy co prawda również jako ...

`X × Y`

... ale to jest dla nas *tylko punkt zaczepienia strzałek* i *interpretujemy* ten zapis jako wygodny
sposób mówienia i pisania o *dwóch współźródłowych strzałkach* ...

`π₁ : X × Y → X`  
`π₂ : X × Y → Y`

... spełniających warunek:

`∀ Z : Punkt, ∀ f : Z → X, ∀ g : Z → Y, ∃¹ h : Z → X × Y, (π₁ h = f) ∧ (π₂ h = g)`

Zacznę może od objaśnienia symbolu `∃¹`. Ten symbol **czytamy jako**: *Istnieje dokładnie jedno coś
takie, że ...*. Ponieważ mamy tutaj aż trzy duże kwantyfikatory, to dobra okazja, żeby zacząć się
uczyć o możliwości elastycznego czytania takich części formalnych zdań. Początek tego zdania
moglibyśmy poprawnie odczytać na przykład tak: 

*Dla każdego punktu `Z` i dla każdych funkcji `f` i `g` takich, że ...* 

To, że duże kwantyfikatory występują tu jeden po drugim, pozwala nam jednak odczytać to wszystko
inaczej, a dzięki temu, przynajmniej moim zdaniem, bardziej zrozumiale: 

*Dla dowolnych dwóch współźródłowych strzałek do punktów `X` i `Y` ...* 

Korzystamy w ten sposób z faktu, że duży kwantyfikator to (między innymi) zapowiedź, że zaraz pojawi
się parametr, a więc zmienne związane dużymi kwantyfikatorami, takie jak tutaj `Z`, `f`, i `g`,
pełnią rolę zaimków. To samo zresztą dotyczy symbolu `h`, ale ponieważ jeszcze nie mówiliśmy o
kwantyfikatorze egzystencjalnym, to może nie być takie oczywiste.

Być może łatwiej jest zapamiętać kategoryjną definicję produktu myśleć o niej w kategoriach czegoś
przypominającego *dzielenie liczb*: Jeżeli `A` jest kategoryjnym produktem `X` i `Y`, to istnieją
strzałki `π₁ : A → X` i `π₂ : A → Y` takie, że dla każdej pary strzałek `f : Z → Y` i `g : Z → X`
istnieje jedna i tylko jedna strzałka `h`, przez którą "dzielą się projekcyjnie" strzałki `f` i `g`,
to jest która spełnia warunek `f = π₁ h` i `g = π₂ h`. Czy widzisz, że to wygląda tak, jakby `h`
było jedynym "`π`-dzielnikiem" `f` i `g`?

Dlatego właśnie, że taka strzałka jakby "wynika" w ten sposob z `f` i `g`, możemy ją zapisać jako
`⟨f,g⟩`, albo możemy stwierdzić, że `h = ⟨f,g⟩`. To będzie *jedyna* własność produktu, z której
będziemy korzystać w tym rozdziale. Będziemy więc czasem szukać dwóch strzałek `h` i `h'` takich, że
obie "`π`-dzielą" tą samą parę współźródłowych strzałek `f` i `g`, i na tej podstawie będziemy
wyprowadzać wniosek, że `h = h'`. Albo będziemy dochodzić do wniosku, że `h = ⟨f,g⟩` i `h' = ⟨f,g⟩`,
a więc `h = h'`. Jak widzisz, zgodnie z tym, co zapowiedziałem na początku, algebraicznie wszystko
będzie w tym rozdziale (niemal do końca) dosyć proste.

Skorzystamy teraz z dopiero co wprowadzonej definicji produktu kategoryjnego, żeby ustalić coś na
temat *wszystkich możliwych implementacji produktu we wszystkich możliwych kategoriach*, a więc
między innymi również na temat iloczynów kartezjańskich zbiorów, które są produktami w kategorii
zbiorów i funkcji. Przyjmiemy w tym celu, że mamy jakieś (a więc to będzie dowód zdania
zaczynającego się od *Dla każdego*) dwa, niekoniecznie różne produkty jakiś punktów `X` i `Y`. A
żeby uprościć notację, jak również podkreślić, że ignorujemy ewentualną wewnętrzną strukturę tego,
co mogłyby oznaczać punkty i strzałki, oznaczymy te produkty jako `P` i `P'`.

Jak już wiesz, gdy nazywamy jakieś punkty produktami, nie chodzi nam tak naprawdę tylko o te punkty,
tylko (nawet bardziej) o pewne specjalne pary współźródłowych strzałek, które ze względu na operację
składania kategoryjnego zachowują się tak samo, jak projekcje iloczynu kartezjańskiego zachowują się
ze względu na operację składania funkcji. Zgodnie z przyjętą właśnie (niejawnie) konwencją,
polegającą na dodawaniu apostrofu żeby oznaczyć drugi (potencjalnie ten sam) produkt, będziemy tak
samo oznaczać kategoryjne strzałki-projekcje:

To będą zatem projekcje produktu `P` ...

`π₁ : P → X` i `π₂ : P → Y`

... a to będą (niekoniecznie inne) projekcje (niekoniecznie różnego od `P`) produktu `P'`

`π₁' : P' → X` i `π₂' : P' → Y`.

**Rysunek 1**: `Narysuj` proszę `Punkt P`, a o dobry krok pod nim `Narysuj (Punkt P')`. Na wysokości
gdzieś pomiędzy tymi punktami `Narysuj` po lewej `Punkt X` a po prawej `Punkt Y`. Dodaj, jako
strzałki oznaczone odpowiednimi nazwami, wszystkie cztery projekcje, uważając przy tym, żeby
apostrofy pojawiły się tam, gdzie powinny, czyli tylko w dolnej części tego rysunku, ale nie przy
literach `X` i `Y`. Dodaj też proszę pętle strzałek identycznościowych nad `P` i pod `P'`, i oznacz
je obie jako `Id`. Nie *musimy* co prawda rysować takich strzałek, bo *wiemy*, że *każdy*
kategoryjny punkt ma taką *unikalną* i *charakterystyczną* (albo "prywatną") strzałkę, ale tym razem
to się do czegoś przyda.

Założyliśmy, że obie pary poziomych strzałek są w naszej bliżej nieokreślonej kategorii produktami
tych samych dwóch punktów `X` i `Y`. Zgodnie z definicją produktu, dla każdej pary współźródłowych
strzałek do `X` i `Y` istnieje unikalna strzałka do `P'`, z której można zrekonstruować te dwie
strzałki składając ją z projekcjami `P'`. Czy widzisz na swoim rysunku, że już w tym momencie *mamy*
dwie współźródłowe strzałki do `X` i `Y`, które *nie* są projekcjami `P'`?  So nimi oczywiście (mogę
już pisać, że oczywiście?) projekcje produktu `P`.

Z definicji produktu wynika więc, że istnieje w tej sytuacji *co najmniej jedna* strzałka `f`, o
której wiesz (jeżeli to jeszcze pamiętasz), że `π₁' f = π₁` i `π₂' f = π₂`. A ponieważ definicja
produktu mówi również, że istnieje *co najwyżej jedna* taka strzałka, to strzałka `f` jest *funkcją*
(albo *własnością*) uporządkowanej pary współźródłowych strzałek `π₁` i `π₂`, wobec czego możemy ją
oznaczyć również jako `⟨π₁,π₂⟩`. Dlatego `Narysuj` proszę tą strzałkę, ale tak, żeby była wygięta w
łuk w lewą (czyli patrząc z góry w prawą) stronę, bo będzie trzeba tam zmieścić jeszcze jedną
analogiczną strzałkę w drugą stronę. Następnie oznacz proszę tą strzałkę z lewej jako `f =
⟨π₁,π₂⟩`. *My* będziemy, przynajmniej na razie, nazywać takie strzałki *produktami strzałek*, ale
powinnaś wiedzieć, że oficjalnie nazywa "się" je [*produktami
morfizmów*](https://pl.wikipedia.org/wiki/Produkt_(teoria_kategorii)).

Czy widzisz, że istnieje również analogicznie unikalna strzałka w drugą stronę? Narysuj ją proszę w
podobny sposób, tylko tak, żeby tworzyła łuk wygięty w drugą stronę, i oznacz ją z prawej jako `g =
⟨π₁',π₂'⟩`. Oto wszystko, co na razie wiemy - zakładając tylko aksjomaty kategorii i stosując
kategoryjną definicję produktu - o tych dwóch strzałkach:

1. `π₁' f = π₁' ⟨π₁,π₂⟩ = π₁` i `π₂' f = π₂' ⟨π₁,π₂⟩ = π₂`

2. `π₁ g = π₁ ⟨π₁',π₂'⟩ = π₁'` i `π₂ g = π₂ ⟨π₁',π₂'⟩ = π₂'`

Jeżeli to dla Ciebie w tym momencie trochę za wiele symboli na raz, to pamiętaj, że zawsze możesz
próbować uprościć zapis algebraiczny stosując tymczasowe oznaczenia, które możesz rozpakowywać
dopiero wtedy, gdy to będzie potrzebne:

1. `π₁' f = π₁` i `π₂' f = π₂`

2. `π₁ g = π₁'` i `π₂ g = π₂'`

Domyślam się, że to może być dezorientujące, bo posługujemy się tutaj algebrą i diagramem
maksymalnie abstrakcyjnie, w oderwaniu od jakichkolwiek konkretnych przykładów (implementacji
jakiejś) kategorii. Niestety, w tym momencie nie mogę Ci pomóc inaczej niż sugerując, żebyś znowu
potraktowała to, co teraz robimy, jakby to była *gra*, która nie musi mieć *w tym momencie*
sensu. Jeśli tylko uda Ci się tak do tego podejść, to będziesz mogła się skupić na czysto
mechanicznych operacjach, które będą tylko trochę bardziej skomplikowane niż te, które wykonywałaś
dowodząc twierdzenie Bayesa.

Założę odtąd, że albo już wiesz, albo dowiesz się w końcu, powtarzając treści z tego rozdziału, że
strzałki `f` i `g` muszą istnieć i muszą być unikalnymi strzałkami spełniającymi wymienione wyżej
wymagania. Ustalimy teraz, jak te dwie strzałki *mają się do siebie nawzajem*.

Na "Twoim" diagramie od razu widać, że te dwie strzałki są składalne na dwa sposoby, to jest w
kolejności `f g` i `g f`. Kategoryjne diagramy pozwalają łatwo *zobaczyć*, które strzałki można
składać z którymi. Czy widzisz, że dzięki temu takie diagramy mogą być bardzo pomocne w
rozwiązywaniu problemów algebraicznych? Gdybyś nie miała przed oczami tego diagramu i napisałbym, że
(pomijając identyczności) dopuszczalne są *tylko* złożenia `f g`, `g f`, `π₁' f`, `π₂' f`, `π₁ g` i
`π₂ g`, to trudno byłoby Ci to wszystko zapamiętać, prawda? Dzięki diagramowi możesz to wszystko
łatwo *zobaczyć*.

Wiesz, że dwa *iloczyny kartezjańskie tych samych zbiorów* są izomorficzne. To może da się jakoś
wykazać, że strzałki `f` i `g` też są, a nawet muszą być, izomorfizmami, które w dodatku są swoimi
odwrotnościami, a więc *dwa kategoryjne produkty tych samych punktów* są też izomorficzne? Żeby to
wykazać, musimy najpierw wprowadzić jeszcze jedną definicję kategoryjną.

### Kategoryjny izomorfizm

*Izomorfizmem (kategoryjnym)* nazywamy taką strzałkę `f`, że istnieje strzałka `g` spełniająca
warunki `g f = Id` i `f g = Id`.

Czyli (kategoryjny) izomorfizm to *strzałka* (a więc niekoniecznie funkcja), która ma strzałkę
odwrotną. I tyle, to jest cała kategoryjna definicja izomorfizmu. Zwróć proszę uwagę, że ta
definicja nie mówi nic na temat wewnętrznej struktury tego, co mogłyby reprezentować punkty i
strzałki, jest więc "czysto złożeniowa", a dzięki temu maksymalnie ogólna.

Udowodnimy teraz na kilka sposobów, że dla dowolnej strzałki `f`, istnieje co najwyżej jedna
obustronnie odwrotna strzałka `g`: Jeżeli jakaś strzałka `h` również spełnia te same dwa warunki co
`g`, czyli jeżeli `h f = Id` i `f h = Id`, to ...

`h = Id h = (g f) h = g (f h) = g Id = g`  
(zawsze można dołożyć `Id` do złożenia nie zmieniając go, `Id = (g f)` z założenia, `(g f) h = g (f
h)` bo łączność, `(f h) = Id` z założenia, `Id` jest elementem neutralnym)

... albo prościej, chociaż może mniej czytelnie, korzystając z tego, że z powodu łączności składania
 nawiasy są niepotrzebne ...

`h = Id h = g f h = g Id = g`

Zauważyłaś, że zrozumienie tego ostatniego dowodu wymaga, żeby *zobaczyć* wyrażenie `g f h` *na dwa
sposoby*, raz jako `(g f) h`, które jest z założenia równe `Id h`, a raz jako `g (f h)`, które jest
z (innego) założenia równe `g Id`? Dlatego mam wątpliwości, czy ta wersja dowodu jest faktycznie dla
Ciebie *na tym etapie* prostsza.

A czy zauważyłaś, że tego rodzaju dowody polegają na wprowadzaniu w odpowiednich miejscach, w
*których nic wcześniej nie było*, tak zwanych *elementów neutralnych* (tutaj akurat "wyskakuje nam
znikąd" element neutralny `Id`), które to elementy można (z definicji) wstawiać wszędzie, a
następnie na zastępowaniu tych elementów wyrażeniami (tutaj akurat odpowiednimi złożeniami
strzałek), które się do nich (tutaj z definicji) redukują?

Można ten dowód zapisać jeszcze krócej, korzystając niejawnie również z założenia, że `g f = Id` i
`f h = Id` ...

`h = g f h = g`

... ale jeszcze bardziej obciążamy tak pamięć operacyjną, więc nie wiem, co o tym myśleć.

Możemy to udowodnić w Leanie dla *funkcji teoriotypowych* na przykład tak:

```lean
-- Uwaga: Ten dowód jest celowo nieco przegadany i może być w tym momencie dla Ciebie trochę zbyt trudny,
-- ale moim zdaniem już na tym etapie warto się nim pobawić.

-- To jest znana Ci funkcja tworząca dla dowolnego typu (będącego termem typu `Type 1`) jego "pętlę
-- identyczności". Tomek Smoleń napisał mi, że woli wersję `def ID (X : Type) (x : X) := x`, dlatego
-- na wszelki wspominam, że można ją i tak zapisać.
def ID (X : Type) : X → X := fun (x : X) => x

-- `g` i `h` to jakieś dwie *przeciwrównoległe* (czyli składalne na dwa sposoby) funkcje, które
-- zaraz będą spełniały warunek bycia odwrotnościami `f`.
variable (X Y : Type) (f : X → Y) (g h : Y → X)

-- Ten (podwójny) warunek mówi, że `g` jest (obustronną) odwrotnością `f`, ...
variable (h1 : g ∘ f = (ID X)) (h2 : f ∘ g = (ID Y)) 
-- ... a ten mówi, że `h` jest również odwrotnością `f`.
variable (h3 : h ∘ f = (ID X)) (h4 : f ∘ h = (ID Y))

-- Lean nie zgłasza tutaj błędu, a więc dowód jest poprawny, co znaczy, że `h` i `g` to ta sama funkcja
-- (teoriotypowa).
example : h = g := by
  -- Słowo kluczowe `have` służy do dodawania termów *do kontekstu*. W tym wypadku konstruujemy najpierw
  -- dowód hipotezy `hcel`, która jest taką hipotezą, że będziemy mogli do niej zastosować dostępne
  -- założenia, żeby ją stopniowo przekształcić w cel, czyli w zdanie `h = g`.
  --
  -- Używając instrukcji `have` tworzymy dowód wewnątrz dowodu i nadajemy udowodnionemu zdaniu nazwę
  -- (w tym wypadku nazwę `hcel`). Po prawej od zapisanego poniżej `:=` (lokalnym) celem jest zdanie `hcel`,
  -- a więc taktyka `rw` działa tu właśnie na zdaniu `g ∘ (f ∘ h) = g ∘ (ID Y)`, a nie na globalnym celu
  -- `h = g`.
  have hcel : g ∘ (f ∘ h) = g ∘ (ID Y) := by rw [h4]

  -- Łączność składania funkcji teoriotypowych wynika "automatycznie" z definicji tej operacji, a więc
  -- wystarczy użyć taktyki `rfl`.
  have h5 : g ∘ (f ∘ h) = (g ∘ f) ∘ h := by rfl

  -- Od tego momentu zaczynamy przekształcać hipotezę `hcel`, której dowód mamy już w kontekście.
  -- Argument `at <nazwa>` mówi taktyce `rw`, żeby dokonała przekstałcenia typu termu o nazwie `nazwa`,
  -- a nie przekształcenia (globalnego) celu.
  rw [h5] at hcel                       --> było `hcel : g ∘ (f ∘ h) = g ∘ (ID Y)`, a po zastąpieniu
                                        -- lewej strony `h5 : g ∘ (f ∘ h) = (g ∘ f) ∘ h` przez prawą
                                        -- jest `hcel : (g ∘ f) ∘ h = g ∘ ID Y`
  rw [h1] at hcel                       --> `hcel : ID X ∘ h = g ∘ ID Y`
  have h6 : (ID X) ∘ h = h := by rfl    -- z definicji
  have h7 : g ∘ (ID Y) = g := by rfl    -- z definicji
  rw [h6] at hcel                       --> `hcel : h = g ∘ ID Y`
  rw [h7] at hcel                       --> `hcel : h = g`
  exact hcel                            --> QED.
```

Zwracam uwagę, że ten mocno przegadany dowód polega w istocie tylko na rozwinięciu prawdziwego na mocy
założenia `f h = Id` zdania ...

`g (f h) = g Id`

... w obie strony:

`h = Id h = (g f) h = g (f h) = g Id = g`

Można to zrobić w Leanie na (nieskończenie) wiele innych sposobów, w tym również (znacznie)
prościej, ale chciałem Ci pokazać kilka nowych sztuczek. Instrukcja `rw [h5] at hcel` sprawia tutaj,
że - występująca w już udowodnionej w momencie zastosowania tej instrukcji hipotezie `hcel` - *lewa*
strona równości, będącej udowodnioną już wtedy hipotezą `h5`, czyli `g ∘ (f ∘ h)`, zostaje
zastąpiona *wewnątrz zdania* `hcel` (to własnie powoduje dodatkowy argument `at hcel` taktyki `rw`)
przez *prawą* stronę `h5`, czyli przez `(g ∘ f) ∘ h`. To pozwala potem w analogiczny sposób (ale
używając `h1`) zastąpić w zmienionej wersji `hcel` term `(g ∘ f)` przez term `(ID X)`. Wszystkie
kroki dowodu możesz prześledzić przeklejając ten fragment kodu do Leana i patrząc, jak zmienia się
stan dowodu, kiedy przesuwasz kursor za kolejne instrukcje.

Skoro poznałaś już najogólniejszą definicję izomorfizmu i wiesz, że kategoryjne odwrotności są
unikalne (a stąd od razu wynika, że *wszystkie* odwrotności *tego rodzaju*, to jest będące w takich
kategoryjnych relacjach złożeniowych, a więc również takie teoriotypowe i teoriomnogościowe
odwrotności, są unikalne), możemy wrócić do narysowanych już przez Ciebie dwóch produktów
kategoryjnych połączonych wygiętymi strzałkami.

### Wszystkie pary produktów tych samych punktów są kanonicznie izomorficzne

**Rysunek 2**: Pod ostatnim rysunkiem `Narysuj` proszę tak samo jeden nad drugim dwa produkty, ale
tym razem niech to będą *te same* dwa produkty `P` i `P`, z *tymi samymi* projekcjami (nazywanymi
oficjalnie raczej *rzutami kanonicznymi*, ale nie lubię tej nazwy) `π₁` i `π₂`, czyli narysuj proszę
dwie *kopie* tego samego produktu. Skoro mamy tutaj parę współźródłowych strzałek z górnego `P` do
`X` i `Y`, są nimi przecież górne kopie projekcji `π₁` i `π₂`, to musi istnieć unikalna (`∃¹`)
strzałka `f` z górnego `P` do dolnego `P` taka, że ...

`π₁ f = π₁` i `π₂ f = π₂`

... a skoro każdy punkt jest wyposażony w swoją identyczność, a identyczność `P` spełnia (z
definicji identyczności) oba te wymagania, to jest `π₁ Id = π₁` i `π₂ Id = π₂`, to skoro `f` jest
*unikalną* taką strzałką i `Id` też jest taką strzałką, inaczej mówiąc skoro `f = ⟨π₁,π₂⟩` i `Id =
⟨π₁,π₂⟩`, to `f = Id`. Udowodniłaś właśnie takie oto twierdzenie:

*Dla każdego produktu `P`, `Id : P → P = ⟨π₁,π₂⟩`* (gdzie `π₁` i `π₂` to projekcje `P`).

**Dowodzenie za pomocą kategoryjnych zaklęć**: Pokażę Ci teraz coś moim zdaniem
interesującego. `Narysuj` najpierw proszę, wygięte w łuk tak, żeby na siebie nie nachodziły, dwie
strzałki z górnego `P` do dolnego `P` i oznacz je jako `Id` i `f`. W środku lewego i prawego
skrzydła tego diagramu dodaj ptaszki, zaznaczając w ten sposób, że te części diagramu są przemienne
(na mocy definicji identyczności i produktu strzałek). Dodatkowo, w środku między dwiema wygiętymi w
łuk, skierowanymi w dół strzałkami dopisz jeszcze `∃¹`, żeby w ten nieco inny sposób wyrazić fakt,
że serce tego diagramu również jest przemienne.

A teraz połóż proszę koniec palca wskazującego na górnym `P`, i przesuwając palec po kartce
prześledź płynnie i niezbyt wolno dwie ścieżki - z górnego `P` przez `Id` i `π₁` do `X`, a potem
znowu z górnego `P` przez `π₁` do `X`. W ten sposób *przywołasz* równość strzałki `π₁` i złożenia
`π₁ ∘ Id`, czyli wodząc palcem po diagramie udowodnisz zdanie `π₁ = π₁ ∘ Id`. Tak samo udowodnij, że
`π₂ Id = π₂`. Te *dwa* pisane palcem po kartce dowody są *razem* dowodem, że `Id =
⟨π₁,π₂⟩`. Następnie, przesuwając palec po diagramie udowodnij tak samo, że `f = <π₁,π₂>` (co akurat
wynika z \{lokalnej\} definicji `f`). Na koniec, wracając za każdym razem najpierw do górnego `P`,
prześledź jeszcze palcem rysunki strzałek `Id` i `f`. Quod erat incantandum.

Możemy teraz wrócić do poprzedniego diagramu. Masz tam dwa (tym razem różnie oznaczone, ale wiesz,
że potencjalnie takie same) produkty tych samych punktów, to jest `P` i `P'`, złożone z dwóch par
(potencjalnie takich samych) projekcji. I masz tam dwie strzałki, `f` i `g`, spełniające warunki ...

`h1`. `π₁' f = π₁` i `π₂' f = π₂`

`h2`. `π₁ g = π₁'` i `π₂ g = π₂'`

... i wiesz, że strzałki `f` i `g` są unikalnymi strzałkami spełniającymi te warunki. Czy domyślasz
się już, co się teraz stanie? Te dwie strzałki są składalne na dwa sposoby. Złożenie `g f` ma taką
własność, że ...

`π₁ (g f) = (π₁ g) f = π₁' f = π₁`  
(bo łączność składania, `h2`, i `h1`)

... i ...

`π₂ (g f) = (π₂ g) f = π₂' f = π₂`  
(bo łączność składania, `h2`, i `h1`)

... i tak samo można wykazać, że złożenie `f g` ma taką własność, że `π₁' (f g) = π₁'` i `π₂' (f g)
= π₂'`, co jak sądzę po pewnym czasie i być może kilku mniej udanych początkowych próbach będziesz
mogła udowodnić sama, korzystając z ostatniego dowodu jako wzorca. Spróbuj więc proszę wykonać ten
dowód jako zaklęcie. Ale bądź ostrożna, bo to będzie wymagało między innymi wodzenia palcem po
czterech pętlach, to jest po pętli `f g`, `g f` i po dwóch pętlach identycznościowych. Co z tego
wszystkiego wynika?

Projekcje złożenia `(g f) : P → P` są takie same jak projekcje `Id : P → P`, a skoro strzałki o tych
samych projekcjach, a mówiąc ogólniej *wszystkich złożeniach z projekcjami*, są równe, to `g f =
Id`. Tak samo projekcje złożenia `(f g) : P' → P'` są takie same jak projekcje `Id : P' → P'`, a
skoro taka strzałka jest unikalna, to `f g = Id`. A więc `g` jest (kategoryjną) odwrotnością `f`,
czyli `g = f⁻¹`, albo `g⁻¹ = f`, na jedno wychodzi. Tym samym widzimy, że:

*Każda para kategoryjnych produktów tych samych punktów jest izomorficzna w taki sposób, że w każdą
stronę istnieje kanoniczny izomorfizm, będący produktem projekcji produktu źródłowego, który
przemienia jeden z produktów w drugi*.

Każdy z tych izomorfizmów możemy nazwać
[*kanonicznym*](https://sjp.pwn.pl/doroszewski/kanoniczny-I;5437673.html), bo każdy z nich jest w
pewnym sensie "narzucający się", albo "wzorcowy", albo "charakterystyczny", albo "podstawowy", albo
"naturalny". W końcu `f` (`g`) uzyskaliśmy *w jedyny możliwy sposób korzystając z samych projekcji
produktu* `P` (`P'`). To teraz zerwiemy z tego drzewa poznania tego co dobre i uniwersalne pewien
soczysty, nisko rosnący owoc.

### Izomorficzność jest *praktycznie równa równości*

Skoro każda para produktów tych samych punktów (oficjalnie: obiektów) jest wyposażona w
*kanoniczną*, czyli taką jakby "własną"/"naturalną"/"narzucającą się" metodę przemiany jednego z
nich w drugi *bez utraty "funkcjonalności"* (pun intended), to wszystkie produkty tych samych
punktów są *zastępowalne w sposób automatyczny*, tyle, że w ogólniejszym znaczeniu niż obiekty,
które są zastępowalne dlatego, że są po prostu *równe*.

*Równe* obiekty możemy wymieniać bez zmiany treści zdań czy konstrukcji *nie stosując żadnych
dodatkowych operacji*, bo równe obiekty są nie tylko *takim samym*, ale również *tym samym*
obiektem, przynajmniej w tym znaczeniu, że *zdanie `A = B` oznacza, że wyrażenia `A` i `B` oznaczają
to samo* (coś danego typu). Gdy mamy jakieś dwa *w wyróżniony sposób* izomorficzne obiekty, to też
możemy je wymieniać *w pewnym sensie* bez żadanych *dodatkowych* operacji. Co prawda wymaga to na
przykład *przekształcenia projekcji* wymienianego na inny *produktu* (jeśli akurat wymieniamy jeden
produkt na drugi, ale tak samo możemy wymieniać na przykład wszystkie obiekty końcowe), ale wtedy
*nie musimy wskazywać* metody tej "automatyzowalnej transmutacji", ponieważ istnieje dokładanie
jedna taka (to jest kanoniczna, ale w ogólnym przypadku, gdy wymieniamy dowolne dwa izomorficzne
obiekty/punkty, może być też wybrana arbitralnie, trzeba ją tylko wcześniej wskazać) metoda w każdą
stronę. Ewentualne wymagane dodatkowe "re-konstruujące funkcjonalność" operacje (takie jak wymiana
jednej pary projekcji na drugą) są przez tą metodę (czyli ten wyróżniony izomorfizm) *wymuszone*, a
więc co prawda te operacje muszą być *zastosowane*, ale odkąd jakiś konkretny izomorfim został albo
wskazany, albo "się narzucił", bo jest kanoniczny, *nie trzeba tych operacji szukać*.

Na przykład, w kategorii zbiorów i funkcji wszystkie zbiory jednoelementowe są obiektami końcowymi,
przez co wszystkie takie obiekty są kanonicznie izomorficzne (dowód) ... 

Jeżeli `T₁` i `T₂` są obiektami końcowymi, to (z definicji obiektu końcowego) istnieje dokładnie
jedna (a więc "narzucająca się") strzałka z `T₁` do `T₂` i istnieje też dokładnie jedna strzałka z
`T₂` do `T₁`. Te strzałki są składalne na dwa sposoby (czyli są przeciwrównoległe), a każde z tych
złożeń musi być identycznością, bo (z definicji obiektu końcowego) istnieje dokładnie jedna
(endo)strzałka z `T₁` do `T₁`, i tak samo z `T₂` do `T₂`, a każdy obiekt ma swoją endostrzałkę
identycznościową.

... a więc w każdej kategorii, wszystkie obiekty końcowe *działają tak samo* i *same dostarczają
metod przemiany jednego takiego obiektu w drugi*. W przypadku obiektów końcowych w kategorii zbiorów
i funkcji to polega na przykład na tym, że każdy z takich obiektów nadaje się tak samo dobrze do
wskazywania każdego elementu każdego zbioru, bo każdy zbiór "dostaje" tyle samo strzałek z każdego
obiektu końcowego. A mówiąc ogólnie, niezależnie od tego, o jaką kategorię chodzi, wszystkie
*kategoryjne*, to jest "strzałkowo-złożeniowe" relacje między jednym obiektem końcowym a wszystkimi
innymi obiektami są takie same, jak wszystkie *kategoryjne* relacje między dowolnym innym, z
konieczności kanonicznie izomorficznym obiektem końcowym a wszystkimi innymi obiektami.

Jeżeli nadal trudno Ci się oswoić z tym abstrakcyjnym faktem, to pomyśl może o analogii do liczb
wymiernych. Każdą konkretną liczbę wymierną możemy *zapisać* na nieskończenie wiele *różnych*
sposobów jako ułamek. Na przykład, liczbę `1/2` możemy zapisać równie dobrze jako `2/4`, `3/6`,
`333/666`, i tak dalej, czyli jako *dowolną* uporządkowaną parę liczb całkowitych taką, że druga z
nich nie jest zerem i pierwsza jest dwa razy mniejsza niż druga. *Tą samą* liczbę wymierną można
więc *zrobić* z liczb całkowitych na nieskończenie wiele różnych sposobów. Ten fakt nie przeszkadza
Ci jednak w traktowaniu takich *rozmaicie zrobionych* liczb *jako jednej i tej samej liczby*. A jest
tak dokładnie dlatego, że tych par liczb (zapisywanych zwykle jedna nad drugą) *używasz* w pewien
określony sposób, to jest właśnie *jako liczb wymiernych* i właśnie to, jak one *działają jako
liczby wymierne*, decyduje dla Ciebie o ich *tożsamości*.

Skoro więc:

1. Wiadomo z góry, że takie "transmutujące", to jest przekształcające z zachowaniem danego rodzaju
"kategoryjnej funkcjonalności" operacje *istnieją*, ...

2. ... wiadomo, *jak* dokładnie takie operacje działają, ...

3. ... i wiadomo, *o które konkretnie* takie operacje chodzi, ...

... to można tym operacjom niejako pozwolić działać w tle. Używając takich sharakteryzowanych
kategoryjnie czyli "funkcjonalnie" obiektów w *kategoryjnych* konstrukcjach, na przykład w dowodach
zapisanych całkowicie w języku teorii kategorii, moglibyśmy zlecić ewentualną konieczną
"transmutację" na przykład Leanowi, bo skoro ta jest automatyzowalna, to można teoretycznie nauczyć
Leana, jak ma to za nas robić. Na zasadniczo takim samym, w analogiczny sposób automazowalnym
procesie polegamy używając komputera albo kalkulatora do wykonywania obliczeń na liczbach wymiernych
i nawet tego nie zauważamy.

A ponieważ każda *konkretna wersja* czy raczej implementacja albo instancja danego rodzaju
kategoryjnego obiektu *działa kategoryjnie tak samo*, to tak naprawdę nie trzeba tego
przekształcenia dokonywać nawet w tle i można takie obiekty traktować po prostu jako (kategoryjnie)
wymienialne. Ale uwaga, *ten* rodzaj wymienialności dotyczy *scharakteryzowanych kategoryjnie
punktów/obiektów*, ale *nie* strzałek.

## Wybiegając celowo w przyszłość

**Najpierw krótka powtórka**: Załóżmy, że mamy parę strzałek `a : P → X` i `b : P → Y`, gdzie `P` to
produkt `X × Y` z projekcjami `π₁` i `π₂` odpowiednio. Wtedy istnieje unikalna strzałka `⟨a, b⟩`
taka, że `π₁ ⟨a, b⟩ = a` i `π₂ ⟨a, b⟩ = b`. A jeśli `f` to (kanoniczny) izomorfizm z produktu `P` do
produktu `P'` (wtedy z konieczności tych samych punktów `X` i `Y`), czyli jeśli `f = ⟨π₁,π₂⟩`, to
czy strzałki będące złożeniami `π₁' f` i `π₂' f` zachowują się jak `π₁` i `π₂`?  Już wiesz, że tak,
bo wiesz, że to są te same strzałki: `π₁' f = π₁' ⟨π₁,π₂⟩ = π₁`, i tak samo dla `π₂' f`.

**To teraz uważaj!**: A czy zauważyłaś, że *sam produkt* jest pewnym izomorfizmem? Produkt punktów
`X` i `Y` ...

1. ... *każdej* parze współźródłowych strzałek `f` i `g` do `X` i `Y` odpowiednio ...

2. ... przyporządkowywuje *dokładnie jedną* taką strzałkę `h` z tego samego źródła, że `π₁ h = f` i
`π₂ h = g`. 

I *odwrotnie*, ... 

1. ... *każda* strzałka `h` z tego źródła ...

2. ... odpowiada *dokładnie jednej* parze strzałek do `X` i `Y` z tego samego źródła, będących
złożeniami `π₁ h` i `π₂ h`, bo przecież złożenia są z definicji unikalne. 

A więc *dla każdego punktu* `Z`, *sam produkt `X × Y` to również taki "wymieniacz" albo
"transmutator"*, tyle, że strzałek z `Z` do `X × Y` i uporządkowanych par strzałek z `Z` do `X` i
`Y` odpowiednio. Mamy tu ewidentnie pewien izomorfizm, ale ten izomorfizm *nie* jest izomorfizmem *w
tej samej kategorii*, bo *nie jest strzałką w tej samej kategorii*. Tylko proszę nie miej sobie za
złe, jeśli nie przyszło Ci do głowy, że to musi być strzałka w jakiejś kategorii, albo że ta
kategoria była jak dotąd ukryta. Byłbym zdumiony (i trochę zazdrosny), gdybyś to zauważyła już na
tym etapie. Na wszelki wypadek przypominam, że wybiegam teraz dosyć daleko w przyszłość[^2].

### [*Aaaa?!*](https://en.wikipedia.org/wiki/Vertigo_(film))

**Tym się nie przejmuj, a może nawet w ogóle tego nie czytaj, jeszcze do tego wrócimy**: Z jakich
*punktów* może być zrobiona kategoria, której strzałkami mogą być izomorfizmy takie jak ten
wspomniany wyżej?  (najczęściej) Z pewnych *zbiorów równoległych strzałek kategorii wyjściowej*! A
czym są *strzałki* w tej kategorii? (najczęściej) Funkcjami! No to czym może być składanie strzałek
w tej kategorii?  (znowu) Składaniem funkcji, o którym wiemy z góry, że jest *łączne*, a skoro
strzałki są zwykłymi funkcjami, to wiemy również, czym w tej kategorii są identyczności.

[*ℂo?*](https://a.co/d/4MMHNOE)

Niech `ℂ` oznacza *dowolną* kategorię, a `Ob(ℂ)` niech oznacza zbiór albo typ albo kolekcję punktów
tej kategorii (nazywanych zwykle obiektami, stąd skrót `Ob`). To nam pozwoli pisać krótko *`X :
Ob(ℂ)`* zamiast znacznie dłużej *niech `X` będzie punktem kategorii `ℂ`*. Na przykład, jeżeli `ℂ =
Set`, to `Ob(ℂ)` to kolekcja wszystkich zbiorów (to jest wtedy *kolekcja*, która *nie może* być
*zbiorem*, bo pojęcie zbioru wszystkich zbiorów prowadzi do antynomii Russella).

Jeżeli `X, Y : Ob(ℂ)` (czytaj: *`X` i `Y` to punkty `ℂ`*; wiem, że mocno skracam zapis - orientuj
się!), to niech `Hom_ℂ(X, Y)` (nie da się w Unikodzie zapisać $Hom_{ℂ}(X, Y)$, więc znowu używam
podkreślenia) oznacza zbiór wszystkich strzałek z `X` do `Y` (czyli strzałek w ten sposób
*równoległych*) w kategorii `ℂ`. Z powodów, które nas w tym momencie nie interesują, takie zbiory
nazywamy po angielsku *hom-setami*, a po polsku *zbiorami morfizmów* (kategorii `ℂ` \{z obiektu `X`
do obiektu `Y`\}).

Na razie nie ma tu żadnych nowych *pojęć*, jest tylko nowa *terminologia* i nowa *notacja*, bo
(niemal, bo to teoria kategorii, a nie teoria typów) zamiast mówić o *typach* strzałek takich jak `X
→ Y` mówimy o *zbiorach* strzałek `Hom_ℂ(X, Y)`. To może przy okazji powiem coś o tej notacji.

<hr>

**O notacji celowo maskującej funkcyjność**: Być może to dobra okazja, żeby zwrócić Twoją uwagę na
pewną powszechnie stosowaną, ale rzadko objaśnianą konwencję.

Zapis `Hom_ℂ(X, Y)` zdaje się sugerować, że mamy do czynienia z pewną, dostarczającą określone
zbiory strzałek funkcją czy operacją na *parach* obiektów (tutaj `X` i `Y`), ale to przecież
nieprawda, bo rezultat tej operacji zależy też od kategorii (tutaj oznaczonej jako `ℂ`). Można by
więc równie dobrze przyjąć konwencję pisania `Hom(ℂ, X, Y)`, albo nawet - jeszcze bardziej
jednoznacznie i w stylu teoriotypowym - `Hom(ℂ : Cat, X : Ob(ℂ), Y : Ob(ℂ))`. Niektórzy piszą też
`ℂ(X, Y)` albo `ℂ[X, Y]`. Czemu więc zwykle piszemy akurat `Hom_ℂ(X, Y)`?

Notacja `Hom_ℂ(X, Y)` ma tą przewagę nad notacją `ℂ(X, Y)`, że jest bardziej deskryptywna, a tak się
składa, że pojęcie hom-setu (czyli zbioru morfizmów) jest w teorii kategorii ważne i w pewnych
kontekstach często się pojawia. Zapisywanie fikuśnej litery `ℂ` jako indeksu dolnego przed lewym
nawiasem ma natomiast jakby trochę *ukryć* tą literę, jest to więc coś w rodzaju *odwrotności
zaakcentowania*. Ten zwyczaj wynika z potrzeby praktycznej; często zdarza się, że piszemy dłużej o
jakiejś *jednej* kategorii, a wtedy wygodnie jest pisać po prostu `Hom(X, Y)`. Zapisanie oznaczenia
kategorii w miejscu indeksu dolnego sygnalizuje więc, że to oznaczenie może "łatwo spaść z notacji",
czyli że w innym kontekście ten *parametr* może być *niejawny*. Wtedy albo sami mamy się domyślić, o
którą kategorię chodzi, tak jak w analogicznych sytuacjach Lean "sam się domyśla" niejawnych
argumentów, albo nie chodzi o żadną konkretną kategorię.

<hr>

Czyli, jeżeli `Hom_ℂ(X, Y)` jest zbiorem, to używając formalnego języka teorii mnogości możemy o tym
zbiorze w ten sposób ...

`Hom_ℂ(X, Y) = {f : Arr(ℂ) | (s(f) = X) ∧ (t(f) = Y)}` 

... powiedzieć, że to jest zbiór wszystkich strzałek w kategorii `ℂ`, których źródłem (`s` od
angielskiego *source*) jest punkt `X`, a celem (`t` od angielskiego *target*) jest punkt
`Y`. Podkreślam, że nadal nie mówimy nic nowego, na razie próbuję Cię tylko przyzwyczaić do nowej
notacji.

(Nawiasem mówiąc, jeżeli `s` i `t` mają być *funkcjami teoriomnogościowymi* \{a w przypadku wielu
kategorii *mogą* nimi być, a więc też *są*\}, to ponieważ `s, t : Arr(ℂ) → Ob(ℂ)`, to kolekcje
`Arr(ℂ)` i `Ob(ℂ)` muszą być *zbiorami* \{i w przypadku wielu kategorii są\})

Jeszcze raz, ale inaczej: Nawet jeśli jesteśmy już trochę poirytowani tymi wszystkimi robaczkami, to
zachowujemy spokój, bo to wciąż tylko nowa terminologia i notacja, czyli pewne *konwencje*, bez
żadnych nowych *pojęć*, a więc nie ma tu nic nowego do *zrozumienia*, trzeba się tylko przyzwyczaić
i zacząć powoli te konwencje zapamiętywać. Swoja drogą, sama zgadłaś, co oznacza `Arr(ℂ)`, prawda?

Na przykład, jeżeli `ℂ := Set`, to `Hom_ℂ(X, Y)` to *zbiór* wszystkich (strzałek będących)
funkcj(ami)i z (będącego zbiorem punktu) `X` do (będącego zbiorem punktu) `Y`. Za pomocą tych mam
nadzieję dezorientujących wtrąceń utożsamiamy tu sobie to, co jest *oznaczane*, czy raczej *opisane*
(za pomocą formalnego języka teorii kategorii) z tym, co oznaczające (czyli z *częściami struktury
pewnej konkretnej kategorii*). No a czemu mielibyśmy uczyć się dokonywania bezwiednie tego rodzaju
utożsamień?  Bo chcemy nauczyć się używać tego języka w taki jakby "przezroczysty" sposób, *myśląc
nim*, czyli chcemy nauczyć się *patrzeć przez ten język*, tak samo, jak nie zastanawiając się na
czym to dokładnie polega patrzymy przez język działań na ułamkach na wszystko, co można traktować
jako liczby wymierne.

Jeżeli dla każdych `X, Y : Ob(ℂ)`, `Hom_ℂ(X, Y)` jest zbiorem (musimy tego wymagać, bo w ogólnym
przypadku taka kolekcja może być za duża jak na bycie zbiorem), to jeżeli istnieje `X × Y` (czyli
produkt `X` i `Y` w `ℂ` - dodajemy ten warunek, bo nie każda kategoria ma wszystkie produkty, a są i
takie, które nie mają żadnych), to dla każdego `Z : Ob(ℂ)`:

`Hom_ℂ(Z, X) × Hom_ℂ(Z, Y) ≅ Hom_ℂ(Z, X × Y)`

Można panikować! Ale nie trzeba. Zamiast panikować, powoli i być może więcej niż raz **czytamy to
jako**: Istnieje (kategoryjny) izomorfizm (`≅` - od niego zaczynamy czytać, bo on tu najmocniej
wiąże), będący w tym wypadku funkcją (a więc to jest bijekcja), bo to są wszystko zbiory, między ...

1. Produktem `Hom_ℂ(Z, X) × Hom_ℂ(Z, Y)`, który można w tym wypadku rozumieć jako (bo działa tak
   samo jak) zbiór takich par uporządkowanych, że pierwszym elementem jest strzałka z `Z` do `X`, a
   drugim strzałka z `Z` do `Y`, czyli to jest (pisząc nieco nonszalancko, ale nadal mam nadzieję
   zrozumiale) zbiór wszystkich par `(f : Z → X : ℂ, g : Z → Y : ℂ)` (a wcisnąłem sobie tutaj takie
   dwupoziomowe typowanie, i co mi zrobisz?), czyli to jest po prostu zbiór wszystkich par strzałek
   współźródłowych z `Z` do `X` i `Y` odpowiednio. Zajmowaliśmy się już w tym rozdziale dokładnie
   takimi parami kilka razy, teraz tylko zrobiliśmy z nich w pewien sposób oznaczony zbiór, a raczej
   oznaczyliśmy je za pomocą elementów w pewien sposób zapisanego zbioru.

... a ...

2. *Punktem* `Hom_ℂ(Z, X × Y)`, czyli zbiorem wszystkich `h : Z → X × Y : ℂ` (napisałem *punktem*,
   bo to *nie* jest produkt, ten punkt/zbiór jest tylko *zrobiony z pewnego produktu*).

Co to dokładnie za izomorfizm? I *gdzie* on się znajduje? Zacznijmy od tego z prawej do lewej (czyli
od izomorfizmu *do* produktu hom-setów), oznaczmy go jako `i` i scharakteryzujmy go opisując jak
przekształca typowy element (tutaj oznaczony jako `h`):

`i(h : Z → X ⨯ Y : ℂ) = (f : Z → X : ℂ, g : Z → Y : ℂ) ∈ Hom_ℂ(Z, X) × Hom_ℂ(Z, Y)`  
gdzie `f = π₁ h` i `g = π₂ h`.

A pisząc krócej ...

`i(h) = (f, g)`, gdzie `f = π₁ h` i `g = π₂ h`

... a pisząc krócej, ale próbując też (w ramach powtórki) ujawnić w zapisie, że `i` jest dobrze
określoną funkcją (bo zwraca parę złożeń określonych strzałek, a złożenia są unikalne):

`i(h) = (π₁ h, π₂ h)`.

Istnienie strzałki/funkcji `i⁻¹ : Hom_ℂ(Z, X) × Hom_ℂ(Z, Y) → Hom_ℂ(Z, X × Y)` gwarantuje nam (mogę
już napisać, że oczywiście?) definicja produktu, która mówi, że każdej uporządkowanej parze strzałek
z `Z` do `X` i `Y` (czyli każdemu elementowi zbioru `Hom_ℂ(Z, X) × Hom_ℂ(Z, Y)`) odpowiada unikalna
strzałka z `Z` do `X × Y` (czyli element zbioru `Hom_ℂ(Z, X × Y)`).

[*Aaaa...*](https://music.youtube.com/watch?v=b-BmKga_N8M&si=gFeSTZ_PVEtKMQAn)

A kategorię powstającą z kategorii `ℂ`, której *punktami* są (być może - między innymi) `Hom_ℂ(Z, X
× Y)`, która ma *produkty* takie jak `Hom_ℂ(Z, X) × Hom_ℂ(Z, Y)` i której strzałkami są (być może -
między innymi) `i` i `i⁻¹`, no więc tą ważną (parametryczną! `ℂ` i `Z` to tutaj *parametry
przekształcenia* `Hom`, które *tworzy pewną kategorię* z podanej kategorii `ℂ` i punktu `Z` tej
kategorii) kategorię możemy oznaczyć jako `Hom_ℂ(Z,_)`. Ale o tym kiedy indziej. Proszę zapomnij o
tym jak najszybciej.

**No dobrze, ale dlaczego**: *chcemy* robić (między innymi) z pojęciem produktu coś tak (pozornie)
bardzo i (pozornie) niepotrzebnie pogmatwanego? Otóż posługując się takimi strukturami, pół-formalny
fragment matematycznej prozy taki jak ten ...

*Produkt punktów `X` i `Y` kategorii `ℂ` to taki punkt `X × Y` wyposażony w nazywane projekcjami
strzałki `π₁ : X × Y → X` i `π₂ : X
× Y → Y`, że:*  
*`∀ Z : Ob(ℂ), ∀ f : Z → X, ∀ g : Z → Y, ∃¹ h : Z → X × Y, (π₁ h = f) ∧ (π₂ h = g)`.*

... możemy w pełni zakodować w języku teorii kategorii tak (morfizmy takie jak `Hom` to również -
nazywane [*funktorami
głównymi*](https://pl.wikipedia.org/wiki/Funktor_(teoria_kategorii)#Funktory_g%C5%82%C3%B3wne) -
[strzałki pewnej kategorii](https://en.wikipedia.org/wiki/Hom_functor), której punktami są
[*kategorie*](https://pl.wikipedia.org/wiki/Funktor_(teoria_kategorii)) \{i o tym też zapomnij
proszę jak najszybciej\}) ...

`f : Hom_ℂ(Z, X) × Hom_ℂ(Z, Y) → Hom_ℂ(Z, X × Y)`  
`f⁻¹(h) = (π₁ h, π₂ h)`

... *"chwytając" w ten sposób kategoryjnie (!) "istotę funkcjonalną" (!) pojęcia kategoryjnego (!)*
(tutaj akurat pojęcia produktu), a więc używając języka teorii kategorii do czegoś w rodzaju [*badań
endo-meta-teoretycznych*](https://en.wikipedia.org/wiki/Drawing_Hands). No [może być coś
fajniejszego?](https://pl.wikipedia.org/wiki/Pytanie_retoryczne)

### Przypisy

[^1]: Można też tak, ale w ogóle się tym nie przejmuj:
```lean
def Inverse_arrows {X Y : Type} (f : X → Y) (g : Y → X) : Prop := g ∘ f = id ∧ f ∘ g = id

theorem Inverse_arrow_is_unique
  (X Y : Type) (f : X → Y) (g g' : Y → X) (h1 : (Inverse_arrows f g) ∧ (Inverse_arrows f g')) : 
  g = g' := by
  calc g = g ∘ id        := by rfl
       _ = g ∘ (f ∘ g')  := by rw [←h1.right.right]
       _ = (g ∘ f) ∘ g'  := by rfl
       _ = id ∘ g'       := by rw [h1.left.left]
       _ = g'            := by rfl
```

[^2]: Bo gdzie indziej? W przeszłość się nie da i stać w miejscu *w czasie* też nie (da się).
