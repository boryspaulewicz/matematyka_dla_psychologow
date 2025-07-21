<!-- -*- coding: utf-8 -*- -->
# Klasy typów służą do pisania i myślenia po ludzku

Pisząc o monoidach, matematycy pozwalają sobie czasem na coś takiego:

*Jeżeli `M` jest monoidem, to dla każdego `m ∈ M`, `u * m = m`*.

Jak myślisz, co dokładnie oznacza tutaj stała `M`? Monoid, czy pewien zbiór? Jeżeli `M` jest
monoidem, to zgodnie z definicją jest pewną *trójką uporządkowaną* (złożoną z pewnego zbioru, i tak
dalej). Ale przecież relacja należenia do zbioru, której zachodzenie dla pary `(m, M)` oznaczamy
pisząc `m ∈ M`, jest *niezdefiniowana*, gdy drugim członem zamiast *zbioru* jest ciąg skończony. Na
pierwszy rzut oka wygląda to więc na błąd, bo takie wyrażenie nie jest, przynajmniej w przyjętym
przez nas dotąd sensie, typowalne.

Niektórzy matematycy piszą ostrożniej, na przykład tak:

*Jeżeli `ℳ = (M, *, u)` jest monoidem, to dla każdego `m ∈ M`, `u * m = m`*.

