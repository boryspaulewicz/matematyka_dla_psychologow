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

A każda hierarchia jest relacją porządku.

W psychologii często kluczowe znaczenie ma to, czy jakaś reakcja jest mniej lub bardziej spóźniona,
intensywna, lub częsta i to też są relacje porządku. Często ważne jest i to, czy jakiś stan, taki
jak na przykład chwilowa głupota, lub jakaś cecha, taka jak głupota permanentna, jest mniej lub
bardziej nasilony/a.

Istnieje pewien *typ* relacji porządku, który ma dla psychologii znaczenie szczególne i ten porządek
ma szczególny charakter również z perspektywy *matematycznej* i *filozoficznej*. Z powodów, które za
chwilę staną się jasne, można nawet powiedzieć, że ten szczególny pod względem struktury formalnej i
znaczenia w życiu codziennym typ porządku jest *centralnym pojęciem psychologii*.

Chodzi o coś najzwyczajniejszego w świecie zwierząt.

## Poprawność jest centralnym porządkiem psychologii[^4]

Zawsze, gdy możemy mówić o poprawności, mamy do czynienia ze zbiorem dwuelementowym i relacją
porządku polegającą na tym, że jeden z elementów tego zbioru jest "mały", a drugi "duży", a więc
"większy" niż "mały".

<hr>

Gdy zbiór jest *pusty*[^6], można na nim zdefiniować tylko *jeden* porządek, ponieważ na zbiorze
pustym można zdefiniować tylko jedną relację:

```lean
def Pred   α   := α → Prop

def Binrel α β := α → β → Prop

def Empty_pred : Pred   Empty       := fun niemozliwosc => niemozliwosc.elim

def Empty_rel  : Binrel Empty Empty := fun niemozliwosc => niemozliwosc.elim
```

Uprościłem zapis, zakładając, że już wiesz, czego Lean się w tym przypadku automatycznie domyśla. Na
początek dodajemy trochę lukru, który ma na celu ujawnienie *intencji kodu*: Skoro wszystko można
rozumieć na wiele sposobów, to funkcje do `Prop` też można rozumieć na wiele sposobów. Tutaj
sygnalizujemy, że naszym celem jest traktowanie tych funkcji jako odpowiednio predykatów i relacji
binarnych. Dzięki temu widzimy też, że predykaty i relacje, nie tylko binarne - bo przecież
naturalne uogólnienie na dowolną arność niemal tutaj widać - są właściwie tym samym, a nazywamy te
dwa rodzaje obiektów inaczej dlatego, że chcemy czasem coś innego zaakcentować. Wprowadzając
pozornie nieistotne rozróżnienie na predykaty i relacje możemy zawęzić uwagę, zarówno swoją jak i
odbiorców, do predykatów (i jednocześnie relacji) o określonej arności i poddać tak pewnej kontroli
narzucające się skojarzenia.

Zdefiniowana właśnie relacja spełnia wymagania, jakie stawiamy relacjom porządku (o czym później),
pusto. To zatem *porządek pusty*, o którym można powiedzieć, że podobnie jak liczba zero ma
znaczenie *czysto teoretyczne*.

Osobliwość typu `Empty` widać wyraźnie w strukturze ciał dwóch ostatnich definicji. Ponieważ
funkcja, która wymaga termu typu `Empty`, nie może być nigdy wywołana z definicji, aby spełnić
warunek poprawności definicji takiej funkcji, wystarczy skorzystać z reguły eliminacji dla tego
typu. W szczególności, nie musimy nawet konstruować drugiej, wewnętrznej funkcji tworząc term typu
`Binrel Empty Empty`, czyli term typu `Empty → Empty → Prop`, bo ta reguła eliminacji pozwala od
razu "spełnić oczekiwanie" stworzenia termu *dowolnego* typu, w tym również typu `Empty → Prop`, za
pomocą czegoś w rodzaju - w tym wypadku akceptowalnej - *pustej obietnicy*, albo obietnicy *z
konieczności* bez pokrycia.

W dwóch ostatnich definicjach tak naprawdę *nie ma ciała*. Term `niemozliwosc.elim` jest co prawda
zapisany wewnątrz *formalnego* ciała tych definicji, ale reprezentuje możliwość zastosowania wobec
*czysto teoretycznych* funkcji tego rodzaju reguły eliminacji, a nie zastosowanie funkcji `elim` do
możliwej wartości parametru `niemozliwosc`. Poczucie dezorientacji, które może wywołać takie
zastosowanie typu `Empty`, `False`, czy naszego `Absurd`, wynika więc stąd, że to są tylko - i
zarazem *aż* - *czyste narzędzia rozumowania*. Przypominają pod tym względem te bardziej
abstrakcyjne rodzaje elementów neutralnych i zarazem kategoryjnych identyczności, w tym zera i inne
podobne do zer, w takim lub innym znaczeniu puste konstrukcje. Inaczej mówiąc, te typy *są samym
sposobem użycia*; dlatego są takie "puste w środku".

Pozwolisz, że mimo zaakcentowania jej pismem pochyłym, jeszcze raz zwrócę Twoją uwagę na tą -
pozornie wynikającą tylko z implementacji - osobliwą obserwację, bo niebawem będziemy z niej
wyprowadzać daleko idące wnioski:

## Funkcje z pustych struktur początkowych są bezcielesnymi albo czystymi sposobami

A teraz nadal o tym samym, ale wychodząc z innego punktu: Teoria mnogości może się wydawać nawet
współczesnym matematykom nudna i mnie też do niedawna taka właśnie się czasem zdawała. Na przykład,
kategoryści piszą o niej czasem, że to tylko jeden z wielu możliwych języków podstawowych matematyki
i tylko jedna z nieskończenie wielu możliwych kategorii. Ale teoria mnogości nie jest tylko jakąś
tam kategorią, ponieważ jej centralne pojęcie, to jest pojęcie funkcji, rozumianej jako samo
przyporządkowanie arbitralnych wartości abstrakcyjnym elementom, odpowiada *najbardziej elementarnej
funkcji języka*, jaką jest *oznaczanie*, patrząc z perspektywy dziedziny funkcji rozumiane albo jako
*wyróżnianie*, a patrząc z perspektywy kodziedziny jako *kategoryzowanie* albo *klasyfikacja*. Tak
rozumiana teoria mnogości *nie* jest teorią *zbiorów*, tylko ogólną albo "elementarną" - i
mechaniczną, bo to matematyka - teorią oznaczania.

