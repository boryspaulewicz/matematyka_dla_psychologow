## O czym teraz będzie

Czytając ten rozdział pamiętaj proszę, że jeżeli to, o czym będę tu mówił, wyda Ci się na razie zbyt
skomplikowane, to nie masz się czym przejmować. *Implementacja* koniunkcji *nie ma znaczenia*; ważne
jest tylko to, jak koniunkcja *działa*. A mówiąc dokładniej, ostatecznie liczy się tylko to, jak
możemy *używać* koniunkcji w dowodach, co już jak sądzę całkiem dobrze zrozumiałaś czytając rozdział
poprzedni.

Wywiązuję się tu z obietnicy, że wszystko w matematyce można zrobić ze strzałek (albo funkcji) i
jednocześnie przybliżam pewien szczególny sposób myślenia, który stanie się ważny w rozdziale
następnym. Pod koniec zaglębiam się również w szczegóły implementacji, które pozwalają modyfikować
składnię, umożliwiając między innymi stosowanie standardowych symboli logicznych zgodnie z
powszechnie przyjętymi konwencjami, takimi jak na przykład infiksowy (inaczej *wzrostkowy*) zapis
koniunkcji czy prefiksowy (inaczej *przedrostkowy*) zapis negacji.

<hr>

# ∧ 2

Jeżeli `p` i `q` to zdania, to `p ∧ q` jest również zdaniem, które odczytujemy jako `p` i
`q`. Symbol koniunkcji uzyskasz wpisując `\and`. Podobnie jak implikacja, koniunkcja jest więc
operatorem dwuargumentowym, który z dwóch dowolnych zdań tworzy pewne zdanie złożone (mówimy też
czasem, że tworzy pewną złożoną formułę logiczną).

Implikacja jako typ funkcyjny albo po prostu strzałka jest w naszym języku pojęciem pierwotnym. Jak
pisałem w jednym z rozdziałów wprowadzających, (prawie) wszystko, czego będziemy potrzebować,
skonstruujemy właśnie ze strzałek, a w tym wypadku strzałek jako funkcji. Dotyczy to również
*definicji koniunkcji*. Zaczniemy jednak od *reguł dedukcji* dla koniunkcji, to jest od reguły
*wprowadzenia* koniunkcji (czyli sposobu uzyskania jej w dowodach) i *dwóch* reguł *eliminacji*
koniunkcji (czyli sposobu użycia albo "zużycia" koniunkcji w dowodach). Reguła wprowadzenia jest mam
nadzieję oczywista.

Jeżeli *A* i *B* to zdania, to:

<ins><em>A, B</em></ins>  
*A ∧ B*

**Czytamy to**: Jeżeli w trakcie wyprowadzania dowodu akceptujemy zdanie *A* i zdanie *B* (dla nas
to znaczy: gdy mamy dowody tych dwóch zdań), to akceptujemy zdanie *A ∧ B* (to możemy uzyskać dowód
zdania *A ∧ B*).

A oto dwie reguły eliminacji, które nie wymagają chyba komentarza.

Jeżeli *A* i *B* to zdania, to:

<ins><em>A ∧ B</em></ins>  
*A*

<ins><em>A ∧ B</em></ins>  
*B*

Jak mogłaby wyglądać definicja koniunkcji w naszej logice skonstruowana tylko za pomocą strzałek i
funkcji? Można powiedzieć, że jeżeli `p` i `q` to dowolne zdania, to *sensem* zdania `p ∧ q` są
*dokładnie te zdania, które wynikają z łącznej prawdziwości zdań `p` i `q`*. Do tego *sensu*,
rozumianego jako pewnego rodzaju zbiór (albo typ), należałyby więc (zamieszkiwałyby go) przynajmniej
zdania `p`, `q`, jak również zdanie `p ∧ q`, bo przecież każde zdanie wynika z siebie samego jako
przesłanki. Zacznę krótko, a potem będę to na różne sposoby (dosłownie) rozwijał i (również
dosłownie) przybliżał.

```lean
def and (p q : Prop) : Prop := ∀ r : Prop, (p → q → r) → r
```

**Czytamy to**: Koniunkcja zdań `p` i `q` jest zdaniem (`: Prop`), którego dowód pozwala uzyskać
dowód każdego zdania (`∀ r : Prop, ... → r`) które wynika łącznie ze zdań `p` i `q` (`(p → q → r)
...`).

