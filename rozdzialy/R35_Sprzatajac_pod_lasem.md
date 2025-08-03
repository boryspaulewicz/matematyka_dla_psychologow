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

def Empty_pred : Pred   Empty       := fun niemozliwosc => niemozliwosc.elim

def Empty_rel  : Binrel Empty Empty := fun niemozliwosc => niemozliwosc.elim
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

W dwóch ostatnich definicjach tak naprawdę *nie ma ciała*, bo term `niemozliwosc.elim` reprezentuje
możliwość zastosowania wobec *czysto teoretycznych* funkcji tego rodzaju reguły eliminacji, a nie
możliwą wartość parametru `niemozliwosc`. Poczucie dezorientacji, które może wywołać takie
zastosowanie typu `Empty`, `False`, czy naszego `Absurd`, wynika więc dokładnie stąd, że to są
tylko - i zarazem *aż* - *czyste narzędzia rozumowania*. Przypominają pod tym względem te bardziej
abstrakcyjne rodzaje elementów neutralnych i zarazem kategoryjnych identyczności, w tym zera i inne
podobne do zer, w takim lub innym znaczeniu puste konstrukcje. Inaczej mówiąc, te typy *są samym
sposobem użycia*; dlatego są takie "puste w środku".

Pozwolisz, że mimo zaakcentowania jej pismem pochyłym, jeszcze raz zwrócę Twoją uwagę na tą - być
może pozornie wynikającą tylko z implementacji - osobliwą obserwację, bo niebawem będziemy z niej
wyprowadzać nieuchronne i bardzo daleko idące wnioski:

## Funkcje z pustych struktur początkowych są bezcielesnymi albo czystymi sposobami

A teraz nadal o tym samym, ale wychodząc z innego punktu: Teoria mnogości może się wydawać nawet
współczesnym matematykom nudna i mnie też do niedawna taka właśnie się często zdawała. Na przykład,
kategoryści piszą o niej czasem, że to tylko jeden z wielu możliwych języków podstawowych matematyki
i tylko jedna z nieskończenie wielu możliwych kategorii. Ale teoria mnogości nie jest tylko jakąś
tam kategorią, ponieważ jej centralne pojęcie, to jest pojęcie funkcji, rozumianej jako samo
przyporządkowanie arbitralnych wartości abstrakcyjnym elementom, odpowiada *najbardziej elementarnej
funkcji języka*, jaką jest *oznaczanie*. Teoria mnogości *nie* jest więc w istocie teorią *zbiorów*,
tylko maksymalnie ogólną albo podstawową - i mechaniczną, bo to matematyka - teorią oznaczania.

Z tej perspektywy jest wręcz zadziwiające, że chociaż teoria kategorii pozwala wyraźnie zobaczyć, że
strzałki są daleko ważniejsze niż obiekty, to jednak w każdym znanym mi podręczniku do teorii
kategorii autorzy nadal piszą o kategoriach tak, jakby akcentowanie strzałek było co najwyżej z
pewnych względów bardziej użytecznym punktem widzenia. Widać to szczególnie w języku naturalnym,
którym Ci autorzy się posługują tłumacząc, o co w tym chodzi. Z powodów historycznych i chyba też z
głębszych powodów psychologicznych matematycy są wciąż moim zdaniem nadmiernie przywiązani do
*zwykłych rzeczowników*, a do mówienia o jakichkolwiek strukturach jako o kategoriach w sposób
oczywisty zwykle znacznie bardziej nadają się *rzeczowniki odczasownikowe*, takie jak "oznaczanie".

Struktury, które opisujemy za pomocą zwykłych rzeczowników, takie jak zbiory i należące do nich
elementy, są *niczym* bez *sposobu, w jaki ich używamy*, bo te struktury są tylko - i aż - częściami
pewnego *języka*, a język jest naszym *narzędziem*. To dzięki językowi panujemy nad światem i nad
sobą w takim stopniu, w jakim panujemy i to dzięki językowi możemy się *wzajemnie rozumieć* i możemy
do pewnego stopnia rozumieć *sami siebie*. Gdy tylko wyprowadzimy ostateczne wnioski z obserwacji,
że to strzałki są w kategoriach najważniejsze, staje się natychmiast jasne, że teoriomnogościowe
elementy są arbitralnymi oznaczeniami, które tylko dzięki funkcjom mogą cokolwiek oznaczać.

