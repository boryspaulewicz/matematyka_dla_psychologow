<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie

# ⬝⬝⬝ a potem rekordowo i z klasą

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
#check lewy_element -- `lewy_element.{u_1, u_2} {α : Type u_1} {β : Type u_2} (x : α × β) : α`
```

... ale tym aspektem nie będziemy się zajmować. Na wypadek, gdyby Ci się to jeszcze dobrze nie
wdrukowało, przypominam, że gdy w definicjach wpisujemy parametry o niezadeklarowanych typach, tak
jak to robimy tutaj z parametrami `α` i `β`, Lean próbuje się domyślić, jakiego typu mają to być
parametry i jeśli mu się uda, dodaje je w odpowiednim miejscu do definicji jako parametry
niejawne. Tutaj domyślił się, że to mają być typy dowolnego sortu.

Jak to działa (ilustracja)?

```lean
-- Jeśli pozwolisz, najpierw skrócę zapis.
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
polimorficzna, bo przynajmniej jeden typ jest parametrem, a z drugiej strony trudno powiedzieć,
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

Byłbym zapomniał, że mamy jeszcze połączenie tych dwóch ostatnich rodzajów rzekomej wieloznaczności
w postaci typów *zależnych*, takich jak typ uogólnionej identyczności, ...

```lean
#check id -- id.{u} {α : Sort u} (a : α) : α
```

... w których typ (tutaj `α`) może być zarówno (tutaj niejawnym) parametrem *funkcji* jak i
parametrem *specyfikacji typu* (tutaj ostatniego argumentu i rezultatu aplikacji
identyczności). Wychodzi więc na to, że "zależnotypowość" to ... polimorficzna polimorficzność. Ale
z taką bardziej jadowitą i płodną wieloznacznością nawet polimorficzny polimorfizm zależnotypowości
nie ma za wiele wspólnego.

Z tego rodzaju polimorfizmu korzystałaś wielokrotnie i nie trzeba było dotąd szukać innych sposobów
pisania funkcji, które mogą przyjmować argumenty różnych typów. A nie było takiej potrzeby dokładnie
dlatego, że pisaliśmy funkcje polimorficzne, których *ciała "działały" tak samo dla każdego typu*,
czyli jednorodnie. Tak jak funkcja `lewy_element`, która stosuje będące funkcją pole o nazwie `fst`,
w które to pole wyposażona jest każda para, niezależnie od typu pierwszego i typu drugiego elementu.

Mogłem również, mając na myśli funkcję `fst`, zamiast *w które to pole wyposażona jest każda para*,
napisać *która to funkcja działa dla termów każdego typu produktowego*, ponieważ różnica między
*strukturą* (termów typów produktowych) i *funkcjonalnością* jako funkcyjnym interfejsem jest tutaj
*celowo zatarta*:

```lean
def para : Nat × Nat := ⟨2, 1⟩

-- To wygląda tak, jakbyśmy *wymieniali z nazwy część struktury* pary, ...
#eval para.fst

-- ... to tak nie wygląda, ...
#eval Prod.fst para

-- ... a oba fragmenty kodu różnią się tylko *notacją*.
```

To zjawisko można nazwać wieloznacznością w tym znaczeniu, że *różne* sposoby *mówienia* czy
*pisania* mają tutaj *to samo znaczenie*; nie w tym znaczeniu, że *ten sam zapis* ma *różne
znaczenia*. Poza tym mechanizm "redukcji" jest w tym przypadku *metajęzykowy*; to nie jest
funkcjonalność wbudowana w język teorii typów, tylko dostępne w Leanie udogodnienie dotyczące
notacji. Jest to więc inny rodzaj wieloznaczności niż ten, który pojawia się na przykład w tym
akapicie i dotyczy akurat ... "wieloznaczności"[^1].

