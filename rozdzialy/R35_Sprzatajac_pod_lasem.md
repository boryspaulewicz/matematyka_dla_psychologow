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

<hr>

Gdy zbiór jest (jakimkolwiek) *singletonem*, również można na nim zdefiniować tylko jeden porządek,
który co prawda nie jest wtedy pusty, ale też jest trywialny. Tą trywialność od razu widać z
perspektywy kategoryjnej, bo porządek na singletonie rozumiany jako cienka kategoria sprowadza się
do pojedynczej identyczności. A więc porządek na singletonie jest tym samym, co *obiekt bez
właściwości*.

Gdy jednak elementy są *dwa*, możliwych porządków jest więcej. *Dwa* z tych porządków, będące swoimi
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
który to porządek, postrzegany jak kategoria, jest dokładnie *strzałką*.

Gdy nie ma nic, nic nie może się wydarzyć i ani nie ma o czym mówić, ani nie ma Nikogo, kto mógłby o
czymś mówić. Gdy jest tylko jedno coś i nic więcej nie ma, wtedy wszystko, co jest, jest tym jednym
czymś i nie ma żadnej nietrywialnej struktury; a więc również nie ma o czym mówić, ani nie ma
Nikogo, kto mógłby o czymś mówić. I wtedy *też* jest tak, jakby nic nie było. Obiekt początkowy i
obiekt końcowy to *jedno* i to samo pojęcie postrzegane z dwóch *dualnych* perspektyw. Nie każda
kategoria ma jednak początek i koniec. Tam, gdzie istnieją jakieś *dwa* obiekty, pojawia się
*różnica*. A gdy *jedynymi dwoma* obiektami są obiekty początkowy i końcowy, istnieje dokładnie
*jedna* nietrywialna strzałka. W matematyce, tak jak w psychologii, wszystko sprowadza się
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
jest *nieaktualne*. Albo, mówiąc inaczej, ale *celowo* tak - cel i zadanie są wtedy *spełnione
pusto*.

Zastanawiasz się może, po czym w takim razie poznajemy, że coś jest próbą albo interwencją? To moim
zdaniem doskonałe pytanie okazuje się zaskakująco głębokie. Dlatego w tym momencie powiem tylko
tyle, że w pewnym sensie *po niczym*.

Jeżeli tylko nieznacznie uogólnimy pojęcie *ruchu*, będzie natychmiast jasne, że *każdy* akt
zachowania jest, między innymi, procesem motorycznym, tylko niektóre z nich, a konkretnie zachowania
*mentalne*, polegają na ruchu (nie mylić z *poruszaniem się*) głównie *wewnątrz ciała*. Jeżeli to
uogólnienie Ci nie odpowiada, to zwróć proszę uwagę, że nie jest wewnętrznie sprzeczne, a wobec
tego, jak każdy *wybór pojęciowy*, podlega *naszej* (muszę się tu powołać na *hipotetyczną wspólną
normę*) ocenie *tylko* ze względu na to, do czego się przydaje, ...

... a *warto* dokonać tego moim zdaniem naturalnego uogólnienia, bo dzięki niemu można zobaczyć
wyraźniej coś, co bardzo długo umykało mojej uwadze. Pouczający może być też powód, dla którego tak
długo nie udawało mi się tego dostrzec. Byłem mianowicie od dawna przekonany, że istnieje jakaś
fundamentalna różnica między *zachowaniami zwierząt* z jednej strony, a *sposodem działania
urządzeń* i wszelkiego rodzaju *narzędzi* czy *mechanizmów* z drugiej. Wydawało mi się na przykład,
że ta różnica może polegać na *wyuczalności* zachowań, z której wynika ich wyjątkowa adaptacyjna
plastyczność i której nie widać w typowych urządzeniach, narzędziach, czy wszelkiego rodzaju
zwykłych mechanizmach.