Dlatego moim zdaniem tradycyjne teoriomnogościowe implementacje pojęć kategoryjnych mają status
implementacji w głębokim sensie *kanonicznych*. I tak będę je odtąd czasami traktował - jako
szczególnie ważne *źródła sensu* jednych z najbardziej abstrakcyjnych i zarazem najbardziej
uniwersalnie użytecznych pojęć jakimi dysponujemy, to jest kategoryjnych
[*granic*](https://en.wikipedia.org/wiki/Limit_(category_theory)), o których opowiem Ci więcej w
odpowiednim czasie.

<hr>

Gdy zbiór jest (jakimkolwiek) *singletonem*, również można na nim zdefiniować tylko jeden porządek,
który co prawda nie jest wtedy pusty, ale też jest trywialny. Tej trywialności po prostu nie da się
nie zobaczyć przyjmując perspektywę kategoryjną, bo porządek na singletonie rozumiany jako cienka
kategoria sprowadza się do pojedynczego obiektu wyposażonego tylko w pętlę identyczności, a obiekt i
jego identyczność to jedno i to samo. A więc porządek na singletonie jest tym samym, co *obiekt bez
właściwości*.

Gdy jednak elementy są *dwa*, możliwych porządków jest więcej. *Dwa* z tych porządków, będące
izomorficzną parą, można interpretować zarówno jako porządek *wartości logicznych* - `{zdanie
fałszywe < zdanie prawdziwe}` - jak i jako porządek *poprawności* - `{działanie błędne < działanie
poprawne}`. W dodatku ten głęboki związek między *celowością* i *logiką* nie jest wcale przypadkowy.

Zawsze, gdy możemy mówić o reakcjach, odpowiedziach, czynnościach, zachowaniach, albo działaniach
poprawnych, możemy też mówić o reakcjach, odpowiedziach, czynnościach, zachowaniach, albo
działaniach błędnych i vice versa. To są *dokładnie* te same sytuacje, w których możemy też mówić o
błędnym lub poprawnym wykonaniu jakiegoś *zadania*. Wykonanie błędne traktujemy wtedy jako w pewnym
sensie mniejsze albo *gorsze* niż wykonanie poprawne, tak jak fałsz traktujemy jako coś mniejszego
albo gorszego od prawdy, brzydotę jako coś gorszego od piękna, a zło jako coś gorszego od dobra.

Formalnie, wszystkie te struktury są jedną i tą samą strukturą porządku na zbiorze dwuelementowym,
który to porządek, postrzegany jako kategoria, jest dokładnie pojedynczą nieidentycznościową, a więc
już *nie*trywialną, *strzałką*.

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
że może rację miał Perry i ta różnica polega na *wyuczalności* zachowań, z której wynika ich
wyjątkowa adaptacyjna plastyczność, polegająca na poszukującym zmierzaniu ruchu mniej więcej w tą
samą stronę mimo przeszkód, którego nie widać w typowych urządzeniach, narzędziach, czy wszelkiego
rodzaju zwykłych mechanizmach.

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
autonomii (pamiętasz tamtą mysz?). Ale celowość występuje w sposób oczywisty również w nieuczących
się narzędziach, urządzeniach, mechanizmach i innych artefaktach, takich jak dzieła sztuki.

W sali, w której spędziłem kilka pierwszych lat szkoły podstawowej, na ścianie wisiał napis
"Matematyka jest królową nauk". Wtedy nie wiedziałem, co o tym myśleć, ale byłem mały i jeszcze
głupszy niż teraz. A teraz myślę o tym tak:

Matematyka to dokładnie celowe posługiwanie się dowolnymi jednoznacznymi regułami językowymi, które
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

<hr>

<br>

**Sugestia**:

Myślisz, że mi odbiło?

Też tak czasem sądzę.

Lecz jeśli tak,

to powiedz mi, proszę,

gdzie "ja" *dokładnie* błądzę.

<br>

<hr>

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

Wróćmy do strzałki.

## ∘ ⟶ ⊙

Pojedyncza strzałka jako kategoria, czyli `I → T`, gdzie `I` to z konieczności obiekt początkowy
(ang. *initial*), a `T` to z konieczności obiekt końcowy (ang. *terminal*), jest więc, między
innymi, a może nawet przede wszystkim, Oceną. *Źródło* tej strzałki można rozumieć jako czystą
abstrakcję: zbioru pustego, typów `False` i `Empty`, i w ogóle wszelkich struktur będących
Bezcielesnymi Sposobami. Jej *cel* można postrzegać jako Atom albo Element czy też Obiekt Bez
Właściwości, a więc materię jako taką, niezależnie od [typu
"substancji"](https://plato.stanford.edu/entries/substance/). A skoro to są obiekty początkowy i
końcowy dokładnie dlatego, że pierwszy emituje dokładnie jedną strzałkę do wszystkich obiektów, a
drugi przyjmuje dokładnie jedną strzałkę od wszystkich obiektów, to tym, co *czyni* je w tej
Elementarnej - choć, jak zobaczymy później, nie będącej końcową - kategorii początkiem i końcem,
jest Celowość Strzałki o typie:

```lean
Skierowanie : Celowości → Materię
```

Albo: Kierunek (jako taki), który jest możliwy dzięki istnieniu (jako takiej) Różnicy.

Wydaje mi się nawet, że warto przyjąć, chociaż na próbę, ogólną i *funkcjonalną* (sic!) definicję
Materii, a może lepiej Substancji, jako *tego, na co można skierować* - *niekoniecznie czyjąś* -
*uwagę*. Jak każde tego rodzaju początkowo dziwne, ale w jakiś sposób akceptowalne uogólnienie,
warto je przyjąć między innymi po to, żeby mieć dzięki temu chociaż *szansę* zobaczenia inaczej
niedostrzegalnych, potencjalnie głębokich analogii.

Teoria kategorii to abstrakcyjna algebra składania teoriomnogościowych funkcji, a więc - można teraz
już powiedzieć, że *dosłownie* - *algebra oznaczania*. Najprostsza nietrywialna kategoria, ...

`I → T`

... gdy popatrzymy na nią z perspektywy jej kanonicznej elementarnej implementacji, ...

`∅ → {⬝}`

... a na tą implementację popatrzymy z kolei jako na funkcję z typu albo zbioru -
`Empty`/`∅`/`False` - *bez zawartości* do typu albo zbioru odpowiadającego *obiektowi jako
takiemu* - `Unit`/`{⬝}`/`True` - albo, w przyjętej na próbę interpretacji, *substancji jako takiej*,
okazuje się być *oznaczaniem bez oznaczającego*.

Pamiętasz, jak w rozdziale szesnastym, dotyczącym (logiki, akjomatów, faktów,) wyborów, postaw i
wolności, pisząc, że widzę już, dokąd to wszystko zmierza, powiedziałem, że jeszcze nie mam palca,
którym mógłbym Ci wskazać (jakiś) Księżyc? To jest ten palec; ale nie ma tu Księżyca.

A pamiętasz, jak w pierwszym rozdziale powiedziałem, że ta książka *nie może* zawierać błędów w
częściach formalnych zapisanych w języku teorii typów, o ile tylko zostały sprawdzone, a wszystkie
takie części mogą być przez każdego sprawdzone za pomocą niezawodnego algorytmu, ale ta książka może
zawierać błędy w warstwie napisanej w języku naturalnym? To prawda, że może, ale zarówno ta warstwa,
jak i sam sposób, w jaki ta książka powstaje, to głównie *opisy* i *ilustracje* pewnych
*interpretacji* czegoś, co niewątpliwie istnieje. Ponieważ każda interpretacja jako taka jest pewnym
sposobem użycia, w przypadku interpretacji, o ile tylko jest *wewnętrznie spójna*, was sein kann,
[muss sein](https://en.wikipedia.org/wiki/String_Quartet_No._16_(Beethoven)). 

Zmiana interpretacji to tylko, i aż, zmiana punktu widzenia, na inny "swój" albo na jakiś
*cudzy*. Żeby naprawdę opanować sztukę zmieniania punktów widzenia, wystarczy nauczyć Się *tracić
wzrok*.

Ta osobliwa strzałka jest *uwagą*, ale uwagą *niczyją*, albo *patrzeniem jako takim*, albo
*subiektywnością jako taką*. I jest też *oceną*, w najbardziej podstawowym znaczeniu, bo - zawsze
tylko subiektywnie - *ważne może być tylko to, na co zwrócona jest uwaga*, ponieważ *nie da się
chcieć albo nie chcieć tego, czego nie można w jakiś sposób* **wskazać**.
  
Uwierz mi, wiem aż za dobrze, jak dziwnie to wszystko początkowo brzmi, ale jeśli nie możesz się z
tym pogodzić, to powiedz, właściwie *czym innym mogłaby być* **abstrakcyjna strzałka**?

<hr>

Zauważyłaś, że *nic* w świecie nie ma *kierunku* jako *własności własnej*? W szczególności, ta
strzałka jest skierowana w określoną stronę *tylko* dlatego, że *wybraliśmy* kierunek.

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
czas płynąłby w górę, a my spadalibyśmy (ale czy w nim?) w dół. Pamiętasz dualność relacji `<` i
`>`?

...

Ok, nigdzie nam się nie spieszy. Słyszałaś może o liczbach urojonych? `i² = -1` i `(-i)² = ((-1) *
i)² = (-1)² * i² = 1 * i² = i² = -1`, wydaje się więc, że trzeba *wybrać*, które $i$, to jest `i`
czy `-i`, jest `i`, bo te dwa $i$ są funkcjonalnie równie dobrymi kandydatami, a nie mogą być tą
samą liczbą, nawet jeśli "tylko" urojoną[^2].

Ale czy zachowania albo ruchy celowe, tak jak wszelkie wybory, nie mają kierunku jako własnej
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
"Antychryst". Zanim poznałem odpowiedź, Pani za ladą upewniła się, czy dobrze usłyszała, a gdy po
kilku dniach przyszedłem znowu, miała dla mnie przygotowany zestaw jakiś gazetek, o których sądziła
najwyraźniej, że będę nimi zainteresowany. Bardzo to było miłe, ale zarazem na tyle krępujące, że na
pewien czas przestałem tam przychodzić. Popisywałem się potem na lekcjach religii, wypowiadając -
prawdopodobnie nieznośnym tonem - zdania w rodzaju "Nie istnieje wola nieegoistyczna". Tak, to były
piękne czasy.

Z Fryderyka N. na szczęście prędko wyrosłem. Chociaż, gdy teraz myslę o tym zdaniu, którym tak
chętnie wtedy uraczyłem Bogu ducha winną katechetkę, muszę mu przyznać rację. I jednocześnie muszę
mu jej odmówić. Tylko z pewnej, trywialnej definicji nie istnieje wola nieegoistyczna, ale Ego może
przyjmować różne formy. Dokładniej, może *przyjmować wcielenia Się*. Wola może być związana z wąsko
i krótkowzrocznie pojętym własnym interesem i wtedy stajemy się egoistami *mniejszymi*, albo może
być związana z interesem Wspólnoty; i wtedy nadal jesteśmy, bo zawsze jesteśmy - lecz tylko w
trywialnym znaczeniu tego słowa - egoistami, ale stajemy się wtedy egoistami w dobrym znaczeniu
*większymi*. I to również są, na wskroś i z której by nie patrzeć strony, relacje porządku.

Kiedy jesteśmy *mniejszymi* egoistami, najbardziej krzywdzimy siebie, a raczej nasze ciało, bo
stajemy się wtedy *samotni*, a samotność jest dla nas być może najgłębszą formą cierpienia. I
*wiemy* doskonale, bo żeby to odkryć nie trzeba robić badań naukowych, że właśnie *harmonijne
współdziałanie* jest tym, co przynosi nam najgłębsze szczęście. Od dziecka pragniemy być *ważni*,
ale gdy próbujemy zaspokoić to pragnienie goniąc za pozycją społeczną i tytułami czy za dobrami
materialnymi, to jest starając się głównie, żeby inni nas *zauważali* i żeby się z nami *liczyli*,
zostając sami przekonujemy się szybko, jak bardzo to wszystko jest bezwartościowe. Bo w samotności
*nie da się* być ważnym w jedynym sensie, który się naprawdę liczy - poprzez niesienie pomocy. I to
wszystko też jest, na wskroś i z której by nie patrzeć strony, psychologia.

W tym sensie [karma](https://pl.wikipedia.org/wiki/Karma), to jest *czyn*, *dzieło* albo *działanie*
nie tyle *wraca*, co zwyczajnie działa. Na przykład, pisząc tą książkę założyłem, że tłumacząc, o co
chodzi w matematyce i programowaniu, będę o wiele bardziej polegał na języku naturalnym, niż robią
to na ogół nawet Ci bardziej przyjaźni czytelnikom matematycy. To wymagało wprowadzenia zabiegów
językowych, strukturalnych, a czasem literackich, które mnie samemu pomogły lepiej wiele rzeczy
zrozumieć i radość ze stosowania ich tylko zwiększyła motywację do pisania. Niedawno postanowiłem
sprawdzić, jak mi się teraz czyta starych znajomych i w związku z tym sięgnąłem po pięknie i ciepło
napisane, dostępne za darmo [wprowadzenie do teorii
kategorii](https://www.logicmatters.net/categories/#gentle) Petera Smitha.

Wydaje mi się, że na tym etapie mogłabyś czytać ten tekst dla samej przyjemności rozpoznawania na
nowo spraw, które już w większości całkiem nieźle poznałaś, delektując się przy tym wyjątkową
elegancją i lekkością stylu tego autora. Jednak pewnie pierwszy raz trafiłabyś na wymagającą
znacznej zmiany tempa ścianę najpóźniej na stronie dziesiątej, bo Smith zakłada tam znajomość
elementów teorii grup, których dotąd nie wprowadzałem nawet tylko niejawnie. 

Czytając jedno z pojawiających się tam wcześnie zadań zdałem sobie sprawę z innego dobrodziejstwa
(dla mnie!), wynikającego ze specyficznego podejścia, jakie stosuję w tej książce. Smith, jak to
zawodowy matematyk, omawia zwykle tak zwane rytunowe dowody w dużym skrócie. Z jednej strony chodzi
o to, żeby czytelnicy ćwiczyli robienie ich "w głowie" i żeby musieli włożyć w to pewien
wysiłek. Ale z drugiej strony, nie rozpisując szczegółowo na najmniejsze kroki prostych zadań i
polegając zamiast tego na błyskawicznych ruchach lotnej myśli, *uniemożliwiamy* sobie zobaczenie w
tych zadaniach czegoś nowego, bo *tekst* można dowolnie długo obserwować, badać i przerabiać, ale
*myśli* już nie. Automatyzacja ma w tym kontekście ogromne zalety, bo zwiększa poziom wykonania, ale
ma też jedną *ogromną* wadę - zmniejsza szansę na dostrzeżenie mniej oczywistych analogii. A raz
zautomatyzowany sposób myślenia może być trudno potem zrekonstruować.

Zauważyłem też, że nawet ktoś taki jak Smith korzysta z języka naturalnego głównie w celu rozwijania
ogólnej narracji, a w znacznie mniejszym stopniu w celu naświetlania, również *sobie*, różnych
aspektów formalnych konstrukcji i działań. Nie tylko czytelnicy na tym tracą, ale traci i sam autor,
bo nie korzysta wtedy z możliwości stworzenia nowej, gęstej i aktywnej sieci skojarzeń, której
wpływu na dalsze myślnie nie da się z góry przewidzieć.

No więc taka ta karma. Im bardziej wykorzystuje się swoje najbardziej obiecujące talenty i
kompetencje, żeby przydać się w jakiś sensowny sposób innym, tym bardziej te talenty i kompetencje
rosną i się rozwijają. Bo nic innego nie mają do roboty. I to też jest psychologia.

<hr>

Zamiłowanie do filozofii trwało przez całe liceum i dlatego najpierw zdałem właśnie na
filozofię. Być może częściowo z powodu tego, jakie to coraz gorsze efekty w kolejnych latach dawało
połączenie mojej prokrastynacji i lekkomyślności z ogromną elastycznością terminów zaliczeń, jaką
charakteryzowało się wtedy studowianie na tym kierunku na UJ, ale wydaje mi się jednak, że przede
wszystkim z innych, głębszych przyczyn, któregoś dnia, czytając w księgarni opis na obwolucie
jakiejś książki wydanej przez [wydawnictwo Aletheia](https://www.aletheia.com.pl/), poczułem nagłą i
niespodziewaną pewność, że nie mam już do tego serca. I tak trafiłem na psychologię.

Dopiero niedawno zacząłem wracać, rzadko i z pewną nieśmiałością, do tego typu literatury i wygląda
na to, że w najbliższej przyszłości będę z niej korzystał częściej i bardziej intensywnie. Uprzedzam
więc, że w kolejnych rozdziałach mogą się z tego powodu pojawiać fragmenty jeszcze dziwniejsze i
bardziej żenujące niż dotychczas. Takie jak ten, od którego zaczyna się następna część tego znacznie
dłuższego niż wszystkie wcześniejsze rozdziału. 

W związku z tą długością, czy pamiętasz, żeby używać *minutnika* i nie czytać bez przerw dłużej, niż
przez około pół godziny? Jeżeli tak lub nie, to zapraszam [tutaj](./R35__Sprzatajac_pod_lasem.md).

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
    fanboyem. [Dyskusję](https://www.youtube.com/live/jJj3psZsGTk?si=WWD1T3LaiWSpYK8M) otwarł
    zresztą wspaniały [David Spivak](https://en.wikipedia.org/wiki/David_Spivak), którego znakomita
    książka [Category Theory for the
    Sciences](https://mitpress.mit.edu/9780262028134/category-theory-for-the-sciences/)
    zainspirowała mnie do wymyślenia opisanego w poprzednim rozdziale przykładu z monoidem jako grą
    w węża.

[^4]: A po angielsku i bawiąc się znaczeniami, *Correctness is the order of psychology*.
