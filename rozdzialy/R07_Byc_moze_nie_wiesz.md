## O czym teraz będzie

Ten rozdział ma Cię przygotować do nowego tematu, który pojawi się w rozdziale następnym. Nie ma tu
zadań, za to jest coś, co myślę, że Ci się potem przyda. Wkrótce zaczniemy korzystać z
*izomorfizmu*, a właściwie [*odpowiedniości* (ang. correspondence)
*Curry'ego-Howarda*](https://pl.wikipedia.org/wiki/Izomorfizm_Curry%E2%80%99ego-Howarda) (tego
samego Curry'ego, który już wcześniej się pojawił). Nazwa może i brzmi groźnie, ale gdy zrozumiesz,
w jaki sposób będziemy ten izomorfizm traktować, stanie się mam nadzieję jasne, że to nic
strasznego.

Na początek powiem Ci coś o izomorfizmach w ogóle.

<hr>

# Być może nie wiesz, że już wiesz, czym jest izomorfizm, a niebawem dowiesz się jeszcze, czym jest izomorfizm Curry'ego-Howarda

W szkole podstawowej zaczęłaś korzystać z [układu współrzędnych
kartezjańskich](https://pl.wikipedia.org/wiki/Uk%C5%82ad_wsp%C3%B3%C5%82rz%C4%99dnych_kartezja%C5%84skich),
czyli z dwóch osi z podziałkami, na które były naniesione liczby. Przypuszczam, że z czasem stało
się to dla Ciebie na tyle naturalne, że może nawet nie zastanawiałaś się później, jaką właściwie
rolę pełnią te dwie osie.

Jak być może wiesz, ten układ współrzędnych wprowadził do matematyki w *XVII* wieku francuski
matematyk, filozof i fizyk [René
Descartes](https://pl.wikipedia.org/wiki/Ren%C3%A9_Descartes). Pomysł Kartezjusza był prawdziwą
rewolucją, ponieważ pozwala *wiernie przetłumaczyć problemy jednego rodzaju*, w tym wypadku
geometryczne, *na odpowiadające im problemy innego rodzaju*, w tym wypadku liczbowe czy
analityczne. To jest wierne tłumacznie w tym znaczeniu, że nie tracimy wtedy ani nie zniekształcamy
żadnych własności problemu geometrycznego.

Tego rodzaju sposoby *wiernego tłumaczenia w obie strony* nazywamy w matematyce (zachowującymi
strukturę) *izomorfizmami*. Słowo "izomorfizm" jest połączeniem dwóch starogreckich słów, *ἴσος*
czyli taki sam, i *μορφή* czyli kształt lub forma. Nawiasem mówiąc, starogrecki to wspaniały język;
ma piękny alfabet, kilka różnych rodzajów akcentów i liczbę podwójną. Ponieważ byłem wtedy
nieznośnym snobem, uczyłem się go[^1] przez rok w liceum, stąd wiem.

Układu współrzędnych kartezjańskich używamy w taki oto sposób: Punktem wyjścia jest *abstrakcyjnie
rozumiana płaszczyzna*. Nie zdziwiłbym się, gdybyś na hasło "płaszczyzna" pomyślała, nawet jeśli nie
od razu, o układzie współrzędnych, albo o czymś, co może się łatwo kojarzyć z liczbami. I tu pojawia
się problem - całkiem możliwe, że tak jak ja, *zbyt dobrze* (ze względu na cel tego rozdziału)
przyzwyczaiłaś się do izomorfizmu opartego na układzie współrzędnych kartezjańskich. Proszę Cię
więc, żebyś teraz wyobraziła sobie płaszczyznę "całkiem nieliczbową", jeśli można tak powiedzieć.
Taką płaszczyznę, którą mogłoby sobie wyobrazić dziecko, które jeszcze nie poznało pojęcia liczby.

Jak wiesz, nie chodzi tu o żadną konkretną płaszczyznę *fizyczną*, tylko o coś w rodzaju idealnie
płaskiej powierzchni bez granic; o płaszczyznę, którą można sobie tylko wyobrazić i opisać, ale
która nie może istnieć jako obiekt fizyczny. Taką, o której zdają się chętnie myśleć matematycy i
filozofowie. Bez dodatkowych założeń, a właściwie *wyborów pojęciowych*, ta płaszczyzna jako taka
*nie* ma charakteru liczbowego, tylko czysto geometryczny, albo czysto przestrzenny, jak wolisz.
Podobnie na przykład jakiś konkretny okrąg na tej płaszczyźnie *jako taki*, który moglibyśmy sobie
wyobrazić i który moglibyśmy próbować systematycznie analizować, *nie* ma jeszcze charakteru
liczbowego.

[Geometria euklidesowa](https://pl.wikipedia.org/wiki/Geometria_euklidesowa), o której też już być
może słyszałaś, jest pierwszym w historii przykładem aksjomatycznej teorii tego typu struktur. Być
może jednak nie wiedziałaś dotąd, że liczby nie odgrywają w tej teorii *żadnej* roli. W
[*Elementach*](http://aleph0.clarku.edu/~djoyce/java/elements/toc.html) Euklidesa znajdziemy tylko
*rysunkowe reprezentacje* wyidealizowanych obiektów geometrycznych i wyrażone w języku naturalnym
definicje i aksjomaty, które te obiekty mają spełniać, a także rozumowania polegające na
wyprowadzaniu z tych definicji i aksjomatów różnych twierdzeń. No może takie na przykład pojęcie
*trój*kąta wymaga posługiwania się liczbą $3$, ale chyba wiesz, o co mi chodzi.

Na przykład, jest tam aksjomat, który mówi, że wszystkie kąty proste są równe. Być może od razu
myślisz o kątach prostych jako takich, które mają *90* stopni, a o równości kątów jako o równości
pewnych wielkości *liczbowych*, ale dla Euklidesa to *nie* były liczby. Mógł pisać o *wielkościach*
kątów, na przykład o tym, że jeden kąt jest większy od drugiego, w takim samym znaczeniu, w jakim
ktoś pozbawiony "ośrodka liczbowego w mózgu" mógłby ocenić, które spodnie ma krótsze, które dłuższe,
a które tak samo długie.

Pewne problemy geometryczne dają się w taki czysto geometryczny sposób analizować względnie
wygodnie, ale zdecydowanie nie wszystkie. Jeżeli teraz zdecydujemy, że na naszej wyidealizowanej
płaszczyznie znajdują się (bo my je tam mentalnie wstawiliśmy) dwie linie przecinające się pod kątem
prostym *i* naniesiemy na jedną z nich, ale nie w miejscu przecięcia, jakiś punkt a może kreskę,
którą oznaczymy (sobie "w głowie") liczbą *1*, to dzięki tym *decyzjom* (a nie *założeniom*)
uzyskamy *układ współrzędnych kartezjańskich*.

Wystarczy nam ten jeden, definiujący jednostkę odległości punkt, i od razu będziemy mieli
jednoznacznie wyznaczoną, bo wynikającą z niego w naturalny sposób podziałkę na obydwu osiach.
Dzięki połączeniu tych elementów, to jest dwóch przecinających się osi i wynikającej z wybranej
jednostki odległości podziałki na obu, nasz (całkowicie zmyślony) układ współrzędnych działa jak
doskonały tłumacz. Ten tłumacz każdemu punktowi na każdej z osi (ale uwaga, nie mówimy jeszcze o
punktach w dowolnym miejscu na *płaszczyźnie*) przyporządkowuje unikalną liczbę rzeczywistą, i
odwrotnie, każdej liczbie rzeczywistej przyporządkowuje na każdej z osi unikalny punkt.

W ten sposób uzyskujemy metodę wiernego tłumaczenia w obie strony między pewnymi obiektami czysto
geometrycznymi, to jest punktami *na* każdej z osi traktowanej z osobna i *pojedynczymi* liczbami
rzeczywistymi, a każda z tych *dwóch* metod (mamy przecież *dwie* osie) to pewien izomorfizm.
Uzyskujemy od razu też coś więcej: każdemu punktowi *na płaszczyźnie*, a więc niekoniecznie na
którejś z dwóch osi, który sam z siebie nie ma jeszcze charakteru liczbowego, odpowiada odtąd
unikalna *uporządkowana para* liczb; to właśnie współrzędne kartezjańskie tego punktu. Ten drugi
rodzaj tłumaczenia polega na zastosowaniu obydwu metod tłumaczenia opartych na każdej z osi
*równolegle* (albo *jednocześnie) i w sposób *skoordynowany*.

Każda z tych odpowiedniości działa w obie strony, a więc również każdej parze uporządkowanej liczb
rzeczywistych odpowiada unikalny punkt na płaszczyźnie. A ponieważ każdy *obiekt geometryczny* na
płaszczyźnie możemy rozumieć jako pewien *zbiór punktów*, to każdy taki obiekt odpowiada odtąd
pewnemu zbiorowi uporządkowanych par liczb.

Nawiasem mówiąc, to muszą być pary *uporządkowane*, bo gdyby kolejność liczb w parze nie miała
znaczenia, to nie byłoby wiadomo, czy "punkt (1, 2)" oznacza taki punkt na płaszczyźnie, któremu
odpowiada "cień" oznaczony jako 1 na pierwszej osi i jako 2 na drugiej, czy jako 1 na drugiej osi i
jako 2 na pierwszej. A zatem, jawnie lub niejawnie, na przykład posługując się jakąś powszechnie
przyjętą konwencją, musimy wybrać, którą z osi będziemy traktować jako pierwszą. I to musi być *nasz
wybór*. To *ktoś z nas* musi *wybrać*, która oś jest pierwsza albo "pozioma", bo żadna "własność
własna" ich od siebie nie odróżnia; gdyby obrócić ten układ współrzędnych względem osi symetrii
przecinającej go po skosie, uzyskany układ byłby nieodróżnialny od wyjściowego.

Dzięki układowi kartezjańskiemu problemy o charakterze *czysto geometrycznym* (na płaszczyźnie)
możemy wiernie przetłumaczyć na problemy *liczbowe*, a z kolei dzięki temu często (choć nie zawsze)
jest nam łatwiej je rozwiązać lub zrozumieć. Co więcej, pewne problemy liczbowe, które mogłyby się
nam wcale początkowo nie kojarzyć z geometrią, mogą się okazać wiernie przetłumaczalne na problemy
geometryczne, i może się również okazać, że w tej wersji są dla nas łatwiejsze albo bardziej
zrozumiałe. A czasami dzieje się i tak, że *odkrywamy* albo *znajdujemy* pewne obiekty geometryczne,
które najpewniej nie przyszłyby nam do głowy, gdybyśmy nie dotarli do nich pośrednio, najpierw
rozważając problemy o charakterze liczbowym, bo te obiekty są tak dziwne lub trudne do wyobrażenia.

W [artykule](https://czasopisma.uwm.edu.pl/index.php/pp/article/view/9731/7171) na temat
przyczynowości, który napisałem głównie z myślą o odbiorcach próbujących uprawiać psychologię
naukową, i o którym wspomniałem we wstępie, również skorzystałem z pewnego izomorfizmu, w dodatku
takiego, którego jedną stroną są programy komputerowe. Dzięki temu mogłem zilustrować abstrakcyjne
zagadnienia i pojęcia matematycznej teorii wnioskowania przyczynowego za pomocą prostych symulacji,
mając przy tym pewność, że da się tak *wiernie*, to jest bez zniekształceń, *zrealizować* modele
przyczynowe jako programy komputerowe. Mam wrażenie, że takie podejście pozwala lepiej poczuć
realność modeli przyczynowych, a na pewno pozwala uczyć się ich właściwości poprzez interakcję na
przykład z językiem [R](https://en.wikipedia.org/wiki/R_(programming_language)), co dla wielu
psychologów może być znacznie mniej stresujące od rozwiązywania problemów rachunkowych.

Zwróć proszę uwagę, że chociaż prawie na pewno na początku to było dla Ciebie dosyć trudne, bo to
jest chyba dla wszystkich początkowo trudne, a już na pewno było takie początkowo dla mnie, to
jednak oswojenie się z izomorfizmem między na przykład kształtami trójkątów z jednej strony i
liczbowymi wielkościami ich wewnętrznych katów i długościami ich boków z drugiej stało się dla
Ciebie w końcu naturalne. Założę się nawet, że czasami, a może i przez większość czasu, nie zdawałaś
sobie sprawy z tego, że kąty i długości odcinków po prostu *są* dla Ciebie *między innymi* liczbami
*dzięki temu*, że jawnie albo w tle zawsze wtedy był obecny układ kartezjański.

Przypuszczam, że podobnie jak ja, nie jesteś w stanie sobie dobrze wyobrazić jak to było nie myśleć
o obiektach geometrycznych w taki sposób. A przecież był kiedyś taki czas, kiedy ten sposób był Ci
całkiem obcy i wszystkie kształty były *tylko* kształtami. W pewnym momencie, stopniowo i z pewnym
wysiłkiem, zaczęłaś się uczyć, jak można systematycznie przypisywać na przykład kątom i odcinkom
liczby. Wtedy jeszcze te dwa punkty widzenia, czysto geometryczny i powiedzmy kartezjański, były dla
Ciebie odrębne, ale znałaś już oba. A że musiałaś się często między nimi przełączać, robiłaś to
długo i oba tak dobrze do siebie pasowały, to z czasem dwa punkty widzenia złączyły się w jeden. I
teraz muszę przez kilka akapitów próbować Ci - i jednocześnie sobie! - ułatwić ich chwilowe ponowne
oddzielenie.

Czy to nie ciekawe, jak taki z pozoru niewinny izomorfizm potrafi radykalnie zmienić nasz sposób
myślenia? Ogromna *swoboda w przełączaniu się między dwoma różnymi punktami widzenia* -
geometrycznym i liczbowym - na w istocie *ten sam* problem, a także możliwość *skutecznego
korzystania* z tej swobody, byłyby nieosiągalne, gdyby nie było *wystarczająco dobrej
odpowiedniości* między dwoma, *dobrze określonymi rodzajami abstrakcyjnych struktur*. Żeby to
wszystko tak dobrze działało, te dwa rodzaje struktur muszą też odpowiadać różnym *sposobom opisu* i
*myślenia*, czyli (przynajmniej do pewnego stopnia) odrębnym *językom*, z których jeden pozwala w
tym wypadku *zapisywać* wyrażenia, a drugi wymaga, aby je *rysować*.

To może jeszcze wyobraź sobie teraz, że układ współrzędnych gdzieś znika i ta płaszczyzna łamie się
i zamyka wokół Ciebie w sześcian jasnego pokoju. A na podłodze pojawia się, powiedzmy, mysz. Biegnie
w Twoją stronę i zarazem nie całkiem w Twoją stronę, tak jakby chciała szybko dotrzeć do czegoś, co
znajduje się za Tobą i jednocześnie bała się do Ciebie zbliżyć. To wszystko jesteś w stanie niemal
natychmiast zobaczyć tylko na podstawie kilkusekundowego ruchu ciała myszy, prawda? I masz wtedy
*niemal całkowitą pewność*, że ta mysz to właśnie *robi*, to jest że *do czegoś dąży*. Nie
rozmawialiście wcześniej (o ile Ci wiadomo) i nie wiesz, skąd się wzięła, na pewno też nie masz
żadnej wiedzy na temat złożonych procesów biologicznych sterujących jej ruchami, a jednak wiesz,
prawie na pewno, że ta mysz *stara się gdzieś szybko dotrzeć, omijając Cię, ponieważ stoisz jej na
drodze*. Skąd to wszystko wiesz? I jak bardzo, a szczególnie *w jaki sposób* mogłabyś się Twoim
zdaniem w takiej sytuacji mylić?

Przed chwilą namawiałem Cię, żebyś spróbowała oddzielić dwa sposoby postrzegania obiektów
geometrycznych, czysto przestrzenny i czysto liczbowy, i postarała się myśleć do pewnego stopnia
posługując się tylko jednym z nich. A czy byłabyś w stanie zobaczyć ruch myszy powstrzymując się od
patrzenia na niego w kategoriach celu, możliwych sposobów osiągania go i przeszkód w jego
osiągnięciu? Bez tego nawykowego *interpretowania* ruchów myszy jako skutków informacji docierającej
do jej zmysłów i tego, do czego ta mysz dąży? Czy jesteś w stanie popatrzeć na taką poruszającą się
w bardzo regularny, niemal natychmiast intuicyjnie zrozumiały dla Ciebie sposób mysz, tak jak
patrzysz na przykład na rozpuszczającą się w gorącej wodzie esencję herbaty? A jak myślisz, co mogło
by Ci ułatwić patrzenie w ten początkowo nienaturalny sposób na proces rozmowy, albo na przykład na
rozgrywający się dłużej akt pisania ksiażki?

To może wyobraź sobie jeszcze, że Twoja interakcja z myszą biegnącą po podłodze została nagrana
przez kamerę, o której istnieniu wcześniej nie wiedziałaś. Odkryłaś później to nagranie, a razem z
nim wiele innych takich nagrań, pochodzących z takiego samego pokoju jak ten, w którym niedawno
byłaś. I odkryłaś też wtedy coś jeszcze - na wszystkich tych nagraniach, za wyjątkiem tego, na
którym widać Ciebie, widać taką samą, właściwie identyczną mysz, poruszającą się w taki sam
sposób.

Ale może wróćmy już do przerwanego wątku, bo na ten ostatni jest trochę za wcześnie.

Izomorfizm, który *zachowuje strukturę* obydwu przestrzeni (takie obiekty jak zbiór liczb
rzeczywistych matematycy również nazywają {abstrakcyjnymi} przestrzeniami, chyba po prostu dlatego,
że ludzie wolą myśleć w kategoriach przestrzennych niż na przykład algebraicznych), czyli jest,
mówiąc kolokwialnie, wiernym (i *zachowujym sens*) tłumaczeniem w obie strony, to zatem potężne
narzędzie *rozwiązywania* i *rozumienia* rozmaitych problemów. Swoją siłę izomorfizm zawdzięcza
między innymi temu, że pozwala nam przekroczyć pewne ograniczenia o charakterze
*psychologicznym*. Dla *nas*, ludzi, to, czy dany problem będzie łatwy czy trudny do rozwiązania
albo zrozumienia często w *ogromnym* stopniu zależy od przyjętego *punktu widzenia*, który jest
zwykle *sposobem opisu*, albo nawet całym mniej lub bardziej odrębnym *językiem*. Dlatego między
innymi tak chętnie korzystamy z analogii i metafor, i tak bardzo je sobie cenimy. A zachowujący
strukturę izomorfizm jest *doskonałą* i jednocześnie *pełną analogią*.

Izomorfizm Curry'ego-Howarda pozwala osiągnąć coś podobnego do tego, co umożliwia układ
kartezjański, tylko na wyższym poziomie ogólności, czy może raczej na poziomie w pewnym sensie
metamatematycznym, bo pozwala na niemal jednoczesne posługiwanie się myśleniem matematycznym i
programistycznym. Żeby zacząć przygodę z tym izomorfizmem, trzeba tylko cierpliwie ćwiczyć
przełączanie się między dwoma, dobrze określonymi, ale początkowo z konieczności trochę obcymi
sposobami patrzenia na *typy*.

Być może jedną z głównych trudności pojawiających się podczas przyzwyczajania się do tego punktu
widzenia jest właśnie to, że matematyka "rozgrywa się" wtedy czy może "istnieje" głównie na poziomie
typów. Co ciekawe, pozornie paradoksalnie, to bywa nawet trudniejsze dla doświadczonych
*informatyków*, dlatego, że w typowych językach programowania systemy typów odgrywają całkiem inną,
dosyć przyziemną rolę. Za to gdy zdążysz się już trochę oswoić z tym "nietypowym myśleniem o
typach", Twoja zdolność rozumienia treści matematycznych albo "matematyzacji" problemów czy pojęć,
które same z siebie nie mają jeszcze w oczywisty sposób matematycznego charakteru, zacznie się moim
zdaniem rozwijać znacznie szybciej, niż gdybyś próbowała rozwijać ją w bardziej tradycyjny sposób.

Próbując zrozumieć, o czym jest mowa w następnym rozdziale, uruchomisz proces zasadniczo taki sam
jak ten, dzięki któremu byłaś w stanie rozwiązywać problemy geometryczne, które czasem wydawały Ci
się proste, ale które bez wcześniejszego przyzwyczajenia się do patrzenia na nie jako na problemy
liczbowe byłyby tak trudne, że być może nawet nierozwiązywalne. To znaczy, całe ogromne (i
jednocześnie bardzo "podstawowe") obszary matematyki staną się dla Ciebie znacznie łatwiejsze w
obsłudze. W dodatku uczenie się matematyki *metodą prób i błędów*, to jest w ramach mniej lub
bardziej swobodnej *eksploracji*, będzie miało większy sens, ponieważ wszystko, czego byś nie
spróbowała, będzie automatycznie sprawdzone pod względem poprawności przez praktycznie niezawodny
program. A że nie będzie obok żadnego nauczyciela, to też nikt Cię nie będzie *oceniał*. Pojawi się
dzięki temu możliwość używania matematyki, w granicach wyznaczonych tylko przez aktualny poziom
Twojego zrozumienia i wiedzy, w sposób w pewnym sensie maksymalnie *twórczy*.

Curry i Howard odkryli zachowujący strukturę izomorfizm, a dokładniej odpowiedniość bliską
izomorfizmowi, między systemami logiki formalnej, takimi jak logika konstruktywna, nazywana również
*intuicjonistyczną*, i systemami służącymi do badania między innymi zagadnień związanych z
obliczalnością, takimi jak rachunek lambda z typami, z którym zetknęłaś się już w poprzednich
rozdziałach. Jeżeli masz już w tym momencie takie wątpliwości, to zapewniam, że korzystając z tego
izomorfizmu nie będziemy ograniczeni do jakiejś konkretnej logiki, takiej jak logika konstruktywna;
wręcz przeciwnie, będziemy mogli używać *całkiem dowolnych* logik, bo każda logika to ostatecznie
pewien system *sztywnych reguł wnioskowania*, a każdy taki system można zakodować w języku teorii
typów, a więc również w Leanie.

Dla naszych potrzeb to, że izomorfizm Curry'ego-Howarda istnieje, oznacza w zasadzie *tylko* tyle,
że *każdy* problem matematyczny możemy dzięki niemu postrzegać jako problem dotyczący
*programowania* i próbować go rozwiązać lub tylko lepiej zrozumieć jako taki. Tak samo jak dzięki
układowi kartezjańskiemu każdy problem geometryczny (na płaszczyźnie) możemy próbować zamienić na
odpowiadający mu problem analityczny (liczbowy) i próbować go rozwiązać, albo tylko inaczej
zrozumieć, posługując się na przykład operacjami algebraicznymi takimi jak dodawanie czy mnożenie.

Jedyną rzeczą, której będziemy potrzebować, żeby uprawiać matematykę, a później również ogólniej
rozumiane badania o metateoretycznym charakterze jako programowanie (a jak się okaże później,
również *meta*programowanie), będzie zarazem sztywny i wystarczająco ekspresyjny język. Ten, na
którym oparty jest Lean, jest właśnie jednym z takich języków. A tym, co przede wszystkim sprawia,
że jest tak ekspresyjny, że pozwala całkowicie sformalizować całą matematykę, a więc też wszystko,
co tylko da się *zmatematyzować*, czyli w pewnym sensie wszystko, co można powiedzieć jasno, a
dzięki temu jasno zrozumieć, są *typy zależne*.

### Przypisy

[^1]: Z
    [tej](https://lubimyczytac.pl/ksiazka/81282/hellenike-glotta-podrecznik-do-nauki-jezyka-greckiego)
    książki.
