## O czym teraz będzie

Jak skończę ten rozdział, to coś tu napiszę.

# [AA](https://pl.wikipedia.org/wiki/Algebra_abstrakcyjna)

Zaczniemy od nudnawych rozważań na temat dodawania, a w następnych rozdziałach będziemy już
zanurzeni w meta-psychologii, po (nomen omen) drodze odkrywając coś, co myślę, że może Cię
zaintrygować.

Jak pamiętasz, pierwszym przykładem czegoś matematycznego w tej książce było twierdzenie o
przemienności dodawania liczb naturalnych. Tym razem zajmiemy się najpierw *łącznością* dodawania
liczb *całkowitych* `ℤ = {... -3, -2, -1, 0, 1, 2, 3, ...}`.

*Jeżeli `a, b, c ∈ ℤ`, to `(a + b) + c = a + (b + c)`*.

Nudne i oczywiste? Jeśli tak, to tylko dlatego, że (jeszcze) nie widzisz tego twierdzenia z miejsca,
na które udało mi się niedawno wdrapać. Rozważmy teraz znany Ci przykład ściśle związanej z
dodawaniem operacji odejmowania, która tej własności *nie ma*:

`(3 - 2) - 1 = 1 - 1 = 0`  
`3 - (2 - 1) = 3 - 1 = 2`


Oto na czym (między innymi, bo nie ma uniwersalnie uprzywilejowanego punktu widzenia) polega
*związek między dodawaniem i odejmowaniem*: Istnieje *element neutralny* ze względu na dodawanie, to
jest taki, że dodanie go do czegokolwiek, nieważne z której strony, *nic nie zmienia*, i jest nim
`0`. Liczbą *przeciwną* do liczby `a` (to skrót myślowy - mamy pamiętać, że ze względu na dodawanie)
nazywamy taką liczbę `b`, że `a + b = 0`. Ponieważ - jak łatwo wykazać używając takiego samego
dowodu co w przypadku unikalności kategoryjnej *strzałki odwrotnej* - każda liczba całkowita `a` ma
dokładnie jedną liczbę przeciwną, możemy taką liczbę oznaczyć jakby była *funkcją* albo *własnością*
`a` (bo jest) i zwykle tak właśnie robimy, pisząc `-a`. To jest *definicja liczby przeciwnej* (do
danej \{ze względu na dodawanie\}).

Teraz możemy *zdefiniować odejmowanie w kategoriach dodawania* i - niejawnie, bo ta ukrywa się w
definicji liczby przeciwnej - *liczby `0`* (ale nie całkiem ...):

`a - b := a + (-b)`. 

Zwracam uwagę, że pojawił się tutaj symbol oznaczający *definiowanie*, a nie równość. Odejmowanie
jest więc (z tej perspektywy \{albo w tej implementacji\}) *lukrem składniowym* dla *dodawania
liczby odwrotnej ze względu na dodawanie*. Ponieważ `(a + b) - b = (a + b) + (-b) = a + b + (-b) =
a + 0 = a`, można również powiedzieć, że odejmowanie jest *działaniem odwrotnym* do dodawania i tak
też mówimy. Zwracam uwagę, że nie mówimy tak *tylko* dlatego, że `a - a = 0`. Mówimy tak *dokładnie*
dlatego, że `a - a` "daje" *element neutralny* (... właśnie dlatego nie całkiem). Ponieważ tak się
akurat składa, że w przypadku dodawania liczb tym elementem jest `0`, to też często właśnie tak
"konkretnie", zamiast używając ogólniejszego terminu *element neutralny*, ten fakt zapisujemy, to
jest jako *`a - a = 0`* zamiast znacznie dłużej *`a - a` jest elementem neutralnym ze względu na
dodawanie*, albo *`a - a = u`, gdzie `u` jest elementem neutralnym* (ze względu na dodawanie).

Niemal doskonale analogiczna sytuacja zachodzi w przypadku *mnożenia* i *dzielenia* na przykład
liczb *rzeczywistych*:

*Jeżeli `a, b, c ∈ ℝ`, to `(a × b) × c = a × (b × c)`*

`(8 / 4) / 2 = 2 / 2 = 1`  
`8 / (4 / 2) = 8 / 2 = 4`

