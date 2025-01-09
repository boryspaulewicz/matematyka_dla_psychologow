# ∘←×→∘ ~ ∘←∧→∘

Może zapnij pasy, a jak nie masz, to nie wiem, zrób cokolwiek, żebyś czytając ten rozdział czuła się
bezpiecznie. Będziemy niebawem [mówić niemal jednocześnie w kilku
językach](https://www.youtube.com/watch?v=33Raqx9sFbo), to jest w języku zbiorów, teorii typów,
logiki, częściowo rysunkowym języku teorii kategorii, niekategoryjnym języku rysunkowym i w języku
naturalnym. Ale zaczniemy od powtórki[^1].

Już wiesz, że z każdym (nie tylko skończonym) zbiorem jest związana funkcja identycznościowa na tym
zbiorze, bo dla każdego takiego zbioru potrafisz taką funkcję zdefiniować. W przypadku zbiorów
skończonych możesz to zrobić po prostu rysując ją, a w przypadku nieskończonych możesz podać
jednoznaczną regułę jej działania. 

Wiesz też, że istnieje dokładnie jedna taka funkcja dla każdego zbioru, bo gdy definiuje się funkcję
identycznościową nie ma swobody wyboru - każda identyczność musi dla każdego elementu zwrócić ten
element. 

I wiesz, że różne zbiory mają różne identyczności, bo tożsamość funkcji zależy od jej dziedziny i
przeciwdziedziny. Dlatego, dla każdego zbioru `X` możemy napisać `Id_X` i dlatego, gdy piszemy
skrótowo `Id`, wiemy, że istnieje dokładnie jeden zbiór, który jest zarówno dziedziną jak i
przeciwdziedziną tej zapisanej za pomocą skrótu myślowego funkcji.

Wiesz, kiedy dwie funkcje są składalne i wiesz, że dla każdej pary funkcji `f : X -> Y`, `g : Y ->
Z` istnieje dokładnie jedna funkcja `h : X -> Z`, która jest ich złożeniem, czyli jest funkcją `(g o
f)`, bo dla każdej konkretnej pary składalnych funkcji złożenie tych funkcji również "nie ma żadnego
wyboru".

Wiesz poza tym, że dla każdej funkcji `f`, `Id o f = f = f o Id` (stosując skróty myślowe), bo
identyczności to takie jakby "zera" albo "jedynki" (lepiej: *elementy neutralne*) - zależnie od
tego, czy skorzystamy z (luźnej) analogii do dodawania czy do mnożenia - ze względu na operację
składania.

Mogłabyś teraz sama łatwo udowodnić, rozwijając tylko definicję składania funkcji, że dla każdych
*trzech* funkcji `f : X -> Y`, `g : Y -> Z` i `h : Z -> V` spełniony jest warunek `h o (g o f) = (h
o g) o f`, który mówi, że tak jak dodawanie i mnożenie liczb, składanie funkcji jest operacją
*łączną*. Ale może na wszelki wypadek ja to tu za Ciebie (i *dla* Ciebie) zrobię:

Żeby udowodnić, że `h o (g o f) = (h o g) o f`, czyli, że lewa i prawa strona tej równości to ta
sama funkcja, musimy udowodnić, że `A x in X, (h o (g o f))(x) = ((h o g) o f)(x)`. Zakładamy więc,
że mamy jakiś `x in X` i tylko rozwijamy definicję składania tyle razy, ile będzie trzeba,
przekształcając lewą stronę równania do postaci ...

`(h o (g o f))(x) = h((g o f)(x)) = h(g(f(x))`

... i prawą stronę równania do postaci ...

`((h o g) o f)(x) = (h o g)(f(x)) = h(g(f(x)))`

... i widzimy, że obie funkcje dają ten sam wynik dla każdego `x in X`, a więc `h o (g o f) = (h o
g) o f`. Może spróbuj teraz to zrobić sama na kartce, jak najmniej tu zaglądając?

Zwróć też proszę uwagę, że poza tym, że wspomniałem o możliwości definiowania funkcji za pomocą
rysunku, nie korzystaliśmy w tym rozdziale z założenia, że zbiory są skończone; przecież, poza
wspomnianym kontekstem, ani raz nie napisałem niczego w rodzaju "Ponieważ zbiór `X` jest skończony,
to ...". A to znaczy, że wszystkie wymienione w tym rozdziale własności mają rownież funkcje między
dowolnymi zbiorami, a więc niekoniecznie skończonymi.

Czy widzisz na tym przykładzie, że warto czasem mieć *świadomość tego, z jakich założeń się
korzysta*?  Dzięki temu możemy poprawnie *ocenić, w jakich sytuacjach obowiązuje udowodnione
zdanie*, czyli *kiedy możemy używać tego zdania jako twierdzenia*. Gdy konstruowaliśmy dowody w
języku teorii typów, nie dało się nie mieć tej świadomości, ponieważ wtedy było widać jak na dłoni,
z których założeń korzystaliśmy, bo te występowały wszystkie jawnie w kodzie każdego dowodu, ale gdy
konstruujemy dowody w bardziej nieformalny sposób, tego tak dobrze nie widać, dlatego dobrze jest
wtedy zachować czujność.

Gdybyśmy się teraz skupili na samych funkcjach i na tym, o czym mówiliśmy dotąd w tym rozdziale, to
można by to wszystko podsumować - stosując mam nadzieję w tym momencie już dla Ciebie oczywist
skróty myślowe - jednym podwójnym równaniem i jednym pojedynczym:

`Id o f = f = f o Id`

`h o (g o f) = (h o g) o f`

A teraz proszę wyobraź sobie, że zbiory to okręgi, z przeróżnymi, rozrzuconymi przypadkowo w środku
tych okręgów elementami, podobne do tych, które rysowałaś czytając poprzedni rozdział, a każda
funkcja to taki strumień strzałek płynący z jednego zbioru do drugiego. I wyobraź sobie, że te
zbiory i funkcje są narysowane na nieskończenie dużej kartce papieru, a Ty oddalasz się coraz
szybciej w górę, aż docierasz tak wysoko, że nie jesteś w stanie rozróżnić nic poza *punktami
zbiorów* i *strzałkami strumieni*.

Z tej ekstremalnie abstrakcyjnej perspektywy mogłabyś zobaczyć wiele regularności, ale nie
wszystkie, ponieważ nie widziałabyś czegoś, czego nie da się w ten sposób dobrze narysować. Tym
czymś, czego nie mogłabyś wtedy wyraźnie zobaczyć, byłoby to, co sprawia, że przestrzeń zbiorów
*żyje*, to jest nie widziałabyś *jak działa działanie składania*. Żeby zobaczyć *to* trzeba mieć
oczy anioła. Ja akurat nie mam i zgaduję, że Ty również nie posiadasz (wybacz). Jeżeli nie jest się
chwilowo w posiadaniu oczu anioła, w ostateczności można nabyć ich protezę i próbować wypatrzyć, co
tylko się da, to znaczy próbować wyprowadzać dedukcyjnie rozmaite wnioski w języku teorii kategorii.

## Tak się składa

**Rysunek 1**: `Narysuj` proszę trzy, tworzące poziomy szereg punkty i oznacz je od dołu literami
`X`, `Y` i `Z`. Dodaj `Strzalka X Y` i oznacz ją literą `f` i `Strzalka Y Z` i oznacz ją literą
`g`. Ponieważ jesteś tak wysoko, nie jesteś w stanie zobaczyć strzałek wychodzących z poszczególnych
elementów, ale widzisz funkcje - jako *pojedyncze* strzałki między punktowymi zbiorami - a ponieważ
masz protezę genialności, widzisz też *czasami* (bo to tylko proteza), które strzałki składają się w
które i które strzałki można złożyć z których strzałek.

Strzałki `f` i `g` są `Skladalne`, a więc musi istnieć ich unikalne `Zlozenie`, to jest taka funkcja
`h`, która jest funkcją `(g ∘ f)`, czyli dla której spełniony jest warunek `∀ x ∈ X, h(x) = (g ∘
f)(x)`. Tego nie musisz próbować *zobaczyć*, bo to możesz *wywnioskować* z definicji
funkcji. Dorysuj więc od dołu `Strzalka X Z`, ale taką wygiętą w łuk, i oznacz ją literą `h`, a
potem umieść w środku uzyskanego w ten sposób diagramu ptaszka.

Jest tam teraz ptaszek, bo mocą naszej *decyzji* dotyczącej tego, co oznacza `h`, ten diagram jest
*przemienny*, co możemy zapisać algebraicznie również tak: `Zlozenie f g = h`. Ten ptaszek i
odpowiadające mu równania w dwóch różnych językach, to przykład czegoś, czego nie da się zobaczyć na
samym [*grafie*](https://pl.wikipedia.org/wiki/Graf_(matematyka)) reprezentującym zbiory i funkcje
między nimi, ponieważ grafy, choć czasem mogą się kojarzyć z rozmaitymi procesami, są jednak
strukturami *statycznymi*, a składanie strzałek jest (w pewien sposób) dynamicznym (wybrednym)
*działaniem*. Dlatego z wysokości na której się aktualnie znajdujesz nie zobaczysz tego nawet
patrząc przez magiczne okulary, a więc wszystkie informacje na temat (ro)\{z/s\}kładania funkcji,
poza uniwersalnymi włanościami tego działania, musisz albo *założyć* albo *wywnioskować*.

Tego, że każdy zbiór ma jedną identyczność, nie musisz próbować zobaczyć (ani nawet zakładać), bo
*wiesz* (to jest jedna z tych uniwersalnych własności), że dla każdego zbioru `X` można zdefiniować
taką funkcję `Id_X`, że `∀ x ∈ X, Id_X(x) = x` i wiesz, że dla każdego zbioru istnieje dokładnie
jedna taka funkcja. Nie musisz też nigdy próbować zobaczyć (ani zakładać), że różne zbiory mają
różne identyczności, bo *wiesz* (z definicji), że o tożsamości funkcji decyduje między innymi jej
dziedzina i przeciwdziedzina. 

Nie musisz więc wytężać wzroku (ani się dłużej zastanawiać), żeby się przekonać, że każdy punkt ma
swoją *unikalną* i *charakterystyczną* endostrzałkę identycznościową. A to znaczy, że istnieje
izomorfizm między zbiorami i identycznościami, a to z kolei znaczy, że zamiast mówić o zbiorach
możemy równie dobrze mówić o identycznościach.

Wiesz jeszcze dwie ważne rzeczy. Po pierwsze, dla każdej strzałki `f` jest zawsze prawdą, że `Id ∘ f
= f = f ∘ Id`. W przypadku zbiorów i funkcji ten warunek, odpowiadający zdaniom `Id ∘ f = f` i `f =
f ∘ Id`, gdzie pozwoliłem sobie na skrót myślowy i nie zaznaczyłem, że pierwsza i ostatnia
identyczność są przyczepione do *potencjalnie* różnych punktów, jest spełniony, ponieważ gdybyś
zmniejszyła swoją wysokość, (jak już wiesz z poprzedniego rozdziału) zobaczyłabyś, że:

`∀ x ∈ X, (Id ∘ f)(x) = Id(f(x)) = f(x) = f(Id(x)) = (f ∘ Id)(x)`

To jest (nawiasem mówiąc) dowód przedstawiony nieco nonszalancko w postaci jednego zdania, w ramach
którego rozwijamy, a następnie "zawijamy" (albo "owijamy"?) definicje identyczności i składania. A
po drugie, jeżeli `f : X → Y`, `g : Y → Z` i `h : Z → V`, to jeżeli `x ∈ X`, to ...

`(h ∘ (g ∘ f))(x) = h((g ∘ f)(x)) = h(g(f(x))) = (h ∘ (g(f(x)))) = ((h ∘ g) ∘ f)(x)`

A więc ...

1. `Id ∘ f = f = f ∘ Id`

2. `h ∘ (g ∘ f) = (h ∘ g) ∘ f`

Po pierwsze, nadal widzimy więc, że identyczności są *elementami neutralnymi ze względu na operację
składania funkcji*. Można powiedzieć, że ze względu na operację składania istnieje tutaj
(nieskończenie) wiele *zer* albo *jedynek*, zależnie od wyboru analogii między składaniem i
operacjami dodawania lub mnożenia.

Po drugie, podobnie jak dodawanie i mnożenie liczb, *składanie funkcji jest* nadal *łączne*, co
znaczy, że zapisując składanie więcej niż dwóch funkcji *można* w ogóle *nie stosować nawiasów* i
*nie ma znaczenia*, w jakiej *kolejności* będziemy *stosować operację składania* (nadal jednak w
ogólnym przypadku ma oczywiście znaczenie, w jakiej kolejności podamy argumenty tej operacji).

"Podsumowując dotychczasowe rozważania" (co?!), z wysokości, na której się teraz znajdujemy, widzimy
albo wiemy między innymi, że:

1. Istnieją *punkty* (zbiorów), ale widzimy je w zasadzie tylko jako *punkty zaczepienia strzałek*.

2. Istnieją *strzałki*, w których też nie jesteśmy w stanie z tej wysokości dostrzec żadnej
   *wewnętrznej* struktury.

3. Istnieje wybredna w znany Ci już sposób *operacja składania strzałek*.

4. Każdy punkt ma swoją *unikalną* i *charakterystyczną pętlę identycznościową*.

5. Identyczności są elementami neutralnymi ze względu na operację składania: `Id ∘ f = f = f ∘ Id`.

6. Składanie jest łączne: `h ∘ (g ∘ f) = (h ∘ g) ∘ f = h g f`.

W ostatnim punkcie pozwoliłem sobie skorzystać z możliwości pozbycia się nawiasów - bo składanie
jest łączne - i z uproszczenia polegającego na pozbyciu się również symbolu `∘`. W praktyce zwykle
używamy właśnie tej notacji, bo składanie jest w teorii kategorii operacją podstawową i nie lubimy
niepotrzebnie dużo pisać.

I w ten oto sposób, zmierzając razem ze mną okrężną drogą do pojęcia [*logicznej
alternatywy*](https://pl.wikipedia.org/wiki/Alternatywa),
[poznałaś](https://atkinsbookshelf.wordpress.com/tag/what-does-it-mean-to-miyagi-someone/) wszystkie
[*aksjomaty kategorii*](https://pl.wikipedia.org/wiki/Teoria_kategorii).

## Acha, fajnie, ale *po co*?



Do każdego punktu musi być również przyczepiona unikalna
[*pętla*](https://pl.wikipedia.org/wiki/P%C4%99tla_(teoria_graf%C3%B3w)) reprezentująca
*identyczność*. Ponieważ te funkcje odgrywają szczególną rolę, jeżeli możesz, oznacz je proszę przy
każdym punkcie albo liniami przerywanymi, albo innym kolorem.

Na to, co wcześniej nazywałem kategoryjnymi punktami, zwykle używa się nazwy *obiekt*, jednak
zależało mi, żebyś pamiętała, że *w teorii kategorii* obiekty to *tylko punkty zaczepienia
strzałek*. Strzałki w tej teorii nazywamy często *morfizmami* albo *odwzorowaniami*, ale również i
te nazwy, podobnie jak słowo *obiekt*, oddają dobrze *genezę* teorii kategorii, za to *nie* oddają
dobrze *uniwersalności jej zastosowań* i sposobu, w jaki jej zwykle *używamy*.

Wiedząc już o mylącym charakterze tych słów, pod rysunkiem napisz komentarz: *W teorii kategorii
każdy obiekt jest wyposażony w endomorfizm identycznościowy*. *Można też powiedzieć tak: Każdy punkt
kategoryjny ma identycznościową endostrzałkę, a właściwie każdy punkt można utożsamić z tego rodzaju
strzałką, bo każdemu punktowi odpowiada dokładnie jedna, "przyczepiona" do niego identycznościowa
endostrzałka, a każdej takiej strzałce odpowiada dokładnie jeden punkt, do którego ta strzałka jest
przyczepiona*.

Można więc powiedzieć, że kategorie to takie struktury, w których może występować *wiele różnych
zer* - jeżeli popatrzymy na składanie strzałek jako na operację podobną do dodawania - albo
*jedynek* - jeśli popatrzymy na składanie strzałek jako na operację podobną do mnożenia. Trzeba
jednak pamiętać, że dodawanie i mnożenie są operacjami niewybrednymi, a składanie może być wybredne
i zwykle zresztą jest. Skoro zapisałaś już komentarz (być może po swojemu, to była przecież tylko
sugestia) i już wiesz, że używamy słowa *punkt* w sposób *niestandardowy*, będę tak nadal mówił, bo
mam wrażenie, że tak Ci będzie łatwiej o tym konsekwentnie myśleć; sam zresztą odkryłem dopiero
niedawno, że mi to pomaga.

Morfizmy w teorii kategorii (czyli kategoryjne strzałki) nazywamy *endomorfizmami* (od
starogreckiego [ἔνδον](https://en.wiktionary.org/wiki/%E1%BC%94%CE%BD%CE%B4%CE%BF%CE%BD)
oznaczającego *w* albo *wewnątrz* \{i wtedy raczej nie nazywamy ich "endostrzałkami", bo to chyba
nie brzmi dobrze, ale ja to nawet lubię\}) *wtedy i tylko wtedy*, gdy są właśnie takimi "zawijasami"
jak identyczności (ale istnieją też inne endomorfizmy, które nie są identycznościami), to znaczy,
gdy mają *to samo źródło i cel*.

Żeby coś, co nie jest opisane czy scharakteryzowane jawnie jako kategoria zasługiwało (z pewnego
punktu widzenia!) na nazwę kategoria, musi istnieć *opis struktury tego czegoś w języku punktów i
składalnych w pewien określony sposób strzałek*. Podkreślam, że nie trzeba panikować, bo znowu będę
się powtarzał i omówię później szczegółowo kilka prostych przykładów. Żeby rozpoznać w jakiejś
strukturze pewną kategorię, czyli poprawnie opisać tą strukturę jako kategorię, ten opis musi
spełniać następujące wymagania:

1. Wszystkie części określonego rodzaju traktujemy jako punkty ...

2. ... i wszystkie części określonego rodzaju traktujemy jako strzałki, w ten sposób, że ...

3. ... każdy punkt ma swoją endostrzałkę identycznościową i ...

4. .. istnieje operacja na obiektach źrodłowych (to jest będących częściami struktury tego czegoś,
   co opisujemy jako kategorię), która odpowiada *składaniu strzałek* i którą oznaczamy czasem
   (podobnie jak w języku teorii mnogości) za pomocą symbolu `∘`, taka, że dla dowolnych (a więc też
   potencjalnie równych, to jest zastępowalnych parami) strzałek `f`, `g` i `h` (uwaga, będą skróty
   myślowe):

    4-1. `Id ∘ f = f = f ∘ Id`
    
    4-2. `h ∘ (g ∘ f) = (h ∘ g) ∘ f`

Zacząłem tutaj stosować skróty myślowe polegające na tym, że nie zaznaczyłem, że strzałki, o
złożeniach których coś mówimy, muszą być składalne. A mówiąc dokładaniej, (celowo) pominąłem
*konieczny* warunek *Jeżeli `f`, `g` i `h` to takie strzałki, że* `Skladalne f g` *i* `Skladalne g
h`, *to ...*. Nie oznaczyłem też nazw punktów, do których muszą być "przymocowane" wszystkie
strzałki identycznościowe, a więc symbol `Id` oznacza tutaj strzałkę przyczepioną do *dwóch,
potencjalnie różnych obiektów źródłowych* i jednocześnie *dwa, potencjalnie różne punkty* (bo każda
identyczność jest przyczepiona do dokładnie jednego punktu i każdy punkt ma dokładnie jedną
identyczność).

Dlaczego potencjalnie różne punkty? Jeżeli źródło strzałki `f` wymienionej w punkcie 4-1 jest różne
od jej celu (co nie znaczy, że obiekty, które te punkty w danej sytuacji oznaczają, są na pewno
różne), to pierwsza z lewej identyczność musi być "zaczepiona" o inny punkt niż pierwsza z prawej. A
zastosowałem te skróty myślowe, bo już wiesz, że w teorii kategorii, tak samo jak w teorii mnogości,
operacja składania jest wybredna i często będzie nam obojgu wygodniej tylko o tym *pamiętać*,
zamiast uwzględniać to jawnie w zapisie. Tak jak Lean, tego rodzaju informacje będziesz przecież
mogła wywnioskować z kontekstu.

Ponieważ składanie jest w teorii kategorii nie tylko operacją podstawową, ale również pojęciem
centralnym, wygodnie jest jeszcze bardziej skrócić zapis i zamiast `g ∘ f` pisać `g f`, albo nawet -
gdy nie ma wątpliwości, co oznacza taki zapis - `gf`.

Mamy teraz wszystkie narzędzia, żeby w dopiero co omawianej przestrzeni zbiorów skończonych i
funkcji między zbiorami skończonymi rozpoznać pewną kategorię.

Jeżeli:

1. Każdy zbiór oznaczymy jako kategoryjny punkt.

2. Każdą funkcję oznaczymy jako kategoryjną strzałkę, w taki sposób, że źródło tej strzałki to
   dziedzina tej funkcji, a cel tej strzałki to przeciwdzidzina tej funkcji.

3. Różne zbiory będą odpowiadały różnym punktom.

4. Różne funkcje będą odpowiadały różnym strzałkom.

5. *Funkcje* identycznościowe, czyli funkcje $i$ takie, że $i$ jest funkcją z pewnego zbioru $X$ do
tego samego zbioru i $i(x) = x$, będą odpowiadały strzałkom identycznościowym.

6. Składanie *funkcji* będzie odpowiadało składaniu *strzałek*

7. I nie będzie innych punktów ani strzałek.

... to uzyskamy w ten sposób kategorię, a dokładnie *kategorię zbiorów skończonych* o nazwie
[`FinSet`](https://en.wikipedia.org/wiki/FinSet). Wszystkie te przyporządkowania możemy traktować
jako *tymczasowe definicje kategoryjnych punktów i strzałek traktowanych jako stałe*.

Upewnimy się teraz, czy wszystkie wymagania kategorii są spełnione:

1. Każdy punkt ma swoją identyczność.

2. Dla każdej strzałki `f`, warunek `Id ∘ f = f = f ∘ Id` jest spełniony w oczywisty sposób, bo
   kategoryjne składanie odpowiada teraz składaniu funkcji teoriomnogościowych i kategoryjne
   identyczności odpowiadają identycznościom teoriomnogościowym, a więc rozpakowując definicje
   symboli `Id`, `f` i `∘` moglibyśmy się łatwo przekonać, że ze względu na te definicje zdanie `Id
   ∘ f = f = f ∘ Id` jest prawdziwe.

3. Z tego samego powodu dla każdej trójki niekoniecznie różnych i składalnych w ten sposób strzałek
   zachodzi `h ∘ (g ∘ f) = (h ∘ g) ∘ f`.

Uzyskaliśmy więc pewną *wierną* (w znaczeniu zachowującą różnice między symbolami) *implementacją
kategorii, zrealizowaną za pomocą zbiorów skończonych i funkcji między tymi zbiorami*.

TODO Że mogłem proces konstruowania tego opisu opisać w drugą stronę, to jest od kategorii, ale
wydaje mi się, że tak jest na początku lepiej o tym myśleć.

Być może przyszło Ci do głowy, że to wszystko było niepotrzebne, bo przecież to jest jakby *kopia*
przestrzeni zbiorów skończonych i funkcji między nimi, zmieniliśmy tylko język na taki jakby
bardziej graficzny (a mówiąc dokładniej na język [*grafów
skierowanych*](https://pl.wikipedia.org/wiki/Graf_skierowany) uzupełniony o operację składania
(zawsze skierowanych i tylko tych składalnych)
[*krawędzi*](https://pl.wikipedia.org/wiki/Kraw%C4%99d%C5%BA_grafu)). *I tak i nie*.

Otóż w ten sposób *całkowicie pomijamy* **wewnętrzną** *strukturę zbiorów i funkcji*, bo przecież
każdy zbiór zredukowaliśmy do jakiegoś punktu zaczepienia a każdą funkcję do jakiejś całkowicie
pozbawionej wewnętrznej struktury strzałki. A więc *odarliśmy przestrzeń zbiorów skończonych i
funkcji ze wszystkiego za wyjątkiem samej operacji składania funkcji*. 

TODO Fragment teorii typów jako kategoria.


I w tym momencie nieuchronnie pojawia się pytanie - *po co?*



GDZIE INDZIEJ Na przykład, Jeżeli zbiór jednoelementowy `{∅}` oznaczyliśmy jako `X`, a zbiór `{1, 2}` jako `Y`,
   
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

### Przypisy

[^1]: Repetitio est mater studiorum!
