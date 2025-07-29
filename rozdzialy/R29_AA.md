## O czym teraz będzie

W tym rozdziale po raz kolejny nawiązujemy kontakt z algebrą abstrakcyjną, jednak zamiast mówić na
przykład o półgrupach, grupach, pierścieniach i ciałach, próbujemy wspiąć się możliwie szybko
znacznie wyżej i złapać warkocz tego uniwersalnego przeplatania się, które nazywamy kwadratem
naturalności. Korzystamy też z kilku okazji do powtórzenia materiału i zaczynamy domyślać się czegoś
na temat wszelkiego myślenia. A pod koniec obiecujemy jakieś gruszki na jakiejś wierzbie. I nie ma
zadań.

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

4. Zbiór `U` (jak *uniwersum*), to jest taki, który traktujemy *w danym kontekście* jako zawierający
  *wszystkie rozważane* elementy, ze względu na `∩` (część wspólną zbiorów). Wystarczy zastąpić w
  ostatnim zdaniu `∅` przez (tak rozumiane) `U`, a `∪` przez `∩`.
  
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
akurat zbiór liczb zespolonych, a nie jak wcześniej jakaś kategoria\} lub `Set`) lub `∪` lub `∩`
(wtedy `Coś` to `Set`) lub `∨` lub `∧` (wtedy `Coś` to `Prop`). Pozwoliłem sobie wprowadzić o ile mi
wiadomo całkiem niestandardowe oznaczenie `≅!`, które (tylko dlatego, że tak postanowiłem) **czytamy
jako**: *jest kanonicznie* albo *unikalnie izomorficzne do*.

Na przykład, gdy `X`, `Y` i `Z` to zbiory, to - jak łatwo wykazać konstruując izomorfizmy w każdą
stronę, wymieniające elementy typu `((x, y), z)` z elementami typu `(x, (y, z))` - `(X × Y) × Z ≅ X
× (Y × Z)`:

```lean
-- Skorzystamy z (tutaj ewidentnej) powierzchowności różnic między zbiorami i typami. Pomijając
-- różnice w notacji, dowód dla zbiorów przebiega tak samo.
example (X Y Z : Type) : 
  ∃ f : (X × Y) × Z → X × (Y × Z), ∃ g : X × (Y × Z) → (X × Y) × Z,
    g ∘ f = id ∧ f ∘ g = id :=
    -- Słowo kluczowe `let` działa jak `have`. Skonstruowanie elementów, które "razem dają" dowód
    -- tego zdania, jest trywialne ...
    let f : (X × Y) × Z → X × (Y × Z) := fun ⟨⟨x, y⟩, z⟩ => ⟨x, ⟨y, z⟩⟩
    let g : X × (Y × Z) → (X × Y) × Z := fun ⟨x, ⟨y, z⟩⟩ => ⟨⟨x, y⟩, z⟩
    let hgfi : g ∘ f = id := by rfl
    let hfgi : f ∘ g = id := by rfl
    --- ... za to tochę mniej trywialne jest skonstruowanie z tych elementów poprawnego
    --- dowodu. Dlatego, jak również w powodów dydaktycznych, przejdziemy teraz do trybu
    --- interaktywnego i dokończymy konstrukcję maksymalnie bezmyślnie, patrząc tylko, czego
    --- dokładnie Lean się od nas w danym momencie domaga.
    by
    -- Chcesz dowód, że jakieś coś istnieje? To potrzymaj proszę ten jarmuż, na pewno gdzieś mam...
    apply Exists.intro
    -- Jeszcze jeden chcesz? Pogrzebacz, możesz też potrzymać? 
    apply Exists.intro
    -- A teraz chcesz dowód koniunkcji?
    apply And.intro
    -- A sam sobie znajdź, tu u mnie na górze, w kontekście.
    assumption
    assumption
```

Zwracam przy okazji uwagę, że to jest dowód *izomorficzności* tego rodzaju konstrukcji, ale to *nie*
jest dowód *kanoniczności*, a dokładniej mówiąc *naturalności* izomorfizmu. I nie może być, bo to
ostatnie pojęcie jest dla nas (jak dotąd) *nieformalne*. Jak wygląda analogiczny dowód dla
koniunkcji zdań?

```lean
example (p q r : Prop) : (p ∧ q) ∧ r ↔ p ∧ (q ∧ r) :=
  ⟨fun ⟨⟨hp, hq⟩, hr⟩ => ⟨hp, ⟨hq, hr⟩⟩,
   fun ⟨hp, ⟨hq, hr⟩⟩ => ⟨⟨hp, hq⟩, hr⟩⟩
```