Zmiana czcionki jest wtedy ważna, bo sygnalizuje, że stałe `ℳ` i `M` mają oznaczać blisko, a w tym
wypadku można nawet powiedzieć, że [intymnie związane](https://en.wikipedia.org/wiki/Love_and_Math)
obiekty różnego rodzaju. Zdarzają się też matematycy, którzy piszą tak ...

*Jeżeli `ℳ := (M, *, u)` jest monoidem, to dla każdego `m ∈ M`, `u * m = m`*.

... wyraźnie zaznaczając, że to (lokalna) definicja, ale mało komu się chce i można to zrozumieć,
między innymi dlatego, że już ten pierwszy sposób pisania jest w zasadzie
*nieproblematyczny*. 

Podobne zwyczaje dotyczą symboli oznaczających działania. Nikomu się nie chce wymyślać i
konsekwentnie stosować kolejnych symboli na oznaczenie czegoś, co na przykład bardzo przypomina
zwykłe dodawanie, ale nim nie jest, tym bardziej, że matematycy są nie tylko do tego rodzaju
wieloznaczności przyzwyczajeni, ale czasem wręcz jej *oczekują*. A oczekują jej między innymi
dlatego, że po pierwsze, wolą nie zapamiętywać więcej szczegółów notacji, niż to *potrzebne*, a po
drugie, skoro już mają głęboko wdrukowane, przyspieszające pisanie i myślenie *automatyzmy* związane
z symbolem dodawania, to czemu mieliby z nich nie korzystać, gdy coś zachowuje się, przynajmniej w
pewnych powtarzających się sytuacjach, jak zwykłe dodawanie?

Tego rodzaju zwyczaje komunikacyjne odpowiadają temu, jak posługujemy się na codzień językami
naturalnymi. Gdy na przykład mówimy albo myślimy o "zrobieniu obiadu", może nam chodzić o przeróżne
*procesy fizyczne*. Mimo różnic, te procesy będą jednak lepiej lub gorzej *rozwiązywały podobne
problemy w podobny sposób*, czyli będą podobne funkcjonalnie, to jest pod względem *sposobu
działania*, a więc w innym znaczeniu słowa "funkcja" niż przyporządkowanie elementom jakiegoś zbioru
albo termom jakiegoś typu unikalnych wartości, obiektów, czy termów. Oczywiście interesuje nas
często, o jaki konkretnie obiad chodzi, albo w jaki konkretnie sposób ten obiad ma być lub został
zrobiony, ale czasami nas to *nie* interesuje i wtedy trudno się obejść bez mówienia w taki
skrótowy, *celowo wieloznaczny* sposób o zrobieniu *jakiegoś* obiadu albo zrobieniu obiadu w *jakiś*
sposób.

Gdy w matematyce mówimy o "dodawaniu", może nam chodzić o dodawanie liczb naturalnych, wymiernych,
rzeczywistych, zespolonych, wektorów, macierzy, ciągów, funkcji, albo innego rodzaju
obiektów. *Szczegóły* działania operacji są wtedy za każdym razem *inne*, jednak *podobieństwo
funkcjonalne* jest na tyle wyraźne albo w danym kontekście ważne, że używanie do tego celu tej samej
nazwy albo tego samego symbolu i sposobu zapisywania działań sprawdza się znacznie lepiej, niż
komplikowanie notacji i unikanie wieloznaczności za wszelką cenę.

To tylko kilka przykładów celowej i bardzo przydatnej, a czasem wręcz nieodzownej wieloznaczności. I
nie chodzi w tym tylko o ekonomię środków i kontrolę liczby używanych słów, ale również o ułatwienie
sobie lub innym *elastycznego przełączania się* między *różnymi, ale blisko związanymi sposobami
myślenia*. Inaczej mówiąc, na pewno nie zawsze, ale niezwykle często jest tak, że *warto* mieszać ze
sobą różne języki. Wydaje mi się nawet, że zdążyłaś się już o tym niejednokrotnie przekonać między
innymi czytając tą książkę.

To jednocześnie przykłady czegoś, co można by nazwać *abstrakcją funkcjonalną*, a co odgrywa
fundamentalną rolę w psychologii, ponieważ centralnym przedmiotem badań psychologicznych są
*abstrakcyjnie* rozumiane *zachowania*, a zachowania są tym, czym są, to jest zachowaniami,
dokładnie dlatego, że *czemuś służą*, to jest (w przybliżeniu) *rozwiązują* jakiś *problem* albo
*wykonują* jakieś *zadanie*. A może nawet wypadałoby tego rodzaju wieloznaczności nazywać po prostu
*abstrakcją*, skoro, przynajmniej moim zdaniem, *abstrakcja jest zawsze
funkcjonalna*. Abstrakcyjność jest przecież własnością *pojęć* (ogólność połączona często z
wieloznacznością oznaczających pojęcia słów) i *reprezentacji* (też ogólność połączona z
wieloznacznością, ale sposobów reprezentowania), a pojęcia pojęcia i reprezentacji są pojęciami
funkcjonalnymi: pojęcia i reprezentacje są tym, czym są, dlatego, że *używają ich w pewien sposób*
pewne gatunki zwierząt.

No dobrze, spróbuję się ogarnąć i może ograniczę próby przekazania intonacji za pomocą pisma
pochyłego.

## Rekordowo i z klasą

Skoro każdy rododendron jest rośliną, a rośliny potrafią w normalnych warunkach pobierać energię ze
światła, to rododendron potrafi jeść światło. Taki oto zwyczajny, chciałoby się powiedzieć typowy
ciąg myśli przyszedł mi do głowy, wobec czego właśnie nad tym zdaniem będziemy się teraz pochylać.

Cokolwiek by to miało znaczyć, byłoby raczej niewygodnie kodować wiedzę na temat metabolizmu roślin
na poziomie poszczególnych gatunków roślin. O wiele wygodniej i sensowniej jest traktować takie
zjawiska jak fotosynteza jako własności *wszystkich* roślin. Gdy trzeba się do tego rodzaju
własności odnieść wprowadzając je jako założenie do konstruowanego rozumowania i biorąc pod uwagę na
przykład rododendrony, wystarczy wtedy skorzystać z faktu, że rododendron to roślina i na tej
podstawie, albo idąc tym tropem, dotrzeć do informacji na temat fotosyntezy i wyprowadzić stąd
jakieś wnioski. Wydaje się wręcz, że z tego rodzaju *hierarchicznej struktury pojęć* czy *wiedzy*
korzystamy niemal cały czas i niemal w każdym kontekście.

A każdy monoid jest [*półgrupą*](https://pl.wikipedia.org/wiki/P%C3%B3%C5%82grupa). Półgrupa zaś to
... Może jednak tym razem od razu skorzystam z rekordu, bo już wiesz, jak możesz to sobie
przetłumaczyć na język półformalny, gdyby zajdzie taka (paląca) potrzeba, prawda? Przy okazji
pozwolę sobie ukryć różnice między zbiorami i typami za pomocą odrobiny lukru.

```lean
structure Semigroup (α : Set) where
  op    : α → α → α
  assoc : ∀ a b c : α, (op (op a b) c) = (op a (op b c))
```

Jak widać, półgrupa to para złożona ze zbioru i określonego na nim działa łącznego. Bez szkody dla
rozumowania będę odtąd mówił czasami, że półgrupa to po prostu dowolne działanie łączne. 

Pojęcie półgrupy jest ewidentnie ogólniejsze niż pojęcie monoidu, ponieważ w przypadku półgrup *nie*
wymagamy obecności wyróżnionego elementu neutralnego (ale też nie upieramy się, żeby go nie
było). Mogłoby się wydawać, że o tego rodzaju algebrach trudno powiedzieć cokolwiek ważnego czy
interesującego, bo poza tym, że mamy tu łączne działanie, nie wiemy na ich temat nic więcej, a
łączne działania są, cóż, łączne, i to by było na tyle. Możemy jednak rozważać dowolne
*hipotetyczne* własności półgrup i zadawać sobie pytanie, co wynika z połączenia półgrupowości z
tymi własnościami. Na przykład, możemy poszukiwać półgrup o jakiś szczególnych cechach i próbować
ustalić, jak takie półgrupy mogą, a jak nie mogą wyglądać.

I tak, najmniejszą półgrupą jest zbiór pusty. Działanie musi być wtedy funkcją pustą, bo dziedziną
działania jako funkcji jest wtedy iloczyn kartezjański zbioru pustego z samym sobą, który jest
(oczywiście?) zbiorem pustym. W przypadku działania będącego funkcją pustą nie ma żadnych trójek
elementów, dla których warunek łączności mógłby *nie* być spełniony, a więc warunek łączności jest
spełniony, tyle, że *pusto*:

```lean
-- To kolejny przykład konstrukcji termu typu rekordowego występującej w roli twierdzenia.
def The_empty_semigroup : Semigroup Empty := 
  -- Tutaj moglibyśmy równie dobrze zwracać `x₂`. Nie ma to znaczenia, bo ta anonimowa funkcja *nie
  -- może* nigdy dostać żadnego argumentu.
  {op    := fun x₁ => fun x₂ => x₁,
   -- Termów typu `Empty` używamy prawie tak samo, jak termów typu `False`.
   assoc := by intro a b c ; exact a.elim }
```

Nazwałem ten term `The_empty_semigroup`, bo chociaż moglibyśmy zdefiniować takie same typy jak typ
`Empty`, ale nadać im inne nazwy, te wszystkie typy byłyby funkcjonalnie takie same, to jest
izomorficzne, a więc byłyby tym samym typem (*jako typem*). No dobrze, w trzech liniach kodu
rozstrzygnęliśmy ostatecznie kwestię istnienia pustej półgrupy, a czy może istnieć półgrupa
jednoelementowa?

```lean
-- Typ indukcyjny `Unit` wygląda i zachowuje się prawie tak samo jak typ `True`, tyle, że ma typ
-- `Type`, a nie `Prop`.
#check Unit      -- `Unit : Type`

-- W szczególności, istnieje dokładnie jeden term typu `Unit`, będący jego konstruktorem, ...
#check Unit.unit -- `Unit.unit : Unit`

-- ... który możemy również zapisywać posługując się tym sugestywnym lukrem składniowym:
#check ()        -- `() : Unit`

def The_terminal_semigroup : Semigroup Unit :=
  {op    := fun x₁ => fun x₂ => (),
   -- Może tu chodzić tylko o zdanie `() = ()`, a więc wystarczy taktyka `rfl`.
   assoc := by intro a b c; rfl}
```

Może już się nawet domyślasz, czemu nazwałem tą ostatnią półgrupę półgrupą *końcową*? Wrócimy do
tego wątku nieco później. A ile jest półgrup dwuelementowych? Czyli, jeżeli `X` to jakiś zbiór
dwuelementowy, na ile różnych sposobów możemy zdefiniować na tym zbiorze działanie łączne? To
pytanie może się wydawać początkowo znacznie trudniejsze niż poprzednie, ale wystarczy
rozważyć *jeden* konkretny przykład, żeby się zorientować, że wcale nie jest takie trudne:

Spróbujmy zdefiniować najpierw *jakiekolwiek*, a więc niekoniecznie łączne działanie na jakimkolwiek
konkretnym zbiorze dwuelementowym. Może nawet wybierzmy takie, które wyraźnie mówi, jak bardzo nie
chce nam się tego robić, na przykład takie:

`(1, 1) ↦ 1`

`(1, 2) ↦ 1`

`(2, 1) ↦ 1`

`(2, 2) ↦ 1`

Czy to działanie jest łączne? Dla każdej trójki elementów `a`, `b` i `c`, niezależnie od tego, czy
najpierw "dodamy" `b` do `a`, a potem do wyniku dodamy `c`, czy najpierw dodamy (już bez
cudzysłowów, bo po co?) `c` do `b`, a wyniku dodamy do `a`, na końcu zawsze dostaniemy `1`, a więc
to samo, a więc to jest działanie łączne. Gdybyśmy nie przypisali wszystkim parom tego samego
wyniku, byłoby to co prawda trudniej ustalić, ale moglibyśmy to zrobić tak jakby "na siłę" (zamiast
"na rozum"), rozpisując wszystkie możliwe podwójne złożenia trzech elementów w dwóch różnych
kolejnościach. A wszystkich możliwych funkcji z `X × X` do `X` jest tylko 16 (wiesz czemu?).

Nie będziemy tego robić, ale to moim zdaniem cenna lekcja: Zanim się poddamy poszukując odpowiedzi
na jakieś dobrze określone pytanie, warto chociaż *spróbować* sobie wyobrazić albo opisać albo
zdefiniować albo narysować a czasem nawet tylko określić w zarysie *jeden, mniej lub bardziej
konkretny przykład*. Kto wie, może od razu wpadniemy na właściwy trop.

TODO: o tym jak próbowałem na początku wprowadzić czytelniczków w błąd

TODO: ostrożniej o wieloznaczności

TODO: Więcej o dziedziczeniu poniżej

W Leanie możemy korzystać z mechanizmu *dziedziczenia rekordów*, na przykład tak (jeżeli w tym samym
pliku albo sesji masz zapisaną poprzednią definicję stałej `Monoid`, to wystąpi konflikt nazw):

```lean
structure Monoid (α : Set) extends Semigroup α where
  u  : α
  unit_left  : ∀ a : α, op u a = a
  unit_right : ∀ a : α, op a u = a
```

Czujesz już, jak przyjemnie to wszystko może być poukładane?
