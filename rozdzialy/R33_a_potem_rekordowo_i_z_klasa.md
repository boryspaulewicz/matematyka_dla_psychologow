<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie

# ... a potem rekordowo i z klasą

Cytuję za Wikipedią (2025 07 25):

> Polimorfizm (z gr. wielopostaciowość) – mechanizmy pozwalające programiście używać wartości,
> zmiennych i podprogramów na kilka różnych sposobów. Inaczej mówiąc jest to możliwość
> wyabstrahowania wyrażeń od konkretnych typów.

Jeśli zdarzy Ci się tutaj wrócić po przeczytaniu tego rozdziału, zastanów się proszę nad trafnością
pierwszego zdania, bo nie wiem, co o nim myśleć. Co do drugiego zdania, funkcje takie jak ta ...

```lean
def lewy_element_dowolnej_pary (x : α × β) : α := x.fst
```

... nazywamy *polimofricznymi*, ponieważ przyjmują argumenty *różnego* (poli-) *typu* (-morfizm), a
typ to między innymi abstrakcyjny odpowiednik *rodzaju*, o którym czasem mówimy używając takich
kojarzących się przestrzennie słów jak "forma" albo "kształt", czy, tak jak w zacytowanym
fragmencie, "postać". Jak można się przekonać, ta funkcja jest polimorficzna również ze względu na
(upierdliwy, prawda?) *sort* każdego z dwóch typów ...

```lean
#check lewy_element_dowolnej_pary 
-- `lewy_element_dowolnej_pary.{u_1, u_2} {α : Type u_1} {β : Type u_2} (x : α × β) : α`
```

... ale tym aspektem nie będziemy się zajmować. Na wypadek, gdyby Ci się to jeszcze dobrze nie
wdrukowało, przypominam, że gdy w definicjach wpisujemy parametry o niezadeklarowanych typach, tak
jak to robimy tutaj z parametrami `α` i `β`, Lean próbuje się domyślić, jakiego typu mają to być
parametry i jeśli mu się uda, dodaje je w odpowiednim miejscu do definicji jako parametry
niejawne. Tutaj domyślił się, że to mają być typy dowolnego sortu.

Jak to działa (ilustracja)?

```lean
-- Pozwolisz, że najpierw skrócę zapis.
def lw := lewy_element_dowolnej_pary

def p : Nat × String := ⟨2, "trzy"⟩

#eval lw p

-->
(fun (x : α × β) => x.fst) p

-->
(fun (x : Prod α β) => x.fst) p

-- (po prawej jest skrót myślowy, dotyczący sposobu używania w tej sytuacji przez Leana informacji o
-- typach) -->
(fun (x : Prod α β) => x.fst) (p : Prod Nat String)

--> 
(fun (x : Prod Nat String) => x.fst) (p : Prod Nat String)

-->
(fun (x : Prod Nat String) => Prod.fst x) (p : Prod Nat String)

-->
Prod.fst p

-->
10
```

Nie wiem, jak łatwo to zobaczyć, ale fakt, że `α` i `β` są tutaj parametrami oznaczającymi
arbitralne typy *nie dotyczy sposobu działania kodu*. Mówiąc dokładniej, deklaracja typu parametru
`x` jako `α × β` służy tu *jedynie* jako *składniowe zabezpieczenie przed błędami*, to jest do
*ograniczenia dopuszczalnych argumentów* do termów typów produktowych. Natomiast sam kod działa w
sposób *jednorodny* dla termów każdego akceptowanego typu. A więc to jest z jednej strony funkcja
polimorficzna, bo przynajmniej jeden typ jest parametrem, ale z drugiej strony trudno powiedzieć,
żebyśmy tu "używali" czegokolwiek "na kilka *różnych sposobów*", że znowu zacytuję artykuł
Wikipedii.

W szczególności, nie jest łatwo powiedzieć, co to ma wspólnego z *wieloznacznością*, bo każda stała
ma dokładnie jedno, niezmienne "znaczenie", parametry pełnią rolę miejsc, w które można wstawiać
termy odpowiedniego typu, a zmienne, czyli nazwy parametrów pojawiające się w ciele definicji,
pełnią rolę zaimków wskazujących na określone wejścia, czyli na określone miejsca w strukturze
definicji. Wieloznaczność parametrów i ich wystąpień w ciele, czyli zmiennych, to właściwie
jednoznaczność, tyle, że jednoznaczność *metajęzykowa*. Na przykład, w definicji funkcji
`lewy_element` parametr `x` oznacza albo pierwszy argument każdej aplikacji tej funkcji, albo, co na
jedno wychodzi, pierwsze wejście, przy czym oba znaczenia są metajęzykowe, bo dotyczą *struktury
wyrażeń*. A zmienna `x` w ciele oznacza *wartość pierwszego parametru*, co też jest charakterystyką
metajęzykową. 