Proszę, nie zrozum mnie źle. Nie uważam, że zwierzęta są urządzeniami i niczym więcej. Na pewno nie
*dla nas*, bo *współczujemy* zwierzętom, a współczujemy im nie dlatego, że postrzegamy je jako byty
*autonomiczne*, bo to jest warunek oceny *moralnej*. Współczujemy im dlatego, że wszystkie zwierzęta
*cierpią*. Najbardziej tym, które należą do tego samego gatunku, ale zdecydowanie [nie tylko
im](https://pl.wikipedia.org/wiki/Karuna). Z roślinami, owadami, grzybami, mikrobami i niektórymi
formami życia bywa pod tym względem, jak wiadomo, bardzo różnie.

Natomiast nie bardzo współczujemy urządzeniom. A kiedy czasem do pewnego stopnia współczujemy
niektórym urządzeniom, zwłaszcza tym, do których jesteśmy w jakiś sposób *przywiązani*, mamy do
takich reakcji pewien dystans, którego nie mamy w stosunku do własnego współczucia wobec
zwierząt. Zwierzęta zdecydowanie *nie* są więc (dla nas) po prostu urządzeniami, bo z naszej
ludzkiej i jednocześnie *wspólnej* (to nie to samo) perspektywy, zwierzęta *zasługują* na
współczucie. I szacunek.

Ale **zachowanie**, ten centralny przedmiot zainteresowania psychologii, to dokładnie *działanie
celowe*, albo - po dokonaniu uogólnienia już równoważnie - *celowy ruch*; nic mniej i nic
*więcej*. Własność wyuczalności przysługuje (w szczególny sposób, o czym później) pewnym celowym
ruchom, a dokładniej pewnym *sekwencjom ruchów*, co sprawia, że te ruchy są dla nas automatycznie
interesujące, a często wręcz przykuwają naszą uwagę i automatycznie widzimy w nich coś w rodzaju
autonomii (pamiętasz tamtą mysz?). Ale celowość występuje w sposób oczywisty również w nie uczących
się narzędziach, urządzeniach, mechanizmach i wszelkich innych artefaktach, takich jak dzieła
sztuki.

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
Wspaniała Dwójka (dziewczyn) rodzi najwięcej zastosowań niemal *z definicji*. Nasza Płodna Para ma
dokładnie jednego rodzica, Matkę psychologię, która pilnuje, żeby Dzieci się zachowywały. A Ojciec
albo się ulotnił, albo nigdy go nie było i jako Ten Nieistniejący spełnił swój rodzicielski
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

Wróćmy już może do strzałki.

## ∘ ⟶ ⊙

Pojedyncza strzałka jako kategoria, czyli `I → T`, gdzie `I` to z konieczności obiekt początkowy
(*initial*), a `T` to z konieczności obiekt końcowy (*terminal*), jest więc, między innymi, a może
nawet przede wszystkim, Oceną. Źródło tej strzałki można rozumieć jako czystą abstrakcję: zbioru
pustego, typów `False` i `Empty`, i w ogóle wszelkich struktur będących Bezcielesnymi Sposobami. Jej
cel można postrzegać jako Atom albo Element Bez Właściwości, a więc materię jako taką. A skoro to są
obiekty początkowy i końcowy dokładnie dlatego, że pierwszy emituje dokładnie jedną strzałkę do
wszystkich obiektów, a drugi przyjmuje dokładnie jedną strzałkę od wszystkich obiektów, to tym, co
*czyni* je w tej Elementarnej - choć, jak zobaczymy później, nie będącej końcową - kategorii
początkiem i końcem, jest Celowość Strzałki o typie:

```lean
Skierowanie : Celowości → Materię
```

Albo: Kierunek (jako taki), który jest możliwy dzięki istnieniu (jako takiej) Różnicy.

Zauważyłaś, że *nic* w świecie nie ma *kierunku* jako *własności własnej*? Nawet ta strzałka jest
skierowana w określoną stronę *tylko* dlatego, że *wybraliśmy* kierunek.

<br>

A czas? Czas płynie przecież w jedną stronę.

W którą?

Każda chwila mija i oddala się coraz bardziej w przeszłość.

I to jest *jedyny* kierunek, w którym płynie Twoim zdaniem czas?

No tak.

Zacznijmy może od tego, że mówiąc o oddalaniu się korzystamy tu jednocześnie co najmniej z *dwóch*
bardziej abstrakcyjnych pojęć, poza pojęciem czasu - z pojęcia porządku i z pojęcia
[*odległości*](https://pl.wikipedia.org/wiki/Przestrze%C5%84_metryczna). Ponadto, aby czas płynął,
jak mówisz, wstecz, Ty musisz płynąć w czasie do przodu i *to* już jest relacja *logiczna*, a nie na
przykład *przyczynowa*. Nie wydaje Ci się, że dobrze jest szybko zauważać takie subtelności
pojęciowe? Wracając zaś do tego, co wydaje mi się główną intencją Twojego pytania (jeżeli Cię źle
zrozumiałem, to popraw mnie proszę), czemu nie można o tym myśleć jako o *spadaniu* w czasie? Wtedy
czas płynąłby w górę, a my spadalibyśmy w dół. Pamiętasz dualność relacji `<` i `>`?

...

Ok, nigdzie nam się nie spieszy. Słyszałaś może o liczbach urojonych? `i² = -1` i `(-i)² = ((-1) *
i)² = (-1)² * i² = 1 * i² = i² = -1`, więc trzeba *wybrać*, które $i$, to jest `i` czy `-i`, jest
`i`, bo te dwa $i$ są funkcjonalnie równie dobrymi kandydatami, a nie mogą być tą samą liczbą, nawet
jeśli "tylko" urojoną[^2].

Ale czy zachowania albo ruchy celowe, takie jak wszelkie wybory, nie mają kierunku jako własnej
(ang. [*intrinsic*](https://en.wiktionary.org/wiki/intrinsic)) własności? 

Mają kierunek, ale nie jako własność własną, bo mają go tylko w pewnym sensie i zależnie od
kontekstu, bo kierunek jest zawsze *nieunikalny*, a jest taki z konieczności, bo, tak jak ta wyżej
strzałka, *kierunek jest punktem widzenia*. O czym pomówimy kiedy indziej. Nawiasem mówiąc, nawet
taki Einstein już dawno to załapał, tyle, że *mniej ogólnie*. Można o tym myśleć też i tak: Nad
każdym naszym ruchem jakby unosi się (jako mnogość punktów widzenia) nieskończenie złożona
przestrzeń najróżniejszych celów (które zawsze można traktować jako pewne relacje porządku) i w
każdym momencie każdego ruchu i dla każdego celu istnieje miara stopnia, w jakim aktualne położenie
i struktura wewnętrzna naszego ciała realizuje albo spełnia ten cel.

No nie wiem, może, ale z tym odwracaniem relacji mniejsze niż, to jest tylko taki sposób mówienia, a
co się stało, to się nie odstanie, a co ma się stać, to się dopiero stanie.

Otóż to. Twoje, a raczej, nie oszukujmy się, nasze przywiązanie do postrzegania strzałki czasu jako
czegoś, co ma niearbitralny kierunek, wynika całkowicie z naszej *postawy* wobec *skutków* upływu
czasu. Generalnie wolimy mieć wybór, a w każdym razie wolimy mieć poczucie, że go mamy, a wobec
przeszłości nie możemy tego czuć. Skąd wiesz, jak postrzegałabyś kierunek czasu, gdybyś uświadamiała
sobie szczegóły przebiegu zdarzeń tym bardziej, im bardziej *oddalałyby się* w przeszłość? Twoje
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
zdziwienie Pani pracującej wtedy za ladą w księgarni Stankiewicz w Bielsku-Białej, gdy będąc uczniem
szóstej albo siódmej klasy zapytałem, czy jest może "Ludzkie, arcyludzkie" i "Antychryst". Zanim
usłyszałem odpowiedź, Pani za ladą upewniła się, czy dobrze usłyszała, a gdy po kilku dniach
przyszedłem znowu, miała dla mnie przygotowany zestaw jakiś gazetek, o których sądziła najwyraźniej,
że będę nimi zainteresowany. Bardzo to było miłe, ale zarazem na tyle krępujące, że na pewien czas
przestałem tam przychodzić. Popisywałem się potem na lekcjach religii, wypowiadając - prawdopodobnie
nieznośnym tonem - zdania w rodzaju "Nie istnieje wola nieegoistyczna". Tak, to były piękne czasy.

Z Fryderyka N. prędko wyrosłem, ale zamiłowanie do filozofii trwało przez całe liceum i dlatego
najpierw zdałem właśnie na filozofię. Być może częściowo z powodu tego, jakie to coraz gorsze efekty
w kolejnych latach dawało połączenie mojej prokrastynacji i lekkomyślności z ogromną elastycznością
terminów zaliczeń, jaką charakteryzowało się wtedy studowianie na tym kierunku na UJ, ale wydaje mi
się jednak, że przede wszystkim z innych, głębszych powodów, któregoś dnia, czytając w księgarni
opis na obwolucie jakiejś książki wydanej przez [wydawnictwo Aletheia](https://www.aletheia.com.pl/)
poczułem nagłą i niespodziewaną pewność, że nie mam już do tego serca. I tak trafiłem na
psychologię.

Dopiero niedawno zacząłem wracać, rzadko i z pewną nieśmiałością, do tego typu literatury i wygląda
na to, że w najbliższej przyszłości będę z niej korzystał częściej i bardziej intensywnie. Uprzedzam
więc, że w kolejnych rozdziałach mogą się z tego powodu pojawiać fragmenty jeszcze dziwniejsze i
bardziej żenujące niż dotychczas. Takie jak ten:

## [Potężna Piątka](https://kungfupanda.fandom.com/wiki/Furious_Five)

Najpierw biologia. Od tylu już lat badania neuropsychologiczne są postrzegane przez wielu jako te
relatywnie "twarde" i "naukowe", z dwóch oczywistych powodów. Mózg steruje zachowaniem, a biologia
jest (póki co) daleko bardziej zaawansowaną nauką niż psychologia, ma znacznie więcej doniosłych
zastosowań i przedmiot jej badań często o wiele łatwiej jest obserwować w kontrolowanych warunkach i
często o wiele ławiej jest dokonywać na nim precyzyjnych interwencji eksperymentalnych. A z drugiej
strony, nadal nie udało się na przykład znaleźć choćby *jednego* markera biologicznego
*jakiegokolwiek* zaburzenia psychicznego.

Coś tam wiemy na temat neuronalnych mechanizmów *bardzo wczesnych* etapów prercepcji i coś tam też
wiemy na inne podobne tematy, ale poza tym wpływ neurpsychologii na psychologię jest jak dotąd tak
nikły, że gdy ta pierwsza pojawia się w podręcznikach dotyczących tej drugiej, prawie zawsze pojawia
się jak jakiś kwiatek u kożucha - taka (dla niektorych ekscytująca) ciekawostka, którą trudno w
jakikolwiek sposób znacząco zintegrować z wiedzą na temat *zachowania*. Ciekawostka typu coś tam się
*może* świeci w pewnych obszarach bardziej niż w innych, gdy ludzie wykonują jakieś sztuczne, proste
zadanie w takich a takich *dziwacznych* warunkach. A pieniądze i w ogóle różne zasoby poszły na tego
rodzaju badania do tej pory ogromne.

Dlaczego tak (żałośnie) słabo mimo, że tak (kosmicznie) drogo i - wydawało by się a priori
niektórym - tak obiecująco? Nie tylko moim zdaniem dlatego, że mózg jest ekstremalnie złożony,
działa w sposób idiosynkratyczny, jest niestacjonarny i w ekstremalnym stopniu zależny od przebiegu
dotychczasowej interakcji zwierzęcia ze środowiskiem. My to wszystko od dawna *wiemy*, tylko
najwyraźniej *nie wyciągamy z tego wniosków*. Niestety, tego rodzaju bezwładność w nauce to nic
nowego.

Nie ulega natomiast wątpliwości, że *biologia* zajmuje się czymś, co do przedmiotu zainteresowań ani
fizyki, ani nawet chemii *nie* należy, to jest *życiem*, postrzeganym *przede wszystkim* jako
pewnego rodzaju *mechanizm*. Dlatego biolog bez zająknięcia się powie na przykład, że *funkcją*
serca jest pompowanie krwi i tą własność serca będzie traktował jako kluczową. A jest tego rodzaju
własność dla biologa kluczowa, bo centralnym pojęciem biologii jest dychotomia i jednocześnie
porządek określony na zbiorze dwuelementowym, a więc strzałka, *od* śmierci *do* życia. To
jednocześnie niezły moim zdaniem przykład ilustrujący arbitralność kierunku strzałki czasu, bo ta
strzałka jest skierowana *ku przeszłości*.

Biolog traktuje życie jako *lepsze* od śmierci, bo inaczej nie postrzegałby na przykład właśnie
serca jako czegoś, co *w określony sposób*, to jest pompując krew, *służy przeżywaniu*. Gdyby nie o
to chodziło, serce byłoby *przede wszystkim* czymś *innego rodzaju*. Na przykład czymś, co *zajmuje
określone miejsce* w organiźmie, albo co *emituje pewną ilość ciepła* w trakcie pracy, i tak
dalej. A nie jest; serce jest *tym, co pompuje krew*. I biologia jest więc subdyscypliną
psychologii, jak zresztą wszystkie inne nauki, z deskryptywnie trafnej definicji.

Natomiast filozofia jest wyraźnie *inna* od całej reszty. Z jednej strony uprawianie filozofii
polega na zajmowaniu się tak zwanymi pytaniami podstawowymi albo ostatecznymi, takimi jak pytania o
naturę i granice *poznania w ogóle*, albo pytania o *byt w ogóle* i o *wartości w ogóle*. Dosyć to
niesamowite. I jednocześnie charakterystycznie *nieczytelne*, ale *nie* w złym znaczeniu.

Teoria kategorii uczy nas, że jeżeli obiekt pewnego rodzaju, taki jak dajmy na to iloczyn
kartezjański zbiorów, jest ważny - a filozofia, ta zawodowa i ta amatorka, jest niewątpliwie dla
wielu z nas, ludzi (czasem nawet bardzo) ważna - to warto przynajmniej próbować znaleźć powód tej
ważności, przyglądając się, dotyczącym przypuszczalnie ważnych własności tego obiektu, *relacjom
między tym obiektem a innymi obiektami tego samego rodzaju*. 

Ale nie chodzi tu o *jakiekolwiek* relacje, bo taka wskazówka byłaby bezużyteczna. Poszukujemy wtedy
perspektywy, z której danego rodzaju obiekt jest w jakimś sensie najlepszym albo ekstremalnym
przypadkiem czegoś ogólniejszego, czyli jest *przypadkiem granicznym* albo wręcz *samą granicą*. I
tak, iloczyn kartezjański zbiorów jest, jak zobaczymy później, obiektem końcowym (to właśnie pewna
granica, ...) w kategorii diagramów złożonych z par współźródłowych strzałek (... a to są obiekty
tego samego rodzaju). Co więcej, właśnie *ta* własność charakteryzuje w pewnym sensie to, co w
iloczynie kartezjańskim jest najważniejsze, a więc w pewnym sensie jego "istotę" albo "prawdziwą
naturę".

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

Zgaduję, że gdy literaturoznawca pisze tekst naukowy na temat na przykład jakiegoś dzieła
literackiego, powstający w ten sposób tekst naukowy nie musi być potem, w ogólnym przypadku, czytany
w oryginale, bo można zawarte tam główne treści przekazać na wiele sposobów niewiele przy tym
tracąc. W przypadku filozofii nie ma tak wyraźnej różnicy między interpretacją tekstu źródłowego i
tekstem źródłowym, bo teksty filozoficzne, w każdym razie te *ważne*, które są wynikiem
filozoficznej interpretacji i analizy innych tekstów filozoficznych, *same wymagają filozoficznej
interpretacji i analizy*. Czy nie wygląda Ci to na robotę tego miglanca Urobora? Dlaczego tak jest?
I po co?

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
się wyobrębni, tak jak teraz wyobrębnia się z niej psychologia, prędko staje się autonomiczna i
zwykle (jako dyscyplina, nie jako uprawiający ją ludzie) ewidentnie filozofii *przestaje
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

I teraz mogę już odetchnąć i wrócić do
[rozpracowywania](https://youtu.be/PQLySgRW6y8?si=DkOxgyHo44cJeYlv) porządków.

## Porządki to przede wszystkim *hierarchie*

Gdy prosimy osobę partnerską, żeby zrobiła nam herbatę, rozpoczynamy proces, który zakończy się albo
sukcesem, albo porażką. No ale to nie jest oczywiście takie proste, bo osoba partnerska może nas nie
usłyszeć, albo usłyszeć błędnie i zamiast herbaty przynieść nam (jakieś czyjeś) papiery
rozwodowe. Albo możemy dostać herbatę, ale nie taką, jaką chcieliśmy. Albo w "złym kubku". Albo może
być tak, że pod względem herbaty i jej otrzymania można powiedzieć, że pełen sukces, ale zaraz po
otrzymaniu osoba partnerska mówi nam, że musimy poważnie porozmawiać, a potem, że to nie jesteśmy
my, to jest ona. Wtedy dostajemy niby taką herbatę, jaką chcieliśmy, ale jednocześnie jednak -
uświadamiamy sobie dopiero po fakcie - funkcjonalnie nie taką, jaką "naprawdę" chcieliśmy, to jest
czarną popołudniową herbatę pocieszającą.

Tego rodzaju wieloaspektowa ocenialność skutków różnych działań (a dokładniej prób) to moim zdaniem
samo serce psychologii. Współczesny psycholog mógłby powiedzieć, że to nie jest naukowe, bo to
jakieś podejrzane rezultaty *introspekcji*, której współczesna "naukowa" psychologia od dawna już
nie akceptuje jako metody "naukowej". No tak, ale to przecież w oczywisty sposób *nie* są rezultaty
introspekcji, tylko *zmyślenia*. Ze względu na ich szczególną rolę nie ma znaczenia, skąd się te
zmyślenia wzięły. W *żadnym* miejscu nie korzystam z założenia, że któreś z tego rodzaju zmyśleń, a
dokładniej *ocennych perspektyw*, jest *prawdą*.

*"Ja" jest punktem widzenia.*

Za wcześnie za daleko? A, to przepraszam.

Albo weźmy skądś jakieś [jabłka i pomarańcze](https://en.wikipedia.org/wiki/Apples_and_oranges), ale
nie jedzmy ich od razu, tylko najpierw się im poprzyglądajmy. Co to za bzdury z tym "nie da się
porównać"? Jeden z tych owoców jest przecież w oczywisty sposób obiektywnie lepszy od drugiego,
szczególnie, gdy mamy na niego ochotę. Średni okres wegetacji drzew jabłoni i drzew pomarańczy jest
porównywalny, a to też są własności jabłek i pomarańczy odpowiednio. Gdyby jabłko jako takie i
pomarańcza jako taka były kategoriami, to jedna z nich miałaby ... Ale chyba już wiesz, o co mi
chodzi.

Wróćmy do - pozornie luźno związanej z tematem - filii w Radomiu, o której mówiliśmy w poprzednim
rozdziale. Załóżmy, że nowe budynki są `2`, a wydziały są `3`, za to liczba pięter (też `3`) zgadza
się z liczbą poziomów hierarchii władzy. Naturalnie byłoby wtedy mapować injektywnie liniowy
porządek szczebli władzy na porządek pięter, ale pracownicy jakiś dwóch wydziałów musieliby pracować
w tym samym budynku, *to* mapowanie byłoby więc *nie*injektywne, za to byłoby (tak jak poprzednie)
surjektywne.

**Powtórka z pojęcia kategorii generowanej przez graf**: Przypominam, że same grafy to jeszcze nie
kategorie, bo graf jako taki to tylko pewnego rodzaju "statyczny rysunek", który *nie* jest
wyposażony w działanie składania strzałek. Dlatego, gdy odtąd o jakimś grafie będę mówił jako o
kategorii, będzie mi chodziło zawsze o (unikalną, dlatego ten sposób mówienia jest akceptowalny)
kategorię *generowaną* przez ten graf.

Na przykład, *graf* `A → B → C` generuje kategorię, której 1. obiektami są węzły grafu (tutaj `A`,
`B` i `C`), a 2. strzałkami są 2.1. identyczności odpowiadające dokładnie węzłom grafu,
2.2. strzałki grafu i 2.3. wszystkie złożenia, które trzeba 2.3.1. *dodać* tam, gdzie występują pary
składalnych strzałek grafu, 2.3.2. i tam, gdzie na skutek tego procesu pojawiły się *nowe* pary
składalnych strzałek. A więc na przykład graf `A → A` generuje kategorię z jednym obiektem i
*nieskończoną* liczbą strzałek. Ten przykład może być na tym etapie trudny, ale będzie ważny, niech
więc na razie tu zostanie i kusi. Podobnie, zgodnie z jednym z grafów omawianych dalej, istnieje
między innymi (kategoryjna) strzałka `Boss_wydzialowy → Nikt_wazny`, będąca złożeniem dwóch strzałek
widocznych na tym grafie, a poza tym każdy jest Panią samego siebie ("dosypane" identyczności
obiektów/węzłów, oznaczających stanowiska w firmie).

Przypominam, że można myśleć o tego rodzaju konstrukcjach na następujące dwa sposoby, z których
jeden może być mniej stresujący niż drugi: Możemy myśleć o takich konstrukcjach jako o *rezultatach
procesu* dokładania jakiś rzeczy (tutaj strzałek) spełniających jakieś warunki (tutaj składania
kategoryjnego). Z jednej strony ten sposób myślenia daje chyba wrażenie konkretności albo dynamiki,
czy nawet "ożywienia", ale z drugiej może wywołać poczucie, że to wszystko nie mieści nam się w
głowie, zwłaszcza, gdy te konstrukcje są "duże" lub nieskończone. Drugi sposób polega na myśleniu o
takich konstrukcjach jako o *listach kryteriów*, które spełnia każda konstrukcja danego rodzaju. Z
tej perspektywy operujemy *tylko* krótką listą kryteriów, które spełnia kategoria generowana przez
graf i których spełnienie gwarantuje unikalność takiej kategorii. Dopóki nie zajdzie taka potrzeba,
nie trzeba próbować wyobrażać sobie szczegółowo takiej kategorii; trzeba tylko albo pamiętać te
kryteria, albo umieć je znaleźć.

Poniżej mamy kategorię `Pracownicy`. Na tym diagramie, poprzedzonym czymś w rodzaju "preambuły"
definiującej typowanie - a więc i tu pomieszałem dwa różne języki, z których jeden (mikrojęzyk
dziedzinowy) właśnie wymyśliłem - strzałka oznacza bezpośrednie zwierzchnictwo. Żeby było ciekawiej,
ten diagram *nie* jest grafem generującym kategorię, o którą nam chodzi, tylko (przedstawioną w
zarysie) kolekcją strzałek, z których taki graf można w narzucający się sposób złożyć. Uzyskany w
ten sposób graf będzie miał między innymi *ścieżkę* `Dżessika → Monika → Stefan`. Czyli to akurat
jest *diagram generujący graf generujący kategorię*.

```
-- Preambuła

Pracownik, Wydzial : Type

A, B, C : Wydzial

Jest_w_wydziale : Pracownik → Wydzial → Prop

Robert, Danuta, Mieszko, Dżessika, Stefan, Monika, ... : Pracownik

∀ x ∈ {Robet, Danuta, Mieszko}, Jest_w_wydziale x A

...

--- Diagram

Dżessika → Danuta

Dżessika → Monika

Danuta   → Robert

Danuta   → Mieszko

Monika   → Stefan

...
```

Istnieje naturalne (ale nie w znaczeniu naturalnej transformacji, tylko w znaczeniu potocznym,
zbliżonym do intuicyjne) mapowanie pracowników na kategorię hierarchii władzy ...

```
Boss → Boss_wydzialowy → Ktos_kto_jest_mily_tylko_wobec_boss_wydzialowy → Nikt_wazny
```

... i istnieje też naturalne mapowanie hierarchii władzy na kategorię piętra budynków `3 → 2 →
1`. Byłbym zapomniał, że Osoba Szefowska pracuje z domu! Dlatego w tym kontekście interesuje nas
kategoria taka jak wyżej, ale bez obiektu początkowego (czyli takiego jakby najmniejszego albo,
przynajmniej potencjalnie, pustego w środku) `Boss`:

```
Boss_wydzialowy → Ktos_kto_jest_mily_tylko_wobec_boss_wydzialowy → Nikt_wazny
```

Mamy też szczegółową kategorię budynków, której obiektami są pokoje, a strzałki na *generującym ją
grafie* reprezentują fakty bycia bezpośrednio nad jakimś pokojem w tym samym budynku. Oboje wiemy,
że mogłabyś policzyć, ile jest tych strzałek, albo narysować tą kategorię w postaci generującego ją
grafu i oboje wiemy, że nikomu by się nie chciało, więc nie będę nic sugerował.

Istnieje naturalne mapowanie kategorii pokojów (pokoi? no nie, to chyba po rosyjsku) na ogólniejszą
kategorię budynków, w której obiektami są tylko piętra budynków. Ta kategoria jest generowana przez
graf:

```
Andromeda(3) → Andromeda(2) → Andromeda(1)

Oasis(3) → Oasis(2) → Oasis(1)
```

Budynek jest tutaj traktowany jako *funkcja* o nazwie takiej, jak nazwa budynku, która to funkcja
zwraca *piętra*. Bo czemu nie?

Wreszcie, istnieje naturalne mapowanie tej ostatniej kategorii na kategorię jeszcze ogólniejszą, w
której obiektami są numery pięter, a strzałki oznaczają fakty zachodzenia relacji `≥`, to jest
kategorię generowaną przez graf `3 → 2 → 1`. No i istnieje jedyne możliwe mapowanie tej ostatniej
kategorii na kategorię końcową, zawierającą jeden obiekt `Cos`, wyposażony tylko w strzałkę
identyczności, ale to mapowanie jest trywialne z definicji, bo jest mapowaniem do obiektu końcowego
(akurat tutaj w kategorii kategorii), a takie strzałki są tym samym, co obiekty kategorii
(pomyślałaś o tym wcześniej?), o ile oczywiście kategoria ma jakiś koniec (kategoria kategorii ma).

Ważną cechą niektórych z tych porządków, ale nie wszystkich, jest to, że pewne elementy (nie wypada
mówić tak o ludziach, bo to obraźliwe określenie, ale moje ręce są związane terminologią techniczną)
są w tym samym porządku albo, równoważnie, w tej samej cienkiej kategorii *nieporównywalne*.

**Mały słownik sprzątacza**: Czuję, że teraz już muszę powiedzieć więcej o samej
terminologii. Relacje (`R ⊆ X × X`) zwrotne (`∀ x : X, x R x`) i przechodnie (`∀ x y z : X, x R y →
y R z → x R z`) nazywamy *praporządkami*, a po angielsku (spolszczając) *preorderami*. Praporządki
to dokładnie cienkie kategorie, w których mogą występować pary różnych obiektów izomorficznych albo,
mówiąc równoważnie, kategorie cienkie, w których mogą występować strzałki przeciwrównoległe nie
będące identycznościami. Nie mam pojęcia, który sposób myślenia jest dla Ciebie w tym momencie
wygodniejszy, ale możliwe, że *rysunkowy*, dlatego zachęcam do prób oswojenia się z tą terminologią
(bo to jest niemal w całości tylko gęsta \{i zarazem niezwykle użyteczna\} terminologia, dotycząca
bardzo prostych zjawisk, którą wystarczy w miarę dobrze zapamiętać) za pomocą rysunkowej notatki.

Relacje częściowego porządku to praporządki antysymetryczne (`∀ x y : X, x R y → y R x → x = y`),
czyli relacje takie jak relacja `≤`, określona na jakimś zbiorze liczb: Jeżeli `x ≤ y` i `y ≤ x`, to
`x = y`. Takie relacje są tak ważne, wygodne w użyciu i częste, że nazywamy je też po prostu
porządkami i odtąd ja również będę tak czasem mówił. Po angielsku (spolszczając) często nazywamy
takie porządki *posetami*.

Ani preorder ani poset nie musi być porządkiem *liniowym*, takim jak naturalny porządek na zbiorze
liczb naturalnych, o których zresztą często myślimy, że układają się w linię, która ma początek, ale
nie ma końca. Porządek liniowy to poset, w którym *porównywalna* jest *każda* para elementów (`∀ x
y : X, x R y ∨ y R x`). W ogólnym przypadku zarówno preordery jak i posety mogą się składać z
*oddzielnych* [drzew](https://pl.wikipedia.org/wiki/Drzewo_(informatyka)) (rozumianych jako pewien
typ danych), reprezentujących te porządki w oczywisty sposób, przy czym preordery mogą mieć węzły
połączone dwukierunkowo w poziomie, a posety nie.

Może jeszcze jeden przykład przed *główną* sugestią. Opiszę go celowo w dużym skrócie, żebyś miała
okazję spróbować go rozpakować i samodzielnie rozwinąć. W kategorii *ubierania się* obiektami są
*ogólnie* scharakteryzowane zestawy nałożonych na własną osobę elementów ubioru, takie jak (jakaś)
bluzka + (jakieś) spodnie + (jakaś) czapka + jakieś (skarpetki). Ponieważ musimy mamy działanie
składania, strzałkami są *konkretne egzemplarze* lub *sekwencje* ubrań, a więc składanie można
rozumieć jako proces konstruowania *ścieżek ubierania się*. Struktura tej kategorii odzwierciedla
ograniczenia tego procesu. Na przykład, (idealizując) nie da się ubrać [najpierw butów, a potem
skarpet](https://math.oxford.emory.edu/site/math108/socks_and_shoes/).

W przypadku większości ludzi mieszkających w Polsce, ta kategoria *nie* będzie cienka, bo będzie na
przykład (miejmy nadzieję) istniała więcej niż jedna strzałka zakładania pary skarpet. Można jednak,
całkiem sensownie, zignorować różnice między niektórymi równoległymi strzałkami, uzyskując w ten
sposób strzałki reprezentujące ogólne części ubioru (ale czy tylko? warto rozważyć *mały*
przykład). Przekształcenie jakiejś struktury (niekoniecznie kategorii), polegające na *zrównaniu*
albo "sklejeniu" pewnych jej części *z zachowaniem struktury ogólnej* Lawvere lubił nazywać
przekształceniem *osobliwym*[^6]. Moim zdaniem to jest piękne słowo, więc na cześć Lawvere'a też tak
będziemy mówić.

**Pomniejsza sugestia**: Czy ta ostatnia kategoria będzie cienka?

Moglibyśmy zrównać ze sobą wszystkie strzałki względem siebie równoległe i uzyskalibyśmy wtedy
(różną od poprzedniej?) cienką kategorię, która reprezentowałaby same "nagie fakty" istnienia
możliwości przejścia od jednego ogólnego stroju do drugiego. Przypominałaby więc kategorię ... zdań
i dowiedlności.

**Pomniejsza sugestia**: Czy ta kategoria ma obiekt końcowy? Co jest w niej obiektem początkowym?

Jak widzisz, kategorie są *dosłownie wszędzie*. Moim zdaniem po prost dlatego, że teoria kategorii
wyraża ukrytą, wspólną strukturę języków matematycznych, a języki matematyczne wyrażają nasze
uniwersalne sposoby myślenia.

**Może i główna, ale wciąż tylko sugestia**: Zastanów się może, w jaki sposób mogłabyś *zacząć*
próbować konstruować dowód tego twierdzenia. Podkreślam, że nie sugeruję, żebyś je udowodniła,
chociaż jestem przekonany, że zrobiłabyś to bez większego trudu, zakładając, że udałoby Ci się
zachować odpowiednie *nastawienie*. Chodzi mi raczej o próbę *metarefleksji* na temat własnych
sposobów myślenia. Korzystam w tym kodzie z przytoczonych wcześniej definicji, więc może trzeba
będzie do nich wrócić.

Wprowadzam tu uproszczony sposób pisania, odpowiadający często stosowanemu uproszczonemu sposobowi
mówienia, zgodnie z którym relacja to domyślnie relacja binarna określona na jednym
zbiorze. Zmieniłem też konwencję i zacząłem znowu pisać (prawie) wszystko z małych liter, bo taką
miałem ochotę i Ciebie też zachęcam do osobistego i swobodnego podejścia do notacji ("powinno się"
to tylko *czyiś nacisk*).

Zwracam uwagę, że definicja elementu najmniejszego ze względu na jakąś relację (binarną na jednym
zbiorze) *nie* zakłada, że dana relacja jest w jakimkolwiek znaczeniu relacją porządku. Ta relacja
może być *dowolna* (o ile tylko jest binarna i na tym samym zbiorze). To moim zdaniem dobry przykład
wyabstrachowania własności, którą *warto* nazywać w taki początkowo mylący sposób, bo pozwala
korzystać z trudnych do wykrycia analogii.

```lean
def rel α := Binrel α α

-- To są wybrane, interesujące nas w tym momencie własności relacji. Postanowiłem nie wprowadzać
-- notacji wzrostkowej (`x R y`), żeby dobitniej podkreślić, że relacja binarna to tylko
-- szczególnego rodzaju funkcja dwuargumentowa.

-- A to bardzo ułatwia pisanie (i czytanie) poniższych definicji:
variable (R : rel α)

def refl      := ∀ x : α, R x x
def trans     := ∀ {x y z : α}, R x y → R y z → R x z
def antisymm  := ∀ {x y : α}, R x y → R y x → x = y
def preorder  := refl R ∧ trans R
def poset     := preorder R ∧ antisymm R

-- Jeżeli przyszło Ci do głowy, że warto byłoby tu zastosować klasy typów, to brawo. Faktycznie
-- byłoby warto; moglibyśmy wtedy na przykład pisać `x ≤ y` i struktura klas pięknie pasowałaby do
-- wyrażanej przez nią struktury pojęciowej, ale dla naszych skromnych celów ta wersja nam teraz
-- wystarczy.

-- Element najmniejszy *ze względu na relację `R`* to taki `x`, że dla każdego `y`, `x R y`, a w
-- notacji przedrostkowej:
def least x := ∀ v, R x v

-- Ostatnio lubię stosować literę "v" (jak w słowie "variable") na oznaczenie zmiennej, która się
-- "bardziej zmienia", a "x" na oznaczenie "relatywnie globalnego" parametru.

-- Uwaga, relację trzeba podać jako pierwszy jawny argument (Lean domyśli się typu `α`).
#check least -- least.{u_1} {α : Sort u_1} (R : rel α) (x : α) : Prop

-- Na dobry początek warto zauważyć, że to tylko jakaś implikacja ...
theorem least_is_unique (h : poset R) : least R x → least R y → x = y := by 
  -- Zobacz, co się stanie, kiedy napiszesz tu `simp [least]`, a potem `simp [poset] at h`. Możesz
  -- robić takie rzeczy z definicjami stałych, których nazwy pojawiają się w celu lub w kontekście.
  sorry
```

Czy dowód tego twierdzenia wymaga założenia, że `R` to poset, czy wystarczy jakieś *słabsze*
założenie? Jeżeli tak, to jakie? Inaczej mówiąc, z jakich własności relacji faktycznie skorzystałaś
konstruując dowód?

<hr>

<br>

<br>

<br>

<br>

(Zauważyłaś, że psychologia stała się właśnie nauką?  
A dokładniej, nauką nauk? Nieźle, co?

...

Dżessika, jesteś tam jeszcze?

\{Jestem.

A kto to?

Nikt.

Nikt?

No przecież mówię, że nikt. Kiedy nikt nie przychodzi, to właśnie przychodzi Nikt.\})

<br>

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
    flamenco, było to więc doświadczenie już i tak pod różnymi względami intensywne, zaproponowałem
    przyjaciołom i znajomym *konkurs tańca żenującego*. Gorąco polecam.

[^4]: A po angielsku i bawiąc się znaczeniami, *Correctness is the order of psychology*.

[^5]: To jest w pięćdziesiąte urodziny Tomka, który też studiował filozofię, tylko był trzy lata
    wyżej niż ja i chyba nigdy nie przestał jej cenić.

[^6]: Chodzi tu o angielskie słowo *singular*, bo Lawvere nie pisał po polsku. Zarówno to słowo jak
    i jego polski odpowiednik *osobliwe* oznaczają albo po prostu coś pojedynczego lub wyróżnionego,
    albo coś wyróżniającego się przez swoją wyjątkowość, szczególnie zaś przez swoją *dziwność*.