A jak to wygląda dla alternatywy zdań? Albo dla sumy rozłącznej zbiorów? A kogo to obchodzi? Na
przykład, czasem mnie, ale próbuję coś teraz podkreślić: To są dualne konstrukcje, a więc wystarczy
powiedzieć *i dualnie* i od razu będziemy mieli to wszystko udowodnione. Żaden z tych dowodów nie
był zresztą tak naprawdę potrzebny (do udowodnienia tych zdań), bo (ko)produkt jako (kategoryjna)
operacja jest (kanonicznie) łączny. Co jednak udowodnimy nieco później, bo od tego nieco męczącego
dowodu znacznie ciekawsze są jego konsekwencje, jego wersje szczególne (albo implementacje) w
rozmaitych konkretnych kategoriach, jak również (nomen omen) natura tej łączności.

Będziemy się teraz uważnie przyglądać temu, na czym dokładnie polega ta kanoniczność. To nam nie
tylko pozwoli lepiej ją zrozumieć, a dzięki temu bardziej nad nią zapanować i łatwiej rozpoznawać ją
w innych sytuacjach, ale zaczniemy też przy okazji oswajać się z pojęciem [*transformacji
naturalnej*](https://pl.wikipedia.org/wiki/Transformacja_naturalna), którego formalizacja była
[*głównym powodem*](https://doi.org/10.1090/S0002-9947-1945-0013131-6) stworzenia teorii kategorii.

## *Naturalnie*

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
definicjach λ-abstrakcji. To zatem tylko inny sposób zapisywania funkcji anonimowych.

W przypadku izomorfizmu między zbiorami, to było przekształcenie uporządkowanych par *elementów*,
których pierwszym albo drugim elementem była również uporządkowana para elementów. Z powodu
zastosowanej w Leanie implementacji koniunkcji, w przypadku zdań to było również przekształcenie
uporządkowanych par, ale *dowodów*, których pierwszym albo drugim elementem była również
uporządkowana para dowodów. Rezultatem każdego z tych przekształceń była w obydwu przypadkach *ta
sama* (bo to są izomorfizmy), tylko *inaczej "formalnie zapakowana" informacja*. O takich
przekształceniach mówi się czasem po angielsku, że są *formulaic*, co można przetłumaczyć jako
*schematyczne*, albo *utarte*, albo *rutynowe*, albo nawet jako *formalne*, ale w rozumieniu
*powierzchowne* - pod tym względem, że *niezależne od natury* czy *tożsamości elementów*.

Zgaduję, że te dowody również Tobie wydają się w jakiś sposób schematyczne i powierzchowne, a w
związku z tym jesteś może skłonna przyznać, że te izomorfizmy są w pewnym trudnym do dokładnego
opisania sensie "naturalne". Zastanowimy się teraz, co by nam zostało, gdybyśmy chcieli oddzielić
*psychologiczny* aspekt tej schematyczności albo naturalności, albo wręcz - pojawiającej się
nieuchronnie po dłuższym kontakcie z tego rodzaju dowodami - oczywistości. Nie domyślasz się
jeszcze? Skoro to matematyka, a chcemy uchwycić formalnie pewne pojęcie nieformalne, to jest tylko
jeden aspekt, na którym należy się skupić. Tym najważniejszym matematycznie aspektem jest (może dla
Ciebie też już niemal oczywiście?) *funkcjonalność*.

A co takiego *robi* każdy (kategoryjny) izomorfizm? Przekształca jeden *obiekt* w drugi *bez zmiany
funkcjonalności*. Nie ma znaczenia, czy mówimy o zbiorach i funkcjach, zdaniach i dowodach,
jakiejkolwiek relacji zwrotnej i przechodniej, jakiejkolwiek relacji przeciwzwrotnej i przechodniej,
przestrzeniach wektorowych i mapach liniowych, przestrzeniach topologicznych i funkcjach ciągłych,
czy o dowolnej innej kategorii; jeżeli `f : A ≅ B : f⁻¹` (tak tym razem zapisałem kategoryjne
izomorfizmy z `A` do `B` i z `B` do `A`), to:

1. Każda strzałka `g : X → A` odpowiada ze względu na ten izomorfizm unikalnej strzałce `f g : X → B`
   i wszystkie strzałki `X → B` są w ten sposób oznaczalne.

2. Każda strzałka `g : X → B` odpowiada ze względu na ten izomorfizm unikalnej strzałce `f⁻¹ g : X →
   A` i wszystkie strzałki `X → A` są w ten sposób oznaczalne.
   
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
są *tylko* jakieś izomorfizmy między jakimś jednym *wybranym* obiektem a *wybranym* drugim.  Żeby
było nam łatwiej zrozumieć, jak tego rodzaju konstrukcje działają, rozsądnie będzie skupić się na
prostszym przykładzie kategoryjnego izomorfizmu *parametrycznego*, to jest na symetryczności (tu
mamy izomorficzność) wszelkich (a tu parametryczność) produktów `X × Y ≅ Y × X`, ...

`(x, y) ↦ (y, x)`

... której działający dla wszystkich produktów we wszystkich kategoriach dowód, jak to w takich
sytuacjach bywa, robi się praktycznie sam: 

Mamy znaleźć izomorfizm z `X × Y` do `Y × X`, a więc pewną strzałkę z `X × Y` do `Y × X`. Wiemy
tylko tyle, że to są jakieś produkty w jakiejś kategorii, a więc wiemy tylko tyle, że każdy z tych
obiektów ma parę projekcji i że każda strzałka z `X × Y` do `Y × X` (albo w drugą stronę, z `Y × X`
do `X × Y`) jest tym samym, co pewna para strzałek do `Y` (`X`) i `X` (`Y`) z tego samego
źródła. Widzisz już, jak ten dowód niemal sam się robi? Korzystamy z jedynej pary współźródłowych
strzałek do `Y` i `X` (w tej kolejności), którą mamy pod ręką, to jest z pary projekcji `π₂ : X × Y
→ Y` i `π₁ : X × Y → X` (w tej kolejności), uzyskując produkt strzałek (uwaga na kolejność, która
jest "sednem"[^1] tego dowodu) `⟨π₂, π₁⟩`. Od razu widzimy, że taki sam proces działa w drugą
stronę, dając `⟨π₂, π₁⟩`.

Te strzałki są przeciwrównoległe, czyli składalne na oba możliwe sposoby. Ponieważ nie oznaczyliśmy
(no dobrze, ja nie oznaczyłem) inaczej dwóch potencjalnie różnych par projekcji i dwóch powstających
z tych par, potencjalnie różnych produktów strzałek, te dwa potencjalnie różne produkty strzałek
wyglądają tak samo, a w zasadzie *nie powinny*, bo ta wieloznaczność jest akurat pod pewnymi
względami *problematyczna*. Ale ponieważ te strzałki *działają tak samo*, możemy z tej
problematyczności czerpać coś w rodzaju perwersyjnej przyjemności. Pozostaje nam już tylko trywialna
(chociaż chyba nic nie jest trywialne, po dłuższym namyśle), również robiąca się sama końcówka:

Skoro `⟨f, g⟩ h = ⟨f h, g h⟩`, bo przecież `π₁ ⟨f, g⟩ h = f h` i analogicznie dla drugiej projekcji
(`f`, `g` i `h` to tutaj niejawne *parametry* pewnego twierdzenia pomocniczego, zauważyłaś?), to
podstawiając chwilowo `f := π₁`, `g := π₂`, `h := ⟨π₂, π₁⟩` widzimy, że:

`⟨π₂, π₁⟩ ⟨π₂, π₁⟩ = ⟨π₂ ⟨π₂, π₁⟩, π₁ ⟨π₂, π₁⟩⟩ = ⟨π₁, π₂⟩ = Id`

Tak oto (znowu? bo nie pamiętam, czy to już było) udowodniliśmy, że wszystkie produkty (w dowolnej
kategorii, która ma produkty) są symetryczne, czyli że (w tym wypadku niewybredna) operacja
tworzenia produktów jest przemienna. Udowodniliśmy to półformalnie opisując proces, czyli
półformalnie konstruując funkcję, który/a dla wszystkich par produktów `X × Y` i `Y × X` w jakiejś
kategorii dostarcza procesy, które akurat w kategorii `Set` (zbiorów i funkcji) działają tak (na
standardowej implementacji produktu, którą jest iloczyn kartezjański):

`(x, y) ↦ (y, x)`  
`(y, x) ↦ (x, y)`

Widzimy wyraźnie, że przynajmniej w `Set` te dwa procesy są ewidentnie "powierzchowne" albo
"formalne" w znaczeniu *niezależne od natury elementów* (tutaj oznaczonych jako `x` i `y`). Ale
*dlaczego* takie są? Czy może raczej *na czym polega* to, że takie sa? I czy da się (w jakiś sposób)
wyrazić ewentualny powód czy może raczej istotę tej powierzchowności *formalnie*, to jest czy da się
"to coś", co tu "się dzieje", "uchwycić" za pomocą jakiejś (językowej) *struktury*, inaczej mówiąc
*zakodować* (a dzięki zakodowaniu tym czymś *zawładnąć*)?

To ostatnie pytanie można zastąpić wersją, na którą odpowiedź, gdyby udało się ją znaleźć, byłaby
może nawet bardziej użyteczna, bo wskazywałaby na coś w rodzaju *metody* poszukiwania odpowiedzi na
*tego rodzaju* pytania. Popatrzmy więc na to ostatnie pytanie i zadajmy sobie pytanie, co warto w
nim *zamienić na parametry*, a co ewentualnie wypada *ukonkretnić*. Mamy tam *jakieś* (to jest
przykład zamiany pewnej stałej na parametr ...) pojęcie półformalne, którego istotę chcemy "uchwycić
formalnie". "Uchwycić formalnie" to dla nas w tej chwili albo *w pełni sformalizować w języku teorii
typów*, albo *scharakteryzować funkcjonalnie w języku teorii kategorii*, a właściwie *jedno i
drugie* (... a to jest przykład ukonkretnienia cokolwiek mętnego pojęcia).

Do tej pory za każdym razem, zanim znaleźliśmy lub zaczęliśmy rozumieć jakąkolwiek kategoryjną
charakterystykę funkcjonalną, przyglądaliśmy się przynajmniej jednej implementacji teoriotypowej
albo teoriomnogościowej, po prostu po to, żeby mieć *w czym* zobaczyć tą funkcjonalność. Przykłady
teoriomnogościowe były "strukturalnie minimalistyczne" i przez to relatywnie nieskomplikowane i
łatwe do zrozumienia, a dzięki swojej półformalności pozwalały na wygodne skróty myślowe, na
przykład na znacznie szybsze tworzenie konstrukcji, w tym również dowodów, niż w przypadku
konstrukcji w pełni sformalizowanych. Przykłady teoriotypowe miały natomiast tą zaletę, że można je
było zrealizować w kodzie, a dzięki temu sprawdzić ostatecznie, czy wszystko działa, zbadać każdy
aspekt formalizmu i poczuć fizyczną autonomię ich implementacji.

### [...🐍...](https://pl.wikipedia.org/wiki/Uroboros)

<hr>

Możemy nawet spróbować "zrobić metodę" z *ostatniego* akapitu, tak samo zamieniając coś lub kilka
rzeczy na mniej lub bardziej zrozumiale typowane parametry, a coś innego być może tak lub inaczej
konkretyzując. Podobnie postępują informatycy, gdy po napisaniu wstępnej wersji rozwiązania jakiegoś
problemu zmieniają niektóre stałe w zmienne, a wszystko opakowują w strukturę procedury (nazywanej
też funkcją) albo kilku procedur, czy na przykład tak zwanych klas albo innych typów danych. W ten
właśnie sposób powstają przecież wszekiego rodzaju *metody wielokrotnego użytku*, albo
"metodologie".

Zatem co my tam robimy, w tym już teraz poprzednim akapicie? Wstępując o krok wyżej na tą naszą
drabinę abstrakcji przez algorytmizację, czy może Algorytmizacji przez Abstrakcję, widzimy, że
przyglądamy się tam temu, co przed chwilą powiedzieliśmy, albo co zrobiliśmy, albo co do pewnego
stopnia i w pewien sposób zrozumieliśmy, skupiamy się na najważniejszych częściach i zastępujemy
wybrane stałe mniej lub bardziej adekwatnie typowanymi parametrami, a wybrane ogólnikowe i niejasne
sformułowania zastępujemy (względnymi) konkretami. Widzisz, co *tutaj* się stało, w *tych* ostatnich
dwóch akapitach?

*Powtarzamy się*, bo znaleźliśmy *punkt stały* pewnego procesu, czyli połknęliśmy własny ogon (`I(x)
= x`), jak jakiś [węż](https://pl.wikipedia.org/wiki/W%C4%85%C5%BC_po%C5%BCarniczy)[^2] z drzewa
poznania wszystkiego, co działa. A to znaczy, że znaleźliśmy (tylko pewną czy może jedyną
istniejącą?) *nieformalną* (a więc w pewnym sensie najbardziej, bo *trochę za bardzo* elastyczną)
*metodę metod*. [Aa](https://www.aa.org/)(a)! Ok, może trochę mnie poniosło. Przecież to nic innego
(?) jak *rozpoznanie wzorca rozpoznawania wzorców*.

<hr>

Wracając do przerwanego wątku, nadal nie widzimy wyraźnie, a w każdym razie ja nie widzę dość
wyraźnie w tym, co do tej pory napisałem, co dokładnie dzieje się w dowodzie symetryczności
wszelkich kategoryjnych produktów w kategorii `Set`. To może sformalizujmy ten dowód całkowicie, a
raczej jego wersję opartą na głębokich podobieństwach między zbiorami i typami. Dzięki temu nic się
przed nami nie ukryje i pozostnie nam tylko wskazywać to czy tamto, zaś to, co wskażemy, ostrożnie
ponazywać, w nadziei, że wyłoni się jakiś ważny ogólny wzorzec.

```lean
-- Klikając prawym przyciskiem gdy kursor jest w miejscu stałej `Prod` wybieramy (w Emacsie, ale w
-- VS Code na pewno pojawia się coś podobnego) *Go to definition* ...
#check Prod
-- ... dzięki czemu widzimy implementację produktu, której używa Lean (dodałem apostrof do nazwy,
-- żeby nie wywoływać konfliktu {nazw}, inaczej stała `Prod` byłaby podkreślona na czerwono):
structure Prod' (α : Type u) (β : Type v) where
  /--
  Constructs a pair. This is usually written `(x, y)` instead of `Prod.mk x y`.
  -/
  mk ::
  /-- The first element of a pair. -/
  fst : α
  /-- The second element of a pair. -/
  snd : β

-- Dla zwiększenia czytelności odróżniamy pierwszy i drugi człon produktu za pomocą indeksów
-- dolnych, to jest piszemy tym razem `X₁` i `X₂`. A żeby nie dać się zwieść lukrowi składniowemu,
-- który służy często *ukrywaniu* złożoności, piszemy wszystko w notacji przyrostkowej, czyli tak
-- ...
def product_swap (X₁ X₂ : Type) : (Prod X₁ X₂) → (Prod X₂ X₁) := 
  fun object => Prod.mk object.snd object.fst
-- ... zamiast tak:
def product_swap' (X₁ X₂ : Type) : X₁ × X₂ → X₂ × X₁ := 
  fun object => ⟨object.snd, object.fst⟩
```

Widzimy teraz tak wyraźnie, jak tylko się da, patrząc *tylko* na sygnaturę funkcji `product_swap`,
że mamy tu do czynienia z *trzema*, powiązanym w jakiś bardzo "bliski" sposób procesami. Dwa
*podstawowe* procesy to 1. tworzenie z każdej możliwej *pary* termów/obiektów `(X₁ X₂ : Type)`
*produktu* `Prod X₁ X₂` i 2. tworzenie *z tej samej pary* produktu *w odwrotnej kolejności* `Prod X₂
X₁` na poziomie albo w miejscu *typu rezultatu* tworzonych funkcji/strzałek. Trzeci proces, będący
ciałem funkcji, tworzy funkcję/strzałkę z *wyniku* pierwszego procesu (`Prod X₁ X₂`) do *wyniku*
drugiego procesu (`Prod X₂ X₁`). Pełna formalizacja nie tylko *ułatwia zobaczenie* takich rzeczy,
ale również znacząco *utrudnia* ich *ignorowanie*.

Żeby do końca objaśnić, na czym polega technicznie rozumiana *naturalność* tego procesu i co to ma
wspólnego z jego "formalnością" (w przybliżonym już wstępnie znaczeniu) musimy jeszcze wprowadzić
pojęcie *strzałki produktowej* (a bardziej oficjalnie *morfizmu produktowego*). I znowu chyba
najlepszym sposobem zrozumienia tej kategoryjnej konstrukcji będzie przyjrzenie się najpierw jej
wersji teoriomnogościowej, a potem ewentualnie teoriotypowej.

Jeżeli `f₁ : X₁ → Y₁` i `f₂ : X₂ → Y₂` to dowolne dwie *funkcje* (jesteśmy więc teraz w kategorii
`Set`), to istnieje *pojedyncza* funkcja `f : (X₁ × X₂) → (Y₁ × Y₂)`, której działanie polega na
*równoległym* albo *jednoczesnym* albo *niezależnym* działaniu funkcji `f₁` i `f₂` na członach
produktu dziedziny `f`: `f(⟨x₁, x₂⟩) = ⟨f₁(x₁), f₂(x₂)⟩`. Tego rodzaju funkcje, które działają jak
przetwarzanie równoległe, są ważne zarówno w matematyce jak i w programowaniu, i pojawiają się w
najrozmaitszych kontekstach. Wiedząc, jak działa kategoryjny produkt, możemy z łatwością znaleźć
maksymalnie ogólną, kategoryjną wersję tej konstrukcji: 

Jeżeli `f₁ : X₁ → Y₁` i `f₂ : X₂ → Y₂` to dowolne *strzałki* w kategorii, która ma produkty, to
istnieje *strzałka* `f` odpowiadająca parze *strzałek* `f₁ π₁` i `f₂ π₂`, to jest `f = ⟨f₁ π₁, f₂
π₂⟩`.

To *niemal* nic innego, jak znany Ci *produkt strzałek*, jednak to jego przypadek *szczególny*,
zrobiony ze *złożeń* dowolnych dwóch składalnych w ten sposób strzałek *z projekcjami* produktu
źródłowego. Ponieważ między innymi w `Set` takie strzałki działają jak przetwarzanie równoległe i są
blisko związane z produktem obiektów, oznaczamy je jako `f₁ × f₂ := ⟨f₁ π₁, f₂ π₂⟩`. Jak łatwo się
przekonać, te *strzałki produktowe* (a nie tylko *produkty strzałek* \{tylko przypominam\}) działają
w `Set` (i nie tylko tam) zgodnie z oczekiwaniami:

`(f₁ × f₂) ⟨x₁, x₂⟩ = ⟨f₁ π₁, f₂ π₂⟩ ⟨x₁, x₂⟩`  
(rozwijamy definicję strzałki produktowej)

`⟨f₁ π₁, f₂ π₂⟩ ⟨x₁, x₂⟩ = ⟨f₁ π₁ ⟨x₁, x₂⟩, f₂ π₂ ⟨x₁, x₂⟩⟩`  
(bo `⟨f, g⟩ h = ⟨f h, g h⟩`)

`⟨f₁ π₁ ⟨x₁, x₂⟩, f₂ π₂ ⟨x₁, x₂⟩⟩ = ⟨f₁ x₁, f₂ x₂⟩`.  
(stosujemy projekcje)

Szczerze mówiąc, wolałbym nazywać produktem strzałek właśnie *tą* konstrukcję, a strzałki takie jak
`⟨f, g⟩` nazywać strzałkami produktowymi. Wtedy na przykład `X × Y` byłby produktem obiektów, a `f ×
g` produktem strzałek i notacja pasowałaby do nazw. Ale trudno, jest jak jest. Za to chyba nie jest
szczególnie trudno zapamiętać, jak dokładnie ta notacja działa.

To teraz (proszę) uważaj. Mamy kategoryjny produkt *obiektów* i mamy kategoryjne *strzałki*
produktowe. Takie konstrukcje mamy w *każdej* kategorii, w której z każdej pary obiektów można
zrobić ich produkt. Mówimy wtedy, że taka kategoria *ma* (binarne) produkty, w znaczeniu, że ma
wszystkie możliwe produkty. `Set` na przykład ma. Jeżeli teraz *zapomnimy* o wszystkich innych
obiektach i strzałkach w `Set` (zapomniałaś już? mogę poczekać, nigdzie nam się nie spieszy), to
zobaczymy kategorię!

Obiektami tej kategorii są produkty zbiorów, a strzałkami są strzałki produktowe. Jak zawsze, gdy
coś nowego chcemy traktować jako kategorię, sprawdzamy, czy możemy, na szczęście tylko raz: Żeby coś
było kategorią, to coś musi być wyposażone w łączne składanie składalnych strzałek z elementami
neutralnymi przy każdym obiekcie. Zwykle najlepiej zacząć sprawdzanie od strzałek i składania, bo to
jest w kategorii najważniejsze. Składaniem strzałek jest tutaj *komponentowe* składanie *funkcji*:
`(g₁ × g₂) (f₁ × f₂) = (g₁ f₁) × (g₂ f₂)`. W przypadku `Set` i podobnych kategorii można o tych
złożeniach myśleć tak: Złożenie dwóch procesów równoległych albo jednoczesnych `f = f₁ × f₂` i `g =
g₁ × g₂` to taki proces `g f`, który polega na jednoczesnym niezależnym stosowaniu złożeń procesów
składowych `g₁ f₁` i `g₂ f₂`, czyli proces `(g₁ f₁) × (g₂ f₂)`. Piszę cały czas ostrożnie o
*równoległości*, *jednoczesności* i *niezależności*, bo słowa "równoległe" używamy już do nazywania
*dowolnych* par strzałek o tym samym źródle i celu.

Jak łatwo sprawdzić rozwijając definicje i stosując projekcje, `(g₁ × g₂) (f₁ × f₂) ⟨x₁, x₂⟩ = ⟨g₁
f₁ x₂, g₂ f₂ x₂⟩`. Widzisz, jak ten zapis można interpretować jako zwykły zapis teoriomnogościowy,
albo jako zapis w języku teorii kategorii? Wystarczy dowolnie wybrać, czy `⟨x₁, x₂⟩` oznacza parę
uporządkowaną elementów `x₁` i `x₂` (czyli `⟨x₁, x₂⟩ ∈ X₁ × X₂`), czy produkt strzałek `x₁ : Z →
X₁`, `x₂ : Z → X₂` (czyli `⟨x₁, x₂⟩ ∈ Hom(Z, X₁ × X₂)`, albo, mieszając języki teoriomnogościowy i
teoriotypowy `⟨x₁, x₂⟩ : Z → X₁ × X₂`). Elementami neutralnymi tej kategorii są natomiast
(oczywiście?)  endostrzałki o postaci `Id₁ × Id₂`. Tego, że wszystkie pary składalnych strzałek mają
swoje złożenia nie trzeba nawet sprawdzać. Mamy więc pewną kategorię.

Każdą taką kategorię (akurat ta jest zrobiona z obiektów i strzałek w `Set`, albo zrobiona w albo z
kategorii `Set`) można by (według mnie) nazwać kategorią *produktowania* (w danej kategorii), przez
analogię do *oznaczania* jako *funkcjonalności kategorii `Set`*. Gdy, tak jak tutaj, ta konstrukcja
jest zrobiona z kategorii `Set`, można by ją nazwać kategorią *niezależnego oznaczania*. Widzisz,
jak ta nazwa pasuje do *nakładania* funkcjonalności produktu na funkcjonalność oznaczania, albo do w
pewien sposób naturalnego *łączenia* tych dwóch funkcjonalności?

Mamy oto pierwszy przykład kategorii *zbiorów* w pewien sposób *ustrukturyzowanych*. W następnych
rozdziałach poznamy więcej takich kategorii. Obiektami tej naszej (tym bardziej naszej, że celowo
nadaliśmy jej własną nazwę) kategorii nie są *jakiekolwiek* zbiory, tylko zbiory *posiadające ten
sam rodzaj struktury* (tutaj produktowej), a strzałkami tej kategorii nie są *jakiekolwiek* funkcje,
tylko funkcje *spełniające określone wymagania*, pasujące w pewien sposób do wspólnej dla wszystkich
zbiorów struktury. Na przykład, funkcja (anonimowa) `⟨x₁, x₂⟩ ↦ ⟨x₁ + x₂, x₂⟩`, gdzie `X₁ = X₂ = ℤ`,
też jest funkcją z produktu (`ℤ₁ × ℤ₂`) do (tego samego) produktu, ale ta funkcja *nie* działa
*niezależnie* na swoich "kanałach", a więc nie jest strzałką kategorii jednoczesnego niezależnego
oznaczania.

Jeszcze raz od początku: Czym są zbiory? Luźnymi, to jest pozbawionymi jakiejkolwiek *wspólnej dla
wszystkich zbiorów* struktury (takiej jak struktura produktowa) kolekcjami elementów. A czym są
elementy? Arbitralnymi oznaczeniami. A czym są funkcje? Arbiralnymi przyporządkowaniami każdemu
oznaczeniu należącemu do "alfabetu" dziedziny tego, co oznacza, czyli w pewien sposób rozumianymi,
potencjalnie wielorakimi (gdy "alfabet" dziedziny ma więcej niż jeden "symbol"),
nieustrukturyzowanymi oznaczeniami. Czy widzisz już, że z perspektywy funkcjonalnej, czyli takiej
jakby *abstrakcyjnie pragmatycznej* albo *celowościowej*, *centralnym* pojęciem teorii mnogości
*nie* jest pojęcie zbioru, tylko pojęcie *funkcji*, a pojęcia zbioru i elementu służą (w praktyce)
*tylko* do tego, żeby jawnie, lub - gdy mówimy, że *coś jest takim a takim zbiorem* - niejawnie
można było zarazem wygodnie i konsekwentnie mówić o arbitralnych *funkcjach*? To może zainteresuje
Cię w tym kontekście fakt, że aksjomat o istnieniu funkcji został dodany do teorii Zermelo-Fraenkla
relatywnie późno, przez Fraenkla, i to było *wszystko*, co Fraenkel dodał do aksjomatów tej
teorii. W dodatku nazwisko Fraenkel zaczyna się na literę f, jak w słowie funkcja! Przypadek? Tak
sądzę.

Po raz kolejny przyglądamy się uważnie tej pozornie całkiem zwyczajnej, oczywistej przemienności ...

`(x, y) ↦ (y, x)`

... i widzimy, że to przekształcenie działa niezależnie od elementów, albo tak jakby wokół
nich. Gdybyśmy powiedzieli, że to przekształcenie polega na określonym *przestawieniu nawiasów*,
mielibyśmy rację, bo taki opis byłby poprawny na poziomie *metajęzyka*, ale to *nie* byłby poprawny
opis *matematycznej*, to jest formalno-funkcjonalnej istoty tego procesu. Funkcjonalnie, ten proces
polega na tym, że *produktowanie działa niezależnie od* albo *nie wchodzi w interakcję z* (w
przypadku kategorii `Set`) *oznaczaniem*. Nie masz wrażenia, że ten sposób mówienia o kategoriach i
łączących je procesach w języku naturalnym jest trafny? Pytam o to, bo wymyśliłem go pisząc jeden z
poprzednich rozdziałów.

Nie możemy jeszcze podać pełnej formalnej definicji tego, co mam nadzieję oboje możemy tu rozpoznać
jako pewne ogólne zjawisko albo wzorzec, ale możemy już w tym momencie całkiem nieźle objaśnić jego
*sens*. Dla każdego *elementarnego oznaczenia pary uporządkowanej*, czyli dla każdego elementu `⟨x₁,
x₂⟩ ∈ X₁ × X₂`, taki proces (uwaga na odwrócenie kolejności) ...

`⟨x₁, x₂⟩ ↦ ⟨x₂, x₁⟩ ↦ ⟨f₂ x₂, f₁ x₁⟩`

... daje ten sam wynik, co taki proces:

`⟨x₁, x₂⟩ ↦ ⟨f₁ x₁, f₂ x₂⟩ ↦ ⟨f₂ x₂, f₁ x₁⟩`

W ten właśnie sposób możemy wyrazić półformalnie fakt, że *operacja tworzenia produktu* w kategorii
zbiorów i funkcji *działa* jakby *wokół funkcjonalności tej kategorii*, bo *nie "dotyka"
oznaczania*, albo możemy powiedzieć, że ta operacja *"przeplata się" z oznaczaniem w sposób
"nieinteraktywny"* albo taki jakby liniowy. To ostatnie skojarzenie może się nasuwać, gdy
rozpatrzymy na przykład takie dwa, mające różną liczbę argumentów [*przekształcenia
liniowe*](https://pl.wikipedia.org/wiki/Przekszta%C5%82cenie_liniowe) jak mnożenie pojedynczej
liczby przez `2` i dodawanie dwóch liczb, ponieważ również w przypadku tych dwóch wyraźnie różnych
przekształceń kolejność nie ma znaczenia: `2 × (x + y) = 2 × x + 2 × y`.

*Potrójne* przekształcenie, na które składają się dwa procesy "produktowania", działające na
wszystkich możliwych parach obiektów (`⟨X₁, X₂⟩`) ...

1. `⟨X₁, X₂⟩ ↦ X₁ × X₂`

2. `⟨X₁, X₂⟩ ↦ X₂ × X₁`

... i proces, który dla każdego rezultatu pierwszego z tych dwóch przekształceń dostarcza
"wymijający funkcjonalność kategorii" izomorfizm z wyniku pierwszego przekształcenia do wyniku
drugiego (powtarzam się tu, żeby było chociaż trochę łatwiej), ...

`⟨x₁, x₂⟩ ↦ ⟨x₂, x₁⟩ ↦ ⟨f₂ x₂, f₁ x₁⟩`

`⟨x₁, x₂⟩ ↦ ⟨f₁ x₁, f₂ x₂⟩ ↦ ⟨f₂ x₂, f₁ x₁⟩`

... to przykład *naturalnej równoważności*. A to przeplatanie się "produktowania" i "oznaczania",
które widać wyżej, to, jak dowiesz się później, przykład tak zwanego [*kwadratu
naturalności*](https://pl.wikipedia.org/wiki/Czarny_kwadrat_na_bia%C5%82ym_tle). Byłoby nam znacznie
trudniej wejść w ten kwadrat, a może nawet byłoby to niemożliwe, gdybyśmy wcześniej nie zrozumieli,
że w produktowaniu, jak właściwie we wszystkim, co matematyczne, *najważniejsze są strzałki*.

Żeby sformalizować pojęcie naturalnej równoważności będziemy potrzebowali formalnej definicji
*transformacji naturalnej*, której naturalna *równoważność* jest przypadkiem szczególnym. Już teraz
mogę jednak zasygnalizować, że transformacja naturalna to taka naturalna równoważność, w której
strzałki (w kategorii docelowej) nie muszą być izomorfizmami.

*Chcemy* zacząć lepiej rozumieć, czym jest naturalna transformacja, bo bez tego prawdopodobnie nie
bylibyśmy w stanie zacząć rozumieć ani [*lematu Yonedy*](https://en.wikipedia.org/wiki/Yoneda_lemma)
ani *funktorów sprzężonych*. *Chcemy* zacząć rozumieć lemat Yonedy, bo ten lemat pokazuje pewną
głęboką prawdę na temat matematyki i - nie tylko moim zdaniem - poznania w ogóle. Ta głęboka prawda
okaże się również kluczowa, kiedy będziemy próbowali *wywrócić na drugą stronę* **całą**
*psychologię*, patrząc na zachowania od strony środowiska rozumianego jako konstelacja wielorako
powiązanych zadań. Nie mówiąc już o tym, jakiej nabierzemy dzięki temu wprawy w skakaniu po
rozmaicie przeplatających się rozgałęzieniach wieloaspektowej abstrakcji. 

A pojęcie funktora sprzężonego *chcemy* zrozumieć między innymi dlatego, że tego pojęcia *nie
byłoby* bez języka teorii kategorii. Jak się (mam nadzieję) przekonamy, gdy przyjdzie na to pora, te
funktory, a tak naprawdę pary funktorów (sprzężonych), pozwalają zobaczyć wiele różnych ważnych
rzeczy, takich jak choćby "istota" dużego i małego kwantyfikatora. Mówi "się" nawet, że pojęcie
transformacji naturalnej mogłoby być wymyślone głównie po to, żeby łapać za rogi bliźniacze
jednorożce funktorów sprzężonych (no dobrze, może akurat *tak* "się" nie mówi).

Żeby zdefiniować transformację naturalną, będziemy potrzebowali formalnej definicji *funktora*. Jak
zobaczymy, gdy definicja tego pojęcia będzie już mam nadzieję dobrze nam znana z widzenia, funktor
to strzałka w kategorii, której punktami są *kategorie*. Żeby zacząć rozumieć, co *to* może znaczyć,
w następnym rozdziale zajmiemy się formalnymi i psychologicznymi aspektami pewnej algebry
abstrakcyjnej, którą następnie uogólnimy, wymieniając zwykłe działania binarne na działania wybredne
o takich samych samych własnościach. Dzięki temu nauczymy się między innymi, na czym (między innymi)
polega *pytanie o drogę* i *podążanie drogą zgodnie z instrukcjami*, a także jaki te dwa
uniwersalnie ważne rodzaje czynności mają związek z ogólnie rozumianym *myśleniem*, *dialogiem* i
*programowaniem*.

### Przypisy

[^1]: Albo [*esencją, w której widać dno*](https://sjp.pwn.pl/slowniki/sedno.html).

[^2]: Brakowało Ci tych wszystich ę w tę książkach i tym podobnych? No to proszę, ę.
