<!-- -*- coding: utf-8 -*- -->

<br>

Jeżeli drzewo marnieje choćby w najgorszej glebie, to tylko dlatego, że nie
dość głęboko zapuszcza korzenie. Cała ziemia jest jego.

Fryderyk Hebbel, *Dzienniki*

<br>

# [Sprzątając pod lasem w](https://www.poetryfoundation.org/poems/42891/stopping-by-woods-on-a-snowy-evening) śnieżny [wieczór](https://pl.wikipedia.org/wiki/Przystaj%C4%85c_pod_lasem_w_%C5%9Bnie%C5%BCny_wiecz%C3%B3r)

My, ludzie, postrzegamy świat w kategoriach hierarchii. Coś może być wyżej lub niżej niż coś innego,
albo może być większe lub mniejsze, cięższe lub lżejsze, albo, w jakimś sensie, wcześniejsze lub
późniejsze, słabsze lub silniejsze, bardziej lub mniej: intensywne, śmieszne, absurdalne, bliskie,
abstrakcyjne, złożone, wie.lo.as.pek.to.we, irytujące, względne, uciążliwe, wstrętne, pociągające,
piękne, uzasadnione, wątpliwe, oczywiste, tajemnicze, kosmate, zmysłowe, perwersyjne, wciągające,
lub drętwe.

A każda hierarchia to pewna relacja porządku.

W psychologii często kluczowe znaczenie ma to, czy jakaś reakcja jest pod jakimś względem mniej lub
bardziej spóźniona, intensywna, lub częsta i to też są relacje porządku. Często ważne jest i to, czy
jakiś stan, taki jak na przykład chwilowa głupota, lub jakaś cecha, taka jak głupota permanentna, są
mniej lub bardziej nasilone.

Istnieje jednak pewien *typ* relacji porządku, który ma dla psychologii znaczenie szczególne. Co
więcej, ten porządek ma szczególny charakter również z perspektywy *matematycznej* i
*filozoficznej*. Z powodów, które za chwilę staną się mam nadzieję jasne, można nawet powiedzieć, że
ten szczególny pod względem struktury formalnej i znaczenia w życiu codziennym typ porządku jest
*centralnym pojęciem* psychologii.

Chodzi o coś najzwyczajniejszego w świecie zwierząt.

## Poprawność jest centralnym porządkiem psychologii[^4]

Zawsze, gdy możemy mówić o poprawności, mamy do czynienia ze zbiorem dwuelementowym i relacją
porządku polegającą na tym, że jeden z elementów tego zbioru jest "mniejszy" niż drugi.

<hr>

Gdy zbiór jest *pusty* (a więc wtedy właściwie nie jakiś, bo zbiór pusty jest unikalny; dlatego
\{*od momentu, w którym udowodnimy tą unikalność*\} możemy bez zastrzeżeń mówić po angielsku *the
empty set*, zamiast *an empty set*, a po polsku *ten* zbiór pusty), można na nim zdefiniować tylko
*jeden* porządek, ponieważ na zbiorze pustym można zdefiniować tylko jedną relację w ogóle (a więc
też tylko jeden predykat):

```lean
def Pred   α   := α → Prop

def Binrel α β := α → β → Prop

def Empty_pred : Pred   Empty       := fun a => a.elim

def Empty_rel  : Binrel Empty Empty := fun a => a.elim
```

Uprościłem zapis, zakładając, że już wiesz, czego Lean się w tym przypadku automatycznie domyśla. Na
początek dodajemy trochę lukru, który ma na celu ujawnienie "intencji kodu". Skoro wszystko można
rozumieć na wiele sposobów, to funkcje z arbitralnego typu lub typów do `Prop` też można rozumieć na
wiele sposobów. Tutaj sygnalizujemy, że naszym celem jest traktowanie tych funkcji jako odpowiednio
predykatów i relacji binarnych. Dzięki temu widzimy też od razu, że predykaty i relacje, nie tylko
binarne - bo przecież naturalne uogólnienie na dowolną arność niemal tutaj widać - są właściwie tym
samym, a nazywamy te dwa rodzaje obiektów inaczej dlatego, że chcemy czasem coś innego
zaakcentować. Wprowadzając pozornie nieistotne rozróżnienie na predykaty i relacje możemy zawęzić
uwagę, zarówno swoją jak i odbiorców, do predykatów (i jednocześnie relacji) o określonej arności i
poddać pewnej kontroli narzucające się skojarzenia.

Zdefiniowana właśnie relacja spełnia wymagania, jakie stawiamy relacjom porządku (o czym później),
pusto. To zatem *porządek pusty*, który ma znaczenie *czysto teoretyczne*.

Osobliwość typu `Empty` widać wyraźnie w strukturze ciał dwóch ostatnich definicji. Ponieważ
funkcja, która wymaga termu typu `Empty`, nie może być nigdy wywołana z definicji, aby spełnić
warunek poprawności definicji takiej funkcji, wystarczy skorzystać z reguły eliminacji dla tego
typu. W szczególności, nie musimy nawet konstruować drugiej, wewnętrznej funkcji tworząc term typu
`Binrel Empty Empty`, czyli term typu `Empty → Empty → Prop`, bo ta reguła eliminacji pozwala od
razu "spełnić oczekiwanie" stworzenia termu *dowolnego* typu, w tym również typu `Empty → Prop`, za
pomocą czegoś w rodzaju - w tym wypadku akceptowalnej - *pustej obietnicy*, albo obietnicy *z
konieczności* bez pokrycia.

Poczucie dezorientacji, które może wywołać takie zastosowanie typu `Empty`, `False`, czy naszego
`Absurd`, wynika dokładnie stąd, że to są tylko - i zarazem *aż* - *czyste narzędzia
rozumowania*. Przypominają pod tym względem te bardziej abstrakcyjne rodzaje identyczności, w tym
zera i inne, w takim czy innym znaczeniu puste konstrukcje. Inaczej mówiąc, te typy *są sposobem ich
użycia*; dlatego są takie "puste w środku".

