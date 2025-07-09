# Polimorfizm, czyli kontrolowana wieloznaczno��

Gdy na codzie� m�wimy o "zrobieniu obiadu", mo�e nam chodzi� o przer�ne *procesy fizyczne*. Mimo
r�nic, te procesy b�d� jednak *rozwi�zywa�y podobne problemy w podobny spos�b*, czyli b�d� podobne
*funkcjonalnie*, to jest pod wzgl�dem *sposobu dzia�ania*, a wi�c w innym znaczeniu s�owa "funkcja"
ni� przyporz�dkowanie unikalnych warto�ci czy obiekt�w. Czasami interesuje nas, o jaki konkretnie
obiad chodzi, albo w jaki konkretnie spos�b obiad ma by� lub zosta� zrobiony, ale czasami nas to nie
interesuje i wtedy trudno si� obej�� bez m�wienia w skr�towy, celowo wieloznaczny spos�b o zrobieniu
(*jakiego�*) obiadu (*w jaki� spos�b*).

Gdy w matematyce m�wimy o "dodawaniu", mo�e nam chodzi� o dodawanie liczb naturalnych, wymiernych,
rzeczywistych, zespolonych, wektor�w, macierzy, ci�g�w, funkcji, albo innych obiekt�w. Szczeg�y
dzia�ania operacji s� wtedy za ka�dym razem inne, jednak podobie�stwo funkcjonalne jest na tyle
wyra�ne albo - przynajmniej w danym kontek�cie - wa�ne, �e u�ywanie do tego celu tej samej nazwy,
atego samego symbolu, i tego samego lub bardzo podobnego sposobu zapisywania dzia�a� sprawdza si�
znacznie lepiej, ni� komplikowanie notacji w celu unikni�cia wieloznaczno�ci.

To tylko dwa przyk�ady celowej i bardzo przydatnej, a w�a�ciwie nieodzownej wieloznaczno�ci. To
jednocze�nie dwa przyk�ady czego�, co mo�na by nazwa� *abstrakcj� funkcjonaln�*, a co odgrywa
fundamentaln� rol� w psychologii, poniewa� centralnym przedmiotem bada� w psychologii s�
*abstrakcyjnie* rozumiane *zachowania*, a zachowania s� tym, czym s�, to jest zachowaniami,
dok�adnie dlatego, �e *czemu� s�u��*, to jest (w przybli�eniu) *rozwi�zuj� jaki� problem*. A tak
naprawd� wypada�oby tego rodzaju wieloznaczno�ci nazwa� po prostu *abstrakcj�*, poniewa� *nie ma
innej abstrakcji ni� funkcjonalna*. Abstrakcyjno�� jest przecie� w�asno�ci� *poj��* (og�lno�� i
wieloznaczno��) i *reprezentacji* (te� og�lno�� i wieloznaczno��), a *poj�cie poj�cia jest poj�ciem
funkcjonalnym* (poniewa� poj�cia s� tym, czym s�, poniewa� (w pewien spos�b) *u�ywaj�* ich pewne
gatunki zwierz�t).

Ok, spr�buj� si� ogarn��. 

Na przyk�ad, *macierz* to tablica liczb. Jak to tablica, ka�da macierz ma okre�lon� liczb� rz�d�w i
liczb� kolumn, przy czym liczb� rz�d�w przyj�o si� podawa� najpierw. I tak, ...

```math
\begin{bmatrix}
    1 &   2 &   3 \\
  -20 & -30 & -40 
\end{bmatrix} +
\begin{bmatrix}
    0 &  1 &  0 \\
   10 & 10 & 10
\end{bmatrix} =
\begin{bmatrix}
    1 &   3 &   3 \\
  -10 & -20 & -30
\end{bmatrix}
```

... to przyk�ad dodawania dw�ch macierzy o wymiarach $2 \times 3$. Zale�nie od kontekstu, (og�lne,
parametryczne) r�wnanie ...

```math
0 + m = m
```

... mo�e oznacza� ...

Dodanie liczby naturalnej $0$ do dowolnej liczby naturalnej $m$ daje liczb� naturaln� $m$.

Dodanie liczby rzeczywistej $0$ do dowolnej liczby rzeczywistej $m$ daje liczb� rzeczywist� $m$.