Albo tak: koniunkcja zdań `p` i `q` to takie zdanie, a więc taki typ, że dowód tego zdania, a więc
term tego typu, dostarcza dowód dokładnie takich zdań, które wynikają ze zdania `p` i ze zdania `q`.

Albo tak: Jeżeli zdanie `p ∧ q` jest zdaniem prawdziwym (czyli ma dowód), to *każde* zdanie `r`,
które wynika z *łącznej* prawdziwości zdań `p` i `q` też jest zdaniem prawdziwym i odwrotnie, jeżeli
*każde* zdanie `r`, które wynika stąd, że `p` jest zdaniem prawdziwym *i jednocześnie* `q` jest
zdaniem prawdziwym jest również zdaniem prawdziwym, to `p ∧ q` jest zdaniem prawdziwym.

Teraz pozostaje nam tylko wyrazić tą specyfikację (zapisaną na kilka sposobów!) w języku naturalnym
w kategoriach dowodów i zdań, a następnie zakodować ją w języku teorii typów.

Jeżeli `p` i `q` to zdania, to dysponować dowodem `k` koniunkcji `p ∧ q` *znaczy to samo* (a więc
podamy teraz definicję *typu takiego dowodu*), co dysponować taką funkcją albo programem, która dla
każdego takiego zdania `r`, że jeżeli *`p` jest prawdziwe i `q` jest prawdziwe* to `r` jest
prawdziwe, dostarcza dowód `r`. Albo trochę inaczej, korzystając z faktu, że możliwość stworzenia
pewnego rezultatu (tutaj dowodu `r`) posługując się *dwoma argumentami* (tutaj dowodami zdań `p` i
`q`) można zapisać jako możliwość stworzenia tego rezultatu z pierwszego argumentu i *funkcji, która
z drugiego argumentu tworzy ten rezultat* (a więc currying):

Dysponować dowodem `k` koniunkcji `p ∧ q` ...

```lean
k : p ∧ q
```

... znaczy to samo, co dysponować taką funkcją, która dla każdego takiego zdania `r`, ...

```lean
k : ∀ r : Prop, ...
```

... że jeżeli `p` jest prawdziwe, *to jeżeli `q` jest prawdziwe* (currying) to `r` jest prawdziwe,
...

```lean
k : ∀ r : Prop, (p → q → r)
```

... dostarcza dowód `r`:

```lean
k : ∀ r : Prop, (p → q → r) → r
```

I tak oto znaleźliśm (ponownie) "strzałkową" definicję koniunkcji. Jeszcze trochę inaczej, po raz
kolejny zapisując definicję koniunkcji jako zdania / typu:

```lean
-- Każda koniunkcja (and p q, gdzie p : Prop i q : Prop) jest zdaniem (: Prop), którego dowód (a więc funkcja) 
-- dla każdego zdania (r : Prop) pozwala uzyskać dowód tego zdania (... → r) z dowodu, że to zdanie wynika z
-- łącznej prawdziwości zdań będących członami tej koniunkcji ((p → q → r)):
def and (p q : Prop) : Prop := ∀ r : Prop, (p → q → r) → r
```

Będzie chyba najlepiej, jeśli zapoznasz się z mechaniką działania tej definicji w praktyce. Niemal
do samego końca nie będę w tym rozdziale stosował oficjalnego symbolu koniunkcji, to jest będę pisał
`and p q` zamiast `p ∧ q`, żeby nie wprowadzać za wcześnie tych elementów języka, które na takie
zmiany w notacji pozwalają.

```lean
--- Niech dowod_koniunkcji_ab będzie dowodem koniunkcji zdań a i b:
variable (a b : Prop)
variable (dowod_koniunkcji_ab : and a b)
```

Żeby się przekonać, że nasza definicja koniunkcji *działa* zgodnie z oczekiwaniami, zdefiniujemy
najpierw dwie funkcje, które każdy dowód koniunkcji przekształcają odpowiednio w dowód pierwszego i
drugiego członu tej koniunkcji, czyli implementują obie reguły eliminacji dla koniunkcji. Trzymając
się obowiązujej w Leanie konwencji nazwiemy je `left` i `right`.

