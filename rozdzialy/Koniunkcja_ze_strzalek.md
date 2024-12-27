## O czym teraz będzie

TODO

<hr>

# Koniunkcja ze strzałek

Jeżeli `p` i `q` to zdania, to `p ∧ q` jest również zdaniem, które odczytujemy jako `p` i
`q`. Symbol koniunkcji uzyskasz wpisując `\and`. Podobnie jak implikacja, koniunkcja jest więc
operatorem dwuargumentowym, który z dwóch dowolnych zdań tworzy pewne zdanie złożone (mówimy też
czasem formułę złożoną).

Implikacja jako typ funkcyjny albo po prostu strzałka jest w naszym języku pojęciem pierwotnym. Jak
pisałem w jednym z rozdziałów wprowadzających, (prawie) wszystko, czego będziemy potrzebować,
skonstruujemy właśnie ze strzałek. Dotyczy to również *definicji koniunkcji*. Zaczniemy jednak od
zapisanych w dosyć typowy sposób *reguł dedukcji* dla koniunkcji, to jest od reguły *wprowadzenia*
(czyli sposobu uzyskania w dowodach) i *dwóch* reguł *eliminacji* (czyli sposobu użycia albo
"zużycia" w dowodach). Reguła wprowadzenia jest mam nadzieję oczywista:

TODO

A oto reguły eliminacji, które też jak sądzę nie wymagają komentarza:

TODO

Jak powinna wyglądać taka definicja? Można powiedzieć, że jeżeli `p` i `q` to dowolne zdania, to
*sensem* zdania `p ∧ q` są wszystkie konsekwencje wynikające z *łącznej* prawdziwości zdań `p` i
`q`. Albo inaczej, jeżeli zdanie `p ∧ q` jest zdaniem prawdziwym (czyli ma dowód), to każde zdanie
`r`, które wynika z *łącznej* prawdziwości zdania `p` *i* prawdziwości zdania `q` też jest zdaniem
prawdziwym i odwrotnie, jeżeli każde zdanie `r`, które wynika stąd, że `p` jest zdaniem prawdziwym
*i jednocześnie* `q` jest zdaniem prawdziwym jest również zdaniem prawdziwym, to `p ∧ q` jest
zdaniem prawdziwym. Zapiszemy to korzystając ze znanego Ci już symbolu oznaczającego duży
kwantyfikator.

```lean
-- Każda koniunkcja (and p q, gdzie p : Prop i q : Prop) jest zdaniem (: Prop), którego dla każdego 
-- zdania (r : Prop) pozwala uzyskać dowód tego zdania (... → r) z dowodu, że to zdanie wynika z
-- łącznej prawdziwości zdań będących członami tej koniunkcji ((p → q → r)):
def and (p q : Prop) : Prop := ∀ r : Prop, (p → q → r) → r
```

Będzie chyba najlepiej, jeśli zapoznasz się z "mechaniką" działania tej definicji w praktyce. Nie
będę na razie stosował oficjalnego symbolu koniunkcji, to jest na razie będę pisał `and p q`, a nie
`p ∧ q`, żeby nie wprowadzać języka makr, który pozwala na takie zmiany w notacji.

```lean
--- Niech dowod_koniunkcji_ab będzie dowodem koniunkcji zdań a i b:
variable (a b : Prop)
variable (dowod_koniunkcji_ab : and a b)
```

Żeby się przekonać, że nasza definicja *działa* zgodnie z oczekiwaniami, zdefiniujemy najpierw dwie
funkcje, które każdy dowód koniunkcji przekształcają odpowiednio w dowód pierwszego i drugiego
członu tej koniunkcji. Nazwiemy je `fst`, bo to skrót od *first*, i `snd`, bo to skrót od
*second*. Pamiętaj tylko proszę, że jeżeli wyda Ci się to na razie zbyt skomplikowane, to nie masz
się czym przejmować, bo to, w jaki dokładnie sposób definiujemy koniunkcję *nie ma znaczenia*, ważne
jest tylko to, jak koniunkcja *działa*, to znaczy, jak możemy jej *używać* w dowodach, a to okaże
się niebawem bardzo proste.

```lean
def fst (p q : Prop) (k : and p q) : p :=
  k p (fun (hp : p) => fun (hq : q) => hp)

-- Oto jak działa funkcja fst (ilustracja). Zwracam uwagę, że musimy najpierw "powiedzieć" funkcji fst z 
-- jakich zdań składa się dana koniunkcja (tutaj ze zdań a i b):
fst a b dowod_koniunkcji_ab

-- Rozpakowujemy definicję stałej fst i od razu podstawiamy argumenty a, b i dowod_koniunkcji_aba za zmienne
-- p, q i k występujące w funkcji fst w roli parametrów:
(dowod_koniunkcji_ab a (fun (hp : a) => fun (hq : b) => hp))

-- Nie możemy rozpakować stałej dowod_koniunkcji_ab, bo tylko zadeklarowaliśmy, że to jest *jakiś* term
-- typu and a b, ale ponieważ to *jest* term takiego typu, to możemy ustalić, jakie obliczenia musiały
-- zajść w ramach całej ostatniej aplikacji na poziomie typu. Żeby to pokazać, poniżej zapisałem stałą
-- dowod_koniunkcji_ab w postaci typowanej, co zresztą zawsze można w Leanie zrobić:
(dowod_koniunkcji_ab : and a b) a (fun (hp : a) => fun (hq : b) => hp)

-- Rozpakowujemy stałą and od razu podstawiając argumenty a i b za zmienne p i q występujące w definicji
-- and w roli parametrów ...
(dowod_koniunkcji_ab : ∀ r : Prop, (a → b → r) → r) a (fun (hp : a) => fun (hq : b) => hp)

-- ... i przyglądamy się krok po kroku obliczeniom na poziomie typu. Napierw podstawienie a za r ...
(dowod_koniunkcji_ab a : (a → b → a) → a) (fun (hp : a) => fun (hq : b) => hp)

-- ... a ponieważ term (fun (hp : a) => fun (hq : b) => hp) ma typ a → b → a, to możemy podstawić cały ten term
-- za "początek" typu funkcyjnego (a → b → a) → a) i w ten sposób zobaczyć, że cały ten złożony term ma typ a ...
(dowod_koniunkcji_ab a (fun (hp : a) => fun (hq : b) => hp)) : a
-- ... czyli jest dowodem zdania a.
```

