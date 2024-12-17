# Do czego autor zmierza?

Po omówieniu potrzebnych do tego podstaw zamierzam wytłumaczyć Ci między innymi, na czym polega
istota wnioskowania statystycznego, w wersjach częstościowej i bayesowskiej. Będę przy tym w pewnym
sensie oszukiwał, ale tak naprawdę nie. To znaczy, niektóre zdania, które w tych teoriach są
twierdzeniami i niektóre pojęcia, które są w nich definiowane za pomocą pojęć bardziej
elementarnych, wprowadzę aksjomatycznie.

Niebawem wyjaśnię Ci, że nic "złego" się wtedy nie stanie, bo *struktura* dowodu, gdy się go już raz
znajdzie, jest zwykle nieważna, liczy się tylko *istnienie* dowodu. A definicje mogą być dowolne, bo
są wyborami językowymi i ich wartość sprowadza się do użyteczności i formalnej poprawności.

Omówimy następnie podstawy wnioskowania przyczynowego. Dzięki temu będziemy mogli zrozumieć lepiej o
co chodzi w badaniach obserwacyjnych i eksperymentalnych, a także o co chodzi w pomiarze, *o ile*
pomiar interpretujemy tylko przyczynowo. Będziemy wtedy korzystać intensywnie z dwóch formalnych
definicji. Jedną z nich będziez wpływowa teoretyczno-przyczynowa definicja trafności pomiaru, którą
w pełnym pasji i jak to u Niego zwykle bywa znakomicie napisanym
[artykyle](https://psycnet.apa.org/buy/2004-19012-010) zaproponował wybitny teoretyk psychometrii
Denny Borsboom. Drugą będzie, również teoretyczno-przyczynowa, definicja niezmienności pomiaru
(objaśniona na s. 14 w tym [preprincie](https://osf.io/preprints/psyarxiv/e7a3x)), na której trop,
jak się najpierw dowiedziałem od piszącej pożyteczne teksty, czarującej Julii Rohrer, a potem od
samego już Borsbooma, ten wpadł dziesięć lat przede mną, ale tego pomysłu nigdy nie rozwinął i
dlatego w korespondencji prywatnej wspaniałomyślnie przyznał mi autorstwo. Julia napisała na ten
temat na poczytnym blogu [The 100%
CI](https://www.the100.ci/2024/01/10/a-casual-but-causal-take-on-measurement-invariance/), gdzie mam
zaszczyt figurować w przypisie, wymieniony obok samego Borsbooma, jako niezależny odkrywca tej
istotnej moim zdaniem definicji. Piszę o tym wszystkim nie tylko, żeby się pochwalić, ale przede
wszystkim żeby przekonać Cię, że mogę mieć na ten temat coś do powiedzenia.

Mając do dyspozycji te wszystkie narzędzia, podejmiemy próbę *pełnej formalizacji* dwóch rodzajów
"obiektów prozaicznych" - skromnego artykułu empirycznego i równie skromnego artykułu
teoretycznego. Okaże się wtedy, że nie ma między nimi w zasadzie różnicy, bo każdy artykuł
empiryczny zawiera teoretyczny fragment, a każdy artykuł teoretyczny służy ostatecznie do zmiany
sposobu wnioskowania z wyników empirycznych badań.

Dzięki temu dostrzeżemy możliwość istnienia alternatywnego sposobu uprawiania nauki (wiem, jak to
brzmi), z perspektywy którego zdają się tracić na znaczeniu takie praktyki jak na przykład
prerejestracja badań, testowanie hipotez, czy proces recenzji. Bo też jaką rolę może odegrać
recenzent czy redaktor, gdy *całe* rozumowanie jest sformalizowane i sprawdzone maszynowo pod
względem poprawności? Wyrazić zainteresowanie albo jego brak? A może jakąś inną subiektywną opinię?

Ponieważ takie sformalizowane artykuły naukowe będą *jednocześnie* programami komputerowymi i
zakodowanymi w języku teorii typów zależnych rozumowaniami (sic!), to te artykuły będzie można
*składać* w większe artykuły, dokładanie tak samo jak zwykłe programy komputerowe piszemy już teraz,
łącząc ze sobą różne prostsze funkcje.

Nietrudno wyobrazić sobie, że kolekcja takich napisanych we wspólnym języku artykułów mogłaby
tworzyć coś w rodzaju programistycznej bibliteki żywej wiedzy naukowej, złożonej z czegoś, co można
by nazwać *strumieniami wnioskowania z danych*. Praca teoretyczna polegałaby wtedy na odkrywaniu
nowych sposobów łączenia źródeł danych z wnioskami i odkrywania nowych wniosków, a więc na
*przekierowywaniu dedukcyjnych strumieni empirycznych*. Praca *czysto* empiryczna polegałaby z kolei
na samym dostarczaniu danych w taki sposób, żeby minimalizować konflikt interesów.

Czemu wspominam o konflikcie interesów? Moim zdaniem w tym momencie niemal każdy artykuł empiryczny
powinien w zasadzie zawierać notę o takim konflikcie. Mam na myśli konflikt interesów, który jest
zarazem powszechny i o którym, o ile mi wiadomo, w ogóle się nie mówi - *autor artykułu i wniosków
jest zwykle odpowiedzialny za zbieranie lub analizę danych*. Dlatego tak zwane wątpliwe praktyki
badawcze (ang. *questionable research practices*) są w ogóle *możliwe*. W połączeniu z silnie i
stale oddziałującymi zachętami, takimi jak rozliczanie pracowników niemal wyłącznie z *ilości*
publikacji, *ilości* punktów publikacyjnych i *ilości* grantów, ta możliwość musi często prowadzić
do wątpliwych praktyk, ponieważ naukę uprawiają *zwykli ludzie*, tacy jak Ty czy ja.

Gdybym miał zgadywać, powiedziałbym, że sedno tego problemu polega na tym, że w obecnym systemie
wątpliwe praktyki badawcze są *bardzo opłacalne* i jednocześnie *łatwe*. W dodatku - i to wcale nie
wynika *logicznie* z tej ostatniej tezy - uczciwe uprawianie pracy naukowej i unikanie marnowania
publicznych pieniędzy, czy zaśmiecania literatury kosztownym i szkodliwym szumem, jest często
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
pojęcia *zadania*. Dzięki tej jednej definicji będziemy mogli całkowicie zakodować w języku teorii
typów zależnych artykuł naukowy dotyczący pewnego zjawiska swoiście *psychologicznego*. 

Zaczniemy się wtedy przyglądać z nowej perspektywy *całej* psychologii, dokładnie tak jak wcześniej
będziemy się długo przyglądać całej matematyce, patrząc na nią z tej niezwykłej perspektywy, jakiej
dostarcza teoria typów zależnych. Z matematyką zrobimy to na początku mówiąć *tylko* o funkcjach i
implikacji, a z psychologią zrobimy to mówiąc najpierw *tylko* o jednym, w pewnym sensie najprostym
możliwym psychologicznym badaniu eksperymentalnym.

Wprowadzenie formalnej wersji definicji zadania będzie umotywowane pewnym wglądem. Ten osobliwy
wgląd przytrafił mi się w końcu, po ponad piętnastu latach uczenia się i myślenia wciąż o jednym
małym zbiorze kilku ściśle ze sobą powiązanych zagadek dotyczących podstaw psychologii. W dodatku w
pewnym sensie sedno sprawy miałem przez prawie cały ten czas przed oczami, bo ten wgląd to nic
innego jak wyciągnięcie kosekwencji z nieco zmodyfikowanej wersji następującej meta-teoretycznej
uwagi Tolmana, którą w całości zacytowałem w swojej pracy doktorskiej, a którą bardzo długo błędnie
rozumiałem:

> Koncepcja, za którą się tu opowiadamy, głosi, ujmując rzecz pokrótce, że zawsze, gdy jakąś reakcję
> cechuje wyuczalność w odniesieniu do pewnego końcowego rezultatu - gdy reakcja ta ma skłonność do:
> a) przejawiania się w próbach i błędach oraz b) wybierania stopniowo lub nagle z tych prób i
> błędów posunięć bardziej efektywnych pod względem dążenia do tego końcowego rezultatu - reakcja ta
> wyraża i określa coś, co dla wygody nazywamy celem. Gdziekolwiek pojawia się taki zbiór faktów (a
> gdzie, z wyjątkiem najprostszych i najbardziej sztywnych tropizmów i odruchów, nie pojawia się
> on?), tam mamy obiektywnie wyrażone i określone to, co dogodnie jest nazwać celem. - Tolman,
> *Zachowanie celowe u zwierząt i ludzi*, s. 32.

Wersję tej obserwacji, którą będę w dalszej części uzasadniał i na której będę się potem opierał,
można wyrazić tak:

*Cel, zadanie, wartość i normę można rozumieć jako jedno i to samo - jako preferencję hipotetycznego
zewnętrznego obserwatora*.

Zwracam uwagę, że cel jest zgodnie z tym punktem widzenia własnością *pary* złożonej z obserwatora,
w dodatku hipotetycznego, i przedmiotu jego obserwacji, a nie na przykład własnością człowieka czy
innego zwierzęcia, którego zachowanie jest obserwowane. To znaczy, że cel będę traktował jako
własność *względną*. Zewnętrzny obserwator ostatecznie zniknie nam z pola widzenia, ale w formalnej
definicji zadania pozostanie nadal jego cień. Dojdziemy również do takiego wniosku:

*Zachowanie*, ten centralny przedmiot zainteresowania psychologii, *to proces celowy w przyjętym
znaczeniu pojęcia cel*.

Jak również do takiego:

*Bycie takim a nie innym zachowaniem jest stopniowalne i może być jedynie przybliżane przez
rzeczywiste procesy fizyczne*.

W ten sposób *unieważnimy* zagadkę (nie)racjonalności zachowania zwierząt. Przy okazji zobaczymy w
nowym i zaskakującym świetle *sens* pomiaru psychologicznego.

Zamiast próbować, jak to mają w zwyczaju psychologowie poznawczy i nie tylko oni, domyślać się jak
wygląda to, co *niewidzialne*, ekstremalnie *złożone*, *idiosynkratyczne*, *zmienne* i w ogromnym
stopniu zależne od całej, w zasadzie *nieobserwowalnej historii interakcji organizmu z jego
środowiskiem*, to jest jak wygląda struktura mojego albo Twojego umysłu, albo przebieg naszych
procesów umysłowych, albo zamiast skupiać się na czysto przyczynowych relacjach między fizycznie
rozumianymi bodźcami i reakcjami, jak to mają w zwyczaju behawioryści, zajmiemy się czymś jakby
kompletnie z drugiej strony, to jest *środowiskiem*.

Będzie to środowisko jako coś, czym jak sądze zawsze było dla psychologa *jako psychologa*, a czym
nie jest na przykład dla fizyka *jako fizyka* i czym zawsze dla psychologa pozostanie. Będzie to
mianowicie środowisko postrzegane jako *układ* albo *konstelacja powiązanych zadań*. Zaletą tak
rozumianego środowiska jako przedmiotu badań jest jego obserwowalność i względnie łatwa
modyfikowalność. A także to, że wszystko, co na temat tak rozumianego środowiska uda się ustalić,
będzie miało automatycznie znaczenie jednocześnie teoretyczne i aplikacyjne. Z tej nowej,
środowisko- i zadanio-centrycznej perspektywy *funkcje poznawcze*, takie jak percepcja, pamięć, czy
uwaga, okażą się *własności zadań*, a nie własnościami czy częściami umysłu albo rodzajami procesów
umysłowych.

Osiągniemy to wszystko nie korzystając za bardzo z wiedzy psychologicznej, bo też nie mam poczucia,
żebym sporo takiej wiedzy zastał. Coś tam mniej więcej wiadomo i do niektórych rzeczy bardzo się
przydaje to, co wiemy, ale psychologia naukowa wciąż jest na etapie powstawania. Będziemy za to
intensywnie korzystać z tej niezwykłej *meta-matematyki stosowanej*, którą tu objaśniam i której
będę używał jako uniwersalnego narzędzia służącego do meta-teoretycznych badań, jaką jest teoria
typów zależnych, a której autorem jest wybitny szwedzki logik, filozof i statystyk matematyczny [Per
Martin-Löf](https://en.wikipedia.org/wiki/Per_Martin-L%C3%B6f).

Wiem, że te cele mogą się wydawać szalone i w jakimś sensie pewnie takie są, więc na tym etapie
mówię tylko - spróbuję. Potrzebuję do tego Twojej pomocy i właściwie już z niej skorzystałem. To
znaczy, skorzystałem już z samego faktu, że postrzegam Ciebie jako czytelniczkę (albo czytelnika).

Gdybym próbował napisać to, co staram się teraz napisać, jako artykuł naukowy, musiałbym się zgodzić
na granie według reguł gry, które obowiązują mnie, moich kolegów i moje koleżanki z pracy, kiedy
piszemy manuskrypty i wysyłamy je do redakcji czasopism wysokopunktowanych. Musiałbym na przykład
pisać w stylu, który obecnie obowiązuje w tego typu publikacjach. Nie przepadam za tym stylem,
zresztą nie tylko ja, bo uważam, że nie służy wcale dobrze wyjaśnianiu zjawisk i rozwiązywaniu
problemów, za to nadaje się świetnie do stwarzania *pozorów*, że się coś takiego robi. 

Umiem stwarzać tego rodzaju pozory, bo jak na psychologa dosyć sprawnie operuję technicznymi
terminami wnioskowania statystycznego i przyczynowego, ale nie chcę tego robić. Musiałbym też po raz
kolejny znosić to, że redaktorzy i recenzenci zwykle swoje wymagania wyrażają z pozycji autorytetu i
realnej władzy, rzadko podając *powody*, dla których oczekują takich a nie innych zmian, a według
mnie taka postawa jest po prostu *anty*naukowa.

Myślę, że najlepiej będzie, jeśli zaczniemy od początku.