Z tej perspektywy jest wręcz zadziwiające, że chociaż teoria kategorii pozwala wyraźnie zobaczyć, że
strzałki są daleko ważniejsze niż obiekty, to jednak w każdym znanym mi podręczniku do teorii
kategorii autorzy nadal piszą o kategoriach tak, jakby akcentowanie strzałek było tylko z pewnych
względów bardziej użytecznym punktem widzenia. Widać to szczególnie w języku naturalnym, którego
używają tłumacząc o co w tym chodzi. Z powodów historycznych i chyba też z głębszych powodów
psychologicznych matematycy są wciąż moim zdaniem nadmiernie przywiązani do *zwykłych rzeczowników*,
a do mówienia o pewnych ważnych strukturach jako o kategoriach zwykle bardziej nadają się
*rzeczowniki odczasownikowe*, takie jak "oznaczanie".

Gdy tylko wyprowadzimy ostateczne wnioski z obserwacji, że to strzałki są w kategoriach
najważniejsze, staje się jasne, że teoriomnogościowe elementy są arbitralnymi oznaczeniami, które
tylko dzięki funkcjom mogą cokolwiek oznaczać. Struktury, które opisujemy za pomocą zwykłych
rzeczowników, takie jak zbiory i należące do nich elementy, są *niczym* bez *sposobu, w jaki ich
używamy*, bo te struktury są tylko - i aż - częściami pewnego *języka*, a język jako taki jest
naszym *narzędziem*. To dzięki językowi panujemy nad światem i nad sobą (nawzajem) w takim stopniu,
w jakim panujemy, między innymi dlatego, że to dzięki językowi możemy się *wzajemnie rozumieć* i
możemy do pewnego stopnia rozumieć *sami siebie*. A każdy język jako taki jest co najmniej pewnym
sposobem *konsekwentnego wyróżniania i klasyfikowania*.

