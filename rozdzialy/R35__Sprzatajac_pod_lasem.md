<!-- -*- coding: utf-8 -*- -->
## Porządki to przede wszystkim *hierarchie*

Gdy prosimy osobę partnerską, żeby zrobiła nam herbatę, rozpoczynamy proces, który zakończy się albo
sukcesem, albo porażką. No ale to oczywiście nie jest takie proste, bo osoba partnerska może nas nie
usłyszeć, albo usłyszeć błędnie i zamiast herbaty przynieść nam (jakieś czyjeś) papiery
rozwodowe. Albo możemy dostać herbatę, ale nie taką, jaką chcieliśmy. Albo w "złym kubku". Albo może
być tak, że pod względem herbaty i jej otrzymania można powiedzieć, że pełen sukces, ale zaraz po
otrzymaniu osoba partnerska mówi nam, że musimy poważnie porozmawiać, a potem, że to nie jesteśmy
my, to jest ona. Wtedy dostajemy niby taką herbatę, jaką chcieliśmy, ale jednocześnie jednak -
uświadamiamy sobie dopiero po fakcie - funkcjonalnie nie taką, jaką "naprawdę" chcieliśmy, to jest
czarną popołudniową herbatę pocieszającą.

Tego rodzaju wieloaspektowa ocenialność skutków różnych działań (a dokładniej prób) to moim zdaniem
samo serce psychologii. Współczesny psycholog mógłby powiedzieć, że to nie jest naukowe, bo to
jakieś podejrzane rezultaty *introspekcji*, której współczesna "naukowa" psychologia od dawna już
nie akceptuje jako metody naukowej. No tak, ale to przecież w oczywisty sposób *nie* są
rezultaty introspekcji, tylko *zmyślenia*. Ze względu na ich szczególną rolę nie ma znaczenia, skąd
się te zmyślenia wzięły. W *żadnym* miejscu nie korzystam z założenia, że któreś z tego rodzaju
zmyśleń, a dokładniej *ocennych perspektyw*, jest *prawdą*.

*"Ja" jest punktem widzenia.*

Za wcześnie za daleko? Po tym, przez co od początku tego rozdziału przeszliśmy, już chyba nie.