Dodanie liczby zespolonej $0$ do dowolnej liczby zespolonej $m$ daje liczb� zespolon� $m$.

Dodanie macierzy zerowej do dowolnej macierzy $m$ o tych samych wymiarach daje macierz $m$.

... a nawet ...

Dodanie liczby $0$ do dowolnej macierzy $m$ daje macierz $m$.

Dodanie liczby zespolonej $0$ do dowolnej liczby rzeczywistej $m$ daje liczb� zespolon� $m$.

Dodanie liczby zespolonej $0$ do dowolnej liczby rzeczywistej $m$ daje liczb� rzeczywist� $m$.

... albo co� jeszcze innego. Ostatnie trzy przyk�ady dotycz� "dodawania heterogenicznego", to jest
dodawania obiekt�w *r�nych* typ�w. W ka�dym z tych przypadk�w zastosowanie tego samego zapisu jest
*uzasadnione*, poniewa� za ka�dym razem:

To, co oznacza symbol $0$ jest elementem neutralnym ze wzgl�du na dzia�anie, kt�re oznacza symbol
$+$, i to dzia�anie jest ��czne, przemienne, a ka�dy obiekt rozwa�anego typu ma odwrotno�� ze
wzgl�du na to dzia�anie.

Czy widzisz, �e to jest *czysto funkcjonalny* opis obiektu "zas�uguj�cego" na symbol $0$ i dzia�ania
"zas�uguj�cego" na symbol $+$? W tym opisie nie ma *ani s�owa* na temat szczeg��w implementacji
tego dzia�ania, czyli na temat tego, jak "konkretnie" to dzia�anie dzia�a.

Pos�uguj�c si� takim czysto funkcjonalnym sposobem m�wienia mo�emy powiedzie�, �e:

A1. Istnieje dzia�anie (binarne) na liczbach naturalnych, kt�re oznaczamy zwykle za pomoc� symbolu
$+$ i nazywamy *dodawaniem*, takie, �e:

A2. Istnieje liczba naturalna, kt�r� oznaczamy zwykle za pomoc� symbolu $0$ taka, �e:

A3. Je�eli $m$ jest dowoln� liczb� naturaln�, to $0 + m = m$,

A4. a ponadto, je�eli $n$ i $k$ s� r�wnie� (niekoniecznie r�nymi) liczbami naturalnymi, to $n + m =
m + n$ (przemienno�� dodawania),

A5. $(m + n) + k = m + (n + k)$ (��czno�� dodawania),

A6. i istnieje liczba naturalna $l$ taka, �e $m + l = 0$ (odwracalno�� dodawania).

Tak� liczb� $l$ nazywamy liczb� *przeciwn�* wzgl�dem $n$ i oznaczamy jako $-n$. Gdyby chodzi�o o
co�, co *nazywamy mno�eniem*, nazwaliby�my tak� liczb� liczb� *odwrotn�*, ale to jest w istocie to
samo poj�cie, i te dwa r�ne okre�lenia s� potrzebne tylko wtedy, gdy mamy jednocze�nie do czynienia
z *dwoma* dzia�aniami, kt�re maj� si� do siebie jak dodawanie i mno�enie liczb.

U�ywanie s�owa *dodawanie* i symboli $+$ i $0$ w taki wieloznaczny spos�b jest nie tylko
*uzasadnione*, jest r�wnie� *bardzo przydatne*, poniewa� umo�liwia daleko id�c� *ekonomi� �rodk�w* -
my�lenia, programowania, a najog�lniej m�wi�c ... dzia�ania.

## Algebra abstrakcyjna, rekordy, klasy typ�w i polimorfizm ad-hoc

Wszystkie rozwa�ane przyk�ady s� przypadkami szczeg�lnymi, albo (w terminologii informatycznej)
*instancjami*, og�lnej (abstrakcyjnej) [*struktury
algebraicznej*](https://pl.wikipedia.org/wiki/Algebra_abstrakcyjna) nazywanej [*grup�
przemienn�*](https://pl.wikipedia.org/wiki/Grupa_przemienna) inaczej *abelow�*.



BEZ POLIMORFIZMU AD-HOC MO�NA SI� OBEJ��, ALE NIE WARTO
