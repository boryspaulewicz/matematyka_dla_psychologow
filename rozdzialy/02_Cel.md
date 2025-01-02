# Do *czego* autor zmierza?!

Z tego rozdziału dowiesz się przede wszytkim o tym, o czym będę pisał w planowanej *drugiej*
części. Wydaje mi się, że większość tematów, o których tu mówię, może nie być zrozumiała dla osób,
które nie studiowały przynajmniej przez kilka lat na przykład psychologii, dlatego takim czytelnikom
sugeruję, żeby najwyżej tu zerknąć i przejść zaraz do rozdziału czwartego, od którego zaczyna się
interaktywna nauka podstaw samej matematyki. Co prawda w pierwszej części pojawiają się czasami
wątki związane z psychologią, ale te pełnią tam rolę przykładów, które można pominąć bez szkody dla
zrozumienia głównej treści.

Po omówieniu potrzebnych do tego podstaw, zamierzam wytłumaczyć Ci między innymi, na czym polega
istota wnioskowania statystycznego, w wersjach częstościowej i bayesowskiej. Żeby dobrze objaśnić
podstawy skupimy się wtedy na być może najprostszym z powszechnie stosowanych modeli statystycznych,
to jest na rozkładzie dwumianowym, i prześledzimy dokładnie logikę testowania istotności, *widząc*
dzięki temu, jaką rolę odgrywa tam pojęcie [rozkładu z
próby](https://pl.wikipedia.org/wiki/Rozk%C5%82ad_pr%C3%B3bkowania), a jaką sama *decyzja* o
odrzuceniu bądź nieodrzuceniu testowanej hipotezy. Następnie popatrzymy z bliska na wszystkie ważne
kroki wnioskowania z danych za pomocą bayesowskiej wersji tego samego modelu.

Będę wtedy czasem w pewnym sensie oszukiwał, ale tak naprawdę nie. To znaczy, niektóre zdania, które
są raczej twierdzeniami i niektóre pojęcia, które zwykle są definiowane za pomocą pojęć bardziej
elementarnych, wprowadzę aksjomatycznie. Niebawem wyjaśnię Ci, że nic "złego" się wtedy nie stanie,
bo *struktura* dowodu, gdy się go już znajdzie, jest zwykle nieważna, liczy się przede wszystkim
*istnienie* dowodu. A definicje mogą być dowolne, bo są językowymi *wyborami* i ich wartość
sprowadza się do użyteczności i formalnej poprawności.

Omówimy też podstawy wnioskowania przyczynowego. Dzięki temu będziemy mogli zrozumieć lepiej o co
chodzi w *badaniach obserwacyjnych* i *eksperymentalnych*, a także w *pomiarze*, *o ile* pomiar
interpretujemy tylko przyczynowo. Będziemy wtedy korzystać intensywnie z dwóch formalnych
definicji. Jedną z nich będzie wpływowa przyczynowo-teoretyczna definicja trafności pomiaru, którą w
pełnym pasji i jak to u Niego zwykle bywa znakomicie napisanym
[artykule](https://psycnet.apa.org/buy/2004-19012-010) zaproponował wybitny teoretyk psychometrii
[Denny Borsboom](https://en.wikipedia.org/wiki/Denny_Borsboom). Drugą będzie, również
przyczynowo-teoretyczna, definicja niezmienności pomiaru (objaśniona na s. 14 w tym
[preprincie](https://osf.io/preprints/psyarxiv/e7a3x) i niestety błędnie opisana na
[tej](https://pl.wikipedia.org/wiki/R%C3%B3wnowa%C5%BCno%C5%9B%C4%87_pomiaru) stronie Wikipedii), na
której trop, jak się najpierw dowiedziałem od piszącej pożyteczne teksty, czarującej [Julii
Rohrer](https://juliarohrer.com/), a potem od samego już Borsbooma, ten wpadł dziesięć lat przede
mną, ale tego pomysłu nigdy nie rozwinął i dlatego w korespondencji prywatnej wspaniałomyślnie
przyznał mi autorstwo. Julia napisała potem na ten temat na poczytnym blogu [The 100%
CI](https://www.the100.ci/2024/01/10/a-casual-but-causal-take-on-measurement-invariance/), gdzie mam
zaszczyt figurować w dwóch przypisach, wymieniony obok samego Borsbooma jako niezależny odkrywca tej
istotnej moim zdaniem definicji. Piszę o tym wszystkim nie tylko po to, żeby się pochwalić, chociaż
oczywiście po to też, ale przede wszystkim żeby Cię przekonać, że mogę mieć o tego typu sprawach coś
do powiedzenia.

Przy okazji, w rozdziale pod radośnie brzmiącym tytułem *Nie jest dobrze*, skorzystamy z już nabytej
wiedzy, żeby ocenić zawartość takich skierowanych do psychologów podręczników jak [Metodologia badań
psychologicznych](https://ksiegarnia.pwn.pl/Metodologia-badan-psychologicznych,782124221,p.html?srsltid=AfmBOopxlOtS5MLgoUGzo8_9QB7yo-2aWyZQPM4FEqkuIvYzWXHyBbvQ),
[Statystyczny
drogowskaz](https://www.gwp.pl/statystyczny-drogowskaz-1-praktyczne-wprowadzenie-do-wnioskowania-statystycznego.html),
czy [Metodologia i statystyka. Przewodnik statystycznego
turysty](https://ksiegarnia.pwn.pl/Metodologia-i-statystyka-Przewodnik-naukowego-turysty-Tom-1,1007521920,p.html?srsltid=AfmBOooMqGVHILuAsFPTJQ6v1iAEhd5Kiwwvogdmsco1Lp9FyuqwBM91),
który to podręcznik ukazał się niedawno, podobnie jak ten pierwszy, nakładem Wydawnictwa Naukowego
PWN.

Mając do dyspozycji te wszystkie narzędzia, podejmiemy próbę *pełnej formalizacji* dwóch rodzajów
"obiektów prozaicznych" - skromnego artykułu empirycznego i równie skromnego artykułu
teoretycznego. Okaże się wtedy, że nie ma między nimi w zasadzie różnicy, bo każdy artykuł
empiryczny musi zawierać fragment rozumowania teoretycznego, a każdy artykuł teoretyczny służy
ostatecznie do zmiany sposobu wnioskowania z danych.

Dzięki temu dostrzeżemy możliwość istnienia alternatywnego sposobu uprawiania nauki (wiem, jak to
brzmi), z perspektywy którego zdają się tracić na znaczeniu takie praktyki jak na przykład
prerejestracja badań, testowanie hipotez, czy proces recenzji. Bo też jaką rolę może odegrać
recenzent czy redaktor, gdy *całe* rozumowanie jest sformalizowane i sprawdzone maszynowo pod
względem poprawności? Wyrazić zainteresowanie albo jego brak? A może jakąś inną subiektywną opinię?

Ponieważ takie sformalizowane artykuły naukowe będą *jednocześnie* programami komputerowymi i
zakodowanymi w języku teorii typów rozumowaniami, to te artykuły będzie można *składać* w większe
artykuły, dokładanie tak samo jak zwykłe programy komputerowe piszemy już teraz, łącząc ze sobą
różne prostsze funkcje.

Nietrudno wyobrazić sobie, że kolekcja takich napisanych we wspólnym języku artykułów mogłaby
tworzyć coś w rodzaju programistycznej bibliteki żywej wiedzy naukowej, złożonej z czegoś, co można
by nazwać *strumieniami wnioskowania z danych*. Praca teoretyczna polegałaby wtedy na odkrywaniu
nowych sposobów łączenia źródeł danych z wnioskami i odkrywania nowych wniosków, a więc na
*przekierowywaniu dedukcyjnych strumieni empirycznych*. Praca *czysto* empiryczna polegałaby z kolei
na samym dostarczaniu danych w taki sposób, żeby minimalizować konflikt interesów. No i czym byłaby
wtedy "decyzja o odrzuceniu" jakiejś hipotezy empirycznej jak nie tylko pustym gestem? Przecież
żaden empiryczny test nigdy nie da nam pewności, a zapisane w repozytorium teorii hipotezy można by
tam po prostu *zostawić*, bo w takiej postaci *nie zajmowałyby miejsca w publikacjach*.

Czemu wspominam o konflikcie interesów? Moim zdaniem w tym momencie niemal każdy artykuł empiryczny
powinien w zasadzie zawierać notę o takim konflikcie. Mam na myśli konflikt interesów, który jest
powszechny i o którym, o ile mi wiadomo, w ogóle się nie mówi - *autor artykułu i wniosków jest
zwykle odpowiedzialny za zbieranie lub analizę danych*. Dlatego tak zwane [wątpliwe praktyki
badawcze](https://en.wikipedia.org/wiki/Scientific_misconduct) (ang. *questionable research
practices*) są w ogóle *możliwe*. W połączeniu z silnie i stale oddziałującymi zachętami, takimi jak
rozliczanie pracowników przede wszystkim z *ilości* publikacji, *ilości* punktów publikacyjnych i
*ilości* grantów, ta możliwość *musi* często prowadzić do wątpliwych praktyk, ponieważ naukę
uprawiają *zwykli ludzie*, tacy jak Ty czy ja.

Gdybym miał zgadywać, powiedziałbym, że sedno tego problemu polega na tym, że w obecnym systemie
wątpliwe praktyki badawcze są *bardzo opłacalne* i jednocześnie *łatwe*. W dodatku - i to wcale nie
wynika *logicznie* z tej ostatniej tezy - uczciwe wykonywanie pracy naukowej i unikanie marnowania
publicznych pieniędzy albo zaśmiecania literatury kosztownym i szkodliwym szumem jest często
*nieopłacalne* i *trudne* z powodów *niezwiązanych z trudnościami w dociekaniu prawdy o przedmiocie
własnych badań*.

Zwróć proszę uwagę, że gdyby istniał ten alternatywny sposób uprawiania nauki, o którym dopiero co
fantazjowałem, nie miałoby znaczenia, czy autorem jestem ja, pracownik zatrudniony na uczelni, czy
Ty, albo dajmy na to Twoja babcia. No bo też czemu miałoby to mieć znaczenie? Gdyby okazało się, że
Twoja babcia ma coś ważnego do powiedzenia na interesujący z naukowego punktu widzenia temat, to
chyba wypadałoby potraktować Ją poważnie. Gdyby Twoja (albo już niestety nieżyjąca moja) babcia
potrafiła dobrze uzasadnić swoje wnioski, to te wnioski powinny być traktowane tak samo jak
uzasadnione wnioski pracownika naukowego. Ja tak w każdym razie sądzę.

Wracając do celów, następnie podejmiemy próbę sformalizowania rozumowań, które będą wymagały
wprowadzenia może początkowo dziwnie brzmiącej, ale za to prostej i ogólnej definicji - definicji
pojęcia *zadania*. Odkryjemy również wtedy kluczową przyczynowo-zadaniową rolę *instrukcji* (w tym
również *instrukcji zrandomizowanej*), którą psychologowie zdają się tak często bezmyślnie
lekceważyć.

Dzięki tej jednej definicji będziemy mogli całkowicie zakodować w języku teorii typów artykuł
naukowy dotyczący pewnego zjawiska swoiście *psychologicznego*. Pomijając ewentualną dokumentację, z
perspektywy użytkownika ten artykuł będzie się składał z *dwóch łatwych do odczytania list* - listy
założeń dotyczących danych i własności planu badawczego i być może jakiś definicji i założeń o
charakterze teoretycznym, a także listy dedukcyjnych wniosków. Już teraz możemy to zrobić z
wnioskami probabilistycznymi i przyczynowymi, a korzystając z definicji zadania (z instrukcją)
będziemy mogli zrobić to samo z wnioskami swoiście psychologicznymi. Z perspektywy użytkownika to
będzie po prostu informacja, że określone *warunki badania* i *źródła pochodzenia danych* - które z
powodów praktycznych taki użytkownik musi traktować jako coś w rodzaju aksjomatów - mają, *ponad
wszelką wątpliwość* (zakładając *tylko* wiarygodność źródła danych), takie a nie inne właściwości
*psychologiczne* czy *zachowaniowe*. W dodatku ta formalizacja będzie wręcz *zawstydzająco prosta*,
podobnie jak zawstydzająco prostymi formalizacjami pojęć prawdopodobieństwa, wpływu i własności
kontrfaktycznych są rachunki prawdopodobieństwa i przyczynowy dla zmiennych dyskretnych[^3].

Zaczniemy się wtedy przyglądać z nowej perspektywy *całej* psychologii, dokładnie tak jak wcześniej
będziemy się długo przyglądać *całej* matematyce, patrząc na tą ostatnią z tego niezwykłego punktu
widzenia, którego dostarczy nam teoria typów (i izomorfizm Curry'ego-Howarda, a później również
teoria kategorii). Z matematyką zrobimy to na początku mówiąć *tylko* o
[funkcjach](https://youtu.be/zHU1xH6Ogs4?si=6dEXhDwOJ01KVw8W&t=42), a z psychologią zrobimy to
mówiąc najpierw *tylko* o jednym, w pewnym już wtedy technicznym sensie najprostym możliwym
psychologicznym badaniu eksperymentalnym.

Ten minimalny psychologiczny eksperyment odegra taką samą meta-teoretyczną rolę jaką pojęcie [masy
punktowej](https://pl.wikipedia.org/wiki/Punkt_materialny) zawieszonej w próżni odegrało kiedyś w
fizyce. Osiągniemy to nie proponując żadnego psychologicznego modelu czy teorii, zamiast tego
zapiszemy za pomocą symboli to, bez czego nie można się obejść i czego nie da się zakwestionować
zawsze wtedy, gdy mówimy o zjawiskach należących do przedmiotu zainteresowań psychologii
naukowej. Będzie to ogólny i sformalizowany *język*, a dokładniej będzie to *rachunek zachowania*,
dzięki któremu pytania, które wcześniej wydawały się niejasne albo nawet mętne będzie można
formułować w taki sposób, że poszukiwanie na nie odpowiedzi stanie się, przynajmniej częściowo,
kwestią mechanicznych operacji.

Wprowadzenie formalnej wersji definicji zadania będzie umotywowane pewnym wglądem. Ten osobliwy
wgląd przytrafił mi się w końcu, po ponad piętnastu latach uczenia się i myślenia wciąż o jednym
małym zbiorze kilku ściśle ze sobą powiązanych zagadek dotyczących podstaw psychologii. W dodatku w
pewnym sensie sedno sprawy miałem przez prawie cały ten czas przed oczami, bo to nic innego jak
wyprowadzenie nieuchronnych kosekwencji ze zmodyfikowanej wersji pewnej uwagi
[Tolmana](https://en.wikipedia.org/wiki/Edward_C._Tolman), którą przytoczyłem w swoim
[doktoracie](./praca_doktorska.pdf), a którą bardzo długo błędnie rozumiałem:

> Koncepcja, za którą się tu opowiadamy, głosi, ujmując rzecz pokrótce, że zawsze, gdy jakąś reakcję
> cechuje wyuczalność w odniesieniu do pewnego końcowego rezultatu - gdy reakcja ta ma skłonność do:
> a) przejawiania się w próbach i błędach oraz b) wybierania stopniowo lub nagle z tych prób i
> błędów posunięć bardziej efektywnych pod względem dążenia do tego końcowego rezultatu - reakcja ta
> wyraża i określa coś, co dla wygody nazywamy celem. Gdziekolwiek pojawia się taki zbiór faktów (a
> gdzie, z wyjątkiem najprostszych i najbardziej sztywnych tropizmów i odruchów, nie pojawia się
> on?), tam mamy obiektywnie wyrażone i określone to, co dogodnie jest nazwać celem. - Tolman,
> *Zachowanie celowe u zwierząt i ludzi*, s. 32.

Wersję tej uwagi, którą będę w dalszej części uzasadniał i której użyteczność będę później
ilustrował przykładami, można wyrazić krótko w taki oto sposób:

*Cel, zadanie, wartość i normę można rozumieć jako jedno i to samo - jako preferencję hipotetycznego
zewnętrznego obserwatora*.

Podkreślam, że cel jest zgodnie z tym punktem widzenia własnością *pary* złożonej z obserwatora, w
dodatku *hipotetycznego*, a także przedmiotu jego obserwacji, a nie na przykład własnością *samego*
zachowania, albo człowieka czy innego zwierzęcia, którego zachowanie jest obserwowane. To znaczy, że
cel będę traktował jako własność *względną*. Brzmi to może abstrakcyjnie, ale chodzi tu w istocie o
tak przyziemne sprawy jak fakt, że mówiąc na przykład "to poprawna" albo "to błędna odpowiedź", albo
"tak nie wolno" albo "nie wypada", czy nawet "muszę się w tej chwili napić kawy", nieuchronnie
odnosimy się do takiej preferencji, *niekoniecznie* traktując ją wtedy jak *swoją* (albo *tylko*
swoją).

Od niedawna nazywam ten punkt widzenia *funkcjonalizmem zewnętrznym* albo - z pozoru paradoksalnie -
*funkcjonalizmem obiektywnym*. Zewnętrzny obserwator ostatecznie zniknie nam z pola widzenia,
dokładnie tak samo jak "Ten, który powtarza doświadczenie" szybko znika nam z pola widzenia, kiedy
poznajemy rachunek prawdopodobieństwa, a "Ten, który dokonuje zewnętrznej interwencji" szybko się
ulatnia, kiedy poznajemy rachunek przyczynowy. Jednak w formalnej definicji zadania pozostanie nadal
"Jego" cień.

Można to powiedzieć również tak: Tak samo, jak nie da się wyprowadzić wniosków o charakterze
probabilistycznym nie przyjmując najpierw założeń probabilistycznych, i nie da się wyprowadzić
wniosków przyczynowych nie przyjmując najpierw założeń przyczynowych, tak nie da się też wyprowadzić
wniosków na temat *działań celowych* nie przyjmując żadnych założeń na temat celu. A najogólniejszą
i najbardziej elastyczną postacią tego rodzaju założeń są założenia o charakterze *ocennym*, które
można wyrazić formalnie jako relacje *porządku*. Gdy tylko dodamy w odpowiedniej wersji - do
probabilistycznych i przyczynowych - tego typu założenia, będziemy mogli natychmiast zacząć mówić
*wprost* o *działaniach celowych*, a więc *zachowaniach*. 

Albo tak: Wprowadzając do języka formalnego preferencję zewnętrznego obserwatora, uzupełnimy
istniejące już formalne teorie, pozwalające mówić o tym ...

1. Jak często zachodzi $Y$, gdy zachodzi $X$.

2. Jak często zachodzi $Y$, gdy $X$ jest poddane zewnętrznej interwencji.

3. Jak często zachodziło*by* $Y$, gdyby $X$ miało na skutek zewnętrznej interwencji wartość $x$ w
   sytuacji $S$.

.. a więc rachunek prawdopodobieństwa, rachunek interwencji i rachunek kontrfaktyczny, o możliwość
wyrażenia formalnie i wprost pytań dotyczących tego,

4. Jak i w jakim stopniu można sprawić, żeby zachodziło $Z$. 

W ten sposób uzupełnimy istniejące już jako języki formalne, trzy jakościowo odrębne wymiary, o
wymiar czwarty i *ostatni*, dzieki któremu ujawni się *Zewnętrzny Agent*[^2]. Rozpoznamy
jednocześnie wszystkie te cztery wymiary jako własności sposobu opisywania zjawisk z perspektywy
*Kogoś, kto właściwie nie istnieje*. W szczególności, preferencja *nie* będzie wtedy własnością
opisywanego procesu. Odkryjemy też, że zawsze z konieczności niepełne i fragmentaryczne *wcielenie
się w podmiot* jest procesem *społecznym*, w którym podmiotowość jest nieustannie *re-kontruowana* w
ramach *uczenia się* polegającego na abstrakcyjnie rozumianym, *wewnątrz-* lub *między-jednostkowym
dialogu*.

Wiemy już przecież, bo to natychmiast wynika z [twierdzenia o hierarchii przyczynowej
Pearla](https://causalai.net/r60.pdf), że poziom kontrfaktyczny jest nieredukowalny do
interwencyjnego, a ten z kolei jest nieredukowalny do probabilistycznego. W istocie ten wniosek
wynika w dosyć prosty sposób z samej *definicji* tego, czym są te trzy, jakościowo różne poziomy
opisu wszelkich zjawisk. Pozostaje jedynie dodać, również z definicji nieredukowalny do trzech
pozostałych, poziom czwarty, na którym można wyrazić wprost *ocenę*, a więc również *cel*.

Dojdziemy dzięki temu do takiego wniosku ...

*Zachowanie*, ten centralny przedmiot zainteresowania psychologii, *to proces celowy w przyjętym
znaczeniu pojęcia cel*.

... jak również do takiego ...

*Bycie takim a nie innym zachowaniem jest stopniowalne i może być jedynie przybliżane przez
rzeczywiste procesy fizyczne*.

... i takiego:

*Rodzaj zachowania nie jest, bo nie może być, własnością unikalną*.

Można powiedzieć to samo w być może bardziej zrozumiały sposób również tak, wyrażając ten punkt
widzenia jako coś w rodzaju odwrotności [fiksacji
funkcjonalnej](https://pl.wikipedia.org/wiki/Fiksacja_funkcjonalna): Jeżeli coś *może* pełnić w
jakimś stopniu pewną funkcję, rozumianą jako rozwiązanie jakiegoś zdania, to po prostu *pełni* tą
funkcję w tym stopniu. Wszystko pełni jednocześnie nieskończenie wiele funkcji w różnym stopniu i
nic nie pełni w stopniu doskonałym tylko jednej funkcji, rozumianej jako rozwiązanie jakiegoś
zadania.

W ten sposób *unieważnimy* zagadkę (nie)racjonalności zachowania zwierząt.

Przy okazji zobaczymy z jednocześnie zaskakującej i oczywistej perspektywy *sens* pomiaru
psychologicznego. Na przykład, często używana w psychometrii *α Cronbacha* jest zwykle
interpretowana jako miara tego, w jakim stopniu odpowiedzi na pozycje testowe są pod wpływem tylko
jednej zmiennej nieobserwowanej, takiej jak powiedzmy ekstrawersja. Posługując się teorią
wnioskwania przyczynowego można łatwo wykazać, że ta interpretacja jest zwyczajnie niedorzeczna, o
czym zresztą wspominają[^1], jakby mimochodem, autorzy niektórych współczesnych podręczników
dotyczących modelowania równań strukturalnych, bo w tych nowszych podręcznikach (na przykład w
[tym](https://www.guilford.com/books/Principles-and-Practice-of-Structural-Equation-Modeling/Rex-Kline/9781462551910?srsltid=AfmBOoop0wzseBmAxaJMIOFojKNhZ2jvHKa3HGEU0UvFIizL-IEIAoZH))
teoria wnioskowania przyczynowego jest (słusznie) traktowana jako *źródło sensu* wszystkich tego
rodzaju modeli. Ten sam wskaźnik ma jednak zarazem oczywisty sens z perspektywy zadanio-centrycznej:
Ponieważ, jak łatwo się przekonać przyglądając się [*formalnej
definicji*](https://en.wikipedia.org/wiki/Cronbach%27s_alpha), α Cronbacha to nic innego jak pewna
miara stopnia, w jakim odpowiedzi na wszystkie pozycje testowe są *skorelowane*, to skoro pozycje
testowe są *zawsze blisko związane treściowo*, można tą miarę interpretować jako co prawda
niedoskonały, ale jednak *teoretycznie uzasadniony* wskaźnik *stopnia, w jakim osoby badane wykonują
zadanie udzielenia odpowiedzi na pozycje testowe*.

Nie będziemy wtedy próbować - jak to mają w zwyczaju psychologowie poznawczy i nie tylko oni -
domyślać się, jak wygląda to, co jest praktycznie *nieobserwowalne*, ekstremalnie *złożone*,
*idiosynkratyczne*, *zmienne* i w ogromnym stopniu zależne od niemal całkiem *nieobserwowalnej
historii interakcji organizmu z jego środowiskiem*, to jest jak wygląda struktura mojego albo
Twojego umysłu i przebieg naszych procesów umysłowych, ani *tym bardziej* nie będziemy się
koncentrować na tym, w jaki sposób zachowanie jest regulowane przez tego [wymiarowego
potwora](https://www.spaghettimonster.org/) którego nazywamy mózgiem. I nie będziemy się też
skupiać na przyczynowych relacjach między fizycznie rozumianymi bodźcami i reakcjami, jak mają to
przynajmniej *pozornie* w zwyczaju psychologowie o behawioralnej orientacji. Zamiast tego zajmiemy
się czymś jakby kompletnie z drugiej strony, to jest *środowiskiem*.

Będzie to środowisko jako coś, czym zawsze było dla psychologa *jako psychologa*, a czym nie jest na
przykład dla fizyka *jako fizyka* i czym zawsze dla psychologa pozostanie. Będzie to mianowicie
środowisko postrzegane jako *nieunikalny układ* albo *konstelacja powiązanych zadań*. Zaletą tak
rozumianego środowiska jako przedmiotu badań jest jego obserwowalność i względnie łatwa
modyfikowalność. A także to, że wszystko, co na temat tak rozumianego środowiska uda się ustalić,
będzie jednocześnie i automatycznie ważne pod względem teoretycznym i aplikacyjnym. Z tej nowej,
środowisko- i zadanio-centrycznej perspektywy *funkcje poznawcze*, takie jak percepcja, pamięć, czy
uwaga, okażą się *własnościami zadań*, a nie własnościami czy częściami umysłu albo rodzajami
procesów umysłowych.

Osiągniemy to wszystko nie korzystając za bardzo z wiedzy psychologicznej, bo też nie mam poczucia,
żebym sporo takiej wiedzy zastał. Coś tam mniej więcej wiadomo i do niektórych rzeczy bardzo się
przydaje to, co wiemy, ale psychologia naukowa wciąż jest na etapie powstawania, jej sukcesy
aplikacyjne są jak dotąd delikatnie mówiąc skromne, a zawartość wielu podręczników, o czym łatwo się
przekonać, nie uległa jakiejś radykalnej zmianie w ciągu kilkudziesięciu lat. Będziemy za to
intensywnie korzystać z tej niezwykłej *meta-matematyki stosowanej*, którą tu objaśniam i której
będę używał jako uniwersalnego narzędzia służącego do meta-teoretycznych badań, jaką jest teoria
typów, a której autorem jest wybitny szwedzki logik, filozof i statystyk matematyczny [Per
Martin-Löf](https://en.wikipedia.org/wiki/Per_Martin-L%C3%B6f).

Wiem, że te cele mogą się wydać szalone i w jakimś sensie pewnie takie są, więc na tym etapie mówię
tylko - spróbuję. Potrzebuję do tego Twojej pomocy i właściwie już z niej skorzystałem. To znaczy,
skorzystałem już z samego faktu, że postrzegam Ciebie jako czytelniczkę (albo czytelnika).

Gdybym próbował napisać to, co staram się teraz napisać, jako artykuł naukowy, musiałbym się znowu
zgodzić na zasady, które obowiązują mnie, moich kolegów i moje koleżanki z pracy, kiedy piszemy
manuskrypty i wysyłamy je do redakcji czasopism wysokopunktowanych. Musiałbym na przykład pisać w
stylu, który obecnie obowiązuje w tego typu publikacjach. Nie przepadam za tym stylem, zresztą nie
tylko ja, bo uważam, że nie służy wcale dobrze wyjaśnianiu zjawisk i rozwiązywaniu problemów, za to
nadaje się świetnie do stwarzania *pozorów*, że się coś takiego robi. W dodatku recenzenci i
redaktorzy zdają się na ogół oczekiwać, że artykuł naukowy będzie dotyczył *jednego* względnie
dobrze określonego problemu lub pytania, a na niektóre spośród najciekawszych i najgłębszych pytań
*nie da się* odpowiedzieć inaczej, niż odpowiadając na kilka takich pytań *jednocześnie*.

Umiem stwarzać te pozory, bo jak na psychologa dosyć sprawnie operuję technicznymi terminami
wnioskowania statystycznego i przyczynowego, ale nie lubię tego robić. Musiałbym też znowu znosić
to, że redaktorzy i recenzenci zwykle swoje wymagania wyrażają z pozycji autorytetu i realnej
władzy, rzadko podając *powody*, dla których oczekują takich a nie innych zmian, a według mnie taka
postawa jest po prostu *anty*naukowa. Pisząc tą książkę publicznie i na żywo nie unikam przecież w
żaden sposób niczyjej oceny. Jest wręcz odwrotnie, skoro *każdy*, kto tylko ma dostęp do internetu,
może poddać krytyce *wszystko*, co tu piszę, po prostu odnosząc się do tego publicznie.

Myślę, że najlepiej będzie, jeśli zaczniemy od *podstaw*.

### Przypisy

[^1]: A dokładniej, autorzy tych nowszych podręczników dotyczących modelowania równań strukturalnych
    wspominają o tym, że modele pomiarowe, takie jak na przykład model jednoczynnikowy, bez założeń
    ilościowych - które w takich modelach, gdy te są stosowane w psychologii, nie są nawet znośnymi
    *przybliżeniami* jakiegokolwiek teoretycznie akceptowalnego procesu generowania odpowiedzi - są
    *nietestowalne*. Jeżeli ten temat Cię interesuje, może przyda Ci się rzucić okiem na przykład na
    to, na jakie pojęciowe akrobacje pozwolił sobie
    [Kline](https://www.guilford.com/books/Principles-and-Practice-of-Structural-Equation-Modeling/Rex-Kline/9781462551910?srsltid=AfmBOoop0wzseBmAxaJMIOFojKNhZ2jvHKa3HGEU0UvFIizL-IEIAoZH),
    próbując napisać coś przynajmniej na oko spójnego na temat pomiaru w psychologii z perspektywy
    przyczynowej.

[^2]: Albo Zewnętrzny Podmiot. Jeszcze nie wiem jak Go nazwać.

[^3]: Co przyznali wyraźnie i Kołmogorow i Pearl, ten ostatni zresztą
    wielokrotnie. Najpopularniejsza (ale nie jedyna, jest przecież jeszcze aksjomatyzacja w
    kategoriach wartości oczekiwanych zmiennych losowych) rachunku prawdopodobieństwa jest
    stosunkowo nietrywialna tylko dlatego, że dotyczy również przestrzeni ciągłych, co wymaga
    wprowadzenia pojęcia przestrzeni mierzalnej i pojęcia miary.
