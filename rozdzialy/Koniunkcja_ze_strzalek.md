## O czym teraz będzie

Czytając ten rozdział pamiętaj proszę, że jeżeli to, o czym będę tu mówił wyda Ci się na razie zbyt
skomplikowane, to nie masz się czym przejmować, bo to, w jaki dokładnie sposób *implementujemy*
koniunkcję *nie ma znaczenia*; ważne jest tylko to, jak koniunkcja *działa*. To znaczy, ostatecznie
liczy się tylko to, jak możemy *używać* koniunkcji w dowodach, co już jak sądzę całkiem dobrze
zrozumiałaś czytając poprzedni rozdział.

Wywiązuję się tutaj z obietnicy, że wszystko w matematyce można zrobić ze strzałek (albo funkcji) i
jednocześnie przybliżam pewien szczególny sposób myślenia o koniunkcji, który stanie się ważny w
rozdziale następnym.

<hr>

# ∧ 2

Jeżeli `p` i `q` to zdania, to `p ∧ q` jest również zdaniem, które odczytujemy jako `p` i
`q`. Symbol koniunkcji uzyskasz wpisując `\and`. Podobnie jak implikacja, koniunkcja jest więc
operatorem dwuargumentowym, który z dwóch dowolnych zdań tworzy pewne zdanie złożone (mówimy też
czasem, że tworzy pewną złożoną formułę logiczną).

Implikacja jako typ funkcyjny albo po prostu strzałka jest w naszym języku pojęciem pierwotnym. Jak
pisałem w jednym z rozdziałów wprowadzających, (prawie) wszystko, czego będziemy potrzebować,
skonstruujemy właśnie ze strzałek, a w tym wypadku strzałek jako funkcji. Dotyczy to również
*definicji koniunkcji*. Zaczniemy jednak od zapisanych w dosyć typowy sposób *reguł dedukcji* dla
koniunkcji, to jest od reguły *wprowadzenia* (czyli sposobu uzyskania w dowodach) i *dwóch* reguł
*eliminacji* koniunkcji (czyli sposobu użycia albo "zużycia" koniunkcji w dowodach). Reguła
wprowadzenia jest mam nadzieję oczywista.

Jeżeli *A* i *B* to zdania, to:

<ins><em>A, B</em></ins>  
*A ∧ B*

Odczytujemy tą regułę tak: Jeżeli w trakcie wyprowadzania dowodu akceptujemy zdanie *A* i zdanie *B*
(dla nas to znaczy: jeżeli mamy dowody tych dwóch zdań), to akceptujemy zdanie *A ∧ B* (to możemy
uzyskać dowód zdania *A ∧ B*).

A oto dwie reguły eliminacji, które jak sądzę nie wymagają komentarza.

Jeżeli *A* i *B* to zdania, to:

<ins><em>A ∧ B</em></ins>  
*A*

<ins><em>A ∧ B</em></ins>  
*B*

Jak mogłaby wyglądać definicja koniunkcji w logice konstruktywnej skonstruowana tylko za pomocą
strzałek i funkcji? Można powiedzieć, że jeżeli `p` i `q` to dowolne zdania, to *sensem* zdania `p ∧
q` są *dokładnie te zdania, które wynikają z łącznej prawdziwości zdań `p` i `q`*.

Albo inaczej: koniunkcja zdań `p` i `q` to takie zdanie, a więc taki typ, że dowód tego zdania, a
więc term tego typu, dostarcza dowód dokładnie takich zdań, które wynikają ze zdania `p` i ze zdania
`q`.

Albo inaczej: Jeżeli zdanie `p ∧ q` jest zdaniem prawdziwym (czyli ma dowód), to *każde* zdanie `r`,
które wynika z *łącznej* prawdziwości zdania `p` *i* prawdziwości zdania `q` też jest zdaniem
prawdziwym i odwrotnie, jeżeli *każde* zdanie `r`, które wynika stąd, że `p` jest zdaniem prawdziwym
*i jednocześnie* `q` jest zdaniem prawdziwym jest również zdaniem prawdziwym, to `p ∧ q` jest
zdaniem prawdziwym.

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

I tak oto znaleźliśm "strzałkową" definicję koniunkcji. Jeszcze trochę inaczej, zapisując już
oficjalną definicję koniunkcji jako zdania / typu:

```lean
-- Każda koniunkcja (and p q, gdzie p : Prop i q : Prop) jest zdaniem (: Prop), którego dowód (a więc funkcja) 
-- dla każdego zdania (r : Prop) pozwala uzyskać dowód tego zdania (... → r) z dowodu, że to zdanie wynika z
-- łącznej prawdziwości zdań będących członami tej koniunkcji ((p → q → r)):
def and (p q : Prop) : Prop := ∀ r : Prop, (p → q → r) → r
```