Elementem neurtralnym ze względu na mnożenie liczb rzeczywistych jest oczywiście `1`, a dzielenie
jest tu *niemal* działaniem - bo zdefiniowanym tylko dla par `(a, b) ∈ ℝ × ℝ`, gdzie `b ≠ 0`
(właśnie dlatego to jest niemal doskonała analogia) - odwrotnym do mnożenia, ponieważ (mówiąc prawie
to samo co wcześniej, ale zmieniając sposób pisania w celach dydaktycznych) `∀ a ∈ R, a ≠ 0 → ∃! b ∈
ℝ, a × b = 1`, gdzie `∃!` czytamy jako *istnieje unikalne*. Dowód unikalności przebiega znowu tak
samo jak kategoryjny dowód unikalności strzałki odwrotnej. Taką liczbę zapisujemy jako funkcję albo
własność `a` w ten między innymi sposób: $\frac{1}{a}$ (tu jest inna czcionka, bo Unikod nie radzi
sobie z ułamkami). Dzielenie definiujemy wtedy jako *mnożenie* przez *liczbę odwrotną* ze względu na
*mnożenie*:

Jeżeli `b ≠ 0`, to `a / b := a × 1/b`  
(to powinno być raczej $\frac{1}{b}$, ale nie jest, bo Unikod).

