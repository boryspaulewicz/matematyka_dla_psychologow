# Sk±d siê ta ksi±¿ka wziê³a?

Ta ksi±¿ka by³a najpierw krótkim skryptem dla studentów. Planuj±c æwiczenia do kursu neuronauka i
psychologia poznawcza, zapisa³em w sylabusie, ¿e na zajêciach dotycz±cych teorii normatywnych
bêdziemy omawiaæ jaki¶ bli¿ej nieokre¶lony mój "skrypt w³asny". Korzystaj±c z tej okazji,
postanowi³em przeprowadziæ eksperyment, który polega³ na próbie przekonania studentów, ¿e przy
odrobinie wysi³ku mog± nauczyæ siê dowodzenia prostych twierdzeñ, a dziêki temu trochê lepiej
zrozumieæ, a ju¿ na pewno lepiej zapamiêtaæ, na przyk³ad twierdzenie Bayesa. Skrypt sta³ siê seri±
komentarzy ilustrowanych fragmentami kodu, które by³y jednocze¶nie zadaniami wymagaj±cymi dowodzenia
tautologii w jêzyku [Lean](https://lean-lang.org/).

Mia³em w±tpliwo¶ci, czy to siê uda, wiêc najpierw sprawdzi³em, jak sobie z tym poradzi mój syn,
siedemnastoletni wtedy Tymek. Sz³o mu to do¶æ wolno, dlatego wprowadzi³em kilka zmian i poprawion±
wersjê da³em doktorantom, którzy chodzili wtedy na moje zajêcia dotycz±ce wnioskowania bayesowskiego
i przyczynowego. Dziêki temu (jeszcze raz dziêkujê!) spora czê¶æ studentów wykona³a poprawnie
zadanie, a kilkoro wyrazi³o nawet zainteresowanie dalszym ci±giem.

Poniewa¿ sam zacz±³em siê niedawno uczyæ Leana, postanowi³em robiæ to nadal, poprawiaj±c i
rozwijaj±c to, co ju¿ napisa³em. Pisz±c wcze¶niej na zamówienie [wprowadzenie do wnioskowania
przyczynowego dla psychologów](https://czasopisma.uwm.edu.pl/index.php/pp/article/view/9731/7171)
(wersja w jêzyku angielskim jest bardziej dopracowana), przekona³em siê, po raz kolejny, ¿e to
najlepszy sposób, ¿eby nauczyæ siê czego¶ lepiej. Ten artyku³ zamówi³ u mnie Arek Bia³ek, za co mu
tutaj serdecznie dziêkujê, poniewa¿ zmusi³o mnie to do d³u¿szych rozmy¶lañ na temat rachunku
przyczynowego. Nie jest to chyba mój najgorszy tekst, skoro [spodoba³
siê](https://x.com/yudapearl/status/1737769250511843448) samemu
[Pearlowi](https://en.wikipedia.org/wiki/Judea_Pearl), który raczej nie prawi chêtnie komplementów
na temat tego typu artyku³ów, dlatego zamierzam bezwstydznie skorzystaæ z niego (z artyku³u, nie z
Pearla) w dalszej czê¶ci ksi±¿ki.

Po wstawieniu skryptu w nieco bardziej estetycznej formie na GitHuba, tak siê w to wci±gn±³em, ¿e po
chwili z jednego skryptu zrobi³y siê dwa, potem trzy, a nied³ugo potem siedem i to wszystko zaczê³o
wygl±daæ jak taka jakby trochê mo¿e ksi±¿ka. W dodatku ksi±¿ka, któr± - po dopracowaniu jej przez
autora (czyli w tym wypadku mnie) - sam chcia³bym przeczytaæ, zanim jeszcze zacz±³em siê o tych
sprawach uczyæ. Przy okazji odkry³em tak¿e inny cel.

Wiêkszo¶æ psychologów - mam tu na my¶li równie¿ utytuowanych pracowników naukowych z bogatym
dorobkiem - polega w ogromnym stopniu na matematyce, na przyk³ad u¿ywaj±c wnioskowania
statystycznego, ale nie tylko wtedy, i próbuje zrozumieæ z³o¿one i trudne do wyja¶nienia zjawiska,
takie jak zachowania ludzi czy strukturê i przebieg procesów umys³owych. Jednak wielu z nich nie ma
najczê¶ciej o matematyce za bardzo pojêcia. Dobrymi przyk³adami powa¿nych b³êdów, wynikaj±cych z
niezrozumienia matematycznej nieuchronno¶ci kilku *prostych* przecie¿ zasad, s± powszechne
[wnioskowanie o braku efektu na podstawie samego tylko nieistotnego wyniku testu
statystycznego](https://en.wikipedia.org/wiki/Type_I_and_type_II_errors), albo wnioskowanie o
wp³ywie czy innych w³asno¶ciach przyczynowych bez wprowadzenia i uzasadnienia koniecznych za³o¿eñ
(wielu psychologów wci±¿ nie zdaje sobie sprawy, jak powa¿ne konsekwencje wynikaj± z faktu, ¿e
[przyczynowo¶æ zosta³a zmatematyzowana](https://en.wikipedia.org/wiki/Causal_inference)).

Nic wiêc dziwnego, ¿e tacy - niestety w psychologii do¶æ liczni - matematyczni pó³analfabeci
nierzadko wyci±gaj± z w³asnych i cudzych badañ nieuzasadnione wnioski, pope³niaj±c przy tym czasem
najprostsze nawet b³êdy. Mimo to udaje im siê publikowaæ w wysokopunktowanych czasopismach, bo
wysy³ane przez nich manuskrypty s± zwykle recenzowane i dopuszczane do druku przez innych
matematycznych pó³analfabetów. Rezultatem tej zabawy w chowanego jest powszechna w psychologii ju¿
od dawna rozczarowuj±ca [gra pozorów](https://pl.wikipedia.org/wiki/Kulty_cargo).

Matematyczny pó³analfabetyzm zdecydowanej wiêkszo¶ci psychologów jest ³atwym do zaobserwowania
faktem. Równie ³atwo jest wskazaæ jedn± z g³ównych przyczyn, o ile nie przyczynê najwa¿niejsz±, tego
smutnego stanu rzeczy: Praktycznie *nikt*, w³±czaj±c w to osoby prowadz±ce zajêcia ze statystyki,
nie wymaga od psychologów znajomo¶ci nawet tylko tej odrobiny matematyki, któr± trzeba poznaæ, ¿eby
trochê g³êbiej zrozumieæ o co tak naprawdê chodzi miêdzy innymi w testowaniu istotno¶ci albo w
poprawnym uzasadnianiu wniosków przyczynowych. A przecie¿ te dwa rodzaje rozumowañ odgrywaj±
*centraln±* rolê w *niemal ka¿dym* artykule empirycznym. Co ambitniejsi studenci uzupe³niaj±
samodzielnie braki w wiedzy, ale akurat matematyki ma³o kto uczy siê systematycznie z w³asnej woli.

Mam wra¿enie, ¿e studenci i przynajmniej Ci m³odsi pracownicy naukowi czêsto mniej boj± siê
programowania ni¿ matematyki, a poza tym z programowaniem mog± siê oswajaæ w interakcji z
dostarczaj±cym informacji zwrotnych komputerem. Wtedy obecno¶æ nauczyciela nie jest a¿ taka
potrzebna. Ta ksi±¿ka ma miêdzy innymi pomóc w oswajaniu siê z matematyk± przede wszystkim w³a¶nie
zainteresowanym samodzielnym poszerzaniem wiedzy studentom psychologii i pracownikom akademickim
zajmuj±cym siê badaniami psychologicznymi, którzy s± gotowi w tym celu podj±æ próbê poznania nowego,
piêknego i wyj±tkowo ekspresyjnego jêzyka programowania.

Uprzedzam jednak, ¿e ta ksi±¿ka *mo¿e zawieraæ b³êdy we fragmentach napisanych w jêzyku naturalnym*,
czyli tam, gdzie mniej lub bardziej po swojemu obja¶niam kod albo zapêdzam siê w dygresje. To ryzyko
nie wydaje mi siê pomijalnie ma³e, bo jestem tylko matematycznym amatorem. Co prawda co¶ tam mogê
pokazaæ jako "dowód", ¿e co¶ tam o matematyce wiem, ale nie ma tego wiele. Gdyby¶ wiêc znalaz³a
b³±d, bêdê wdziêczny, je¶li mi o tym napiszesz (boryslaw.paulewicz@uj.edu.pl).

Mogê Ciê za to zapewniæ, ¿e ta ksi±¿ka *prawie na pewno nie zawiera b³êdów w czê¶ciach formalnych*,
to jest zakodowanych w pewnej wersji jêzyka teorii typów, z której korzysta asystent dowodzenia
Lean. To jest o ile te czê¶ci sprawdzi³em przed pos³aniem zmian do repozytorium. Zwykle tak robiê,
ale zdarza mi siê o tym zapominaæ kiedy du¿o piszê albo du¿o zmieniam. Je¿eli akurat sprawdzi³em kod
po wprowadzeniu zmian, to znaczy, ¿e wszystkie formalne czê¶ci zosta³y sprawdzone przez algorytm,
którego u¿ywa do tego Lean, a wtedy ma³o czego mo¿na byæ tak pewnym jak tego, ¿e s±
[bezb³êdne](https://royalsocietypublishing.org/doi/10.1098/rsta.2005.1650). A gdyby¶ mia³a
jakiekolwiek w±tpliwo¶ci, zawsze mo¿esz wkleiæ kod do Leana i przekonaæ siê sama, czy nie pojawia
siê b³±d.

Muszê Ciê te¿ ostrzec, ¿e je¿eli dotrzesz do koñca rozdzia³u szóstego i uda Ci siê zrobiæ poprawnie
zadania, których do tego momentu bêdzie zreszt± niewiele, mo¿liwe, ¿e poczujesz co¶ w rodzaju
zagubienia. Bêdziemy siê zajmowaæ bardzo abstrakcyjnymi sprawami, dlatego takie poczucie jest na
pocz±tku do¶æ prawdopodobne. Ja te¿ siê tak czu³em, gdy zaczyna³em siê uczyæ o teorii typów. To
poczucie mo¿e siê stopniowo zmieniæ w coraz g³êbsze zrozumienie, ale to wymaga *cierpliwo¶ci*.

W zwi±zku z tym, oto moja sugestia: Daj sobie czas, ¿eby wszystko zd±¿y³o siê trochê "ule¿eæ" i
pogód¼ siê z tym, ¿e dobre opanowanie tego rodzaju materia³u mo¿e wymagaæ wracania do przeczytanych
ju¿ wcze¶niej fragmentów. O ile nie zabraknie wytrwa³o¶ci, mo¿e w koñcu stanie siê to, co dzieje siê
wtedy, kiedy przez d³u¿szy czas dok±d¶ idziemy, niekoniecznie d±¿±c stale do jednego celu, a
powietrze jest bardzo wilgotne. Nie ma wtedy wyra¼nego momentu, gdy zachodzi jako¶ciowa zmiana,
odkrywamy jednak w koñcu, ¿e choæ nie pada³ deszcz, jeste¶my przemoczeni[^1].

Gdy pojawi siê frustracja, a prawie na pewno czasem siê pojawi, poczekaj, albo wróæ do tego, co
wydaje Ci siê, ¿e ju¿ dobrze zrozumia³a¶. A w³a¶nie. Niedawno postanowi³em, ¿e poniewa¿ wiêkszo¶æ
studentów psychologii to wcale nie studenci, tylko studentki, bêdê zwraca³ siê do Ciebie w formie
¿eñskiej. Jest te¿ inny dobry moim zdaniem powód.

Pozna³em wiele kobiet zajmuj±cych siê psychologi±, które w mojej ocenie maj± wiêcej oleju w g³owie,
ni¿ wielu znanych mi mê¿czyzn, którzy te¿ siê ni± zajmuj±. W¶ród pracowników akademickich nie
spotka³em jednak prawie wcale kobiet, które dorównywa³yby wiêkszo¶ci mê¿czyzn pewno¶ci± siebie i
³atwo¶ci± wypowiadania stanowczych opinii. Wiem, co mówiê, bo sam jestem znany z aroganckich
wypowiedzi. A poza tym, gdy zacz±³em pisaæ do wyobra¿onego czytelnika w formie ¿eñskiej, przysz³o mi
do g³owy, ¿e ewentualny brak tupetu przestaje mieæ znaczenie, kiedy swoje tezy mo¿na *formalnie
udowodniæ* i bardzo spodoba³a mi siê wizja kobiet prezentuj±cych *wnioski z badañ* z pe³n±
¶wiadomo¶ci±, ¿e poniewa¿ te s± ju¿ udowodnione (zak³adaj±c wiarygodno¶æ ¼ród³a danych), *nie da
siê* ich skutecznie podwa¿yæ.

Ale wracaj±c ju¿ do przerwanego w±tku, poczucie zrozumienia czêsto jest zwodnicze. Wiele razy
uczy³em siê trudnego materia³u, wykonuj±c, czasem przez wiele miesiêcy albo nawet kilka lat, coraz
odleglejsze w czasie, generatywne powtórki. I wiele razy w trakcie powtarzania zauwa¿a³em, ¿e moje
wcze¶niejsze poczucie zrozumienia by³o z³udne. Mo¿e to truizm, ale taki, o którym ³atwo jest
zapomnieæ: Poniewa¿ nawet na najprostsze sprawy mo¿na popatrzeæ z nowego punktu widzenia, rozumienie
to jest co¶, do czego mo¿na stale *d±¿yæ*, ale co rzadko, o ile kiedykolwiek, mo¿na *osi±gn±æ*.

Rozdzia³y od czwartego do szóstego nie s± d³ugie. Przeczytanie ich i wykonanie poleceñ powinno Ci
zaj±æ nie wiêcej ni¿ pó³torej albo dwie godziny. Poza tym ta ksi±¿ka jest ca³kowicie
samowystarczalna w tym znaczeniu, ¿e nie zak³ada ¿adnej specjalistycznej wiedzy; *wszystko* jest
wyja¶nione od podstaw, a jedyny program, którego bêdziesz potrzebowaæ, jest dostêpny za darmo i
mo¿na go u¿ywaæ równie¿ w przegl±darce.

Je¿eli utkniesz, nie zra¿aj siê proszê. A je¿eli utkniesz, bêdziesz próbowaæ znowu i nadal Ci siê
nie uda, po prostu siê tym nie przejmuj i **czytaj dalej**, zak³adaj±c oczywi¶cie, ¿e bêdziesz nadal
zainteresowana tym, co bêdzie dalej. Zrozumienie, ¿e ucz±c siê matematyki *nie trzeba rozwi±zywaæ
wszystkich zadañ* i ¿e upieranie siê przy tym mo¿e przeszkadzaæ w nauce zajê³o mi naprawdê du¿o
czasu, o wiele za du¿o. ¯a³ujê, ¿e nikt mi tego nie t³uk³ ju¿ dawno do g³owy (albo jeszcze lepiej,
cierpliwie t³umaczy³).

Tylko z tego powodu wiele razy zdarza³o mi siê niepotrzebnie porzucaæ naukê, bo my¶la³em, ¿e skoro
nie przyswoi³em sobie dobrze czego¶ na danym etapie, to nie powinienem czytaæ dalej. A przecie¿
rozumienie w zasadzie nigdy nie rozwija siê w taki "liniowy" sposób. Wydaje mi siê, ¿e dobrze wiedz±
to informatycy, bo s± chyba przyzwyczajeni do traktowania bibliotek programistycznych i dokumentacji
jak *skrzynek z narzêdziami*, które maj± przede wszystkim *dzia³aæ* i którym nie musz± siê
przygl±daæ z bliska, czy analizowaæ jak s± zbudowane, je¶li akurat nie maj± na to ochoty.

¯eby Ciê przekonaæ do uczenia siê ze mn± na luzie, opowiem Ci, jak zmiana nastawienia do matematyki
zmieni³a moje ¿ycie. W trakcie wakacji 2023 roku, roj±c sobie, ¿e mo¿e jakim¶ cudem bêdê mia³ szansê
to niebawem wykorzystaæ, zacz±³em uczyæ siê z cudownej ksi±¿ki Geuversa i Nederpelta [Type Theory
and Formal
Proof](https://www.cambridge.org/core/books/type-theory-and-formal-proof/0472640AAD34E045C7F140B46A57A67C). Ta
ksi±¿ka jest napisana w bardzo jasny sposób i na ka¿dej niemal stronie widaæ, ¿e autorzy staraj± siê
wszystko wyt³umaczyæ najlepiej jak potrafi±. W mojej ocenie to jest te¿ wybitna *literatura*, w tym
znaczeniu, ¿e styl jest jednocze¶nie elegancki i lekki, a ton wydaje mi siê czasami wrêcz ciep³y.

Niektórzy wybitni matematycy potrafi± tak pisaæ. A ¿e temat bywa abstrakcyjny, z³o¿ony i pe³en
g³êbokich niespodzianek, rezultatem mo¿e byæ pora¿aj±ce po³±czenie tre¶ci z form±. Taki efekt jest
osi±galny chyba tylko wtedy, gdy autorzy maj± rzeczywi¶cie co¶ do powiedzenia i nie tylko dobrze
rozumiej± to, co chc± powiedzieæ, ale tak¿e to, jakie trudno¶ci mog± siê pojawiæ u odbiorcy. No wiêc
to jest, moim zdaniem, w³a¶nie taka ksi±¿ka. W dodatku poza dobr± znajomo¶ci± angielskiego, autorzy
nie zak³adaj± ¿adnej wcze¶niejszej wiedzy czytelnika. Mimo to, uczenie siê z niej nie by³o dla mnie
ani trochê ³atwe.

Przez d³u¿szy czas zaczyna³em prawie ka¿dy dzieñ od 30 minutowej jednostki (tak to sobie nazywam),
polegaj±cej albo na czytaniu *po raz kolejny* tego samego *krótkiego* fragmentu, albo na robieniu
notatek czy zaplanowanych powtórek. Pó¼niej tego samego dnia zdarza³o siê, ¿e jeszcze do tego
wraca³em, ale nie zawsze. Na pocz±tku rozwi±zywa³em te¿ wszystkie zadania. I to by³ bardzo wolny
proces.

Którego¶ dnia, z czystej ciekawo¶ci, zacz±³em swobodnie czytaæ dalej, a potem wróci³em do fragmentu,
na którym wcze¶niej skoñczy³em. W ten sposób mia³em pewn± przerwê miêdzy momentem, w którym pierwszy
raz przeczyta³em ten pó¼niejszy fragment, ale nie robi³em ¿adnych pojawiaj±cych siê tam zadañ, a
momentem, kiedy znowu zacz±³em go czytaæ. Okaza³o siê, ¿e rozumiem ten fragment znacznie
lepiej. Postanowi³em wiêc, po raz pierwszy w ¿yciu i tylko na próbê, *w ogóle nie robiæ zadañ, gdy
nie mam na to ochoty, albo gdy nie czujê, ¿e muszê je zrobiæ, ¿eby zrozumieæ chocia¿ trochê, o co
chodzi*. A tak przy okazji, niektóre z zadañ w ksi±¿ce, któr± w³a¶nie czytasz, s± integraln± czê¶ci±
tekstu, ale oczywi¶cie mo¿na je omin±æ, o ile tylko pó¼niejsze tre¶ci bêd± nadal zrozumia³e.

Dalej robi³em wiêc notatki i zaplanowane, generatywne powtórki, ale nie robi³em ¿adnych zadañ, które
mnie nie zainteresowa³y i które nie wydawa³y mi sie wa¿ne. Z czasem zacz±³em te¿ zauwa¿aæ
b³êdy. Czytaj±c zawsze szukam b³êdów, po prostu tak mam i moje do¶wiadczenie wskazuje, ¿e w
d³u¿szych tekstach napisanych w jêzyku naturalnym jakie¶
[b³êdy](https://www.youtube.com/watch?v=6LqnBrBSFyU) zawsze s±. W moich d³u¿szych tekstach s± z
pewno¶ci±. Poniewa¿ czu³em, ¿e mam racjê, napisa³em do [Roba
Nederpelta](https://wsinrpn.win.tue.nl/), który potraktowa³ mnie niezwykle ¿yczliwie i
powa¿nie. Jednym z efektów tej przygody jest to, ¿e moje nazwisko pojawi³o siê w oficjalnej erracie
do tej ksi±¿ki, jako nazwisko jednej z osób, której autorzy dziêkuj±. A mi akurat dziêkuj± za
wskazanie (w tym momencie, to jest 2024-12-11) oko³o po³owy wszystkich wymienionych b³êdów i nie
chodzi tu wcale o literówki czy inne tego rodzaju drobiazgi, a o b³êdy rzeczowe. Z niewielu rzeczy
jestem tak dumny jak z tego, dlatego czêsto siê tym chwalê. Nie wpad³bym na pomys³ napisania czego¶
choæby tylko odlegle zbli¿onego do tego tekstu, który masz w³a¶nie przed oczami, gdyby nie ta
wspania³a ksi±¿ka i kontakt z tym niezwyk³ym cz³owiekiem. No wiêc z ambicjami lepiej nie przesadzaæ;
moim zdaniem, jak ju¿ wspomina³em, najwa¿niejszy jest czas.

Skoro ju¿ mówimy o po¿ytkach p³yn±cych ze znajdywania b³êdów, mo¿e przyda Ci siê patent, który
odkry³em podczas pisania [doktoratu]((./praca_doktorska.pdf)). Poniewa¿ jedn± z wiêkszych
przyjemno¶ci zwi±zanych z tym procesem by³a dla mnie zabawa ró¿nymi mniej lub bardziej
skomplikowanymi narzêdziami teoretycznymi, musia³em jako¶ rozwi±zaæ problem polegaj±cy na tym, ¿e
nie by³o w okolicy ¿adnych specjalistów, których móg³bym poprosiæ o pomoc. Gdy czu³em, ¿e muszê siê
w czym¶ szybko podszkoliæ, szuka³em wiêc najlepszych ¿yj±cych autorów zajmuj±cych siê tematem, potem
zdobywa³em, nie powiem w jaki sposób (ani nie powiem, czy na przyk³ad z istniej±cego ju¿ wtedy
serwisu [AvaxHome](https://avaxhome-mirrors.pw/)) ich najlepsze ksi±¿ki, przebija³em siê przez
pierwsze kilkadziesi±t stron szukaj±c b³êdów, po czym pisa³em do autorów maile. W tych mailach
zwykle wyra¿a³em szczery podziw i g³êbok± wdziêczno¶æ, równie¿ szczer±, a niejako przy okazji
wspomina³em tak ostro¿nie, jak tylko umia³em (czyli pewnie niezbyt) o znalezionych b³êdach. A te
zawsze mo¿na by³o znale¼æ. Listê autorów, którym "to zrobi³em" znajdziesz na dziewi±tej stronie
mojego doktoratu.

Zwykle im *bardziej* wybitni i uznani byli Ci autorzy, tym szybciej, bardziej ¿yczliwie i
wyczerpuj±co mi odpowiadali. Chyba najlepszym przyk³adem jak to mo¿e dzia³aæ jest jedna z
odpowiedzi, jak± otrzyma³em wtedy od [Saula
Sternberga](https://en.wikipedia.org/wiki/Saul_Sternberg). Napisa³em mu wyra¼nie, ¿e to kwestia
drugorzêdna, ale gdyby to by³o mo¿liwe, chcia³bym zrobiæ po swojemu analizê wyników klasycznego ju¿
eksperymentu, który przeprowadzi³ w latach 60tych. Jak siê potem dowiedzia³em, pomiar czasu reakcji
polega³ wtedy na *nanoszeniu dziur na rolce papieru*, zawiniêtej bodaj wokó³ obracaj±cego siê w
miarowym tempie bêbna. Pisz±c w odpowiedzi, o ile pamiêtam zreszt± dosyæ szybkiej, Saul
zaproponowa³, ¿e *zleci digitalizacjê swojej sekretarce*. Zawstydzony odpisa³em zaraz, ¿e nie
trzeba.

Co¶ innego, co te¿ na zawsze zmieni³o moje ¿ycie, a co jest zwi±zane z tym, o czym przed chwil±
mówi³em, przytrafi³o mi siê w szkole podstawowej na lekcji fizyki. Moja nauczycielka z tego
przedmiotu, Pani P³ucienniczak, któr± bardzo dobrze wspominam (jednak moj± ulubion± nauczycielk± na
zawsze pozostanie Pani Wójcik, która uczy³a mnie matematyki), t³umaczy³a w³a¶nie co¶ na tablicy i
kiedy zrozumia³em (ale czy na pewno?), o czym wtedy mówi³a, zrozumia³em te¿ jednocze¶nie co¶
wa¿niejszego od fizyki: *Wszystko, co da siê zrozumieæ, ja te¿ mogê zrozumieæ, o ile tylko bêdê mia³
do¶æ informacji i czasu*. Uwa¿am, ¿e je¿eli siêgnê³a¶ po t± ksia¿kê, to Ty te¿ mo¿esz zrozumieæ
*wszystko*, co da siê zrozumieæ. Jak to uj±³ Silvanus Thompson w swoim popularnym i dostêpnym za
darmo [podrêczniku do rachunku ró¿niczkowo-ca³kowego](https://calculusmadeeasy.org/), *What one fool
can do, another can*. Thompson podaje tam, ¿e to jest *Ancient Simian Proverb*, ale to ¿art
(sprawd¼, co znaczy "Simian", je¶li chcesz siê dowiedzieæ wiêcej).

Zawsze by³em chudy[^3], dobry z matematyki i dobry z programowania, bo taki siê
[urodzi³em](https://en.wikipedia.org/wiki/Three_Identical_Strangers). Z pewno¶ci± nie by³em jednak
nigdy ani tym bardziej nie jestem geniuszem. Po prostu w szkole podstawowej nie potrafi³em nie
my¶leæ czêsto o matematyce. Mój wspania³y przyjaciel z licealnej szkolnej ³awki, wybitny teoretyk
prawa i filozof Wojtek Za³uski, jest zdaje mi siê prawdziwym geniuszem. Inny mój równie¿ wspania³y
przyjaciel, filozof matematyczny (je¶li wolno mi tak nazwaæ to, czym siê zajmuje) Szymon Szymczak
te¿ jak s±dzê jest. To oczywi¶cie g³uptasy, jak my wszyscy, ale to s± akurat g³uptasy w pewnych,
zbyt licznych, obszarach genialne. Dziêki nim wiem doskonale, jaki ze mnie dureñ.

My¶lisz, ¿e z tym durniem przesadzi³em? W *pierwszej klasie szko³y podstawowej* nie zapisa³em prawie
nic w zeszycie i mój szkolny poziom wykonania by³ tak niski, ¿e, jak siê pó¼niej dowiedzia³em,
nauczyciele powa¿nie zastanawiali siê, czy nie powinienem zostaæ w niej na drugi rok. Z powodu
licznych nieobecno¶ci (których co prawda spor± czê¶æ spêdzi³em w bibliotece) i bardzo s³abych ocen z
kilku przedmiotów, o ma³o co nie powtarza³em te¿ klasy w liceum; uratowa³a mnie wtedy olimpiada z
filozofii. Na studia z psychologii jest tylu chêtnych, ¿e niektórzy z Was z pewno¶ci± przerastaj±
mnie wrodzon± moc± procesora, a poza tym nie jestem ju¿ m³ody.

No to sk±d siê tu w ogóle wzi±³em? Uczy³em siê d³ugo i systematycznie ró¿nych trudnych rzeczy, a
robi³em to, poniewa¿ znalaz³em na siebie pewien sposób. Pracujê na uczelni miêdzy innymi dziêki
temu, ¿e najpierw z popularnej ksi±¿ki Tony'ego Buzana [*Rusz
g³ow±*](https://lubimyczytac.pl/ksiazka/3822524/rusz-glowa), a potem jeszcze na pierwszym albo
drugim roku psychologii z podrêcznika Johna Andersona, z którego nadal czasem korzystam na
zajêciach, dowiedzia³em siê, jak siê skuteczniej uczyæ, a ze znakomitej [ksi±¿ki
Rachlina](https://www.hup.harvard.edu/books/9780674013575) (ale uprzedzam, polskie t³umaczenie "nie
jest optymalne") dowiedzia³em siê z kolei, w jaki sposób sobie radziæ z ekstremaln± wrêcz
prokrastynacj±. Dlatego, ¿eby zachêciæ Ciê do dalszej lektury i odwdziêczyæ siê w jaki¶ sposób tym
autorom, w nastêpnym rozdziale opowiem Ci krótko, w jaki sposób siê uczy³em i czasami wci±¿ to
robiê, a tak¿e jak uda³o mi siê robiæ to zarazem regularnie i przez d³u¿szy czas.

Skoro ju¿ mówiê o takich sprawach, to muszê podkre¶liæ, ¿e nie zosta³bym pracownikiem uczelni, gdyby
nie wsparcie, ¿yczliwo¶æ i wyrozumia³o¶æ - moich przyjació³, niezrównanego Micha³a Wierzchonia, od
którego dopiero niedawno (bo jestem a¿ taki g³upi) zacz±³em siê uczyæ, ¿e praca dopiero wtedy mo¿e
byæ prawdziwie satysfakcjonuj±ca, kiedy polega na *wspó³*pracy, i uczciwej, skromnej, m±drej (i
dowcipnej!)[^2] Marty Siedleckiej, która od dawna dostarcza mi sensownych zajêæ - a tak¿e Kasi
Popio³ek, która by³a dla mnie wymarzon± wprost szefow± przez te 10 lat, kiedy pracowa³em na SWPSie w
Katowicach. A doktoratu, napisanego najpierw pod kierunkiem bardzo dla mnie wa¿nego dr
hab. Krzysztofa Krzy¿ewskiego, a pó¼niej prof. Edwarda Nêcki, któremu, podobnie jak temu Pierwszemu,
zawdziêczam swobodê zajmowania siê w owym czasie czym tylko mia³em ochotê siê zajmowaæ, byæ mo¿e
wcale bym nie skoñczy³, gdyby nie liczne rozmowy z dodaj±cym mi stale odwagi Tomkiem Grzegorkiem,
moim najwa¿niejszym chyba przyjacielem, któremu akurat zawdziêczam znacznie wiêcej ni¿ to, gdzie
dzisiaj pracujê.

Z kolei Adasiowi Chuderskiemu, który jest teraz szefem krakowskiej kognitywistyki, zawdziêczam
przygodê z [Lispem](https://www.youtube.com/watch?v=-J_xL4IGhJA&list=PLE18841CABEA24090), która
zmieni³a na zawsze mój sposób my¶lenia o programowaniu. Podszed³ kiedy¶ do mnie, gdy bêd±c jeszcze
na studiach magisterskich pisa³em w C++ jak±¶ procedurê do eksperymetu. Zapyta³, w jakim jêzyku j±
piszê, na co odpowiedzia³em, ¿e w C++. On wtedy powiedzia³, ¿artuj±c, ¿e gdyby jego koledzy
dowiedzieli siê, ¿e pisze w C++, to by go wy¶miali. No to zapyta³em, niezra¿ony, w czym On pisze, na
co odpowiedzia³, ¿e w Lispie. Wtedy nie mia³em zielonego pojêcia, co to Lisp, a nied³ugo pó¼niej to
by³ ju¿ mój ulubiony jêzyk i na d³ugo nim pozosta³. W³a¶nie dlatego piszê t± ksi±¿kê w
[Emacsie](https://www.gnu.org/fun/jokes/gospel.en.html), z którym jestem od dawna tak mocno
zro¶niêty, ¿e czasami nawet zapominam, ¿e go w ogóle u¿ywam. Wygl±da wiêc na to, ¿e trzeba czasu,
byæ mo¿e jakiego¶ sposobu na siebie i jednego czy dwóch dobrych przyjació³; wtedy mo¿na zrozumieæ,
co tylko siê chce. What one fool can do, another can.

### Przypisy

[^1]: To jest lu¼na parafraza cytatu, ale nie pamiêtam czyjego. Chyba jakiego¶ buddysty.

[^2]: Brane by³y pod uwagê równie¿ takie, zasugerowane mi przez nie powiem kogo epitety jak
    bezkompromisowa i przezabawna, niez³omna i wiekopomna, czy m±dra i krn±bra. Epitety te zosta³y
    przez moj± osobê autorsk± uznane za trafne i jako takie trafi³y do tego przypisu.

[^3]: ang. [*lean*](https://en.wikipedia.org/wiki/Lean_(proof_assistant)).
