# Izomorfizm Curry'ego-Howarda

Za chwil� zaczniemy korzysta� z izomorfizmu Curry'ego-Howarda (tak, tego Curry'ego, kt�ry ju�
wcze�niej si� pojawi�). �eby obja�ni�, na czym to b�dzie polega�o, najpierw powiem jak� w og�le rol�
izomorfizmy odgrywaj� w matematyce.

W szkole podstawowej zacz�a� korzysta� z [uk�adu wsp�rz�dnych
kartezja�skich](https://pl.wikipedia.org/wiki/Uk%C5%82ad_wsp%C3%B3%C5%82rz%C4%99dnych_kartezja%C5%84skich)
i przypuszczam, �e z czasem sta�o si� to dla Ciebie tak bardzo naturalne, �e mo�e nawet nie
zastanawia�a� si�, na czym to w�a�ciwie polega. Jak pewnie wiesz, ten uk�ad wprowadzi� do matematyki
jeszcze w 17 wieku francuski matematyk, filozof i fizyk [Ren�
Descartes](https://pl.wikipedia.org/wiki/Ren%C3%A9_Descartes). Pomys� Kartezjusza, bo tak te� o nim
m�wimy, by� prawdziw� rewolucj�, dlatego �e pozwala *wiernie przet�umaczy�* dowolny problem
geometryczny na odpowiadaj�cy mu problem liczbowy. To jest wierne t�umacznie w tym znaczeniu, �e nie
tracimy wtedy ani nie zniekszta�camy �adnych w�asno�ci problemu geometrycznego. Takie sposoby
wiernego t�umaczenia *w obie strony* nazywamy w matematyce (zachowuj�cymi struktur�)
*izomorfizmami*.

Uk�adu wsp�rz�dnych kartezja�skich u�ywamy w taki oto spos�b: Punktem wyj�cia jest *abstrakcyjnie
rozumiana p�aszczyzna*. Nie chodzi tu o �adn� konkretn� p�aszczyzn� fizyczn�, tylko o co� w rodzaju
idealnie p�askiej powierzchni bez �adnych granic; takiej powierzchni, o kt�rej ch�tnie my�l�
matematycy. Bez dodatkowych za�o�e� ta p�aszczyzna jako taka *nie* ma charakteru liczbowego, tylko
czysto geometryczny. Podobnie na przyk�ad jaki� konkretny okr�g na tej p�aszczy�nie jako taki, kt�ry
mogliby�my sobie wyobrazi� i kt�ry mogliby�my pr�bowa� systematycznie analizowa�, *nie* ma jeszcze
charakteru liczbowego.

[Geometria euklidesowa](https://pl.wikipedia.org/wiki/Geometria_euklidesowa), o kt�rej by� mo�e ju�
s�ysza�a�, jest (pierwszym w historii) dobrym przyk�adem aksjomatycznej teorii tego typu struktur.
By� mo�e jednak nie wiedzia�a� dot�d, �e liczby nie odgrywaj� w tej teorii *�adnej* roli. W
[Elementach](http://aleph0.clarku.edu/~djoyce/java/elements/toc.html) Euklidesa znajdziemy tylko
*rysunkowe reprezentacje* wyidealizowanych obiekt�w geometrycznych i wyra�one w j�zyku naturalnym
definicje i aksjomaty, kt�re te obiekty maj� spe�nia�, a tak�e rozumowania polegaj�ce na
wyprowadzaniu z tych definicji i aksjomat�w r�nych twierdze�.

Pewne problemy geometryczne daj� si� w ten spos�b analizowa� wzgl�dnie wygodnie czy �atwo, ale nie
wszystkie. Je�eli teraz przyjmiemy, �e na przyk�ad na naszej wyidealizowanej p�aszczyznie znajduj�
si� dwie linie przecinaj�ce si� pod k�tem prostym *i* naniesiemy na jedn� z nich, ale nie w miejscu
przeci�cia, jaki� punkt albo kresk�, oznaczaj�c j� przy tym liczb� *1*, to uzyskamy w ten spos�b
*uk�ad wsp�rz�dnych kartezja�skich*. Wystarczy nam ten jeden, definiuj�cy jednostk� punkt i od razu
b�dziemy mieli jednoznacznie okre�lon� "podzia�k�", kt�ra ka�demu punktowi na ka�dej z tych dw�ch
linii albo *osi* przyporz�dkowuje unikaln� liczb� rzeczywist� i odwrotnie, ka�dej liczbie
rzeczywistej przyporz�dkowuje na ka�dej z osi unikalny punkt.

W ten spos�b uzyskujemy metod� wiernego t�umaczenia w obie strony mi�dzy obiektami czysto
geometrycznymi, to jest punktami na ka�dej z osi traktowanej z osobna, a liczbami rzeczywistymi, a
ka�da taka metoda to pewien izomorfizm. Uzyskujemy od razu te� co� wi�cej - ka�demu *punktowi na
p�aszczy�nie*, kt�ry sam z siebie nie ma jeszcze charakteru liczbowego, odpowiada odt�d unikalna
*para liczb*, to jest wsp�rz�dne kartezja�skie tego punktu i odwrotnie, ka�dej parze liczb
rzeczywistych odpowiada unikalny punkt. Dzi�ki temu problemy o charakterze *czysto geometrycznym*
(na p�aszczy�nie) mo�emy wiernie przet�umaczy� na problemy *liczbowe*, a z kolei dzi�ki temu cz�sto
(cho� nie zawsze) �atwiej je rozwi�za� albo lepiej zrozumie�. Co wi�cej, pewne problemy liczbowe,
kt�re mog�yby si� nam wcale pocz�tkowo nie kojarzy� z geometri�, mog� si� okaza� wiernie
przet�umaczalne na problemy geometryczne i mo�e si� r�wnie� okaza�, �e w tej wersji s� dla nas
�atwiejsze albo bardziej zrozumia�e. A czasem dzieje si� i tak, �e *odkrywamy* czy raczej
*znajdujemy* pewne obiekty geometryczne, kt�re najpewniej nie przysz�y by nam w og�le do g�owy,
gdyby�my nie dotarli do nich po�rednio, najpierw rozwa�aj�c jakie� problemy o charakterze liczbowym.

W [artykule](https://czasopisma.uwm.edu.pl/index.php/pp/article/view/9731/7171) na temat
przyczynowo�ci, kt�ry napisa�em g��wnie z my�l� o odbiorcach pr�buj�cych uprawia� psychologi�
naukow� i o kt�rym wspomina�em ju� we wst�pie, r�wnie� korzystam z pewnego izomorfizmu, w dodatku z
izomorfizmu, kt�rego jedn� stron� s� programy komputerowe. Dzi�ki temu mog�em tam ilustrowa�
abstrakcyjne zagadnienia i poj�cia teorii wnioskowania przyczynowego za pomoc� bardzo prostych
symulacji, maj�c przy tym pewno��, �e da si� w ten spos�b *wiernie*, to jest bez zniekszta�ce�,
*zrealizowa�* modele przyczynowe jako komputerowe programy. Mam wra�enie, �e takie podej�cie pozwala
lepiej poczu� realno�� modeli przyczynowych, a ju� na pewno pozwala uczy� si� ich w�a�ciwo�ci
poprzez interakcj� na przyk�ad z j�zykiem
[R](https://en.wikipedia.org/wiki/R_(programming_language)), co dla wielu psycholog�w mo�e by�
znacznie �atwiejsze, tym bardziej, �e cz�� ju� ten j�zyk chocia� troch� zna, ni� rozwi�zywanie
problem�w rachunkowych, kt�rych rozwi�zania wnioskowanie przyczynowe jako takie czasami wymaga.

Zwr�� prosz� uwag�, �e chocia� prawie na pewno na pocz�tku to by�o dla Ciebie dosy� trudne, bo to
jest prawie dla wszystkich pocz�tkowo trudne, a ju� na pewno takie by�o pocz�tkowo dla mnie, to
jednak oswojenie si� z izomorfizmem mi�dzy na przyk�ad kszta�tami tr�jk�t�w z jednej strony i
liczbowymi wielko�ciami ich wewn�trznych kat�w i d�ugo�ciami ich bok�w sta�o si� dla Ciebie z czasem
dosy� naturalne. Za�o�� si�, �e czasami, a mo�e i przez wi�kszo�� czasu, nie zdawa�a� sobie nawet
sprawy z tego, �e k�ty i d�ugo�ci odcink�w po prostu *s�* dla Ciebie liczbami *dzi�ki temu*, �e
jawnie albo w tle zawsze wtedy by� obecny jaki� ustalony uk�ad kartezja�ski. Ta ogromna *swoboda w
prze��czaniu si� mi�dzy dwoma r�nymi punktami widzenia* - geometrycznym i liczbowym - na w istocie
*ten sam* problem, a tak�e mo�liwo�� skutecznego korzystania z tej swobody, by�yby nieosi�galne,
gdyby nie opiera�y si� na idealnej odpowiednio�ci mi�dzy dwoma, dobrze okre�lonymi rodzajami
abstrakcyjnych struktur.

Izomorfizm, kt�ry zachowuje struktur� obydwu przestrzeni (takie obiekty jak zbi�r liczb
rzeczywistych matematycy r�wnie� nazywaj� przestrzeniami), czyli jest, m�wi�c kolokwialnie, wiernym
t�umaczeniem w obie strony, to zatem pot�ne narz�dzie *rozwi�zywania* rozmaitych problem�w, jak
r�wnie� pot�ne narz�dzie s�u��ce do lepszego ich *zrozumienia*. Swoj� si�� zawdzi�cza tak naprawd�
temu, �e pozwala nam przekroczy� pewne ograniczenia o charakterze *psychologicznym*. Dla nas, ludzi,
to, czy dany problem b�dzie �atwy czy trudny do rozwi�zania albo zrozumienia cz�sto w *ogromnym*
stopniu zale�y od przyj�tego *punktu widzenia* na ten problem. Dlatego mi�dzy innymi tak ch�tnie
korzystamy z analogii i metafor i tak bardzo je sobie cenimy. A zachowuj�cy struktur� izomorfizm to
w�a�nie pewien rodzaj doskona�ej analogii.

Izomorfizm Curry'ego-Howarda pozwala osi�gn�� co� podobnego do tego, co umo�liwia uk�ad
kartezja�ski, tylko na znacznie wy�szym, mo�na powiedzie� �e wr�cz zapieraj�cym dech w piersiach
poziomie og�lno�ci. �eby zacz�� przygod� z tym izomorfizmem, trzeba tylko �wiczy� prze��czanie si�
mi�dzy dwoma, dobrze okre�lonymi, ale pocz�tkowo z konieczno�ci troch� obcymi sposobami patrzenia na
*typy*.

By� mo�e jedn� z g��wnych trudno�ci pojawiaj�cych si� pocz�tkowo podczas uczenia si� tego podej�cia
jest to, �e matematyka "rozgrywa si�" wtedy czy mo�e "istnieje" w�a�nie g��wnie na poziomie
typ�w. Gdy ju� jednak zd��ysz si� z tym cho� troch� oswoi�, Twoja zdolno�� do rozumienia tre�ci
matematycznych albo "matematyzacji" problem�w czy poj��, kt�re same z siebie nie maj� jeszcze
matematycznego charakteru, zacznie si� rozwija� znacznie szybciej, ni� gdyby� pr�bowa�a j� rozwija�
w bardziej tradycyjny spos�b.

Pr�buj�c zrozumie�, o czym jest nast�pny rozdzia�, uruchomisz proces zasadniczo taki sam, jak ten
dzi�ki kt�remu by�a� w stanie rozwi�zywa� problemy geometryczne, kt�re czasem wydawa�y Ci si�
proste, ale kt�re bez wcze�niejszego przyzwyczajenia si� do patrzenia na nie jako na problemy
liczbowe by�yby tak trudne, �e by� mo�e nawet nierozwi�zywalne. W dodatku uczenie si� matematyki
*metod� pr�b i b��d�w*, to jest w ramach mniej lub bardziej swobodnej *eksploracji*, b�dzie mia�o
znacznie wi�kszy sens, poniewa� wszystko, czego by� nie spr�bowa�a, b�dzie natychmiast sprawdzone
pod wzgl�dem poprawno�ci przez praktycznie niezawodny program. Pojawi si� dzi�ki temu mo�liwo��
u�ywania matematyki, oczywi�cie w granicach wyznaczonych cz�ciowo przez aktualny poziom Twojego
zrozumienia i wiedzy, w spos�b w pewnym sensie maksymalnie *tw�rczy*.

Curry i Howard odkryli, �e istnieje pewien zachowuj�cy struktur� izomorfizm mi�dzy systemami logiki
formalnej, takimi jak logika konstruktywna, nazywana r�wnie� logik� intuicjonistyczn�, i systemami
s�u��cymi do badania mi�dzy innymi zagadnie� zwi�zanych z obliczalno�ci�, takimi jak rachunek lambda
z typami. Je�eli masz ju� w tym momencie takie w�tpliwo�ci, to od razu Ci� zapewni�, �e korzystaj�c
z tego izomorfizmu nie b�dziemy wcale ograniczeni do jakiej� konkretnej logiki, takiej jak na
przyk�ad logika konstruktywna.

Dla naszych potrzeb to, �e izomorfizm Curry'ego-Howarda istnieje, oznacza tyle, �e *ka�dy* problem
matematyczny mo�emy dzi�ki niemu postrzega� jako problem dotycz�cy *programowania* i pr�bowa� go
rozwi�za� jako taki, tak samo jak dzi�ki uk�adowi kartezja�skiemu ka�dy problem geometryczny mo�emy
pr�bowa� zamieni� na odpowiadaj�cy mu problem analityczny (liczbowy) i pr�bowa� go rozwi�za� albo
tylko inaczej zrozumie� pos�uguj�c si� na przyk�ad operacjami algebraicznymi, takimi jak dodawanie
czy mno�enie liczb. Jedyn� rzecz�, kt�rej b�dziemy potrzebowa�, poza cierpliwo�ci� w uczeniu si�
tego podej�cia, �eby uprawia� matematyk� - a p�niej r�wnie� og�lniej rozumiane badania o
meta-teoretycznym charakterze - jako programowanie, b�dzie zarazem sztywny i wystarczaj�co
ekspresyjny j�zyk. Ten, na kt�rym oparty jest Lean, jest w�a�nie jednym z takich j�zyk�w.