A teraz nadal o tym samym, ale wychodząc z innego punktu: Teoria mnogości może się wydawać nawet
współczesnym matematykom nudna i mnie też do niedawna taka właśnie się często zdawała. Na przykład,
kategoryści piszą o niej czasem, że to tylko jeden z wielu możliwych języków podstawowych matematyki
i tylko jedna z nieskończenie wielu możliwych kategorii. Ale teoria mnogości nie jest tylko jakąś
tam kategorią, ponieważ jej centralne pojęcie, to jest pojęcie funkcji, rozumianej jako samo
przyporządkowanie arbitralnych wartości abstrakcyjnym elementom, odpowiada *najbardziej elementarnej
funkcji języka* - funkcji *oznaczania*, inaczej *nazywania*. Teoria mnogości jest więc po prostu
elementarną teorią samego oznaczania.

Z tej perspektywy zadziwiające jest to, że chociaż teoria kategorii pozwala wyraźnie zobaczyć, że
strzałki są ważniejsze niż obiekty, to jednak w każdym znanym mi podręczniku do teorii kategorii
autorzy nadal piszą o kategoriach tak, jakby akcentowanie strzałek było co najwyżej z pewnych
względów bardziej użytecznym punktem widzenia. Widać to szczególnie w języku naturalnym, którym Ci
autorzy się posługują tłumacząc, o co w tym chodzi. Z powodów historycznych i chyba też z głębszych
powodów psychologicznych matematycy są wciąż moim zdaniem zbyt przywiązani do zwykłych
*rzeczowników*, a do mówienia o jakichkolwiek strukturach jako o kategoriach w sposób oczywisty
zwykle znacznie bardziej nadają się *rzeczowniki odczasownikowe*, takie jak "oznaczanie".

Struktury, które opisujemy za pomocą zwykłych rzeczowników, takie jak zbiory i należące do nich
elementy, są *niczym* bez *sposobu, w jaki ich używamy*, bo te struktury są tylko - i aż - częściami
pewnego *języka*, a język jest naszym *narzędziem*. To dzięki językowi panujemy nad światem i nad
sobą w takim stopniu, w jakim panujemy i to dzięki językowi możemy się *wzajemnie rozumieć* i możemy
do pewnego stopnia rozumieć *sami siebie*. Gdy tylko wyprowadzimy ostateczne wnioski z obserwacji,
że to strzałki są w kategoriach najważniejsze, staje się natychmiast jasne, że teoriomnogościowe
elementy są tylko oznaczeniami, które dopiero dzięki funkcjom mogą cokolwiek oznaczać.