A z drugiej strony taki sam (zawsze wszystko ma `n`-tą stronę, dla dowolnego `n`!). Zresztą, dodatki
do teorii typów, które są w Leanie, to z jednej strony dodatki, a z drugiej Lean to przecieć pewna
całkowicie sformalizowana, bo *zapisana jako kod* w jakiś językach programowania, *wersja* teorii
typów, a żadnej jedynej słusznej wersji teorii typów nie ma i nigdy nie będzie.

O wieloznaczności widocznej w ostatnim fragmencie kodu można by niemal powiedzieć, że to jest taki
"dualny" odpowiednik "zwykłej" wieloznaczności, bo ta "zwykła" dotyczy wielości znaczeń tego samego
symbolu, słowa, czy wyrażenia, a więc wielości po *prawej* stronie relacji oznaczania, a ta
"notacyjna" dotyczy wielości *o*znaczeń, a więc wielości po *lewej* stronie relacji oznaczania. Z
tej perspektywy (albo w tym znaczeniu!) matematyka stosowana polega bardzo często na ustalaniu że,
albo korzystaniu z tego że - zachodzi jakiś przypadek tej "dualnej" wieloznaczności, to jest `f(x,
y, z, ...) = g(u, v, w, ...)`, czyli *pewne dwa zapisy oznaczają to samo*. Bo przecież rozstrzyganie
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
teoriomnogościowych, a z drugiej pozwala "uchwycić" funkcjonalność "w" strukturze (strzałek) ze
względu na (matematyczną) funkcję (!) składania składalnych strzałek. Uff.