```lean
def left (p q : Prop) (k : and p q) : p :=
  k p (fun (hp : p) => fun (hq : q) => hp)

-- (ilustracja) Oto jak działa funkcja left. Ponieważ dowod_koniunkcji_ab ma typ ...
and a b

-- ... to ma też typ (rozpakowujemy stałą and) ...
(fun (p : Prop) => fun (q : Prop) => ∀ r : Prop, (p → q → r) → r) a b

-- ... a to jest to samo, co to (odczepiamy ciało i podstawiamy a) ...
(fun (q : Prop) => ∀ r : Prop, (a → q → r) → r) b

-- ... a to jest to samo, co to (odczepiamy ciało i podstawiamy b) ...
∀ r : Prop, (a → b → r) → r

-- A więc to ...
dowod_koniunkcji_ab : and a b
-- .. znaczy dla Leana to samo, co to:
dowod_koniunkcji_ab : ∀ r : Prop, (a → b → r) → r
```

Zwracam uwagę, że nie po raz pierwszy spotykamy się tutaj z typem zapisanym w postaci aplikacji
(tutaj `and a b`). Typami (zdaniowymi) są przecież również wszelkie aplikacje predykatów (do termów
odpowiedniego typu). Również nie po raz pierwszy mamy do czynienia z typem zapisanym jako aplikacja,
*którą można zredukować* (ewaluując), bo przecież w podobny sposób używaliśmy pełniącej rolę
cukierniczą (albo "lukracyjną") funkcji `Predykat`, aplikując ją do odpowiednich termów i dzięki
temu uzyskując odpowiednie typy (a konkretnie zdania będące naszym modelem struktury
podmiot-orzeczenie) jako rezultaty tych aplikacji. Kontynuując:

```lean
-- Wobec tego to ...
left a b dowod_koniunkcji_ab

-- ... znaczy to samo, co to (rozpakowanie stałej left) ...
(fun (p : Prop) => fun (q : Prop) => fun (k : and p q) =>
    k p (fun (hp : p) => fun (hq : q) => hp)) a b dowod_koniunkcji_ab

-- .. znaczy to samo, co to (odczepienie ciała i podstawianie a) ...
(fun (q : Prop) => fun (k : and a q) =>
    k a (fun (hp : a) => fun (hq : q) => hp)) b dowod_koniunkcji_ab

-- ... znaczy to samo, co to (odczepienie ciała i podstawienie b) ...
(fun (k : and a b) =>
    k a (fun (hp : a) => fun (hq : b) => hp)) dowod_koniunkcji_ab

-- znaczy to samo, co to (odczepienie ciala i podstawienie dowod_koniunkcji_ab) ...
dowod_koniunkcji_ab a (fun (hp : a) => fun (hq : b) => hp)

-- ... a ponieważ (obliczenie na poziomie typu aplikacji dowod_koniunkcji_ab a) ...
dowod_koniunkcji_ab a : (a → b → a) → a

-- ... jak również w tym kontekście ...
(fun (hp : a) => fun (hq : b) => hp) : (a → b → a)

-- ... to ten term ma typ a, czyli jest dowodem zdania a:
dowod_koniunkcji_ab a (fun (hp : a) => fun (hq : b) => hp) : a
```

Naprawdę nie wiem, czy pomogłem. Funkcja `right` działa podobnie:

```lean
def right (p q : Prop) (k : and p q) : q :=
    k q (fun (hp : p) => fun (hq : q) => hq)
```

To może jeszcze tak: Gdy mamy dowód `k` zdania `p ∧ q`, czyli term typu `∀ r : Prop, (p → q → r) →
r`, to aplikacja `k p` - którą możemy zrobić, bo `k` nie mogłoby być poprawnym termem, gdyby `p` nie
było zdaniem - ma typ `(p → q → p) → p` (rezultat obliczenia zachodzącego w typie aplikacji `k p`), a
ponieważ zawsze możemy skonstruować term typu `p → q → p`, bo to jest tautologia, bo możemy taki
dowód skonstruować po prostu jako funkcję `fun (hp : p) => fun (hq : q) => hp`, to aplikując funkcję
`k p` do tego dowodu możemy skonstruować dowód `p`. Wyjaśnienie dla funkcji `right` jest podobne.

Pozostaje nam jeszcze funkcja `intro` dla koniunkcji, która jest implementacją reguły wprowadzenia
dla koniunkcji:

```lean
def intro (p q : Prop) (hp : p) (hq : q) : and p q :=
    fun (r : Prop) => fun (h : p → q → r) => h hp hq
```

