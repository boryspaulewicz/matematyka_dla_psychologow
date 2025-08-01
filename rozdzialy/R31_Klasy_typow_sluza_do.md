<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie

Będzie o wieloznaczności, hierarchicznych relacjach między pojęciami i o związanym z tą
hierarchicznością dziedziczeniu własności, o "alogicznych" odpowiednikach typów `False` i `True`, i
trochę o psychologach i o psychologii. Poza tym, mam nadzieję, że niespodziewane, będą też dwie
niespodzianki.

<hr>

# Klasy typów służą do pisania i myślenia po ludzku

Pisząc o monoidach, matematycy pozwalają sobie często na coś takiego:

*Jeżeli `M` jest monoidem, to dla każdego `m ∈ M`, `u * m = m`*.

Jak myślisz, co dokładnie oznacza tutaj stała `M`? Monoid, czy pewien zbiór? Jeżeli `M` jest
monoidem, to zgodnie z definicją jest pewną *trójką uporządkowaną* (złożoną z pewnego zbioru, i tak
dalej). Ale przecież relacja należenia do zbioru, której zachodzenie dla pary `(m, M)` oznaczamy
pisząc `m ∈ M`, jest *niezdefiniowana*, gdy drugim członem zamiast *zbioru* jest *ciąg
skończony*. Na pierwszy rzut oka wygląda to więc na błąd, bo takie wyrażenie nie jest, przynajmniej
w przyjętym przez nas dotąd sensie, typowalne.

Niektórzy matematycy piszą ostrożniej, na przykład tak:

*Jeżeli `ℳ = (M, *, u)` jest monoidem, to dla każdego `m ∈ M`, `u * m = m`*.

