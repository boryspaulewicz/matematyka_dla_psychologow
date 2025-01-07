## An arrow is an arrow is an arrow ...

Może zapnij pasy, a jak nie masz, to nie wiem, zrób cokolwiek, żebyś mogła czuć się w miarę
bezpiecznie. Będziemy teraz [mówić jednocześnie w kilku
językach](https://www.youtube.com/watch?v=33Raqx9sFbo), to jest w języku zbiorów skończonych, języku
teorii kategorii, (tak jakby) w języku teorii typów i w języku naturalnym.

`∀ X : Zbior`, istnieje funkcja identycznościowa `Id_x`, to jest taka, że `Id_x(x) = x`. Poniżej
najniższego rysunku `Narysuj Punkt X` i strzałkę o nazwie `Idₓ`, która zawija się w taki sposób, że
`Zrodlo Idₓ` i `Cel Idₓ` to `Punkt X`. Zwróć uwagę, że ten rysunek to *wyrażenie w języku teorii
kategorii*, a *nie* w języku teorii zbiorów. To znaczy, że właśnie *zmieniłaś język*, a więc również
*punkt widzenia*.

Na to, co wcześniej nazywałem punktami, zwykle używa się nazwy *obiekt* , jednak zależało mi, żebyś
pamiętała, że *w teorii kategorii* obiekty to *tylko punkty zaczepienia strzałek*. Strzałki w tej
teorii nazywamy często *morfizmami* albo *odwzorowaniami*, ale te nazwy, podobnie jak słowo
*obiekt*, oddają dobrze *genezę* teorii kategorii, za to *nie* oddają dobrze *uniwersalności jej
zastosowań* i sposobu, w jaki jej *używamy*. Wiedząc już o mylącym charakterze tych słów, pod
rysunkiem napisz *komentarz*: W teorii kategorii każdy obiekt jest wyposażony w morfizm
identycznościowy. Każdy taki morfizm jest endomorfizmem.

Skoro już to zapisałaś i już wiesz, że używam słowa *punkt* w sposób niestandardowy, będę tak nadal
mówił, bo mam wrażenie, że tak Ci będzie łatwiej o tym konsekwentnie *myśleć*; sam zresztą całkiem
niedawno odkryłem, że mi to pomaga.

Morfizmy w teorii kategorii (czyli strzałki w tej teorii) nazywamy *endomorfizmami* (od
starogreckiego [ἔνδον](https://en.wiktionary.org/wiki/%E1%BC%94%CE%BD%CE%B4%CE%BF%CE%BD)
oznaczającego *w* albo *wewnątrz* \{i wtedy raczej nie nazywamy ich "endostrzałkami", bo to nie
brzmi dobrze\}) *wtedy i tylko wtedy*, gdy są właśnie takimi "zawijasami" jak identyczności (ale
istnieją też inne endomorfizmy, które nie są identycznościami), to znaczy, gdy mają *to samo źródło
i cel*.

Żeby coś, co nie jest opisane czy scharakteryzowane jawnie jako kategoria zasługiwało (z pewnego
punktu widzenia!) na nazwę kategoria, musi istnieć sposób opisu części struktury tego czegoś w
języku punktów i strzałek, spełniający następujące wymagania (nie trzeba panikować, znowu będę się
powtarzał i omówię też dość szczegółowo kilka prostych przykładów):

1. Wszystkie części określonego rodzaju postrzegamy jako punkty.

2. Wszystkie części określonego rodzaju postrzegamy jako strzałki.

W ten sposób, że:

3. Każdy punkt `X` ma swoją (endo)strzałkę identycznościową `Idₓ`.

4. Istnieje operacja na obiektach źrodłowych (to jest będących częściami struktury tego czegoś, co
   opisujemy jako kategorię), która odpowiada *składaniu strzałek* i którą oznaczamy czasem *w
   języku kategorii* za pomocą symbolu `∘`, taka, że dla dowolnych (a więc też potencjalnie równych,
   to jest zastępowalnych parami) strzałek `f`, `g` i `h` (uwaga, będą "skróty myślowe"):

    4-1. `Id ∘ f = f = f ∘ Id`
    
    4-2. `h ∘ (g ∘ f) = (h ∘ g) ∘ f`

Zacząłem tutaj stosować "skróty myślowe" polegające na tym, że nie zaznaczyłem, że strzałki, o
złożeniach któryś coś mówimy, muszą być składalne. Dlatego pominąłem tutaj *konieczny* warunek
*Jeżeli `f`, `g` i `h` to takie strzałki, że* `Skladalne h g` *i* `Skladalne g f` *to ...*. Nie
oznaczyłem też nazw punktów, do których są "przymocowane" strzałki identycznościowe, a więc `Id`
oznacza tu dwa potencjalnie różne obiekty źródłowe. A zastosowałem te skróty myślowe, bo już wiesz,
że w teorii kategorii operacja składania jest wybredna i często będzie nam obojgu wygodniej tylko o
tym *pamiętać*.

Ponieważ składanie jest w teorii kategorii operacją podstawową, wygodnie jest jeszcze bardziej
skrócić zapis i zamiast na przykład `f ∘ g` pisać po prostu `f g` albo nawet `fg`.

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

