# Polimorfizm, czyli kontrolowana wieloznaczność

Gdy na codzień mówimy o "zrobieniu obiadu", może nam chodzić o przeróżne *procesy fizyczne*. Mimo
różnic, te procesy będą jednak *rozwiązywały podobne problemy w podobny sposób*, czyli będą podobne
*funkcjonalnie*, to jest pod względem *sposobu działania*, a więc w innym znaczeniu słowa "funkcja"
niż przyporządkowanie unikalnych wartości czy obiektów. Czasami interesuje nas, o jaki konkretnie
obiad chodzi, albo w jaki konkretnie sposób obiad ma być lub został zrobiony, ale czasami nas to nie
interesuje i wtedy trudno się obejść bez mówienia w skrótowy, celowo wieloznaczny sposób o zrobieniu
(*jakiegoś*) obiadu (*w jakiś sposób*).

Gdy w matematyce mówimy o "dodawaniu", może nam chodzić o dodawanie liczb naturalnych, wymiernych,
rzeczywistych, zespolonych, wektorów, macierzy, ciągów, funkcji, albo innych obiektów. Szczegóły
działania operacji są wtedy za każdym razem inne, jednak podobieństwo funkcjonalne jest na tyle
wyraźne albo - przynajmniej w danym kontekście - ważne, że używanie do tego celu tej samej nazwy,
atego samego symbolu, i tego samego lub bardzo podobnego sposobu zapisywania działań sprawdza się
znacznie lepiej, niż komplikowanie notacji w celu uniknięcia wieloznaczności.

To tylko dwa przykłady celowej i bardzo przydatnej, a właściwie nieodzownej wieloznaczności. To
jednocześnie dwa przykłady czegoś, co można by nazwać *abstrakcją funkcjonalną*, a co odgrywa
fundamentalną rolę w psychologii, ponieważ centralnym przedmiotem badań w psychologii są
*abstrakcyjnie* rozumiane *zachowania*, a zachowania są tym, czym są, to jest zachowaniami,
dokładnie dlatego, że *czemuś służą*, to jest (w przybliżeniu) *rozwiązują jakiś problem*. A tak
naprawdę wypadałoby tego rodzaju wieloznaczności nazwać po prostu *abstrakcją*, ponieważ *nie ma
innej abstrakcji niż funkcjonalna*. Abstrakcyjność jest przecież własnością *pojęć* (ogólność i
wieloznaczność) i *reprezentacji* (też ogólność i wieloznaczność), a *pojęcie pojęcia jest pojęciem
funkcjonalnym* (ponieważ pojęcia są tym, czym są, ponieważ (w pewien sposób) *używają* ich pewne
gatunki zwierząt).

Ok, spróbuję się ogarnąć. 

Na przykład, *macierz* to tablica liczb. Jak to tablica, każda macierz ma określoną liczbę rzędów i
liczbę kolumn, przy czym liczbę rzędów przyjęło się podawać najpierw. I tak, ...

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

... to przykład dodawania dwóch macierzy o wymiarach $2 \times 3$. Zależnie od kontekstu, (ogólne,
parametryczne) równanie ...

```math
0 + m = m
```

... może oznaczać ...

Dodanie liczby naturalnej $0$ do dowolnej liczby naturalnej $m$ daje liczbę naturalną $m$.

Dodanie liczby rzeczywistej $0$ do dowolnej liczby rzeczywistej $m$ daje liczbę rzeczywistą $m$.

Dodanie liczby zespolonej $0$ do dowolnej liczby zespolonej $m$ daje liczbę zespoloną $m$.

Dodanie macierzy zerowej do dowolnej macierzy $m$ o tych samych wymiarach daje macierz $m$.

... a nawet ...

Dodanie liczby $0$ do dowolnej macierzy $m$ daje macierz $m$.

Dodanie liczby zespolonej $0$ do dowolnej liczby rzeczywistej $m$ daje liczbę zespoloną $m$.

Dodanie liczby zespolonej $0$ do dowolnej liczby rzeczywistej $m$ daje liczbę rzeczywistą $m$.

... albo coś jeszcze innego. Ostatnie trzy przykłady dotyczą "dodawania heterogenicznego", to jest
dodawania obiektów *różnych* typów. W każdym z tych przypadków zastosowanie tego samego zapisu jest
*uzasadnione*, ponieważ za każdym razem:

To, co oznacza symbol $0$ jest elementem neutralnym ze względu na działanie, które oznacza symbol
$+$, i to działanie jest łączne, przemienne, a każdy obiekt rozważanego typu ma odwrotność ze
względu na to działanie.

Czy widzisz, że to jest *czysto funkcjonalny* opis obiektu "zasługującego" na symbol $0$ i działania
"zasługującego" na symbol $+$? W tym opisie nie ma *ani słowa* na temat szczegółów implementacji
tego działania, czyli na temat tego, jak "konkretnie" to działanie działa.

Posługując się takim czysto funkcjonalnym sposobem mówienia możemy powiedzieć, że:

A1. Istnieje działanie (binarne) na liczbach naturalnych, które oznaczamy zwykle za pomocą symbolu
$+$ i nazywamy *dodawaniem*, takie, że:

A2. Istnieje liczba naturalna, którą oznaczamy zwykle za pomocą symbolu $0$ taka, że:

A3. Jeżeli $m$ jest dowolną liczbą naturalną, to $0 + m = m$,

A4. a ponadto, jeżeli $n$ i $k$ są również (niekoniecznie różnymi) liczbami naturalnymi, to $n + m =
m + n$ (przemienność dodawania),

A5. $(m + n) + k = m + (n + k)$ (łączność dodawania),

A6. i istnieje liczba naturalna $l$ taka, że $m + l = 0$ (odwracalność dodawania).

Taką liczbę $l$ nazywamy liczbą *przeciwną* względem $n$ i oznaczamy jako $-n$. Gdyby chodziło o
coś, co *nazywamy mnożeniem*, nazwalibyśmy taką liczbę liczbą *odwrotną*, ale to jest w istocie to
samo pojęcie, i te dwa różne określenia są potrzebne tylko wtedy, gdy mamy jednocześnie do czynienia
z *dwoma* działaniami, które mają się do siebie jak dodawanie i mnożenie liczb.

Używanie słowa *dodawanie* i symboli $+$ i $0$ w taki wieloznaczny sposób jest nie tylko
*uzasadnione*, jest również *bardzo przydatne*, ponieważ umożliwia daleko idącą *ekonomię środków* -
myślenia, programowania, a najogólniej mówiąc ... działania.

## Algebra abstrakcyjna, rekordy, klasy typów i polimorfizm ad-hoc

Wszystkie rozważane przykłady są przypadkami szczególnymi, albo (w terminologii informatycznej)
*instancjami*, ogólnej (abstrakcyjnej) [*struktury
algebraicznej*](https://pl.wikipedia.org/wiki/Algebra_abstrakcyjna) nazywanej [*grupą
przemienną*](https://pl.wikipedia.org/wiki/Grupa_przemienna) inaczej *abelową*.



BEZ POLIMORFIZMU AD-HOC MOŻNA SIĘ OBEJŚĆ, ALE NIE WARTO