Dlatego moim zdaniem tradycyjne teoriomnogościowe implementacje pojęć kategoryjnych mają status
implementacji w głębokim sensie *kanonicznych*. I tak będę je odtąd czasami traktował, to jest jako
ważne *źródła sensu* jednych z najbardziej abstrakcyjnych i zarazem najbardziej uniwersalnie
użytecznych pojęć jakimi dysponujemy, to jest kategoryjnych
[*granic*](https://en.wikipedia.org/wiki/Limit_(category_theory)), o których opowiem Ci więcej w
odpowiednim czasie.

<hr>

Gdy zbiór jest (jakimkolwiek) *singletonem*, również można na nim zdefiniować tylko jeden porządek,
który co prawda nie jest wtedy pusty, ale też jest trywialny. Tą trywialność od razu widać z
perspektywy kategoryjnej, bo porządek na singletonie rozumiany jako cienka kategoria sprowadza się
do pojedynczej identyczności. A więc porządek na singletonie jest tym samym, co *obiekt bez
właściwości*.

Gdy jednak elementy są *dwa*, możliwych porządków jest więcej. *Dwa* z tych porządków, będące
izomorfami, można interpretować zarówno jako porządek *wartości logicznych* - `{zdanie fałszywe <
zdanie prawdziwe}` - jak i jako porządek *poprawności* - `{działanie błędne < działanie
poprawne}`. W dodatku ten głęboki związek między *celowością* i *logiką* nie jest wcale przypadkowy.

Zawsze, gdy możemy mówić o reakcjach, odpowiedziach, czynnościach, zachowaniach, albo działaniach
poprawnych, możemy też mówić o reakcjach, odpowiedziach, czynnościach, zachowaniach, albo
działaniach błędnych i vice versa. To są *dokładnie* te same sytuacje, w których możemy też mówić o
błędnym lub poprawnym wykonaniu jakiegoś *zadania*. Wykonanie błędne traktujemy wtedy jako w pewnym
sensie mniejsze albo *gorsze* niż wykonanie poprawne, tak jak fałsz traktujemy jako coś mniejszego
albo gorszego od prawdy, brzydotę jako coś gorszego od piękna, a zło jako coś gorszego od dobra.

Formalnie, wszystkie te struktury są jedną i tą samą strukturą porządku na zbiorze dwuelementowym,
który to porządek, postrzegany jak kategoria, jest dokładnie pojedynczą nieidentycznościową, a więc
już nietrywialną, *strzałką*.

Gdy nie ma nic, nic nie może się wydarzyć i ani nie ma o czym mówić, ani nie ma Nikogo, kto mógłby o
czymś mówić. Gdy jest tylko jedno coś i nic więcej nie ma, wtedy wszystko, co jest, jest tym jednym
czymś i nie ma żadnej nietrywialnej struktury; a więc również nie ma o czym mówić, ani nie ma
Nikogo, kto mógłby o czymś mówić. I wtedy *też* jest tak, jakby nic nie było. Obiekt początkowy i
obiekt końcowy to *jedno* i to samo pojęcie postrzegane z dwóch *dualnych* perspektyw. Nie każda
kategoria ma jednak początek i koniec. Wszędzie tam, gdzie istnieją *co najmniej dwa* obiekty,
pojawia się *różnica*. A gdy *jedynymi dwoma* obiektami są obiekty początkowy i końcowy, istnieje
dokładnie *jedna* nietrywialna strzałka. W matematyce, tak jak w psychologii, wszystko sprowadza się
ostatecznie do tej jednej, *definiującej kierunek* strzałki.

Albo mniej ogólnie: Powód, dla którego pojęcie poprawności należy moim zdaniem traktować jako
centralne (ale nie jedyne takie) pojęcie psychologii jest, gdy się go już odkryje, zawstydzająco
prosty. *Zachowanie* (albo *czynność*) to inaczej *działanie celowe*. Pojęcie celu jest zaś ściśle
związane z pojęciami osiągnięcia i *nie*osiągnięcia celu. A ponieważ cel i zadanie to jedno i to
samo, zamiast o osiągnięciu celu możemy równie dobrze mówić o poprawnym lub błędnym wykonaniu
zadania. Kwestię *stopniowalnego* i *jakościowo zróżnicowanego* osiągania celu i wykonywania zadania
podejmiemy innym razem.

Trzeba jednak pamiętać, że pojęcia niewykonania zadania i nieosiągnięcia celu mają *dwa* znaczenia:
Cel może być nieosiągnięty i zadanie może być niewykonane dlatego, że celu *nie udało się* osiągnąć
i zadania *nie udało się* wykonać, albo dlatego, że *nie było próby* osiągnięcia tego celu albo
wykonania tego zadania. A mówiąc bardziej abstrakcyjnie (i posługując się częściowo językiem
technicznym wnioskowania przyczynowego), nie było *interwencji*, której *skutki* podlegałyby ocenie
(właśnie tego pojęcia nie ma w tym języku) pod względem wykonania tego zadania lub osiągnięcia tego
celu. Analogicznie, cel może być *w pewnym sensie* osiągnięty i zadanie może być *w pewnym sensie*
wykonane nie dlatego, że została podjęta jakaś próba osiągnięcia tego celu i wykonania tego zadania,
tylko dlatego, że *nie ma nic do zrobienia*, bo cel jest w danej sytuacji *zrealizowany* i zadanie
jest *nieaktualne*. Albo, mówiąc inaczej, ale *celowo* tak - cel i zadanie mogą być *spełnione
pusto*.

Zastanawiasz się może, po czym w takim razie poznajemy, że coś jest próbą albo interwencją? To moim
zdaniem doskonałe pytanie okazuje się zaskakująco głębokie. Dlatego w tym momencie powiem tylko
tyle, że w pewnym sensie *po niczym*.

Jeżeli tylko nieznacznie uogólnimy pojęcie *ruchu*, będzie natychmiast jasne, że *każdy* akt
zachowania jest, między innymi, procesem motorycznym, tylko niektóre z nich, a konkretnie zachowania
*mentalne*, polegają na ruchu (nie mylić z *poruszaniem się*, które już jest zachowaniem) głównie
*wewnątrz ciała*. Jeżeli to uogólnienie Ci nie odpowiada, to zwróć proszę uwagę, że żadne zdarzenie
mentalne nie może zajść bez zmiany fizycznego stanu ciała, a poza tym to uogólnienie nie jest
wewnętrznie sprzeczne, wobec czego, jak każdy *wybór pojęciowy*, podlega *naszej* (muszę się tu
powołać na *hipotetyczną wspólną normę*) ocenie *tylko* ze względu na to, do czego się przydaje, ...

... a *warto* dokonać tego moim zdaniem naturalnego uogólnienia, bo dzięki niemu można zobaczyć
wyraźniej coś, co bardzo długo umykało mojej uwadze. Pouczający może być też powód, dla którego tak
długo nie udawało mi się tego dostrzec. Byłem mianowicie od dawna przekonany, że istnieje jakaś
fundamentalna różnica między *zachowaniami zwierząt* z jednej strony, a *sposodem działania
urządzeń* i wszelkiego rodzaju *narzędzi* czy *mechanizmów* z drugiej. Wydawało mi się na przykład,
że ta różnica może polegać na *wyuczalności* zachowań, z której wynika ich wyjątkowa adaptacyjna
plastyczność i której nie widać w typowych urządzeniach, narzędziach, czy wszelkiego rodzaju
zwykłych mechanizmach.

Proszę, nie zrozum mnie źle. Nie uważam, że zwierzęta są urządzeniami i *niczym więcej*. Na pewno
nie *dla nas*, bo *współczujemy* zwierzętom. Współczujemy im nie dlatego, że postrzegamy je jako
byty *autonomiczne*, bo to jest warunek oceny *moralnej*; współczujemy im dlatego, że zwierzęta w
widoczny sposób *cierpią*. Najbardziej tym, które należą do tego samego gatunku, ale zdecydowanie
[nie tylko im](https://pl.wikipedia.org/wiki/Karuna). Z roślinami, owadami, grzybami, mikrobami i
niektórymi innymi formami życia bywa pod tym względem, jak wiadomo, bardzo różnie.

Natomiast nie bardzo współczujemy urządzeniom. A kiedy czasem do pewnego stopnia współczujemy
niektórym urządzeniom, zwłaszcza tym, do których jesteśmy w jakiś sposób *przywiązani*, mamy do
takich reakcji pewien dystans, którego nie mamy w stosunku do własnego współczucia wobec
zwierząt. Zwierzęta zdecydowanie *nie* są więc (dla nas) po prostu urządzeniami, bo z naszej
ludzkiej i jednocześnie *wspólnej* (to nie to samo) perspektywy, zwierzęta *zasługują* na
współczucie. I szacunek.

Ale **zachowanie**, ten centralny przedmiot zainteresowania psychologii, to dokładnie *działanie
celowe*, albo - po dokonaniu uogólnienia już równoważnie - *celowy ruch*; nic mniej i nic
*więcej*. Własność *wyuczalności* przysługuje (w szczególny sposób, o czym później) pewnym celowym
ruchom, a dokładniej pewnym *sekwencjom ruchów*, co sprawia, że te ruchy są dla nas automatycznie
interesujące, a często wręcz przykuwają naszą uwagę i automatycznie widzimy w nich coś w rodzaju
autonomii (pamiętasz tamtą mysz?). Ale celowość występuje w sposób oczywisty również w nie uczących
się narzędziach, urządzeniach, mechanizmach i innych artefaktach, takich jak dzieła sztuki.

W sali, w której spędziłem kilka pierwszych lat szkoły podstawowej, na ścianie wisiał napis
"Matematyka jest królową nauk". Wtedy nie wiedziałem, co o tym myśleć, ale byłem mały i jeszcze
głupszy niż teraz. A teraz myślę o tym tak:

Matematyka to dokładnie celowe posługiwanie dowolnymi jednoznacznymi regułami językowymi, które
pozwalają rozstrzygać mechanicznie, jakie sekwencje symboli są poprawne, a jakie nie. Teorie naukowe
są relatywnie dobrze ustrukturyzowanymi konstrukcjami pojęciowymi, które istnieją tylko dzięki temu,
że istnieje język. Matematyka jest tą szczególną dyscypliną nauki, która zajmuje się w pewien sposób
językami wszystkich nauk, w tym również swoimi własnymi językami.

Jeżeli matematyka jest Królową nauk, to fizyka, która jest dokładnie celowym stosowaniem języków
matematycznych do kontroli wszelkich zdarzeń, jest ich Królem. Można więc powiedzieć, że ta
Wspaniała Dwójka (dziewczyn!) rodzi najwięcej zastosowań niemal *z definicji*. Nasza Płodna Para ma
dokładnie jednego rodzica, Matkę psychologię, która pilnuje, żeby Dzieci się zachowywały. A Ojciec,
cóż, albo się ulotnił, albo nigdy go nie było i jako Ten Nieistniejący spełnił swój rodzicielski
obowiązek pusto.

<br>

**Sugestia**:

Myślisz, że mi odbiło?

Też tak czasem sądzę.

Lecz jeśli tak,

to powiedz mi, proszę,

gdzie "ja" *dokładnie* błądzę.

<br>

W szczególności, gdzie w jakiejkolwiek innej dyscyplinie nauki znajdziemy jako *centralne* pojęcie
*działania celowego*? Struktury badane przez matematyków są ostatecznie *arbitralne*. Niearbitralne
są tylko *powody*, dla których *matematycy* te struktury badają, w dodatku z definicji, bo badanie
czegoś jest pewnego rodzaju zachowaniem. A Wszechświat badany przez fizyków jest *obcy*.

Albo tak: Jak doskonale ujął to mój najważniejszy przyjaciel, Tomek Grzegorek[^1]:

*Psychologia nigdy nie cierpiała na niedobór danych*.

Każda dyscyplina naukowa *jako taka* jest *wytworem* i zarazem *narzędziem ludzi*. Nauka jako taka
jest rezultatem pewnego rodzaju zachowań i każdy przypadek zastosowania nauk jako taki jest pewnym
zachowaniem. Wiem, że wspominałem na początku, żeby nie przesadzać z ambicjami, a to wszystko może
brzmieć tak, jakbym sam z nimi przesadzał w stopniu maksymalnym (o, porządek!). Ale to nie są moje
[*ambicje*](https://youtu.be/ARcEpefk3Oo?si=MwHF-eLet2lj9SNZ).

To są *uzasadnione wnioski*.

Wróćmy już do strzałki.

## ∘ ⟶ ⊙

Pojedyncza strzałka jako kategoria, czyli `I → T`, gdzie `I` to z konieczności obiekt początkowy
(*initial*), a `T` to z konieczności obiekt końcowy (*terminal*), jest więc, między innymi, a może
nawet przede wszystkim, Oceną. *Źródło* tej strzałki można rozumieć jako czystą abstrakcję: zbioru
pustego, typów `False` i `Empty`, i w ogóle wszelkich struktur będących Bezcielesnymi Sposobami. Jej
*cel* można postrzegać jako Atom albo Element Bez Właściwości, a więc materię jako taką (niezależnie
od [typu "substancji"](https://plato.stanford.edu/entries/substance/)). A skoro to są obiekty
początkowy i końcowy dokładnie dlatego, że pierwszy emituje dokładnie jedną strzałkę do wszystkich
obiektów, a drugi przyjmuje dokładnie jedną strzałkę od wszystkich obiektów, to tym, co *czyni* je w
tej Elementarnej - choć, jak zobaczymy później, nie będącej końcową - kategorii początkiem i końcem,
jest Celowość Strzałki o typie:

```lean
Skierowanie : Celowości → Materię
```

Albo: Kierunek (jako taki), który jest możliwy dzięki istnieniu (jako takiej) Różnicy.

Wydaje mi się nawet, że warto przyjąć, chociaż na próbę, ogólną i *funkcjonalną* (sic!) definicję
Materii, a może lepiej Substancji, jako *tego, na co można skierować* - *niekoniecznie czyjąś* -
*uwagę*. Jak każde tego rodzaju początkowo dziwne, ale w jakiś sposób akceptowalne uogólnienie,
warto je przyjąć choćby dlatego, żeby mieć dzięki temu *szansę* zobaczenia, niedostrzegalnych w inny
sposób, głębokich analogii.

Teoria kategorii to abstrakcyjna algebra składania teoriomnogościowych funkcji, a więc - można teraz
powiedzieć, że *dosłownie* - *algebra elementarnego oznaczania*. Najprostsza nietrywialna kategoria,
...

`I → T`

... gdy popatrzymy na nią z perspektywy jej kanonicznej elementarnej implementacji, ...

`∅ → {⬝}`

... a na tą implementację popatrzymy z kolei jako na funkcję z typu albo zbioru -
`Empty`/`∅`/`False` - *bez zawartości* do typu albo zbioru odpowiadającego *obiektowi jako takiemu*
- `Unit`/`{⬝}`/`True` - albo, w przyjętej na próbę interpretacji, *substancji jako takiej*, okazuje
  się być *oznaczaniem bez oznaczającego*. 
  
To więc *uwaga*, ale uwaga *niczyja*, albo *patrzenie jako takie*, albo *subiektywność jako taka*. I
to jest też *ocena*, w najbardziej podstawowym znaczeniu, bo *subiektywnie ważne może być tylko to,
na co zwrócona jest uwaga*, ponieważ *nie da się chcieć albo nie chcieć tego, czego nie można w
jakiś sposób* **wskazać**.
  
Uwierz mi, wiem aż za dobrze, jak dziwnie to wszystko początkowo brzmi, ale jeśli nie możesz się z
tym pogodzić, to powiedz, właściwie *czym innym mogłaby być* **abstrakcyjna strzałka**?

<hr>

Zauważyłaś, że *nic* w świecie nie ma *kierunku* jako *własności własnej*? Nawet ta strzałka jest
skierowana w określoną stronę *tylko* dlatego, że *wybraliśmy* kierunek.

<br>

A czas? Czas płynie przecież w jedną stronę.

W którą?

Każda chwila mija i oddala się coraz bardziej w przeszłość.

I to jest *jedyny* kierunek, w którym płynie Twoim zdaniem czas?

No tak.

Zacznijmy może od tego, że mówiąc o oddalaniu się korzystamy jednocześnie co najmniej z *dwóch*
bardziej abstrakcyjnych pojęć, poza pojęciem czasu - z pojęcia porządku i z pojęcia
[*odległości*](https://pl.wikipedia.org/wiki/Przestrze%C5%84_metryczna). Ponadto, aby czas płynął,
jak mówisz, wstecz, Ty musisz płynąć w czasie do przodu i *to* już jest relacja *logiczna*, a nie na
przykład *przyczynowa*. Nie wydaje Ci się, że dobrze jest szybko zauważać takie subtelności
pojęciowe? Wracając zaś do tego, co wydaje mi się główną intencją Twojego pytania (jeżeli Cię źle
zrozumiałem, to popraw mnie proszę), czemu nie można o tym myśleć jako o *spadaniu* w czasie? Wtedy
czas płynąłby w górę, a my spadalibyśmy (w nim?) w dół. Pamiętasz dualność relacji `<` i `>`?

...

Ok, nigdzie nam się nie spieszy. Słyszałaś może o liczbach urojonych? `i² = -1` i `(-i)² = ((-1) *
i)² = (-1)² * i² = 1 * i² = i² = -1`, więc trzeba *wybrać*, które $i$, to jest `i` czy `-i`, jest
`i`, bo te dwa $i$ są funkcjonalnie równie dobrymi kandydatami, a nie mogą być tą samą liczbą, nawet
jeśli "tylko" urojoną[^2].

Ale czy zachowania albo ruchy celowe, takie jak wszelkie wybory, nie mają kierunku jako własnej
(ang. [*intrinsic*](https://en.wiktionary.org/wiki/intrinsic)) własności? 

Mają kierunek, ale nie jako własność własną, bo mają go tylko w pewnym sensie i zależnie od
kontekstu, bo kierunek jest zawsze *nieunikalny*, a jest taki z konieczności, bo, tak jak ta wyżej
strzałka, kierunek jest *punktem widzenia*. O czym pomówimy jeszcze kiedy indziej. Nawiasem mówiąc,
nawet taki Einstein już dawno to załapał, tyle, że *mniej ogólnie*. Można o tym myśleć też i tak:
Nad każdym naszym ruchem jakby unosi się (jako mnogość możliwych punktów widzenia) nieskończenie
złożona przestrzeń najróżniejszych celów (które zawsze można traktować jako pewne relacje porządku)
i w każdym momencie każdego ruchu i dla każdego celu istnieje miara stopnia, w jakim aktualne
położenie i struktura wewnętrzna naszego ciała realizuje albo spełnia ten cel.

No nie wiem, może, ale z tym odwracaniem relacji mniejsze niż, to jest tylko taki sposób mówienia, a
co się stało, to się nie odstanie, a co ma się stać, to się dopiero stanie.

Otóż to. Twoje, a raczej, nie oszukujmy się, nasze przywiązanie do postrzegania strzałki czasu jako
czegoś, co ma niearbitralny kierunek, wynika całkowicie z naszej *postawy* wobec *skutków* upływu
czasu. Generalnie wolimy mieć wybór, a w każdym razie wolimy mieć poczucie, że go mamy, a wobec
przeszłości nie możemy tego czuć. Skąd wiesz, jak postrzegałabyś kierunek czasu, gdybyś uświadamiała
sobie szczegóły przebiegu zdarzeń tym bardziej, im bardziej *oddalałyby* się w przeszłość? Twoje
życie trwałoby wtedy krótko, bo działająca w ten sposób pamięć byłaby niemal bezużyteczna, ale może
czułabyś też, że wraz z gwałtownym umieraniem stajesz się *coraz mniej sobą* i *spadasz w nicość
śmierci*, jakbyś patrzyła w oddalające się szybko okno studni życia, które coraz bardziej staje się
tylko punktem ... światła w tunelu. Zresztą czas można *sensownie* uporządkować na nieskończenie
wiele, również nieizomorficznych sposobów. Na przykład, można uporządkować nieskończony zbiór
punktów czasowych ze względu na stopień zagęszczenia materii we Wszechświecie, albo można obrać
jakiś punkt zerowy na skali czasu i wtedy czas co prawda nie będzie *płynął* w dwie strony, ale
będzie traktowany tak, jakby miał jednocześnie dwa *kierunki*. Ten ryży meksykanin Ludwik mówi o tym
bardzo, hm, jasno i tłumaczy to [krok po
kroku](https://www.imdb.com/title/tt6736782/?ref_=ext_shr_lnk).

No ale te strzałki są arbitralne, a skutki upływu czasu nie są, bo to są pewne fakty.

I to rozróżnienie jest bardzo ważne, ale czy widzisz, że wewnątrz tego zdania zmieniłaś temat?
Swoją drogą, zauważyłaś, że symbole `<` i `>` można postrzegać jako groty strzałek ...

(a ten znowu o tych strzałkach, *Dżizas* ...) *Fajnie* się gadało, ale właśnie sobie przypomniałam,
że byłam z kimś umówiona i już widzę, że się spóźnię i muszę lecieć.

Ale wpadniesz znowu? Ludwik też lubi słowo "Dżizas", wiesz? 

...

Dżessika?

<br>

Masz już pewnie serdecznie dosyć tego amatorskiego filozofowania? I tego, że *wmawiam* Ci coś, co
sam próbuję powiedzieć? A właśnie, gdzie jest w tym wszystkim miejsce dla filozofii?

<hr>

Już w podstawówce wydawało mi się, że gdy dorosnę, zostanę filozofem. Jak przez mgłę pamiętam
zdziwienie Pani pracującej wtedy za ladą w księgarni Stankiewicz w Bielsku-Białej, kiedy będąc
uczniem szóstej albo siódmej klasy zapytałem, czy jest może "Ludzkie, arcyludzkie" i
"Antychryst". Zanim usłyszałem odpowiedź, Pani za ladą upewniła się, czy dobrze usłyszała, a gdy po
kilku dniach przyszedłem znowu, miała dla mnie przygotowany zestaw jakiś gazetek, o których sądziła
najwyraźniej, że będę nimi zainteresowany. Bardzo to było miłe, ale zarazem na tyle krępujące, że na
pewien czas przestałem tam przychodzić. Popisywałem się potem na lekcjach religii, wypowiadając -
prawdopodobnie nieznośnym tonem - zdania w rodzaju "Nie istnieje wola nieegoistyczna". Tak, to były
piękne czasy.

Z Fryderyka N. na szczęście prędko wyrosłem. Chociaż, gdy teraz myslę o tym zdaniu, którym tak
chętnie uraczyłem Bogu ducha winną katechetkę, muszę mu przyznać rację. I jednocześnie muszę mu jej
odmówić. *Z definicji* nie istnieje wola nieegoistyczna, ale nasza wola, tak jak nasze Ego, może
przyjmować bardzo różne formy. Ta wola może być związana z wąsko i krótkowzrocznie pojętym własnym
interesem i wtedy jesteśmy egoistami *małymi*, albo z interesem wspólnoty; i wtedy nadal jesteśmy,
bo zawsze jesteśmy - lecz tylko w trywialnym znaczeniu tego słowa - egoistami, ale stajemy się wtedy
egoistami w dobrym znaczeniu *większymi*.

Kiedy jesteśmy *małymi* egoistami, najbardziej krzywdzimy *siebie*, bo stajemy się wtedy *samotni*,
a samotność jest dla nas być może najgłębszą formą cierpienia. I *wiemy* doskonale, bo żeby to
odkryć nie trzeba robić badań "naukowych", że właśnie *harmonijne współdziałanie* jest tym, co
przynosi nam najgłębsze szczęście. Od dziecka pragniemy być *ważni*, ale gdy próbujemy zaspokoić to
pragnienie goniąc za pozycją społeczną i tytułami, czy za dobrami materialnymi, zostając sami
przekonujemy się szybko, jak bardzo to wszystko jest bezużyteczne. Bo w samotności *nie da się* być
ważnym w jedynym sensie, który się naprawdę liczy - będąc dla innych *kimś użytecznym* i *niosąc
pomoc*.

<hr>

Ale wracając na ziemię i do podjętych już wynurzeń, zamiłowanie do filozofii trwało przez całe
liceum i dlatego najpierw zdałem właśnie na filozofię. Być może częściowo z powodu tego, jakie to
coraz gorsze efekty w kolejnych latach dawało połączenie mojej prokrastynacji i lekkomyślności z
ogromną elastycznością terminów zaliczeń, jaką charakteryzowało się wtedy studowianie na tym
kierunku na UJ, ale wydaje mi się jednak, że przede wszystkim z innych, głębszych powodów, któregoś
dnia, czytając w księgarni opis na obwolucie jakiejś książki wydanej przez [wydawnictwo
Aletheia](https://www.aletheia.com.pl/) poczułem nagłą i niespodziewaną pewność, że nie mam już do
tego serca. I tak trafiłem na psychologię.

Dopiero niedawno zacząłem wracać, rzadko i z pewną nieśmiałością, do tego typu literatury i wygląda
na to, że w najbliższej przyszłości będę z niej korzystał częściej i bardziej intensywnie. Uprzedzam
więc, że w kolejnych rozdziałach mogą się z tego powodu pojawiać fragmenty jeszcze dziwniejsze i
bardziej żenujące niż dotychczas. Takie jak ten:

## [Potężna Piątka](https://kungfupanda.fandom.com/wiki/Furious_Five)

Najpierw biologia. Od tylu już lat badania neuropsychologiczne są postrzegane przez wielu jako te
relatywnie "twarde" i "naukowe", z dwóch oczywistych powodów. Mózg steruje zachowaniem, a biologia
jest (póki co) daleko bardziej zaawansowaną nauką niż psychologia; ma znacznie więcej doniosłych
zastosowań i przedmiot jej badań często o wiele łatwiej jest obserwować w kontrolowanych warunkach i
często o wiele ławiej jest dokonywać na nim precyzyjnych interwencji eksperymentalnych. A z drugiej
strony, nadal nie udało się na przykład znaleźć choćby *jednego* markera biologicznego
*jakiegokolwiek* zaburzenia psychicznego.

Coś tam wiemy na temat neuronalnych mechanizmów *bardzo wczesnych* etapów prercepcji i coś tam też
wiemy na inne podobne tematy, ale poza tym wpływ neurpsychologii na psychologię jest jak dotąd tak
nikły, że gdy ta pierwsza pojawia się w podręcznikach dotyczących tej drugiej, prawie zawsze pojawia
się jak jakiś kwiatek u kożucha - taka (dla niektorych ekscytująca) ciekawostka, którą trudno w
jakikolwiek sposób znacząco zintegrować z wiedzą na temat *zachowania*. Ciekawostka typu coś tam się
*może* świeci w pewnych obszarach bardziej niż w innych, gdy ludzie wykonują, najczęściej w
*dziwacznych* warunkach, sztuczne i sztucznie uproszczone zadania. A finansowe i nie tylko takie,
głównie *publiczne* zasoby poszły na tego rodzaju badania jak dotąd ogromne. Jeżeli to jest Twoim
zdaniem *moralnie akceptowalne*, to bardzo chciałbym wiedzieć *w jakim sensie*.

Dlaczego tak (żałośnie) słabo mimo, że tak (kosmicznie) drogo i - najwyraźniej zdaniem wielu - tak
obiecująco? Nie tylko moim zdaniem dlatego, że mózg jest ekstremalnie złożony, działa w sposób
idiosynkratyczny, jest niestacjonarny i w ekstremalnym stopniu zależny od przebiegu dotychczasowej
interakcji zwierzęcia ze środowiskiem. My to wszystko od dawna już *wiemy*, tylko najwyraźniej *nie
wyciągamy z tego wniosków*. Niestety, tego rodzaju bezwładność w nauce to nic nowego.

Jednocześnie jednak nie ulega wątpliwości, że *biologia* zajmuje się czymś, co do przedmiotu
zainteresowań ani fizyki, ani nawet chemii *nie* należy, to jest *życiem*, postrzeganym *przede
wszystkim* jako pewnego rodzaju *mechanizm*. Dlatego biolog bez zająknięcia się powie na przykład,
że *funkcją* serca jest pompowanie krwi i tą własność serca będzie traktował jako kluczową. A jest
tego rodzaju własność dla biologa kluczowa, bo centralnym pojęciem biologii jest dychotomia i
jednocześnie porządek określony na zbiorze dwuelementowym, a więc strzałka, *od* śmierci *do*
życia. To jednocześnie niezły moim zdaniem przykład ilustrujący arbitralność kierunku strzałki
czasu, bo ta strzałka jest skierowana *ku przeszłości*.

Biolog traktuje życie jako *lepsze* od śmierci, bo inaczej nie postrzegałby na przykład właśnie
serca jako czegoś, co *w określony sposób*, to jest pompując krew, *służy przeżywaniu*. Gdyby nie o
to chodziło, serce byłoby *przede wszystkim* czymś *innego rodzaju*. Na przykład czymś, co *zajmuje
określone miejsce* w organiźmie, albo co *emituje pewną ilość ciepła*, i tak dalej. A nie jest;
serce jest *tym, co pompuje krew*.

Biologia jest więc subdyscypliną psychologii, jak wszystkie nauki. W dodatku z prostej,
deskryptywnie trafnej definicji, bo każda nauka *jako nauka* jest wytworem i narzędziem
zachowania. Inaczej mówiąc, właściwie rozumiana psychologia jest *punktem stałym samego badania*.

Natomiast filozofia jest wyraźnie *inna* od całej reszty. Tym, co łatwo rzuca się w oczy jest fakt,
że uprawianie filozofii polega na zajmowaniu się tak zwanymi pytaniami podstawowymi albo
ostatecznymi, takimi jak pytania o naturę i granice *poznania w ogóle*, albo pytania o *byt w ogóle*
i o *wartości w ogóle*. Dosyć to niesamowite. I jednocześnie charakterystycznie *nieczytelne*, ale
*nie* w złym znaczeniu.

Teoria kategorii uczy nas, że jeżeli obiekt pewnego rodzaju, taki jak dajmy na to iloczyn
kartezjański zbiorów, jest ważny - a filozofia, ta zawodowa i ta amatorska, jest niewątpliwie dla
wielu z nas, ludzi (czasem nawet bardzo) ważna - to warto przynajmniej próbować znaleźć powód tej
ważności, przyglądając się, dotyczącym przypuszczalnie ważnych własności tego obiektu, *relacjom
między tym obiektem a innymi obiektami tego samego rodzaju*.

Ale nie chodzi tu o *jakiekolwiek* relacje, bo taka wskazówka byłaby bezużyteczna. Poszukujemy wtedy
perspektywy, z której danego rodzaju obiekt jest w jakimś sensie najlepszym albo ekstremalnym
przypadkiem czegoś ogólniejszego, czyli jest *przypadkiem granicznym*, albo wręcz *samą granicą*. I
tak, iloczyn kartezjański zbiorów jest, jak zobaczymy później, obiektem końcowym (to właśnie pewna
granica, ...) w kategorii diagramów złożonych z par współźródłowych strzałek (... a to są obiekty
tego samego rodzaju). Co więcej, właśnie *ta* własność charakteryzuje w pewnym sensie to, co w
iloczynie kartezjańskim jest najważniejsze, a więc - zawsze tylko w pewnym sensie - jego "istotę"
albo "prawdziwą naturę".

Ponieważ w tej książce nieustannie przyglądam się z różnych stron myśleniu, mówienu, czytaniu,
pisaniu, rozmawianiu, komunikacji, myśleniu jako przepisywaniu, programowaniu i metaprogramowaniu, a
później będę się też przyglądał abstrakcyjnie rozumianemu dialogowi, to spróbuję do tego podejść
właśnie od tej strony (a raczej stron).

Jak wspominałem w rozdziale drugim, jednym z najcenniejszych doświadczeń, jakie wyniosłem ze
studiowania filozofii, było *pisanie konspektów*. Z pewnością widać w tej książce, że chętnie
korzystam z nabytych w ten sposób, mozolnie i w pocie czoła, nigdy dostatecznie nie rozwiniętych
umiejętności. Polegało to nieodmiennie na czytaniu tekstów *źródłowych* i na tworzeniu możliwie
najkrótszej notatki, która miała zawierać coś w rodzaju wydestylowanego, centralnego wątku
argumentacji, a przede wszystkim obiecujących *punktów nacisku*, to jest miejsc, w których można by
próbować znaleźć jakieś dziury w rozumowaniu albo innego rodzaju wady. I nigdy wcześniej, ani nigdy
później nie miałem do czynienia z tekstami, w przypadku których to byłoby tak *trudne*. Nawet
czytanie w liceum i później stosunkowo hermetycznej poezji nie wiązało się dla mnie nigdy z
poczuciem równie silnego oporu materii językowej, choć może dlatego, że wobec poezji miałem inne
oczekiwania.

Filzofowie mają do tekstów źródłowych stosunek szczególny. Nie da się tego chyba porównać z niczym,
co ma miejsce w innych dyscyplinach naukowych czy akademickich. Na przykład, dla matematyka
matematyczny tekst źródłowy ma zwykle znaczenie prawie całkowicie *historyczne*, podobnie jak dla
dla biologa tekst napisany przez biologa, dla fizyka tekst napisany przez fizyka, albo dla
psychologa tekst napisany przez jakiegoś psychologa. Nawet literaturoznawcy, dla których przedmiotem
badania są teksty źródłowe, traktują je inaczej niż filozofowie traktują teksty filozofów.

Zgaduję, bo nie mam o tej dyscyplinie bladego pojęcia, że gdy literaturoznawca pisze tekst naukowy
na temat na przykład jakiegoś dzieła literackiego, powstający w ten sposób tekst nie musi być potem,
w ogólnym przypadku, czytany w oryginale, bo można zawarte tam główne treści przekazać na wiele
sposobów niewiele przy tym tracąc. W przypadku filozofii nie ma tak wyraźnej różnicy między
interpretacją tekstu źródłowego i tekstem źródłowym, bo teksty filozoficzne, w każdym razie te
*ważne*, które są wynikiem filozoficznej interpretacji i analizy innych tekstów filozoficznych,
*same wymagają filozoficznej interpretacji i analizy*. Czy nie wygląda Ci to na robotę tego miglanca
Urobora? Dlaczego tak jest?  I po co?

Może dlatego, że filozofia polega w niemałym stopniu na *odkrywaniu nowych* i *nieredukowalych
pojęć*, czy nawet całych *struktur* pojęciowych? A więc na wskazywaniu i badaniu pojęć w pewnym
sensie *początkowych* albo, w jakiś sposób dualnie, a więc równoważnie, *końcowych*? A mówiąc
metaforycznie i zmieniając rejestr, żeby zacząć łowić więcej nowych skojarzeń:

*Czy nie jest filozofia poszukiwaniem jasnych konstelacji struktur pojęciowych na gęstym i ciemnym
nieboskłonie naszych nieunikalnych poznawczych celów?*

*Uff*. Robiąc takie rzeczy trzeba powitać z otwartymi ramionami wyzwalający w dostecznie dużej dawce
nektar zażenowania (i pozwolić sobie na boleśnie niespójne i pokraczne rezultaty, takie jak zdanie,
w które się właśnie wtrącam pisząc nawiasem \{a które po tym, jak stanie się "dobrem publicznym",
spełni ostatecznie swoją wyzwalajacą rolę ⟨zauważyłaś, że w tym pisaniu prawie we wszystkim jest
jakaś *metoda* \[inaczej *deklarowany* albo *zamierzony* cel ⟪...[^3]⟫]?⟩\}).

Może dlatego filozofia *nie ma metody*? I dlatego, choć nauki mają swój *początek* w filozofii, to
jednocześnie żadna nauka z filozofii *nie wynika*, a gdy już jakaś dyscyplina naukowa z filozofii
się *wyobrębni*, tak jak teraz wyobrębnia się z niej psychologia, prędko staje się autonomiczna i
zwykle (jako *dyscyplina*, nie jako uprawiający ją ludzie) ewidentnie filozofii *przestaje
potrzebować*?

Zastrzegam jednak, że na ten pomysł wpadłem dzisiaj[^5] i niewykluczone, że go przerobię lub
porzucę. Ponieważ jednak mogę pisać w tej książce o czym tylko chcę i w jaki tylko mam ochotę
sposób, co sprawiło, że uczę się tak szybko, tak wielu rzeczy i dostarcza mi to tyle radości, a
czasem nawet wzruszeń, że nie mogę tego porównać z niczym, czego doświadczyłem ucząc się
czegokolwiek w jakikolwiek sposób wcześniej, a filozofię zacząłem po latach zachowywania chłodnego
dystansu znów cenić i lubić, to postanowiłem sprawdzić, co wyniknie z podjęcia i tego tematu.

Byłby i o tym zapomniał: Sztuczna inteligencja to *dział psychologii stosowanej*, co od dawna
powinno być dla wszystkich oczywiste. Tak się tylko z powodów historycznych składa, że zajmują sią
nią ludzie znacznie lepiej przygotowani do uprawiania psychologii *teoretycznej*, a więc również
naukowej, niż współcześni psychologowie.

<br>

I teraz mogę już odetchnąć i wrócić do
[rozpracowywania](https://youtu.be/PQLySgRW6y8?si=DkOxgyHo44cJeYlv) porządków. Ale wcześniej muszę
zapytać, bo ten rozdział jest znacznie dłuższy niż wszystkie poprzednie:

Czy czytając pamiętasz, żeby używać [*minutnika*](./R35__Sprzatajac_pod_lasem.md) i nie czytać bez
przerw dłużej, niż przez około pół godziny?

### Przypisy

[^1]: Gdy zadzwoniłem do Tomka, żeby złożyć mu życzenia urodzinowe i powiedziałem, że już po raz
    drugi cytuję go w tej książce, poprosił, żeby Was wszystkich pozdrowić. No to przekazuję
    pozdrowienia.

[^2]: Ten przykład poznałem dzięki wspaniałej książce Eugenii Cheng [*The Joy of
    Abstraction*](https://eugeniacheng.com/), którą tu już polecałem i która mnie bardzo
    zainspirowała. Zdaje się nawet, że pod niejednym względem mocno wpłynęła na charakter tego, co
    właśnie czytasz (w tytule jest *Joy*!). Niedawno zobaczyłem na YouTube dyskusję, w której
    Eugenia wzięła udział i dowiedziałem się dzięki temu, że chociaż zajmuje się zawodowo teorią
    kategorii, to ucząc się jej i w ogóle studiując matematykę raczej *unikała zadań*. W dodatku w
    tej dyskusji powiedziała w pewnym momencie, że *there is no should* i że *we do not understand
    anything*. Nic dziwnego, że jestem
    fanboyem. [Dyskusję](https://www.youtube.com/live/jJj3psZsGTk?si=WWD1T3LaiWSpYK8M) "otwarł"
    zresztą wspaniały [David Spivak](https://en.wikipedia.org/wiki/David_Spivak), którego znakomita
    książka [Category Theory for the
    Sciences](https://mitpress.mit.edu/9780262028134/category-theory-for-the-sciences/)
    zainspirowała mnie do wymyślenia opisanego w poprzednim rozdziale przykładu z monoidem jako grą
    w węża.

[^3]: ... Dosyć wcześnie pisząc tą książkę odkryłem, że tak mniej więcej działa pisanie nawet tylko
    częściowo na żywo. Na początku trudno się pozbyć skrępowania wynikającego ze wstydu i z lęku
    przed oceną, połączonego z niepewnością wynikającą z faktu, że dopiero zaczęło się robić coś,
    czego nawet nie próbowało się robić nigdy wcześniej. Ale dzięki terapeutycznemu efektowi
    [ekspozycji](https://pl.wikipedia.org/wiki/Ekspozycja_(psychoterapia)), lęk i wstyd stopniowo
    ustępują miejsca orzeźwiającej twórczej swobodzie, która może się potem śmiało rozpanoszyć. Tą
    wersję wyzwolenia przez ekspozycję zastosowałem po raz pierwszy dawno, dawno temu, gdy na
    imprezie w nieistniejącej już Carycy, która to impreza odbyła się z powodu zamknięcia szokły
    flamenco, było to więc doświadczenie już i tak pod wieloma względami intensywne, zaproponowałem
    przyjaciołom i znajomym *konkurs tańca żenującego*. Gorąco polecam.

[^4]: A po angielsku i bawiąc się znaczeniami, *Correctness is the order of psychology*.

[^5]: To jest w pięćdziesiąte urodziny Tomka, który też studiował filozofię, tylko był trzy lata
    wyżej niż ja i zdaje się, że - mądrala - nigdy nie przestał jej cenić.