Będzie chyba najlepiej, jeśli zapoznasz się z "mechaniką" działania tej definicji w praktyce. Nie
będę w tym rozdziale stosował oficjalnego symbolu koniunkcji, to jest będę pisał `and p q` zamiast
`p ∧ q`, żeby nie wprowadzać języka makr, który pozwala na takie zmiany w notacji.

```lean
--- Niech dowod_koniunkcji_ab będzie dowodem koniunkcji zdań a i b:
variable (a b : Prop)
variable (dowod_koniunkcji_ab : and a b)
```

Żeby się przekonać, że nasza definicja *działa* zgodnie z oczekiwaniami, zdefiniujemy najpierw dwie
funkcje, które każdy dowód koniunkcji przekształcają odpowiednio w dowód pierwszego i drugiego
członu tej koniunkcji, czyli implementują obie reguły eliminacji dla koniunkcji. Trzymając się
konwencji, która obowiązuje w Leanie, nazwiemy je `left` i `right`.

```lean
def left (p q : Prop) (k : and p q) : p :=
  k p (fun (hp : p) => fun (hq : q) => hp)

-- Oto jak działa funkcja left. Ponieważ dowod_koniunkcji_ab ma typ ...
and a b

-- ... to ma też typ (rozpakowujemy stałą and) ...
(fun (p : Prop) => fun (q : Prop) => ∀ r : Prop, (p → q → r) → r) a b

-- odczepiamy ciało i podstawiamy a:
(fun (q : Prop) => ∀ r : Prop, (a → q → r) → r) b

-- odczepiamy ciało i podstawiamy b:
∀ r : Prop, (a → b → r) → r

-- A więc:
dowod_koniunkcji_ab : ∀ r : Prop, (a → b → r) → r
```

Zwracam uwagę, że nie po raz pierwszy spotykamy się tutaj z typem zapisanym w postaci aplikacji
(tutaj `and a b`). Typami (zdaniowymi) są przecież również wszelkie aplikacje predykatów (do termów
odpowiedniego typu). Również nie po raz pierwszy mamy do czynienia z typem zapisanym jako aplikacja,
*którą można zredukować* (albo ewaluować), bo przecież w podobny sposób używaliśmy pełniącej rolę
cukierniczą (albo "lukracyjną") funkcji `Predykat`, aplikując ją do odpowiednich termów i dzięki
temu uzyskując odpowiednie typy (a konkretnie zdania o strukturze orzeczenie-podmiot) jako rezultaty
tych aplikacji. Kontynuując:

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

-- ... a ponieważ (obliczenie na poziomie typu dowod_koniunkcji_ab) ...
dowod_koniunkcji_ab a : (a → b → a) → a

-- ... i ...
(fun (hp : a) => fun (hq : b) => hp) : (a → b → a)

-- ... to ten term ma typ a, czyli jest dowodem a:
dowod_koniunkcji_ab a (fun (hp : a) => fun (hq : b) => hp) : a
```

Naprawdę nie wiem, czy pomogłem. Funkcja `right` działa podobnie:

```lean
def right (p q : Prop) (k : p ∧ q) : q :=
    k q (fun (hp : p) => fun (hq : q) => hq)
```

To może jeszcze tak: Gdy mamy dowód `k` zdania `p ∧ q`, czyli typu `∀ r : Prop, (p → q → r) → r`, to
aplikacja `k p` - którą możemy zrobić, bo `k` by nie mogło istnieć, gdyby `p` nie było zdaniem - ma
typ `(p → q → p) → p` (obliczenie zachodzące w typie `k p`), a ponieważ zawsze możemy skonstruować
term typu `p → q → p`, bo to jest tautologia, bo możemy taki dowód skonstruować jako funkcję `fun
(hp : p) => fun (hq : q) => hp`, to aplikując funkcję `k p` do tego dowodu możemy skonstruować dowód
`p`. Wyjaśnienie dla funkcji `right` jest podobne.

Pozostaje nam jeszcze funkcja `intro` dla koniunkcji, która jest implementacją reguły wprowadzenia
dla koniunkcji:

```lean
def intro (p q : Prop) (hp : p) (hq : q) : and p q :=
    fun (r : Prop) => fun (h : p → q → r) => h hp hq
```

Jak łatwo sprawdzić, funkcja `intro` z dowodów `hp` i `hq` zdań `p` i `q` odpowiednio (i informacji,
że to są zdania) tworzy funkcję `fun (r : Prop) => fun (h : p → q → r) => h hp hq`, a więc term typu
`∀ r : Prop, (p → q → r) → r` , a więc, zgodnie z definicją stałej `and`, term typu `and p q`.

Widzimy więc, że da się to wszystko "zrobić ze strzałek", ale jak dotąd nie jest jasne, czy warto
się przy tym upierać. W następnym rozdziale przekonamy się jednak, że taki "czysto-strzałkowy" punkt
widzenia ma pewne szczególne zalety, ponieważ pozwala mówić językami nie tylko ludzi, ale i
*aniołów*.
