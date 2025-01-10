# Sk�d si� ta ksi��ka wzi�a?

Ta ksi��ka by�a najpierw kr�tkim skryptem dla student�w. Planuj�c �wiczenia do kursu neuronauka i
psychologia poznawcza, zapisa�em w sylabusie, �e na zaj�ciach dotycz�cych teorii normatywnych
b�dziemy omawia� jaki� bli�ej nieokre�lony m�j "skrypt w�asny". Korzystaj�c z tej okazji,
postanowi�em przeprowadzi� eksperyment, kt�ry polega� na pr�bie przekonania student�w, �e przy
odrobinie wysi�ku mog� nauczy� si� dowodzenia prostych twierdze�, a dzi�ki temu troch� lepiej
zrozumie�, a ju� na pewno lepiej zapami�ta�, na przyk�ad twierdzenie Bayesa. Skrypt sta� si� seri�
komentarzy ilustrowanych fragmentami kodu, kt�re by�y jednocze�nie zadaniami wymagaj�cymi dowodzenia
tautologii w j�zyku [Lean](https://lean-lang.org/).

Mia�em w�tpliwo�ci, czy to si� uda, wi�c najpierw sprawdzi�em, jak sobie z tym poradzi m�j syn,
siedemnastoletni wtedy Tymek. Sz�o mu to do�� wolno, dlatego wprowadzi�em kilka zmian i poprawion�
wersj� da�em doktorantom, kt�rzy chodzili wtedy na moje zaj�cia dotycz�ce wnioskowania bayesowskiego
i przyczynowego. Dzi�ki temu (jeszcze raz dzi�kuj�!) spora cz�� student�w wykona�a poprawnie
zadanie, a kilkoro wyrazi�o nawet zainteresowanie dalszym ci�giem.

Poniewa� sam zacz��em si� niedawno uczy� Leana, postanowi�em robi� to nadal, poprawiaj�c i
rozwijaj�c to, co ju� napisa�em. Pisz�c wcze�niej na zam�wienie [wprowadzenie do wnioskowania
przyczynowego dla psycholog�w](https://czasopisma.uwm.edu.pl/index.php/pp/article/view/9731/7171)
(wersja w j�zyku angielskim jest bardziej dopracowana), przekona�em si�, po raz kolejny, �e to
najlepszy spos�b, �eby nauczy� si� czego� lepiej. Ten artyku� zam�wi� u mnie Arek Bia�ek, za co mu
tutaj serdecznie dzi�kuj�, poniewa� zmusi�o mnie to do d�u�szych rozmy�la� na temat rachunku
przyczynowego. Nie jest to chyba m�j najgorszy tekst, skoro [spodoba�
si�](https://x.com/yudapearl/status/1737769250511843448) samemu
[Pearlowi](https://en.wikipedia.org/wiki/Judea_Pearl), kt�ry raczej nie prawi ch�tnie komplement�w
na temat tego typu artyku��w, dlatego zamierzam bezwstydznie skorzysta� z niego (z artyku�u, nie z
Pearla) w dalszej cz�ci ksi��ki.

Po wstawieniu skryptu w nieco bardziej estetycznej formie na GitHuba, tak si� w to wci�gn��em, �e po
chwili z jednego skryptu zrobi�y si� dwa, potem trzy, a nied�ugo potem siedem i to wszystko zacz�o
wygl�da� jak taka jakby troch� mo�e ksi��ka. W dodatku ksi��ka, kt�r� - po dopracowaniu jej przez
autora (czyli w tym wypadku mnie) - sam chcia�bym przeczyta�, zanim jeszcze zacz��em si� o tych
sprawach uczy�. Przy okazji odkry�em tak�e inny cel.

Wi�kszo�� psycholog�w - mam tu na my�li r�wnie� utytuowanych pracownik�w naukowych z bogatym
dorobkiem - polega w ogromnym stopniu na matematyce, na przyk�ad u�ywaj�c wnioskowania
statystycznego, ale nie tylko wtedy, i pr�buje zrozumie� z�o�one i trudne do wyja�nienia zjawiska,
takie jak zachowania ludzi czy struktur� i przebieg proces�w umys�owych. Jednak wielu z nich nie ma
najcz�ciej o matematyce za bardzo poj�cia. Dobrymi przyk�adami powa�nych b��d�w, wynikaj�cych z
niezrozumienia matematycznej nieuchronno�ci kilku *prostych* przecie� zasad, s� powszechne
[wnioskowanie o braku efektu na podstawie samego tylko nieistotnego wyniku testu
statystycznego](https://en.wikipedia.org/wiki/Type_I_and_type_II_errors), albo wnioskowanie o
wp�ywie czy innych w�asno�ciach przyczynowych bez wprowadzenia i uzasadnienia koniecznych za�o�e�
(wielu psycholog�w wci�� nie zdaje sobie sprawy, jak powa�ne konsekwencje wynikaj� z faktu, �e
[przyczynowo�� zosta�a zmatematyzowana](https://en.wikipedia.org/wiki/Causal_inference)).

Nic wi�c dziwnego, �e tacy - niestety w psychologii do�� liczni - matematyczni p�analfabeci
nierzadko wyci�gaj� z w�asnych i cudzych bada� nieuzasadnione wnioski, pope�niaj�c przy tym czasem
najprostsze nawet b��dy. Mimo to udaje im si� publikowa� w wysokopunktowanych czasopismach, bo
wysy�ane przez nich manuskrypty s� zwykle recenzowane i dopuszczane do druku przez innych
matematycznych p�analfabet�w. Rezultatem tej zabawy w chowanego jest powszechna w psychologii ju�
od dawna rozczarowuj�ca [gra pozor�w](https://pl.wikipedia.org/wiki/Kulty_cargo).

Matematyczny p�analfabetyzm zdecydowanej wi�kszo�ci psycholog�w jest �atwym do zaobserwowania
faktem. R�wnie �atwo jest wskaza� jedn� z g��wnych przyczyn, o ile nie przyczyn� najwa�niejsz�, tego
smutnego stanu rzeczy: Praktycznie *nikt*, w��czaj�c w to osoby prowadz�ce zaj�cia ze statystyki,
nie wymaga od psycholog�w znajomo�ci nawet tylko tej odrobiny matematyki, kt�r� trzeba pozna�, �eby
troch� g��biej zrozumie� o co tak naprawd� chodzi mi�dzy innymi w testowaniu istotno�ci albo w
poprawnym uzasadnianiu wniosk�w przyczynowych. A przecie� te dwa rodzaje rozumowa� odgrywaj�
*centraln�* rol� w *niemal ka�dym* artykule empirycznym. Co ambitniejsi studenci uzupe�niaj�
samodzielnie braki w wiedzy, ale akurat matematyki ma�o kto uczy si� systematycznie z w�asnej woli.

Mam wra�enie, �e studenci i przynajmniej Ci m�odsi pracownicy naukowi cz�sto mniej boj� si�
programowania ni� matematyki, a poza tym z programowaniem mog� si� oswaja� w interakcji z
dostarczaj�cym informacji zwrotnych komputerem. Wtedy obecno�� nauczyciela nie jest a� taka
potrzebna. Ta ksi��ka ma mi�dzy innymi pom�c w oswajaniu si� z matematyk� przede wszystkim w�a�nie
zainteresowanym samodzielnym poszerzaniem wiedzy studentom psychologii i pracownikom akademickim
zajmuj�cym si� badaniami psychologicznymi, kt�rzy s� gotowi w tym celu podj�� pr�b� poznania nowego,
pi�knego i wyj�tkowo ekspresyjnego j�zyka programowania.

Uprzedzam jednak, �e ta ksi��ka *mo�e zawiera� b��dy we fragmentach napisanych w j�zyku naturalnym*,
czyli tam, gdzie mniej lub bardziej po swojemu obja�niam kod albo zap�dzam si� w dygresje. To ryzyko
nie wydaje mi si� pomijalnie ma�e, bo jestem tylko matematycznym amatorem. Co prawda co� tam mog�
pokaza� jako "dow�d", �e co� tam o matematyce wiem, ale nie ma tego wiele. Gdyby� wi�c znalaz�a
b��d, b�d� wdzi�czny, je�li mi o tym napiszesz (boryslaw.paulewicz@uj.edu.pl).

Mog� Ci� za to zapewni�, �e ta ksi��ka *prawie na pewno nie zawiera b��d�w w cz�ciach formalnych*,
to jest zakodowanych w pewnej wersji j�zyka teorii typ�w, z kt�rej korzysta asystent dowodzenia
Lean. To jest o ile te cz�ci sprawdzi�em przed pos�aniem zmian do repozytorium. Zwykle tak robi�,
ale zdarza mi si� o tym zapomina� kiedy du�o pisz� albo du�o zmieniam. Je�eli akurat sprawdzi�em kod
po wprowadzeniu zmian, to znaczy, �e wszystkie formalne cz�ci zosta�y sprawdzone przez algorytm,
kt�rego u�ywa do tego Lean, a wtedy ma�o czego mo�na by� tak pewnym jak tego, �e s�
[bezb��dne](https://royalsocietypublishing.org/doi/10.1098/rsta.2005.1650). A gdyby� mia�a
jakiekolwiek w�tpliwo�ci, zawsze mo�esz wklei� kod do Leana i przekona� si� sama, czy nie pojawia
si� b��d.

Musz� Ci� te� ostrzec, �e je�eli dotrzesz do ko�ca rozdzia�u sz�stego i uda Ci si� zrobi� poprawnie
zadania, kt�rych do tego momentu b�dzie zreszt� niewiele, mo�liwe, �e poczujesz co� w rodzaju
zagubienia. B�dziemy si� zajmowa� bardzo abstrakcyjnymi sprawami, dlatego takie poczucie jest na
pocz�tku do�� prawdopodobne. Ja te� si� tak czu�em, gdy zaczyna�em si� uczy� o teorii typ�w. To
poczucie mo�e si� stopniowo zmieni� w coraz g��bsze zrozumienie, ale to wymaga *cierpliwo�ci*.

W zwi�zku z tym, oto moja sugestia: Daj sobie czas, �eby wszystko zd��y�o si� troch� "ule�e�" i
pog�d� si� z tym, �e dobre opanowanie tego rodzaju materia�u mo�e wymaga� wracania do przeczytanych
ju� wcze�niej fragment�w. O ile nie zabraknie wytrwa�o�ci, mo�e w ko�cu stanie si� to, co dzieje si�
wtedy, kiedy przez d�u�szy czas dok�d� idziemy, niekoniecznie d���c stale do jednego celu, a
powietrze jest bardzo wilgotne. Nie ma wtedy wyra�nego momentu, gdy zachodzi jako�ciowa zmiana,
odkrywamy jednak w ko�cu, �e cho� nie pada� deszcz, jeste�my przemoczeni[^1].

Gdy pojawi si� frustracja, a prawie na pewno czasem si� pojawi, poczekaj, albo wr�� do tego, co
wydaje Ci si�, �e ju� dobrze zrozumia�a�. A w�a�nie. Niedawno postanowi�em, �e poniewa� wi�kszo��
student�w psychologii to wcale nie studenci, tylko studentki, b�d� zwraca� si� do Ciebie w formie
�e�skiej. Jest te� inny dobry moim zdaniem pow�d.

Pozna�em wiele kobiet zajmuj�cych si� psychologi�, kt�re w mojej ocenie maj� wi�cej oleju w g�owie,
ni� wielu znanych mi m�czyzn, kt�rzy te� si� ni� zajmuj�. W�r�d pracownik�w akademickich nie
spotka�em jednak prawie wcale kobiet, kt�re dor�wnywa�yby wi�kszo�ci m�czyzn pewno�ci� siebie i
�atwo�ci� wypowiadania stanowczych opinii. Wiem, co m�wi�, bo sam jestem znany z aroganckich
wypowiedzi. A poza tym, gdy zacz��em pisa� do wyobra�onego czytelnika w formie �e�skiej, przysz�o mi
do g�owy, �e ewentualny brak tupetu przestaje mie� znaczenie, kiedy swoje tezy mo�na *formalnie
udowodni�* i bardzo spodoba�a mi si� wizja kobiet prezentuj�cych *wnioski z bada�* z pe�n�
�wiadomo�ci�, �e poniewa� te s� ju� udowodnione (zak�adaj�c wiarygodno�� �r�d�a danych), *nie da
si�* ich skutecznie podwa�y�.

Ale wracaj�c ju� do przerwanego w�tku, poczucie zrozumienia cz�sto jest zwodnicze. Wiele razy
uczy�em si� trudnego materia�u, wykonuj�c, czasem przez wiele miesi�cy albo nawet kilka lat, coraz
odleglejsze w czasie, generatywne powt�rki. I wiele razy w trakcie powtarzania zauwa�a�em, �e moje
wcze�niejsze poczucie zrozumienia by�o z�udne. Mo�e to truizm, ale taki, o kt�rym �atwo jest
zapomnie�: Poniewa� nawet na najprostsze sprawy mo�na popatrze� z nowego punktu widzenia, rozumienie
to jest co�, do czego mo�na stale *d��y�*, ale co rzadko, o ile kiedykolwiek, mo�na *osi�gn��*.

Rozdzia�y od czwartego do sz�stego nie s� d�ugie. Przeczytanie ich i wykonanie polece� powinno Ci
zaj�� nie wi�cej ni� p�torej albo dwie godziny. Poza tym ta ksi��ka jest ca�kowicie
samowystarczalna w tym znaczeniu, �e nie zak�ada �adnej specjalistycznej wiedzy; *wszystko* jest
wyja�nione od podstaw, a jedyny program, kt�rego b�dziesz potrzebowa�, jest dost�pny za darmo i
mo�na go u�ywa� r�wnie� w przegl�darce.

Je�eli utkniesz, nie zra�aj si� prosz�. A je�eli utkniesz, b�dziesz pr�bowa� znowu i nadal Ci si�
nie uda, po prostu si� tym nie przejmuj i **czytaj dalej**, zak�adaj�c oczywi�cie, �e b�dziesz nadal
zainteresowana tym, co b�dzie dalej. Zrozumienie, �e ucz�c si� matematyki *nie trzeba rozwi�zywa�
wszystkich zada�* i �e upieranie si� przy tym mo�e przeszkadza� w nauce zaj�o mi naprawd� du�o
czasu, o wiele za du�o. �a�uj�, �e nikt mi tego nie t�uk� ju� dawno do g�owy (albo jeszcze lepiej,
cierpliwie t�umaczy�).

Tylko z tego powodu wiele razy zdarza�o mi si� niepotrzebnie porzuca� nauk�, bo my�la�em, �e skoro
nie przyswoi�em sobie dobrze czego� na danym etapie, to nie powinienem czyta� dalej. A przecie�
rozumienie w zasadzie nigdy nie rozwija si� w taki "liniowy" spos�b. Wydaje mi si�, �e dobrze wiedz�
to informatycy, bo s� chyba przyzwyczajeni do traktowania bibliotek programistycznych i dokumentacji
jak *skrzynek z narz�dziami*, kt�re maj� przede wszystkim *dzia�a�* i kt�rym nie musz� si�
przygl�da� z bliska, czy analizowa� jak s� zbudowane, je�li akurat nie maj� na to ochoty.

�eby Ci� przekona� do uczenia si� ze mn� na luzie, opowiem Ci, jak zmiana nastawienia do matematyki
zmieni�a moje �ycie. W trakcie wakacji 2023 roku, roj�c sobie, �e mo�e jakim� cudem b�d� mia� szans�
to niebawem wykorzysta�, zacz��em uczy� si� z cudownej ksi��ki Geuversa i Nederpelta [Type Theory
and Formal
Proof](https://www.cambridge.org/core/books/type-theory-and-formal-proof/0472640AAD34E045C7F140B46A57A67C). Ta
ksi��ka jest napisana w bardzo jasny spos�b i na ka�dej niemal stronie wida�, �e autorzy staraj� si�
wszystko wyt�umaczy� najlepiej jak potrafi�. W mojej ocenie to jest te� wybitna *literatura*, w tym
znaczeniu, �e styl jest jednocze�nie elegancki i lekki, a ton wydaje mi si� czasami wr�cz ciep�y.

Niekt�rzy wybitni matematycy potrafi� tak pisa�. A �e temat bywa abstrakcyjny, z�o�ony i pe�en
g��bokich niespodzianek, rezultatem mo�e by� pora�aj�ce po��czenie tre�ci z form�. Taki efekt jest
osi�galny chyba tylko wtedy, gdy autorzy maj� rzeczywi�cie co� do powiedzenia i nie tylko dobrze
rozumiej� to, co chc� powiedzie�, ale tak�e to, jakie trudno�ci mog� si� pojawi� u odbiorcy. No wi�c
to jest, moim zdaniem, w�a�nie taka ksi��ka. W dodatku poza dobr� znajomo�ci� angielskiego, autorzy
nie zak�adaj� �adnej wcze�niejszej wiedzy czytelnika. Mimo to, uczenie si� z niej nie by�o dla mnie
ani troch� �atwe.

Przez d�u�szy czas zaczyna�em prawie ka�dy dzie� od 30 minutowej jednostki (tak to sobie nazywam),
polegaj�cej albo na czytaniu *po raz kolejny* tego samego *kr�tkiego* fragmentu, albo na robieniu
notatek czy zaplanowanych powt�rek. P�niej tego samego dnia zdarza�o si�, �e jeszcze do tego
wraca�em, ale nie zawsze. Na pocz�tku rozwi�zywa�em te� wszystkie zadania. I to by� bardzo wolny
proces.

Kt�rego� dnia, z czystej ciekawo�ci, zacz��em swobodnie czyta� dalej, a potem wr�ci�em do fragmentu,
na kt�rym wcze�niej sko�czy�em. W ten spos�b mia�em pewn� przerw� mi�dzy momentem, w kt�rym pierwszy
raz przeczyta�em ten p�niejszy fragment, ale nie robi�em �adnych pojawiaj�cych si� tam zada�, a
momentem, kiedy znowu zacz��em go czyta�. Okaza�o si�, �e rozumiem ten fragment znacznie
lepiej. Postanowi�em wi�c, po raz pierwszy w �yciu i tylko na pr�b�, *w og�le nie robi� zada�, gdy
nie mam na to ochoty, albo gdy nie czuj�, �e musz� je zrobi�, �eby zrozumie� chocia� troch�, o co
chodzi*. A tak przy okazji, niekt�re z zada� w ksi��ce, kt�r� w�a�nie czytasz, s� integraln� cz�ci�
tekstu, ale oczywi�cie mo�na je omin��, o ile tylko p�niejsze tre�ci b�d� nadal zrozumia�e.

Dalej robi�em wi�c notatki i zaplanowane, generatywne powt�rki, ale nie robi�em �adnych zada�, kt�re
mnie nie zainteresowa�y i kt�re nie wydawa�y mi sie wa�ne. Z czasem zacz��em te� zauwa�a�
b��dy. Czytaj�c zawsze szukam b��d�w, po prostu tak mam i moje do�wiadczenie wskazuje, �e w
d�u�szych tekstach napisanych w j�zyku naturalnym jakie�
[b��dy](https://www.youtube.com/watch?v=6LqnBrBSFyU) zawsze s�. W moich d�u�szych tekstach s� z
pewno�ci�. Poniewa� czu�em, �e mam racj�, napisa�em do [Roba
Nederpelta](https://wsinrpn.win.tue.nl/), kt�ry potraktowa� mnie niezwykle �yczliwie i
powa�nie. Jednym z efekt�w tej przygody jest to, �e moje nazwisko pojawi�o si� w oficjalnej erracie
do tej ksi��ki, jako nazwisko jednej z os�b, kt�rej autorzy dzi�kuj�. A mi akurat dzi�kuj� za
wskazanie (w tym momencie, to jest 2024-12-11) oko�o po�owy wszystkich wymienionych b��d�w i nie
chodzi tu wcale o liter�wki czy inne tego rodzaju drobiazgi, a o b��dy rzeczowe. Z niewielu rzeczy
jestem tak dumny jak z tego, dlatego cz�sto si� tym chwal�. Nie wpad�bym na pomys� napisania czego�
cho�by tylko odlegle zbli�onego do tego tekstu, kt�ry masz w�a�nie przed oczami, gdyby nie ta
wspania�a ksi��ka i kontakt z tym niezwyk�ym cz�owiekiem. No wi�c z ambicjami lepiej nie przesadza�;
moim zdaniem, jak ju� wspomina�em, najwa�niejszy jest czas.

Skoro ju� m�wimy o po�ytkach p�yn�cych ze znajdywania b��d�w, mo�e przyda Ci si� patent, kt�ry
odkry�em podczas pisania [doktoratu]((./praca_doktorska.pdf)). Poniewa� jedn� z wi�kszych
przyjemno�ci zwi�zanych z tym procesem by�a dla mnie zabawa r�nymi mniej lub bardziej
skomplikowanymi narz�dziami teoretycznymi, musia�em jako� rozwi�za� problem polegaj�cy na tym, �e
nie by�o w okolicy �adnych specjalist�w, kt�rych m�g�bym poprosi� o pomoc. Gdy czu�em, �e musz� si�
w czym� szybko podszkoli�, szuka�em wi�c najlepszych �yj�cych autor�w zajmuj�cych si� tematem, potem
zdobywa�em, nie powiem w jaki spos�b (ani nie powiem, czy na przyk�ad z istniej�cego ju� wtedy
serwisu [AvaxHome](https://avaxhome-mirrors.pw/)) ich najlepsze ksi��ki, przebija�em si� przez
pierwsze kilkadziesi�t stron szukaj�c b��d�w, po czym pisa�em do autor�w maile. W tych mailach
zwykle wyra�a�em szczery podziw i g��bok� wdzi�czno��, r�wnie� szczer�, a niejako przy okazji
wspomina�em tak ostro�nie, jak tylko umia�em (czyli pewnie niezbyt) o znalezionych b��dach. A te
zawsze mo�na by�o znale��. List� autor�w, kt�rym "to zrobi�em" znajdziesz na dziewi�tej stronie
mojego doktoratu.

Zwykle im *bardziej* wybitni i uznani byli Ci autorzy, tym szybciej, bardziej �yczliwie i
wyczerpuj�co mi odpowiadali. Chyba najlepszym przyk�adem jak to mo�e dzia�a� jest jedna z
odpowiedzi, jak� otrzyma�em wtedy od [Saula
Sternberga](https://en.wikipedia.org/wiki/Saul_Sternberg). Napisa�em mu wyra�nie, �e to kwestia
drugorz�dna, ale gdyby to by�o mo�liwe, chcia�bym zrobi� po swojemu analiz� wynik�w klasycznego ju�
eksperymentu, kt�ry przeprowadzi� w latach 60tych. Jak si� potem dowiedzia�em, pomiar czasu reakcji
polega� wtedy na *nanoszeniu dziur na rolce papieru*, zawini�tej bodaj wok� obracaj�cego si� w
miarowym tempie b�bna. Pisz�c w odpowiedzi, o ile pami�tam zreszt� dosy� szybkiej, Saul
zaproponowa�, �e *zleci digitalizacj� swojej sekretarce*. Zawstydzony odpisa�em zaraz, �e nie
trzeba.

Co� innego, co te� na zawsze zmieni�o moje �ycie, a co jest zwi�zane z tym, o czym przed chwil�
m�wi�em, przytrafi�o mi si� w szkole podstawowej na lekcji fizyki. Moja nauczycielka z tego
przedmiotu, Pani P�ucienniczak, kt�r� bardzo dobrze wspominam (jednak moj� ulubion� nauczycielk� na
zawsze pozostanie Pani W�jcik, kt�ra uczy�a mnie matematyki), t�umaczy�a w�a�nie co� na tablicy i
kiedy zrozumia�em (ale czy na pewno?), o czym wtedy m�wi�a, zrozumia�em te� jednocze�nie co�
wa�niejszego od fizyki: *Wszystko, co da si� zrozumie�, ja te� mog� zrozumie�, o ile tylko b�d� mia�
do�� informacji i czasu*. Uwa�am, �e je�eli si�gn�a� po t� ksia�k�, to Ty te� mo�esz zrozumie�
*wszystko*, co da si� zrozumie�. Jak to uj�� Silvanus Thompson w swoim popularnym i dost�pnym za
darmo [podr�czniku do rachunku r�niczkowo-ca�kowego](https://calculusmadeeasy.org/), *What one fool
can do, another can*. Thompson podaje tam, �e to jest *Ancient Simian Proverb*, ale to �art
(sprawd�, co znaczy "Simian", je�li chcesz si� dowiedzie� wi�cej).

Zawsze by�em chudy[^3], dobry z matematyki i dobry z programowania, bo taki si�
[urodzi�em](https://en.wikipedia.org/wiki/Three_Identical_Strangers). Z pewno�ci� nie by�em jednak
nigdy ani tym bardziej nie jestem geniuszem. Po prostu w szkole podstawowej nie potrafi�em nie
my�le� cz�sto o matematyce. M�j wspania�y przyjaciel z licealnej szkolnej �awki, wybitny teoretyk
prawa i filozof Wojtek Za�uski, jest zdaje mi si� prawdziwym geniuszem. Inny m�j r�wnie� wspania�y
przyjaciel, filozof matematyczny (je�li wolno mi tak nazwa� to, czym si� zajmuje) Szymon Szymczak
te� jak s�dz� jest. To oczywi�cie g�uptasy, jak my wszyscy, ale to s� akurat g�uptasy w pewnych,
zbyt licznych, obszarach genialne. Dzi�ki nim wiem doskonale, jaki ze mnie dure�.

My�lisz, �e z tym durniem przesadzi�em? W *pierwszej klasie szko�y podstawowej* nie zapisa�em prawie
nic w zeszycie i m�j szkolny poziom wykonania by� tak niski, �e, jak si� p�niej dowiedzia�em,
nauczyciele powa�nie zastanawiali si�, czy nie powinienem zosta� w niej na drugi rok. Z powodu
licznych nieobecno�ci (kt�rych co prawda spor� cz�� sp�dzi�em w bibliotece) i bardzo s�abych ocen z
kilku przedmiot�w, o ma�o co nie powtarza�em te� klasy w liceum; uratowa�a mnie wtedy olimpiada z
filozofii. Na studia z psychologii jest tylu ch�tnych, �e niekt�rzy z Was z pewno�ci� przerastaj�
mnie wrodzon� moc� procesora, a poza tym nie jestem ju� m�ody.

No to sk�d si� tu w og�le wzi��em? Uczy�em si� d�ugo i systematycznie r�nych trudnych rzeczy, a
robi�em to, poniewa� znalaz�em na siebie pewien spos�b. Pracuj� na uczelni mi�dzy innymi dzi�ki
temu, �e najpierw z popularnej ksi��ki Tony'ego Buzana [*Rusz
g�ow�*](https://lubimyczytac.pl/ksiazka/3822524/rusz-glowa), a potem jeszcze na pierwszym albo
drugim roku psychologii z podr�cznika Johna Andersona, z kt�rego nadal czasem korzystam na
zaj�ciach, dowiedzia�em si�, jak si� skuteczniej uczy�, a ze znakomitej [ksi��ki
Rachlina](https://www.hup.harvard.edu/books/9780674013575) (ale uprzedzam, polskie t�umaczenie "nie
jest optymalne") dowiedzia�em si� z kolei, w jaki spos�b sobie radzi� z ekstremaln� wr�cz
prokrastynacj�. Dlatego, �eby zach�ci� Ci� do dalszej lektury i odwdzi�czy� si� w jaki� spos�b tym
autorom, w nast�pnym rozdziale opowiem Ci kr�tko, w jaki spos�b si� uczy�em i czasami wci�� to
robi�, a tak�e jak uda�o mi si� robi� to zarazem regularnie i przez d�u�szy czas.

Skoro ju� m�wi� o takich sprawach, to musz� podkre�li�, �e nie zosta�bym pracownikiem uczelni, gdyby
nie wsparcie, �yczliwo�� i wyrozumia�o�� - moich przyjaci�, niezr�wnanego Micha�a Wierzchonia, od
kt�rego dopiero niedawno (bo jestem a� taki g�upi) zacz��em si� uczy�, �e praca dopiero wtedy mo�e
by� prawdziwie satysfakcjonuj�ca, kiedy polega na *wsp�*pracy, i uczciwej, skromnej, m�drej (i
dowcipnej!)[^2] Marty Siedleckiej, kt�ra od dawna dostarcza mi sensownych zaj�� - a tak�e Kasi
Popio�ek, kt�ra by�a dla mnie wymarzon� wprost szefow� przez te 10 lat, kiedy pracowa�em na SWPSie w
Katowicach. A doktoratu, napisanego najpierw pod kierunkiem bardzo dla mnie wa�nego dr
hab. Krzysztofa Krzy�ewskiego, a p�niej prof. Edwarda N�cki, kt�remu, podobnie jak temu Pierwszemu,
zawdzi�czam swobod� zajmowania si� w owym czasie czym tylko mia�em ochot� si� zajmowa�, by� mo�e
wcale bym nie sko�czy�, gdyby nie liczne rozmowy z dodaj�cym mi stale odwagi Tomkiem Grzegorkiem,
moim najwa�niejszym chyba przyjacielem, kt�remu akurat zawdzi�czam znacznie wi�cej ni� to, gdzie
dzisiaj pracuj�.

Z kolei Adasiowi Chuderskiemu, kt�ry jest teraz szefem krakowskiej kognitywistyki, zawdzi�czam
przygod� z [Lispem](https://www.youtube.com/watch?v=-J_xL4IGhJA&list=PLE18841CABEA24090), kt�ra
zmieni�a na zawsze m�j spos�b my�lenia o programowaniu. Podszed� kiedy� do mnie, gdy b�d�c jeszcze
na studiach magisterskich pisa�em w C++ jak�� procedur� do eksperymetu. Zapyta�, w jakim j�zyku j�
pisz�, na co odpowiedzia�em, �e w C++. On wtedy powiedzia�, �artuj�c, �e gdyby jego koledzy
dowiedzieli si�, �e pisze w C++, to by go wy�miali. No to zapyta�em, niezra�ony, w czym On pisze, na
co odpowiedzia�, �e w Lispie. Wtedy nie mia�em zielonego poj�cia, co to Lisp, a nied�ugo p�niej to
by� ju� m�j ulubiony j�zyk i na d�ugo nim pozosta�. W�a�nie dlatego pisz� t� ksi��k� w
[Emacsie](https://www.gnu.org/fun/jokes/gospel.en.html), z kt�rym jestem od dawna tak mocno
zro�ni�ty, �e czasami nawet zapominam, �e go w og�le u�ywam. Wygl�da wi�c na to, �e trzeba czasu,
by� mo�e jakiego� sposobu na siebie i jednego czy dw�ch dobrych przyjaci�; wtedy mo�na zrozumie�,
co tylko si� chce. What one fool can do, another can.

### Przypisy

[^1]: To jest lu�na parafraza cytatu, ale nie pami�tam czyjego. Chyba jakiego� buddysty.

[^2]: Brane by�y pod uwag� r�wnie� takie, zasugerowane mi przez nie powiem kogo epitety jak
    bezkompromisowa i przezabawna, niez�omna i wiekopomna, czy m�dra i krn�bra. Epitety te zosta�y
    przez moj� osob� autorsk� uznane za trafne i jako takie trafi�y do tego przypisu.

[^3]: ang. [*lean*](https://en.wikipedia.org/wiki/Lean_(proof_assistant)).
