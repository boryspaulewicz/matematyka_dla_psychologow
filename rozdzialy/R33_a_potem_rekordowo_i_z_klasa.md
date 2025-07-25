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

Z tego rodzaju polimorfizmu korzystałaś wielokrotnie i nie trzeba było dotąd szukać innych sposobów
pisania funkcji, które mogą przyjmować argumenty różnych typów. A nie było takiej potrzeby dokładnie
dlatego, że pisaliśmy funkcje polimorficzne, których *ciała "działały" tak samo dla każdego typu*,
czyli jednorodnie. Tak jak funkcja `lewy_element`, która stosuje będące funkcją pole o nazwie `fst`,
w które to pole wyposażona jest każda para, niezależnie od typu pierwszego i typu drugiego elementu.

Mogłem również napisać, mając na myśli funkcję `fst`, *która to funkcja działa dla termów każdego
typu produktowego*, ponieważ różnica między *strukturą* (termów typów produktowych) i
funkcjonalnością jako funkcyjnym interfejsem jest tutaj zatarta:

```lean
def para : Nat × Nat := ⟨2, 1⟩

-- To wygląda tak, jakbyśmy *wymieniali z nazwy część struktury* pary, ...
#eval para.fst

-- ... to tak nie wygląda, ...
#eval Prod.fst para

-- ... a oba fragmenty kodu różnią się tylko *notacją*.
```

Można to nazwać wieloznacznością w tym znaczeniu, że *różne* sposoby *mówienia* czy *pisania* mają
tutaj *to samo znaczenie*; nie w tym znaczeniu, że *ten sam zapis* ma *różne znaczenia*. Poza tym
mechanizm "redukcji" jest w tym przypadku *metajęzykowy*; to nie jest funkcjonalność wbudowana w
język teorii typów, tylko dostępne w Leanie udogodnienie dotyczące notacji. Jest to więc inny rodzaj
wieloznaczności niż ten, który pojawia się na przykład w tym akapicie i dotyczy akurat
"wieloznaczności"[^1].

A z drugiej strony taki sam. Zresztą, dodatki do teorii typów, które są w Leanie, to z jednej strony
dodatki, a z drugiej Lean to pewna *wersja* teorii typów, i przecież nie ma i nigdy nie będzie
jedynej słusznej wersji tej teorii.

O wieloznaczności widocznej w ostatnim fragmencie kodu można by niemal powiedzieć, że to jest taki
jakby dualny odpowiednik "zwykłej" wieloznaczności, bo ta ostatnia dotyczy wielości znaczeń tego
samego symbolu czy słowa, a więc wielości po *prawej* stronie relacji oznaczania, a ta "notacyjna"
dotyczy wielości *o*znaczeń, a więc wielości po *lewej* stronie relacji oznaczania. Z tej
perspektywy (albo w tym znaczeniu!) matematyka stosowana polega bardzo często na ustalaniu że, albo
korzystaniu z tego że - zachodzi jakiś rodzaj "dualnej wieloznaczności", to jest `f(x, y, z, ...) =
g(u, v, w, ...)`, czyli *pewne dwa zapisy oznaczają to samo*. Bo przecież rozstrzyganie prawdziwości
takich zdań ma charakter mechaniczny, bo może mieć, a ma charakter mechaniczny, ponieważ ma
charakter syntaktyczny, bo może mieć, bo całą matematykę można zakodować w teorii typów.

Słowo znaczenie też jest wieloznaczne, w dodatku w sposób, który jest w tej książce bardzo ważny. Z
jednej strony znaczenie to denotacja, na przykład gdy mówimy wskazując na jajko "to jajko",
znaczeniem jest (tam) to jajko. Z drugiej strony, znaczenie to tak lub inaczej rozumiana rola, a z
trzeciej znaczenie to konsekwencje wynikające z. W dodatku bawimy się tutaj bliskoznacznością
*znaczenia* i *punktu widzenia* (na znaczenie znaczenia). No i znaczenie to także sposób użycia.

A w tej książce mam często problem ze słowem "funkcja". Funkcja jako przyporządkowanie lub metoda
przyporządkowania lub własność to jedno, a funkcja jako rola (na przykład, psychologowie mówią
czasem, że "funkcją uwagi jest selekcja informacji ...") to co innego. Słowa "funkcjonalność" używam
w dwóch, blisko związanych znaczeniach, jako oznaczającego interfejs złożony z funkcji i jako
oznaczającego "rolowość" (bo czemu nie?). No i jest jeszcze funkcjonalność wyrażalna w języku
kategoryjnym, która z jednej strony polega na mówieniu językiem, którego "jądrem" jest algebra
funkcji, bo ten język powstał przez wyabstrachowanie działania składania funkcji
teoriomnogościowych, a z drugiej pozwala "uchwycić" funkcjonalność "w" strukturze (strzałek) ze
względu na (matematyczną) funkcję (!) składania składalnych strzałek. Uff.

Bawiąc się terminologią i znaczeniaimi próbuję Ci unaocznić między innymi to, że
wieloperpsektywiczność i wieloznaczność to fundamentalne i potężne, ale też trudne w obsłudze
narzędzia myślenia. Dlatego tak bardzo chcemy poznać różne postaci polimorfizmu (pun intended) i
chcemy wiedzieć, jak dokładnie działają lub mogą działać.

W tym celu na początek (*teraz* jest początek?!) przypomnę naszą małą hierarchię algebr
abstrakcyjnych, którą zakodowaliśmy korzystając z mechanizmu dziedziczenia struktur:

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

-- Ta liczba po dwukropku to *priorytet*. Nie warto się tym przejmować zanim nie przyjdzie taka
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
-- ma znaczenie dla łatwości i (nieosiągalnej, ale zawsze można próbować ją przybliżać)
-- niezawodności myślenia o takich zapisach lub za ich pomocą?
```

TODO ograniczenia jednoznaczności

### Przypisy

[^1]: Wiesz, że musiałem.
