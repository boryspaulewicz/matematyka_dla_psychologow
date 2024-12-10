# Prawdopodobieństwo

Żeby mówić o prawdopodobieństwie zdarzeń musimy najpierw *wybrać* jakiś sposób, w jaki zdarzenia
mogłyby się pojawiać. Cały rachunek prawdopodobieństwa opiera się na założeniu, że ten sposób jest
*ustalony*.

Formalny rachunek prawdopodobieństwa to jedno, a jego *interpretacja*, a raczej interpretacja samego
pojęcia prawdopodobieństwa, to co innego. W interpretacji częstościowej przyjmujemy, że jakiś
(hipotetyczny lub realny) ustalony eksperyment, który za każdym razem, gdy go powtórzymy, generuje
dokładnie jedno tak zwane *zdarzenie elementarne*. Na przykład, moglibyśmy założyć, że rzut monetą
daje zawsze dokładnie jeden wynik. To założenie wydaje się dość niekontrowersyjne, ale nie
powiedzieliśmy jeszcze, co znaczy *jakiś wynik*. Przyjęło się zakładać, że albo wypadnie orzełek,
albo reszka i nie ma innej możliwości.

To jest oczywiście uproszczenia, ale gdy stosujemy matematykę do opisu rzeczywistości uproszczenia
są nieuniknione. Tak jak wieloznaczność czy wielość interpretacji w matematyce, to jest coś, o czym
musimy pamiętać, ale co nie musi być znaczącą przeszkodą w ustalaniu prawdziwości zdań na temat
świata.

Mamy więc powtarzalne doświadczenie, rzut monetą, mamy też jego możliwe wyniki (jako zbiór). Co
dalej? Wyobraźmy sobie, że rzucamy monetą bardzo wiele razy. Wydaje się intuicyjnie oczywiste, że w
przypadku normalnej monety, im więcej razy to zrobimy, tym bliższa proporcja orzełków powinna być
przeciętnie (patrząc na wyniki wielu serii takich wielokrotnych powtórzeń) do ułamka 1/2, czyli
0,5. No ale jednak każda konkretna seria może dać inną proporcję, niezależnie od tego, jak będzie
długa. Każda seria serii może dać też przeciętny wynik serii, czyli średnią z proporcji
obserwowanych w seriach "bazowych", różny od 1/2.

Dokonujemy teraz kluczowej *decyzji pojęciowej*. Postanawiamy rozważyć *nie dającą się nigdy
zrealizować w praktyce hipotetyczną sytuację* powtarzania rzutu monetą w
*nieskończoność*. *Wyobrażamy sobie*, tylko tyle, *wyobrażamy sobie*, bo tego nie da się w żaden
sposób sprawdzić, że orzełków w takiej nieskończonej serii byłoby może dokładnie połowa. Jeżeli
oznaczymy orzełka jako 1 i reszkę jako zero, będziemy mogli mówić o średnim wyniki, zamiast o
proporcjach. Ta konwencja jest wygodna i nic w ten sposób nie tracimy.

Wypada uściślić, co mamy na myśli mówiąc tu o średniej. Jak wiemy, średnia to suma wartości
liczbowych podzielona przez liczbę tych wartości. Na przykład, *(1 + 2 + 2 + 3) / 4* oznacza średnią
z *4* wartości liczbowych *1*, *2*, *2* (*2* pojawia się dwa razy) i *3*. Powiedziałem *wartości
liczbowych* a nie *liczb*, żeby podkreślić, że nie chodzi tu o liczby jako takie, tylko o ich
wystąpienia. Dana liczba jako taka albo pojawia się w ciągu, albo nie, za to jej wystąpienie może
być *wielokrotne*. W tym skończonym ciągu są więc *trzy* liczby, ale *cztery* wystąpienia wartości
liczbowych (w przyjętej przeze mnie dla wygody terminologii). Skoro już to wyjaśniłem, to nie będę
się tym przejmował i zacznę mówić raczej o liczbach, zakładając, że domyślisz się z kontekstu o co
mi dokładnie chodzi.

Gdy spróbujemy zakodować w Lean pojęcie średniej z nieskończonego ciągu, pojawi się od razu pewien
problem. Nie dlatego, że ciąg jest nieskończony - to pojęcie możemy sformalizować bez większego
trudu, jako funkcję typu `Nat -> R`. Taka funkcja ma nieskończenie wiele wartości, bo liczb
naturalnych jest nieskończenie wiele. Odpowiada też temu, że ciąg wyników nieskończenie wielu
powtórek eksperymentu "prawie" możemy zapisać w jednym (nieskończonym, dlatego prawie) szeregu,
który ma początek, ale nie ma końca. Liczby naturalne też mają początek, ale nie mają końca. A co
najważniejsze, liczby naturalne można konsekwentnie interpretować jako oznaczenia dla pozycji w
nieskończonym ciągu, który ma początek, ale nie ma końca. Sama ta funkcja *jest* w tym sensie
nieskończonym ciągiem (którego nie da się zapisać, więc całe szczęście, że ta funkcja... jest).

Nie możemy interesującego nas pojęcia średniej z nieskończonego ciągu łatwo sformalizować, ponieważ
nie ma czegoś takiego jak liczba nieskończona, w każdym razie nie ma takiej liczby wśród liczb
rzeczywistych. Nie mamy więc przez co podzielić sumy elementów ciągu! I tu pojawia się rozwiązanie,
które narzuca się, gdy *popatrzymy na ciąg wartości liczbowych w inny sposób*. Bywa, że taka zmiana
punktu widzenia zmieia tak dużo, że rozwiązanie samo się nasuwa.

Jeżeli zamiast zapisywać ciąg *skończony* w postaci kolejnych wystąpień *wartości liczbowych*
zapiszemy go w postaci wystąpień *liczb* i *częstości ich wystąpień*, to dla naszego ciągu
czteroelementowego uzyskamy to: 

*1 x 1, 2 x 2, 1 x 3* 

Użyłem tu symbolu *x* zamiast symbolu mnożenia, żeby zaznaczyć, że to nie jest mnożenie, tylko
oznaczenie dla liczby wystąpień. W tym kontekście to oznaczenie ma tak oczywisty sens, że nie
musiałem go nawet tłumaczyć ani tym bardziej formalnie definiować.

Wielką zaletą tego oznaczenia jest to, że jeśli wartości liczbowych występujących w ciągu jest
skończenie wiele, to możemy zapisać zarówno ciąg skończony jak i nieskończony posługując się
*relatywną częstością* wystąpień. Nasz ciąg wyglądałby wtedy tak:

*1/5 * 1, 2/5 * 2, 1/5 * 3*

Tracimy przy tym do pewnego stopnia informację o kolejności wystąpień. Na przykład, ciągu:

*1, 2, 3, 2*

nie możemy zapisać zachowując wiernie informację o kolejności, bo ta jest nieustalona dla liczb *2*
i *3*. Albo więc zapiszemy go tak:

*1/4 x 1, 1/4 x 2, 1/4 x 3*

tracąc część informacji o kolejności, albo tak:

*1/4 x 1, 1/4 x 3, 1/4 x 2*

również tracąc część tej informacji.
