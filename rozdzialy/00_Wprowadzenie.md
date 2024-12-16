# Sk±d siê ta ksi±¿ka wziê³a?

Ta ksi±¿ka by³a najpierw krótkim skryptem dla studentów. Planuj±c æwiczenia do kursu neuronauka i
psychologia poznawcza zapisa³em w sylabusie, ¿e na zajêciach dotycz±cych teorii normatywnych
bêdziemy omawiaæ jaki¶ mój bli¿ej nieokre¶lony "skrypt w³asny". Korzystaj±c z tej okazji,
postanowi³em przeprowadziæ eksperyment dydaktyczny, polegaj±cy na próbie przekonania studentów, ¿e
przy odrobinie wysi³ku mog± nauczyæ siê dowodzenia prostych twierdzeñ, a dziêki temu trochê lepiej
zrozumieæ, a ju¿ na pewno lepiej zapamiêtaæ, na przyk³ad twierdzenie Bayesa. Skrypt sta³ siê seri±
komentarzy ilustrowanych fragmentami kodu, które by³y jednocze¶nie zadaniami wymagaj±cymi dowodzenia
tautologii w jêzyku [Lean](https://lean-lang.org/).

Mia³em w±tpliwo¶ci, czy to siê uda, wiêc najpierw sprawdzi³em jak sobie z tym poradzi mój syn,
siedemnastoletni wtedy Tymek. Sz³o mu powoli, wiêc wprowadzi³em pewne zmiany i poprawion± wersjê
da³em doktorantom, którzy chodzili wtedy na mój kurs dotycz±cy wnioskowania bayesowskiego i
przyczynowego. Dziêki temu (jeszcze raz dziêkujê!) poprawi³em skrypt na tyle, ¿e znaczna czê¶æ
studentów wykona³a poprawnie zadanie, a kilkoro wyrazi³o nawet zainteresowanie dalszym ci±giem.

Poniewa¿ sam zacz±³em siê ca³kiem niedawno uczyæ Leana, postanowi³em uczyæ siê go nadal poprawiaj±c
i rozwijaj±c to, co ju¿ napisa³em. Pisz±c wcze¶niej na zamówienie [wprowadzenie do wnioskowania
przyczynowego dla psychologów](https://czasopisma.uwm.edu.pl/index.php/pp/article/view/9731/7171)
(wersja w jêzyku angielskim jest bardziej dopracowana) przekona³em siê, po raz kolejny, ¿e nie ma
lepszego sposobu, ¿eby upewniæ siê, czy co¶ siê dobrze rozumie. Ten artyku³ zamówi³ u mnie Arek
Bia³ek, za co mu tutaj serdecznie dziêkujê, poniewa¿ zmusi³o mnie to do d³u¿szych rozmy¶lañ na temat
tego, czym jest lub mo¿e byæ rachunek przyczynowy, z czego skorzystam w dalszej czê¶ci ksi±¿ki.

Po wstawieniu skryptu w nieco bardziej estetycznej formie na GitHuba tak siê w to wci±gn±³em, ¿e po
chwili z jednego skryptu zrobi³y siê dwa, potem trzy, a nied³ugo potem siedem i to wszystko zaczê³o
wygl±daæ jak taka jakby trochê mo¿e ksi±¿ka. W dodatku ksi±¿ka, któr± - po dopracowaniu jej przez
autora (czyli w tym wypadku mnie) - sam chcia³bym przeczytaæ, zanim jeszcze zacz±³em siê tych tre¶ci
uczyæ. Przy okazji odkry³em te¿ inny cel dla tego mojego pisania.

Wiêkszo¶æ psychologów - mam tu na my¶li równie¿ utytuowanych pracowników naukowych z bogatym
dorobkiem - z jednej strony polega w ogromnym stopniu na matematyce (na przyk³ad, u¿ywaj±c
wnioskowania statystycznego, ale nie tylko wtedy) i próbuje zrozumieæ z³o¿one i trudne do
wyja¶nienia zjawiska (takie jak zachowania ludzi czy strukturê i przebieg procesów umys³owych), a z
drugiej nie ma najczê¶ciej o matematyce za bardzo pojêcia. Tacy, niestety w psychologii liczni,
matematyczni pó³-analfabeci nierzadko wyci±gaj± z w³asnych i cudzych badañ nieuzasadnione wnioski,
pope³niaj±c przy tym czasem najprostsze nawet b³êdy. 

Dobrymi przyk³adami powa¿nych b³êdów wynikaj±cych z niezrozumienia matematycznej nieuchronno¶ci
kilku prostych zasad s± powszechne wnioskowanie o braku efektu na podstawie samego tylko
nieistotnego wyniku testu statystycznego, albo wnioskowanie o wp³ywie czy innych w³asno¶ciach
przyczynowych bez wprowadzenia i uzasadnienia koniecznych za³o¿eñ (nadal nie wszyscy psychologowie
wiedz±, ¿e [przyczynowo¶æ zosta³a
zmatematyzowana](https://en.wikipedia.org/wiki/Causal_inference)). Takim byæ mo¿e poza tym ca³kiem
kompetentnym, ale nadal jednak matematycznym pó³-analfabetom udaje siê publikowaæ w
wysokopunktowanych czasopismach, bo ich manuskrypty s± zwykle recenzowane i dopuszczane do druku
przez innych matematycznych pó³-analfabetów. Rezultatem jest powszechna w psychologii ju¿ od dawna
rozczarowuj±ca gra pozorów.

Matematyczny pó³-analfabetyzm wiêkszo¶ci psychologów jest ³atwym do zaobserwowania faktem. Równie
³atwo jest wskazaæ jedn± z g³ównych przyczyn tego stanu rzeczy: Praktycznie *nikt*, w³±czaj±c w to
osoby prowadz±ce zajêcia ze statystyki, nie wymaga od psychologów znajomo¶ci nawet tylko tej
odrobiny matematyki, któr± trzeba poznaæ, ¿eby trochê g³êbiej zrozumieæ o co tak naprawdê chodzi
miêdzy innymi w testowaniu istotno¶ci albo w poprawnym uzasadnianiu wniosków przyczynowych. A
przecie¿ te dwa rodzaje rozumowañ odgrywaj± centraln± rolê w niemal ka¿dym artykule empirycznym. Co
ambitniejsi studenci uzupe³niaj± samodzielnie braki w wiedzy, ale akurat matematyki ma³o kto uczy
siê systematycznie z w³asnej woli.

Mam powody s±dziæ, ¿e studenci i przynajmniej Ci m³odsi pracownicy naukowi czêsto mniej boj± siê
programowania ni¿ matematyki, a poza tym z programowaniem mog± siê oswajaæ w interakcji z
dostarczaj±cym natychmiastowej informacji zwrotnej komputerem. Dziêki temu obecno¶æ nauczyciela nie
jest a¿ tak potrzebna. Ta ksi±¿ka ma miêdzy innymi pomóc w oswajaniu siê z matematyk± przede
wszystkim w³a¶nie studentom na kierunku psychologia i pracownikom akademickim zajmuj±cym siê
badaniami psychologicznymi, którzy s± gotowi w tym celu podj±æ próbê poznania nowego, piêknego, i
bardzo ekspresyjnego jêzyka programowania.

Uprzedzam, ¿e ta ksi±¿ka *mo¿e zawieraæ i prawie na pewno zawiera b³êdy we fragmentach napisanych w
jêzyku naturalnym*, czyli w tych czê¶ciach, w których mniej lub bardziej po swojemu obja¶niam kod
lub zapêdzam siê w dygresje. To ryzyko nie jest wcale ma³e, bo jestem tylko matematycznym
amatorem. Co prawda co¶ tam mogê pokazaæ jako "dowód", ¿e matematyka nie jest dla mnie ca³kiem obca,
ale nie ma tego wiele. Gdyby¶ wiêc znalaz³a b³±d, bêdê wdziêczny, je¶li mi o tym
napiszesz. Najchêtniej korzystam ze skrzynki mailowej borys.paulewicz@gmail.com.

To powiedziawszy mogê Ciê zapewniæ, ¿e ta ksi±¿ka *prawie na pewno nie zawiera b³êdów w czê¶ciach
formalnych*, to jest zakodowanych w pewnej wersji jêzyka teorii typów zale¿nych, z której korzysta
asystent dowodzenia Lean. To jest o ile te czê¶ci sprawdzi³em przed pos³aniem zmian do repozytorium.
Zwykle tak robiê, ale zdarza mi siê o tym zapominaæ kiedy du¿o piszê albo du¿o zmieniam. Je¿eli
akurat sprawdzi³em kod po wprowadzeniu zmian, to znaczy, ¿e wszystkie formalne czê¶ci zosta³y
sprawdzone przez algorytm, którego u¿ywa do tego Lean. Wtedy ma³o czego mo¿na byæ tak pewnym jak
tego, ¿e s± bezb³êdne.

Muszê Ciê ostrzec, ¿e nawet je¿eli przeczytasz pierwszy rozdzia³ albo dwa do koñca i uda Ci siê
zrobiæ poprawnie zadania, których jest w tych rozdzia³ach zreszt± niezbyt wiele, jest mo¿liwe, ¿e
poczujesz co¶ w rodzaju dezorientacji. Bêdziemy siê zajmowaæ bardzo abstrakcyjnymi sprawami, dlatego
takie poczucie jest na pocz±tku do¶æ prawdopodobne. Ja te¿ siê tak czu³em, gdy po raz pierwszy
mia³em kontakt z teori± typów zale¿nych. To poczucie mo¿e siê stopniowo zmieniæ w coraz g³êbsze
zrozumienie, ale to wymaga *cierpliwo¶ci*.

W zwi±zku z tym, oto moja sugestia: Daj sobie czas, ¿eby wszystko zd±¿y³o siê trochê "ule¿eæ" i
pogód¼ siê z tym, ¿e dobre opanowanie tego rodzaju materia³u mo¿e wymagaæ wracania do przeczytanych
ju¿ fragmentów. O ile nie zabraknie wytrwa³o¶ci, mo¿e w koñcu stanie siê to, co dzieje siê wtedy,
kiedy przez d³u¿szy czas dok±d¶ idziemy, niekoniecznie d±¿±c stale do jednego celu, a powietrze jest
bardzo wilgotne. Nie ma wtedy wyra¼nego momentu, kiedy zachodzi jako¶ciowa zmiana, odkrywamy jednak
w koñcu, ¿e choæ nie pada³ deszcz, jeste¶my przemoczeni[^1].

Gdy pojawi siê frustracja, a ca³kiem mo¿liwe, ¿e siê pojawi, poczekaj, albo wróæ do tego, co wydaje
Ci siê, ¿e ju¿ dobrze zrozumia³a¶. A w³a¶nie. Niedawno postanowi³em, ¿e poniewa¿ zdecydowana
wiêkszo¶æ studentów psychologii to nie studenci, tylko studentki, bêdê zwraca³ siê do Ciebie w
formie ¿eñskiej. Zreszt± to nie jedyny powód. 

Pozna³em wiele kobiet zajmuj±cych siê psychologi±, które w mojej ocenie maj± wiêcej oleju w g³owie,
ni¿ wielu znanych mi mê¿czyzn, którzy te¿ siê ni± zajmuj±. Nie spotka³em jednak *¿adnych* kobiet,
które dorównywa³yby wiêkszo¶ci mê¿czyzn pewno¶ci± siebie i ³atwo¶ci± wypowiadania stanowczych
opinii. Wiem, o czym mówiê, bo sam jestem znany z aroganckich wypowiedzi. A swoj± drog±, gdy
zacz±³em pisaæ do wyobra¿onego czytelnika w formie ¿eñskiej, przysz³o mi do g³owy, ¿e ewentualny
brak tupetu przestaje mieæ znaczenie, kiedy swoje tezy mo¿na *formalnie udowodniæ*, i bardzo
spodoba³a mi siê wizja kobiet prezentuj±cych *wnioski z badañ* z pe³n± ¶wiadomo¶ci±, ¿e poniewa¿ te
s± ju¿ *udowodnione*, w gruncie rzeczy nie bardzo jest z czym dyskutowaæ.

Wracaj±c do przerwanego w±tku - poczucie zrozumienia bywa zwodnicze. Wiele razy uczy³em siê trudnego
materia³u wykonuj±c liczne, coraz odleglejsze w czasie tak zwane generatywne powtórki. Prawie za
ka¿dym razem przekonywa³em siê, ¿e moje wcze¶niejsze poczucie zrozumienia by³o z³udne. Mo¿e to
truizm, ale taki, o którym ³atwo jest zapomnieæ: Poniewa¿ nawet na najprostsze sprawy mo¿na
popatrzeæ z nowego punktu widzenia, rozumienie to co¶, do czego mo¿na stale *d±¿yæ*, ale co rzadko,
o ile w ogóle kiedykolwiek, mo¿na naprawdê *osi±gn±æ*.

Pierwszy rozdzia³ nie jest d³ugi. Przeczytanie go i wykonanie poleceñ powinno Ci zaj±æ nie wiêcej
ni¿ pó³torej godziny. Poza tym ta ksi±¿ka jest ca³kowicie samowystarczalna w tym znaczeniu, ¿e nie
zak³ada ¿adnej specjalnej wiedzy - *wszystko* jest wyja¶nione od podstaw, a jedyny program, którego
potrzebujemy, jest dostêpny za darmo i mo¿na go u¿ywaæ równie¿ w przegl±darce.

Je¿eli utkniesz, nie zra¿aj siê proszê. A je¿eli utkniesz, bêdziesz próbowaæ znowu i nadal Ci siê
nie uda, po prostu siê tym nie przejmuj i czytaj dalej, zak³adaj±c oczywi¶cie, ¿e ciekawi Ciê, co
bêdzie dalej. Zrozumienie, ¿e ucz±c siê matematyki *nie trzeba rozwi±zywaæ wszystkich zadañ* i ¿e
upieranie siê przy tym mo¿e bardzo przeszkadzaæ w nauce zajê³o mi naprawdê du¿o czasu, o wiele za
du¿o. ¯a³ujê, ¿e nikt mi tego nie t³uk³ ju¿ dawno do g³owy (albo jeszcze lepiej, cierpliwie
t³umaczy³).

¯eby Ciê przekonaæ do uczenia siê ze mn± na luzie, opowiem Ci, jak zmiana nastawienia do matematyki
zmieni³a moje ¿ycie. W trakcie wakacji 2023 roku, roj±c sobie, ¿e mo¿e jakim¶ cudem bêdê mia³ szansê
to niebawem wykorzystaæ, zacz±³em uczyæ siê systematycznie z cudownej ksi±¿ki [Type Theory and
Formal
Proof](https://www.cambridge.org/core/books/type-theory-and-formal-proof/0472640AAD34E045C7F140B46A57A67C),
napisanej przez Geuversa i Nederpelta. Ta ksi±¿ka jest napisana w bardzo jasny sposób. Czytaj±c j±
czuje siê, ¿e autorzy staraj± siê wszystko wyt³umaczyæ najlepiej jak tylko potrafi±. W mojej ocenie
to jest te¿ wybitna *literatura* w tym znaczeniu, ¿e styl jest jednocze¶nie wyj±tkowo elegancki,
lekki, a czêsto nawet ciep³y.

Niektórzy wybitni matematycy potrafi± tak pisaæ. A ¿e temat jest czasem abstrakcyjny, z³o¿ony i
pe³en g³êbokich niespodzianek, rezultatem bywa pora¿aj±ce po³±czenie tre¶ci i formy. Taki efekt jest
osi±galny chyba tylko wtedy, gdy autorzy maj± rzeczywi¶cie co¶ do powiedzenia i nie tylko dobrze
rozumiej± to, co chc± powiedzieæ, ale tak¿e to, jakie trudno¶ci mog± siê pojawiæ u odbiorcy. No wiêc
to jest, w mojej ocenie, tego rodzaju ksi±¿ka. W dodatku poza dobr± znajomo¶ci± jêzyka angielskiego
autorzy nie zak³adaj± ¿adnej wcze¶niejszej wiedzy czytelnika. Mimo to, uczenie siê z niej nie by³o
dla mnie ani trochê ³atwe.

Przez d³u¿szy czas zaczyna³em prawie ka¿dy dzieñ od 30 minutowej jednostki (tak to sobie nazywam),
polegaj±cej albo na czytaniu *po raz kolejny* tego samego *krótkiego* fragmentu, albo na robieniu
notatek czy zaplanowanych powtórek. Pó¼niej tego samego dnia zdarza³o siê, ¿e jeszcze do tego
wraca³em, ale nie zawsze. Na pocz±tku rozwi±zywa³em te¿ wszystkie zadania. I to by³ naprawdê bardzo
wolny proces.

Którego¶ dnia, z czystej ciekawo¶ci, zacz±³em swobodnie czytaæ dalej, a potem wróci³em do fragmentu,
na którym wcze¶niej skoñczy³em. W ten sposób mia³em pewn± przerwê miêdzy momentem, w którym pierwszy
raz przeczyta³em pó¼niejszy fragment, ale nie robi³em ¿adnych pojawiaj±cych siê tam zadañ, a
momentem, kiedy znowu zacz±³em go czytaæ. Okaza³o siê, ¿e rozumiem ten fragment znacznie
lepiej. Postanowi³em wiêc, po raz pierwszy w ¿yciu i tylko na próbê, *w ogóle nie robiæ zadañ, gdy
nie mam na to ochoty, albo gdy nie czujê, ¿e muszê je zrobiæ, ¿eby zrozumieæ o co chodzi*. A tak
przy okazji - niektóre z zadañ w tej dziwnej ksi±¿ce, któr± w³a¶nie czytasz, s± integraln± czê¶ci±
tekstu, ale oczywi¶cie mo¿na je omin±æ, o ile tylko pó¼niejsze tre¶ci bêd± nadal zrozumia³e.

Robi³em wiêc dalej notatki i zaplanowane, generatywne powtórki, ale nie robi³em ¿adnych zadañ, które
mnie nie zainteresowa³y i które nie wydawa³y mi sie wa¿ne. Z czasem zacz±³em te¿ zauwa¿aæ
b³êdy. Czytaj±c zawsze szukam b³êdów, po prostu tak mam i moje do¶wiadczenie wskazuje, ¿e w
d³u¿szych tekstach napisanych w jêzyku naturalnym jakie¶ b³êdy zawsze zostaj±. W moich d³u¿szych
tekstach s± z pewno¶ci±. Poniewa¿ czu³em, ¿e mam racjê, napisa³em do Roba Nederpelta, który
potraktowa³ mnie niezwykle ¿yczliwie i powa¿nie. Jednym z efektów tej przygody jest to, ¿e moje
nazwisko pojawi³o siê w oficjalnej erracie do tej ksi±¿ki, jako nazwisko jednej z osób, której
autorzy dziêkuj±. A mi akurat dziêkuj± za wskazanie (w tym momencie, to jest 2024-12-11) oko³o
*po³owy* wszystkich wymienionych b³êdów. Z niewielu rzeczy jestem tak dumny jak z tego, dlatego
czêsto siê tym chwalê. Nie wpad³bym na pomys³ napisania czego¶ choæby tylko odlegle zbli¿onego do
tego dziwnego tekstu, który masz w³a¶nie przed oczami, gdyby nie ta wspania³a ksi±¿ka i kontakt z
tym cz³owiekiem. No wiêc z ambicjami lepiej nie przesadzaæ, moim zdaniem, jak ju¿ chyba wspomina³em,
najwa¿niejszy jest czas.

Co¶ innego, co te¿ na zawsze zmieni³o moje ¿ycie, a co jest zwi±zane z tym, o czym przed chwil±
pisa³em, przytrafi³o mi siê w szokle podstawowej na lekcji fizyki. Moja nauczycielka z tego
przedmiotu, Pani P³ucienniczak, któr± bardzo dobrze wspominam (jednak moj± ulubion± nauczycielk± na
zawsze pozostanie Pani Wójcik, która uczy³a mnie matematyki), t³umaczy³a co¶ na tablicy i kiedy
zrozumia³em (ale czy na pewno?), o czym mówi³a, zrozumia³em te¿ jednocze¶nie co¶ wa¿niejszego od
fizyki: *Wszystko, co da siê zrozumieæ, ja te¿ mogê zrozumieæ, o ile tylko bêdê mia³ do¶æ informacji
i czasu*. Uwa¿am, ¿e je¿eli siêgnê³a¶ po t± ksia¿kê, to Ty te¿ mo¿esz zrozumieæ *wszystko*, co da
siê zrozumieæ. Jak to uj±³ Silvanus Thompson w swoim popularnym i dostêpnym za darmo [podrêczniku do
rachunku ró¿niczkowo-ca³kowego](https://calculusmadeeasy.org/), *What one fool can do, another
can*. Thompson podaje, ¿e to jest *Ancient Simian Proverb*, ale to ¿art (sprawd¼, co znaczy
"Simian". je¶li chcesz siê dowiedzieæ wiêcej).

Zawsze by³em chudy, dobry z matematyki, i dobry z programowania, bo taki siê urodzi³em. Z pewno¶ci±
nie by³em jednak nigdy ani tym bardziej nie jestem geniuszem. Po prostu w szkole podstawowej nie
potrafi³em nie my¶leæ czêsto o matematyce. Mój przyjaciel, wybitny teoretyk prawa i filozof Wojtek
Za³uski jest zdaje mi siê prawdziwym geniuszem. Inny mój przyjaciel, filozof matematyczny (je¶li
wolno mi tak nazwaæ to, czym siê zajmuje) Szymon Szymczak te¿ jak s±dzê jest. To oczywi¶cie
g³uptasy, jak my wszyscy, ale to s± akurat g³uptasy w pewnych (zbyt licznych) obszarach
genialne. Dziêki nim wiem, jaki ze mnie dureñ.

My¶lisz, ¿e mo¿e przesadzam? W *pierwszej klasie szko³y podstawowej* nie zapisa³em prawie nic w
zeszycie i mój szkolny "poziom wykonania" by³ tak niski, ¿e, jak siê pó¼niej dowiedzia³em,
nauczyciele powa¿nie zastanawiali siê, czy nie powinienem zostaæ w niej na drugi rok. Z powodu
licznych nieobecno¶ci (których co prawda spor± czê¶æ spêdzi³em w bibliotece) i bardzo s³abych ocen z
kilku przedmiotów o ma³o co nie powtarza³em te¿ klasy w liceum. Na studia z psychologii jest tylu
chêtnych, ¿e niektórzy z Was z pewno¶ci± przerastaj± mnie wrodzon± moc± obliczeniow±, a poza tym nie
jestem ju¿ m³ody. 

No to sk±d siê tu w ogóle wzi±³em? Uczy³em siê d³ugo i systematycznie ró¿nych trudnych rzeczy, a
robi³em to, bo znalaz³em na siebie pewien sposób. Pracujê na uczelni miêdzy innymi dziêki temu, ¿e
na pierwszym albo drugim roku psychologii z podrêcznika Andersona, z którego korzystali¶my czasem na
zajêciach z psychologii poznawczej, dowiedzia³em siê, jak siê uczyæ, a ze znakomitej ksi±¿ki
[Rachlina](https://www.hup.harvard.edu/books/9780674013575) (ale uprzedzam, polskie t³umaczenie "nie
jest optymalne") dowiedzia³em siê z kolei, jak sobie radziæ z ekstremaln± prokrastynacj±. Dlatego
¿eby jednocze¶nie zachêciæ Ciê do dalszej lektury i jako¶ odwdziêczyæ siê tym dwóm autorom, w
nastêpnym rozdziale powiem Ci krótko, jak siê uczy³em i jak czasem nadal to robiê, a tak¿e jak uda³o
mi siê robiæ to zarazem regularnie i przez d³u¿szy czas.

Skoro ju¿ mówiê o takich sprawach, to wypada mi podkre¶liæ, ¿e nie zosta³bym pracownikiem uczelni,
gdyby nie wsparcie, ¿yczliwo¶æ i wyrozumia³o¶æ - moich przyjació³, niezrównanego Micha³a Wierzchonia
i uczciwej, skromnej, m±drej (i dowcipnej!)[^2] Marty Siedleckiej, która od dawna dostarcza mi
sensownych zajêæ - a tak¿e Kasi Popio³ek, która by³a dla mnie wymarzon± szefow± przez te 10 lat,
kiedy pracowa³em na SWPSie w Katowicach. A doktoratu bym byæ mo¿e wcale nie napisa³, gdybym nie
liczne rozmowy z Tomkiem Grzegorkiem, któremu akurat zawdziêczam znacznie wiêcej ni¿ to, gdzie dzi¶
pracujê.

Z kolei Adasiowi Chuderskiemu, który jest teraz szefem krakowskiej kognitywistyki, zawdziêczam
przygodê z Lispem, która na zawsze zmieni³a mój sposób my¶lenia o programowaniu. Podszed³ kiedy¶ do
mnie, gdy bêd±c jeszcze na studiach magisterskich pisa³em w C++ jak±¶ procedurê do
eksperymetu. Zapyta³, w jakim jêzyku piszê, na co odpowiedzia³em, ¿e w C++, a On wtedy powiedzia³,
¿artuj±c, ¿e gdyby jego koledzy dowiedzieli siê, ¿e pisze w C++, to by go wy¶miali. No to zapyta³em,
niezra¿ony, w czym On pisze, na co powiedzia³, ¿e w Lispie. Wtedy nie mia³em zielonego pojêcia, co
to Lisp, a nied³ugo pó¼niej to by³ mój ulubiony jêzyk i na d³ugo nim pozosta³. W³a¶nie dlatego piszê
t± ksi±¿kê w [Emacsie](https://www.gnu.org/fun/jokes/gospel.en.html), z którym jestem od dawana tak
mocno zro¶niêty, ¿e czasem wrêcz zapominam, ¿e go w ogóle u¿ywam. Wygl±da wiêc na to, ¿e trzeba
czasu, byæ mo¿e jakiego¶ sposobu na siebie i dobrych przyjació³; wtedy mo¿na zrozumieæ, co tylko siê
chce. What one fool can do, another can.

### Przypisy

[^1]: To jest lu¼na parafraza cytatu, ale nie pamiêtam czyjego. Chyba jakiego¶ buddysty.

[^2]: Brane by³y pod uwagê równie¿ takie, zasugerowane mi przez nie powiem kogo epitety jak bezkompromisowa i przezabawna, niez³omna i wiekopomna, czy m±dra i krn±bra. Epitety te zosta³y przez moj± osobê autorsk± uznane za trafne i jako takie trafi³y do tego przypisu.