Albo weźmy skądś jakieś [jabłka i pomarańcze](https://en.wikipedia.org/wiki/Apples_and_oranges), ale
nie jedzmy ich od razu, tylko najpierw się im poprzyglądajmy. Co to za bzdury z tym "nie da się
porównać"? Jeden z tych owoców jest przecież w oczywisty sposób obiektywnie lepszy od drugiego,
szczególnie, gdy mamy na niego ochotę. Średni okres wegetacji drzew jabłoni i drzew pomarańczy jest
porównywalny, a to też są własności jabłek i pomarańczy odpowiednio. Gdyby jabłko jako takie i
pomarańcza jako taka były kategoriami, to jedna z nich miałaby ... Ale chyba już wiesz, o co mi
chodzi.

Wróćmy do - pozornie luźno związanej z tematem - filii w Radomiu, o której mówiliśmy w poprzednim
rozdziale. Załóżmy, że nowe budynki są `2`, a wydziały są `3`, za to liczba pięter (też `3`) zgadza
się z liczbą poziomów hierarchii władzy. Naturalnie byłoby wtedy mapować injektywnie liniowy
porządek szczebli władzy na porządek pięter, ale pracownicy jakiś dwóch wydziałów musieliby pracować
w tym samym budynku, *to* mapowanie byłoby więc *nie*injektywne, za to byłoby (tak jak poprzednie)
surjektywne.

**Powtórka z pojęcia kategorii generowanej przez graf**: Przypominam, że same grafy to jeszcze nie
kategorie, bo graf jako taki to tylko pewnego rodzaju "statyczny rysunek", który *nie* jest
wyposażony w działanie składania strzałek. Dlatego, gdy odtąd o jakimś grafie będę mówił jako o
kategorii, będzie mi chodziło zawsze o (unikalną, dlatego ten sposób mówienia jest akceptowalny)
kategorię *generowaną* przez ten graf.

Na przykład, *graf* `A → B → C` generuje kategorię, której 1. obiektami są węzły grafu (tutaj `A`,
`B` i `C`), a 2. strzałkami są 2.1. identyczności odpowiadające dokładnie węzłom grafu,
2.2. strzałki grafu i 2.3. wszystkie złożenia, które trzeba 2.3.1. *dodać* tam, gdzie występują pary
składalnych strzałek grafu, 2.3.2. i tam, gdzie na skutek tego procesu pojawiły się *nowe* pary
składalnych strzałek. A więc na przykład graf `A → A` generuje kategorię z jednym obiektem i
*nieskończoną* liczbą strzałek. Ten przykład może być na tym etapie trudny, ale będzie ważny, niech
więc na razie tu zostanie i kusi. Podobnie, zgodnie z jednym z grafów omawianych dalej, istnieje
między innymi (kategoryjna) strzałka `Boss_wydzialowy → Nikt_wazny`, będąca złożeniem dwóch strzałek
widocznych na tym grafie, a poza tym każdy jest Panią samego siebie ("dosypane" identyczności
obiektów/węzłów, oznaczających stanowiska w firmie).

Przypominam, że można myśleć o tego rodzaju konstrukcjach na następujące dwa sposoby, z których
jeden może być mniej stresujący niż drugi: Możemy myśleć o takich konstrukcjach jako o *rezultatach
procesu* dokładania jakiś rzeczy (tutaj strzałek) spełniających jakieś warunki (tutaj składania
kategoryjnego). Z jednej strony ten sposób myślenia daje chyba wrażenie konkretności albo dynamiki,
czy nawet "ożywienia", ale z drugiej może wywołać poczucie, że to wszystko nie mieści nam się w
głowie, zwłaszcza, gdy te konstrukcje są "duże" lub nieskończone. Drugi sposób polega na myśleniu o
takich konstrukcjach jako o *listach kryteriów*, które spełnia każda konstrukcja danego rodzaju. Z
tej perspektywy operujemy *tylko* krótką listą kryteriów, które spełnia kategoria generowana przez
graf i których spełnienie gwarantuje unikalność takiej kategorii. Dopóki nie zajdzie taka potrzeba,
nie trzeba próbować wyobrażać sobie szczegółowo takiej kategorii; trzeba tylko albo pamiętać te
kryteria, albo umieć je znaleźć.

Poniżej mamy kategorię `Pracownicy`. Na tym diagramie, poprzedzonym czymś w rodzaju "preambuły"
definiującej typowanie - a więc i tu pomieszałem dwa różne języki, z których jeden (mikrojęzyk
dziedzinowy) właśnie wymyśliłem - strzałka oznacza bezpośrednie zwierzchnictwo. Żeby było ciekawiej,
ten diagram *nie* jest grafem generującym kategorię, o którą nam chodzi, tylko (przedstawioną w
zarysie) kolekcją strzałek, z których taki graf można w narzucający się sposób złożyć. Uzyskany w
ten sposób graf będzie miał między innymi *ścieżkę* `Dżessika → Monika → Stefan`. Czyli to akurat
jest *diagram generujący graf generujący kategorię*.

```
-- Preambuła

Pracownik, Wydzial : Type

A, B, C : Wydzial

Jest_w_wydziale : Pracownik → Wydzial → Prop

Robert, Danuta, Mieszko, Dżessika, Stefan, Monika, ... : Pracownik

∀ x ∈ {Robet, Danuta, Mieszko}, Jest_w_wydziale x A

...

--- Diagram

Dżessika → Danuta

Dżessika → Monika

Danuta   → Robert

Danuta   → Mieszko

Monika   → Stefan

...
```

Istnieje naturalne (ale nie w znaczeniu naturalnej transformacji, tylko w znaczeniu potocznym,
zbliżonym do intuicyjne) mapowanie pracowników *na tym ostatnim grafie* na kategorię hierarchii
władzy ...

```
Boss → Boss_wydzialowy → Ktos_kto_jest_mily_tylko_wobec_boss_wydzialowy → Nikt_wazny
```

... i istnieje też naturalne mapowanie hierarchii władzy na kategorię *ogólnych* pięter `3 → 2 →
1`. Byłbym zapomniał, że Osoba Szefowska pracuje z domu! Dlatego w tym kontekście interesuje nas
kategoria taka jak wyżej, ale bez obiektu początkowego (czyli takiego jakby najmniejszego albo,
przynajmniej potencjalnie, pustego w środku) `Boss`:

```
Boss_wydzialowy → Ktos_kto_jest_mily_tylko_wobec_boss_wydzialowy → Nikt_wazny
```

Mamy też *szczegółową* kategorię budynków, której obiektami są pokoje, a strzałki na *generującym ją
grafie* reprezentują fakty bycia pokojem bezpośrednio nad innym pokojem w tym samym budynku. Oboje
wiemy, że mogłabyś policzyć, ile jest tych strzałek, albo narysować tą kategorię w postaci
generującego ją grafu i oboje wiemy, że nikomu by się nie chciało, więc nie będę nic sugerował.

Istnieje naturalne mapowanie szczegółowej kategorii pokojów (pokoi? no nie, to chyba po rosyjsku) na
kategorię pięter budynków, w której obiektami są ... piętra konkretnych budynków. *Ta* kategoria
jest generowana przez graf:

```
Andromeda(3) → Andromeda(2) → Andromeda(1)

Oasis(3) → Oasis(2) → Oasis(1)
```

Budynek jest tutaj traktowany jako *funkcja* o nazwie takiej, jak nazwa budynku, która to funkcja
zwraca *piętra*. Bo czemu nie?

Wreszcie, istnieje naturalne mapowanie tej ostatniej kategorii na kategorię jeszcze ogólniejszą, w
której obiektami są numery pięter, a strzałki oznaczają fakty zachodzenia relacji `≥`, to jest
kategorię generowaną przez graf `3 → 2 → 1`. No i istnieje jedyne możliwe mapowanie tej ostatniej
kategorii, jak i wszystkich innych, na kategorię końcową, zawierającą jeden obiekt `Cos`, wyposażony
tylko w strzałkę identyczności, ale to mapowanie jest trywialne z definicji, bo jest mapowaniem do
obiektu końcowego (akurat tutaj w kategorii kategorii), a takie strzałki są tym samym, co obiekty
kategorii (pomyślałaś o tym wcześniej?), o ile oczywiście kategoria ma jakiś koniec (kategoria
kategorii ma).

Ważną cechą niektórych z tych porządków, ale nie wszystkich, jest to, że pewne elementy (nie wypada
mówić tak o ludziach, bo to obraźliwe określenie, ale moje ręce są związane terminologią techniczną)
są w tym samym porządku albo, równoważnie, w tej samej cienkiej kategorii *nieporównywalne*.

**Mały słownik sprzątacza**: Czuję, że teraz już muszę powiedzieć więcej o samej
terminologii. Relacje (`R ⊆ X × X`) zwrotne (`∀ x : X, x R x`) i przechodnie (`∀ x y z : X, x R y →
y R z → x R z`) nazywamy *praporządkami*, a po angielsku (spolszczając) *preorderami*. Praporządki
to dokładnie cienkie kategorie, w których mogą występować pary różnych obiektów izomorficznych albo,
mówiąc równoważnie, kategorie cienkie, w których mogą występować strzałki przeciwrównoległe nie
będące identycznościami. Nie mam pojęcia, który sposób myślenia jest dla Ciebie w tym momencie
wygodniejszy, ale możliwe, że *rysunkowy*, dlatego zachęcam do prób oswojenia się z tą terminologią
(bo to jest niemal w całości tylko gęsta \{i zarazem niezwykle użyteczna\} terminologia, dotycząca
bardzo prostych zjawisk, którą wystarczy w miarę dobrze zapamiętać) za pomocą rysunkowej notatki.

Relacje *częściowego* porządku to praporządki antysymetryczne (`∀ x y : X, x R y → y R x → x = y`),
czyli relacje takie jak relacja `≤`, określona na jakimś zbiorze liczb: Jeżeli `x ≤ y` i `y ≤ x`, to
`x = y`. Takie relacje są tak ważne, wygodne w użyciu i częste, że nazywamy je też po prostu
porządkami i odtąd ja również będę tak czasem mówił. Po angielsku (spolszczając) często nazywamy je
*posetami*.

Ani preorder, ani poset nie musi być porządkiem *liniowym*, takim jak naturalny porządek na zbiorze
liczb naturalnych, o których zresztą często myślimy, że układają się w linię, która ma początek, ale
nie ma końca. Porządek liniowy to taki poset, w którym *porównywalna* jest *każda* para elementów
(`∀ x y : X, x R y ∨ y R x`). W ogólnym przypadku zarówno preordery jak i posety mogą się składać z
*oddzielnych* [drzew](https://pl.wikipedia.org/wiki/Drzewo_(informatyka)) (rozumianych jako pewien
typ danych), reprezentujących te porządki w oczywisty sposób, przy czym preordery mogą mieć węzły
połączone dwukierunkowo w poziomie, a posety nie. Gdy tak jest, to znaczy, gdy porządek odpowiada
oddzielnym, nieporównywalnym drzewom, to nie może być liniowy.

### Porządki w garderobie

Może jeszcze jeden przykład przed *główną* sugestią. Opiszę go celowo w dużym skrócie, żebyś miała
okazję spróbować go rozpakować i samodzielnie rozwinąć. W kategorii *ubierania się* obiektami są
*ogólnie* scharakteryzowane zestawy nałożonych na własną osobę elementów ubioru, takie jak (jakaś)
bluzka + (jakieś) spodnie + (jakaś) czapka + jakieś (skarpetki). Ponieważ strzałkami są *konkretne
egzemplarze* lub *sekwencje* konkretnych ubrań, zarówno strzałki jak i złożenia strzałek odpowiadają
*ścieżkom ubierania się w konkrety*. Struktura tej kategorii odzwierciedla ograniczenia tego
procesu. Na przykład, (idealizując) nie da się ubrać [najpierw butów, a potem
skarpet](https://math.oxford.emory.edu/site/math108/socks_and_shoes/).

W przypadku większości ludzi mieszkających w Polsce, ta kategoria *nie* będzie cienka, bo będzie na
przykład (miejmy nadzieję) istniała więcej niż jedna strzałka zakładania pary skarpet. Można jednak,
całkiem sensownie, zignorować różnice między niektórymi równoległymi strzałkami, uzyskując w ten
sposób strzałki reprezentujące ogólne części ubioru (ale czy tylko? warto rozważyć *mały*
przykład). Takie przekształcenie jakiejś struktury (niekoniecznie kategorii), polegające na
*zrównaniu* albo "sklejeniu" pewnych jej części, ale *z zachowaniem struktury ogólnej*, Lawvere
lubił nazywać przekształceniem *osobliwym*[^1]. Moim zdaniem to jest piękne słowo, więc na cześć
Lawvere'a też tak będziemy mówić.

**Pomniejsza sugestia**: Czy ta ostatnia kategoria będzie cienka?

Moglibyśmy zrównać ze sobą wszystkie strzałki względem siebie równoległe i uzyskalibyśmy wtedy
(różną od poprzedniej?) cienką kategorię, która reprezentowałaby same "nagie fakty" istnienia
możliwości przejścia od jednego ogólnego stroju do drugiego. Przypominałaby więc kategorię ... zdań
i dowiedlności.

**Pomniejsza sugestia**: Czy ta kategoria ma obiekt końcowy? Uwaga dla rodziców - to pytanie jest
dozwolone od lat osiemnastu: Co jest w tej kategorii obiektem początkowym?

Jak widzisz, kategorie są dosłownie *wszędzie*. Moim zdaniem dlatego, że teoria kategorii wyraża
ukrytą, wspólną strukturę języków matematycznych, a języki matematyczne wyrażają nasze uniwersalne
sposoby myślenia.

<hr>

**Może i główna, ale wciąż tylko sugestia**: Zastanów się proszę, w jaki sposób mogłabyś *zacząć*
próbować konstruować dowód tego twierdzenia. Podkreślam, że nie sugeruję, żebyś je udowodniła,
chociaż jestem przekonany, że zrobiłabyś to bez większego trudu, zakładając, że udałoby Ci się
zachować odpowiednie *nastawienie*. Chodzi mi raczej o próbę *metarefleksji* na temat własnych
sposobów myślenia. Korzystam w tym kodzie z przytoczonych wcześniej definicji, więc może trzeba
będzie do nich wrócić.

Wprowadzam tu uproszczony sposób pisania, odpowiadający często stosowanemu, uproszczonemu sposobowi
mówienia, zgodnie z którym relacja to domyślnie relacja binarna określona na jednym
zbiorze. Zmieniłem też konwencję i zacząłem znowu pisać (prawie) wszystko z małych liter, bo taką
miałem ochotę i Ciebie też zachęcam do osobistego i swobodnego podejścia do notacji ("powinno się"
to tylko *czyiś nacisk*).

Zwracam też uwagę, że definicja elementu najmniejszego ze względu na jakąś relację (binarną na
jednym zbiorze) *nie* zakłada, że ta relacja jest w jakimkolwiek znaczeniu relacją porządku. Relacja
może być *dowolna*, o ile tylko jest binarna i określona na tym samym zbiorze. To moim zdaniem dobry
przykład wyabstrachowania własności, którą *warto* nazywać w taki może początkowo trudny do
zaakceptowania sposób, bo ten sposób nazywania ułatwia korzystanie z łatwych do przeoczenia
analogii.

```lean
def rel α := Binrel α α

-- To są wybrane, interesujące nas w tym momencie własności relacji. Postanowiłem nie wprowadzać
-- notacji wzrostkowej (`x R y`), żeby dobitniej podkreślić tym razem, że relacja binarna to tylko
-- szczególnego rodzaju funkcja dwuargumentowa.

-- A to bardzo ułatwia pisanie (i czytanie) poniższych definicji:
variable (R : rel α)

def refl      := ∀ x : α, R x x
def trans     := ∀ {x y z : α}, R x y → R y z → R x z
def antisymm  := ∀ {x y : α}, R x y → R y x → x = y
def preorder  := refl R ∧ trans R
def poset     := preorder R ∧ antisymm R

-- Jeżeli przyszło Ci do głowy, że warto byłoby tu zastosować klasy typów, to brawo. Faktycznie
-- byłoby warto; moglibyśmy wtedy na przykład pisać `x ≤ y` i struktura klas pięknie pasowałaby do
-- wyrażanej przez nią struktury pojęciowej, ale dla naszych skromnych celów ta wersja nam teraz
-- wystarczy.

-- Element najmniejszy *ze względu na relację `R`* to taki `x`, że dla każdego `y`, `x R y`, a w
-- notacji przedrostkowej:
def least x := ∀ v, R x v

-- Ostatnio lubię stosować literę "v" (jak w słowie "variable") na oznaczenie zmiennej, która się
-- "bardziej zmienia", a "x" na oznaczenie "relatywnie globalnego" parametru.

-- Uwaga, relację trzeba podać jako pierwszy jawny argument (Lean domyśli się typu `α`).
#check least -- least.{u_1} {α : Sort u_1} (R : rel α) (x : α) : Prop

-- Na dobry początek warto zauważyć, że to tylko jakaś implikacja ...
theorem least_is_unique (h : poset R) : least R x → least R y → x = y := by 
  -- Zobacz, co się stanie, kiedy napiszesz tu `simp [least]`, a potem `simp [poset] at h`. Możesz
  -- robić takie rzeczy z definicjami stałych, których nazwy pojawiają się w celu lub w kontekście.
  sorry
```

Czy dowód tego twierdzenia wymaga założenia, że `R` to poset, czy wystarczy jakieś *słabsze*
założenie? Jeżeli tak, to jakie? Inaczej mówiąc, z jakich własności relacji faktycznie skorzystałaś
konstruując dowód?

<hr>

<br>

<br>

<br>

<br>

(Zauważyłaś, że psychologia stała się właśnie nauką?  
A raczej objawiła się jako taka po bliższym zbadaniu z maksymalnego oddalenia.  
W dodatku okazała się być nauką nauk! Nieźle, co?

...

Dżessika, jesteś tam jeszcze?

\{Jestem.

A kto to?

Nikt.

Nikt?

No przecież w takich sytuacjach mówi *się*, że nikt. Kiedy nikt nie przychodzi, to właśnie
przychodzi Nikt.\})

<br>

### Przypisy

[^1]: Chodzi tu o angielskie słowo *singular*, bo Lawvere nie pisał po polsku. Zarówno to słowo jak
    i jego polski odpowiednik *osobliwe* oznaczają albo po prostu coś pojedynczego lub wyróżnionego,
    albo coś wyróżniającego się przez swoją wyjątkowość, szczególnie zaś przez swoją *dziwność*. Na
    przykład, ten rozdział jest bez wątpienia osobliwy, nawet jak na tą książkę.