Do tej pory mówiłem często skrótowo, że parametry pełnią rolę zaimków, nie rozróżniając
konsekwentnie i wyraźnie *parametrów jako miejsc* (w specyfikacji typu) od ich *nazw* i *wystąpień*
tych nazw, bo rozróżnienie tych aspektów parametryczności nie było mi potrzebne. Teraz jednak
związki między strukturą i działaniem kodu a strukturą i działaniem języka naturalnego zaczynają się
robić na tyle skomplikowane, że poczułem taką potrzebę (i ją natychmiast zaspokoiłem). 

Byłbym zapomniał dodać, że mamy przecież jeszcze *połączenie* tych dwóch ostatnich rodzajów rzekomej
wieloznaczności w postaci typów *zależnych*, takich jak typ uogólnionej identyczności, ...

```lean
#check id -- id.{u} {α : Sort u} (a : α) : α
```

... w których typ (tutaj `α`) może być zarówno (tutaj niejawnym) parametrem *funkcji* jak i
parametrem *specyfikacji typu* (tutaj ostatniego argumentu i rezultatu aplikacji
identyczności). Wychodzi więc na to, że "zależnotypowość" to coś w rodzaju polimorficznej
polimorficzności. Ale z pełnowartościową, jadowitą i płodną wieloznacznością nawet polimorficzny
polimorfizm zależnotypowości nie ma za wiele wspólnego.

Z tego rodzaju polimorfizmu korzystaliśmy już wielokrotnie i nie trzeba było dotąd szukać innych
sposobów pisania funkcji, które mogą przyjmować argumenty różnych typów. A nie było takiej potrzeby
dokładnie dlatego, że pisaliśmy funkcje polimorficzne, których *ciała "działały" tak samo dla
każdego typu*, czyli jednorodnie. Tak jak funkcja `lewy_element_dowolnej_pary`, która dla termów
każdego pasującego typu robi to samo, to jest stosuje będące funkcją pole o nazwie `fst`, w które to
pole wyposażona jest każda para, niezależnie od typu pierwszego i typu drugiego elementu.

Przy okazji: Mogłem również, mając na myśli funkcję `fst`, zamiast *w które to pole wyposażona jest
każda para*, napisać *która to funkcja działa dla termów każdego typu produktowego*, ponieważ
różnica między *strukturą* (termów typów produktowych) i *funkcjonalnością* jako funkcyjnym
interfejsem jest tutaj *celowo zatarta*:

```lean
def para : Nat × Nat := ⟨2, 1⟩

-- To wygląda tak, jakbyśmy *wymieniali z nazwy część struktury* pary, ...
#eval para.fst

-- ... to wygląda tak, jakbyśmy stosowali do tej pary pewne działanie, ...
#eval Prod.fst para

-- ... przy czym oba fragmenty kodu różnią się tylko *notacją*.
```

To zjawisko można nazwać wieloznacznością w tym znaczeniu, że *różne sposoby mówienia* czy *pisania*
mają tutaj *to samo znaczenie*; nie w tym znaczeniu, że *ten sam zapis* ma *różne znaczenia*. Poza
tym mechanizm "redukcji" jest w tym przypadku *metajęzykowy* - to nie jest funkcjonalność wbudowana
w język teorii typów, tylko dostępne w Leanie udogodnienie dotyczące notacji. Jest to więc inny
rodzaj wieloznaczności niż ten, który pojawia się na przykład w tym akapicie i dotyczy akurat
... "wieloznaczności"[^1].

A z drugiej strony taki sam (zawsze wszystko ma `n`-tą stronę, dla dowolnego `n`!). Zresztą, dodatki
do teorii typów, które są w Leanie, to z jednej strony dodatki, a z drugiej Lean to przecieć pewna
całkowicie sformalizowana, bo *zapisana jako kod* w jakiś językach programowania, *wersja* teorii
typów, a żadnej jedynej słusznej wersji teorii typów nie ma i nigdy nie będzie.

O wieloznaczności widocznej w ostatnim fragmencie kodu można powiedzieć, że to niemal taki "dualny"
odpowiednik "zwykłej" wieloznaczności, bo ta zwykła dotyczy wielości znaczeń tego samego symbolu,
słowa, czy wyrażenia, a więc wielości po *prawej* stronie relacji oznaczania, a ta "notacyjna"
dotyczy wielości *o*znaczeń, a więc wielości po *lewej* stronie relacji oznaczania. Z tej
perspektywy (albo w tym znaczeniu!) matematyka stosowana polega bardzo często na ustalaniu że, albo
korzystaniu z tego że - zachodzi jakiś przypadek *ko*wieloznaczności (orientuj się!), to jest `f(x,
y, z, ...) = g(u, v, w, ...)`, czyli że *różne zapisy oznaczają to samo*. Bo przecież rozstrzyganie
prawdziwości takich zdań ma charakter mechaniczny, bo może mieć, a ma charakter mechaniczny,
ponieważ ma charakter syntaktyczny, bo może mieć, bo całą matematykę można zakodować w języku teorii
typów.

