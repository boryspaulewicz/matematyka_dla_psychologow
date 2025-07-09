# Polimorfizm, czyli kontrolowana wieloznaczno¶æ

Gdy na codzieñ mówimy o "zrobieniu obiadu", mo¿e nam chodziæ o przeró¿ne *procesy fizyczne*. Mimo
ró¿nic, te procesy bêd± jednak *rozwi±zywa³y podobne problemy w podobny sposób*, czyli bêd± podobne
*funkcjonalnie*, to jest pod wzglêdem *sposobu dzia³ania*, a wiêc w innym znaczeniu s³owa "funkcja"
ni¿ przyporz±dkowanie unikalnych warto¶ci czy obiektów. Czasami interesuje nas, o jaki konkretnie
obiad chodzi, albo w jaki konkretnie sposób obiad ma byæ lub zosta³ zrobiony, ale czasami nas to nie
interesuje i wtedy trudno siê obej¶æ bez mówienia w skrótowy, celowo wieloznaczny sposób o zrobieniu
(*jakiego¶*) obiadu (*w jaki¶ sposób*).

Gdy w matematyce mówimy o "dodawaniu", mo¿e nam chodziæ o dodawanie liczb naturalnych, wymiernych,
rzeczywistych, zespolonych, wektorów, macierzy, ci±gów, funkcji, albo innych obiektów. Szczegó³y
dzia³ania operacji s± wtedy za ka¿dym razem inne, jednak podobieñstwo funkcjonalne jest na tyle
wyra¼ne albo - przynajmniej w danym kontek¶cie - wa¿ne, ¿e u¿ywanie do tego celu tej samej nazwy,
atego samego symbolu, i tego samego lub bardzo podobnego sposobu zapisywania dzia³añ sprawdza siê
znacznie lepiej, ni¿ komplikowanie notacji w celu unikniêcia wieloznaczno¶ci.

To tylko dwa przyk³ady celowej i bardzo przydatnej, a w³a¶ciwie nieodzownej wieloznaczno¶ci. To
jednocze¶nie dwa przyk³ady czego¶, co mo¿na by nazwaæ *abstrakcj± funkcjonaln±*, a co odgrywa
fundamentaln± rolê w psychologii, poniewa¿ centralnym przedmiotem badañ w psychologii s±
*abstrakcyjnie* rozumiane *zachowania*, a zachowania s± tym, czym s±, to jest zachowaniami,
dok³adnie dlatego, ¿e *czemu¶ s³u¿±*, to jest (w przybli¿eniu) *rozwi±zuj± jaki¶ problem*. A tak
naprawdê wypada³oby tego rodzaju wieloznaczno¶ci nazwaæ po prostu *abstrakcj±*, poniewa¿ *nie ma
innej abstrakcji ni¿ funkcjonalna*. Abstrakcyjno¶æ jest przecie¿ w³asno¶ci± *pojêæ* (ogólno¶æ i
wieloznaczno¶æ) i *reprezentacji* (te¿ ogólno¶æ i wieloznaczno¶æ), a *pojêcie pojêcia jest pojêciem
funkcjonalnym* (poniewa¿ pojêcia s± tym, czym s±, poniewa¿ (w pewien sposób) *u¿ywaj±* ich pewne
gatunki zwierz±t).

Ok, spróbujê siê ogarn±æ. 

Na przyk³ad, *macierz* to tablica liczb. Jak to tablica, ka¿da macierz ma okre¶lon± liczbê rzêdów i
liczbê kolumn, przy czym liczbê rzêdów przyjê³o siê podawaæ najpierw. I tak, ...

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

... to przyk³ad dodawania dwóch macierzy o wymiarach $2 \times 3$. Zale¿nie od kontekstu, (ogólne,
parametryczne) równanie ...

```math
0 + m = m
```

... mo¿e oznaczaæ ...

Dodanie liczby naturalnej $0$ do dowolnej liczby naturalnej $m$ daje liczbê naturaln± $m$.

Dodanie liczby rzeczywistej $0$ do dowolnej liczby rzeczywistej $m$ daje liczbê rzeczywist± $m$.

Dodanie liczby zespolonej $0$ do dowolnej liczby zespolonej $m$ daje liczbê zespolon± $m$.