Jak łatwo sprawdzić, funkcja `intro` z dowodów `hp` i `hq` zdań `p` i `q` odpowiednio (i informacji,
że to są zdania) tworzy funkcję `fun (r : Prop) => fun (h : p → q → r) => h hp hq`, a więc term typu
`∀ r : Prop, (p → q → r) → r` , a więc, zgodnie z definicją stałej `and`, term typu `and p q`.

## Języki dziedzinowe

Podaję za [Wikipedią](https://pl.wikipedia.org/wiki/J%C4%99zyk_dziedzinowy) (2024-12-28):

> Język dziedzinowy, także język dedykowany, język specjalizowany, mini język[1]
> (ang. domain-specific language, DSL) – język programowania przystosowany do rozwiązywania
> określonej dziedziny problemów, określonej reprezentacji problemu lub określonej techniki ich
> rozwiązywania

Docelowo stworzymy pewien formalny język dziedzinowy, wraz z dobrze określonym, towarzyszącym mu
aparatem pojęciowym opisanym w języku naturalnym, który to język będzie przystosowany do w pełni
formalnego definiowania pojęć, stawiania pytań i rozwiązywania problemów dotyczących
*zachowania*. Teraz jednak zajmiemy się tylko negacją i koniunkcją. Sugeruję, żebyś potraktowała ten
fragment tak, jakbyś była turystką[^1] i zwiedzała nieznane Ci wcześniej miejsca, przyglądając się
dłużej temu na co tylko masz ochotę i nie starając się za wszelką cenę wszystkiego dobrze poznać,
zapamiętać albo zrozumieć.

Poniższy kod zawiera elementy, o których wcześniej nie pisałem i nie będę z nich prędko korzystał,
dlatego możesz potraktować to wszystko jako (mam nadzieję względnie sugestywną) ilustrację. Chcę Ci
w ten sposób pokazać, jak bardzo można zbliżyć zapis w Leanie do rozmaitych wyspecjalizowanych
języków, czyli właśnie języków dziedzinowych, takich jak standardarowy język formalny logiki (mówiąc
w uproszczeniu, bo nie ma jednego ogólnie przyjętego sposobu zapisu symboli logicznych). Gdyby miało
Cię to już teraz zainteresować, na wszelki wypadek wyjaśnię, co się tutaj dzieje.

Poniżej korzystam z tak zwanej *przestrzeni nazw* (`namespace`), którą nazwałem `Logika`, dzięki
czemu definiując stałe `Not`, `And`, `And.left`, `And.right` i `And.intro` nie generuję konfliktów z
tym, jak te symbole są zdefiniowane w Leanie. Przestrzeń nazw służy więc między innymi do unikania
konfliktów wynikających stąd, że jakieś stałe, które chcemy zdefiniować po swojemu, są już
zdefiniowane. Z kolei komenda `infixr` służy do wprowadzania konwencji zapisu infiksowego dla
operatorów binarnych które wiążą z prawej, takich jak dobrze Ci już znana strzałka, stąd na końcu w
nazwie litera *r* (od *right*).

Ponieważ w przestrzeni nazw `Logika` mówię Leanowi, że ma interpretować `∧` jako infiksową wersję
funkcji `And` i stosować wiązanie z prawej, to na przykład `p ∧ q ∧ r` oznacza w tej przestrzeni
nazw `p ∧ (q ∧ r)`, a to z kolei oznacza `And p (And q r)`. Liczba `35`, która pojawia się za
dwukropkiem obok komendy `infixr`, określa *stopień pierwszeństwa* operatora i służy do tego, żeby
Lean mógł rozstrzygnąć o kolejności wykonywania działań (a dokładnie aplikacji) gdy brak nawiasów
powoduje, że ta nie jest jednoznaczna. Na przykład, dla Ciebie *a + b \* c* znaczy *a + (b \* c)* a
nie *(a + b) \* c*, bo wiesz, że mnożenie ma wyższy priorytet niż dodawanie - nawet, jeżeli tak
sobie tego nie nazywasz - czyli, że mocniej wiąże. Ponieważ w Leanie korzystamy z wielu różnych
operatorów binarnych i unarnych (takich jak `¬`), priorytety muszą być zapisane liczbowo. W
przypadku negacji ta liczba jest zapisana jako `max`, co Lean interpretuje jako liczbę `1024`i co
znaczy, że symbol negacji wiąże najmocniej jak się da.

Pozwoliłem sobie tutaj również skorzystać z tak zwanych *parametrów opcjonalnych*, co widać między
innymi w definicji funkcji `And.intro`. W tej definicji zamiast zwykłych nawiasów, jak w `(p q :
Prop)`, pierwsze dwa parametry są otoczone nawiasami *klamrowymi* (`{p q : Prop}`). Ponieważ trzeci
argument funkcji `And.intro` *musi* być koniunkcją, a ta *musi* zawierać informacje na temat tego, z
jakich zdań jest zbudowana, Lean może na tej podstawie sam wywnioskować wartość dwóch pierwszych
parametrów. Dzięki temu, jeżeli w danym miejscu w kodzie `k : p ∧ q` (zauważyłaś, że użyłem tutaj
typowania w roli zdania?), wystarczy napisać `And.intro k` zamiast dłuższego i redundantnego (czyli
"niepotrzebnie przegadanego") `And.intro p q k`. Oznaczyłem też za pomocą symbolu `_` te parametry
λ-abstrakcji, które nie są nigdzie używane, w ten sposób usuwając ostrzeżenia na temat stylu.

```lean
-- Zapisując poniższe definicje w przestrzeni nazw którą nazwałem Logika nie generuję konfliktów z
-- istniejącymi w Leanie definicjami tych samych stałych.
namespace Logika

  -- W Leanie w zasadzie tą samą *rolę* odgrywa stała False, jednak *implementacja* tej roli jest
  -- inna, bo w Leanie nie trzeba wszystkiego budować ze strzałek i funkcji.
  def Absurd : Prop := (a : Prop) → a

  -- Negacja jest w Leanie również zdefiniowana trochę inaczej, a konkretnie jako p → False.
  def Not (p : Prop) : Prop := p → Absurd
  notation:max "¬" p:40 => Not p

  -- And to w Leanie typ par uporządkowanych zdań, a więc pewna *struktura* (o strukturach będę mówił
  -- później). Dlatego również stałe And.left, And.right i And.intro, chociaż dostarczają zasadniczo
  -- tą samą funkcjonalność, różnią się szczególami implementacji.
  def And (p q : Prop) : Prop := ∀ r : Prop, (p → q → r) → r
  infixr:35 " ∧ " => And

  def And.intro {p q : Prop} (hp : p) (hq : q) :=
      fun (r : Prop) => fun (h : p → q → r) => h hp hq

  def And.left {p q : Prop} (k : And p q) : p :=
    k p (fun (hp : p) => fun (_ : q) => hp)

  def And.right {p q : Prop} (k : And p q) : q :=
      k q (fun (_ : p) => fun (hq : q) => hq)

  variable (p q : Prop)
  -- Gdy kursor znajduje się nad komendą #check Lean sygnalizuje *błąd*, ponieważ za bardzo zbliżyłem się tutaj
  -- do tego, jak Lean obsługuje notację logiczną:
  --
  -- ambiguous, possible interpretations 
  --   p ∧ q : Prop
  --
  --   p ∧ q : Prop
  #check p ∧ q
  
end Logika
```

Widzimy więc po raz kolejny, że wszystko w matematyce możemy w pewnym sensie zrobić ze strzałek,
chociaż jak dotąd nie jest może jasne, czy warto się przy tym upierać. W następnym rozdziale
przekonamy się jednak, że taki czysto strzałkowy punkt widzenia ma pewne wyjątkowe zalety, ponieważ
pozwala mówić językami nie tylko ludzi, ale i
[*aniołów*](https://www.christianity.com/wiki/angels-and-demons/what-do-angels-look-like.html).

### Przypisy

[^1]: Pomysł, żeby w stosunku do treści o charakterze metematycznym albo ogólnie mówiąc technicznym
    zasugerować przyjęcie postawy turystki zaczerpnąłem z zachwycającej książki [*The Joy of
    Abstraction*](https://www.cambridge.org/core/books/joy-of-abstraction/00D9AFD3046A406CB85D1AFF5450E657),
    napisanej przez specjalizującą się w [teorii
    kategorii](https://pl.wikipedia.org/wiki/Teoria_kategorii) popularyzatorkę matematyki [Eugenię
    Cheng](https://eugeniacheng.com/).
