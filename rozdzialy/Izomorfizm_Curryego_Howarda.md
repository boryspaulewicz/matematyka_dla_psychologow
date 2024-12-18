# Izomorfizm Curry'ego-Howarda

Za chwilê zaczniemy korzystaæ z izomorfizmu Curry'ego-Howarda (tak, tego Curry'ego, który ju¿
wcze¶niej siê pojawi³). ¯eby obja¶niæ, na czym to bêdzie polega³o, najpierw powiem jak± w ogóle rolê
izomorfizmy odgrywaj± w matematyce.

W szkole podstawowej zaczê³a¶ korzystaæ z [uk³adu wspó³rzêdnych
kartezjañskich](https://pl.wikipedia.org/wiki/Uk%C5%82ad_wsp%C3%B3%C5%82rz%C4%99dnych_kartezja%C5%84skich)
i przypuszczam, ¿e z czasem sta³o siê to dla Ciebie tak bardzo naturalne, ¿e mo¿e nawet nie
zastanawia³a¶ siê, na czym to w³a¶ciwie polega. Jak pewnie wiesz, ten uk³ad wprowadzi³ do matematyki
jeszcze w 17 wieku francuski matematyk, filozof i fizyk [René
Descartes](https://pl.wikipedia.org/wiki/Ren%C3%A9_Descartes). Pomys³ Kartezjusza, bo tak te¿ o nim
mówimy, by³ prawdziw± rewolucj±, dlatego ¿e pozwala *wiernie przet³umaczyæ* dowolny problem
geometryczny na odpowiadaj±cy mu problem liczbowy. To jest wierne t³umacznie w tym znaczeniu, ¿e nie
tracimy wtedy ani nie zniekszta³camy ¿adnych w³asno¶ci problemu geometrycznego. Takie sposoby
wiernego t³umaczenia *w obie strony* nazywamy w matematyce (zachowuj±cymi strukturê)
*izomorfizmami*.

Uk³adu wspó³rzêdnych kartezjañskich u¿ywamy w taki oto sposób: Punktem wyj¶cia jest *abstrakcyjnie
rozumiana p³aszczyzna*. Nie chodzi tu o ¿adn± konkretn± p³aszczyznê fizyczn±, tylko o co¶ w rodzaju
idealnie p³askiej powierzchni bez ¿adnych granic; takiej powierzchni, o której chêtnie my¶l±
matematycy. Bez dodatkowych za³o¿eñ ta p³aszczyzna jako taka *nie* ma charakteru liczbowego, tylko
czysto geometryczny. Podobnie na przyk³ad jaki¶ konkretny okr±g na tej p³aszczy¼nie jako taki, który
mogliby¶my sobie wyobraziæ i który mogliby¶my próbowaæ systematycznie analizowaæ, *nie* ma jeszcze
charakteru liczbowego.

[Geometria euklidesowa](https://pl.wikipedia.org/wiki/Geometria_euklidesowa), o której byæ mo¿e ju¿
s³ysza³a¶, jest (pierwszym w historii) dobrym przyk³adem aksjomatycznej teorii tego typu struktur.
Byæ mo¿e jednak nie wiedzia³a¶ dot±d, ¿e liczby nie odgrywaj± w tej teorii *¿adnej* roli. W
[Elementach](http://aleph0.clarku.edu/~djoyce/java/elements/toc.html) Euklidesa znajdziemy tylko
*rysunkowe reprezentacje* wyidealizowanych obiektów geometrycznych i wyra¿one w jêzyku naturalnym
definicje i aksjomaty, które te obiekty maj± spe³niaæ, a tak¿e rozumowania polegaj±ce na
wyprowadzaniu z tych definicji i aksjomatów ró¿nych twierdzeñ.

Pewne problemy geometryczne daj± siê w ten sposób analizowaæ wzglêdnie wygodnie czy ³atwo, ale nie
wszystkie. Je¿eli teraz przyjmiemy, ¿e na przyk³ad na naszej wyidealizowanej p³aszczyznie znajduj±
siê dwie linie przecinaj±ce siê pod k±tem prostym *i* naniesiemy na jedn± z nich, ale nie w miejscu
przeciêcia, jaki¶ punkt albo kreskê, oznaczaj±c j± przy tym liczb± *1*, to uzyskamy w ten sposób
*uk³ad wspó³rzêdnych kartezjañskich*. Wystarczy nam ten jeden, definiuj±cy jednostkê punkt i od razu
bêdziemy mieli jednoznacznie okre¶lon± "podzia³kê", która ka¿demu punktowi na ka¿dej z tych dwóch
linii albo *osi* przyporz±dkowuje unikaln± liczbê rzeczywist± i odwrotnie, ka¿dej liczbie
rzeczywistej przyporz±dkowuje na ka¿dej z osi unikalny punkt.

W ten sposób uzyskujemy metodê wiernego t³umaczenia w obie strony miêdzy obiektami czysto
geometrycznymi, to jest punktami na ka¿dej z osi traktowanej z osobna, a liczbami rzeczywistymi, a
ka¿da taka metoda to pewien izomorfizm. Uzyskujemy od razu te¿ co¶ wiêcej - ka¿demu *punktowi na
p³aszczy¼nie*, który sam z siebie nie ma jeszcze charakteru liczbowego, odpowiada odt±d unikalna
*para liczb*, to jest wspó³rzêdne kartezjañskie tego punktu i odwrotnie, ka¿dej parze liczb
rzeczywistych odpowiada unikalny punkt. Dziêki temu problemy o charakterze *czysto geometrycznym*
(na p³aszczy¼nie) mo¿emy wiernie przet³umaczyæ na problemy *liczbowe*, a z kolei dziêki temu czêsto
(choæ nie zawsze) ³atwiej je rozwi±zaæ albo lepiej zrozumieæ. Co wiêcej, pewne problemy liczbowe,
które mog³yby siê nam wcale pocz±tkowo nie kojarzyæ z geometri±, mog± siê okazaæ wiernie
przet³umaczalne na problemy geometryczne i mo¿e siê równie¿ okazaæ, ¿e w tej wersji s± dla nas
³atwiejsze albo bardziej zrozumia³e. A czasem dzieje siê i tak, ¿e *odkrywamy* czy raczej
*znajdujemy* pewne obiekty geometryczne, które najpewniej nie przysz³y by nam w ogóle do g³owy,
gdyby¶my nie dotarli do nich po¶rednio, najpierw rozwa¿aj±c jakie¶ problemy o charakterze liczbowym.

W [artykule](https://czasopisma.uwm.edu.pl/index.php/pp/article/view/9731/7171) na temat
przyczynowo¶ci, który napisa³em g³ównie z my¶l± o odbiorcach próbuj±cych uprawiaæ psychologiê
naukow± i o którym wspomina³em ju¿ we wstêpie, równie¿ korzystam z pewnego izomorfizmu, w dodatku z
izomorfizmu, którego jedn± stron± s± programy komputerowe. Dziêki temu mog³em tam ilustrowaæ
abstrakcyjne zagadnienia i pojêcia teorii wnioskowania przyczynowego za pomoc± bardzo prostych
symulacji, maj±c przy tym pewno¶æ, ¿e da siê w ten sposób *wiernie*, to jest bez zniekszta³ceñ,
*zrealizowaæ* modele przyczynowe jako komputerowe programy. Mam wra¿enie, ¿e takie podej¶cie pozwala
lepiej poczuæ realno¶æ modeli przyczynowych, a ju¿ na pewno pozwala uczyæ siê ich w³a¶ciwo¶ci
poprzez interakcjê na przyk³ad z jêzykiem
[R](https://en.wikipedia.org/wiki/R_(programming_language)), co dla wielu psychologów mo¿e byæ
znacznie ³atwiejsze, tym bardziej, ¿e czê¶æ ju¿ ten jêzyk chocia¿ trochê zna, ni¿ rozwi±zywanie
problemów rachunkowych, których rozwi±zania wnioskowanie przyczynowe jako takie czasami wymaga.

Zwróæ proszê uwagê, ¿e chocia¿ prawie na pewno na pocz±tku to by³o dla Ciebie dosyæ trudne, bo to
jest prawie dla wszystkich pocz±tkowo trudne, a ju¿ na pewno takie by³o pocz±tkowo dla mnie, to
jednak oswojenie siê z izomorfizmem miêdzy na przyk³ad kszta³tami trójk±tów z jednej strony i
liczbowymi wielko¶ciami ich wewnêtrznych katów i d³ugo¶ciami ich boków sta³o siê dla Ciebie z czasem
dosyæ naturalne. Za³o¿ê siê, ¿e czasami, a mo¿e i przez wiêkszo¶æ czasu, nie zdawa³a¶ sobie nawet
sprawy z tego, ¿e k±ty i d³ugo¶ci odcinków po prostu *s±* dla Ciebie liczbami *dziêki temu*, ¿e
jawnie albo w tle zawsze wtedy by³ obecny jaki¶ ustalony uk³ad kartezjañski. Ta ogromna *swoboda w
prze³±czaniu siê miêdzy dwoma ró¿nymi punktami widzenia* - geometrycznym i liczbowym - na w istocie
*ten sam* problem, a tak¿e mo¿liwo¶æ skutecznego korzystania z tej swobody, by³yby nieosi±galne,
gdyby nie opiera³y siê na idealnej odpowiednio¶ci miêdzy dwoma, dobrze okre¶lonymi rodzajami
abstrakcyjnych struktur.

Izomorfizm, który zachowuje strukturê obydwu przestrzeni (takie obiekty jak zbiór liczb
rzeczywistych matematycy równie¿ nazywaj± przestrzeniami), czyli jest, mówi±c kolokwialnie, wiernym
t³umaczeniem w obie strony, to zatem potê¿ne narzêdzie *rozwi±zywania* rozmaitych problemów, jak
równie¿ potê¿ne narzêdzie s³u¿±ce do lepszego ich *zrozumienia*. Swoj± si³ê zawdziêcza tak naprawdê
temu, ¿e pozwala nam przekroczyæ pewne ograniczenia o charakterze *psychologicznym*. Dla nas, ludzi,
to, czy dany problem bêdzie ³atwy czy trudny do rozwi±zania albo zrozumienia czêsto w *ogromnym*
stopniu zale¿y od przyjêtego *punktu widzenia* na ten problem. Dlatego miêdzy innymi tak chêtnie
korzystamy z analogii i metafor i tak bardzo je sobie cenimy. A zachowuj±cy strukturê izomorfizm to
w³a¶nie pewien rodzaj doskona³ej analogii.

Izomorfizm Curry'ego-Howarda pozwala osi±gn±æ co¶ podobnego do tego, co umo¿liwia uk³ad
kartezjañski, tylko na znacznie wy¿szym, mo¿na powiedzieæ ¿e wrêcz zapieraj±cym dech w piersiach
poziomie ogólno¶ci. ¯eby zacz±æ przygodê z tym izomorfizmem, trzeba tylko æwiczyæ prze³±czanie siê
miêdzy dwoma, dobrze okre¶lonymi, ale pocz±tkowo z konieczno¶ci trochê obcymi sposobami patrzenia na
*typy*.

Byæ mo¿e jedn± z g³ównych trudno¶ci pojawiaj±cych siê pocz±tkowo podczas uczenia siê tego podej¶cia
jest to, ¿e matematyka "rozgrywa siê" wtedy czy mo¿e "istnieje" w³a¶nie g³ównie na poziomie
typów. Gdy ju¿ jednak zd±¿ysz siê z tym choæ trochê oswoiæ, Twoja zdolno¶æ do rozumienia tre¶ci
matematycznych albo "matematyzacji" problemów czy pojêæ, które same z siebie nie maj± jeszcze
matematycznego charakteru, zacznie siê rozwijaæ znacznie szybciej, ni¿ gdyby¶ próbowa³a j± rozwijaæ
w bardziej tradycyjny sposób.

Próbuj±c zrozumieæ, o czym jest nastêpny rozdzia³, uruchomisz proces zasadniczo taki sam, jak ten
dziêki któremu by³a¶ w stanie rozwi±zywaæ problemy geometryczne, które czasem wydawa³y Ci siê
proste, ale które bez wcze¶niejszego przyzwyczajenia siê do patrzenia na nie jako na problemy
liczbowe by³yby tak trudne, ¿e byæ mo¿e nawet nierozwi±zywalne. W dodatku uczenie siê matematyki
*metod± prób i b³êdów*, to jest w ramach mniej lub bardziej swobodnej *eksploracji*, bêdzie mia³o
znacznie wiêkszy sens, poniewa¿ wszystko, czego by¶ nie spróbowa³a, bêdzie natychmiast sprawdzone
pod wzglêdem poprawno¶ci przez praktycznie niezawodny program. Pojawi siê dziêki temu mo¿liwo¶æ
u¿ywania matematyki, oczywi¶cie w granicach wyznaczonych czê¶ciowo przez aktualny poziom Twojego
zrozumienia i wiedzy, w sposób w pewnym sensie maksymalnie *twórczy*.

Curry i Howard odkryli, ¿e istnieje pewien zachowuj±cy strukturê izomorfizm miêdzy systemami logiki
formalnej, takimi jak logika konstruktywna, nazywana równie¿ logik± intuicjonistyczn±, i systemami
s³u¿±cymi do badania miêdzy innymi zagadnieñ zwi±zanych z obliczalno¶ci±, takimi jak rachunek lambda
z typami. Je¿eli masz ju¿ w tym momencie takie w±tpliwo¶ci, to od razu Ciê zapewniê, ¿e korzystaj±c
z tego izomorfizmu nie bêdziemy wcale ograniczeni do jakiej¶ konkretnej logiki, takiej jak na
przyk³ad logika konstruktywna.

Dla naszych potrzeb to, ¿e izomorfizm Curry'ego-Howarda istnieje, oznacza tyle, ¿e *ka¿dy* problem
matematyczny mo¿emy dziêki niemu postrzegaæ jako problem dotycz±cy *programowania* i próbowaæ go
rozwi±zaæ jako taki, tak samo jak dziêki uk³adowi kartezjañskiemu ka¿dy problem geometryczny mo¿emy
próbowaæ zamieniæ na odpowiadaj±cy mu problem analityczny (liczbowy) i próbowaæ go rozwi±zaæ albo
tylko inaczej zrozumieæ pos³uguj±c siê na przyk³ad operacjami algebraicznymi, takimi jak dodawanie
czy mno¿enie liczb. Jedyn± rzecz±, której bêdziemy potrzebowaæ, poza cierpliwo¶ci± w uczeniu siê
tego podej¶cia, ¿eby uprawiaæ matematykê - a pó¼niej równie¿ ogólniej rozumiane badania o
meta-teoretycznym charakterze - jako programowanie, bêdzie zarazem sztywny i wystarczaj±co
ekspresyjny jêzyk. Ten, na którym oparty jest Lean, jest w³a¶nie jednym z takich jêzyków.