Dodanie macierzy zerowej do dowolnej macierzy $m$ o tych samych wymiarach daje macierz $m$.

... a nawet ...

Dodanie liczby $0$ do dowolnej macierzy $m$ daje macierz $m$.

Dodanie liczby zespolonej $0$ do dowolnej liczby rzeczywistej $m$ daje liczbê zespolon± $m$.

Dodanie liczby zespolonej $0$ do dowolnej liczby rzeczywistej $m$ daje liczbê rzeczywist± $m$.

... albo co¶ jeszcze innego. Ostatnie trzy przyk³ady dotycz± "dodawania heterogenicznego", to jest
dodawania obiektów *ró¿nych* typów. W ka¿dym z tych przypadków zastosowanie tego samego zapisu jest
*uzasadnione*, poniewa¿ za ka¿dym razem:

To, co oznacza symbol $0$ jest elementem neutralnym ze wzglêdu na dzia³anie, które oznacza symbol
$+$, i to dzia³anie jest ³±czne, przemienne, a ka¿dy obiekt rozwa¿anego typu ma odwrotno¶æ ze
wzglêdu na to dzia³anie.

Czy widzisz, ¿e to jest *czysto funkcjonalny* opis obiektu "zas³uguj±cego" na symbol $0$ i dzia³ania
"zas³uguj±cego" na symbol $+$? W tym opisie nie ma *ani s³owa* na temat szczegó³ów implementacji
tego dzia³ania, czyli na temat tego, jak "konkretnie" to dzia³anie dzia³a.

Pos³uguj±c siê takim czysto funkcjonalnym sposobem mówienia mo¿emy powiedzieæ, ¿e:

A1. Istnieje dzia³anie (binarne) na liczbach naturalnych, które oznaczamy zwykle za pomoc± symbolu
$+$ i nazywamy *dodawaniem*, takie, ¿e:

A2. Istnieje liczba naturalna, któr± oznaczamy zwykle za pomoc± symbolu $0$ taka, ¿e:

A3. Je¿eli $m$ jest dowoln± liczb± naturaln±, to $0 + m = m$,

A4. a ponadto, je¿eli $n$ i $k$ s± równie¿ (niekoniecznie ró¿nymi) liczbami naturalnymi, to $n + m =
m + n$ (przemienno¶æ dodawania),

A5. $(m + n) + k = m + (n + k)$ (³±czno¶æ dodawania),

A6. i istnieje liczba naturalna $l$ taka, ¿e $m + l = 0$ (odwracalno¶æ dodawania).

Tak± liczbê $l$ nazywamy liczb± *przeciwn±* wzglêdem $n$ i oznaczamy jako $-n$. Gdyby chodzi³o o
co¶, co *nazywamy mno¿eniem*, nazwaliby¶my tak± liczbê liczb± *odwrotn±*, ale to jest w istocie to
samo pojêcie, i te dwa ró¿ne okre¶lenia s± potrzebne tylko wtedy, gdy mamy jednocze¶nie do czynienia
z *dwoma* dzia³aniami, które maj± siê do siebie jak dodawanie i mno¿enie liczb.

U¿ywanie s³owa *dodawanie* i symboli $+$ i $0$ w taki wieloznaczny sposób jest nie tylko
*uzasadnione*, jest równie¿ *bardzo przydatne*, poniewa¿ umo¿liwia daleko id±c± *ekonomiê ¶rodków* -
my¶lenia, programowania, a najogólniej mówi±c ... dzia³ania.

## Algebra abstrakcyjna, rekordy, klasy typów i polimorfizm ad-hoc

Wszystkie rozwa¿ane przyk³ady s± przypadkami szczególnymi, albo (w terminologii informatycznej)
*instancjami*, ogólnej (abstrakcyjnej) [*struktury
algebraicznej*](https://pl.wikipedia.org/wiki/Algebra_abstrakcyjna) nazywanej [*grup±
przemienn±*](https://pl.wikipedia.org/wiki/Grupa_przemienna) inaczej *abelow±*.



BEZ POLIMORFIZMU AD-HOC MO¯NA SIÊ OBEJ¦Æ, ALE NIE WARTO