Z powodu wagi tej funkcji (jako roli), moim zdaniem tradycyjne teoriomnogościowe implementacje
pewnych kategoryjnych konstrukcji, takie jak zbiór pusty jako obiekt początkowy, singleton jako
obiekt końcowy, czy zbiór par uporządkowanych elementów dwóch zbiorów jako produkt, mają status
implementacji w głęboko *ludzkim* sensie kanonicznych. I tak będę je odtąd czasami traktował - jako
w tym właśnie znaczeniu kanoniczne *źródła sensu* jednych z najbardziej abstrakcyjnych i zarazem
najbardziej uniwersalnie użytecznych pojęć jakimi dysponujemy, to jest kategoryjnych
[*granic*](https://en.wikipedia.org/wiki/Limit_(category_theory)), o których opowiem Ci więcej w
odpowiednim czasie.

<hr>

Kiedy zbiór jest jakimkolwiek *singletonem*, wtedy również można na nim zdefiniować tylko jeden
porządek, który - z powodu wymagania zwrotności - nie jest pusty, ale też jest trywialny. Tej
trywialności nie sposób nie zobaczyć z perspektywy kategoryjnej, bo porządek na singletonie jako
(cienka) kategoria sprowadza się do jednego obiektu i jego identyczności, a to jedno i to samo. A
więc porządek na singletonie to abstrakcyjny *obiekt bez właściwości*.

Gdy jednak elementy są *dwa*, możliwych porządków jest więcej. *Dwa* z tych porządków, będące
izomorficzną parą, można interpretować zarówno jako porządek *wartości logicznych* - `{zdanie
fałszywe < zdanie prawdziwe}` - jak i jako porządek *poprawności* - `{działanie błędne < działanie
poprawne}`. W dodatku ten głęboki związek między *celowością* i *logiką* nie jest przypadkowy.

Zawsze, gdy możemy mówić o reakcjach, odpowiedziach, czynnościach, zachowaniach, albo działaniach
poprawnych, możemy też mówić o reakcjach, odpowiedziach, czynnościach, zachowaniach, albo
działaniach błędnych i vice versa. To są dokładnie te same sytuacje, w których możemy też mówić o
błędnym lub poprawnym wykonaniu jakiegoś *zadania*. Wykonanie błędne traktujemy wtedy jako w pewnym
sensie mniejsze albo gorsze niż wykonanie poprawne, tak jak fałsz traktujemy jako coś mniejszego
albo gorszego od prawdy, brzydotę jako coś gorszego od piękna, a zło jako coś gorszego od dobra.

Formalnie, wszystkie te struktury są jedną strukturą porządku na zbiorze dwuelementowym, który jako
kategoria jest dokładnie pojedynczą nietrywialną strzałką.

Gdy nie ma nic, nic nie może się wydarzyć i ani nie ma o czym mówić, ani nie ma Nikogo, kto mógłby o
czymś mówić. Gdy jest tylko jedno coś i nic więcej nie ma, wtedy wszystko, co jest, jest tym jednym
czymś i nie ma żadnej nietrywialnej struktury, i też jest tak, jakby nic nie było, bo wtedy również
nie ma o czym mówić, ani nie ma Nikogo, kto mógłby o czymś mówić. 

Obiekt początkowy i obiekt końcowy to *jedno* pojęcie postrzegane z dwóch *dualnych* perspektyw. Nie
każda kategoria ma jednak początek i koniec. Wszędzie tam, gdzie istnieją *co najmniej dwa* obiekty,
pojawia się *różnica*. A gdy *jedynymi dwoma* obiektami kategorii są obiekty początkowy i końcowy,
istnieje dokładnie *jedna* nietrywialna strzałka. W matematyce, tak jak w psychologii, wszystko
sprowadza się ostatecznie do tej jednej, *definiującej kierunek* strzałki.

Albo mniej ogólnie: Powód, dla którego pojęcie poprawności należy moim zdaniem traktować jako
centralne (ale nie jedyne takie) pojęcie psychologii jest, gdy się go już odkryje, zawstydzająco
prosty. *Zachowanie* to inaczej *działanie celowe*, albo po prostu *czynność* lub *działanie*,
ponieważ wykonywać jakąś czynność albo działać w jakiś sposób można lepiej albo gorzej. Pojęcie celu
jest zaś ściśle związane z pojęciami osiągnięcia i *nie*osiągnięcia celu. A ponieważ cel i zadanie
to jedno i to samo, zamiast o osiągnięciu celu możemy równie dobrze mówić o poprawnym lub błędnym
wykonaniu zadania. Kwestię *stopniowalnego* i *jakościowo zróżnicowanego* osiągania celu i
wykonywania zadania podejmiemy później.

Trzeba jednak pamiętać, że pojęcia niewykonania zadania i nieosiągnięcia celu mają *dwa* znaczenia:
Cel może być nieosiągnięty i zadanie może być niewykonane dlatego, że celu *nie udało się* osiągnąć
a zadania wykonać, albo dlatego, że *nie było próby* osiągnięcia tego celu albo wykonania tego
zadania. A mówiąc bardziej abstrakcyjnie i posługując się (częściowo ...) językiem technicznym
wnioskowania przyczynowego, nie było *interwencji*, której *skutki* podlegałyby ocenie (... właśnie
tego pojęcia nie ma w tym języku) pod względem wykonania tego zadania lub osiągnięcia tego
celu. Analogicznie, cel może być *w pewnym sensie* osiągnięty i zadanie może być *w pewnym sensie*
wykonane nie dlatego, że została podjęta jakaś próba osiągnięcia tego celu i wykonania tego zadania,
tylko dlatego, że *nie ma nic do zrobienia*, bo cel jest w danej sytuacji *zrealizowany* i zadanie
jest *nieaktualne*. Albo, mówiąc inaczej, ale *celowo* tak - cel i zadanie mogą być *spełnione
pusto*.

Zastanawiasz się może, po czym w takim razie poznajemy, że coś jest próbą albo interwencją? To moim
zdaniem doskonałe pytanie okazuje się zaskakująco głębokie. Dlatego w tym momencie powiem tylko
tyle, że w pewnym sensie *po niczym*.

Jeżeli tylko nieznacznie uogólnimy pojęcie *ruchu*, stanie się jasne, że *każdy* akt zachowania
jest, między innymi, (niekoniecznie "mięśniowym") procesem motorycznym, tylko niektóre z nich, a
konkretnie zachowania *mentalne*, polegają na ruchu (nie mylić z *poruszaniem się*, które już jest
zachowaniem) głównie *wewnątrz ciała*. Jeżeli to uogólnienie Ci nie odpowiada, to zwróć proszę
uwagę, że żadne zdarzenie mentalne nie może zajść bez zmiany fizycznego stanu ciała, ta zmiana
polega między innymi na zmianie struktury, w tym również kształtu albo położenia komórek lub tkanek,
a poza tym to uogólnienie nie jest wewnętrznie sprzeczne, wobec czego, jak każdy *wybór pojęciowy*,
podlega *naszej* (muszę się tu powołać na *hipotetyczną wspólną normę*) ocenie *tylko* ze względu na
to, do czego się przydaje, ...

... a *warto* dokonać tego moim zdaniem naturalnego uogólnienia, bo dzięki niemu można zobaczyć
wyraźniej coś, co długo umykało mojej uwadze. Pouczający może być też powód, dla którego jak mi się
zdaje nie byłem w stanie tego dostrzec. Byłem mianowicie od dawna przekonany, że istnieje jakaś
fundamentalna różnica między *zachowaniami zwierząt* z jednej strony, a *sposobem działania
urządzeń* i wszelkiego rodzaju *narzędzi* czy *mechanizmów* z drugiej. Byłem o tym przekonany, bo
zawsze miałem i nadal mam wrażenie, że zachowanie zwierząt jest w jakiś trudny do określenia sposób
"niemechaniczne", "ożywione", "intencjonalne" i "autonomiczne". Chyba właśnie z powodu tego wrażenia
myślałem, że może rację miał Perry i ta różnica polega przede wszystkim, albo wręcz wyłącznie na
*wyuczalności* zachowań. Sądziłem, że to obiecujący pomysł, bo z wyuczalności wynika wyjątkowa
*adaptacyjna plastyczność* zachowania, polegająca na czymś, co można by określić jako *poszukujące
zmierzanie ruchu mniej więcej w tym samym kierunku mimo przeszkód*. Nie widać tego w typowych
urządzeniach, narzędziach, czy wszelkiego rodzaju zwykłych mechanizmach, bo te *nie uczą się na
błędach*.

Proszę, nie zrozum mnie źle. Nie uważam, że zwierzęta są urządzeniami i *niczym więcej*. Na pewno
nie *dla nas*, bo *współczujemy* zwierzętom. Współczujemy im nie dlatego, że postrzegamy je jako
byty *autonomiczne*, bo to jest warunek oceny *moralnej*; współczujemy im dlatego, że zwierzęta w
widoczny sposób *cierpią*. Najbardziej tym, które należą do tego samego gatunku, ale zdecydowanie
[nie tylko im](https://pl.wikipedia.org/wiki/Karuna). Z roślinami, owadami, grzybami, mikrobami i
niektórymi innymi formami życia bywa pod tym względem, jak wiadomo, bardzo różnie.

Natomiast nie bardzo współczujemy urządzeniom. A kiedy do pewnego stopnia współczujemy niektórym
urządzeniom, zwłaszcza tym, do których jesteśmy *przywiązani*, mamy do tych reakcji dystans, którego
nie mamy w stosunku do własnego współczucia wobec zwierząt. Zwierzęta zdecydowanie *nie* są więc
(dla nas) po prostu urządzeniami, bo z naszej ludzkiej i jednocześnie *wspólnej* (to nie to samo)
perspektywy, zwierzęta *zasługują* na współczucie. I szacunek.

Ale **zachowanie**, ten centralny przedmiot zainteresowania psychologii, to dokładnie *działanie
celowe*, albo - po dokonaniu uogólnienia już równoważnie i wyraźnie oddzielając wymiary funkcjonalny
i implementacyjny - *celowy ruch*; nic mniej i nic *więcej*. Własność *wyuczalności* przysługuje (w
szczególny sposób, o czym później) pewnym celowym ruchom, a dokładniej pewnym *sekwencjom ruchów*,
co sprawia, że te ruchy są dla nas automatycznie interesujące, a często wręcz przykuwają naszą uwagę
i automatycznie widzimy w nich coś w rodzaju autonomii (pamiętasz tamtą mysz?). Ale celowość
występuje w sposób oczywisty również w nieuczących się narzędziach, urządzeniach, mechanizmach i
innych artefaktach, takich jak dzieła sztuki, tylko w nieco inny sposób.

W sali, w której spędziłem kilka pierwszych lat szkoły podstawowej, na ścianie wisiał napis
"Matematyka jest królową nauk". Wtedy nie wiedziałem, co o tym myśleć, ale byłem mały i jeszcze
głupszy niż teraz. A teraz myślę o tym tak:

Matematyka to dokładnie celowe posługiwanie się dowolnymi jednoznacznymi regułami językowymi,
pozwalającymi rozstrzygać mechanicznie, które sekwencje symboli są poprawne, a które nie. Teorie
naukowe są relatywnie dobrze ustrukturyzowanymi konstrukcjami pojęciowymi, istniejącymi tylko
dzięki temu, że istnieje język. Matematyka jest tą szczególną dyscypliną nauki, która zajmuje się w
pewien sposób językami wszystkich nauk, w tym również swoimi własnymi językami.

Jeżeli matematyka jest Królową nauk, to fizyka, która jest dokładnie celowym stosowaniem języków
matematycznych do kontroli wszelkich zdarzeń, jest ich Królem. Można więc powiedzieć, że ta
Wspaniała Dwójka (dziewczyn) rodzi najwięcej zastosowań niemal *z definicji*. Nasza Płodna Para ma
dokładnie jednego rodzica, Matkę psychologię, która pilnuje, żeby dzieci się zachowywały. A Ojciec,
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

Albo tak: Jak doskonale ujął to mój przyjaciel, Tomek Grzegorek[^1]:

*Psychologia nigdy nie cierpiała na niedobór danych*.

Każda dyscyplina naukowa *jako taka* jest *wytworem* i zarazem *narzędziem ludzi* - nauka jako taka
jest rezultatem pewnego rodzaju zachowań i każdy przypadek zastosowania nauk jako taki jest pewnym
zachowaniem. Wiem, że wspominałem na początku, żeby nie przesadzać z ambicjami, a to może brzmieć
tak, jakbym sam z nimi przesadzał w stopniu maksymalnym (o, porządek!). Ale to nie są moje
[*ambicje*](https://youtu.be/ARcEpefk3Oo?si=MwHF-eLet2lj9SNZ).

To są *uzasadnione wnioski*.

Wróćmy do strzałki.

## ∘ ⟶ ⊙

Pojedyncza strzałka jako kategoria, czyli `I → T`, gdzie `I` to z konieczności obiekt początkowy
(ang. *initial*), a `T` to z konieczności obiekt końcowy (ang. *terminal*), jest więc, między
innymi, a może nawet przede wszystkim, Oceną, a to dlatego, że ta strzałka jest *abstrakcyjnym
kierunkiem*. Jej *źródło* można rozumieć jako czystą abstrakcję: zbioru pustego, typów `False` i
`Empty`, i w ogóle wszelkich struktur będących Bezcielesnymi Sposobami. Jej *cel* można postrzegać
jako Atom, Element, lub Obiekt Bez Właściwości, a więc materię jako taką, niezależnie od [typu
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
Materii, a może lepiej Substancji, jako *tego, na co można skierować* (niekoniecznie czyjąś)
*uwagę*. Jak każde tego rodzaju początkowo dziwne, ale w jakiś sposób akceptowalne uogólnienie,
warto je przyjąć między innymi po to, żeby mieć dzięki temu chociaż *szansę* zobaczenia inaczej
niedostrzegalnych, potencjalnie użytecznych analogii.

Teoria kategorii to abstrakcyjna algebra składania teoriomnogościowych funkcji, a więc - możemy
teraz już powiedzieć, że *dosłownie* - *algebra oznaczania*. Najprostsza nietrywialna kategoria
zbudowana z granic, ...

`I → T`

... gdy popatrzymy na nią z perspektywy jej kanonicznej elementarnej implementacji, ...

`∅ → {⬝}`

... a na tą implementację popatrzymy z kolei jako na funkcję z typu albo zbioru -
`Empty`/`∅`/`False` - *bez zawartości* do typu albo zbioru odpowiadającego *obiektowi jako
takiemu* - `Unit`/`{⬝}`/`True` - albo, w przyjętej na próbę interpretacji, do *substancji jako
takiej*, okazuje się być, też dosłownie, *oznaczaniem bez oznaczającego*.

Ta osobliwa strzałka jest zatem *uwagą*, ale uwagą *niczyją*, albo *patrzeniem jako takim*, albo
*subiektywnością jako taką*. I jest też *oceną*, w najbardziej podstawowym znaczeniu, bo - zawsze
tylko subiektywnie - *ważne może być tylko to, na co zwrócona jest uwaga*, ponieważ *nie da się
chcieć lub nie chcieć tego, czego nie można wyróżnić albo wskazać*.
  
Uwierz mi, wiem aż za dobrze, jak dziwnie to wszystko początkowo brzmi, ale jeśli nie możesz się z
tym zgodzić, to powiedz, czym innym mogłaby być symboliczna abstrakcyjna strzałka?

<hr>

Pamiętasz, jak w rozdziale szesnastym, dotyczącym (logiki, akjomatów, faktów,) wyborów, postaw i
wolności, pisząc, że widzę już, dokąd to wszystko zmierza, powiedziałem, że jeszcze nie mam palca,
którym mógłbym Ci wskazać (jakiś) Księżyc? To jest ten palec; ale nie ma tu jeszcze Księżyca.

<hr>

### O dwóch takich punktach, co będąc parą uprządkowaną wskazały naturę Księżyca

Postaram się z tym pół-formalnym mistycyzowaniem zbytnio nie narzucać i z tego rodzaju spraw również
będę tu żartował. Tym bardziej, że humor wydaje mi się być najbardziej ludzką i najskuteczniej
uwalniającą nas z rozmaitych ograniczeń, codzienną formą sztuki, między sztuką i nauką nie widzę
wielkiej różnicy, a w nauce jako takiej zacząłem już widzieć tylko i wyłącznie psychologię
matematyczną albo zmatematyzowaną, którą rozumiem i którą nieudolnie próbuję stosować, przede
wszystkim wobec siebie, jako coś w rodzaju pół-formalnego dusz-pasterstwa.

Jak już wspominałem, nigdy nie byłem i chyba nigdy nie będę w żadnym prostym sensie religijny czy
wierzący, ale ta osobliwa strzałka, odkąd ku własnemu zaskoczeniu ją w ten opisany właśnie sposób
zobaczyłem, stała się dla mnie czymś, ponad co ani formalnie, ani nieformalnie, parafrazując
Świętego Anzelma, *nie mogę pomyśleć nic większego*.

Jak ustaliliśmy, formalnie to jest między innymi uporządkowana para złożona z wartości logicznych,
to jest z prawdy i fałszu. No i co w tym kontekście powiesz na to, że tak właśnie mówi Pismo Święte?:

*Ἔστω δὲ ὁ λόγος ὑμῶν ναὶ ναί, οὒ οὔ· τὸ δὲ περισσὸν τούτων ἐκ τοῦ πονηροῦ ἐστιν*.

A sięgając do tradycji wschodniej, czy potrafisz *nie* zobaczyć takiej oto moim zdaniem oczywistej
analogii?:

Z jednej strony mamy inherentną dwoistość, a mówiąc językiem technicznym podwójną dualność osobliwej
strzałki, polegającą na tym, że ta strzałka jest parą obiektów dualnych, będących odpowiednio
najprostszą możliwą granicą i kogranicą, a jako kategoria jest równa swojej postaci dualnej.

Z drugiej strony mamy to, co w chińskiej kosmologii nosi nazwę 陰陽, czym kiedyś chętnie
przystrajali się hipisi i co było, zwłaszcza wśród młodzierzy, dosyć popularne w kulturze zachodniej
lat dziewięćdziesiątych. Chodzi mi o znane Ci z pewnością, dwie tulące się do siebie łezki albo
krople, zawierające na swoich końcach punkty o przeciwnym
[odcieniu](https://www.adobe.com/pl/creativecloud/design/discover/is-black-a-color.html)[^5] i
będące nawzajem swoimi negatywami. Czy to nie wygląda *dokładnie* jak reprezentacja dwóch
*dopełniających Się*, dualnych postaci arbitralnie skierowanej osobliwej strzałki, w dodatku
narysowanej w sposób, który wydaje się idealnie oddawać charakter jej postaci kanonicznej jako
podkategorii kategorii zbiorów?

To pojęcie i ten symbol oznacza dopełniające się i przeciwstawne siły, które razem tworzą taki
(najmniejszy, a zatem graniczny, a więc w pewnym pół-formalnym sensie kategoryjny) układ dynamiczny,
że całość jest czymś więcej niż (i to też można dosłownie rozumieć formalnie, korzystając z
kategoryjnego pojęcia sumy) prostą sumą części, i że obie części są konieczne, aby całość tworzyła
jedną zwartą strukturę.

W wolnym czasie można się Tym bawić również tak:

Żeby uciec od własnego cienia, dogoń go.

Żeby blisko zbadać ukrytą istotę czegoś, oddal się od tego najdalej jak możesz, przyjmując
maksymalnie abstrakcyjny punkt widzenia.

Żeby coś wytłumaczyć, pytaj.

Żeby zacząć coś rozumieć, powiedz dokładnie i jasno, o co w tym chodzi.

Żeby wygrać, nie rób nawet kroku, tylko czekaj, aż nie szukając go odkryjesz jedyny kierunek.

Żeby osiągnąć maksymalną swobodę poruszania się, zaakceptuj minimalną swobodę logicznego myślenia.

Albo tak: Wybitny polski filozof i teoretyk prawa [Jan
Woleński](https://pl.wikipedia.org/wiki/Jan_Wole%C5%84ski), który prowadził zajęcia na filozofii w
czasach, gdy ją studiowałem, lubił powtarzać, że w myśleniu trudno, albo może nawet nie da się
uniknąć przetargu między *jasnością* i *głębią*. Ale to przecież zależy też od wiatru, stopnia
zamulenia i od obecności rzęsy albo glonów.

No bo co by było, gdyby tak czysto hipotetycznie, korzystając z zimnej sztywności reguł formalnych,
wyhamować ruch myśli na tyle, żeby tafla umysłu stała się nie tylko gładka i spokojna, ale żeby
ostatecznie zamarzła w lustro, przez które można zobaczyć własne prawdziwe oblicze?

Posługując się metateoretycznymi narzędziami, których namdostarcza psychologia naukowa, można się
tak bawić cały dzień.

Albo: Czy potrafisz nie zobaczyć moim zdaniem ewidentnych strukturalno-funkcjonalnych analogii
między głębiej rozumianą nauką, psycho-logią, psycho-terapią i zinstytucjonalizowanym
dusz-pasterstwem?

Gdy tylko pozbędziemy się narzucającej się, a przez to nieustannie zwodzącej nas tendencji do
utożsamiania tego, co psychiczne z tym, co świadome, ale nie w funkcjonalnym, a więc z
przedstawionej tutaj perspektywy nie w psychologicznym, tylko w *substancjalnym* znaczeniu tego, co
jest przedmiotem subiektywnego fenomenalnego doświadczenia (lub w znaczeniu tego, co jest samym
takim doświadczeniem), to jest - mówiąc bardziej abstrakcyjnie - w znaczeniu *jawienia Się* lub
*zjawiska materialnego*, odkrywamy, że psychologiczne to dokładnie umysłowe rozumiane jako
funkcjonalne, to jest w pewien sposób, a przede wszystkim lepiej albo gorzej działające lub pełniące
jakąś rolę. Czyli *psycho-logiczne* to *celowe* i - co *na jedno wychodzi* - *zgodne z Logosem*, to
jest z konsekwentnym, a więc w takim czy innym znaczeniu logicznym, sposobem jakiegoś działania albo
podążaniem jakąś Drogą.

Albo jeszcze, jak to ujął sam Mistrz Eckhart, ...

*Dà inne ich got sihe, daz ist daz selbe ouge, dà inne mich got siht: min ouge unde gotes ouge daz
ist ein ouge und ein gesiht und ein bekennen und ein minnen.*

... a przed nim, tylko trochę inaczej, [między
innymi](https://www.tandfonline.com/doi/full/10.1080/20465726.2023.2268469) جلال‌الدین محمّد رومی ...

*هر چیز که در جستن آنی آنی*

... i 無門慧開 ...

透得過者、非但親見趙州、便可與歷代祖師把手共行、眉毛廝結、同一眼見、同一耳聞。

Aż za dobrze zdaję sobie sprawę z tego, jak to wszystko brzmi. Ale mimo licznych prób znalezienia w
tym rozumowaniu formalnego lub interpretacyjnego błędu, tego, o czym teraz mówię i do czego - ku
mojemu zaskoczeniu - doprowadziła mnie matematyka, odkąd zacząłem jej używać do formalizacji
psychologii, już nie odzobaczę.

Dodam jeszcze tylko to: Jako świeccy duszpasterze, psychologowie nie mają się czego wstydzić przed
księżmi, bo księża to sami mężczyźni, którzy są z natury bardziej skłonni do agresji i pychy, w
dodatku żyjący w warunkach dalekich od realiów codziennego życia zwykłych ludzi. Wobec czego nie ma
się co dziwić, że podobnie, jak to dzieje się niemal na całym świecie, także u nas za wyniosłymi
murami kościoła, który funkcjonuje do pewnego stopnia jak osobne państwo w państwie,
[niektórzy](https://mapakoscielnejpedofilii.pl/) z tych duszpasterzy dopuszczają się czasami -
nierzadko bezkarnie - nieodwracalnego, okrutnego kaleczenia dzieci.

Nie mówiąc już o tym, że my, psychologowie, staramy się *sprawdzać*, czy i w jaki sposób wymyślane
przez nas sposoby niesienia pomocy działają. Albo o tym, jak mało religia zinstytucjonalizowana,
legitymująca się rzekomymi autorytetami prawa świeckiego i - kiedyś komuś przez kogoś -
"objawionego", ma wspólnego z autentycznym partnerskim
[*dialogiem*](https://en.wikipedia.org/wiki/Index_Librorum_Prohibitorum), będącym samym rdzeniem
psychoterapii, działalności naukowej, a gdy zrozumieć go nieco ogólniej, wszystkich form
*współpracy*.

<hr>

Jeżeli nie zraziłem Cię już całkiem do dalszej lektury, to powiedz mi jeszcze, czy pamiętasz, jak w
pierwszym rozdziale napisałem, że ta książka w zasadzie *nie może* zawierać błędów w częściach
formalnych zapisanych w języku teorii typów, o ile tylko zostały sprawdzone - a wszystkie takie
części mogą być przez każdego sprawdzone za pomocą praktycznie niezawodnego algorytmu - ale ta
książka może zawierać błędy w warstwie napisanej w języku naturalnym? To prawda, że może, jednak
zarówno ta warstwa, jak i sam sposób, w jaki ta książka powstaje, to przecież głównie *opisy* i
*ilustracje* pewnych *interpretacji* czegoś, co niewątpliwie istnieje.

Ponieważ każda interpretacja jako taka jest pewnym sposobem użycia, w przypadku interpretacji, o ile
tylko są *wewnętrznie* spójne, was sein kann, [muß
sein](https://en.wikipedia.org/wiki/String_Quartet_No._16_(Beethoven)). Zmiana interpretacji to
tylko - i aż - zmiana punktu widzenia, na inny "swój", albo na jakiś "cudzy". Żeby zaś naprawdę
opanować sztukę zmieniania punktów widzenia, wystarczy nauczyć się *tracić wzrok*.

Również i w tym celu, w dalszych rozdziałach poznamy funktory, które są strzałkami *między
kategoriami*, naturalne transformacje, które są strzałkami *między funktorami*, i może też funktory
sprzężone. Funktorów będziemy używać między innymi do tego, żeby własności kategorii źródłowej,
takie jak obowiązujące w niej twierdzenia, nanosić na kategorię docelową.

Ponieważ funktory służą do operowania jednocześnie więcej niż jedną kategorią, a kategorie to często
pewne odrębne, ogólne systematyczne sposoby myślenia, a więc też pewne generyczne punkty widzenia
albo generyczne interpretacje, będzie to polegało czasem na kontrolowanym dopasowywaniu do siebie
różnych interpretacji. A ponieważ pozwoli nam to ustalać jednoznacznie, czego możemy się dzięki temu
dowiedzieć zarówno o kategorii źródłowej, jak i docelowej, będziemy wtedy de facto odkrywać
*użyteczność interpretacji interpretacji źródłowej w kategoriach interpretacji docelowej*.

<hr>

<br>

Zauważyłaś, że *nic* w świecie nie ma *kierunku* jako *własności własnej*? W szczególności, ta
osobliwa strzałka jest skierowana w określoną stronę *tylko* dlatego, że *my wybraliśmy* kierunek.

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

Ale czy zachowania albo ruchy celowe, tak jak wszelkie wybory, nie mają kierunku jako własności
własnej (ang. [*intrinsic*](https://en.wiktionary.org/wiki/intrinsic))?

Mają kierunek, ale nie jako własność własną, bo mają go tylko w pewnym sensie i zależnie od
kontekstu, bo kierunek jest zawsze *nieunikalny*, a jest taki z konieczności, bo, tak jak ta wyżej
strzałka, kierunek jest *punktem widzenia*. O czym pomówimy jeszcze kiedy indziej. Nawiasem mówiąc,
nawet taki Einstein już dawno to załapał, tyle, że *mniej ogólnie*. Można o tym myśleć też i tak:
Nad każdym naszym ruchem jakby unosi się (jako mnogość możliwych punktów widzenia) nieskończenie
złożona przestrzeń najróżniejszych celów (które zawsze można traktować jako pewne relacje porządku)
i w każdym momencie każdego ruchu i dla każdego celu istnieje miara stopnia, w jakim aktualne
położenie i struktura wewnętrzna naszego ciała realizuje albo spełnia ten cel.

No nie wiem, może, ale z tym odwracaniem relacji mniejsze niż, to tylko powierzchownie odmienny
sposób mówienia, a co się stało, to się nie odstanie, a co ma się stać, to się dopiero stanie.

Otóż to. Twoje, a raczej, nie oszukujmy się, nasze przywiązanie do postrzegania strzałki czasu jako
czegoś, co ma niearbitralny kierunek, wynika całkowicie z naszego *sposobu doświadczania* i
*postawy* wobec *skutków* upływu czasu. Generalnie wolimy mieć wybór, a w każdym razie wolimy mieć
poczucie, że go mamy, a wobec przeszłości nie możemy tego czuć. Skąd wiesz, jak postrzegałabyś
kierunek czasu, gdybyś uświadamiała sobie szczegóły przebiegu zdarzeń tym bardziej, im bardziej
*oddalałyby* się w przeszłość? Twoje życie trwałoby wtedy prawdopodobnie krótko, bo działająca w ten
sposób pamięć byłaby niemal bezużyteczna, ale może czułabyś też, że wraz z gwałtownym umieraniem
stajesz się *coraz mniej sobą* i *spada Ci Się w nicość śmierci*, jakbyś patrzyła w oddalające się
szybko okno studni życia, które coraz bardziej staje się tylko punktem ... światła w tunelu. Zresztą
czas można *sensownie* uporządkować na nieskończenie wiele, również nieizomorficznych sposobów. Na
przykład, można uporządkować nieskończony zbiór punktów czasowych ze względu na stopień zagęszczenia
materii we Wszechświecie, albo można arbitralnie wybrać punkt zerowy i wtedy czas co prawda nie
będzie *płynął* w dwie strony, ale będzie traktowany tak, jakby miał jednocześnie dwa
*kierunki*. Ten rudy meksykanin Ludwik mówi o tym bardzo, hm, jasno i tłumaczy to [krok po
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

Już podstawówce byłem przekonany, że gdy dorosnę, zostanę filozofem. Jak przez mgłę pamiętam
zdziwienie Pani pracującej wtedy za ladą w księgarni Stankiewicz w Bielsku-Białej, kiedy będąc
uczniem szóstej albo siódmej klasy zapytałem, czy jest może "Ludzkie, arcyludzkie" i
"Antychryst". Zanim poznałem odpowiedź, Pani za ladą upewniła się, czy dobrze usłyszała, a gdy po
kilku dniach przyszedłem znowu, miała dla mnie przygotowany zestaw jakiś gazetek, o których sądziła
najwyraźniej, że będę nimi zainteresowany. Bardzo to było miłe, ale zarazem na tyle krępujące, że na
pewien czas przestałem tam przychodzić. Popisywałem się potem na lekcjach religii, wypowiadając -
prawdopodobnie nieznośnym tonem - zdania w rodzaju "Nie istnieje wola nieegoistyczna". Tak, to były
piękne czasy.

Z Nietzschego na szczęście prędko wyrosłem. Chociaż, gdy teraz myslę o tym zdaniu, którym tak
chętnie uraczyłem wtedy Bogu ducha winną katechetkę, muszę mu przyznać rację. I jednocześnie muszę
mu jej odmówić. Tylko z pewnej, trywialnej definicji nie istnieje wola nieegoistyczna, ale Ego może
przyjmować różne formy. A mówiąc dokładniej, może *przyjmować wcielenia Się*. Wola może być związana
z wąsko i krótkowzrocznie pojętym własnym interesem i wtedy stajemy się egoistami *mniejszymi*, albo
może być związana z interesem Wspólnoty; i wtedy nadal jesteśmy, bo zawsze jesteśmy - lecz tylko w
trywialnym znaczeniu tego słowa - egoistami, ale stajemy się wtedy egoistami w dobrym znaczeniu
*większymi*. I to też są, na wskroś i z której by nie patrzeć strony, pewne relacje porządku.

Kiedy jesteśmy *mniejszymi* egoistami, najbardziej krzywdzimy siebie, a raczej nasze ciała, bo
stajemy się wtedy *samotni*, a samotność jest dla nas być może najgłębszą formą cierpienia. I
*wiemy* doskonale, bo żeby to odkryć nie trzeba robić badań naukowych, że właśnie *harmonijne
współdziałanie* jest tym, co zwykle przynosi nam najgłębsze szczęście. Od dziecka pragniemy być
*ważni*, ale gdy próbujemy zaspokoić to pragnienie goniąc za pozycją społeczną i tytułami lub
dobrami materialnymi, to jest starając się głównie, żeby inni nas *zauważali* i żeby się z nami
*liczyli*, zostając sami przekonujemy się szybko, jak bardzo to wszystko jest bezwartościowe. Bo w
samotności *nie da się* być ważnym w jedynym znaczeniu, które się naprawdę liczy, to jest poprzez
niesienie pomocy. I to też jest, na wskroś i z której by nie patrzeć strony, przede wszystkim
psychologia.

W tym sensie [*karma*](https://pl.wikipedia.org/wiki/Karma), to jest *czyn*, *dzieło* albo
*działanie* nie tyle *wraca*, co zwyczajnie *działa*. Na przykład, pisząc tą książkę założyłem, że
tłumacząc, o co chodzi w matematyce i programowaniu, będę o wiele bardziej polegał na języku
naturalnym, niż robią to na ogół nawet Ci bardziej przyjaźni czytelnikom matematycy. To wymagało
wprowadzenia zabiegów językowych, strukturalnych, a czasem literackich, które mnie samemu pomogły
lepiej wiele rzeczy zrozumieć i radość ze stosowania ich tylko zwiększyła motywację do dalszego
pisania. Niedawno postanowiłem sprawdzić, jak mi się teraz czyta starych znajomych i w związku z tym
sięgnąłem po pięknie i ciepło napisane, dostępne za darmo [wprowadzenie do teorii
kategorii](https://www.logicmatters.net/categories/#gentle) Petera Smitha.

Wydaje mi się, że na tym etapie mogłabyś czytać ten tekst dla samej przyjemności rozpoznawania na
nowo spraw, które już w większości nieźle poznałaś, jednocześnie delektując się wyjątkową elegancją
i finezyjnością stylu tego autora. Jednak pewnie pierwszy raz trafiłabyś na wymagającą znacznej
zmiany tempa ścianę najpóźniej na stronie dziesiątej, bo Smith zakłada tam znajomość elementów
teorii grup, których dotąd nie wprowadzałem nawet tylko niejawnie.

Czytając jedno z pojawiających się tam wcześnie zadań zdałem sobie sprawę z innego dobrodziejstwa
(dla mnie!), wynikającego ze specyficznego podejścia, jakie stosuję w tej książce. Smith, jak to
zawodowy matematyk, omawia zwykle tak dowody uchodzące za rutynowe w dużym skrócie. Z jednej strony
chodzi o to, żeby czytelnicy zdobyli się na wysiłek wykonywania ich "w głowie". Ale z drugiej
strony, nie rozpisując szczegółowo na elementarne kroki prostych zadań i zamiast tego polegając na
błyskawicznych ruchach lotnej myśli *uniemożliwiamy* sobie zobaczenie w tych zadaniach czegoś
nowego, bo *tekst* można dowolnie długo obserwować, badać i przekształcać, ale *myśli*
nie. Automatyzacja ma w tym kontekście ważne zalety, bo zwiększa szybkość i poprawność wykonania,
ale jednocześnie utrudnia dostrzeżenie mniej oczywistych analogii. A raz zautomatyzowany sposób
myślenia może być potem trudno zrekonstruować.

Zauważyłem też, że nawet ktoś taki jak Smith korzysta z języka naturalnego głównie w celu rozwijania
ogólnej narracji, a w mniejszym stopniu w celu naświetlania, również *sobie*, różnych aspektów
formalnych konstrukcji i działań. Tracą na tym nie tylko czytelnicy, ale i sam autor, bo nie
korzysta wtedy z możliwości stworzenia nowej, gęstej i aktywnej sieci skojarzeń, której wpływu na
dalsze myślenie nie da się z góry przewidzieć.

No więc taka ta karma. Im bardziej wykorzystuje się swoje najbardziej obiecujące talenty i
kompetencje, żeby przydać się w jakiś sensowny sposób innym, tym bardziej te talenty i kompetencje
rosną i się rozwijają. Bo nic innego nie mają do roboty. I to też jest psychologia.

<hr>

Zamiłowanie do filozofii trwało przez całe liceum i dlatego najpierw zdałem właśnie na
filozofię. Być może częściowo z powodu skutków, do których prowadziło w kolejnych latach połączenie
mojej wrodzonej prokrastynacji i lekkomyślności z elastycznością terminów zaliczeń, jaką
charakteryzowało się wtedy studowianie na tym kierunku na UJ, ale przypuszczam, że przede wszystkim
z innych, głębszych przyczyn, któregoś dnia, czytając w księgarni opis na obwolucie jakiejś książki
wydanej przez [wydawnictwo Aletheia](https://www.aletheia.com.pl/) poczułem nagłą pewność, że nie
mam już do tego serca i tak trafiłem na psychologię.

Dopiero niedawno zacząłem wracać, rzadko i z pewną nieśmiałością, do tego typu literatury i wygląda
na to, że w najbliższej przyszłości będę z niej korzystał częściej i bardziej intensywnie. Uprzedzam
więc, że w kolejnych rozdziałach mogą się z tego powodu pojawiać fragmenty jeszcze dziwniejsze i
bardziej żenujące niż dotychczas. Takie jak ten, od którego zaczyna się następna część tego
rozdziału.

Ponieważ ten rozdział jest znacznie dłuższy niż wszystkie poprzednie, pozwolę sobie zapytać, czy
pamiętasz, żeby używać minutnika i unikać czytania bez przerw dłużej niż przez pół godziny?  Jeżeli
tak lub nie, to zapraszam [tutaj](./R35__Sprzatajac_pod_lasem.md).

### Przypisy

[^1]: Gdy zadzwoniłem do Tomka, żeby złożyć mu życzenia urodzinowe i powiedziałem, że już po raz
    drugi cytuję go w tej książce, poprosił, żeby Was pozdrowić. No to przekazuję pozdrowienia.

[^2]: Ten przykład poznałem dzięki wspaniałej książce Eugenii Cheng [*The Joy of
    Abstraction*](https://eugeniacheng.com/), którą już polecałem i która mnie bardzo
    zainspirowała. Zdaje się nawet, że pod niejednym względem mocno wpłynęła na charakter tego, co
    właśnie czytasz. Niedawno zobaczyłem na YouTube dyskusję, w której Eugenia wzięła udział i
    dowiedziałem się dzięki temu, że chociaż zajmuje się zawodowo teorią kategorii, ucząc się jej i
    w ogóle studiując matematykę raczej *unikała zadań*. W dodatku w tej dyskusji powiedziała w
    pewnym momencie, że *there is no should* i że *we do not understand anything*; nic dziwnego, że
    jestem fanboyem. [Dyskusję](https://www.youtube.com/live/jJj3psZsGTk?si=WWD1T3LaiWSpYK8M) otwarł
    zresztą wspaniały [David Spivak](https://en.wikipedia.org/wiki/David_Spivak), którego znakomita
    książka [*Category Theory for the
    Sciences*](https://mitpress.mit.edu/9780262028134/category-theory-for-the-sciences/)
    zainspirowała mnie do wymyślenia przykładu z monoidem jako grą w węża.

[^4]: A po angielsku i bawiąc się znaczeniami - *Correctness is the order of psychology*.

[^5]: Drugie zdanie na tej stronie to, cytuję, "Z naukowego punktu widzenia kolor jest wyrażeniem
    światła" i moim zdaniem to jest słodkie.

[^6]: A więc wtedy właściwie nie jakiś, bo zbiór pusty jest unikalny. Dlatego, *od momentu, w którym
    udowodnimy tą unikalność*, możemy bez zastrzeżeń mówić po angielsku *the empty set* zamiast *an
    empty set*, a po polsku *ten* zbiór pusty

[^7]: Chociaż, jak zauważył kiedyś mój przyjaciel Szymon Szymczak, historia to (często) polityka
    uprawiana wstecz.