Zmiana czcionki jest wtedy ważna, bo sygnalizuje, że stałe `ℳ` i `M` mają oznaczać blisko, a w tym
wypadku można nawet powiedzieć, że [intymnie](https://en.wikipedia.org/wiki/Love_and_Math) związane
obiekty różnego rodzaju. Zdarzają się i matematycy, którzy piszą tak ...

*Jeżeli `ℳ := (M, *, u)` jest monoidem, to dla każdego `m ∈ M`, `u * m = m`*.

... wyraźnie zaznaczając, że to (lokalna) definicja, ale mało komu się chce i można to zrozumieć.
Między innymi dlatego, że już ten pierwszy sposób pisania jest w zasadzie *nieproblematyczny*.

Podobne zwyczaje dotyczą symboli oznaczających działania. Nikomu się nie chce wymyślać i
konsekwentnie stosować kolejnych symboli na oznaczenie czegoś, co na przykład bardzo przypomina
zwykłe dodawanie, ale nim nie jest. Tym bardziej, że matematycy są nie tylko do tego rodzaju
wieloznaczności przyzwyczajeni, ale czasem wręcz jej *oczekują*. A oczekują jej między innymi
dlatego, że po pierwsze, wolą nie zapamiętywać więcej szczegółów notacji, niż to *potrzebne*, a po
drugie, skoro już mają głęboko wdrukowane, przyspieszające pisanie i myślenie *automatyzmy* związane
z symbolem dodawania, to czemu mieliby z nich nie korzystać, gdy coś zachowuje się, przynajmniej w
pewnych powtarzających się sytuacjach, jak zwykłe dodawanie?

Tego rodzaju zwyczaje komunikacyjne odpowiadają temu, jak posługujemy się na codzień językami
naturalnymi. Gdy na przykład mówimy albo myślimy o zrobieniu obiadu, może nam chodzić o *przeróżne*
procesy fizyczne. Mimo różnic, te procesy będą jednak lepiej lub gorzej *rozwiązywały podobne
problemy w podobny sposób*, czyli będą podobne funkcjonalnie, to jest pod względem sposobu
działania. A więc w innym znaczeniu słowa "funkcja", niż przyporządkowanie elementom jakiegoś zbioru
albo termom jakiegoś typu unikalnych wartości, obiektów, czy termów. Oczywiście interesuje nas
często, o jaki konkretnie obiad chodzi, albo w jaki konkretnie sposób ten obiad ma być lub został
zrobiony, ale czasami nas to *nie* interesuje. I wtedy trudno się obejść bez mówienia w taki
skrótowy, *celowo wieloznaczny* sposób o zrobieniu *jakiegoś* obiadu albo zrobieniu obiadu w *jakiś*
sposób.

Gdy w matematyce mówimy o "dodawaniu", może nam chodzić o dodawanie liczb naturalnych, wymiernych,
rzeczywistych, zespolonych, wektorów, macierzy, ciągów, funkcji, albo innego rodzaju
obiektów. *Szczegóły* działania operacji są wtedy za każdym razem *inne*, jednak *podobieństwo
funkcjonalne* jest na tyle wyraźne albo w danym kontekście ważne, że używanie do tego celu tej samej
nazwy albo tego samego symbolu i sposobu zapisywania działań sprawdza się lepiej, niż komplikowanie
notacji i unikanie wieloznaczności za wszelką cenę.

To tylko kilka przykładów celowej i bardzo przydatnej, a czasem wręcz nieodzownej wieloznaczności. I
nie chodzi w tym tylko o ekonomię środków i kontrolę liczby używanych słów. Chodzi również o
ułatwienie sobie lub innym *elastycznego przełączania się* między *różnymi*, ale *blisko związanymi
sposobami myślenia*. Inaczej mówiąc, na pewno nie zawsze, ale niezwykle często jest tak, że *warto*
mieszać ze sobą różne języki. Wydaje mi się nawet, że zdążyłaś się już o tym niejednokrotnie
przekonać między innymi czytając tą książkę.

To jednocześnie przykłady czegoś, co można by nazwać *abstrakcją funkcjonalną*, a co odgrywa
fundamentalną rolę w psychologii, ponieważ centralnym przedmiotem badań psychologicznych są
*abstrakcyjnie* rozumiane *zachowania*. Zachowania są tym, czym są, to jest zachowaniami, dokładnie
dlatego, że *czemuś służą*, to jest w przybliżeniu *rozwiązują* jakiś *problem* albo *realizują* czy
*wykonują* jakieś *zadanie*. A może nawet wypadałoby tego rodzaju wieloznaczności nazywać po prostu
*abstrakcją*, skoro, przynajmniej moim zdaniem, *abstrakcja jest zawsze funkcjonalna*?
Abstrakcyjność jest przecież własnością *pojęć* (ogólność połączona często z wieloznacznością
oznaczających pojęcia słów) i *reprezentacji* (też ogólność połączona z wieloznacznością, ale
sposobów reprezentowania), a pojęcia pojęcia i reprezentacji są pojęciami funkcjonalnymi: pojęcia i
reprezentacje są tym, czym są, dlatego, że *w pewien sposób używają ich* pewne gatunki zwierząt.

No dobrze, spróbuję się ogarnąć i może tym razem ograniczę próby przekazania intonacji za pomocą
pisma pochyłego.

# Najpierw tylko rekordowo, ...

Skoro każdy [rododendron](https://pl.wikipedia.org/wiki/R%C3%B3%C5%BCanecznik) jest rośliną, a
rośliny potrafią w normalnych warunkach pobierać energię ze światła, to rododendron potrafi jeść
światło. Taki oto zwyczajny, chciałoby się powiedzieć typowy ciąg myśli przyszedł mi do głowy, wobec
czego właśnie nad tym zdaniem będziemy się czasem pochylać.

Cokolwiek by to miało znaczyć, byłoby raczej niewygodnie *kodować wiedzę* na temat metabolizmu
roślin na poziomie poszczególnych gatunków roślin, a tym bardziej na poziomie pojedynczych
egzemplarzy. O wiele wygodniej i sensowniej jest traktować takie zjawiska jak fotosynteza jako
własności *wszystkich* roślin. Gdy trzeba się do tego rodzaju własności odnieść, wprowadzając je
jako założenie do konstruowanego rozumowania i biorąc pod uwagę na przykład rododendrony, wystarczy
wtedy skorzystać z faktu, że rododendron to roślina i na tej podstawie, albo *idąc* tym tropem,
*dotrzeć* do informacji na temat fotosyntezy i wyprowadzić stąd jakieś wnioski. Wydaje się wręcz, że
z tego rodzaju *hierarchicznej struktury pojęć* czy może nawet *wiedzy* korzystamy niemal
nieustannie.

Tak jak każdy rododendron jest rośliną, tak też każdy monoid jest
[*półgrupą*](https://pl.wikipedia.org/wiki/P%C3%B3%C5%82grupa). Półgrupa zaś to ... Może jednak tym
razem od razu skorzystam z rekordu, bo już wiesz, jak możesz to sobie przetłumaczyć na język
półformalny, gdy zajdzie taka (paląca) potrzeba, prawda? Przy okazji pozwolę sobie ukryć różnice
między zbiorami i typami za pomocą odrobiny lukru.

```lean
-- Tymczasem odrobina lukru:
def Set := Type

structure Semigroup (α : Set) where
  op    : α → α → α
  assoc : ∀ a b c : α, (op (op a b) c) = (op a (op b c))
```

Półgrupa to para złożona ze zbioru i określonego na nim działania łącznego. Bez szkody dla
rozumowania będę odtąd mówił czasami, że półgrupa to po prostu (dowolne) działanie łączne. Czy
porównując aksjomaty monoidu i półgrupy zakodowane za pomocą rekordu widzisz, że *pojęcie* półgrupy
jest jakby (pewnym, bo nie jedynym możliwym) *cieniem pojęcia* monoidu?

Pojęcie półgrupy jest ewidentnie ogólniejsze niż pojęcie monoidu, ponieważ w przypadku półgrup *nie*
wymagamy obecności wyróżnionego elementu neutralnego (ale też nie upieramy się, że ma go nie
być). Mogłoby się wydawać, że o tego rodzaju abstrakcyjnych algebrach trudno powiedzieć cokolwiek
ważnego czy interesującego, bo poza tym, że mamy tu łączne działanie, a priori nie wiemy na ich
temat nic więcej, a łączne działania są, cóż, łączne, i to by było na tyle. Możemy jednak rozważać
dowolne *hipotetyczne własności* półgrup i zadawać sobie za każdym razem pytanie, co dokładnie
wynika z *połączenia* "półgrupowości", czyli po prostu łączności działania, z innymi hipotetycznymi
własnościami. Inaczej mówiąc, możemy rozważać (niekoniecznie istniejące!) półgrupy o rozmaitych
cechach szczególnych i próbować ustalić, jak takie półgrupy mogłyby, a jak by nie mogły wyglądać. Bo
rozwijanie zastanej albo tworzenie nowej teorii matematycznej to *konsekwentne fantazjowanie* albo
*nieskrępowana niczym poza wewnętrzną spójnością swoboda myślenia*.

I tak, najmniejszą półgrupą jest zbiór pusty. Działanie musi być wtedy funkcją pustą, bo dziedziną
działania jako funkcji jest wtedy iloczyn kartezjański zbioru pustego z samym sobą, który jest
(oczywiście?) zbiorem pustym. W przypadku działania będącego funkcją pustą, nie ma żadnych trójek
elementów, dla których warunek łączności mógłby *nie* być spełniony, a więc warunek łączności jest
wtedy spełniony, tyle, że jest spełniony pusto:

```lean
-- To kolejny przykład konstrukcji termu typu rekordowego występującej w roli twierdzenia, ale tym
-- razem nazwałem ją używając frazy rzeczownikowej, a nie zdania.
def The_empty_semigroup : Semigroup Empty := 
  -- Tutaj moglibyśmy równie dobrze zwracać `x₂`. Nie ma to znaczenia, bo ta anonimowa funkcja *nie
  -- może* nigdy dostać argumentu.
  {op    := fun x₁ => fun x₂ => x₁,
   -- Termów typu `Empty` używamy prawie tak samo, jak termów typu `False`.
   assoc := by intro a b c ; exact a.elim }
```

Nazwałem ten term `The_empty_semigroup`, a nie `An_empty_semigroup`, bo chociaż moglibyśmy
zdefiniować takie same typy jak typ `Empty`, ale nadać im inne nazwy, te wszystkie typy byłyby
funkcjonalnie takie same, to jest izomorficzne, a więc byłyby tym samym typem (jako typem). 

No dobrze, w trzech liniach kodu rozstrzygnęliśmy ostatecznie i pozytywnie kwestię istnienia pustej
półgrupy. A czy może istnieć półgrupa jednoelementowa?

```lean
-- Typ indukcyjny `Unit` wygląda i zachowuje się prawie tak samo, jak typ `True`, tyle, że ma typ
-- `Type`, a nie `Prop`.
#check Unit      -- `Unit : Type`

-- W szczególności, istnieje dokładnie jeden term typu `Unit`, będący jego konstruktorem, ...
#check Unit.unit -- `Unit.unit : Unit`

-- ... który możemy również zapisywać posługując się tym sugestywnym lukrem składniowym:
#check ()        -- `() : Unit`

def The_terminal_semigroup : Semigroup Unit :=
  {op    := fun x₁ => fun x₂ => (),
   -- Ponieważ istnieje tylko jedno działanie binarne na zbiorze jednoelementowym, to, jak łatwo się
   -- przekonać wchodząc w tryb interaktywny za pomocą `by` i wpisując tylko `intro a b c`, może tu
   -- chodzić tylko o zdanie `() = ()`, a więc wystarczy taktyka `rfl`, bo dla każdego `x`, `x = x`
   -- *z definicji* (relacji równości).
   assoc := by intro a b c; rfl}
```

Może się nawet domyślasz, czemu nazwałem tą ostatnią półgrupę półgrupą *końcową*? Wrócimy do tego
wątku nieco później. A ile jest półgrup dwuelementowych? Czyli, jeżeli `X` to jakiś zbiór
dwuelementowy, na ile różnych sposobów możemy zdefiniować na tym zbiorze działanie łączne? To
pytanie może się wydawać początkowo znacznie trudniejsze niż poprzednie, ale wystarczy rozważyć
*jeden* konkretny przykład, żeby się zorientować, że wcale nie jest bardzo trudne, tylko przede
wszystkim bardziej *uciążliwe*, czyli wymaga więcej *czasu*:

Spróbujmy zdefiniować najpierw *jakiekolwiek*, a więc niekoniecznie łączne działanie na jakimkolwiek
konkretnym zbiorze dwuelementowym. Może nawet wybierzmy takie działanie, które będzie wyraźnie
pokazywać, jak bardzo nie chce nam się tego robić:

`(1, 1) ↦ 1`

`(1, 2) ↦ 1`

`(2, 1) ↦ 1`

`(2, 2) ↦ 1`

Czy to działanie jest łączne? Dla każdej trójki elementów `a`, `b` i `c`, niezależnie od tego, czy
najpierw "dodamy" `b` do `a`, a potem do wyniku dodamy (już bez cudzysłowów, bo po co?) `c` (`(a *
b) * c`), czy najpierw dodamy `c` do `b`, a wynik dodamy do `a` (`a * (b * c))`), na końcu zawsze
dostaniemy `1`, a więc to samo, a więc to jest działanie łączne. Gdybyśmy nie przypisali wszystkim
parom tego samego wyniku, byłoby to co prawda trudniej ustalić, ale moglibyśmy to zrobić tak jakby
"na siłę" (zamiast "na rozum"), rozpisując wszystkie możliwe podwójne złożenia trzech elementów w
dwóch różnych kolejnościach. 

A wszystkich możliwych funkcji z `X × X` do `X`, czyli wszystkich możliwych, niekoniecznie łącznych
działań binarnych na takim zbiorze jest tylko 16 (wiesz czemu?). Gdyby nam zależało na znalezieniu
odpowiedzi, moglibyśmy celowo poszukiwać jej w tempie dla nas komfortowym i mogłoby to być może
nawet dość przyjemne, mniej więcej tak, jak przyjemne może być układanie puzzli, które w dodatku
samemu się zrobiło.

Nie będziemy tego robić, ale to moim zdaniem cenna lekcja: Zanim się poddamy poszukując odpowiedzi
na jakieś dobrze określone pytanie, warto chociaż *spróbować* sobie wyobrazić, albo opisać, albo
zdefiniować, albo narysować, a czasem nawet tylko określić w zarysie *jeden*, mniej lub bardziej
konkretny przykład. Kto wie, może od razu wpadniemy na właściwy trop. A nawet jeśli nie wpadniemy na
niego od razu, konstrukcja przykładu sprawi, że problem będzie do nas inaczej *wracał* i może z
czasem rozwiąże się jakby sam. 

Bo jeśli tylko pozwolimy mu dość długo wracać i między tymi powrotami wystąpią nie za długie i nie
za krótkie przerwy, jego struktura utrwali się, uporządkuje i oczyści w naszej pamięci trwałej z
włochatego nalotu przypadkowych asocjacji na tyle, że będziemy w stanie wykonywać w miarę
konsekwentnie rozmaite operacje na elementach czy aspektach tego problemu z taką łatwością, że
poczujemy, że rozwiązanie jest niemal w zasięgu ręki. W tym procesie ważne jest też to, że z czasem
nabieramy również wprawy w *ignorowaniu* asocjacji nieprzypadkowych, ale chwilowo nieistotnych, co
wbrew pozorom nie jest wcale takie łatwe. Jak zawsze, zamiast walić głową w kartkę czy komputer i
ryzykować, że pojawi się pozbawiająca napędu frustracja, warto moim zdaniem uważać z ambicjami,
pozwolić działać zbawiennemu upływowi czasu i zaufać, choćby tylko warunkowo, procesom pamięciowym.

Wracamy do rododendronów. Skoro monoidy są szczególnymi przypadkami półgrup, to jest każdy monoid ma
wszystkie własności przysługujące wszystkim półgrupom, a ustaliliśmy właśnie coś na na temat
półgrup, to powinniśmy móc tą zdobytą już na zawsze wiedzę zastosować do monoidów, prawda? A nie
możemy. Wiesz dlaczego?

Udowodniliśmy dwa twierdzenia o *istnieniu* pewnego rodzaju półgrup, a takie twierdzenia nie dotyczą
*wszystkich* półgrup, to znaczy *każdej z osobna*, tylko *zbioru półgrup*, bo takie twierdzenia
mówią to samo, co zdania o postaci *Do zbioru półgrup należy element `X` taki, że ...*. A więc te
dwa twierdzenia dotyczą obiektu *innego typu* niż typ półgrup. Żeby udowodnić twierdzenie na temat
półgrup, które dotyczyłoby automatycznie wszystkich monoidów, musielibyśmy wystartować na przykład z
punktu *Niech `(X, *)` będzie półgrupą ...*, i nie moglibyśmy dodawać założeń, które wykluczałyby
istnienie elementu neutralnego.

Mam nadzieję, że udało mi się chociaż na chwilę wywieść Cię w pole tym, co napisałem w przedostatnim
akapicie, bo chciałem w ten sposób zilustrować coś ważnego na temat języka naturalnego i
psychologii. Jeżeli mi się to udało, to po raz kolejny miałaś okazję się przekonać, jak zwodniczy
bywa język naturalny, nawet wtedy, gdy posługujemy się nim stosunkowo ostrożnie. Przy okazji
chciałbym, żebyś pomyślała o tym, jak dziwne bywają zwyczaje psychologów akademickich. Z jednej
strony psychologowie często bardzo interesują się tym, jak ludzie myślą i jak mogą myśleć, a z
drugiej rzadko zadają sobie trud, żeby dowiedzieć się, czego na temat wszelkiego rodzaju pojęć można
się nauczyć poznając same tylko *podstawy* współczesnej matematyki. A przecież matematyka z używania
pojęć uczyniła wyrafinowaną, niezwykle użyteczną technologię uniwersalnego zastosowania, sama jest
rezultatem myślenia, i używają jej do myślenia o najróżniejszych sprawach, a więc w ramach pewnych
ważnych sposobów czy form zachowywania się, przynajmniej niektórzy z nas.

Nie będziemy [cudować](https://archive.org/details/bub_gb_LuzulKKxEowC/mode/2up) i udowodnimy, dla
dowolnej półgrupy `X` (zauważyłaś, jak bez ostrzeżenia skróciłem i "uwieloznaczniłem" zapis?), że:

`∀ a b c d ∈ X, (a * ((b * c) * d)) = (a * (b * (c * d)))`

Spróbujemy tym razem, cytując jego fragmenty w komentarzach nad odpowiadającym mu kodem, zreplikować
strukturę typowego półformalnego dowodu tego rodzaju zdania.

```lean
-- "Niech `P` będzie półgrupą określoną na zbiorze `X`."

-- Musimy albo odwrócić kolejność stałych `P` i `X`, ...
--
-- `variable (X : Set) (P : Semigroup X)`
--
-- ... albo polegać na domyślności Leana. Wybrałem to drugie:
variable (P : Semigroup X)

-- Nie widać w linii powyżej czerwonej falki, bo Lean domyślił się, że `X` musi być (jakimś)
-- zbiorem:
#check X -- X : Set
  
-- "Wtedy   `∀ a b c d ∈ X, (     a * (     (     b * c) * d)) = 
--                          (     a *    (     b * (     c * d)))`"

theorem t1 : ∀ a b c d : X, (P.op a   (P.op (P.op b   c)   d)) = 
                            (P.op a      (P.op b   (P.op c   d))) := by
  intro a b c d
  -- Wystarczy zastosować "pole łączności" `assoc` rekordu półgrupy do termów `b`, `c` i `d`, żeby
  -- uzyskać dowód zdania `(b * c) * d = b * (c * d)` i użyć tego dowodu jako argumentu dla taktyki
  -- `rw`:
  rw [P.assoc b c d]
  
-- Twierdzenie `t1` dotyczy dowolnych półgrup:
#check t1 -- `t1 : {X : Set} (P : Semigroup X) (a b c d : X) : P.op ...`

-- Ponieważ Lean się go domyślił, `X` jest niejawnym (i z konieczności pierwszym) parametrem tego
-- twierdzenia, natomiast `P` jest parametrem jawnym, bo deklarując za pomocą `variable`, że `P` ma
-- być parametrem wszędzie tam, gdzie nazwa `P` jest używana (i nie przysłonięta inną deklaracją
-- albo definicją), zastosowaliśmy nawiasy okrągłe.
```

## "Jest" jest wieloznaczne

Każdy monoid jest półgrupą, ale nie każda półgrupa jest monoidem. Półgrupa pusta na przykład nie
jest, bo nie ma elementu neutralnego/identyczności/jednostki, a nie ma, bo nie może mieć, bo jest
pusta. Za to półgrupa jednoelementowa, która, tak jak każdy monoid, jest łączna (właśnie mocno
przesadziłem z wieloznacznością, a mimo to od razu zrozumiałaś, o co mi chodzi, prawda?), *może*
mieć jednostkę. Ale czy ma?

Co to dokładnie znaczy "mieć jednostkę"? To albo znaczy, że istnieje element spełniający wymagania
jakie stawiamy jednostkom, albo, że taki element nie tylko istnieje, ale jest również wskazany albo
oznaczony jako jednostka. To nie jest to samo. Na przykład, co z tego, że wiemy, że istnieje
rozwiązanie jakiegoś problemu, gdy nie znamy żadnego konkretnego przykładu takiego rozwiązania?
Choćby tyle z tego, że wiemy, że znalezienie konkretnego rozwiązania jest przynajmniej możliwe, a to
czasem dużo. Jednak wiedzieć, *że* rozwiązanie *istnieje* i *mieć* rozwiązanie to dwie różne
rzeczy. Tak samo jak wiedzieć, że dwa obiekty są izomorficzne, to zdecydowanie nie to samo, co mieć
(jako w ten czy inny sposób wskazany, oznaczony, albo unikalnie scharakteryzowany) jakiś konkretny
izomorfizm.

Monoidy mają jednostki w tym drugim znaczeniu, a półgrupy miewają je co najmniej w pierwszym. Żeby
jednak udowodnić, że półgrupa końcowa (czyli jednoelementowa) ma jednostkę w tym pierwszym, słabszym
znaczeniu, musimy de facto (albo funkcjonalnie) udowodnić zdanie o postaci `∃ u ∈ P, ...`. W logice
konstruktywnej, której tu prawie zawsze używamy, to znaczy, że musimy funkcjonalnie (albo de facto)
stworzyć parę złożoną z 1. elementu/termu `u`, należącego do półgrupy/zbioru/typu `P` i z 2. dowodu,
że `u` jest jednostką. Czyli musimy jednak tą jednostkę wskazać. Czyli dowodząc tego zdania musimy
de facto stworzyć jedyne brakujące pole rekordu aksjomatów monoidu, które "doklejone" do rekordu
aksjomatów półgrupy "natychmiast" da nam monoid. Ale też jednocześnie "doklejając" takie pole
"natychmiast" udowodnilibyśmy to zdanie. To wszystko (funkcjonalnie) jest tym samym (jednym czymś).

```lean
-- Nazwałem to twierdzenie w stylu, który na ogół preferuję, to znaczy wybierając na wyczucie poziom
-- skrótowości, unikając dużych liter i nie przejmując się gramatyką (np `sg` skrt `semigroup` {i
-- wszystko jasne, prawda?}). Dwa najważniejsze kryteria, które staram się w takich sytuacjach
-- możliwie dobrze spełnić, to 1. wygoda pisania i 2. łatwość odpamiętania. Ponieważ tworząc
-- formalną matematykę/kod trzeba co chwilę wymyślać jakieś nazwy, żeby w ogólnym przypadku łatwo mi
-- się je odpamiętywało, *muszę* wymyślać nazwy o *podobnej* i *związanej z ich "sensem"
-- strukturze*.
theorem term_sg_has_unit (T : Semigroup Unit) : 
  ∃ u : Unit, ∀ a : Unit, T.op u a = a ∧ T.op a u = a := by
  -- Ponieważ I am so over robienie takich dowodów bez użycia taktyk (and at some point, you will be
  -- too {też trochę lubisz, gdy pojawia się takie napięcie między słowem zapisanym, tutaj akurat
  -- słowem "robienie", kilkoma występującymi jednocześnie faktami zachodzenia relacji adekwatności,
  -- tutaj akurat adekwatności semantycznej i gramatycznej, między tym słowem i słowami, które nie
  -- zostały zapisane, tutaj na przykład słowami "robienia" i "robieniem"? [Nie masz zdania?]}) i
  -- ponieważ jest jasne, że dowód tego zdania musi być "rutynowy", będziemy znowu obiecywać Leanowi
  -- za pomocą `apply`, że damy mu to, czego się w danym momencie domaga, a jak te obiecanki nie
  -- wystarczą, to żeby coś zmieniło się w stanie dowodu, spróbujemy odwołać się do (jakiś)
  -- definicji za pomocą `rfl`. I tak, to było jedno zdanie, nawet jeśli funkcjonalnie to było nie
  -- tyle zdanie, co jakaś droga przez jakąś mękę. Wygląda na to, że u mnie jedno z drugim się ani
  -- trochę nie wyklucza. Ale za to czy po przeczytaniu takiego długiego, dziko zagnieżdżonego i
  -- upstrzonego dygresjami zdania nie masz wrażenia ...

  apply Exists.intro
  intro a
  apply And.intro
  rfl
  rfl
  exact ()
  
  -- ... że bezgłośne klikanie bezbłędności rutynowego dowodu interaktywnego jest satysfakcjonująco
  -- odświerzające?
```

No i teraz chciałoby się może, a w każdym razie ja bym trochę chciał, udowodnić coś w stylu ... 

`T : Semigroup Unit → T : Monoid Unit`, 

... ale takie wyrażenie *nie może* być typowalne, bo ten sam term `T` ma w nim *dwa* typy, z których
żaden nie jest *redukowalny* do drugiego, a żaden nie jest, bo te dwa typy mają wyraźnie *różne
znaczenia*, zakodowane jako z konieczności nieizomorficzne rekordy:

```lean
-- Tak też, to jest sprawdzając poprawność jawnego typowania za pomocą komendy `#check`, możemy
-- (znowu) udowodnić, że istnieje półgrupa jednoelementowa. Korzystamy tutaj z udowodnionego już
-- twierdzenia albo "wcielonego aksjomatu" dotyczącego półgrupy jednoelementowej
-- `The_terminal_semigroup.assoc`.
#check ({op    :=  fun (a _) => a,
        -- Uwaga, Lean jest wrażliwy na wcięcia. Gdyby przesunąć kod w tej linii o jedno miejsce w
        -- lewo, pojawiłaby się czerwona falka. Za to w prawo można przesuwać do woli.
         assoc := The_terminal_semigroup.assoc} 
        : Semigroup Unit)

#check {op         := fun (a _) => a,
        assoc      := by intro a _ _; rfl,
       -- Półgrupy nie mają tych trzech pól:
        u          := (),
        unit_left  := by intro _ ; rfl,
        unit_right := by intro a ; rfl,
       -- Lean pozwala też jawnie typować termy rekordowe *wewnątrz* nawiasów klamrowych. Czasem ten
       -- sposób jest wygodniejszy i bardziej czytelny. Tutaj na przykład pozbyliśmy się dzięki temu
       -- zewnętrznych nawiasów okrągłych.
        : Monoid Unit}
```

Chcemy, żeby typ termu był zawsze unikalny, z dokładnością do *redukujących się* do tego samego
termu *sposobów zapisywania*, takich jak `1332 : Nat` i `1332 : (λ x ↦ x) Nat` (tak też można),
*nie* z dokładnością do w jakikolwiek sposób *dowiedlnie równoważnych konstrukcji*. Właśnie dzięki
temu, że typy są unikalne, sprawdzanie poprawności arbitralnego kodu może być zrealizowane za pomocą
*algorytmu*. Nie przejmujemy się tym, jeśli to na razie zbyt subtelna kwestia, ok? Korzystamy
natomiast, mam nadzieję, z tej okazji do kolejnej, nieco poszerzającej wiedzę (na przykład, o wiedzę
o nowym sposobie typowania rekordów) powtórki.

W teorii typów nie mamy też dokładnego odpowiednika pojęcia *pod*zbioru: Jeżeli dwa typy `A` i `B`
mają ten sam sort, na przykład oba są termami typu `Type 667`, to nie ma sposobu, żeby nawet tylko
wyrazić, jako potencjalnie prawdziwe, zdanie, że `A` jest "podtypem" `B`. W przypadku *tradycyjnie*
rozumianych (o czym kiedy indziej) zbiorów, każdy zbiór może być (albo nie być) podzbiorem każdego
innego zbioru. To znaczy, każdy taki fakt można zapisać za pomocą poprawnego syntaktycznie zdania
...

## Hierarchie pojęciowe jako relacje dziedziczenia własności

... Mamy za to w Leanie mechanizm *dziedziczenia pól rekordów* i pozwalające zrobić z tym
dziedziczeniem coś ważnego, automatycznie definiowane *projekcje*:

```lean
-- Jeżeli w tym samym pliku albo sesji masz zapisaną poprzednią definicję stałej `Monoid`, to
-- wystąpi konflikt nazw. Jeżeli usuniesz poprzednią definicję, a poniższą definicję umieścisz *pod*
-- fragmentami kodu, w których używasz stałej `Monoid`, też pojawi się (tam) błąd.

-- Czy domyślasz się od razu, co może znaczyć w tej definicji fragment `extends Semigroup`?
structure Monoid (α : Set) extends Semigroup α where
  u  : α
  unit_left  : ∀ a : α, op u a = a
  unit_right : ∀ a : α, op a u = a

-- Niech `M` będzie jakimś monoidem (którego działanie niech będzie określone na jakimś zbiorze `X`).
variable (M : Monoid X)

-- Wtedy *usuwając* trzy pola, albo *zapominając o nich*, albo *tworząc* nowy term przez samo
-- *kopiowanie* dwóch pierwszych pól `M`, uzyskujemy określoną *na tym samym zbiorze* półgrupę:
#check M.toSemigroup -- `M.toSemigroup : Semigroup X`
```

Gdy, jak wyżej, rekord `B` `extends` rekord `A`:

1. Powstaje definicja rekordu `B`, w której przed polami wymienionymi w definicji "rozszerzającej",
   albo "poszerzającej" (nie mylić z *uogólnianiem*, bo to działa *odwrotnie* do uogólniania) są też
   wszystkie pola rekordu `A` (chyba, że wystąpi konflikt nazw, ale to nam się raczej nie
   przytrafi). A więc zdefiniowany w ten sposób rekord `Monoid` ma wszystkie pola (w tym kontekście)
   "charakterystycznie własne" i wszystkie pola rekordu `Semigroup`.
   
2. Lean automatycznie tworzy funkcję `toA` w przestrzeni nazw `B`, a więc można tą funkcję stosować
   pisząc `B.toA term_typu_B` lub pisząc `term_typu_B.toA`. Ta funkcja "rzutuje" term typu `B` na
   typ `A`, dając "cień" termu typu `B` w ogólniejszej "przestrzeni" `A`. To nie jest, mówiąc
   ściśle, *pozbycie się* pewnych pól, tylko *utworzenie nowego termu typu `A` za pomocą kopiowania
   wybranych pól*, ale funkcjonalnie to działa jak pozbywanie się pewnych pól albo jak zapominanie o
   nich. A więc `M.toSemigroup` to inaczej zapisana aplikacja `Monoid.toSemigroup M`, która redukuje
   się do półgrupy określonej na tym samym zbiorze i której pola zawierają wartości "półgrupowych"
   pól monoidu `M`.

Funkcjonalność dziedziczenia dla typów rekordowych nie pozwala nam zrobić czegoś, co byłoby dowodem
zdania *Półgrupa końcowa jest monoidem*, bo to zdanie "idzie" *od pojęcia ogólniejszego do mniej
ogólnego* (~ `(Is_terminal_semigroup X) → (Is_monoid X)` \{~ czytaj tu jako "coś w stylu", albo
"mniej więcej", albo "podobne do"\}), a projekcja rekordu działa w kierunku *odwrotnym* (`(Monoid α)
→ (Semigroup α)`). Dzięki mechanizmowi dziedziczenia i projekcji możemy jednak uzyskać *transfer
wiedzy z poziomu ogólniejaszego do poziomu mniej ogólnego*:

```lean
-- Niech `M` będzie jakimś monoidem (którego działanie niech będzie określone na jakimś zbiorze `X`).
variable (M : Monoid X)

-- Wtedy *usuwając* trzy pola, albo *zapominając o nich*, albo *tworząc* nowy term przez samo
-- *kopiowanie* dwóch pierwszych pól `M`, uzyskujemy określoną na tym samym zbiorze półgrupę.
#check M.toSemigroup -- `M.toSemigroup : Semigroup X`

-- Aplikując `t1` do "półgrupowego cienia" monoidu `M` uzyskujemy wyspecjalizowaną wersję tego
-- twierdzenia, dotyczącą *działania monoidu `M`* (`M.op`):
#check t1 M.toSemigroup
-- `t1 M.toSemigroup : ∀ (a b c d : X), M.op a (M.op (M.op b c) d) = M.op a (M.op b (M.op c d))`
```

Rododendron, natomiast, je światło, bo jest rośliną, a każda roślina je światło:

```lean
structure Organism where
  cells : List Cell
  and_whatnot : Stuff

structure Plant extends Organism where
  roots  : List Root
  stems  : List Stem
  leaves : List Leave

axiom Food : Type

axiom Light : Food
    
axiom Eats (some_organism : Organism) (some_food : Food) : Prop
infixr:665 " eats " => Eats

axiom Plants_eat_light (some_plant : Plant) : some_plant.toOrganism eats Light

variable (Rododendron : Plant)

#check Plants_eat_light Rododendron 
-- `Plants_eat_light Rododendron : Rododendron.toOrganism eats Light`
```

Tylko przypominam: *Każda* roślina, a nie *wszystkie rośliny* jako pewien *zbiór* (albo
kolekcja). Normalni psychologowie Ci o tym nie powiedzą!

Czujesz, jak satysfakcjonująco to wszystko może być poukładane? A czy nie masz wrażenia, że coś tak
abstrakcyjnego jak *ogólnie rozumiana struktura pojęciowa* stało się dla Ciebie czymś bardziej
*namacalnym* albo *konkretnym*? Nawet jeśli tylko trochę, to wspaniale.

Ponieważ zbliżamy się do końca rozdziału, muszę się do czegoś przyznać. Na początku pisałem dużo o
wieloznaczności. Podałem też - jako przykład wieloznaczności pojawiającej się, gdy używamy języka
naturalnego do mówienia o zwykłych, codziennych sprawach - przykład różnych rodzajów obiadu i
różnych sposobów robienia obiadu. Jednak ani to *nie* był dobry, czy nawet jakikolwiek przykład
wieloznaczności, bo przecież rodzaje (sposoby robienia) obiadu to tylko *pojęcia mniej ogólne* niż
pojęcie (robienia) obiadu, ani nie zrobiliśmy w zawartym w tym rozdziale kodzie niczego, co
polegałoby na korzystaniu z jakiegokolwiek mechanizmu kontrolowania wieloznaczności. Możemy to
stwierdzić *z pewnością*, bo *każda stała, która pojawiła się w kodzie, była zdefiniowana dokładnie
raz*.

Czy widzisz, że gdy mamy do czynienia z pełną formalizacją, możemy tego rodzaju subtelne problemy
pojęciowe rozstrzygać zarazem mechanicznie i ostatecznie, ale gdy pojawiają się w języku naturalnym,
jesteśmy wobec nich często bezradni? I łatwo dajemy się nabrać na to albo na jakieś tamto tylko
dlatego, że mamy *wrażenie płynności wypowiedzi* i widzimy czasem, *stosowane z pewnością siebie*,
jakieś *mało nam znane terminy techniczne*. Jeżeli to widzisz, to zastanów się proszę przez chwilę,
co można zrobić z czytelnikami (albo *czytelnikom*), o których się wie, że studiowali psychologię i
unikali matematyki, pisząc nabite terminami technicznymi na przykład statystyki czy przyczynowości
"artykuły naukowe".