Bawiąc się terminologią, punktami widzenia i znaczeniami próbuję Ci (nomen omen) unaocznić między
innymi to, że wieloperpsektywiczność i wieloznaczność to fundamentalne i potężne, ale też trudne w
obsłudze, czasem wręcz przyprawiające o [zawrót
głowy](https://youtu.be/PGNiXGX2nLU?si=iRBLIQjw40NBPFBl) narzędzia myślenia. Dlatego tak bardzo
chcemy poznać różne postaci polimorfizmu (pun intended) i chcemy wiedzieć, jak dokładnie działają. I
dzięki temu może nawet wykombinować, przyglądając się jasno opisanym przykładom, jak jeszcze mogłyby
działać.

W tym celu na początek (*teraz* jest początek?! \{ale o co chodzi? przecież początek jest
*zawsze*\}) przypomnę naszą małą hierarchię algebr abstrakcyjnych, którą zakodowaliśmy korzystając z
mechanizmu dziedziczenia struktur:

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

Gdybyśmy mieli ochotę, zamiast pisać w notacji przedrostkowej `(op (op a b) c)`, pisać w notacji
wzrostkowej na przykład `((a op b) op c)`, moglibyśmy spróbować to zrobić tak:

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

-- Lean nie sygnalizuje błędu.
#check (a op b) op c

-- Nadal możemy tak pisać, ale kto by tak teraz chciał?
#check S.op (S.op a b) c

-- Czy widzisz, o ile łatwiejsza do "parsowania" jest pierwsza wersja? A czy przeczuwasz, jakie to
-- może mieć znaczenie dla łatwości i (nieosiągalnej, ale zawsze można próbować ją przybliżać)
-- niezawodności myślenia o takich zapisach lub za ich pomocą?
```

## Jak to robią osoby zawodowcze

Żeby przekonać się, czy zrobiliśmy jakieś postępy w formalizacji użytecznych mechanizmów
wieloznaczności, będziemy się znowu przyglądać praktykom ludzi, których zawód polega na arbitralnie
abstrakcyjnym, konsekwentnym i skutecznym myśleniu z dowolnych punktów widzenia na dowolny
temat. Czyli znowu będziemy przyglądać się temu, *jak mówią matematycy*. I znowu wystarczy nam rzut
oka na krótkie fragmenty, które pojawiają się często na początku pierwszych rozdziałów, takie jak
ten:

*Niech `f : ℕ → ℤ` będzie inkluzją liczb naturalnych w zbiorze liczb całkowitych `f(n) = n`. Wtedy
`f(m + n) = f(n) + f(m)`,*

Zaczniemy od prerekwizytów. Napotykamy tutaj (ponownie?) słowo "inkluzja" i domyślamy się, że to
każda funkcja z *podzbioru* (tutaj `ℕ`) do (niekoniecznie większego) zbioru zawierającego (tutaj
`ℤ`), wyrażająca fakt bycia elementem nadzbioru dla każdego elementu podzbioru. *Funkcja* `f` wyraża
więc albo ucieleśnia sobą to samo, co mówi *stwierdzenie*, że każda liczba naturalna jest (ponieważ
to są różne zbiory i typy, to tak naprawdę w pewien sposób *utorzsamialna* z odpowiadającą jej w
oczywisty sposób) liczbą całkowitą.

Na końcu pojawia się coś, co mam wrażenie może wyglądać jednocześnie banalnie i dezorientująco, to
jest stwierdzenie faktu *zachowywania operacji dodawania przez funkcję `f`*:

`f(m + n) = f(n) + f(m)`

Inne względnie adekwatne sposoby mówienia o takich zjawiskach to *respektowanie* albo *zgodność z*
(tutaj "`f`-oznaczania" z dodawaniem). Takie zjawiska staną się dla nas niebawem ważne, więc może
dobrze będzie już teraz zacząć im się ostrożnie przyglądać.

Wygląda na to, że mamy dwie operacje: jednoargumentową `f` i dwuargumenetową `+`. Ale to nieprawda,
bo dodawanie liczb naturalnych to jedno, a dodawanie liczb całkowitych, nawet jeśli jest bardzo
blisko związane z tym pierwszym, to co innego. Czyli mamy *trzy* operacje, a nie dwie, zgadza się?
Też nie.

Dodawanie jest działaniem dwuargumentowym, a więc musimy albo skorzystać z curryingu, albo z
produktu `ℕ × ℕ`. To "bardziej matematyka niż programowanie" (chociaż, jak wiesz, to jest to samo),
więc skorzystamy z produktu:

```
⟨m, n⟩ ↦    m + n     ↦  f(m + n)   =: X

⟨m, n⟩ ↦ ⟨f(m), f(n)⟩ ↦ f(m) + f(n) =: Y

X = Y
```

(Ten sposób oznaczania *przemienności diagramu* \{przepraszam, ale na jakiś czas zostawię Cię na tym
pochmurnym pikniku pod wiszącą zagadką\} wymyśliłem przed
chwilą i jeszcze nie wiem, czy będę go stosował)  

Nie przypomina Ci to trochę "nieinteraktywnego przeplatania się oznaczania, produktowania i
odwracania par" (ten sposób mówienia też wymyśliłem, dlatego wypada mi zawrzeć całość w cudzysłowie,
gdy wprowadzam go w nowym rozdziale), któremu przyglądliśmy się w jednym z poprzednich rozdziałów?

```
⟨a, b⟩ ↦ ⟨f(a), g(b)⟩ ↦ ⟨g(b), f(a)⟩ =: X

⟨a, b⟩ ↦    ⟨b, a⟩    ↦ ⟨g(b), f(a)⟩ =: Y

X = Y
```

W obydwu przypadkach rozkład na procesy (albo funkcje, przekształcenia, morfizmy, mapy,
odwzorowania, czy strzałki) składowe pozwala zobaczyć coś w rodzaju *zgodnego przeplatania się*
różnego rodzaju procesów, prawda? No i trudno to zobaczyć bez wystarczająco daleko idącej
formalizacji. No więc operowanie tego rodzaju zjawiskami staje się szybko wyraźnie bardziej
uciążliwe i dezorientujące jeśli nie korzystamy z przeciążenia oznaczeń operacji, takiego jak
zastosowane wyżej przeciążenie symbolu `+`.

CDN

### Przypisy

[^1]: Wiesz, że musiałem.

[^2]: Zarówno w znaczeniu *przede wszystkim* jak i *w sposób doskonały*, o czym będziemy mówić
    znacznie później.
