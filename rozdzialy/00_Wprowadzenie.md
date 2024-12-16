# Sk�d si� ta ksi��ka wzi�a?

Ta ksi��ka by�a najpierw kr�tkim skryptem dla student�w. Planuj�c �wiczenia do kursu neuronauka i
psychologia poznawcza zapisa�em w sylabusie, �e na zaj�ciach dotycz�cych teorii normatywnych
b�dziemy omawia� jaki� m�j bli�ej nieokre�lony "skrypt w�asny". Korzystaj�c z tej okazji,
postanowi�em przeprowadzi� eksperyment dydaktyczny, polegaj�cy na pr�bie przekonania student�w, �e
przy odrobinie wysi�ku mog� nauczy� si� dowodzenia prostych twierdze�, a dzi�ki temu troch� lepiej
zrozumie�, a ju� na pewno lepiej zapami�ta�, na przyk�ad twierdzenie Bayesa. Skrypt sta� si� seri�
komentarzy ilustrowanych fragmentami kodu, kt�re by�y jednocze�nie zadaniami wymagaj�cymi dowodzenia
tautologii w j�zyku [Lean](https://lean-lang.org/).

Mia�em w�tpliwo�ci, czy to si� uda, wi�c najpierw sprawdzi�em jak sobie z tym poradzi m�j syn,
siedemnastoletni wtedy Tymek. Sz�o mu powoli, wi�c wprowadzi�em pewne zmiany i poprawion� wersj�
da�em doktorantom, kt�rzy chodzili wtedy na m�j kurs dotycz�cy wnioskowania bayesowskiego i
przyczynowego. Dzi�ki temu (jeszcze raz dzi�kuj�!) poprawi�em skrypt na tyle, �e znaczna cz��
student�w wykona�a poprawnie zadanie, a kilkoro wyrazi�o nawet zainteresowanie dalszym ci�giem.

Poniewa� sam zacz��em si� ca�kiem niedawno uczy� Leana, postanowi�em uczy� si� go nadal poprawiaj�c
i rozwijaj�c to, co ju� napisa�em. Pisz�c wcze�niej na zam�wienie [wprowadzenie do wnioskowania
przyczynowego dla psycholog�w](https://czasopisma.uwm.edu.pl/index.php/pp/article/view/9731/7171)
(wersja w j�zyku angielskim jest bardziej dopracowana) przekona�em si�, po raz kolejny, �e nie ma
lepszego sposobu, �eby upewni� si�, czy co� si� dobrze rozumie. Ten artyku� zam�wi� u mnie Arek
Bia�ek, za co mu tutaj serdecznie dzi�kuj�, poniewa� zmusi�o mnie to do d�u�szych rozmy�la� na temat
tego, czym jest lub mo�e by� rachunek przyczynowy, z czego skorzystam w dalszej cz�ci ksi��ki.

Po wstawieniu skryptu w nieco bardziej estetycznej formie na GitHuba tak si� w to wci�gn��em, �e po
chwili z jednego skryptu zrobi�y si� dwa, potem trzy, a nied�ugo potem siedem i to wszystko zacz�o
wygl�da� jak taka jakby troch� mo�e ksi��ka. W dodatku ksi��ka, kt�r� - po dopracowaniu jej przez
autora (czyli w tym wypadku mnie) - sam chcia�bym przeczyta�, zanim jeszcze zacz��em si� tych tre�ci
uczy�. Przy okazji odkry�em te� inny cel dla tego mojego pisania.

Wi�kszo�� psycholog�w - mam tu na my�li r�wnie� utytuowanych pracownik�w naukowych z bogatym
dorobkiem - z jednej strony polega w ogromnym stopniu na matematyce (na przyk�ad, u�ywaj�c
wnioskowania statystycznego, ale nie tylko wtedy) i pr�buje zrozumie� z�o�one i trudne do
wyja�nienia zjawiska (takie jak zachowania ludzi czy struktur� i przebieg proces�w umys�owych), a z
drugiej nie ma najcz�ciej o matematyce za bardzo poj�cia. Tacy, niestety w psychologii liczni,
matematyczni p�-analfabeci nierzadko wyci�gaj� z w�asnych i cudzych bada� nieuzasadnione wnioski,
pope�niaj�c przy tym czasem najprostsze nawet b��dy. 

Dobrymi przyk�adami powa�nych b��d�w wynikaj�cych z niezrozumienia matematycznej nieuchronno�ci
kilku prostych zasad s� powszechne wnioskowanie o braku efektu na podstawie samego tylko
nieistotnego wyniku testu statystycznego, albo wnioskowanie o wp�ywie czy innych w�asno�ciach
przyczynowych bez wprowadzenia i uzasadnienia koniecznych za�o�e� (nadal nie wszyscy psychologowie
wiedz�, �e [przyczynowo�� zosta�a
zmatematyzowana](https://en.wikipedia.org/wiki/Causal_inference)). Takim by� mo�e poza tym ca�kiem
kompetentnym, ale nadal jednak matematycznym p�-analfabetom udaje si� publikowa� w
wysokopunktowanych czasopismach, bo ich manuskrypty s� zwykle recenzowane i dopuszczane do druku
przez innych matematycznych p�-analfabet�w. Rezultatem jest powszechna w psychologii ju� od dawna
rozczarowuj�ca gra pozor�w.

Matematyczny p�-analfabetyzm wi�kszo�ci psycholog�w jest �atwym do zaobserwowania faktem. R�wnie
�atwo jest wskaza� jedn� z g��wnych przyczyn tego stanu rzeczy: Praktycznie *nikt*, w��czaj�c w to
osoby prowadz�ce zaj�cia ze statystyki, nie wymaga od psycholog�w znajomo�ci nawet tylko tej
odrobiny matematyki, kt�r� trzeba pozna�, �eby troch� g��biej zrozumie� o co tak naprawd� chodzi
mi�dzy innymi w testowaniu istotno�ci albo w poprawnym uzasadnianiu wniosk�w przyczynowych. A
przecie� te dwa rodzaje rozumowa� odgrywaj� centraln� rol� w niemal ka�dym artykule empirycznym. Co
ambitniejsi studenci uzupe�niaj� samodzielnie braki w wiedzy, ale akurat matematyki ma�o kto uczy
si� systematycznie z w�asnej woli.

Mam powody s�dzi�, �e studenci i przynajmniej Ci m�odsi pracownicy naukowi cz�sto mniej boj� si�
programowania ni� matematyki, a poza tym z programowaniem mog� si� oswaja� w interakcji z
dostarczaj�cym natychmiastowej informacji zwrotnej komputerem. Dzi�ki temu obecno�� nauczyciela nie
jest a� tak potrzebna. Ta ksi��ka ma mi�dzy innymi pom�c w oswajaniu si� z matematyk� przede
wszystkim w�a�nie studentom na kierunku psychologia i pracownikom akademickim zajmuj�cym si�
badaniami psychologicznymi, kt�rzy s� gotowi w tym celu podj�� pr�b� poznania nowego, pi�knego, i
bardzo ekspresyjnego j�zyka programowania.

Uprzedzam, �e ta ksi��ka *mo�e zawiera� i prawie na pewno zawiera b��dy we fragmentach napisanych w
j�zyku naturalnym*, czyli w tych cz�ciach, w kt�rych mniej lub bardziej po swojemu obja�niam kod
lub zap�dzam si� w dygresje. To ryzyko nie jest wcale ma�e, bo jestem tylko matematycznym
amatorem. Co prawda co� tam mog� pokaza� jako "dow�d", �e matematyka nie jest dla mnie ca�kiem obca,
ale nie ma tego wiele. Gdyby� wi�c znalaz�a b��d, b�d� wdzi�czny, je�li mi o tym
napiszesz. Najch�tniej korzystam ze skrzynki mailowej borys.paulewicz@gmail.com.

To powiedziawszy mog� Ci� zapewni�, �e ta ksi��ka *prawie na pewno nie zawiera b��d�w w cz�ciach
formalnych*, to jest zakodowanych w pewnej wersji j�zyka teorii typ�w zale�nych, z kt�rej korzysta
asystent dowodzenia Lean. To jest o ile te cz�ci sprawdzi�em przed pos�aniem zmian do repozytorium.
Zwykle tak robi�, ale zdarza mi si� o tym zapomina� kiedy du�o pisz� albo du�o zmieniam. Je�eli
akurat sprawdzi�em kod po wprowadzeniu zmian, to znaczy, �e wszystkie formalne cz�ci zosta�y
sprawdzone przez algorytm, kt�rego u�ywa do tego Lean. Wtedy ma�o czego mo�na by� tak pewnym jak
tego, �e s� bezb��dne.

Musz� Ci� ostrzec, �e nawet je�eli przeczytasz pierwszy rozdzia� albo dwa do ko�ca i uda Ci si�
zrobi� poprawnie zadania, kt�rych jest w tych rozdzia�ach zreszt� niezbyt wiele, jest mo�liwe, �e
poczujesz co� w rodzaju dezorientacji. B�dziemy si� zajmowa� bardzo abstrakcyjnymi sprawami, dlatego
takie poczucie jest na pocz�tku do�� prawdopodobne. Ja te� si� tak czu�em, gdy po raz pierwszy
mia�em kontakt z teori� typ�w zale�nych. To poczucie mo�e si� stopniowo zmieni� w coraz g��bsze
zrozumienie, ale to wymaga *cierpliwo�ci*.

W zwi�zku z tym, oto moja sugestia: Daj sobie czas, �eby wszystko zd��y�o si� troch� "ule�e�" i
pog�d� si� z tym, �e dobre opanowanie tego rodzaju materia�u mo�e wymaga� wracania do przeczytanych
ju� fragment�w. O ile nie zabraknie wytrwa�o�ci, mo�e w ko�cu stanie si� to, co dzieje si� wtedy,
kiedy przez d�u�szy czas dok�d� idziemy, niekoniecznie d���c stale do jednego celu, a powietrze jest
bardzo wilgotne. Nie ma wtedy wyra�nego momentu, kiedy zachodzi jako�ciowa zmiana, odkrywamy jednak
w ko�cu, �e cho� nie pada� deszcz, jeste�my przemoczeni[^1].

Gdy pojawi si� frustracja, a ca�kiem mo�liwe, �e si� pojawi, poczekaj, albo wr�� do tego, co wydaje
Ci si�, �e ju� dobrze zrozumia�a�. A w�a�nie. Niedawno postanowi�em, �e poniewa� zdecydowana
wi�kszo�� student�w psychologii to nie studenci, tylko studentki, b�d� zwraca� si� do Ciebie w
formie �e�skiej. Zreszt� to nie jedyny pow�d. 

Pozna�em wiele kobiet zajmuj�cych si� psychologi�, kt�re w mojej ocenie maj� wi�cej oleju w g�owie,
ni� wielu znanych mi m�czyzn, kt�rzy te� si� ni� zajmuj�. Nie spotka�em jednak *�adnych* kobiet,
kt�re dor�wnywa�yby wi�kszo�ci m�czyzn pewno�ci� siebie i �atwo�ci� wypowiadania stanowczych
opinii. Wiem, o czym m�wi�, bo sam jestem znany z aroganckich wypowiedzi. A swoj� drog�, gdy
zacz��em pisa� do wyobra�onego czytelnika w formie �e�skiej, przysz�o mi do g�owy, �e ewentualny
brak tupetu przestaje mie� znaczenie, kiedy swoje tezy mo�na *formalnie udowodni�*, i bardzo
spodoba�a mi si� wizja kobiet prezentuj�cych *wnioski z bada�* z pe�n� �wiadomo�ci�, �e poniewa� te
s� ju� *udowodnione*, w gruncie rzeczy nie bardzo jest z czym dyskutowa�.

Wracaj�c do przerwanego w�tku - poczucie zrozumienia bywa zwodnicze. Wiele razy uczy�em si� trudnego
materia�u wykonuj�c liczne, coraz odleglejsze w czasie tak zwane generatywne powt�rki. Prawie za
ka�dym razem przekonywa�em si�, �e moje wcze�niejsze poczucie zrozumienia by�o z�udne. Mo�e to
truizm, ale taki, o kt�rym �atwo jest zapomnie�: Poniewa� nawet na najprostsze sprawy mo�na
popatrze� z nowego punktu widzenia, rozumienie to co�, do czego mo�na stale *d��y�*, ale co rzadko,
o ile w og�le kiedykolwiek, mo�na naprawd� *osi�gn��*.

Pierwszy rozdzia� nie jest d�ugi. Przeczytanie go i wykonanie polece� powinno Ci zaj�� nie wi�cej
ni� p�torej godziny. Poza tym ta ksi��ka jest ca�kowicie samowystarczalna w tym znaczeniu, �e nie
zak�ada �adnej specjalnej wiedzy - *wszystko* jest wyja�nione od podstaw, a jedyny program, kt�rego
potrzebujemy, jest dost�pny za darmo i mo�na go u�ywa� r�wnie� w przegl�darce.

Je�eli utkniesz, nie zra�aj si� prosz�. A je�eli utkniesz, b�dziesz pr�bowa� znowu i nadal Ci si�
nie uda, po prostu si� tym nie przejmuj i czytaj dalej, zak�adaj�c oczywi�cie, �e ciekawi Ci�, co
b�dzie dalej. Zrozumienie, �e ucz�c si� matematyki *nie trzeba rozwi�zywa� wszystkich zada�* i �e
upieranie si� przy tym mo�e bardzo przeszkadza� w nauce zaj�o mi naprawd� du�o czasu, o wiele za
du�o. �a�uj�, �e nikt mi tego nie t�uk� ju� dawno do g�owy (albo jeszcze lepiej, cierpliwie
t�umaczy�).

�eby Ci� przekona� do uczenia si� ze mn� na luzie, opowiem Ci, jak zmiana nastawienia do matematyki
zmieni�a moje �ycie. W trakcie wakacji 2023 roku, roj�c sobie, �e mo�e jakim� cudem b�d� mia� szans�
to niebawem wykorzysta�, zacz��em uczy� si� systematycznie z cudownej ksi��ki [Type Theory and
Formal
Proof](https://www.cambridge.org/core/books/type-theory-and-formal-proof/0472640AAD34E045C7F140B46A57A67C),
napisanej przez Geuversa i Nederpelta. Ta ksi��ka jest napisana w bardzo jasny spos�b. Czytaj�c j�
czuje si�, �e autorzy staraj� si� wszystko wyt�umaczy� najlepiej jak tylko potrafi�. W mojej ocenie
to jest te� wybitna *literatura* w tym znaczeniu, �e styl jest jednocze�nie wyj�tkowo elegancki,
lekki, a cz�sto nawet ciep�y.

Niekt�rzy wybitni matematycy potrafi� tak pisa�. A �e temat jest czasem abstrakcyjny, z�o�ony i
pe�en g��bokich niespodzianek, rezultatem bywa pora�aj�ce po��czenie tre�ci i formy. Taki efekt jest
osi�galny chyba tylko wtedy, gdy autorzy maj� rzeczywi�cie co� do powiedzenia i nie tylko dobrze
rozumiej� to, co chc� powiedzie�, ale tak�e to, jakie trudno�ci mog� si� pojawi� u odbiorcy. No wi�c
to jest, w mojej ocenie, tego rodzaju ksi��ka. W dodatku poza dobr� znajomo�ci� j�zyka angielskiego
autorzy nie zak�adaj� �adnej wcze�niejszej wiedzy czytelnika. Mimo to, uczenie si� z niej nie by�o
dla mnie ani troch� �atwe.

Przez d�u�szy czas zaczyna�em prawie ka�dy dzie� od 30 minutowej jednostki (tak to sobie nazywam),
polegaj�cej albo na czytaniu *po raz kolejny* tego samego *kr�tkiego* fragmentu, albo na robieniu
notatek czy zaplanowanych powt�rek. P�niej tego samego dnia zdarza�o si�, �e jeszcze do tego
wraca�em, ale nie zawsze. Na pocz�tku rozwi�zywa�em te� wszystkie zadania. I to by� naprawd� bardzo
wolny proces.

Kt�rego� dnia, z czystej ciekawo�ci, zacz��em swobodnie czyta� dalej, a potem wr�ci�em do fragmentu,
na kt�rym wcze�niej sko�czy�em. W ten spos�b mia�em pewn� przerw� mi�dzy momentem, w kt�rym pierwszy
raz przeczyta�em p�niejszy fragment, ale nie robi�em �adnych pojawiaj�cych si� tam zada�, a
momentem, kiedy znowu zacz��em go czyta�. Okaza�o si�, �e rozumiem ten fragment znacznie
lepiej. Postanowi�em wi�c, po raz pierwszy w �yciu i tylko na pr�b�, *w og�le nie robi� zada�, gdy
nie mam na to ochoty, albo gdy nie czuj�, �e musz� je zrobi�, �eby zrozumie� o co chodzi*. A tak
przy okazji - niekt�re z zada� w tej dziwnej ksi��ce, kt�r� w�a�nie czytasz, s� integraln� cz�ci�
tekstu, ale oczywi�cie mo�na je omin��, o ile tylko p�niejsze tre�ci b�d� nadal zrozumia�e.

Robi�em wi�c dalej notatki i zaplanowane, generatywne powt�rki, ale nie robi�em �adnych zada�, kt�re
mnie nie zainteresowa�y i kt�re nie wydawa�y mi sie wa�ne. Z czasem zacz��em te� zauwa�a�
b��dy. Czytaj�c zawsze szukam b��d�w, po prostu tak mam i moje do�wiadczenie wskazuje, �e w
d�u�szych tekstach napisanych w j�zyku naturalnym jakie� b��dy zawsze zostaj�. W moich d�u�szych
tekstach s� z pewno�ci�. Poniewa� czu�em, �e mam racj�, napisa�em do Roba Nederpelta, kt�ry
potraktowa� mnie niezwykle �yczliwie i powa�nie. Jednym z efekt�w tej przygody jest to, �e moje
nazwisko pojawi�o si� w oficjalnej erracie do tej ksi��ki, jako nazwisko jednej z os�b, kt�rej
autorzy dzi�kuj�. A mi akurat dzi�kuj� za wskazanie (w tym momencie, to jest 2024-12-11) oko�o
*po�owy* wszystkich wymienionych b��d�w. Z niewielu rzeczy jestem tak dumny jak z tego, dlatego
cz�sto si� tym chwal�. Nie wpad�bym na pomys� napisania czego� cho�by tylko odlegle zbli�onego do
tego dziwnego tekstu, kt�ry masz w�a�nie przed oczami, gdyby nie ta wspania�a ksi��ka i kontakt z
tym cz�owiekiem. No wi�c z ambicjami lepiej nie przesadza�, moim zdaniem, jak ju� chyba wspomina�em,
najwa�niejszy jest czas.

Co� innego, co te� na zawsze zmieni�o moje �ycie, a co jest zwi�zane z tym, o czym przed chwil�
pisa�em, przytrafi�o mi si� w szokle podstawowej na lekcji fizyki. Moja nauczycielka z tego
przedmiotu, Pani P�ucienniczak, kt�r� bardzo dobrze wspominam (jednak moj� ulubion� nauczycielk� na
zawsze pozostanie Pani W�jcik, kt�ra uczy�a mnie matematyki), t�umaczy�a co� na tablicy i kiedy
zrozumia�em (ale czy na pewno?), o czym m�wi�a, zrozumia�em te� jednocze�nie co� wa�niejszego od
fizyki: *Wszystko, co da si� zrozumie�, ja te� mog� zrozumie�, o ile tylko b�d� mia� do�� informacji
i czasu*. Uwa�am, �e je�eli si�gn�a� po t� ksia�k�, to Ty te� mo�esz zrozumie� *wszystko*, co da
si� zrozumie�. Jak to uj�� Silvanus Thompson w swoim popularnym i dost�pnym za darmo [podr�czniku do
rachunku r�niczkowo-ca�kowego](https://calculusmadeeasy.org/), *What one fool can do, another
can*. Thompson podaje, �e to jest *Ancient Simian Proverb*, ale to �art (sprawd�, co znaczy
"Simian". je�li chcesz si� dowiedzie� wi�cej).

Zawsze by�em chudy, dobry z matematyki, i dobry z programowania, bo taki si� urodzi�em. Z pewno�ci�
nie by�em jednak nigdy ani tym bardziej nie jestem geniuszem. Po prostu w szkole podstawowej nie
potrafi�em nie my�le� cz�sto o matematyce. M�j przyjaciel, wybitny teoretyk prawa i filozof Wojtek
Za�uski jest zdaje mi si� prawdziwym geniuszem. Inny m�j przyjaciel, filozof matematyczny (je�li
wolno mi tak nazwa� to, czym si� zajmuje) Szymon Szymczak te� jak s�dz� jest. To oczywi�cie
g�uptasy, jak my wszyscy, ale to s� akurat g�uptasy w pewnych (zbyt licznych) obszarach
genialne. Dzi�ki nim wiem, jaki ze mnie dure�.

My�lisz, �e mo�e przesadzam? W *pierwszej klasie szko�y podstawowej* nie zapisa�em prawie nic w
zeszycie i m�j szkolny "poziom wykonania" by� tak niski, �e, jak si� p�niej dowiedzia�em,
nauczyciele powa�nie zastanawiali si�, czy nie powinienem zosta� w niej na drugi rok. Z powodu
licznych nieobecno�ci (kt�rych co prawda spor� cz�� sp�dzi�em w bibliotece) i bardzo s�abych ocen z
kilku przedmiot�w o ma�o co nie powtarza�em te� klasy w liceum. Na studia z psychologii jest tylu
ch�tnych, �e niekt�rzy z Was z pewno�ci� przerastaj� mnie wrodzon� moc� obliczeniow�, a poza tym nie
jestem ju� m�ody. 

No to sk�d si� tu w og�le wzi��em? Uczy�em si� d�ugo i systematycznie r�nych trudnych rzeczy, a
robi�em to, bo znalaz�em na siebie pewien spos�b. Pracuj� na uczelni mi�dzy innymi dzi�ki temu, �e
na pierwszym albo drugim roku psychologii z podr�cznika Andersona, z kt�rego korzystali�my czasem na
zaj�ciach z psychologii poznawczej, dowiedzia�em si�, jak si� uczy�, a ze znakomitej ksi��ki
[Rachlina](https://www.hup.harvard.edu/books/9780674013575) (ale uprzedzam, polskie t�umaczenie "nie
jest optymalne") dowiedzia�em si� z kolei, jak sobie radzi� z ekstremaln� prokrastynacj�. Dlatego
�eby jednocze�nie zach�ci� Ci� do dalszej lektury i jako� odwdzi�czy� si� tym dw�m autorom, w
nast�pnym rozdziale powiem Ci kr�tko, jak si� uczy�em i jak czasem nadal to robi�, a tak�e jak uda�o
mi si� robi� to zarazem regularnie i przez d�u�szy czas.

Skoro ju� m�wi� o takich sprawach, to wypada mi podkre�li�, �e nie zosta�bym pracownikiem uczelni,
gdyby nie wsparcie, �yczliwo�� i wyrozumia�o�� - moich przyjaci�, niezr�wnanego Micha�a Wierzchonia
i uczciwej, skromnej, m�drej (i dowcipnej!)[^2] Marty Siedleckiej, kt�ra od dawna dostarcza mi
sensownych zaj�� - a tak�e Kasi Popio�ek, kt�ra by�a dla mnie wymarzon� szefow� przez te 10 lat,
kiedy pracowa�em na SWPSie w Katowicach. A doktoratu bym by� mo�e wcale nie napisa�, gdybym nie
liczne rozmowy z Tomkiem Grzegorkiem, kt�remu akurat zawdzi�czam znacznie wi�cej ni� to, gdzie dzi�
pracuj�.

Z kolei Adasiowi Chuderskiemu, kt�ry jest teraz szefem krakowskiej kognitywistyki, zawdzi�czam
przygod� z Lispem, kt�ra na zawsze zmieni�a m�j spos�b my�lenia o programowaniu. Podszed� kiedy� do
mnie, gdy b�d�c jeszcze na studiach magisterskich pisa�em w C++ jak�� procedur� do
eksperymetu. Zapyta�, w jakim j�zyku pisz�, na co odpowiedzia�em, �e w C++, a On wtedy powiedzia�,
�artuj�c, �e gdyby jego koledzy dowiedzieli si�, �e pisze w C++, to by go wy�miali. No to zapyta�em,
niezra�ony, w czym On pisze, na co powiedzia�, �e w Lispie. Wtedy nie mia�em zielonego poj�cia, co
to Lisp, a nied�ugo p�niej to by� m�j ulubiony j�zyk i na d�ugo nim pozosta�. W�a�nie dlatego pisz�
t� ksi��k� w [Emacsie](https://www.gnu.org/fun/jokes/gospel.en.html), z kt�rym jestem od dawana tak
mocno zro�ni�ty, �e czasem wr�cz zapominam, �e go w og�le u�ywam. Wygl�da wi�c na to, �e trzeba
czasu, by� mo�e jakiego� sposobu na siebie i dobrych przyjaci�; wtedy mo�na zrozumie�, co tylko si�
chce. What one fool can do, another can.

### Przypisy

[^1]: To jest lu�na parafraza cytatu, ale nie pami�tam czyjego. Chyba jakiego� buddysty.

[^2]: Brane by�y pod uwag� r�wnie� takie, zasugerowane mi przez nie powiem kogo epitety jak bezkompromisowa i przezabawna, niez�omna i wiekopomna, czy m�dra i krn�bra. Epitety te zosta�y przez moj� osob� autorsk� uznane za trafne i jako takie trafi�y do tego przypisu.