I tak oto (znowu) otarłaś się nieco o język [*algebry abstrakcyjnej*](https://www.aa.org/), a to
dopiero początek.

## Matematyczne i psychologiczne własności działań

W przypadku dodawania liczb całkowitych mamy więc element neutralny i zachodzi łączność, ale ta
operacja ma jeszcze dwie ważne własności, to jest *odwracalność*, która nie występuje, gdy na
przykład ograniczymy się tylko do liczb naturalnych (bo wtedy nie mamy liczb ujemnych) i
*przemienność*: `∀ a, b ∈ ℤ, a + b = b + a`.

### صفر

Elementy neutralne ze względu na jakieś operacje mają często w pewnym sensie "bardziej abstrakcyjny"
charakter. Ale zdecydowanie nie zawsze, na przykład `1` jako element neutralny ze względu na
mnożenie nie ma (chociaż może trochę [ma](https://pl.wiktionary.org/wiki/unitas)?). Zarówno
etymologia *słowa* "zero", sięgająca aż do "शून्य", jak i sposób, w jaki posługujemy się *liczbą* `0`,
wskazują na bliski związek ze słowami "puste" i "nic", ale mamy też i nieprzypadkowy etymologiczny
związek z [*lekkim wiatrem*](https://en.wiktionary.org/wiki/zephyr). Starożytni grecy zaczęli w
pewnym momencie używać *cyfry* odpowiadającej naszej *liczbie* `0` jako *wygodnego narzędzia do
rozwiązywania problemów rachunkowych*, ale nawet wtedy pozbywali się jej tak szybko, jak tylko byli
w stanie, a w pismach filozoficznych z owego czasu można odnaleźć wyraźne ślady
[oporu](http://www-gap.dcs.st-and.ac.uk/~history/HistTopics/Zero.html) przed interpretowaniem
używanego przez nich odpowiednika stałej `0` *jako liczby*. To oczywiście nie jest przypadek i
jednym z użytecznych w pewnych kontekstach sposobów myślenia o rozmaitych elementach neutralnych
jest nadal moim zdaniem coś w rodzaju meta-myślenia, polegającego na traktowaniu elementów
neutralnych jako *dodawanych dla pewnych celów narzędzi pojęciowych*, które służą głównie do
stwierdzania czegoś szczególnego, to jest neutralności, na temat wyników operacji *jako wyników tych
operacji rozumianych abstrakcyjnie*. Pora na przykład.

Skoro możemy teoretycznie dodać do czterech jabłek, które ma już Kasia, dowolną liczbę jabłek, to
możemy również *nie dodać* żadnych jabłek i to *niedodanie* też możemy konsekwentnie traktować jako
*dodanie* pewnej liczby jabłek. Żeby jednak robić to konsekwentnie, musimy traktować operację
dodawania w bardziej abstrakcyjny sposób niż tego wymaga dodawanie samych liczb "cielesnych". Trzeba
tylko sensownie przerobić wyjściowe sztywne reguły określające, co rozumiemy przez dodawanie liczb,
i trzeba to zrobić tak, żeby te nowe, uwzględniające "istnienie" liczby zero reguły były wygodne
jako środki do osiągania pewnych dobrze określonych celów, takich jak odpowiedź na palące pytanie,
czy Jacek (do)dał wczoraj Kasi jabłka, a jeśli tak, to ile.

Dzięki temu, że (aksjomatycznie) "mamy" zero, to gdy nie wiemy, ile jabłek dodał wczoraj Kasi Jacek,
jedną z poprawnych, choć niekoniecznie prawdziwych odpowiedzi na to pytanie jest *Jacek dodał Kasi
zero jabłek* - `K₂ = K₁ + J = K₁ + 0 = K₁`, gdzie `K₁` (`K₂`) oznacza liczbę jabłek, które Kasia
miała pierwszego dnia (ma dzisiaj, bo żadnego nie zjadła ani nie straciła), a `J` oznacza liczbę
jabłek, które Jacek dodał wczoraj Kasi. Tak rozumiane zdanie jest łatwiej zakodować formalnie,
łatwiej się nim operuje, i łatwiej jest też dzięki temu konsekwentnie myśleć o tego rodzaju
sytuacjach, niż gdyby to zdanie rozumieć jako *nieprawda, że Ignacy dodał Kasi wczoraj jakieś
jabłka*, czyli formalnie na przykład jako `¬(∃ J, K₂ = K₁ + J)`. W szczególności, gdybyśmy nie mieli
zera, nie wystarczyłyby nam same metody rachunkowe; musielibyśmy używać *dwóch* różnych *sposobów
myślenia* tam, gdzie wystarczy stosować jeden bardziej abstrakcyjny sposób. No i nie
skorzystalibyśmy z okazji do uzyskania nowego, ekscytującego spojrzenia na liczby.

Czy widzisz już trochę lepiej, że zasadność traktowania `0` jako liczby narzuca się bardziej, kiedy
skupiamy się na *działaniach* na liczbach, czyli na tym, *co możemy z nimi robić*, a dokładniej *do
czego i w jaki sposób możemy je wykorzystywać*, niż wtedy, gdy skupiamy się na liczbach jako pewnych
abstrakcyjnych *obiektach*, albo na ich "wcieleniach" czy raczej *instancjach*, takich jak liczba
jabłek, które wczoraj miała Kasia? A czy czujesz już, że ten "działaniowy" sposób myślenia może być
w jakiś ważny sposób uprzywilejowany albo lepszy?

Często, gdy elementy neutralne są w pewnym sensie bardziej *wygodnymi narzędziami myślenia* niż
*oznaczeniami* czegoś *"w świecie zewnętrznym"*, albo czegoś *"matematycznie konkretnego"*, nie ma
większego znaczenia, że w jakiejś strukturze brakuje elementu lub elementów neutralnych, i można je
dodać bez szkody dla poprawności wniosków. To jest o ile tylko robi się to spójnie i - gdy akurat
trzeba - albo się o tym pamięta, albo korzysta się na przykład z Leana, żeby sprawdzać, które
twierdzenia wymagają założenia o istnieniu elementu neutralnego, a które nie. Czyli w zasadzie
wystarczy nie okłamywać samych siebie. Spotkaliśmy się już z tym zjawiskiem omawiając
powierzchowność różnic między relacją `<` i relacją `≤`, ale na wszelki wypadek przypomnę, o co w
tym chodziło. Przy okazji może wyjaśnię, że powtarzam się tak często między innymi dlatego, że wiem,
jak rzadkim zjawiskiem jest chęć, żeby wrócić po raz kolejny do tego samego fragmentu tekstu.

*Relację (binarną) `R` na zbiorze `X`* można zakodować między innymi jako jakikolwiek podzbiór par
uporządkowanych elementów należących do `X`, to jest `R ⊆ X × X`. Pewne własności relacji są tak
często ważne, że mają swoje nazwy. Tak zakodowana relacja jest na przykład zwrotna wtedy i tylko
wtedy, gdy `∀ x ∈ X, (x, x) ∈ R`, co zapisujemy często w notacji wzrostkowej jako `x R x` (jak w `1
≤ 1`). Ponieważ, tylko zdejmując lub nakładając składniowy lukier notacji wzrostkowej, możemy
udowodnić, że `(a, b) ∈ R ↔ a R b`, to każdy *element* należący do zbioru `R` możemy nazywać
*faktem* zachodzenia relacji `R` (dla pewnej określonej pary uporządkowanej elementów `X`), albo
nawet *`R`-faktem*.

Z relacji `≤`, a dokładniej na przykład z `≤ ⊆ ℤ × ℤ` (to jest dokładniej powiedziane, bo mówimy
wprost o zbiorze, na którym jest określona relacja oznaczana w tym kontekście przez stałą `≤`),
możemy łatwo uzyskać `<` *pozbywając się* wszystkich możliwych faktów postaci `x ≤ x` (czyli
wszystkich par `(x, x)`), a z relacji `<` możemy łatwo uzyskać `≤` *dosypując* wszystkie możliwe
fakty takiej postaci. To jest, jak nietrudno zauważyć, *izomorfizm* między zbiorem relacji
przeciwzwrotnych i zwrotnych: Jeżeli dana relacja jest *przeciw*zwrotna, to nie zawiera *żadnej*
pary o postaci `(x, x)`, a więc dosypanie wszystkich możliwych takich par a następnie usunięcie
wszystkich takich par pozostawia taką relację bez zmian. I tak samo bez zmian pozostanie relacja
zwrotna, jeśli najpierw usuniemy z niej wszystkie pary o takiej postaci, a potem je przywrócimy. A
struktury izomorficzne są funkcjonalnie takie same.

Odkryliśmy w jednym z poprzednich rozdziałów, że takie "`≤`-fakty zwrotnościowe" są (w pewien
sposób) elementami neutralnymi, bo każda relacja zwrotna, przechodnia i antysymetryczna to
(funkcjonalnie) to samo, co kategoria, w której strzałkami są fakty zachodzenia tej relacji między
parami liczb jako punktami. A skoro takie relacje są pewnymi kategoriami, to mamy tu do czynienia z
(wybrednym) *działaniem* (składania strzałek), a więc jest w ogóle *możliwe*, żeby tu były (z
pewnego punktu widzenia) jakieś elementy neutralne.

Ze względu na to idealne dopasowanie między dwoma rodzajami struktur, to jest między strukturą
relacji `≤` i strukturą pewnej (jak może pamiętasz *cienkiej*) kategorii, fakty `x ≤ x` odpowiadają
dokładnie endostrzałkom identycznościowym, a więc z pewnego punktu widzenia nimi są (a wszystko w
matematyce jest czymś albo jest jakieś tylko z pewnego punktu widzenia, a więc *po prostu* nimi
są). I teraz mogę wreszcie powiedzieć, do czego zmierzałem, a co możesz już nieźle pamiętać i czasem
dość szybko zauważać: Wymieniając tak ze sobą relacje `≤` i `<` ani nie dodajemy, ani nie pozbywamy
się żadnej informacji, zmienia się tylko to, z jakiej własności tych dwóch relacji (zwrotności i
przeciwzwrotności) korzystamy w jaki sposób. A więc zmienia się *sposób mówienia*, ale nie *treść*
tego, co mówimy, albo możemy powiedzieć.

Gdyby *niektóre, ale nie wszystkie* liczby były mniejsze od siebie samych, mielibyśmy z tym problem,
bo taka zmiana sposobu mówienia nie byłaby ani spójna, ani powierzchowna. W szczególności, operacje
dodawania i usuwania faktów zwrotnościowych nie byłyby wtedy swoimi odwrotnościami. Ale żadne liczby
nie są mniejsze od samych siebie, a więc - poza ewentualnymi trudnościami psychologicznymi - nie
mamy z tym problemu. *Możemy* konsekwentnie mówić, że *wszystkie liczby są mniejsze od siebie
samych*, bo taki sposób mówienia polega *tylko* na *zmianie sposobu użycia słowa "mniejsze"* (albo
stałej `<` lub `≤`), która *nie prowadzi do sprzeczności*, bo jest *tylko* logicznie nieszkodliwą
*jawną zmianą konwencji*. Po co mielibyśmy zmieniać sposób mówienia na funkcjonalnie równoważny? To
doskonałe pytanie, na które mogę na razie odpowiedzieć tylko niezbyt jasno mówiąc, że (w tym
kontekście chyba paradoksalnie) *sposób mówienia jest również częścią matematycznej treści*. Dodam
może tylko, że izomorficzność jest często do tego stopnia *nieoczywista*, że w wielu sytuacjach,
nawet wtedy, gdy izomorficzne struktury są relatywnie proste, ludzie z trudem ją zauważają, co wiemy
między innymi dzięki badaniom psychologicznym dotyczącym tak zwanego *transferu wprawy* w
rozwiązywaniu problemów.

Oto kilka przykładów elementów neutralnych, które albo już znasz, albo możesz już chyba łatwo
rozpoznać jako elementy neutralne:

1. `0` ze względu na `+` jako dodawanie (różnych rodzajów) liczb:  
   `∀ L ∈ {ℕ, ℤ, ℚ, ℝ, ℂ}, ∀ x ∈ L, 0 + x = x + 0 = x`.

2. Tak samo `1` ze względu na `×` jako mnożenie (różnych rodzajów) liczb. Wystarczy w ostatnim
   zdaniu zastąpić stałą `0` przez stałą `1`, a stałą `+` przez stałą `×`.

3. `∅` ze względu na `∪` (sumę zbiorów):  
   `∀ X : Set, ∅ ∪ X = X ∪ ∅ = X`.

4. Zbiór `U` (jak *uniwersum*), traktowany w danym kontekście jako zawierający wszystkie rozważane
  elementy, ze względu na `∩` (część wspólną zbiorów). Wystarczy zastąpić w ostatnim zdaniu `∅`
  przez (tak zdefiniowane) `U`, a `∪` przez `∩`.
  
5. `∅` ze względu na `+` jako sumę rozłączną zbiorów:  
   `∀ X : Set, ∅ + X ≅ X + ∅ ≅ X`.

6. `{_}` (dowolny zbiór jednoelementowy) ze względu na `×` jako iloczyn kartezjański
   zbiorów. Wystarczy w powyższym zdaniu zastąpić `∅` na przykład przez `{∅}`, a `+` przez `×`.
  
7. `False` ze względu na `∨`:  
   `∀ p : Prop, False ∨ p ↔ p ∨ False ↔ p`.

8. `True` ze względu na `∧`. Wystarczy zastąpić w ostatnim zdaniu `False` przez `True`, a `∨` przez
   `∧`.

Wszystkie te działania mają nie tylko elementy neutralne, ale są również *przemienne*, co najmniej z
dokładnością do (kanonicznego) izomorfizmu (przypominam, że w kategorii dowiedlności `↔` to
kategoryjny izomorfizm):

`∀ x y : Coś, x ● y ≅! y ● x`

Ponadto, wszystkie te działania nie tylko mają elementy neutralne i są przemienne (jedno i drugie co
najmniej z dokładnością do \{kanonicznego\} izomorfizmu), ale są również łączne co najmniej z
dokładnością do (również kanonicznego) izomorfizmu:

`∀ x y z : Coś, (x ● y) ● z ≅! x ● (y ● z)`

W obydwu przypadkach `●` to `+` lub `×` (wtedy `Coś` to `ℕ` lub `ℤ` lub `ℚ` lub `ℝ` lub `ℂ` \{tutaj
zbiór liczb zespolonych\} lub `Set`) lub `∪` lub `∩` (wtedy `Coś` to `Set`) lub `∨` lub `∧` (wtedy
`Coś` to `Prop`). Pozwoliłem sobie wprowadzić o ile mi wiadomo całkiem niestandardowe oznaczenie
`≅!`, które (tylko dlatego, że ja tak postanowiłem) **czytamy jako**: *jest kanonicznie izomorficzne
do*.

Na przykład, gdy `X`, `Y` i `Z` to zbiory, to - jak łatwo wykazać konstruując izomorfizmy w każdą
stronę, wymieniające elementy typu `((x, y), z)` z elementami typu `(x, (y, z))` - `(X × Y) × Z ≅ X
× (Y × Z)`:

```lean
-- Skorzystamy z (tutaj ewidentnej) powierzchowności różnic między zbiorami i typami. Pomijając
-- różnice w notacji, dowód dla zbiorów przebiega tak samo.
example (X Y Z : Type) : 
  ∃ f : (X × Y) × Z → X × (Y × Z), ∃ g : X × (Y × Z) → (X × Y) × Z,
    g ∘ f = id ∧ f ∘ g = id :=
    -- Skonstruowanie elementów, które "razem dają" dowód tego zdania, jest trywialne ...
    let f : (X × Y) × Z → X × (Y × Z) := fun ⟨⟨x, y⟩, z⟩ => ⟨x, ⟨y, z⟩⟩
    let g : X × (Y × Z) → (X × Y) × Z := fun ⟨x, ⟨y, z⟩⟩ => ⟨⟨x, y⟩, z⟩
    let hgfi : g ∘ f = id := by rfl
    let hfgi : f ∘ g = id := by rfl
    --- ... za to tochę mniej trywialne jest skonstruowanie z tych elementów poprawnego
    --- dowodu. Dlatego, jak również w powodów dydaktycznych, przejdziemy teraz do trybu
    --- interaktywnego i dokończymy konstrukcję maksymalnie bezmyślnie, patrząc tylko, czego
    --- dokładnie Lean się od nas w danym momencie domaga.
    by
    apply Exists.intro
    apply Exists.intro
    apply And.intro
    assumption
    assumption
```

Zwracam przy okazji uwagę, że to jest dowód *izomorficzności* tego rodzaju konstrukcji, ale to *nie*
jest dowód *kanoniczności* izomorfizmu. I nie może być, bo pojęcie kanoniczności jest dla nas (jak
dotąd) *nieformalne*. Jak to wygląda dla koniunkcji zdań?

```lean
example (p q r : Prop) : (p ∧ q) ∧ r ↔ p ∧ (q ∧ r) :=
  ⟨fun ⟨⟨hp, hq⟩, hr⟩ => ⟨hp, ⟨hq, hr⟩⟩,
   fun ⟨hp, ⟨hq, hr⟩⟩ => ⟨⟨hp, hq⟩, hr⟩⟩
```

A jak to wygląda dla alternatywy zdań? Albo dla sumy rozłącznej zbiorów? A kogo to obchodzi? Na
przykład, czasem mnie, ale próbuję coś teraz podkreślić: To są dualne konstrukcje, a więc wystarczy
powiedzieć *i dualnie*, i będziemy mieli to wszystko udowodnione. Żaden z tych dowodów nie był
potrzebny (do udowodnienia tych zdań), bo (ko)produkt jako (kategoryjna) operacja jest (kanonicznie)
łączny. Co jednak udowodnimy nieco później, bo od tego nieco męczącego dowodu znacznie ciekawsze są
jego konsekwencje i jego wersje szczególne (albo implementacje) w rozmaitych konkretnych
kategoriach.

Będziemy się teraz uważnie przyglądać temu, na czym dokładnie polega ta kanoniczność. To nam nie
tylko pozwoli lepiej ją zrozumieć, a dzięki temu bardziej nad nią zapanować i łatwiej rozpoznawać ją
w innych sytuacjach, ale zaczniemy też przy okazji oswajać się z pojęciem [*transformacji
naturalnej*](https://pl.wikipedia.org/wiki/Transformacja_naturalna), którego formalizacja była
[*głównym powodem*](https://doi.org/10.1090/S0002-9947-1945-0013131-6), dla którego Mac Lane i
Eilenberg stworzyli teorię kategorii.

## Naturalnie, czyli jak?

Jak łatwo zauważyć, zarówno dowody izomorficzności zbiorów `(X × Y) × Z` i `X × (Y × Z)` jak i zdań
`(p ∧ q) ∧ r` i `p ∧ (q ∧ r)` miały nie tylko wyraźnie *schematyczny* charakter, ale też w
kluczowych miejscach *wyglądały dokładnie tak samo*. Każdy z tych dwóch izomorfizmów z lewej do
prawej można by zapisać tak ...

`((a, b), c) ↦ (a, (b, c))`

... a każdy z prawej do lewej można by zapisać tak, ...

`(a, (b, c)) ↦ ((a, b), c)`

... gdzie symbol `↦` (który uzyskasz pisząc `\mapsto`) to standardowa notacja oznaczająca działanie
funkcji na jakimś (zwykle, tak jak tutaj, rozumianym jako typowy albo arbitralny i dlatego zapisanym
parametrycznie) elemencie. Na przykład, funkcję kwadratową można równie dobrze zapisać jako `m ↦ m ×
m`; zresztą już się pewnie oswoiłaś z tym zapisem, bo taką samą rolę odgrywa symbol `=>` w
definicjach λ-abstrakcji. Można powiedzieć, że to tylko inny sposób zapisywania funkcji anonimowych.

W przypadku izomorfizmu między zbiorami, to było przekształcenie uporządkowanych par *elementów*,
których pierwszym albo drugim elementem była również uporządkowana para elementów. Z powodu
zastosowanej w Leanie implementacji koniunkcji, w przypadku zdań to było również przekształcenie
uporządkowanych par, ale *dowodów*, których pierwszym albo drugim elementem była również
uporządkowana para dowodów. Rezultatem każdego z tych przekształceń była w obydwu przypadkach *ta
sama* (bo to są izomorfizmy), tylko *inaczej "formalnie zapakowana" informacja*. O takich
przekształceniach mówi się czasem po angielsku, że są *formulaic*, co można przetłumaczyć jako
*schematyczne*, albo *utarte*, albo *rutynowe*, albo nawet jako *formalne*, ale w rozumieniu
*powierzchowne* - pod tym względem, że *niezależne od natury czy tożsamości elementów*.

Zgaduję, że te dowody również Tobie wydają się w jakiś sposób schematyczne i powierzchowne, a w
związku z tym jesteś może skłonna przyznać, że te izomorfizmy są w pewnym sensie "naturalne", albo
że niemal "same się narzucają". Zastanowimy się teraz, co by nam zostało, gdybyśmy chcieli oddzielić
*psychologiczny* aspekt tej schematyczności albo naturalności albo wręcz - pojawiającej się
nieuchronnie po dłuższym kontakcie z tego rodzaju dodowami - oczywistości. Nie domyślasz się
jeszcze? Skoro to matematyka, a chcemy uchwycić formalnie pewne pojęcie nieformalne, to jest tylko
jeden aspekt, na którym należy się skupić. Tym najważniejszym matematycznie aspektem jest (może dla
Ciebie też już niemal oczywiście?) *funkcjonalność*.

A co takiego *robi* każdy (kategoryjny) izomorfizm? Przekształca jeden *obiekt* w drugi *bez zmiany
funkcjonalności*. Nie ma znaczenia, czy mówimy o zbiorach i funkcjach, zdaniach i dowodach,
jakiejkolwiek relacji zwrotnej i przechodniej, jakiejkolwiek relacji przeciwzwrotnej i przechodniej,
przestrzeniach wektorowych i mapach liniowych, przestrzeniach topologicznych i funkcjach ciągłych,
czy o dowolnej innej kategorii; jeżeli `f : A ≅ B : f⁻¹` (tak tym razem zapisałem kategoryjne
izomorfizmy z `A` do `B` i z `B` do `A`), to:

- Każda strzałka `g : X → A` odpowiada ze względu na ten izomorfizm unikalnej strzałce `f g : X →
   B`.

- Każda strzałka `g : X → B` odpowiada ze względu na ten izomorfizm unikalnej strzałce `f⁻¹ g : X →
   A`.
   
Dla każdego obiektu `X`, mamy więc, dany przez dołożenie `f` (`f⁻¹`) izomorfizm między zbiorami
`Hom(X, A)` i `Hom(X, B)` (to dla nas na razie tylko wygodne oznaczenie zbiorów strzałek z `X` do
`A` i `B` odpowiednio; po polsku nazywamy je oficjalnie zbiorami morfizmów \{kategorii, która akurat
tutaj jest bliżej nieokreślona\}). Ten izomorfizm możemy zapisać na przykład jako funkcję anonimową
tak: `g ↦ f g`, gdzie `g` to dowolna strzałka z `X` do `A` (czyli w zapisie `g ↦ f g` chodzi o
wiązanie - przez duży kwantyfikator - o postaci `∀ g ∈ Hom(X, A), ...`, ale chwilowo postrzegane
jako parametr funkcji \{anominowej\}). Analogicznie, dla każdego obiektu `Y` mamy izomorfizm z
`Hom(A, Y)` do `Hom(B, Y)`, dany przez `g ↦ g f⁻¹` (tutaj *podkładamy*, a nie *dokładamy* `f⁻¹`, bo
tylko tak można przekształcić `g ∈ Hom(A, Y)` w strzałkę, której celem jest nadal `Y`, ale której
źódłem jest `B` \{czyli która należy do zbioru `Hom(B, Y)`\}).

Obiekty izomorficzne (przypominam, że mówimy o izomorficznych *obiektach* \{które w naszym dialekcie
kategoriańskim nazywamy punktami\}, nie o izomorficznych *strzałkach*) muszą mieć zatem *takie same
własności strzałkowo-złożeniowe*, a więc każdy z tych obiektów jest powiązany ze wszystkimi innymi
obiektami taką samą "siecią relacji". Na przykład, jeżeli obiekt `X` emituje dokładnie jedną
strzałkę do obiektu `Y` taką, że ..., to *każdy izomorf* obiektu `X` również emituje dokładnie jedną
strzałkę do obiektu `Y` taką, że ... Mówiąc krótko, obiekty, które są *różne* i izomorficzne są
*funkcjonalnie nieodróżnialne*; różnice między takimi obiektami są zatem *w pewnym sensie* "czysto
formalne".

No dobrze, ale te dwa dowody izomorficzności, które oglądamy teraz z uwagą z różnych stron, to *nie*
są *tylko* jakieś izomorfizmy między jakimś jednym *wybranym* obiektem a *wybranym* drugim. To są
*izomorfizmy parametryczne*, to znaczy, to są przepisy (bo dowody są tu akurat *konstruktywne*), jak
dla *każdej* trójki obiektów `A`, `B` i `C` skonstruować izomorfizm między dwiema konstrukcjami
"zrobionymi z" (może lepiej: będącymi pewną własnością) tych obiektów, to jest między `(A × B) × C`
i `A × (B × C)`. Tak jak *wskazanie* (na przykład poprzez scharakteryzowanie go w sposób
gwarantujacy unikalność) konkretnego izomorfizmu `f : A ≅ B` to *znacznie* więcej, niż
*stwierdzenie*, że *jakiś* izomorfizm między `A` i `B` *istnieje*, bo bez takiego wskazania nie da
się korzystać z "tłumaczeniowej" funkcjonalności związanej z izomorficznością, tak czymś *jeszcze
mocniejszym* jest *wskazanie* takich izomorfizmów *dla każdej trójki `(A B C)`*, albo inaczej mówiąc
*oznaczenie* ich *za pomocą trójek `(A B C)`*

Żeby łatwiej nam było zrozumieć, na czym polega ta ostatnia różnica, rozsądnie będzie skupić się na
prostszym przykładzie kategoryjnego izomorfizmu parametrycznego, to jest na symetryczności (tu mamy
izomorficzność) wszelkich (a tu parametryczność) produktów `X × Y ≅ Y × X`, ...

`(x, y) ↦ (y, x)`

... której działający dla wszystkich produktów we wszystkich kategoriach dowód, jak to w takich
sytuacjach bywa, robi się praktycznie sam: Mamy znaleźć izomorfizm z `X × Y` do `Y × X`, a więc
pewną strzałkę z `X × Y` do `Y × X`. Wiemy tylko tyle, że to są jakieś produkty w jakiejś kategorii,
a więc wiemy tylko tyle, że każdy z tych obiektów ma parę projekcji i że każda strzałka do `Y × X`
(`X × Y`) jest tym samym, co pewna para strzałek do `Y` (`X`) i `X` (`Y`) z tego samego
źródła. Widzisz już, jak ten dowód niemal sam się robi? Korzystamy z jedynej pary współźródłowych
strzałek do `Y` i `X`, którą mamy pod ręką, to jest z projekcji `π₁ : X × Y → X` i `π₂ : X × Y → Y`,
uzyskując produkt strzałek (uwaga na zmianę kolejności, która jest "sednem"[^1] tego dowodu) `⟨π₂,
π₁⟩`. Od razu widzimy, że taki sam proces działa w drugą stronę, dając `⟨π₂, π₁⟩`.

Te strzałki są przeciwrównoległe, czyli składalne na wszystkie dwa możliwe sposoby. Ponieważ nie
oznaczyliśmy (no dobrze, ja nie oznaczyłem) inaczej par projekcji, te dwa potencjalnie różne
produkty strzałek wyglądają tak samo, a w zasadzie *nie powinny*, bo ta wieloznaczność jest akurat
pod pewnymi względami *problematyczna*, ale ponieważ te strzałki *działają tak samo*, możemy z tej
problematyczności czerpać coś w rodzaju perwersyjnej przyjemności. Pozostaje nam już tylko
trywialna, również robiąca się sama końcówka; ponieważ `⟨f, g⟩ h = ⟨f h, g h⟩`, bo przecież `π₁ ⟨f,
g⟩ h = f h` i analogicznie dla drugiej projekcji (`f`, `g` i `h` to tutaj niejawne *parametry*
pewnego twierdzenia pomocniczego, zauważyłaś?), to:

`⟨π₂, π₁⟩ ⟨π₂, π₁⟩ = ⟨π₂ ⟨π₂, π₁⟩, π₁ ⟨π₂, π₁⟩⟩ = ⟨π₁, π₂⟩ = Id`

Tak oto udowodniliśmy, że wszystkie produkty we wszystkich kategoriach są symetryczne, czyli że (być
może wybredna) operacja tworzenia produktów jest przemienna, półformalnie opisując proces, czyli
półformalnie konstruując funkcję, która dla wszystkich par produktów `X × Y` i `Y × X` w jakiejś
kategorii dostarcza procesy, które akurat w kategorii `Set` (zbiorów i funkcji) działają tak (na
standardowej implementacji produktu, którą jest iloczyn kartezjański):

`(x, y) ↦ (y, x)`  
`(y, x) ↦ (x, y)`

Widzimy od razu, że przynajmniej w `Set` te dwa procesy są ewidentnie "powierzchowne" albo
"formalne" w znaczeniu *niezależne od natury elementów* (tutaj oznaczonych jako `x` i `y`). Ale
*dlaczego* takie są? Czy może raczej *na czym polega* to, że takie sa? I czy da się (w jakiś sposób)
wyrazić ewentualny powód czy może raczej istotę tej powierzchowności *formalnie*, to jest czy da się
"to coś", co tu "się dzieje", "uchwycić" za pomocą jakiejś (językowej) *struktury*, inaczej
*zakodować*?

CDN

### Przypisy

[^1]: Albo [*esencją, w której widać dno*](https://sjp.pwn.pl/slowniki/sedno.html).
