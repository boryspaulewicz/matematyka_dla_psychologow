# Izomorfizm Curry'ego-Howarda

Ten rozdział ma Cię przygotować do nowego tematu, który pojawi się w rozdziale następnym. Nie ma tu
żadnych zadań, są tylko moje próby przekonania Cię, żeby się nie poddawać. Za chwilę zaczniemy
korzystać z izomorfizmu Curry'ego-Howarda (tak, tego Curry'ego, który już wcześniej się pojawił). Ta
nazwa może i brzmi groźnie, ale gdy zrozumiesz, w jaki sposób będziemy go traktować, będzie dla
Ciebie jasne, że to nic strasznego. Na początek powiem Ci coś moim zdaniem ciekawego o izomorfizmach
w ogóle.

W szkole podstawowej zaczęłaś korzystać z [układu współrzędnych
kartezjańskich](https://pl.wikipedia.org/wiki/Uk%C5%82ad_wsp%C3%B3%C5%82rz%C4%99dnych_kartezja%C5%84skich),
czyli z dwóch osi z podziałkami, na które były naniesione liczby. Przypuszczam, że z czasem stało
się to dla Ciebie na tyle naturalne, że może nawet nie zastanawiałaś się już później, jaką dokładnie
rolę spełniają te dwie osie.

Jak być może wiesz, ten układ współrzędnych wprowadził do matematyki jeszcze w 17 wieku francuski
matematyk, filozof i fizyk [René
Descartes](https://pl.wikipedia.org/wiki/Ren%C3%A9_Descartes). Pomysł Kartezjusza był wtedy
prawdziwą rewolucją, dlatego że pozwala *wiernie przetłumaczyć* dowolny problem geometryczny na
odpowiadający mu problem liczbowy czy analityczny. To jest wierne tłumacznie w tym znaczeniu, że nie
tracimy wtedy ani nie zniekształcamy żadnych własności problemu geometrycznego. Takie sposoby
wiernego tłumaczenia *w obie strony* nazywamy w matematyce właśnie (zachowującymi strukturę)
*izomorfizmami*. To słowo jest połączeniem dwóch starogreckich słów, ἴσος czyli taki sam i μορφή
czyli kształt lub forma. Nawiasem mówiąc, starogrecki to wspaniały język; ma piękny alfabet, kilka
różnych rodzajów akcentów i liczbę podwójną. Na właną rękę uczyłem się go kiedyś przez rok w liceum,
to wiem (tak, byłem wtedy straszliwie pretensjonalny).

Układu współrzędnych kartezjańskich używamy w taki oto sposób: Punktem wyjścia jest *abstrakcyjnie
rozumiana płaszczyzna*. Nie zdziwiłbym się, gdybyś na hasło "płaszczyzna" od razu automatycznie
pomyślała o układzie współrzędnych, albo o czymś, co może się łatwo kojarzyć z liczbami. I tu mamy
problem - całkiem możliwe, że *zbyt dobrze* przyzwyczaiłaś się do izomorfizmu opartego na układzie
współrzędnych kartezjańskich. Proszę Cię, żebyś teraz wyobraziła sobie płaszczyznę całkiem
nieliczbową, jeśli można tak powiedzieć. Taką płaszczyznę, którą mogłoby sobie wyobrazić dziecko,
które jeszcze nie poznało pojęcia liczby.

Nie chodzi tu o żadną konkretną płaszczyznę *fizyczną*, tylko o coś w rodzaju idealnie płaskiej
powierzchni bez żadnych granic; takiej powierzchni, którą można sobie tylko wyobrazić albo opisać,
ale która nie może istnieć realnie. Taką, o której chętnie myślą matematycy albo filozofowie. Bez
dodatkowych założeń ta płaszczyzna jako taka *nie* ma charakteru liczbowego, tylko czysto
geometryczny, albo czysto przestrzenny, jak wolisz. Podobnie na przykład jakiś konkretny okrąg na
tej płaszczyźnie *jako taki*, który moglibyśmy sobie wyobrazić i który moglibyśmy próbować
systematycznie analizować, *nie* ma jeszcze charakteru liczbowego.

[Geometria euklidesowa](https://pl.wikipedia.org/wiki/Geometria_euklidesowa), o której być może już
słyszałaś, jest (pierwszym w historii) przykładem aksjomatycznej teorii tego typu struktur. Być może
jednak nie wiedziałaś dotąd, że liczby nie odgrywają w tej teorii *żadnej* roli. W
[Elementach](http://aleph0.clarku.edu/~djoyce/java/elements/toc.html) Euklidesa znajdziemy tylko
*rysunkowe reprezentacje* wyidealizowanych obiektów geometrycznych i wyrażone w języku naturalnym
definicje i aksjomaty, które te obiekty mają spełniać, a także rozumowania polegające na
wyprowadzaniu z tych definicji i aksjomatów różnych twierdzeń. Na przykład, znajduje się tam
aksjomat, który mówi, że wszystkie kąty proste są sobie równe. Ty pewnie od razu myślisz o kątach
prostych jako takich, które wynoszą 90 stopni, ale to jest przecież liczba. Dla Euklidesa to nie
były liczby. Mógł pisać o wielkościach kątów, na przykład o tym, że jeden kąt jest większy od
drugiego, w takim samym znaczeniu, w jakim ktoś, kto na przykład nie miałby "ośrodka liczbowego" w
mózgu mógłby bez trudu ocenić, które spodnie ma krótsze a które ma dłuższe. Do pewnych operacji tego
rodzaju w ogóle nie potrzeba liczb.

Pewne problemy geometryczne dają się w taki czysto geometryczny sposób analizować względnie wygodnie
czy łatwo, ale zdecydowanie nie wszystkie. Jeżeli teraz przyjmiemy, że na naszej wyidealizowanej
płaszczyznie znajdują się dwie linie przecinające się pod kątem prostym *i* naniesiemy na jedną z
nich, ale nie w miejscu przecięcia, jakiś punkt a może kreskę, którą oznaczymy liczbą *1*, to
uzyskamy w ten sposób *układ współrzędnych kartezjańskich*. Wystarczy nam ten jeden, definiujący
jednostkę odległości punkt i od razu będziemy mieli jednoznacznie określoną "podziałkę" na obydwu
osiach. Dzięki połączeniu tych wszystkich elementów, to jest dwóch przecinających się osi i
podziałki na obu, nasz układ współrzędnych działa właśnie jak tłumacz. Ten tłumacz każdemu punktowi
na każdej z tych dwóch osi przyporządkowuje unikalną liczbę rzeczywistą i odwrotnie, każdej liczbie
rzeczywistej przyporządkowuje na każdej z osi unikalny punkt.

W ten sposób uzyskujemy metodę wiernego tłumaczenia w obie strony między pewnymi obiektami czysto
geometrycznymi, to jest punktami na każdej z osi traktowanej z osobna, a liczbami rzeczywistymi, a
każda taka metoda to pewien izomorfizm. Uzyskujemy od razu też coś więcej - każdemu punktowi *na
płaszczyźnie*, a więc niekoniecznie na którejś z dwóch osi, który sam z siebie nie ma jeszcze
charakteru liczbowego, odpowiada odtąd unikalna *para liczb* i to są właśnie współrzędne
kartezjańskie tego punktu. Ta odpowiedniość działa w obie strony, a więc również każdej parze liczb
rzeczywistych odpowiada unikalny punkt.

Dzięki temu problemy o charakterze *czysto geometrycznym* (na płaszczyźnie) możemy wiernie
przetłumaczyć na problemy *liczbowe*, a z kolei dzięki temu często (choć nie zawsze) łatwiej jest
nam je rozwiązać albo zrozumieć. Co więcej, pewne problemy liczbowe, które mogłyby się nam wcale
początkowo nie kojarzyć z geometrią, mogą się okazać wiernie przetłumaczalne na problemy
geometryczne i może się również okazać, że w tej wersji są dla nas łatwiejsze albo bardziej
zrozumiałe. A czasem dzieje się i tak, że *odkrywamy* czy raczej *znajdujemy* pewne obiekty
geometryczne, które najpewniej nie przyszłyby nam w ogóle do głowy, gdybyśmy nie dotarli do nich
pośrednio, najpierw rozważając jakieś problemy o charakterze liczbowym.

W [artykule](https://czasopisma.uwm.edu.pl/index.php/pp/article/view/9731/7171) na temat
przyczynowości, który napisałem głównie z myślą o odbiorcach próbujących uprawiać psychologię
naukową i o którym wspominałem już we wstępie, również korzystam z pewnego izomorfizmu, w dodatku z
izomorfizmu, którego jedną stroną są programy komputerowe. Dzięki temu mogłem tam ilustrować
abstrakcyjne zagadnienia i pojęcia teorii wnioskowania przyczynowego za pomocą bardzo prostych
symulacji, mając przy tym pewność, że da się w ten sposób *wiernie*, to jest bez zniekształceń,
*zrealizować* modele przyczynowe jako komputerowe programy. Mam wrażenie, że takie podejście pozwala
lepiej poczuć realność modeli przyczynowych, a już na pewno pozwala uczyć się ich właściwości
poprzez interakcję na przykład z językiem
[R](https://en.wikipedia.org/wiki/R_(programming_language)), co dla wielu psychologów może być
znacznie łatwiejsze niż rozwiązywanie problemów rachunkowych.

Zwróć proszę uwagę, że chociaż prawie na pewno na początku to było dla Ciebie dosyć trudne, bo to
jest prawie dla wszystkich początkowo trudne, a już na pewno takie było początkowo dla mnie, to
jednak oswojenie się z izomorfizmem między na przykład kształtami trójkątów z jednej strony i
liczbowymi wielkościami ich wewnętrznych katów i długościami ich boków z drugiej stało się dla
Ciebie z czasem dosyć naturalne. Założę się, że czasami, a może i przez większość czasu, nie
zdawałaś sobie nawet sprawy z tego, że kąty i długości odcinków po prostu *są* dla Ciebie liczbami
*dzięki temu*, że jawnie albo w tle zawsze wtedy był obecny jakiś ustalony układ
kartezjański. 

Właściwie założę się nawet, że podobnie jak ja, nie jesteś w stanie sobie dobrze wyobrazić jak to
było nie myśleć o obiektach geometrycznych w taki sposób. A przecież był kiedyś taki czas, gdy ten
sposób był Ci całkiem obcy i wszystkie kształty były tylko kształtami. W pewnym momencie stopniowo i
z pewnym wysiłkiem zaczęłaś uczyć się jak można systematycznie przypisywać na przykład kątom i
odcinkom liczby. Wtedy jeszcze te dwa punkty widzenia, czysto geometryczny i powiedzmy kartezjański
były dla Ciebie odrębne, ale znałaś już oba. A że musiałaś się często między nimi przełączać,
robiłaś to długo, i oba tak dobrze do siebie pasowały, to z czasem dwa punkty widzenia złączyły się
w jeden. I ja teraz muszę przez kilka akapitów próbować Ci ułatwić ich ponowne oddzielenie. 

Czy to nie ciekawe, jak bardzo taki z pozoru niewinny izomorfizm potrafi zmienić nasz sposób
myślenia? Ta ogromna *swoboda w przełączaniu się między dwoma różnymi punktami widzenia* -
geometrycznym i liczbowym - na w istocie *ten sam* problem, a także możliwość *skutecznego
korzystania* z tej swobody, byłyby nieosiągalne, gdyby nie opierały się na idealnej odpowiedniości
między dwoma, dobrze określonymi rodzajami abstrakcyjnych struktur.

Izomorfizm, który zachowuje strukturę obydwu przestrzeni (takie obiekty jak zbiór liczb
rzeczywistych matematycy również nazywają przestrzeniami), czyli jest, mówiąc kolokwialnie, wiernym
tłumaczeniem w obie strony, to zatem potężne narzędzie *rozwiązywania* rozmaitych problemów, jak
również potężne narzędzie służące do lepszego ich *zrozumienia*. Swoją siłę zawdzięcza między innymi
temu, że pozwala nam przekroczyć pewne ograniczenia o charakterze *psychologicznym*. Dla nas, ludzi,
to, czy dany problem będzie łatwy czy trudny do rozwiązania albo zrozumienia często w *ogromnym*
stopniu zależy od przyjętego *punktu widzenia* na ten problem. Dlatego między innymi tak chętnie
korzystamy z analogii i metafor i tak bardzo je sobie cenimy. A zachowujący strukturę izomorfizm to
właśnie pewien rodzaj doskonałej analogii.

Izomorfizm Curry'ego-Howarda pozwala osiągnąć coś podobnego do tego, co umożliwia układ
kartezjański, tylko na znacznie wyższym poziomie ogólności. Żeby zacząć przygodę z tym izomorfizmem,
trzeba tylko ćwiczyć przełączanie się między dwoma, dobrze określonymi, ale początkowo z
konieczności trochę obcymi sposobami patrzenia na *typy*. Być może jedną z głównych trudności
pojawiających się początkowo podczas uczenia się tego podejścia jest to, że matematyka "rozgrywa
się" wtedy czy może "istnieje" właśnie głównie na poziomie typów. Gdy już jednak zdążysz się z tym
choć trochę oswoić, Twoja zdolność do rozumienia treści matematycznych albo "matematyzacji"
problemów czy pojęć, które same z siebie nie mają jeszcze matematycznego charakteru, zacznie się
moim zdaniem rozwijać znacznie szybciej, niż gdybyś próbowała ją rozwijać w bardziej tradycyjny
sposób.

Próbując zrozumieć, o czym jest następny rozdział, uruchomisz proces zasadniczo taki sam, jak ten
dzięki któremu byłaś w stanie rozwiązywać problemy geometryczne, które czasem wydawały Ci się
proste, ale które bez wcześniejszego przyzwyczajenia się do patrzenia na nie jako na problemy
liczbowe byłyby tak trudne, że być może nawet nierozwiązywalne. W dodatku uczenie się matematyki
*metodą prób i błędów*, to jest w ramach mniej lub bardziej swobodnej *eksploracji*, będzie miało
znacznie większy sens, ponieważ wszystko, czego byś nie spróbowała, będzie natychmiast sprawdzone
pod względem poprawności przez praktycznie niezawodny program. A że nie będzie obok żadnego
nauczyciela, to też nikt Cię nie będzie oceniał. Pojawi się dzięki temu możliwość używania
matematyki, oczywiście w granicach wyznaczonych częściowo przez aktualny poziom Twojego zrozumienia
i wiedzy, w sposób w pewnym sensie maksymalnie *twórczy*.

Curry i Howard odkryli, że istnieje pewien zachowujący strukturę izomorfizm między systemami logiki
formalnej, takimi jak logika konstruktywna, nazywana również logiką intuicjonistyczną, i systemami
służącymi do badania między innymi zagadnień związanych z obliczalnością, takimi jak rachunek lambda
z typami. Jeżeli masz już w tym momencie takie wątpliwości, to od razu Cię zapewnię, że korzystając
z tego izomorfizmu nie będziemy wcale ograniczeni do jakiejś konkretnej logiki, takiej jak na
przykład logika konstruktywna.

Dla naszych potrzeb to, że izomorfizm Curry'ego-Howarda istnieje, oznacza tyle, że *każdy* problem
matematyczny możemy dzięki niemu postrzegać jako problem dotyczący *programowania* i próbować go
rozwiązać jako taki. Tak samo jak dzięki układowi kartezjańskiemu każdy problem geometryczny możemy
próbować zamienić na odpowiadający mu problem analityczny (liczbowy) i próbować go rozwiązać albo
tylko inaczej zrozumieć posługując się na przykład operacjami algebraicznymi, takimi jak dodawanie
czy mnożenie. Jedyną rzeczą, której będziemy potrzebować, żeby uprawiać matematykę - a później
również ogólniej rozumiane badania o meta-teoretycznym charakterze - jako programowanie, będzie
zarazem sztywny i wystarczająco ekspresyjny język. Ten, na którym oparty jest Lean, jest właśnie
jednym z takich języków. A tym, co przede wszystkim sprawia, że jest tak bardzo ekspresyjny, że
pozwala zakodować formalnie całą matematykę, a więc też wszystko, co tylko da się zmatematyzować,
czyli powiedzieć lub wyrazić jasno, są *typy zależne*.