Słowo "znaczenie" też jest wieloznaczne, w dodatku w sposób, który jest w tej książce ważny. Z
jednej strony znaczenie to *denotacja*, na przykład, gdy mówimy wskazując na jajko "to jajko",
znaczeniem jest (tam) to jajko. Z drugiej strony, znaczenie to tak lub inaczej rozumiana *rola*, a z
trzeciej znaczenie to *konsekwencje* wynikające z. W dodatku bawimy się tutaj bliskoznacznością
*znaczenia* i *punktu widzenia* (na znaczenie znaczenia). No i znaczenie to także, a moim zdaniem
[par excellence](https://pl.wikipedia.org/wiki/Par_excellence)[^2], *sposób użycia*.

A w tej książce mam często problem ze słowem "funkcja". Funkcja jako przyporządkowanie lub metoda
przyporządkowania lub własność to jedno, a funkcja jako rola (na przykład, psychologowie mówią
czasem, że "funkcją uwagi jest selekcja informacji ...") to co innego. Słowa "funkcjonalność" używam
w dwóch, blisko związanych znaczeniach, jako oznaczającego interfejs złożony z funkcji i jako
oznaczającego "rolowość" (bo czemu nie?). No i jest jeszcze funkcjonalność wyrażalna w języku
kategoryjnym, która z jednej strony polega na mówieniu językiem, którego "jądrem" jest algebra
funkcji, bo ten język powstał przez wyabstrachowanie działania składania funkcji
teoriomnogościowych, a z drugiej na mówieniu językiem pozwalającym "uchwycić" funkcjonalność "w"
strukturze (strzałek) ze względu na (matematyczną) funkcję (!) składania składalnych
strzałek. Uff. Prawie na pewno coś tu sknociłem, ale jeszcze tu wrócę.

Bawiąc się terminologią, punktami widzenia i znaczeniami próbuję Ci (nomen omen) unaocznić między
innymi to, że wieloperpsektywiczność i wieloznaczność to fundamentalne i potężne, ale też trudne w
obsłudze, a czasem wręcz przyprawiające o [zawrót
głowy](https://youtu.be/PGNiXGX2nLU?si=iRBLIQjw40NBPFBl) narzędzia myślenia. Dlatego tak bardzo
chcemy poznać różne postaci polimorfizmu (pun intended) i chcemy wiedzieć, jak dokładnie działają. I
dzięki temu może nawet wykombinować, przyglądając się szczegółowo omówionym przykładom, jak jeszcze
mogłyby działać.

W tym celu na początek (*teraz* jest początek?! \{ale o co chodzi? przecież początek jest
*zawsze*\}) przypomnę naszą małą hierarchię algebr abstrakcyjnych, którą zakodowaliśmy korzystając z
dziedziczenia struktur/rekordów:

```lean
structure Semigroup (α : Type u) where
  op (a b : α) : α
  assoc : ∀ a b c : α, (op (op a b) c) = (op a (op b c))

structure Monoid (α : Type u) extends Semigroup α where
  u : α
  -- Tym razem nazwałem te dwie własności w stylu stosowanym powszechnie w Leanie. Na przykład,
  -- `Nat.zero_add` to twierdzenie o treści `∀ (n : Nat), 0 + n = n`, w którym `0` występuje jako
  -- pierwszy człon dodawania, stąd nazwa `zero_add`. `Nat.add_zero : ∀ (n : Nat), n + 0 = n`.
  -- (mogę tak czasem pisać? to było ostatnie zdanie powyższego akapitu, tylko zapisane formalnie).
  add_unit : ∀ a : α, op u a = a
  unit_add : ∀ a : α, op a u = a
```

Gdybyśmy mieli ochotę, zamiast pisać w notacji przedrostkowej `(op (op a b) c)` pisać w notacji
wzrostkowej `((a op b) op c)`, moglibyśmy spróbować to zrobić tak:

```lean
variable (S : Semigroup α)

-- Ta liczba po dwukropku to *priorytet*. Nie warto się tym przejmować zanim nie zajdzie taka
-- potrzeba.
infixl:65 " op " => S.op -- tutaj pojawia się błąd
```

Ale wtedy pojawiłby się komunikat o błędzie, któremu jednak towarzyszyłaby sugestia, żeby wyłączyć
opcję `quotPrecheck`. No to próbujemy znowu:

```lean
set_option quotPrecheck false
infixl:65 " op " => S.op

-- Musimy mieć co "dodawać", więc wprowadzamy hipotetyczne termy hipotetycznego typu `α`. Moglibyśmy
-- wprowadzić je aksjomatycznie i nie byłoby żadnej różnicy, ale aksjomaty wydają się jakieś takie
-- zobowiązujące, prawda?
variable (a b c : α)

-- Lean odgadł automatycznie, że `α` ma być jakimś typem dowolnego sortu, gdy symbol `α` pojawił się
-- po stronie typu w deklaracji dotyczącej symbolu `S`. Od tego momentu, wszędzie tam, gdzie są do
-- czegoś używane, symbole `a`, `b` i `c` będą niejawnymi parametrami typu `α`, który też będzie
-- niejawnym parametrem.

-- Lean nie sygnalizuje błędu, a więc możemy pisać wzrostkowo.
#check (a op b) op c

-- Nadal możemy tak pisać, ale kto by tak teraz chciał?
#check S.op (S.op a b) c

-- Czy widzisz, o ile łatwiejsza do "parsowania" jest pierwsza wersja? A czy przeczuwasz, jakie to
-- może mieć znaczenie dla łatwości i (nieosiągalnej, ale zawsze można próbować ją przybliżać)
-- niezawodności myślenia o takich zapisach lub za ich pomocą?
```

## Jak to robią osoby zawodowcze

Żeby przekonać się, jakie zrobiliśmy postępy w formalizacji użytecznych mechanizmów wieloznaczności,
będziemy się znowu przyglądać praktykom ludzi, których zawód polega na arbitralnie abstrakcyjnym,
konsekwentnym i skutecznym myśleniu z dowolnych punktów widzenia na dowolny temat. Czyli znowu
będziemy przyglądać się temu, *jak mówią matematycy*. I znowu wystarczy nam rzut oka na krótkie
fragmenty, które pojawiają się często na początku pierwszych rozdziałów, takie jak ten:

*Niech `f : ℕ → ℤ` będzie inkluzją liczb naturalnych w zbiór liczb całkowitych `f(n) = n`. Wtedy
`f(m + n) = f(m) + f(n)`,*

Zaczniemy od prerekwizytów. Napotykamy tutaj (ponownie?) słowo "inkluzja" i domyślamy się, że to
każda funkcja z *podzbioru* (tutaj `ℕ`) do (niekoniecznie większego) zbioru zawierającego (tutaj
`ℤ`), wyrażająca fakt bycia elementem nadzbioru dla każdego elementu podzbioru. *Funkcja* `f` wyraża
więc albo ucieleśnia sobą to samo, co mówi *stwierdzenie*, że każda liczba naturalna jest (ponieważ
to są różne zbiory i typy, to tak naprawdę w pewien sposób *utożsamialna* z odpowiadającą jej w
oczywisty sposób) liczbą całkowitą.

Na końcu pojawia się coś, co mam wrażenie może wyglądać jednocześnie banalnie i dezorientująco, to
jest stwierdzenie faktu *zachowywania operacji dodawania* przez funkcję `f`:

`f(m + n) = f(m) + f(n)`

Inne względnie adekwatne sposoby mówienia o takich zjawiskach to *respektowanie* albo *zgodność z*
(tutaj "`f`-oznaczania" z dodawaniem), albo nawet *przemienność* czy *komutatywność* (bo o
diagramach mówimy też, że *komutują*). Znanym Ci ważnym przykładem tego rodzaju funkcji jest
mnożenie przez stałą, ponieważ mnożenie jest rozdzielne względem dodawania:

```
f(m) := 2 * m

f(m + n) = 2 * (m + n) = 2 * m + 2 * n = f(m) + f(n)
```

Takie zjawiska staną się dla nas niebawem ważne, więc może dobrze będzie już teraz zacząć im się
ostrożnie przyglądać. Na pierwszy rzut oka wydaje się, że mamy tu dwie operacje: jednoargumentową
`f` i dwuargumenetową `+`. Ale to nieprawda, bo dodawanie liczb naturalnych to jedno, a dodawanie
liczb całkowitych, nawet jeśli jest blisko związane z tym pierwszym, to co innego. Czyli mamy *trzy*
operacje, a nie dwie, zgadza się? Też nie.

Dodawanie jest działaniem dwuargumentowym, a więc musimy albo skorzystać z curryingu, albo z
produktu `ℕ × ℕ`. To "bardziej matematyka niż programowanie" (chociaż, jak wiesz, to jest to samo),
więc skorzystamy tym razem z produktu:

```
⟨m, n⟩ ↦    m + n     ↦  f(m + n)   =: X

⟨m, n⟩ ↦ ⟨f(m), f(n)⟩ ↦ f(m) + f(n) =: Y

X = Y
```

(Ten sposób oznaczania *przemienności diagramu* \{przepraszam, ale na jakiś czas zostawię Cię na tym
rozczarowującym pikniku pod wiszącą zagadką\} za pomocą definicji "w drugą stronę" \{`=:`\}
wymyśliłem przed chwilą i jeszcze nie wiem, czy będę go stosował)

Nie przypomina Ci to trochę "nieinteraktywnego przeplatania się oznaczania, produktowania i
odwracania par" (ten sposób mówienia też wymyśliłem, dlatego wypada mi zawrzeć całość w cudzysłowie,
gdy wprowadzam go w nowym rozdziale), któremu przyglądaliśmy się w jednym z poprzednich rozdziałów?

```
⟨a, b⟩ ↦ ⟨f(a), g(b)⟩ ↦ ⟨g(b), f(a)⟩ =: X

⟨a, b⟩ ↦    ⟨b, a⟩    ↦ ⟨g(b), f(a)⟩ =: Y

X = Y
```

W obydwu przypadkach rozkład na procesy (albo funkcje, przekształcenia, morfizmy, mapy,
odwzorowania, czy strzałki) składowe pozwala zobaczyć coś w rodzaju *zgodnego przeplatania się*
różnego rodzaju procesów, prawda? No i trudno to zobaczyć bez wystarczająco daleko idącej
formalizacji. No więc operowanie tego rodzaju zjawiskami staje się szybko wyraźnie bardziej
uciążliwe i dezorientujące gdy nie korzystamy z przeciążania oznaczeń operacji, takiego jak
zastosowane przeciążenie symbolu `+`. Co więcej, bez tego rodzaju wieloznaczności byłoby nam
trudniej zauważyć to zgodne przeplatanie się, gdy to zjawisko polega na równości wyniku składania w
różnych kolejnościach *analogicznych*, to jest w jaki sposób podobnych lub blisko związanych, ale
niekoniecznie tych samych strzałek, takich jak dodawanie liczb naturalnych i podobne i blisko
związane, ale będące jednak inną operacją dodawanie liczb całkowitych.

Żeby wszystko (?) było jasne, powinienem chyba jeszcze podać przykład *negatywny* ...

```
⟨m, n⟩ ↦  m + n   ↦ (m  +  n)² = m² + 2 * m * n + n²

⟨m, n⟩ ↦ ⟨m², n²⟩ ↦  m² +  n²

¬ (∀ m n ∈ ℕ, (m + n)² = m² + n²)
```

... i podkreślić zasadniczą różnicę między dwoma rozważanymi *zgodnymi* przeplotami: W pierwszym
przypadku wyrażamy *warunek*, o którym *zakładamy*, że spełnia go bliżej nieokreślona funkcja `f`; w
drugim przypadku *dowodzimy*, pokazując w jaki sposób działają na dowolnych parach różne złożenia
pewnych funkcji, że przeplot jest zgodny.

Możemy już wrócić do prób wprowadzenia jednorodnej notacji wzrostkowej dla arbitralnych
półgrup. Niech istnieje w nas pewne pragnienie zapisania w Leanie zdania mówiącego, że funkcja `f`,
posyłająca elementy półgrupy `S` w elementy półgrupy `R`, zachowuje strukturę półgrupy, czyli że
jest [*homomorfizmem*](https://pl.wikipedia.org/wiki/Homomorfizm) (nie
[*homeo*morfizmem](https://pl.wikipedia.org/wiki/Homeomorfizm)) *półgrup*, bo tak nazywamy posłanie
elementów jednej algebry w elementy drugiej z zachowaniem struktury tej pierwszej. Wtedy moglibyśmy
próbować zaspokoić to pragnienie korzystając z takiej definicji ...

```lean
-- Strasznie długie to słowo.
def Sg := Semigroup

-- To jest parametryczna definicja bycia homomorfizmem półgrup (a więc predykat).
def is_hom_sg (S : Sg α) (R : Sg β) (f : α → β) :=
  ∀ a b : α, f (S.op a b) = R.op (f a) (f b)
```

... ale to by nie było szczególnie satysfakcjonujące, prawda? No to próbujemy skorzystać, tym razem
*wewnątrz definicji*, z tego, na co pozwoliło nam zastosowanie komendy `infixl` ...

```lean
-- ... i widzimy od razu dwa problemy. Po pierwsze, Lean skarży się, że niepotrzebnie nazwaliśmy
-- pierwszy parametr, a przecież `op` użyte wzrostkowo ma odpowiadać `S.op` użytemu
-- przedrostkowo. Po drugie, nasze robocze rozwiązanie nie działa dla `R.op`.
def is_hom_sg' (S : Sg α) (R : Sg β) (f : α → β) :=
  ∀ a b : α, f (a op b) = R.op (f a) (f b)
```

A co powiesz na to?

```lean
-- Tworzymy nową przestrzeń nazw, bo w przestrzeni globalnej stała `Semigroup` jest już
-- zdefiniowana.
namespace z_klas--ą
-- (bo nie możemy używać w nazwach polskich znaków diakrytycznych {inaczej "polskich ogonków" [fr]})

class Semigroup (X : Type u) extends Mul X where
  assoc : ∀ a b c : X, (a * b) * c = a * (b * c)

variable [Semigroup X] [Semigroup Y]

def is_hom_sg_nice (f : X → Y) := 
    ∀ a b : X, f (a * b) = (f a) * (f b)

end z_klas--ą
```

Klasa?

## Co tu zaszło?

Zacznijmy od przeczytania kodu po ludzku, na razie pomijając definicję klasy `Semigroup`.

*Niech `X` i `Y` będą półgrupami. Funkcja `f`, posyłająca `X` w `Y`, jest homomorifizmem jeśli dla
każdego `a` i `b` należących do `X`, `f(a * b) = f(a) * f(b).`*

Ściśle kontrolowana wieloznaczność pojawia się już na samym początku, ponieważ (lokalne) zmienne `X`
i `Y` traktowawe są zarówno jako nazwy *półgrup*, które składają się ze zbioru/typu i pewnej
operacji, jak i jako nazwy *zbioru/typu elementów/termów* tych półgrup. Gdy nie korzystaliśmy z
mechanizmu klas, musieliśmy napisać, że `f` to funkcja posyłająca termy typu `α` w termy typu `β`,
gdzie półgrupami były nie te typy, tylko *rekordy* wyspecjalizowane na typach `α` i `β`. Słowo
"jeśli" jest tutaj użyte, jak to mają matematycy w zwyczaju (który nie bardzo lubię), w znaczeniu
*wtedy i tylko wtedy*, bo to jest *definicja* pojęcia homomorfizmu. Wreszcie, korzystamy z wygodnej
i użytecznej wieloznaczności symbolu `*`, na którą bez użycia klas typów Lean nie pozwala, ponieważ
w ciałach funkcji zdefiniowanych w Leanie nie można zrobić czegoś takiego, ...

```lean
def f (a b : α) : α :=
  match α with
  -- ... to znaczy, nie można napisać kodu, który działa różnie dla różnych typów:
  | Nat => a + b
  | String => a.append b
  | _ => a
  
-- I nie chodzi o wzorzec `_` w ostatniej linii, bo ...
def f' (h : (α = Nat) ∨ (α = String)) (a b : α) : α :=
  match α with
  -- ... błędy pojawiają się dopiero tutaj, ...
  | Nat => a + b
  | String => a.append b

-- ... a nie na poziomie specyfikacji typu funkcji `f'`, ponieważ w Leanie *możemy* mówić o równości
-- typów:
example : Nat = Nat := rfl
```

## Podstawy działania polimorfizmu ad-hoc w Leanie

Typy służą tylko do sprawdzania poprawności syntaktycznej. Klasy i ich instancje umożliwiają
obejście tego ograniczenia, ponieważ implementują polimorfizm *ad-hoc*, który pozwala (cytuję za
[Wikipedią](https://pl.wikipedia.org/wiki/Polimorfizm_(informatyka)#Polimorfizm_ad-hoc), 2025 07 27)
...

> ... dostarczyć kilku implementacji odpowiednich dla różnych typów, ale połączyć je w jeden
> interfejs, następnie używać tego interfejsu, a wybór najbardziej odpowiedniej implementacji
> pozostawić systemowi (kompilatorowi, systemowi czasu wykonania). Najczęściej chodzi tu o wybór
> algorytmu odpowiedniego do typów danych.

Klasy są znanymi Ci już typami rekordowymi, ale traktowanymi przez Leana w specjalny sposób, a
instancje klas to traktowane w specjalny sposób termy typów rekordowych. Klasy są wirtualnymi
interfejsami, a instancje są implementacjami tych interfejsów, czym akurat nie różnią się od typów
rekordowych i termów typów rekordowych. Tym, co sprawia, że klasy i instancje są mechanizmem
obsługującym *wieloznaczność*, jest *proces syntetyzowania* instancji, który polega na znajdywaniu
lub tworzeniu z odpowiednio powiązanych instancji takiej instancji (być może syntetycznej, to jest
skonstruowanej przez Leana), która pasuje do kontekstu.

A na czym innym miałby ten proces polegać? Użyteczna wieloznaczność to przecież dokładnie
*domyślanie się* (przeszukiwanie i ewentualna synteza) *znaczenia* (instancji) pewnego *sposobu
mówienia* (interfejs językowy), który ma więcej niż jedno znaczenie, na podstawie *kontekstu
użycia*. Na przykład, gdy mówimy, że zepsuł nam się zamek i nie możemy wejść do domu, od razu
wiadomo, że prawie na pewno chodzi o zamek w drzwiach, a nie o zamek w spodniach. Zwracam przy
okazji uwagę na wrażenie, które, przynajmniej we mnie, wywołuje:

*zamek w drzwiach lub zamek w spodniach* 

Jakby nam (?) migotały dwa sposoby użycia tego samego słowa, prawda? Jeden sposób to użycie słowa
"zamek" jako nazwy czegoś *pozajęzykowego*, ...

*zamek* (który jest) *w drzwiach lub w spodniach*

... drugi to użycie *metajęzykowe*:

(słowo) *zamek* (rozumiane jako coś, co może być) *w drzwiach i* (słowo) *zamek* (rozumiane jako
coś, co może być) *w spodniach*. 

Użycie metajęzykowe wygrywa, bo jest spójne z naszą wiedzą, ale myśląc o tym wyrażeniu nie mogę (czy
może nie może*my*?) mentalnie całkiem wyhamować użycia niemetajęzykowego i czasem mi nieznacznie
migoce. 

A wznosząc się jeszcze na poziom meta względem tej mety, czy domyślasz się, dlaczego w ogóle
zacząłem w tym kontekście myśleć o przykładach dotyczących posługiwania się na codzień językiem
naturalnym? Czasem, gdy natrafiam na czyiś pomysł, który, tak jak implementacja polimorfizmu ad-hoc
w Leanie, albo dajmy na to taka aksjomatyzacja pojęcia przyczynowości Pearla (sic!), wydaje mi się
sprytny i mi się podoba, próbuję znaleźć możliwie prosty *sposób wpadania* na *tego rodzaju*
pomysły. Mówiąc ogólnie, myślenie moim zdaniem zawsze polega do pewnego stopnia na *meta*refleksji i
na *dążeniu do algorytmizacji*. I nic w tym nie pomaga tak, jak *nauka języków*.

Wracamy na główną. W najprostszych sytuacjach polimorfizm ad-hoc działa w Leanie tak:

```lean
-- To nasz (wirtualny) interfejs (pewnego rodzaju) składania, który może być zaimplementowany w
-- różny sposób dla różnych typów.
class Zloz (α : Type u) where
  zloz (a b : α) : α

-- Składowa funkcja `zloz` (zauważyłaś od razu występującą tu wieloznaczność słowa "składowa"? {bo
-- mi to trochę zajęło}), która ma działać dla każdego typu `α`, tak jak *każde* pole tej klasy,
-- "domaga się" (w nawiasach *kwadratowych*) implementacji klasy `Zloz α`. Zapisany w nawiasach
-- kwadratowych parametr, tutaj `self : Zloz α`, jest zarazem *niejawny* i traktowany przez Leana w
-- specjalny sposób.
#check Zloz.zloz -- Zloz.zloz.{u} {α : Type u} [self : Zloz α] (a b : α) : α

-- Instancje nie muszą mieć nazw.
instance : Zloz Nat where
  zloz a b := a + b
-- Lean dodaje ten (tutaj akurat anonimowy) term do specjalnej listy instancji/termów rekordowych,
-- implementujących interfejs/klasę `Zloz`.

instance : Zloz String where
  zloz a b := a.append b

-- Nie chcemy poprzedzać nazwy `zloz` nazwą przestrzeni nazw `Zloz`, w której jest zdefiniowana (to
-- działa tak samo dla zwykłych rekordów i innych typów *danych*, pamiętasz?), więc otwieramy tą
-- przestrzeń nazw, przez co jej zawartość wysypuje się na (tutaj globalny) wierzch.
open Zloz

-- Ponieważ składowa/funkcja `zloz` domaga się (`[ ... ]`) instancji klasy `Zloz`, która może
-- obsłużyć typ jej argumentów (tutaj `Nat`), Lean widząc taki kod szuka pasującej instancji,
-- zaczynając od tych zdefiniowanych ostatnio w znaczeniu w najbliższym *miejscu* w kodzie (a nie
-- ostatnio w znaczeniu najbliżej w czasie) szukając wstecz. Jeżeli znajdzie pasującą instancję
-- implementującą interfejs klasy `Zloz`, to ją stosuje. W tym wypadku znajduje instancję, która
-- implementuje interfejs klasy `Zloz` dla typu `Nat`, czyli tylko jedyną składową `zloz`, jako
-- dodawanie liczb naturalnych.
#eval zloz 2 3     -- 5

-- W tym przypadku Lean znajduje implementację składania dla typu `String`.
#eval zloz "2" "2" -- "22"

-- Możemy definiować kolejne instancje dla *tego samego* typu, a mówiąc ogólnie dla tego samego
-- *wzorca* charakteryzującego *kontekst użycia* (możemy w tym miejscu zaszaleć, ale o tym innym
-- razem), ...
instance : Zloz Nat where
  zloz a b := a * b

-- ... i takie nowe implementacje będą obowiązywały *od miejsca ich zdefiniowania*: Gdy kursor jest
-- na komendzie `#eval` poniżej, widzimy wynik `6`, który jest rezultatem zastosownia implementacji
-- `Zloz.zloz` jako mnożenia, gdy natomiast kursor jest na przedostatniej komendzie `#eval`, widzimy
-- nadal wynik `5`, który jest rezultatem dodawania.
#eval zloz 2 3     -- 6
```

## Tekst służy do myślenia i działania, myślenie jest działaniem, działanie jest myśleniem, więc działanie służy do pisania i czytania

To jest szczególny przypadek *wieloznaczności hipotetycznej*:

```lean 
namespace na_nowo

class Semigroup (X : Type u) extends Mul X where
  assoc : ∀ a b c : X, (a * b) * c = a * (b * c)

class Monoid (X : Type u) extends Semigroup X, One X where
  one_mul : ∀ x : X, 1 * x = x
  mul_one : ∀ x : X, x * 1 = x
```

Dziedziczenie z klasy `Mul` daje interfejs w postaci hipotetycznego działania binarne o nazwie
`mul`, które można zapisywać wzrostkowo jako `*`. W tym momencie (pliku) to działanie jest czysto
hipotetyczne, ponieważ w historii tego świata nie pojawiła się jeszcze żadna instancja klas
`Semigroup` i `Monoid`. Przedtem nazywałem to działanie `op`, ale jak wiesz, brzmienie nazwy nie ma
znaczenia.

Dziedziczenie z klasy `One` daje interfejs w postaci hipotetycznego elementu wyróżnionego o nazwie
`one`, który możemy oznaczać za pomoccą symbolu `1`.

Ponieważ działanie nazywa się teraz `mul`, zmieniłem odpowiednio nazwy własności bycia jednostką na
`one_mul` i `mul_one`.

```lean
theorem one_u_neat [Monoid X] (x : X) :

  (∀ v : X, x * v = v ∧ v * x = v) → x = 1 :=

  by
  intro h1
  have h2 := h1 1
  have h3 := h1 x
  have h4 := Eq.symm (Monoid.one_mul x)
  calc 
    x = 1 * x := h4
    _ = 1     := h2.right
```

Chociaż nie istnieją jeszcze żadne monoidy, możemy tworzyć *konstruktywne* dowody twierdzeń, które
ich dotyczą. Konstruktywność dowodu polega na interpretacji pojęcia prawdziwości zdania jako
istnienia dowodu tego zdania, a nie na istnieniu termów zamieszkujących typy, o których mówią coś
dowodzone konstruktywnie zdania.

Dowód twierdzenia `one_u_neat` sformatowałem w ten nowy sposób, bo wydał mi się bardziej elegancki i
czytelny. Skonstruowałem go tak a nie inaczej, żeby ułatwić czytanie dowodu ze zrozumieniem poprzez
interakcję z Leanem. Na przykład, domyślenie się, jakim zdaniem jest aplikacja `h1 1` nie jest
szczególnie trudne, ale można skorzystać z kontekstu, żeby to zdanie mieć cały czas przed oczami i
poczuć dzięki temu kojącą prostotę tego kroku dowodu.

Odwrócenie równania za pomocą `Eq.symm` też nie jest skomplikowanym przekształceniem, ale trzeba
wiedzieć, że potrzebne równanie nosi nazwę `Monoid.one_mul`. Tworzenie hipotezy pomocniczej `h4`
pozwala łatwo rozwiązać ten problem pisząc tylko `Monoid.`, naciskając Tab i szukając
(hipotetycznego) dowodu równania na liście kontynuacji.

Hipotez pomocniczych `h2`-`h4` nie stworzyłem na początku, tylko później, na podstawie tego, czego w
jakimś momencie, gdy byłem "niżej" w konstrukcji dowodu, domagał się Lean.

Podobnie, możemy konstruktywnie udowodnić w ten sposób twierdzenie, że istnieje element neutralny
monoidu, chociaż nie ma jeszcze żadnego monoidu. To jest możliwe, ponieważ parametrem tego
twierdzenia jest hipotetyczny monoid i dowodzone zdanie dotyczy tego hipotetycznego termu.

```lean
theorem the_one_exists [Monoid X] :

  ∃ x : X, ∀ v : X, x * v = v ∧ v * x = v :=
  
  by
  apply Exists.intro
  intro v
  apply And.intro
  rename_i M
  apply M.one_mul
  rename_i M
  exact M.mul_one v

end na_nowo
```

## No już niech Ci będzie. Ale jak działa `Mul`?!

Na zniechętę do samodzielnej eksploracji znakomitych książek na temat programowania i dowodzenia w
Leanie dostępnych online, spróbuję objaśnić, jak dokładnie działa przeciążenie gwiazdki w obcym mi
[stylu powściągliwym](https://youtu.be/qwj52Wc_y4k?si=uRE8U3Lc5cJmSDlD):

Klasa `HMul` to interfejs operacji na dowolnych dwóch, niekoniecznie takich samych typach, która
może zwracać rezultat jeszcze innego typu:

```lean
class HMul (α : Type u) (β : Type v) (γ : outParam (Type w)) where
  hMul : α → β → γ
```

Specjalne oznaczenie parametru oznaczającego typ *wyniku* jako `outParam` mówi Leanowi, żeby
szukając pasującego znaczenia (to jest instancji) słowa `hMul` (to jest pola klasy `HMul`)
uwzględniał również wynikający z kontekstu użycia typ rezultatu. Czasami okazuje się, że
uwzględnienie tej informacji jest konieczne do znalezienia znaczenia.

W pliku Prelude.lean zdefiniowana jest również następująca instancja tej klasy, ...

```lean
instance instHMul [Mul α] : HMul α α α where
  hMul a b := Mul.mul a b
```

... która "mówi" Leanowi, że jeśli trafi na przypadek aplikacji `hMul` do dwóch argumentów tego
samego typu, której rezultat jest również tego typu, ma traktować taką aplikację jako aplikację pola
`mul` klasy `Mul`. W momencie, w którym taka aplikacja *ma być ewaluowana*, a nie tylko sprawdzana
pod względem poprawności składniowej albo logicznej, co w teorii typów jest tym samym, Lean szuka
więc pasującej do kontekstu użycia instancji klasy `Mul`.

Osateczny rezultat jest taki, że symbol `*` ma w pewnym sensie *jedno* znaczenie, ale tym znaczeniem
nie jest teoriotypowy term, tylko pole `hMul` *abstrakcyjnego interfejsu* `HMul`. Takim interfejsom,
które nazywamy klasami, można *dodawać różne znaczenia*, a nie tylko *nadawać jedno znaczenie*, jak
ma to miejsce w przypadku zwykłych definicji. Znaczeniami są pewne implementacje językowe, które
nazywamy instancjami i których wybór lub konstrukcja, następujące *tylko* wtedy, gdy danego rodzaju
znaczenie musi "działać obliczeniowo" w ramach ewaluacji, jest automatyczny i zdeterminowany przez
kontekst użycia interfejsu.

### Przypisy

[^1]: Wiesz, że musiałem.

[^2]: Zarówno w znaczeniu *przede wszystkim* jak i *w sposób doskonały*, o czym będziemy mówić
    znacznie później.
