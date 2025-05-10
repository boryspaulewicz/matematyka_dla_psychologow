# Polimorfizm, czyli wieloznaczno¶æ pod kontrol± programistki

Gdy na codzieñ mówimy o "zrobieniu obiadu", mo¿e nam chodziæ o przeró¿ne *procesy fizyczne*. Mimo
ró¿nic, te okre¶lane tak samo procesy *rozwi±zuj± podobne problemy w podobny sposób*, czyli s±
podobne *funkcjonalnie*, to jest pod wzglêdem *sposobu dzia³ania*, a wiêc w innym znaczeniu s³owa
"funkcja" ni¿ przyporz±dkowanie unikalnych warto¶ci czy obiektów. Czasami interesuje nas, o jaki
konkretnie obiad chodzi, albo w jaki konkretnie sposób obiad ma byæ lub zosta³ zrobiony, ale czasami
nas to nie interesuje i wtedy trudno siê obej¶æ bez mówienia w skrótowy, celowo wieloznaczny sposób
zrobieniu (*jakiego¶*) obiadu (*w jaki¶ sposób*).

Gdy w matematyce mówimy o "dodawaniu", mo¿e nam chodziæ o dodawanie liczb naturalnych, wymiernych,
rzeczywistych, zespolonych, macierzy, albo innych obiektów. Szczegó³y dzia³ania tak nazwanej
operacji s± wtedy za ka¿dym razem inne, jednak podobieñstwo funkcjonalne wydaje siê na tyle wyra¼ne
albo (przynajmniej w danym kontek¶cie) wa¿ne, ¿e u¿ywanie do tego celu tej samej nazwy i tego samego
symbolu czy sposobu zapisywania dzia³añ sprawdza siê znacznie lepiej, ni¿ komplikowanie notacji w
celu unikniêcia wieloznaczno¶ci. 

To tylko dwa przyk³ady celowej i bardzo przydatnej, a w³a¶ciwie nawet nieodzownej
wieloznaczno¶ci. To jednocze¶nie dwa przyk³ady czego¶, co mo¿na by nazwaæ *abstrakcj± funkcjonaln±*,
a co odgrywa fundamentaln± rolê równie¿ w psychologii, poniewa¿ centralnym przedmiotem badañ w
psychologii s± *abstrakcyjnie* rozumiane *zachowania*.

Na przyk³ad, *macierz* to tablica liczb. Jak ka¿da tablica, macierz ma okre¶lon± liczbê rzêdów i
kolumn, przy czym liczbê rzêdów przyjê³o siê podawaæ najpierw. I tak, ...

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

... to przyk³ad dodawania dwóch macierzy o wymiarach $2 \times 3$.
