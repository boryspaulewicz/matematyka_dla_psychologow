# ?

Może zapnij pasy, a jak nie masz, to nie wiem, zrób cokolwiek, żebyś czytając ten rozdział czuła się
bezpiecznie. Będziemy niebawem [mówić niemal jednocześnie w kilku
językach](https://www.youtube.com/watch?v=33Raqx9sFbo), to jest w języku zbiorów skończonych,
częściowo rysunkowym języku teorii kategorii, w (pseudo-)języku teorii typów, języku logiki,
niekategoryjnym języku rysunkowym i w języku naturalnym.

**Rysunek 1**: 

`∀ X : Zbior`, istnieje endofunkcja identycznościowa `Id_X : X → X`, to jest taka, że `Id_X(x) =
x`. Poniżej najniższego rysunku `Narysuj Punkt X` i strzałkę o nazwie `Idₓ`, która zawija się w taki
sposób, że `Zrodlo Idₓ` i `Cel Idₓ` to `Punkt X`. Zwróć uwagę, że ten rysunek to *wyrażenie w języku
teorii kategorii*, a *nie* w języku teorii zbiorów. To znaczy, że właśnie *zmieniłaś język*, a więc
również *punkt widzenia*.

Na to, co wcześniej nazywałem kategoryjnymi punktami, zwykle używa się nazwy *obiekt* , jednak
zależało mi, żebyś pamiętała, że *w teorii kategorii* obiekty to *tylko punkty zaczepienia
strzałek*. Strzałki w tej teorii nazywamy często *morfizmami* albo *odwzorowaniami*, ale również i
te nazwy, podobnie jak słowo *obiekt*, oddają dobrze *genezę* teorii kategorii, za to *nie* oddają
moim zdaniem dobrze *uniwersalności jej zastosowań* i sposobu, w jaki jej zwykle *używamy*. Wiedząc
już o mylącym charakterze tych słów, pod rysunkiem napisz komentarz: *W teorii kategorii każdy
obiekt jest wyposażony w endomorfizm identycznościowy*. *Można też powiedzieć tak: Każdy punkt
kategoryjny ma identycznościową endostrzałkę, a właściwie każdy punkt można utożsamić z tego rodzaju
strzałką, bo każdemu punktowi odpowiada dokładnie jedna, "przyczepiona" do niego identycznościowa
endostrzałka, a każdej takiej strzałce odpowiada dokładnie jeden punkt, do którego ta strzałka jest
przyczepiona*.

Skoro już to zapisałaś (być może po swojemu, to była przecież tylko sugestia) i już wiesz, że
używamy słowa *punkt* w sposób *niestandardowy*, będę tak nadal mówił, bo mam wrażenie, że tak Ci
będzie łatwiej o tym konsekwentnie myśleć; sam zresztą odkryłem dopiero niedawno, że mi to pomaga.

Morfizmy w teorii kategorii (czyli kategoryjne strzałki) nazywamy *endomorfizmami* (od
starogreckiego [ἔνδον](https://en.wiktionary.org/wiki/%E1%BC%94%CE%BD%CE%B4%CE%BF%CE%BD)
oznaczającego *w* albo *wewnątrz* \{i wtedy raczej nie nazywamy ich "endostrzałkami", bo to nie
brzmi dobrze\}) *wtedy i tylko wtedy*, gdy są właśnie takimi "zawijasami" jak identyczności (ale
istnieją też inne endomorfizmy, które nie są identycznościami), to znaczy, gdy mają *to samo źródło
i cel*.

Żeby coś, co nie jest opisane czy scharakteryzowane jawnie jako kategoria zasługiwało (z pewnego
punktu widzenia!) na nazwę kategoria, musi istnieć *poprawny opis struktury tego czegoś w języku
punktów i strzałek*, gdzie poprawny oznacza spełniający następujące wymagania (nie trzeba panikować,
znowu będę się powtarzał i omówię szczegółowo kilka prostych przykładów):

1. Wszystkie części określonego rodzaju traktujemy jako punkty ...

2. i wszystkie części określonego rodzaju traktujemy jako strzałki ...

... w ten sposób, że ...

3. ... każdy punkt `X` ma swoją endostrzałkę identycznościową `Id_X` i ...

4. .. istnieje operacja na obiektach źrodłowych (to jest będących częściami struktury tego czegoś,
   co opisujemy jako kategorię), która odpowiada *składaniu strzałek* i którą oznaczamy czasem
   (również *w języku kategorii*) za pomocą symbolu `∘`, taka, że dla dowolnych (a więc też
   potencjalnie równych, to jest zastępowalnych parami) strzałek `f`, `g` i `h` (uwaga, będą "skróty
   myślowe"):

    4-1. `Id ∘ f = f = f ∘ Id`
    
    4-2. `h ∘ (g ∘ f) = (h ∘ g) ∘ f`

Zacząłem tutaj stosować "skróty myślowe" polegające na tym, że nie zaznaczyłem, że strzałki, o
złożeniach któryś coś mówimy, muszą być składalne. A mówiąc dokładaniej, (celowo) pominąłem
*konieczny* warunek *Jeżeli `f`, `g` i `h` to takie strzałki, że* `Skladalne f g` *i* `Skladalne g
h`, *to ...*. Nie oznaczyłem też nazw punktów, do których są "przymocowane" strzałki
identycznościowe, a więc symbol `Id` oznacza tutaj strzałkę "zaczepioną" o *dwa, potencjalnie różne
obiekty źródłowe* i jednocześnie *dwa, potencjalnie różne punkty*. Dlaczego potencjalnie różne
punkty? Jeżeli źródło strzałki `f` wymienionej w punkcie 4-1 jest różne od jej celu, to pierwsza z
lewej identyczność musi być "zaczepiona" o inny punkt niż pierwsza z prawej. A zastosowałem te
skróty myślowe, bo już wiesz, że w teorii kategorii operacja składania jest wybredna i często będzie
nam obojgu wygodniej o tylko tym *pamiętać* zamiast uwzględniać to jawnie w zapisie. Tak jak Lean,
tego rodzaju informacje możesz przecież zawsze wywnioskować z kontekstu.

Ponieważ składanie jest w teorii kategorii operacją podstawową, wygodnie jest jeszcze bardziej
skrócić zapis i zamiast `f ∘ g` pisać `f g` albo nawet - gdy nie powinno być wątpliwości, o co
chodzi - `fg`.

TODO Objaśnić powoli i po kolei jak "działa" każda kategoria.

Jeżeli teraz ...

1. Każdy zbiór oznaczymy jako kategoryjny punkt.

2. Każdą funkcję oznaczymy jako kategoryjną strzałkę, w taki sposób, że źródło tej strzałki to
dziedzina tej funkcji, a cel tej strzałki to przeciwdzidzina tej funkcji.

3. Różne zbiory odpowiadają różnym punktom.

4. Różne funkcje odpowiadają różnym strzałkom.

5. *Funkcje* identycznościowe, czyli funkcje $i$ takie, że $i$ jest funkcją z pewnego zbioru $X$ do
tego samego zbioru i $i(x) = x$, odpowiadają strzałkom identycznościowym.

6. Składanie *funkcji* odpowiada składaniu *strzałek*

... to uzyskamy w ten sposób kategorię, a dokładnie *kategorię zbiorów skończonych*.


Zwróć uwagę, że to jest *izomorfizm*, ponieważ każdemu zbiorowi odpowiada pewien punkt, różnym
zbiorom odpowiadają różne punkty, każdej funkcji odpowiada pewna strzałka, różnym funkcjom
odpowiadają różne strzałki, i te nasze punkty i strzałki to *tylko* takie punkty i strzałki, których
używamy do mówienia w pewien sposób o zbiorach i funkcjach. Ponieważ to jest (patrz punkt 6)
izomorfizm *respektujący strukturę*, a dokładniej respektujący własności operacji składania (zarówno
funkcji jak i strzałek, bo izomorfizm *działa w obie strony*, pamiętasz?), to *może się wydawać*, że
poza terminologią nic się nie zmieniło.

To jest, nawiasem mówiąc, cecha wszystkich izomorfizmów, tylko nie zawsze tak bardzo rzuca się w
oczy. Można powiedzieć, że zmieniając opis na opis izomorficzny (czyli "równokształtny", pamiętasz?)
mówimy ("strukturalnie") dokładnie to samo, tylko w inny sposób. Coś się jednak zmieniło, ale trochę
mi zajmie, zanim będę Ci mógł pokazać co.

Patrząc w ten sposób na przestrzeń zbiorów skończonych i funkcji jako na kategorię *ignorujemy
strukturę zbiorów i funkcji* i *skupiamy się* na samej *operacji składania*, a dzięki temu skupiamy
się na tym, jaką *rolę* odgrywają zbiory w przestrzeni zbiorów skończonych. Zgaduję, że nie możesz
się doczekać przykładów. Będę teraz pisał używając dwóch różnych czcionek. Gdy będę pisał w języku
teorii mnogości, będzie to wyglądało na przykład tak: $X, f(x)$. Gdy będę pisał w języku teorii
kategorii będzie to wyglądało na przykład tak: `X, f`.

Dla każdego zbioru jednoelementowego $T$ i każdego zbioru $S$ (łącznie z $T$!), istnieje dokładnie
jedna funkcja $f : S → T$, bo każda taka funkcja "*nie ma żadnego wyboru*", musi przecież gdzieś
posłać każdy element swojej dziedziny (bo jest funkcją), a przeciwdziedzina ma tylko jeden
element. I odwrotnie, jeżeli zbiór $T$ ma taką własność, że dla każdego zbioru $S$ istnieje
dokładnie jedna funkcja $f : S → T$, to zbiór $T$ musi być zbiorem jednoelementowym, bo gdyby $T$
był zbiorem pustym, to na przykład $f : \set{1, 2, 3} → T$ nie mogłoby istnieć, a gdyby $T$ miało
więcej niż jeden element, to dla każdego niepustego zbioru $S$ istniałyby różne funkcje posyłające
$S$ w $T$.

A to oznacza, że zbiory jednoelementowe to *dokładnie* takie *punkty*, do których wchodzi dokładnie
jedna strzałka od każdego punktu.

Teraz $f$ i $g$ oznaczają (niekoniecznie różne) *funkcje* (a więc posługujemy się językiem zbiorów i
funkcji, dlatego zmieniłem czcionkę): *Teoriomnogościowym* złożeniem $f$ i $g$ nazywamy funkcję,
którą oznaczamy jako $g ∘ f$ (a oznaczamy ją tak, bo jest *wynikiem teoriomnogościowego składania*
tych dwóch funkcji), taką, że że $(g ∘ f)(x) := g(f(x))$.  
(Zwracam uwagę, że znowu zastosowałem skrót myślowy, polegający na tym, że nie wspomniałem o
wymaganiu składalności, a to wymaganie obowiązuje również w teorii mnogości).

Teraz `f`, `g` i `h` oznaczają strzałki w *kategorii zbiorów skończonych* (czyli są kategoryjnymi
strzałkami, ale jednocześnie mają już dla nas objaśnioną wcześniej interpretację teoriomnogościową):

Kategoryjne złożenie `h (g f)` oznacza teraz teoriomnogościowe złożenie $h ∘ (g ∘ f)$, a to z
(teoriomnogościowej) definicji oznacza taką funkcję (powiedzmy) $i$, że (rozwijamy definicję
złożenia po raz pierwszy) $i(x) = h ∘ g(f(x)))$, a to oznacza (rozwijamy definicję złożenia po raz
drugi) $h(g(f(x))). 

Kategoryjne złożenie `(h g) f` oznacza teoriomnogościowe złożenie $(h ∘ g) ∘ f$, a to z kolei
oznacza funkcję (powiedzmy) $j$, taką, że (rozwijamy definicję złożenia po raz pierwszy) $j(x) = (h
∘ g)(f(x))$, a to oznacza (rozwijamy definicję złożenia po raz drugi) $h(g(f(x)))$.

Widzimy, że $i$ i $j$ są tą samą funkcją, bo każdemu elementowi swojej (w tym wypadku z konieczności
tej samej) dziedziny (którą możemy oznaczyć dla wygody jako $X$) przyporządkowują ten sam element
(również z konieczności tej samej) przeciwdziedziny, to jest $∀ x ∈ X, i(x) = h(g(f(x))) = j(x)$. A
więc dla wszystkich (składalnych w ten sposób) strzałek `f`, `g` i `h`, ponieważ nasz opis
przestrzeni zbiorów skończonych jest *izomorfizmem*, a więc nasze strzałki są tylko *innym sposobem
oznaczania* zbiorów skończonych, widzimy, że `h (g f) = (h g) f`.

